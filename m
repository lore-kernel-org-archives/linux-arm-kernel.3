Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09461C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8EtFYpkeeZSqWY8m05eSUUviRVNOc3GBKbkMNHHDeA=; b=AdMZz0b/Ow+DfKfOAkN+uP6ndV
	QG5IiqDon25D08OOpKAVw0vLpOO+RJdXVFjemnINSr1XrGaAVSawxr4l8VVD3b2BMHYeIyZf6OJaf
	wTprsk/3d2IK6fDVaryooUm81WUzRhhniRXSyc7gF1QenFWMrU6yrT8ZktWdRwwV/iGd6MQQdkSlx
	4nyUfWZldO+mLGjWY5SAh6KknoA0oPx8HHS6jrh5fgKEie1JmOImLQ/Vdw0w34C8Rq24FMAHbpzCo
	7PhpabhktjVPmrNiMmKnLcO7uthTu6SVMREwtDZa49D/fizXmgIaIx342QuStTb+tFqGXn3bCISz9
	SGT8Q6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcBw-0000000EsjD-3eS3;
	Fri, 21 Mar 2025 13:13:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc88-0000000ErnY-27D9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:09:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12730335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562583; x=1743167383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8EtFYpkeeZSqWY8m05eSUUviRVNOc3GBKbkMNHHDeA=;
        b=ExBffTHL0Ckf/dH/vmrW5zd+Kybt/YREdyDI348B49LbNFqXuCFpYdQUKNfzkWjfZo
         7k/gb0zDZPObw8l8QSPKmaHuig1FcNlTlZngm5gped3hHr/ikU2bT5+G5qlnJZYhVXvn
         QLeXMKBQ9L0Q8kS8iIVPk4EJfhi+SC0FXaGuvx8GqB+LpZq7owvsIYL0HVKRRAGtsVrY
         BmZtfloiCHyakYBc2u/5qxfkxyG7N3HTTr8xzE271N0zMCJJwKbuo8IXjQWh2qmiO7AI
         HFUmcroE634M94GSiTiuTo0WA49ZOwJYe0fhkdtRbeut+BC7MWoAYeGZ74hfBsYp2HHM
         Ul3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562583; x=1743167383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8EtFYpkeeZSqWY8m05eSUUviRVNOc3GBKbkMNHHDeA=;
        b=gqoADWIYLJdd6am2CAZMKmAc1S2VLaK5xc2bs0D6vDxp21E5XAiL6UuoNz2YFKLaGt
         +zb1EjWlaoDUQkkPb7Sf8NkP+WGTqbSpq9LE3jzdfRq9T8PAqCsz1YlNgL6knGc/w73A
         vChzJ/09zIa4uThUcpXya6d5lTGyAsvkX3pFPQC1WZUkVeJXyCCsALD5Rot3ADudPvuy
         2MEuiWuO5rDptz0THGddIe5FnZgzUZa39VA6oVGdiIJGFJdIC4wPnkBLXeLu5tqmO7H/
         KCR8+NahN7QDGeaXaq+3hK7mYiOWgqdJAjVI81axqColjXCGvlUlZHfFLbeEfruT9tiA
         GAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBcwGCS6Mfe2Uj+g3axZdCUNQadbqqRe0QYjZnPssShMAWNUxgOeX497+OJ1FVegUZiCFhQgDDnoaDg6J+0QWA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7OjcogmSO1QVkvmGc3cy7JPfHlPFXdt47fuyQt97m8uzeUkRV
	3KE8KCpaBvG18I3j2gKewe+dRszih7k2LjwGeL/6EFW1UeHKRI6BpG5fyQTKWak=
