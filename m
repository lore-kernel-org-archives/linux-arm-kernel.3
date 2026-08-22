Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70702C61CE0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCGSy80EkADOYqRdnClxXtF6MDWdUJROODWOao0NQ9A=; b=3pGvUh9RMyzFieXNjftYrLJRQ2
	OIv8X7GoIDN5N02VDNbcpK8yAi0W41FMYJWE3N1MtsKGazImt8bEdBKpUJoYzrtuXIRMvHzBNXj0A
	pB1WUkqyvFUi5+DhNarkgZq6X36f1zlac9PlJCu8RE/gi15CGYKzziaZypxQkjVcgPUnw28KBOCRy
	UiDAy6T+qVc22qvhQPbkMUdTIdUkU6jhSEIPJIFDsQuoBoiu8S4UuCSTz7eA+g/OAkoZ2h6Llj3YA
	71lG/oZG32jgOjf6RNpwYU4Ivc16E86z3KKcwDCAc8BpHZLrYbyeAYgjVrf3drDZjaPHkZ7f8MHSR
	8k0acNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmB0-0000000EYnD-3C4e;
	Sat, 22 Aug 2026 13:54:26 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAn-0000000EYc2-3WRD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:15 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-47f83450a8eso1568519f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406852; x=1788011652; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCGSy80EkADOYqRdnClxXtF6MDWdUJROODWOao0NQ9A=;
        b=qbTlUxEF6FeVhXwAKYbjMCqoiH+Fed9EOzN3rnH0UZBzfr9TlCK0XNJRkIsarxzDqt
         dogGyzuyTXM41Q+fjvUMWgQ/2IwStlMSyBoRZZvTSToicI5VK1eZbqPPJQln5SYUN+F1
         x+afodXGC9mfyz7VfwU4tnKeVhy79K/he+Uo6tFKNePCU/O4cqv8WNKbezZvzL+wdUR1
         zons60kD5EzXeDhxdlaBWIYlNA8fEYwnXOkOQGLnlkl1ZP8h7LKyziw17exCkRNLGjgK
         ZK5eB+dWz9NSxXs5NezET17JYZh4AiTJjk0uao2fNuO5o0nlRrLmhWdhxu97Wd9JK0m0
         snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406852; x=1788011652;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCGSy80EkADOYqRdnClxXtF6MDWdUJROODWOao0NQ9A=;
        b=ESA48oxrfa+ANC4YLena8wLfVDLYZjyzAaKveBUitq9yqa6Ay/7bSgvoTh1u+tV65t
         oPeANNrkmaJeRJdZ08HTsE6kntreAmlZnLU8UhOFgQyo+kp/2s4od1eA4Ra9L3X0l/hz
         P1x6fmqu3BKXFpCHxJgDbLr0V5pFbP6D/l5KENXRkKhMeuSQ946Bj8hAcxW23SzhNhl1
         aEgZlswesgUVBrI7SIfIFb4MB1kGAYxbFaUL830KAnptnDH2xbZtA+E9atgUyaNooBSr
         8IJQKaqs0w0eY0jADpHNsKRfom2oE/66dpVSbcveWJu8wS2x/nu+L9TNPxXE+M+GbMmI
         l/Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rqegm7X3Fy9+i7NREOSJzgVn94osxOWeirX3ZEA7+7zaY0+cEA6wzLU3/8jtoxniiGT2YiRx2ldlmIjJ2xjSHez@lists.infradead.org
X-Gm-Message-State: AFuF++nnvCP3mYrM6tkGF8yLAh36bap0SlKJPaWgemrrBkDYeKKf0Bbh
	VFNqG2SSYPsP+HJ45ydKZrXKU5eFfHXWT2F0IQrDy0JZ+iOgT0yhwy16Ps6Hn7JD1es1LUvJLQ=
	=
