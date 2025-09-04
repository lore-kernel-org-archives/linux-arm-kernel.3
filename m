Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF0DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8+gz2PreZHA099V6kCx3/l3K1+zWhPuvrx0bZI71XI=; b=Y2jFgSJdX7fX2rrHlAJUMtv1TX
	ESku86J7SY4VkUd7pY/6SaWY/iL0Pro8L274bblgqLakcnqi9T1K+XdvCHwH1NlJgOvGHWdk0X3jG
	AnVqvVCNMqnitHccGIqI9WgXnwmApeRvTqWLcXtlfgx0mUl1zYKiPQ1dSl5VpJARirUt5bdYHCTr7
	s/dUQ9AhYD6N5kQteki43YeZ+AgLFyrsoFq8ETK2ehe8ZqF8mtsETNeY6hrf251EFLL5v7U6kKJOY
	w4ip1cEdDXdhjnRffZbW5+Is5wGZ/GUcM83naYzJWP7jUstq1yk6/s/atsDfUiDjrJ17qiI6Puz5e
	mJLlOX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGIy-0000000EArN-0rIq;
	Thu, 04 Sep 2025 20:11:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDim-0000000DFW5-3Wzw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 17:26:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 606A31596;
	Thu,  4 Sep 2025 10:25:53 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 694A33F6A8;
	Thu,  4 Sep 2025 10:25:59 -0700 (PDT)
Date: Thu, 4 Sep 2025 18:25:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: panfan <panfan@qti.qualcomm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rostedt@goodmis.org,
	mhiramat@kernel.org, samitolvanen@google.com, song@kernel.org,
	ardb@kernel.org, dylanbhatch@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kdong@qti.qualcomm.com
Subject: Re: [PATCH v1] arm64: ftrace: fix unreachable PLT for ftrace_caller
 in init_module with CONFIG_DYNAMIC_FTRACE