X-Gm-Gg: ASbGnct1luBysOJTikOPeoWq/F22O1DPBX9Aes8dlCg0O9BsFiaPO730hGDDaAPreX/
	8U7cQ5mt9/jOhdwFZ9uENlxD4bxLE9yBlEfXidESvLz1MILx7lJRVUD72+fKyqHcMvz29Xo00w7
	CT84F6d2QDfIBE3kZeTK3LIFPXNtt81NfBnn3Tu6F9fcW554qwaNFQWQjgt+NhptkTO5C9RmJpv
	g2k59L38Nfgm1V/CPTfDFD7gPq8NBA4ymBJJkx5gIjNnNqAQZFbR2+xs+8ywS6nndQGMciVqysb
	DoKMJ9fPqvRuCGHvQuWs8w46gSUAV2X9hkCYEGAr+2AdndFurk3yACV9kM0Bj4p+rt4a4Q==
X-Google-Smtp-Source: AGHT+IFrlDybl2QKCVYqfxTyu64dXX62tEzPiiOD5kkpTcHrUIRBIEyVsyFQKXhsbfpJSLh/l0FWog==
X-Received: by 2002:a05:600c:4e4b:b0:439:9737:675b with SMTP id 5b1f17b1804b1-43d502f8536mr33623225e9.7.1742562582938;
        Fri, 21 Mar 2025 06:09:42 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3c7fsm2377861f8f.34.2025.03.21.06.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:09:42 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 3/9] mm: Use common huge_ptep_get() function for riscv/arm64
Date: Fri, 21 Mar 2025 14:06:29 +0100
Message-Id: <20250321130635.227011-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_060944_682230_4295B925 
X-CRM114-Status: GOOD (  24.62  )
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

After some adjustments, both architectures have the same implementation
so move it to the generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/hugetlb.h |  3 +-
 arch/arm64/include/asm/pgtable.h | 57 +++++++++++++++++++++++++--
 arch/arm64/mm/hugetlbpage.c      | 66 ++------------------------------
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/hugetlb.h |  6 +--
 arch/riscv/include/asm/pgtable.h | 45 ++++++++++++++++++++++
 arch/riscv/mm/hugetlbpage.c      | 62 +++---------------------------
 include/linux/hugetlb_contpte.h  | 12 ++++++
 mm/Kconfig                       |  3 ++
 mm/Makefile                      |  1 +
 mm/hugetlb_contpte.c             | 32 ++++++++++++++++
 12 files changed, 161 insertions(+), 128 deletions(-)
 create mode 100644 include/linux/hugetlb_contpte.h
 create mode 100644 mm/hugetlb_contpte.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..5a1e1bc73c15 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -113,6 +113,7 @@ config ARM64
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_WANT_GENERAL_HUGETLB_CONTPTE
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_EXECMEM_LATE
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 07fbf5bf85a7..0604e01dca97 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -13,6 +13,7 @@
 #include <asm/cacheflush.h>
 #include <asm/mte.h>
 #include <asm/page.h>
+#include <linux/hugetlb_contpte.h>
 
 #ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
 #define arch_hugetlb_migration_supported arch_hugetlb_migration_supported
@@ -53,8 +54,6 @@ extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
-#define __HAVE_ARCH_HUGE_PTEP_GET
-extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..af8156929c1d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -420,9 +420,10 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
 	return pfn_pte(pte_pfn(pte) + nr, pte_pgprot(pte));
 }
 
-static inline void __set_ptes(struct mm_struct *mm,
-			      unsigned long __always_unused addr,
-			      pte_t *ptep, pte_t pte, unsigned int nr)
+static inline void ___set_ptes(struct mm_struct *mm,
+			       unsigned long __always_unused addr,
+			       pte_t *ptep, pte_t pte, unsigned int nr,
+			       size_t pgsize)
 {
 	page_table_check_ptes_set(mm, ptep, pte, nr);
 	__sync_cache_and_tags(pte, nr);
@@ -433,10 +434,15 @@ static inline void __set_ptes(struct mm_struct *mm,
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte = pte_advance_pfn(pte, 1);
+		pte = pte_advance_pfn(pte, pgsize >> PAGE_SHIFT);
 	}
 }
 
+#define __set_ptes(mm, addr, ptep, pte, nr)				\
+			___set_ptes(mm, addr, ptep, pte, nr, PAGE_SIZE)
+
+#define set_contptes	___set_ptes
+
 /*
  * Hugetlb definitions.
  */
