Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705EDC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lE3r1MZLrWL74IP7BP3pqzwy+IxcMr+2cYN0bFzQAQ=; b=ZLWWNfQDum4Zsd4DoU0aGNFtUe
	tA7zziN9vEli+U/NTwp1KnKC4ggo481jnmrngMFZXByiu+aT/pCPB0v4871IpEBL7HKuaDdl/b8VC
	TnfM2E48bYCZkYpw149j7Jx3E5kfs7S6i2DiNpblHxV72qkpDdA2diiY5JdFbhP0XdYMNxQDwaG0G
	KKOjcDrLYsErL6jprGN9dOiMGAcWZJRn4FCThGhPmLWE5iZwQJT82ym2XCGGbb9gsDSSguIuqMrfj
	3o/9+Z614BBNUPQiRWTPJ7wFuiQxiO+qgMk8dN4AkcWGMVtkVVkejjizR6ArYTyfMrn/RPOyKpBMm
	JCYbJXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmB0-0000000EYnm-3x55;
	Sat, 22 Aug 2026 13:54:26 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAp-0000000EYdx-1hkw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:16 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-47f8f8fde2dso1244018f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406853; x=1788011653; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lE3r1MZLrWL74IP7BP3pqzwy+IxcMr+2cYN0bFzQAQ=;
        b=f0n8uVvqsrMM//4i/4bst7BvugU6QNO8KruPYkY9dIBUrOUPAs4JqPYwfOXoSriXhp
         +wQuB1hmHE2U7rtd+5aMWoJ2lhHVP0zoUiq2rdVtJ5szjLsmq7M84KRsPkE8dH2EtxQF
         NkmZAwN7MsneqKSf/8h2Jg1JAlqoB8N1yiwDLjOjXkug7svcQobfdCcELakrDIMqfHQp
         jAp+Uew8vgB+txCsfcAC8rJpX58/yNn70skbbSuRWiJjGhfre+/qzJfuM2j47Ypve7v/
         hxb3Vu5o4e0BDmix6PH7x3ZQzJd5Qr0+CxnxwhWIDtbq4B36oA5acVpIdUGbUdrW1EFW
         tpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406853; x=1788011653;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lE3r1MZLrWL74IP7BP3pqzwy+IxcMr+2cYN0bFzQAQ=;
        b=BIl6E4YM9kkckDxmFVnKY43enhsRGlvjphBJHZLqWIrEhyCf+FqICtEslwWD9USs0+
         k4Q2PfJu2xJk3urX8Kv0panMbvSaVetc0C14i9QpY+pHJ68dO1oGztG1RYWRk06jVMec
         JzmHJhJGWZx65JbXIZLwp7OqxTJf2SaOUXOa0Aw9UnC2TydZY5V3dVbaIawdd9v135xZ
         ZaLi5fCWzz203MOoxjSwIzIXAEz2CeOPs/XIIQ45NoRuMiXIthgYqeExF2KCC5074TYC
         bYH0aB8/h7MQC7EX/fHcqC/aK+kqMXjYmhfzb/X1DUwjDHBC0cDzXqrK2urOGBv86hN1
         ZrGg==
X-Forwarded-Encrypted: i=1; AHgh+RqRDrIhMesSP1txPKPvn9HR6qbXEzAJbzxtdYsOGz1dbrYgjQGMlW/zRW7b5w23kwApGESEdQdvjZpl3ERQz8/o@lists.infradead.org
X-Gm-Message-State: AFuF++ntDQZllPmyBXROwlrc024HBG9sA6utfJrVM2NRXK/XuKt7WIFp
	3mgH4VNpCYby6ajz9t1NOszkrVI5EwLbwJEcxwQqB58HGuOcl8ENDJO1o0jlOrLqflHAUVexFQ=
	=
X-Received: from wrbgf1.prod.google.com ([2002:a05:6000:27c1:b0:462:567a:6591])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6f13:0:b0:47f:e9fd:80d8
 with SMTP id ffacd0b85a97d-482c0bb40bemr18991596f8f.21.1787406852902; Sat, 22
 Aug 2026 06:54:12 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:30 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5799; i=ardb@kernel.org;
 h=from:subject; bh=5Vh9JPqa1jt8juFWDYh0K543ecP29Z3LFYkXXDIJ0JE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5f0rrx+s+jGrVkH3hJXknjsl122VL1WsEJX3nyc5J
 3SrBmd9RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIp2BGhvu/oyTzD638eknh
 x5azWglPZFe66t+aGDBlhfIq+S9TPy9gZJj348O6+Lw9ldcEz9Z/ZujJu/c0/uE08dwNgV7bPq9 szmYAAA==
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-19-ardb+git@google.com>
Subject: [RFC PATCH 8/9] arm64: module: Combine init and core PLT entries again
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065415_509088_FAC28006 
X-CRM114-Status: GOOD (  22.37  )
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

It is no longer possible for .init.text to end up being placed out of
direct branching range of the .text section of the same module, so the
PLT array of core and init code can be combined again.