Message-ID: <aLnLpArhiT-mQxn9@J2N7QTR9R3>
References: <20250819063418.1263119-1-panfan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819063418.1263119-1-panfan@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_102604_972383_E6C5A71D 
X-CRM114-Status: GOOD (  33.19  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Aug 18, 2025 at 11:34:18PM -0700, panfan wrote:
> with the previous patch [PATCH v3 6/6] arm64: module: rework module VA
> range selection, the module region can use a full 2GB for large modules.
>
> On arm64 with CONFIG_DYNAMIC_FTRACE, due to the ±128 MB range limit of
> the `BL` instruction, ftrace uses a PLT entry to branch indirectly to
> ftrace_caller when modules may be placed far away.
>
> Currently, this PLT(.text.ftrace_trampoline) resides in MOD_TEXT,
> so call sites in .init.text cannot reach it by `BL` if .init.text
> and .text are allocated in different 128 MB regions.

Ouch; sorry about this. Given the failure mode below, this is a pretty
horrid bug.

> For example, init_moudle in tz_log_dlkm.ko can not reach PLT or
> ftrace_caller by `BL`:
> 
> module_direct_base = 0xFFFFFFC07B270000   128M
> module_plt_base = 0xFFFFFFC003270000  2G
> 
> mod = 0xFFFFFFC07FF65880 -> (
>     state = MODULE_STATE_COMING,
>     name = "tz_log_dlkm",
>     init = 0xFFFFFFC00370F01C,
> 
>     mem = (
>       (base = 0xFFFFFFC07E7E8000, size = 12288,  // MOD_TEXT -- direct
>       (base = 0xFFFFFFC07FF65000, size = 12288,  // MOD_DATA
>       (base = 0xFFFFFFC07FFFB000, size = 12288,  // MOD_RODATA
>       (base = 0xFFFFFFC07DDA9000, size = 4096,   // MOD_RO_AFTER_INIT
>       (base = 0xFFFFFFC00370F000, size = 4096,   // MOD_INIT_TEXT -- plt
>       (base = 0xFFFFFFC003711000, size = 12288,  // MOD_INIT_DATA
> 
>     arch = (
>       core = (plt_shndx = 8, plt_num_entries = 0, plt_max_entries = 35),
>       init = (plt_shndx = 9, plt_num_entries = 1, plt_max_entries = 1),
>       ftrace_trampolines = 0xFFFFFFC07E7EA730 -> (   //
> .text.ftrace_trampoline in MOD_TEXT
> 
> PLT in .text.ftrace_trampoline:
> 0xFFFFFFC07E7EA730            adrp    x16,0xFFFFFFC080014000
> 0xFFFFFFC07E7EA734            add     x16,x16,#0xF64   ; x16,x16,#3940
> 0xFFFFFFC07E7EA738            br      x16; ftrace_caller
> 
> Here, init_module() in MOD_INIT_TEXT cannot branch to the PLT in MOD_TEXT
> because the offset exceeds 128 MB. As a result,
> ftrace fails to update `nop` to `BL` and inserts `brk #0x100` instead:
> 
> 0xFFFFFFC00370F01C  init_module:    mov     x9,x30
> 0xFFFFFFC00370F020                  brk     #0x100           ; #256
> 
> [   36.290790][  T835] label_imm_common: offset out of range
> 
> [   36.333765][  T835] Kernel text patching generated an invalid instruct
> ion at init_module+0x4/0xfe4 [tz_log_dlkm]!
> 
> [   36.335728][  T835] Call trace:
> [   36.335735][  T835]  init_module+0x4/0xfe4 [tz_log_dlkm]
> [   36.335750][  T835]  do_init_module+0x60/0x2cc
> [   36.335761][  T835]  load_module+0x10e0/0x12ac
> [   36.335771][  T835]  __arm64_sys_finit_module+0x240/0x348
> [   36.335780][  T835]  invoke_syscall+0x60/0x11c
> [   36.335791][  T835]  el0_svc_common+0xb4/0xf0
> [   36.335801][  T835]  do_el0_svc+0x24/0x30
> [   36.335810][  T835]  el0_svc+0x3c/0x74
> [   36.335821][  T835]  el0t_64_sync_handler+0x68/0xbc
> [   36.335831][  T835]  el0t_64_sync+0x1a8/0x1ac
>
> To fix this, introduce an additional `.init.text.ftrace_trampoline`
> section for .init.text. This provides a PLT within MOD_INIT_TEXT, ensuring
> that init functions can branch within range using `BL`. This section
> is freed after do_one_initcall, so there is no persistent cost.
> The core text continues to use the existing PLT in MOD_TEXT.
> 
> Signed-off-by: panfan <panfan@qti.qualcomm.com>

Aside from one nit below, I think this is the right fix, though I think
it would be good to simplify/clarify the commit message.

How about:

| On arm64, it has been possible for a module's sections to be placed more
| than 128M away from each other since commit:
| 
|   3e35d303ab7d ("arm64: module: rework module VA range selection")
| 
| Due to this, an ftrace callsite in a module's .init.text section can be
| out of branch range for the module's ftrace PLT entry (in the module's
| .text section). Any attempt to enable tracing of that callsite will
| result in a BRK being patched into the callsite, resulting in a fatal
| exception when the callsite is later executed.
| 
| Fix this by adding an additional trampoline for .init.text, which will
| be within range.
| 
| No additional trampolines are necessary due to to the way a given
| module's executable sections are packed together. Any executable
| section beginning with ".init" or ".exit" will be placed in
| MOD_INIT_TEXT, and any other executable section will be placed in
| MOD_TEXT.
| 
| Fixes: 3e35d303ab7d ("arm64: module: rework module VA range selection")

[...]

> -static struct plt_entry *get_ftrace_plt(struct module *mod)
> +static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned long addr)
>  {
>  #ifdef CONFIG_MODULES
> -	struct plt_entry *plt = mod->arch.ftrace_trampolines;
> +	struct plt_entry *plt = NULL;
> +
> +	if (within_module_mem_type(addr, mod, MOD_INIT_TEXT))
> +		plt = mod->arch.init_ftrace_trampolines;
> +	else
> +		plt = mod->arch.ftrace_trampolines;
>  
>  	return &plt[FTRACE_PLT_IDX];

It would be good if we could explicitly verify that the region is either
MOD_TEXT or MOD_INIT_TEXT, and if not, return NULL, e.g.


	if (within_module_mem_type(addr, mod, MOD_INIT_TEXT))
		plt = mod->arch.init_ftrace_trampolines;
	else if (within_module_mem_type(addr, mod, MOD_TEXT))
		plt = mod->arch.ftrace_trampolines;
	else
		return NULL;

That last case should never happen, but if it does it'll cause
ftrace_find_callable_addr() to log a warning and return false, such that
its callers can return an error.

Other than that, I think this is fine. With those changes:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

>  #else
> @@ -332,7 +337,7 @@ static bool ftrace_find_callable_addr(struct dyn_ftrace *rec,
>  	if (WARN_ON(!mod))
>  		return false;
>  
> -	plt = get_ftrace_plt(mod);
> +	plt = get_ftrace_plt(mod, pc);
>  	if (!plt) {
>  		pr_err("ftrace: no module PLT for %ps\n", (void *)*addr);
>  		return false;
> diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
> index bde32979c06a..7afd370da9f4 100644
> --- a/arch/arm64/kernel/module-plts.c
> +++ b/arch/arm64/kernel/module-plts.c
> @@ -283,7 +283,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  	unsigned long core_plts = 0;
>  	unsigned long init_plts = 0;
>  	Elf64_Sym *syms = NULL;
> -	Elf_Shdr *pltsec, *tramp = NULL;
> +	Elf_Shdr *pltsec, *tramp = NULL, *init_tramp = NULL;
>  	int i;
>  
>  	/*
> @@ -298,6 +298,9 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  		else if (!strcmp(secstrings + sechdrs[i].sh_name,
>  				 ".text.ftrace_trampoline"))
>  			tramp = sechdrs + i;
> +		else if (!strcmp(secstrings + sechdrs[i].sh_name,
> +				 ".init.text.ftrace_trampoline"))
> +			init_tramp = sechdrs + i;
>  		else if (sechdrs[i].sh_type == SHT_SYMTAB)
>  			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
>  	}
> @@ -363,5 +366,12 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  		tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
>  	}
>  
> +	if (init_tramp) {
> +		init_tramp->sh_type = SHT_NOBITS;
> +		init_tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
> +		init_tramp->sh_addralign = __alignof__(struct plt_entry);
> +		init_tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
> +	}
> +
>  	return 0;
>  }
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 40148d2725ce..d6d443c4a01a 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -466,6 +466,17 @@ static int module_init_ftrace_plt(const Elf_Ehdr *hdr,
>  	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
>  
>  	mod->arch.ftrace_trampolines = plts;
> +
> +	s = find_section(hdr, sechdrs, ".init.text.ftrace_trampoline");
> +	if (!s)
> +		return -ENOEXEC;
> +
> +	plts = (void *)s->sh_addr;
> +
> +	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
> +
> +	mod->arch.init_ftrace_trampolines = plts;
> +
>  #endif
>  	return 0;
>  }
> -- 
> 2.34.1
> 

