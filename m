Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B803C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fli+nS6RhVan3nt659uJs8jpsHJEZUSGw+6iw8TgCBk=; b=thxB3LZafS+LzKntMSY3Tgs6LN
	fn9cm8jj3vD9Zz2GahmMjxI3C2MAUWiGBCIHPOnDOgwrG7NiFaf2DjBk/vE4FPUgCPtG+UYYdQhFK
	5W7YxYD38DcugNqBiGaVh+e//j4sSsxHsiKDxzpBfgzEAKsb1jJDcltIMUkmBIAXv5RyQ0Fdqfbt/
	N2T9+ohIL2zNY7zeZJ442R2sEN+m0Qr4aIAwiQ5gcWYSyRi93moPKyByxZvpcCZclqWmfKILDxQP8
	9WtYf6aWp2K3IqK+EgPMgddsNC46J/HymDD12Yeix5m/NB28cnL079VuD+q7ewCdZyixHfGwpgLNz
	D5YZiHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmB1-0000000EYoG-0QgT;
	Sat, 22 Aug 2026 13:54:27 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAq-0000000EYea-3BWM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:17 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49564d4b849so6805915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406854; x=1788011654; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fli+nS6RhVan3nt659uJs8jpsHJEZUSGw+6iw8TgCBk=;
        b=hJeACPqRIP8uotOoUeDWEW3zUaskV9frjqT6m71vxDCY7OGJxmZ3syFrUrXUiprhll
         Tz5Q9Mi866CazJx4Z9KfteITBDxkoGmPUsVNzFSrxyWZ+6jMMhuy+QvqSKr9CRcKBKg+
         r8PufsYiRRBJK9i5aFmatshlQdPn08A1UlUDY3WEo8k+E3QUYtd5fJsUiYVTcVs15lfC
         TiNxtfmqHJd0UX1rI0ga9M+SbjJzBIkpRLSYM7YcWUUx9al7OnokNU6zPjOh/RbI87fK
         ptX2U8DQzNC37h+E0BDJ+XxwhiXIjDvSmfYdzY3xJ9n69CCytI5FiviI+jdiV2qW8J+G
         YbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406854; x=1788011654;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fli+nS6RhVan3nt659uJs8jpsHJEZUSGw+6iw8TgCBk=;
        b=P0Ig3LyYff4DxWq2oSTDJNUbidSpwx6FccEw4s5+vjKlU4MUUXbprip3Xf7sp4qUW3
         5mRTPodYbTQVbJPH1FzNPGGvfqLWa+F9jEKOwzIi4BvfE+WDj+wR4+xfSs/z/04iRJdm
         8sa+W6IUlcT6J4vEyyXWuvvploMlJ0TRn0hDITZxoc1WxQFHK+lwwjTYoErl4gXDsxPT
         28ChsynyJoC1SBu6GvL4yYCpUzjNUxrF/NXSp7NPNNF3rCjPG/lnnUVGsl/oTLTyhITS
         POHanYgLbord+4Jwd2DYfoSJCkbVl9V1wxW1P0/OlvVte9QzGvY/R32zoQDPuOBmCI6N
         SHhw==
X-Forwarded-Encrypted: i=1; AHgh+RrTScYRB1ts0gQHM2qw534iY7o2chN+bSki/p5VZkBNFj4Sxx0UapVlcuF4dWSTDiNqeDBYJkPLseCvnbiMd4iE@lists.infradead.org
X-Gm-Message-State: AFuF++nmvpuKDomi3ndhVrY7N7YHmFSWIwnbwPBjQfLy0Wc1CSChr5Vz
	2Cqgyesf3JvkLa/G1aEMU1GsciJRoF2CFJ6dCdUyUoe/CwzjgbA3VUC4kOht+jv2wyKLWv4w1Q=
	=
