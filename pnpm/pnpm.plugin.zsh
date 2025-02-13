if (( ! $+commands[pnpm] )); then
  return
fi

if [[ -z "$ZSH_CACHE_DIR" ]]; then
  mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_pnpm" ]]; then
  typeset -g -A _comps
  autoload -Uz _pnpm
  _comps[pnpm]=_pnpm
fi

pnpm completion zsh >| "$ZSH_CACHE_DIR/completions/_pnpm" &|