It also means there is no longer a need to allocate PLT entries for
cross-section calls within the same module, and so the upper bound
for the number of needed entries can be lowered again as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/module.h     |  1 -
 arch/arm64/include/asm/module.lds.h |  1 -
 arch/arm64/kernel/module-plts.c     | 35 +++++---------------
 3 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index 79550b22ba19..9328fadb4a95 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -15,7 +15,6 @@ struct mod_plt_sec {
 
 struct mod_arch_specific {
 	struct mod_plt_sec	core;
-	struct mod_plt_sec	init;
 
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 0c3aea98e116..24fc9401c514 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -1,6 +1,5 @@
 SECTIONS {
 	.plt 0 : { BYTE(0) }
-	.init.plt 0 : { BYTE(0) }
 	.text.ftrace_trampoline 0 : { BYTE(0) }
 
 #ifdef CONFIG_KASAN_SW_TAGS
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index bde32979c06a..e30876b90e30 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -70,8 +70,7 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 			  void *loc, const Elf64_Rela *rela,
 			  Elf64_Sym *sym)
 {
-	struct mod_plt_sec *pltsec = !within_module_init((unsigned long)loc, mod) ?
-						&mod->arch.core : &mod->arch.init;
+	struct mod_plt_sec *pltsec = &mod->arch.core;
 	struct plt_entry *plt = (struct plt_entry *)sechdrs[pltsec->plt_shndx].sh_addr;
 	int i = pltsec->plt_num_entries;
 	int j = i - 1;
@@ -101,8 +100,7 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 				void *loc, u64 val)
 {
-	struct mod_plt_sec *pltsec = !within_module_init((unsigned long)loc, mod) ?
-						&mod->arch.core : &mod->arch.init;
+	struct mod_plt_sec *pltsec = &mod->arch.core;
 	struct plt_entry *plt = (struct plt_entry *)sechdrs[pltsec->plt_shndx].sh_addr;
 	int i = pltsec->plt_num_entries++;
 	u32 br;
@@ -169,17 +167,17 @@ static unsigned int count_plts(Elf64_Sym *syms, Elf64_Rela *rela, int num,
 		case R_AARCH64_CALL26:
 			/*
 			 * We only have to consider branch targets that resolve
-			 * to symbols that are defined in a different section.
+			 * to symbols that are not defined in the same module.
 			 * This is not simply a heuristic, it is a fundamental
 			 * limitation, since there is no guaranteed way to emit
 			 * PLT entries sufficiently close to the branch if the
 			 * section size exceeds the range of a branch
 			 * instruction. So ignore relocations against defined
-			 * symbols if they live in the same section as the
+			 * symbols if they live in the same module as the
 			 * relocation target.
 			 */
 			s = syms + ELF64_R_SYM(rela[i].r_info);
-			if (s->st_shndx == dstidx)
+			if (s->st_shndx != SHN_UNDEF)
 				break;
 
 			/*
@@ -281,7 +279,6 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
 	unsigned long core_plts = 0;
-	unsigned long init_plts = 0;
 	Elf64_Sym *syms = NULL;
 	Elf_Shdr *pltsec, *tramp = NULL;
 	int i;
@@ -293,8 +290,6 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	for (i = 0; i < ehdr->e_shnum; i++) {
 		if (!strcmp(secstrings + sechdrs[i].sh_name, ".plt"))
 			mod->arch.core.plt_shndx = i;
-		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".init.plt"))
-			mod->arch.init.plt_shndx = i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name,
 				 ".text.ftrace_trampoline"))
 			tramp = sechdrs + i;
@@ -302,8 +297,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
 	}
 
-	if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx) {
-		pr_err("%s: module PLT section(s) missing\n", mod->name);
+	if (!mod->arch.core.plt_shndx) {
+		pr_err("%s: module PLT section missing\n", mod->name);
 		return -ENOEXEC;
 	}
 	if (!syms) {
@@ -332,12 +327,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (nents)
 			sort(rels, nents, sizeof(Elf64_Rela), cmp_rela, NULL);
 
-		if (!module_init_layout_section(secstrings + dstsec->sh_name))
-			core_plts += count_plts(syms, rels, numrels,
-						sechdrs[i].sh_info, dstsec);
-		else
-			init_plts += count_plts(syms, rels, numrels,
-						sechdrs[i].sh_info, dstsec);
+		core_plts += count_plts(syms, rels, numrels, sechdrs[i].sh_info,
+					dstsec);
 	}
 
 	pltsec = sechdrs + mod->arch.core.plt_shndx;
@@ -348,14 +339,6 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	mod->arch.core.plt_num_entries = 0;
 	mod->arch.core.plt_max_entries = core_plts;
 
-	pltsec = sechdrs + mod->arch.init.plt_shndx;
-	pltsec->sh_type = SHT_NOBITS;
-	pltsec->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-	pltsec->sh_addralign = L1_CACHE_BYTES;
-	pltsec->sh_size = (init_plts + 1) * sizeof(struct plt_entry);
-	mod->arch.init.plt_num_entries = 0;
-	mod->arch.init.plt_max_entries = init_plts;
-
 	if (tramp) {
 		tramp->sh_type = SHT_NOBITS;
 		tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-- 
2.55.0.860.g4b6b3295ed-goog


