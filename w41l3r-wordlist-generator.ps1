param (
    [string]$prefix
)

# Define the commands with placeholders
$commands = @(
    ".\hashcat.exe --stdout -a 3 {0}?d?d -o wordlist.txt",
	".\hashcat.exe --stdout -a 3 {0}?d?d?d -o wordlist.txt",
    ".\hashcat.exe --stdout -a 3 {0}?s?d?d -o wordlist.txt",
	".\hashcat.exe --stdout -a 3 {0}?s?d?d?d -o wordlist.txt",
    ".\hashcat.exe --stdout -a 3 {0}?s?d?d?d?d -o wordlist.txt",
	".\hashcat.exe --stdout -a 3 {0}?s?d?d?d?d?s -o wordlist.txt",
	".\hashcat.exe --stdout -a 3 {0}?d?d?d?s -o wordlist.txt",
	".\hashcat.exe --stdout -a 3 {0}?d?d?d?d?s -o wordlist.txt"
)

# Replace the placeholder with the provided argument and execute the commands
foreach ($command in $commands) {
    $formattedCommand = $command -f $prefix
    Write-Host "Executing: $formattedCommand"
    Invoke-Expression $formattedCommand
}
