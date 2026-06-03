Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9604BCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbgvnoAHr1VZwp/TGprKI6jwxgm2Tuk9bwrWQUAuGn8=; b=I5XTNYKNHtrDB16i8mSxiTES5Q
	tTcuuobe6uGxjc4cM2nwX6sWS/S9MRsAiY4BpAwI23Mzp6kjFEBSanVAG7B741SqNSjQB3/GmPBtm
	nMnq0HWDlNctaHZtEWeBpw3iq6yT2KjkabGkBhJfkSJkyLcXU6SqvgsDUTCeTSpULqjrVY2c1J/jh
	uTiAEPQnuuVrTTvqwA3/stexLqM8m9QahsqAY/pS1A/WucyJyBPDTtyd+2jG1vx7uiiGqXVHh+lPM
	aRT14wYxXZ+PhqohcPgOVx4khA4o8BoRDlmyPHPWj+lQBg37SCvqGNQVFYnYdDqywpxK/DdClmLh6
	o2c1GBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBh-0000000FUbT-27mR;
	Wed, 03 Jun 2026 16:11:25 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBd-0000000FUZj-3cxb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 16:11:23 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45eec2badc4so3553676f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780503079; x=1781107879; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbgvnoAHr1VZwp/TGprKI6jwxgm2Tuk9bwrWQUAuGn8=;
        b=jyQyajvLDnRkQStik8pICl69qpGARDmmJHsBMzMwXxvPwFK469ZswZBv+SH8lOXoCe
         AQdQDbCdNPkQcSsEbcsgco5zbeBJspOalkxQxVNdHLKOuRnebNtUmh37jZ8ZWqsnG/Hy
         wYZRSIMkw2qZEzFq5wrPeBmN5xEkJwTk+owSwBpQfoG/SmF/4Yj0XeI1MifA/Kob0Hwf
         LzDZrZxW6ZFQ1xdORS8r1UsKqDZ8IcAcLqezNxLRmBVQBQfUsJJPlJnKiiEslFhk70ho
         RJioY9ytxuAnZneQj4gEP4aMXZg9LFP0az7aCMEtzDu8lCMHV4proew5j3mnN1CW0XjR
         ITdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503079; x=1781107879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbgvnoAHr1VZwp/TGprKI6jwxgm2Tuk9bwrWQUAuGn8=;
        b=hJ/QY4NVqS/Jnz1YrkloKhc2zXIEl4mGk6Zc1AnNBfhdWvgiT8v6VOPTZbN6ACbnwQ
         iWnl00X0ELwidfPQfsplfftOhYDq8Iu4IH6n2dVMerOnlVyaXEOKfufmrqmneb7WakIV
         t0F349k0qC+DjxGypJhbzyiVkLmQd6w9Jqurvq36MFn5Etio3tih5ACdsK1PlUVk8WgI
         IYvQvnMSbY3oTe9WPS2luLW7iW+CKFOl7jlN9Ork77Da22EdRDnQfBpdsA9Wh1XQV8Nf
         DFtMMNudHf9UEBoaUCbc+LEmL2ECu6P1ZCDtHL/F9iTOmULyZ1F1FSeXVC9dcHANkr+6
         c7PA==
X-Gm-Message-State: AOJu0YyiiJ0jA7TxkzIey3VJXskRNLbg62Gun6yExYebCeYYS76Rxx3Z
	xEonvPXg1rLrqZ6+IXf/gNgNxV/0P0KBRD4gEzM1Pqwf14VwzmYU4BKCr+Hwp2OVf5GCMh8xBzs
	Jq7OZ7AS55sDXYO6Xh/Sk4KA6W4tV8bX5fVcp4XCJDIScTQpIZQJxAl3FAQM1y3mca7/X+Jdzro
	Uo8hmCXP23MZr9148GJaJSqtyq5AY036m7HkEu7ebOJv4x
