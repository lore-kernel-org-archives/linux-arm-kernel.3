Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD369CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0QW7YwfCCedwCbC5bivdpOwWZPtSzCQDCT7zqxHUto=; b=KtdSktRqajD7yezMTC2ujLsyOp
	RRUmUbsjhK6qE9m8pLrzBY0Wn9aRSgG5Bg//ndez0lrilI+7FVE+7QO+QshFEknWas3Ww3XHMA0Bg
	qhv0MKFLCMZKCWBlE3tnxRfc3Wh99c/O/Hjo7UDlOUUO6fV38p5z4Udgxz3HVfAAwb5cg5t0rIYzQ
	Qoppb6wCMGVBt5mod6zyzN/OfK2+brM/OwkOrSjt2WBK6965s1F7G1zxSH/kdLNkCV25t9hC2V6cp
	np0vusYIO0X44G7m3PaDPY4trFKEtDSx1jLhELjJkPz2KHj96fQOWALyWx9GXn7fuSbndFzZLVYEO
	bzJEOmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgVd-0000000GIZO-2Fb0;
	Mon, 05 Oct 2026 11:05:29 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgVS-0000000GITV-03IJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:05:27 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a171b68e5aso5871875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198315; x=1791803115; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0QW7YwfCCedwCbC5bivdpOwWZPtSzCQDCT7zqxHUto=;
        b=QmjLI2swz3r60fpEjKzeZUXnSzfaa9TJiu1U7rlnGluX5yCKPHwUTt7lUcG0xoWFCk
         3LyQi76PJyXWAy71duidVbLoWjRw7RHF2N+CxiiIlBgLEBVyCduhtcSXQxJKumeJI2Db
         DLM0TEx5c/7yUKSAAZkyno+x8DISjAnzdb48dI6mr2tU+B26vHyCbRYhEIskUHWHxOG1
         n+UmY9mZe2wZXngdXLcn/VQPvepD6kszbhdIdjP1VRV/mX2vXw/cfzwvMUJpByvffPqW
         H3gZ7WliUIHzqeOSDkqKhToFm+OZMM30huyHbzlHYHPUeNpGEVYjFiRZpS9vQNdI4zCy
         bODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198315; x=1791803115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0QW7YwfCCedwCbC5bivdpOwWZPtSzCQDCT7zqxHUto=;
        b=2QvJYmy4oxbyAjZQkH1dZf0NWDYH446cp9mb8hDqj0NwJTG3TOi2zeo3nyJYHmAgqd
         nJcXMId0i9/IToTdOuudy9otBhWmJWIsthLt8DFYB2K+J5XHUXbGTJAwKuLkJJRc5eSd
         sj5VULx0CJpZTvA+Ov2EBXFbwpYUzGKDKH8pmgY3zXF7waFd5j5Oic2pSDBkbL4W1gnV
         OVQxpiXFk5uEpakCKaJyBf5TnRcfi292mS5XlIgHAe3r2FZU9SObF22FdGk1PdOKAbDW
         Sx2GYLQebapsGjBLkYysfjSGwkvBG9r9qQrQBuRtEr9qNsUQz839flqjF0/O0gi/3l4Q
         0N6Q==
X-Gm-Message-State: AFuF++ncI5oTosUtKh0+K1p9Uxz93wY8GSSfOIRrOvCfZcoyAORYx6Hm
	BPHsu+XjljWndnjGtU2PtwW/4HKxm4GHOmrCE4KETGMcDcPUWPVApZVuOA16Wo/xSksyJ8h3xsW
	qSMcbTWHTI4rdFPLCbWJ4EQGc5zwVNFkb7DpSjuBB8vZQ5QeJKEylv2ZZfjok23WgF6kIi1B4Bw
	ccILVRzDXgyJac/A67Tc0S3DXTX+Ynti+sYUbbMuwlt5wy
