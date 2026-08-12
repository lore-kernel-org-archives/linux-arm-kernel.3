Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DCAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dd0UaRUFlUNzLlchQD+jEidsgZYPZdZT1MJFfY8nw7I=; b=uChzS3x6jrVvK8KNtIbr1bhqmg
	b8qiFpiydZahTDZtYCM84VzQk/jDUr9q1mo3N1JzJkiqYrn8M8FFeoBV5/OMaqAmCR3nWX41nBiHT
	/YPmXDRVjT3H9RVvjzXYtUELfiq6reXztlTguuSD0UdLG2via6tfKjxJSDI9Y9MS/bOQoJWxnLcp7
	615kMNVcizNAdTzvj5MLvZfoeZlWwLCTWhnE0F6G5wHlzewr3GNbZtuWFK+I5QVVD1j0pLuqZjuyI
	zGNdJxQzrPb3HkNqGUYPI5wj2/w96tsogaAlXWdA9gmfEOn9uIi7QjmCGtc3b/1pe1RmHWVBmE6AO
	/nKwG3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBhi-0000000GZeM-3rRM;
	Wed, 12 Aug 2026 16:21:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBhf-0000000GZdO-2ctp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:21:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD78F60A9E;
	Wed, 12 Aug 2026 16:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CEE1F00A3A;
	Wed, 12 Aug 2026 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786551678;
	bh=Dd0UaRUFlUNzLlchQD+jEidsgZYPZdZT1MJFfY8nw7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qhk7K1Qxnf9MKxu12pVMP1etPhxWgoemh7hoBGW2uqthyMn2TdNewVEbeunhVHQpA
	 YcRxatLrW31qrbAW2zjPechJEsR00R6pn33MlO0tLZcBXoSKfA4UErucIIKA+sezLa
	 laLCjrpI0Ai6ZNrUkiJC7uKqQ+OAG+VULwuxgeCqRwJyimdJwhLFCRFNxg2Gaz4o8y
	 yfu/SGPiMseYDw14+l0In9tLeF5gjRfuw1N2nNgXCflKZTkBZS70xp7wt7wDhyxRBm
	 063k94u6rND7I/XL5/F1Aj0NSSygWBtnjDfOm4qzKHCp9PXK+JLYThaSVTjyW+fdXC
	 yqT0sUvs6vHUw==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 1/2] arm64: module: Emit BTI veneers for cross-section calls
Date: Wed, 12 Aug 2026 18:21:00 +0200
Message-ID: <20260812162058.612202-5-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812162058.612202-4-ardb@kernel.org>
References: <20260812162058.612202-4-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10607; i=ardb@kernel.org; h=from:subject; bh=B21wyovCJhRxB7emhF6LhSU98+q7Nh3TtINd2u1tWnc=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatmbq5XxBXeo3uW2BXW3tpe4WslzLtw/eTeSWnHLyy++ 3374tvHO0pZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEti9jZHjKrOn2KFbo6eF5 SznnFp0+tODknZ6rV0Q+RHazuLywPFfM8D/UlSX3UvZ/PS/RI/YX25L+Ljkfdve936wdvU3fg34 0WbMBAA==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
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
 arch/arm64/Kconfig                  |   2 -
 arch/arm64/include/asm/module.h     |  12 ++
 arch/arm64/include/asm/module.lds.h |   3 +
 arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
 4 files changed, 138 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..25fa80b5591d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
 	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
 	depends on !CC_IS_GCC || GCC_VERSION >= 100100
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
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
index 0b3aacd22c59..b6cc9da9dd24 100644
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
2.47.3