X-Received: from wruh4.prod.google.com ([2002:a5d:6884:0:b0:43d:7e53:c76a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:414f:b0:490:b645:3213
 with SMTP id 5b1f17b1804b1-490b645343bmr42462745e9.19.1780503079435; Wed, 03
 Jun 2026 09:11:19 -0700 (PDT)
Date: Wed,  3 Jun 2026 18:09:51 +0200
In-Reply-To: <20260603160949.3372482-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260603160949.3372482-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5738; i=ardb@kernel.org;
 h=from:subject; bh=H9XZxM8XBIS3dkH+KdJkynk6oFDR1zV1Vb5pNRNFzRU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUsh8DzDwfV/5vOnvllwZIk0Y+nb+pOhh2KSuA8vEr+Rz
 qBsVavdUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDaEi1MAJnLmIcN/rw1nuH8kfxSp4ReY
 xBokMWvuuo68ZWwbW60S2H7vzZvoxshwgW3XwzULLl7eGtkw+d2zAtWQBxclN1Qqb9kQ/pKdb1M 6FwA=
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260603160949.3372482-7-ardb+git@google.com>
Subject: [PATCH 1/4] arm64: Move generic KASAN page tables out of BSS too
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	maz@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091121_998915_6BCA5CDA 
X-CRM114-Status: GOOD (  15.33  )
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

Make sure that all KASAN page tables are emitted into the .pgdir section
(provided that the arch has one - otherwise, fall back to page aligned
BSS)

This is needed because BSS itself is no longer accessible via the linear
map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/linkage.h |  2 ++
 arch/arm64/include/asm/mmu.h     |  2 --
 arch/arm64/kernel/vmlinux.lds.S  |  8 ++++----
 arch/arm64/mm/fixmap.c           |  6 +++---
 arch/arm64/mm/kasan_init.c       |  2 +-
 include/linux/linkage.h          |  4 ++++
 mm/kasan/init.c                  | 10 +++++-----
 7 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index 40bd17add539..8637f667667c 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -43,4 +43,6 @@
 	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
 	bti c ;
 
+#define __bss_pgtbl __section(".bss..pgtbl") __aligned(PAGE_SIZE)
+
 #endif
diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index fb95754f2876..5e1211c540ab 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -13,8 +13,6 @@
 
 #ifndef __ASSEMBLER__
 
-#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
-
 #include <linux/refcount.h>
 #include <asm/cpufeature.h>
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2b0ebfb30c63..d3ed59abab38 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -352,11 +352,11 @@ SECTIONS
 	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
 	__pi___bss_start = __bss_start;
 
-	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
-	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
-		*(.pgdir.bss)
+	/* page table BSS starts here - preceding data/BSS is omitted from the linear map */
+	.pgtbl : ALIGN(PAGE_SIZE) {
+		*(.bss..pgtbl)
 	}
-	ASSERT(ADDR(.pgdir.bss) == __bss_stop, ".pgdir.bss must follow BSS")
+	ASSERT(ADDR(.pgtbl) == __bss_stop, ".pgtbl must follow BSS")
 
 	. = ALIGN(PAGE_SIZE);
 	__pi_init_pg_dir = .;
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 1a3bbd67dd76..f66a0016dd02 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -31,9 +31,9 @@ static_assert(NR_BM_PMD_TABLES == 1);
 
 #define BM_PTE_TABLE_IDX(addr)	__BM_TABLE_IDX(addr, PMD_SHIFT)
 
-static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __pgtbl_bss;
-static pmd_t bm_pmd[PTRS_PER_PMD] __pgtbl_bss __maybe_unused;
-static pud_t bm_pud[PTRS_PER_PUD] __pgtbl_bss __maybe_unused;
+static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
+static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
+static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index dbf22cae82ee..3fcad956fdf7 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -214,7 +214,7 @@ asmlinkage void __init kasan_early_init(void)
 		 * shadow pud_t[]/p4d_t[], which could end up getting corrupted
 		 * when the linear region is mapped.
 		 */
-		static pte_t tbl[PTRS_PER_PTE] __pgtbl_bss;
+		static pte_t tbl[PTRS_PER_PTE] __bss_pgtbl;
 		pgd_t *pgdp = pgd_offset_k(KASAN_SHADOW_START);
 
 		set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));
diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index b11660b706c5..53fe1f48fd28 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -39,6 +39,10 @@
 #define __page_aligned_data	__section(".data..page_aligned") __aligned(PAGE_SIZE)
 #define __page_aligned_bss	__section(".bss..page_aligned") __aligned(PAGE_SIZE)
 
+#ifndef __bss_pgtbl
+#define __bss_pgtbl		__page_aligned_bss
+#endif
+
 /*
  * For assembly routines.
  *
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 9c880f607c6a..66a883887987 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -26,10 +26,10 @@
  *   - Latter it reused it as zero shadow to cover large ranges of memory
  *     that allowed to access, but not handled by kasan (vmalloc/vmemmap ...).
  */
-unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
+unsigned char kasan_early_shadow_page[PAGE_SIZE] __bss_pgtbl;
 
 #if CONFIG_PGTABLE_LEVELS > 4
-p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
+p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __bss_pgtbl;
 static inline bool kasan_p4d_table(pgd_t pgd)
 {
 	return pgd_page(pgd) == virt_to_page(lm_alias(kasan_early_shadow_p4d));
@@ -41,7 +41,7 @@ static inline bool kasan_p4d_table(pgd_t pgd)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 3
-pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __page_aligned_bss;
+pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __bss_pgtbl;
 static inline bool kasan_pud_table(p4d_t p4d)
 {
 	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
@@ -53,7 +53,7 @@ static inline bool kasan_pud_table(p4d_t p4d)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
-pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __page_aligned_bss;
+pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __bss_pgtbl;
 static inline bool kasan_pmd_table(pud_t pud)
 {
 	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
@@ -65,7 +65,7 @@ static inline bool kasan_pmd_table(pud_t pud)
 }
 #endif
 pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS]
-	__page_aligned_bss;
+	__bss_pgtbl;
 
 static inline bool kasan_pte_table(pmd_t pmd)
 {
-- 
2.54.0.1013.g208068f2d8-goog