X-Received: from wruv9.prod.google.com ([2002:a5d:6789:0:b0:48b:1179:ca12])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1907:b0:4a0:3b9:f16b
 with SMTP id 5b1f17b1804b1-4a027459456mr185621445e9.0.1791198315051; Mon, 05
 Oct 2026 04:05:15 -0700 (PDT)
Date: Mon,  5 Oct 2026 13:05:13 +0200
In-Reply-To: <20261005110511.157016-4-ardb+git@google.com>
Mime-Version: 1.0
References: <20261005110511.157016-4-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005110511.157016-5-ardb+git@google.com>
Subject: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section calls
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040518_115285_9DCE5D76 
X-CRM114-Status: GOOD (  31.40  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The compiler is permitted to omit BTI landing pads from static functions
that never have their address taken, but are only called directly, even
if those calls originate from other code sections.

This means that calls into a module's .text section from .init.text,
which may need to be routed via a PLT if .text is out of direct
branching range, may result in BTI exceptions due to the indirect calls
performed by the PLT veneers. (Note that calls to .init.text from .text
are not allowed.)

The 'solution' is to emit yet another veneer - this is what the ELF
psABI for AArch64 mandates in this case.

So derive an upper bound for the number of veneers that may be needed in
the core module region to ensure that any call from init code that ends
up needing a PLT can be directed at a veneer with a BTI landing pad, and
allocate the additional space.

Then, emit these veneers as needed, i.e., only when emitting a PLT entry
for a call from an init code section to a normal code section in the
same module. In practice, this only occurs when a module's .init.text
happens to be allocated far away from its .text section, which might
happen when the initial 128M 'near' module region runs out of space
between allocating the core module and allocating its init region.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig                  |   7 +-
 arch/arm64/include/asm/module.h     |  12 ++
 arch/arm64/include/asm/module.lds.h |   3 +
 arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
 4 files changed, 140 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..23879cb05d6b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -210,7 +210,8 @@ config ARM64
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
-	select HAVE_LIVEPATCH
+	# https://lore.kernel.org/all/20260812162058.612202-5-ardb@kernel.org/
+	select HAVE_LIVEPATCH if !ARM64_BTI_KERNEL
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PERF_EVENTS
@@ -2198,10 +2199,6 @@ config ARM64_BTI_KERNEL
 	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
 	depends on !CC_IS_GCC || GCC_VERSION >= 100100
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
-	# https://github.com/llvm/llvm-project/issues/215547
-	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
 	help
 	  Build the kernel with Branch Target Identification annotations
diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..0bdac3db5719 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -16,6 +16,7 @@ struct mod_plt_sec {
 struct mod_arch_specific {
 	struct mod_plt_sec	core;
 	struct mod_plt_sec	init;
+	struct mod_plt_sec	bti;
 
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
@@ -43,6 +44,17 @@ struct plt_entry {
 	__le32	br;	/* br	x16				*/
 };
 
+struct bti_veneer {
+	/*
+	 * Functions with static linkage may lack BTI landing pads if their
+	 * address is never taken. E.g., a direct call from .init.text to a
+	 * static function in .text may need an additional veneer at the target
+	 * end if it is routed via a PLT entry.
+	 */
+	__le32	bti_c;
+	__le32	b;
+};
+
 static inline bool is_forbidden_offset_for_adrp(void *place)
 {
 	return cpus_have_final_cap(ARM64_WORKAROUND_843419) &&
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 603f92a8a73e..52bd10766803 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -1,6 +1,9 @@
 SECTIONS {
 	.plt 0 : { BYTE(0) }
 	.init.plt 0 : { BYTE(0) }
+#ifdef CONFIG_ARM64_BTI_KERNEL
+	.text.bti_veneer 0 : { BYTE(0) }
+#endif
 	.text.ftrace_trampoline 0 : { BYTE(0) }
 	.init.text.ftrace_trampoline 0 : { BYTE(0) }
 
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index 7afd370da9f4..e2c009cce96c 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -66,12 +66,48 @@ static bool plt_entries_equal(const struct plt_entry *a,
 	       (q + aarch64_insn_adrp_get_offset(le32_to_cpu(b->adrp)));
 }
 
+static u64 module_emit_bti_veneer(struct module *mod, const Elf64_Shdr *sechdrs,
+				  u64 target)
+{
+	struct mod_plt_sec *pltsec = &mod->arch.bti;
+	struct bti_veneer *btiv = (void *)sechdrs[pltsec->plt_shndx].sh_addr;
+
+	/* Look for an existing entry pointing to 'target' */
+	for (int i = 0; i < pltsec->plt_num_entries; i++) {
+		u64 dst = (u64)&btiv[i].b +
+			  aarch64_get_branch_offset(btiv[i].b);
+		if (dst == target)
+			return (u64)&btiv[i];
+	}
+
+	/* Allocate a new veneer */
+	if (WARN_ON(pltsec->plt_num_entries >= pltsec->plt_max_entries))
+		return 0;
+
+	btiv += pltsec->plt_num_entries++;
+
+	btiv->bti_c	= aarch64_insn_gen_hint(AARCH64_INSN_HINT_BTIC);
+	btiv->b		= aarch64_insn_gen_branch_imm((u64)&btiv->b, target,
+						      AARCH64_INSN_BRANCH_NOLINK);
+
+	return (u64)btiv;
+}
+
+static bool target_needs_bti_veneer(struct module *mod, const Elf64_Sym *sym)
+{
+	if (sym->st_shndx == STN_UNDEF ||
+	    ELF64_ST_BIND(sym->st_info) != STB_LOCAL)
+		return false;
+
+	return !within_module_init((unsigned long)sym->st_value, mod);
+}
+
 u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 			  void *loc, const Elf64_Rela *rela,
 			  Elf64_Sym *sym)
 {
-	struct mod_plt_sec *pltsec = !within_module_init((unsigned long)loc, mod) ?
-						&mod->arch.core : &mod->arch.init;
+	bool is_init = within_module_init((unsigned long)loc, mod);
+	struct mod_plt_sec *pltsec = !is_init ? &mod->arch.core : &mod->arch.init;
 	struct plt_entry *plt = (struct plt_entry *)sechdrs[pltsec->plt_shndx].sh_addr;
 	int i = pltsec->plt_num_entries;
 	int j = i - 1;
@@ -80,6 +116,16 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 	if (is_forbidden_offset_for_adrp(&plt[i].adrp))
 		i++;
 
+	if (system_supports_bti_kernel() && is_init) {
+		/*
+		 * Check if the target is a function with static linkage within
+		 * the same module but in a non-init section: if so, point the
+		 * PLT entry at a BTI veneer instead.
+		 */
+		if (target_needs_bti_veneer(mod, sym))
+			val = module_emit_bti_veneer(mod, sechdrs, val);
+	}
+
 	plt[i] = get_plt_entry(val, &plt[i]);
 
 	/*
@@ -277,11 +323,66 @@ static int partition_branch_plt_relas(Elf64_Sym *syms, Elf64_Rela *rela,
 	return i;
 }
 
+static int count_bti_veneers(const Elf_Ehdr *ehdr, const Elf_Shdr *sechdrs,
+			     const char *secstrings, const Elf64_Sym *syms,
+			     Elf64_Word cur)
+{
+	int count = 0;
+
+	if (!system_supports_bti_kernel())
+		return 0;
+
+	/*
+	 * BTI veneers must be emitted within direct branching range of the
+	 * target function, so that PLTs emitted to perform calls that exceed
+	 * that range can use indirect calls as usual, even if the target
+	 * function lacks a landing pad. This is needed between init code
+	 * sections and normal code sections, which can be loaded far away from
+	 * each other. It should never be needed the other way around, given
+	 * that normal code cannot call init code.
+	 *
+	 * So go over init code sections, and find call/jump relocations
+	 * referring to symbols in the current section. If the symbol has
+	 * static linkage, allocate space for a BTI veneer.
+	 */
+
+	for (int i = 0; i < ehdr->e_shnum; i++) {
+		if (sechdrs[i].sh_type != SHT_RELA)
+			continue;
+
+		const Elf64_Shdr *dstsec = sechdrs + sechdrs[i].sh_info;
+
+		/* Ignore relocations that operate on non-exec sections */
+		if (!(dstsec->sh_flags & SHF_EXECINSTR))
+			continue;
+
+		/* Only look at .init code sections */
+		if (!module_init_layout_section(secstrings + dstsec->sh_name))
+			continue;
+
+		Elf64_Rela *rela = (void *)ehdr + sechdrs[i].sh_offset;
+		int num = sechdrs[i].sh_size / sizeof(Elf64_Rela);
+		for (int j = 0; j < num; j++) {
+			const Elf64_Sym *s = syms + ELF64_R_SYM(rela[j].r_info);
+
+			switch (ELF64_R_TYPE(rela[j].r_info)) {
+			case R_AARCH64_JUMP26:
+			case R_AARCH64_CALL26:
+				if (s->st_shndx == cur &&
+				    ELF64_ST_BIND(s->st_info) == STB_LOCAL)
+					count++;
+			}
+		}
+	}
+	return count;
+}
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
 	unsigned long core_plts = 0;
 	unsigned long init_plts = 0;
+	unsigned long bti_veneers = 0;
 	Elf64_Sym *syms = NULL;
 	Elf_Shdr *pltsec, *tramp = NULL, *init_tramp = NULL;
 	int i;
@@ -295,6 +396,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			mod->arch.core.plt_shndx = i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".init.plt"))
 			mod->arch.init.plt_shndx = i;
+		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".text.bti_veneer"))
+			mod->arch.bti.plt_shndx = i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name,
 				 ".text.ftrace_trampoline"))
 			tramp = sechdrs + i;
