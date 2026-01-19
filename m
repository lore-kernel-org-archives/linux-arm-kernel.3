Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA6AD29C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYzWrHN2Tb1+sOzqvSgFkFnU6zAOyR4NYaLGjHgj3Gc=; b=EcZVgEsdmQq+LP2hQr/7eccnIL
	VBxhRoN/cwqy/mI4UErupxjs/jTa9EFZqdqTXQD3aOB349TWXeyxCSj5OXvE1g9dK/TG6qSzt2jSB
	PhhESYkG4djXoZTk9FhzRdaoD/56XY3Mro7w4KpuFQxDdE2uCgtbvKiQwGC3+QGQpfxLXQfvSqLG4
	+bk5pL50j1V9CBcSdNVYsZJER5KHRKhm0ql7yaVRvyu4Hu6rl7KUFRip2bMSG9jIj8ELEzkHXXnAX
	GaMQqasCE6wpyDCXsYrieLXSHG6OACtXnmXso3RaGLtaFBLXcs5lw8Hkiy8FItv3WKYTbI3Bi355s
	URk7kFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYD-00000002ZO3-2ek9;
	Mon, 19 Jan 2026 16:56:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYA-00000002ZMf-2Up1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:56:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4801da6f5c9so39059595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768841780; x=1769446580; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYzWrHN2Tb1+sOzqvSgFkFnU6zAOyR4NYaLGjHgj3Gc=;
        b=283jacTOlpavCzepsFgl4lcqRE9HHIuCK0rV+A6pYg9QRfrVzbz4Qrrkbx0BBA4kbF
         pOKRRIXEKyg6ARq41gBwnx+s7HmGIncxe02eJA9+hrG3tSIC+Ogh4bgk4XmYj5YA6KAG
         MJXmDh1/RgDZ4XvJXe8St9pX/H6nRS3iKorzqQJzvbqX8Gq6RFtQaF+WqrgfALB9Ul5d
         XAc+CFoSxJ5UhyeqWongkdTqPUYY/2sYY/FUpjg3BaBO/iZHE7oi5PvZnI0aZfm5EV3k
         vzMSAJASGldRtqvwWbLsgj1Q5tCYeceSgZ3GNAaZHhYh+0HJJrbdRRQYl4pEke40Mnp7
         9hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841780; x=1769446580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYzWrHN2Tb1+sOzqvSgFkFnU6zAOyR4NYaLGjHgj3Gc=;
        b=DyoBTktezaR8E/iH63qozukEd4naQjwvzS63Zjiz/OjszaVPcsb+JHm6Kcx/i84H1q
         4gxo5O4wyAZsV1JYAZgPqm0uGyliiQQQcbEQYgGl8/MMkh2QQZx9wpoDY44KXzTK4GlS
         V7tuBiUBLCXrbcC8cUbdVvLH77BfdZRKwPfO7R/Q1JAwnq6WdqdUPozbs3Xmiuz7I4G4
         ftbTr+WLcqYN7omqUYhZPhOz1DkmgrwHOtPt7wUOk8H1C3LW8iRBbRedY8yK6KkA1+TO
         Z9YocwBlSbEudCBtwus/aucq99xIsJfA1qhFf8JKk+zXMRfOWVHEuu5RjpHKUYkztcb/
         cQtg==
X-Gm-Message-State: AOJu0YyYGnmi6ryPk6ZflZx6c6VC3e9UcrLKJSvrcqClwHwZF4GZrh4H
	5oKmuYSfqrx5B24kCJzfiV2k3n+C6yk57xNdmWKgRu6y9XEQ8f6HAuz5FDbfi+vLzv1JAllCCg=
	=
X-Received: from wmpb25.prod.google.com ([2002:a05:600c:4a99:b0:47b:d5ad:dd7f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:e41a:b0:46e:4b79:551
 with SMTP id 5b1f17b1804b1-48024b8a77bmr128214125e9.31.1768841780129; Mon, 19
 Jan 2026 08:56:20 -0800 (PST)
Date: Mon, 19 Jan 2026 17:47:49 +0100
In-Reply-To: <20260119164747.1402434-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=ardb@kernel.org;
 h=from:subject; bh=pH0qhntASVe+teACB8I8uAP7qr08zJ3z+pk5XF62igc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JITMvweSMgsuupXxNr0PWybb8ujf3yOU1itoSQq7c0065f
 Z8VkBnSUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaybQojw2m+xOC8P0r+H/tO
 6zxuMe87bfe0y1tx/vpp52vmpfLeE2RkOGF3SK/uxKbJNStMdZZUq29ym8Bp9G+XeKXTBb0f3fn yPAA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119164747.1402434-7-ardb+git@google.com>
Subject: [PATCH 1/4] arm64: Move fixmap page tables to end of kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_085622_648503_F13869AE 
X-CRM114-Status: GOOD (  13.93  )
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

Move the fixmap page tables out of the BSS section, and place them at
the end of the image, right before the init_pg_dir section where some of
the other statically allocated page tables live.

These page tables are currently the only data objects in vmlinux that
are meant to be accessed via the kernel image's linear alias, and so
placing them together allows the remainder of the data/bss section to be
remapped read-only or unmapped entirely.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 5 +++++
 arch/arm64/mm/fixmap.c          | 7 ++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..df530e6f3e53 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -334,6 +334,11 @@ SECTIONS
 	__pi___bss_start = __bss_start;
 
 	. = ALIGN(PAGE_SIZE);
+	.pgdir : {
+		__pgdir_start = .;
+		*(.fixmap_bss)
+	}
+
 	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
 	__pi_init_pg_end = .;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..b649ea1a46e4 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,10 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __page_aligned_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;
+#define __fixmap_bss	__section(".fixmap_bss") __aligned(PAGE_SIZE)
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __fixmap_bss;
+static pmd_t bm_pmd[PTRS_PER_PMD] __fixmap_bss __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __fixmap_bss __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
-- 
2.52.0.457.g6b5491de43-goog