@@ -1825,6 +1831,49 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+static inline bool __hugetlb_valid_size(unsigned long size)
+{
+	switch (size) {
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SIZE:
+		return pud_sect_supported();
+#endif
+	case CONT_PMD_SIZE:
+	case PMD_SIZE:
+	case CONT_PTE_SIZE:
+		return true;
+	}
+
+	return false;
+}
+
+static inline int arch_contpte_get_num_contig(pte_t *ptep,
+					      unsigned long size,
+					      size_t *pgsize)
+{
+	int contig_ptes = 1;
+
+	if (pgsize)
+		*pgsize = size;
+
+	switch (size) {
+	case CONT_PMD_SIZE:
+		if (pgsize)
+			*pgsize = PMD_SIZE;
+		contig_ptes = CONT_PMDS;
+		break;
+	case CONT_PTE_SIZE:
+		if (pgsize)
+			*pgsize = PAGE_SIZE;
+		contig_ptes = CONT_PTES;
+		break;
+	default:
+		WARN_ON(!__hugetlb_valid_size(size));
+	}
+
+	return contig_ptes;
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index b3a7fafe8892..60a2bb7575c1 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -49,22 +49,6 @@ void __init arm64_hugetlb_cma_reserve(void)
 }
 #endif /* CONFIG_CMA */
 