X-Received: from wrtv12.prod.google.com ([2002:a5d:610c:0:b0:47f:76fc:f05a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2589:b0:482:bf17:e685
 with SMTP id ffacd0b85a97d-482c0b88f19mr19709898f8f.11.1787406851530; Sat, 22
 Aug 2026 06:54:11 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:29 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4579; i=ardb@kernel.org;
 h=from:subject; bh=BEHgSt5XbzXt4tBoZXsq5UPFvM43IOdkHorxrjqha9w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5b2w6FXrAkIL3p777u+w3ijm62ajN4vezjfYEpZQl
 u7w99y6jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRA0mMDO0W8Xtjiy5zcH03
 q/x9b5GHzca9Bgf6WzaZLIo6+FaheSUjw3TVOf/Ejuza9aHbfV1D3U6jyXpCKevnz9LVlc13Lr4 txwYA
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-18-ardb+git@google.com>
Subject: [RFC PATCH 7/9] arm64: ftrace: Revert "fix unreachable PLT for
 ftrace_caller ..."
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
X-CRM114-CacheID: sfid-20260822_065413_917562_DE6F2BC3 
X-CRM114-Status: GOOD (  17.61  )
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

This reverts commit a7ed7b9d0ebb038db9963d574da0311cab0b666a, which is
no longer needed now that the corner case where .init.text is placed out
of direct branching range from .text of the same module can no longer
occur.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/module.h     |  1 -
 arch/arm64/include/asm/module.lds.h |  1 -
 arch/arm64/kernel/ftrace.c          | 13 +++----------
 arch/arm64/kernel/module-plts.c     | 12 +-----------
 arch/arm64/kernel/module.c          | 11 -----------
 5 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..79550b22ba19 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -19,7 +19,6 @@ struct mod_arch_specific {
 
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
-	struct plt_entry	*init_ftrace_trampolines;
 };
 
 u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 0b3aacd22c59..0c3aea98e116 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -2,7 +2,6 @@ SECTIONS {
 	.plt 0 : { BYTE(0) }
 	.init.plt 0 : { BYTE(0) }
 	.text.ftrace_trampoline 0 : { BYTE(0) }
-	.init.text.ftrace_trampoline 0 : { BYTE(0) }
 
 #ifdef CONFIG_KASAN_SW_TAGS
 	/*
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 5a1554a44162..b56da24c1be4 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -258,17 +258,10 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return ftrace_modify_code(pc, 0, new, false);
 }
 
-static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned long addr)
+static struct plt_entry *get_ftrace_plt(struct module *mod)
 {
 #ifdef CONFIG_MODULES
-	struct plt_entry *plt = NULL;
-
-	if (within_module_mem_type(addr, mod, MOD_INIT_TEXT))
-		plt = mod->arch.init_ftrace_trampolines;
-	else if (within_module_mem_type(addr, mod, MOD_TEXT))
-		plt = mod->arch.ftrace_trampolines;
-	else
-		return NULL;
+	struct plt_entry *plt = mod->arch.ftrace_trampolines;
 
 	return &plt[FTRACE_PLT_IDX];
 #else
@@ -339,7 +332,7 @@ static bool ftrace_find_callable_addr(struct dyn_ftrace *rec,
 	if (WARN_ON(!mod))
 		return false;
 
-	plt = get_ftrace_plt(mod, pc);
+	plt = get_ftrace_plt(mod);
 	if (!plt) {
 		pr_err("ftrace: no module PLT for %ps\n", (void *)*addr);
 		return false;
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index 7afd370da9f4..bde32979c06a 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -283,7 +283,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	unsigned long core_plts = 0;
 	unsigned long init_plts = 0;
 	Elf64_Sym *syms = NULL;
-	Elf_Shdr *pltsec, *tramp = NULL, *init_tramp = NULL;
+	Elf_Shdr *pltsec, *tramp = NULL;
 	int i;
 
 	/*
@@ -298,9 +298,6 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		else if (!strcmp(secstrings + sechdrs[i].sh_name,
 				 ".text.ftrace_trampoline"))
 			tramp = sechdrs + i;
-		else if (!strcmp(secstrings + sechdrs[i].sh_name,
-				 ".init.text.ftrace_trampoline"))
-			init_tramp = sechdrs + i;
 		else if (sechdrs[i].sh_type == SHT_SYMTAB)
 			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
 	}
@@ -366,12 +363,5 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
 	}
 
-	if (init_tramp) {
-		init_tramp->sh_type = SHT_NOBITS;
-		init_tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-		init_tramp->sh_addralign = __alignof__(struct plt_entry);
-		init_tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
-	}
-
 	return 0;
 }
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..6e5b488a219e 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -466,17 +466,6 @@ static int module_init_ftrace_plt(const Elf_Ehdr *hdr,
 	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
 
 	mod->arch.ftrace_trampolines = plts;
-
-	s = find_section(hdr, sechdrs, ".init.text.ftrace_trampoline");
-	if (!s)
-		return -ENOEXEC;
-
-	plts = (void *)s->sh_addr;
-
-	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
-
-	mod->arch.init_ftrace_trampolines = plts;
-
 #endif
 	return 0;
 }
-- 
2.55.0.860.g4b6b3295ed-goog


