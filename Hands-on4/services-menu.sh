#!/bin/bash

# Función para mostrar el menú
function mostrar_menu() {
    echo "╔══════════════════════════════════════════════╗"
    echo "║                Menú de Opciones              ║"
    echo "╠══════════════════════════════════════════════╣"
    echo "║ 1. 📁 Listar el contenido de una carpeta     ║"
    echo "║ 2. 📝 Crear un archivo de texto              ║"
    echo "║ 3. 🔍 Comparar dos archivos de texto         ║"
    echo "║ 4. 🛠️  Usar comando AWK                       ║"
    echo "║ 5. 🔎 Usar comando GREP                      ║"
    echo "║ 6. ❌ Salir                                  ║"
    echo "╚══════════════════════════════════════════════╝"
    echo -n "Elige una opción (1-6): "
}

# Opción 1: Listar el contenido de una carpeta
function listar_contenido() {
    echo -n "📂 Introduce la ruta absoluta de la carpeta: "
    read ruta
    if [ -d "$ruta" ]; then
        echo "📁 El contenido de la carpeta es:"
        ls -l "$ruta"
    else
        echo "❌ Error: No es una carpeta válida o no tienes permisos."
    fi
}

# Opción 2: Crear un archivo de texto con una línea de texto
function crear_archivo() {
    echo -n "📝 Introduce el nombre del archivo (con ruta completa si no es en el directorio actual): "
    read archivo
    echo -n "🖋️  Introduce el texto a almacenar: "
    read texto
    echo "$texto" > "$archivo"
    if [ $? -eq 0 ]; then
        echo "✅ Archivo creado y texto almacenado en $archivo."
    else
        echo "❌ Error al crear el archivo."
    fi
}

# Opción 3: Comparar dos archivos de texto
function comparar_archivos() {
    echo -n "📄 Introduce la ruta del primer archivo: "
    read archivo1
    echo -n "📄 Introduce la ruta del segundo archivo: "
    read archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
        if [ $? -eq 0 ]; then
            echo "✅ Los archivos son iguales."
        else
            echo "❌ Los archivos son diferentes."
        fi
    else
        echo "❌ Error: Uno o ambos archivos no son válidos."
    fi
}

# Opción 4: Uso de AWK
function usar_awk() {
    echo -n "🛠️  Introduce la ruta del archivo donde se aplicará AWK: "
    read archivo
    if [ -f "$archivo" ]; then
        echo "🛠️  Introduce el patrón o columna que quieres mostrar con AWK (ejemplo: '{print \$1}'): "
        read patron
        awk "$patron" "$archivo"
    else
        echo "❌ Error: El archivo no existe."
    fi
}

# Opción 5: Uso de GREP
function usar_grep() {
    echo -n "🔍 Introduce la cadena de texto a buscar con GREP: "
    read cadena
    echo -n "📄 Introduce la ruta del archivo donde buscar: "
    read archivo
    if [ -f "$archivo" ]; then
        grep "$cadena" "$archivo"
        if [ $? -ne 0 ]; then
            echo "❌ No se encontraron coincidencias."
        fi
    else
        echo "❌ Error: El archivo no existe."
    fi
}

# Mostrar saludo inicial con arte ASCII
function mostrar_titulo() {
    echo "**************************************************"
    echo "*     Script by: Yair Hernández Ochoa            *"
    echo "**************************************************"
}

# Mostrar el título
mostrar_titulo

# Bucle del menú
while true; do
    mostrar_menu
    read opcion
    case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) usar_awk ;;
        5) usar_grep ;;
        6) echo "👋 Saliendo del programa."; exit 0 ;;
        *) echo "❌ Opción no válida. Inténtalo de nuevo." ;;
    esac
    echo ""
done