-static bool __hugetlb_valid_size(unsigned long size)
-{
-	switch (size) {
-#ifndef __PAGETABLE_PMD_FOLDED
-	case PUD_SIZE:
-		return pud_sect_supported();
-#endif
-	case CONT_PMD_SIZE:
-	case PMD_SIZE:
-	case CONT_PTE_SIZE:
-		return true;
-	}
-
-	return false;
-}
-
 #ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
 bool arch_hugetlb_migration_supported(struct hstate *h)
 {
@@ -98,50 +82,6 @@ static int find_num_contig(struct mm_struct *mm, unsigned long addr,
 	return CONT_PTES;
 }
 
-static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
-{
-	int contig_ptes = 1;
-
-	*pgsize = size;
-
-	switch (size) {
-	case CONT_PMD_SIZE:
-		*pgsize = PMD_SIZE;
-		contig_ptes = CONT_PMDS;
-		break;
-	case CONT_PTE_SIZE:
-		*pgsize = PAGE_SIZE;
-		contig_ptes = CONT_PTES;
-		break;
-	default:
-		WARN_ON(!__hugetlb_valid_size(size));
-	}
-
-	return contig_ptes;
-}
-
-pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
-{
-	int ncontig, i;
-	size_t pgsize;
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
-		return orig_pte;
-
-	ncontig = num_contig_ptes(page_size(pte_page(orig_pte)), &pgsize);
-	for (i = 0; i < ncontig; i++, ptep++) {
-		pte_t pte = __ptep_get(ptep);
-
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-	return orig_pte;
-}
-
 /*
  * Changing some bits of contiguous entries requires us to follow a
  * Break-Before-Make approach, breaking the whole contiguous set
@@ -221,7 +161,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	unsigned long pfn, dpfn;
 	pgprot_t hugeprot;
 
-	ncontig = num_contig_ptes(sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
@@ -382,7 +322,7 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	int i, ncontig;
 	size_t pgsize;
 
-	ncontig = num_contig_ptes(sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__pte_clear(mm, addr, ptep);
@@ -394,7 +334,7 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	int ncontig;
 	size_t pgsize;
 
-	ncontig = num_contig_ptes(sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
 }
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..2a5b2a9f2816 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -79,6 +79,7 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
+	select ARCH_WANT_GENERAL_HUGETLB_CONTPTE if RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 446126497768..69393346ade0 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -4,6 +4,9 @@
 
 #include <asm/cacheflush.h>
 #include <asm/page.h>
+#ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB_CONTPTE
+#include <linux/hugetlb_contpte.h>
+#endif
 
 static inline void arch_clear_hugetlb_flags(struct folio *folio)
 {
@@ -44,9 +47,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty);
 
-#define __HAVE_ARCH_HUGE_PTEP_GET
-pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2e62d7e607db..286fe1a32ded 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -296,6 +296,8 @@ static inline unsigned long pte_napot(pte_t pte)
 	return pte_val(pte) & _PAGE_NAPOT;
 }
 
+#define pte_cont		pte_napot
+
 #define pte_valid_napot(pte)	(pte_present(pte) && pte_napot(pte))
 
 /*
@@ -606,6 +608,49 @@ static inline void ___set_ptes(struct mm_struct *mm, unsigned long addr,
 	}
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+/*
+ * Some hugetlb functions can be called on !present ptes, so we must use the
+ * size parameter when it is passed.
+ */
+static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
+					      size_t *pgsize)
+{
+	unsigned long hugepage_shift;
+	pte_t __pte;
+
+	if (size) {
+		if (size >= PGDIR_SIZE)
+			hugepage_shift = PGDIR_SHIFT;
+		else if (size >= P4D_SIZE)
+			hugepage_shift = P4D_SHIFT;
+		else if (size >= PUD_SIZE)
+			hugepage_shift = PUD_SHIFT;
+		else if (size >= PMD_SIZE)
+			hugepage_shift = PMD_SHIFT;
+		else
+			hugepage_shift = PAGE_SHIFT;
+	} else {
+		/*
+		 * We must read the raw value of the pte to get the size of
+		 * the mapping
+		 */
+		__pte = ___ptep_get(ptep);
+
+		/* Make sure __pte is not a swap entry */
+		BUG_ON(!pte_valid_napot(__pte));
+
+		hugepage_shift = PAGE_SHIFT;
+		size = napot_cont_size(napot_cont_order(__pte));
+	}
+
+	if (pgsize)
+		*pgsize = BIT(hugepage_shift);
+
+	return size >> hugepage_shift;
+}
+#endif
+
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 60b7e738b31a..b9eb6b7b214d 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -3,30 +3,6 @@
 #include <linux/err.h>
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
-{
-	unsigned long pte_num;
-	int i;
-	pte_t orig_pte = ptep_get(ptep);
-
-	if (!pte_present(orig_pte) || !pte_napot(orig_pte))
-		return orig_pte;
-
-	pte_num = napot_pte_num(napot_cont_order(orig_pte));
-
-	for (i = 0; i < pte_num; i++, ptep++) {
-		pte_t pte = ptep_get(ptep);
-
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-
-	return orig_pte;
-}
-
 pte_t *huge_pte_alloc(struct mm_struct *mm,
 		      struct vm_area_struct *vma,
 		      unsigned long addr,
@@ -215,26 +191,6 @@ static void clear_flush(struct mm_struct *mm,
 	flush_tlb_range(&vma, saddr, addr);
 }
 
-static int num_contig_ptes_from_size(unsigned long sz, size_t *pgsize)
-{
-	unsigned long hugepage_shift;
-
-	if (sz >= PGDIR_SIZE)
-		hugepage_shift = PGDIR_SHIFT;
-	else if (sz >= P4D_SIZE)
-		hugepage_shift = P4D_SHIFT;
-	else if (sz >= PUD_SIZE)
-		hugepage_shift = PUD_SHIFT;
-	else if (sz >= PMD_SIZE)
-		hugepage_shift = PMD_SHIFT;
-	else
-		hugepage_shift = PAGE_SHIFT;
-
-	*pgsize = 1 << hugepage_shift;
-
-	return sz >> hugepage_shift;
-}
-
 /*
  * When dealing with NAPOT mappings, the privileged specification indicates that
  * "if an update needs to be made, the OS generally should first mark all of the
@@ -252,7 +208,7 @@ void set_huge_pte_at(struct mm_struct *mm,
 	size_t pgsize;
 	int i, pte_num;
 
-	pte_num = num_contig_ptes_from_size(sz, &pgsize);
+	pte_num = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < pte_num; i++, ptep++, addr += pgsize)
@@ -277,15 +233,13 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       int dirty)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	unsigned long order;
 	pte_t orig_pte;
 	int pte_num;
 
 	if (!pte_napot(pte))
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
-	order = napot_cont_order(pte);
-	pte_num = napot_pte_num(order);
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -303,14 +257,13 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr,
 			      pte_t *ptep, unsigned long sz)
 {
-	size_t pgsize;
 	pte_t orig_pte = ptep_get(ptep);
 	int pte_num;
 
 	if (!pte_napot(orig_pte))
 		return ptep_get_and_clear(mm, addr, ptep);
 
-	pte_num = num_contig_ptes_from_size(sz, &pgsize);
+	pte_num = arch_contpte_get_num_contig(ptep, sz, NULL);
 
 	return get_clear_contig(mm, addr, ptep, pte_num);
 }
@@ -320,7 +273,6 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     pte_t *ptep)
 {
 	pte_t pte = ptep_get(ptep);
-	unsigned long order;
 	pte_t orig_pte;
 	int pte_num;
 
@@ -329,8 +281,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		return;
 	}
 
-	order = napot_cont_order(pte);
-	pte_num = napot_pte_num(order);
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
@@ -348,7 +299,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_clear_flush(vma, addr, ptep);
 
-	pte_num = napot_pte_num(napot_cont_order(pte));
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
@@ -367,8 +318,7 @@ void huge_pte_clear(struct mm_struct *mm,
 		return;
 	}
 
-	pte_num = num_contig_ptes_from_size(sz, &pgsize);
-
+	pte_num = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
 		pte_clear(mm, addr, ptep);
 }
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
new file mode 100644
index 000000000000..2ea17e4fe36b
--- /dev/null
+++ b/include/linux/hugetlb_contpte.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Rivos Inc.
+ */
+
+#ifndef _LINUX_HUGETLB_CONTPTE_H
+#define _LINUX_HUGETLB_CONTPTE_H
+
+#define __HAVE_ARCH_HUGE_PTEP_GET
+extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
+
+#endif /* _LINUX_HUGETLB_CONTPTE_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 1b501db06417..f9d3f3d49f3e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -853,6 +853,9 @@ config NOMMU_INITIAL_TRIM_EXCESS
 config ARCH_WANT_GENERAL_HUGETLB
 	bool
 
+config ARCH_WANT_GENERAL_HUGETLB_CONTPTE
+	bool
+
 config ARCH_WANTS_THP_SWAP
 	def_bool n
 
diff --git a/mm/Makefile b/mm/Makefile
index 850386a67b3e..76e8b995f551 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_MIGRATION) += migrate.o
 obj-$(CONFIG_NUMA) += memory-tiers.o
 obj-$(CONFIG_DEVICE_MIGRATION) += migrate_device.o
 obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += huge_memory.o khugepaged.o
+obj-$(CONFIG_ARCH_WANT_GENERAL_HUGETLB_CONTPTE) += hugetlb_contpte.o
 obj-$(CONFIG_PAGE_COUNTER) += page_counter.o
 obj-$(CONFIG_MEMCG_V1) += memcontrol-v1.o
 obj-$(CONFIG_MEMCG) += memcontrol.o vmpressure.o
diff --git a/mm/hugetlb_contpte.c b/mm/hugetlb_contpte.c
new file mode 100644
index 000000000000..500d0b96a680
--- /dev/null
+++ b/mm/hugetlb_contpte.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Rivos Inc.
+ */
+
+#include <linux/pgtable.h>
+#include <linux/mm.h>
+#include <linux/hugetlb.h>
+
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+	int ncontig, i;
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
+		return orig_pte;
+
+	ncontig = arch_contpte_get_num_contig(ptep,
+					      page_size(pte_page(orig_pte)),
+					      NULL);
+
+	for (i = 0; i < ncontig; i++, ptep++) {
+		pte_t pte = __ptep_get(ptep);
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+	return orig_pte;
+}
-- 
2.39.2