@@ -305,7 +408,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
 	}
 
-	if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx) {
+	if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx ||
+	    (IS_ENABLED(CONFIG_ARM64_BTI_KERNEL) && !mod->arch.bti.plt_shndx)) {
 		pr_err("%s: module PLT section(s) missing\n", mod->name);
 		return -ENOEXEC;
 	}
@@ -335,12 +439,16 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (nents)
 			sort(rels, nents, sizeof(Elf64_Rela), cmp_rela, NULL);
 
-		if (!module_init_layout_section(secstrings + dstsec->sh_name))
+		if (!module_init_layout_section(secstrings + dstsec->sh_name)) {
 			core_plts += count_plts(syms, rels, numrels,
 						sechdrs[i].sh_info, dstsec);
-		else
+			bti_veneers += count_bti_veneers(ehdr, sechdrs,
+							 secstrings, syms,
+							 sechdrs[i].sh_info);
+		} else {
 			init_plts += count_plts(syms, rels, numrels,
 						sechdrs[i].sh_info, dstsec);
+		}
 	}
 
 	pltsec = sechdrs + mod->arch.core.plt_shndx;
@@ -359,6 +467,16 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	mod->arch.init.plt_num_entries = 0;
 	mod->arch.init.plt_max_entries = init_plts;
 
+	if (system_supports_bti_kernel()) {
+		pltsec = sechdrs + mod->arch.bti.plt_shndx;
+		pltsec->sh_type = SHT_NOBITS;
+		pltsec->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
+		pltsec->sh_addralign = L1_CACHE_BYTES;
+		pltsec->sh_size = (bti_veneers + 1) * sizeof(struct bti_veneer);
+		mod->arch.bti.plt_num_entries = 0;
+		mod->arch.bti.plt_max_entries = bti_veneers;
+	}
+
 	if (tramp) {
 		tramp->sh_type = SHT_NOBITS;
 		tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