X-Received: from wmfu6.prod.google.com ([2002:a05:600c:1386:b0:495:4396:e1fc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f87:b0:499:5a50:b022
 with SMTP id 5b1f17b1804b1-499b830d220mr157719645e9.3.1787406853968; Sat, 22
 Aug 2026 06:54:13 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:31 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3229; i=ardb@kernel.org;
 h=from:subject; bh=E47PSMirXFpI2/XCsflkCaR86s287Dpi3LlkrwYeMZU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5YP+Sf2p1kr7Q6vXvzG479h57WWiGrOK0SxDm5Zur
 rn/05U6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETM0hj+xzDKsHPO3dNxlH9C
 0+uIc6a1D/ek6rI+m2n6kfsH+/Iz2xj+xz1lvlS6rabo2mvOz1OevZxXu7UtMFJsxfK5+yQPz9Z 5ygoA
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-20-ardb+git@google.com>
Subject: [RFC PATCH 9/9] arm64: ftrace: Simplify PLT handling
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
X-CRM114-CacheID: sfid-20260822_065416_823257_3753A69F 
X-CRM114-Status: GOOD (  15.63  )
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

Instead of emitting the ftrace trampoline PLT into a separate ELF
section, allocate them at the start of the ordinary PLT array, so
that no special sections are needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/module.lds.h |  1 -
 arch/arm64/kernel/module-plts.c     | 18 +++++-------------
 arch/arm64/kernel/module.c          |  9 +--------
 3 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 24fc9401c514..95540e956b41 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -1,6 +1,5 @@
 SECTIONS {
 	.plt 0 : { BYTE(0) }
-	.text.ftrace_trampoline 0 : { BYTE(0) }
 
 #ifdef CONFIG_KASAN_SW_TAGS
 	/*
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index e30876b90e30..6900d2242f1b 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -275,12 +275,14 @@ static int partition_branch_plt_relas(Elf64_Sym *syms, Elf64_Rela *rela,
 	return i;
 }
 
+static const int ftrace_plts = IS_ENABLED(CONFIG_DYNAMIC_FTRACE) ? NR_FTRACE_PLTS : 0;
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
-	unsigned long core_plts = 0;
+	unsigned long core_plts = ftrace_plts;
 	Elf64_Sym *syms = NULL;
-	Elf_Shdr *pltsec, *tramp = NULL;
+	Elf_Shdr *pltsec;
 	int i;
 
 	/*
@@ -290,9 +292,6 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	for (i = 0; i < ehdr->e_shnum; i++) {
 		if (!strcmp(secstrings + sechdrs[i].sh_name, ".plt"))
 			mod->arch.core.plt_shndx = i;
-		else if (!strcmp(secstrings + sechdrs[i].sh_name,
-				 ".text.ftrace_trampoline"))
-			tramp = sechdrs + i;
 		else if (sechdrs[i].sh_type == SHT_SYMTAB)
 			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
 	}
@@ -336,15 +335,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	pltsec->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
 	pltsec->sh_addralign = L1_CACHE_BYTES;
 	pltsec->sh_size = (core_plts  + 1) * sizeof(struct plt_entry);
-	mod->arch.core.plt_num_entries = 0;
+	mod->arch.core.plt_num_entries = ftrace_plts;
 	mod->arch.core.plt_max_entries = core_plts;
 
-	if (tramp) {
-		tramp->sh_type = SHT_NOBITS;
-		tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-		tramp->sh_addralign = __alignof__(struct plt_entry);
-		tramp->sh_size = NR_FTRACE_PLTS * sizeof(struct plt_entry);
-	}
-
 	return 0;
 }
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 6e5b488a219e..620c2b70115e 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -454,14 +454,7 @@ static int module_init_ftrace_plt(const Elf_Ehdr *hdr,
 				  struct module *mod)
 {
 #if defined(CONFIG_DYNAMIC_FTRACE)
-	const Elf_Shdr *s;
-	struct plt_entry *plts;
-
-	s = find_section(hdr, sechdrs, ".text.ftrace_trampoline");
-	if (!s)
-		return -ENOEXEC;
-
-	plts = (void *)s->sh_addr;
+	struct plt_entry *plts = (void *)sechdrs[mod->arch.core.plt_shndx].sh_addr;
 
 	__init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
 
-- 
2.55.0.860.g4b6b3295ed-goog


