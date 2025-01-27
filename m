Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816F9C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgdyYq7XD2Yilje0JoNAbIWlWrTDbtDHltbsUNmCh+Y=; b=ZhwBosHNDuNjgh657S5Givu1Iz
	rzQ0manVjh02LrwuZnh2F5eAsTsdaSmcrysyhw8N/cogx4aMrdLcIkEV/5NRPGNemEcTcvGvoAcPL
	h8qkdMQ9QT+gsdecUXeMhYgkVMyPxXUVVCWPX356q5nQUB+5UANR+Hgq83Hwc9sI84t5ey5nxup4n
	j9iCWfqmicICd9ZqjfOosC14aPjX/d2E716oGIeMHmW6ubWH/rM+y2jrNUueSuaAwP+Qniqo7YSsU
	jjgqk/q8Zjp0sLXGkh718n6LqGi5gqAuTPR89KifcyiwgqslFDtLVj6YEvRcpv1Y5NHI2ucSmgQHO
	FoDPBQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLbx-000000022Og-1PtX;
	Mon, 27 Jan 2025 09:40:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLZt-000000021kp-2xO2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:38:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3701772f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970724; x=1738575524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgdyYq7XD2Yilje0JoNAbIWlWrTDbtDHltbsUNmCh+Y=;
        b=vyREzZY/83tfkPxoEZaN+E9zAcnIut7/dp6ET7Dk9u4upgWRJ7y7BeR6yZjEdj5stD
         VRX0vp9fGVPHEWwS7QeXBtuvEK0QbMfQjMi1E2tXGQjSq7MD5l1oVP3xu4AhX0M8OZtD
         LH8bfJxYwt/+/lxbvPNvql+OlwtYdH1cu1qRAvcfMET/9JaC/AwmcOqvZ8N4vRg1JIIa
         XUR4hKPl6zsQOb/P8qVw+uU6VyM6VtrFL7IDOx7gGrv4Qg5E6X0PzRF49ahyGYL+nmQ/
         qo1jlEtocAFOc1pdtsuHo0CYQGY669WwTyLCcIG56YDj3CuQckadmeT9stitZWBqAl0B
         RebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970724; x=1738575524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgdyYq7XD2Yilje0JoNAbIWlWrTDbtDHltbsUNmCh+Y=;
        b=Su9h9XwgH1luCspKmE2K8RTSSNwssd4ERIuQ8J6jvSRBcJbATiXMABgXh6mRvjWKA5
         D7bA23sVCqv0h5OKK337n9rkBXmrUv8XrB86wSAuGiTuUVcbtQMEjwPADpDGT+29o9sR
         G3PgqUB8jd2fweC+u8uQFRiCUjL70Jj3vDVTKhrQ7kuIshefXKtTmDwVMFl6YWBzshzE
         GqXBiUoxNzWlfouJBS/V1xTEW0+xdWS1xKGuY5pdFdhbO5r1Gkp+872iXRwXeL4PqfGs
         MU8nHJMShVXsFHGJe6E09Elwhw3EBkr/vwQBuuaxKCnZanYV/QZ1grdrHvvTZV9j+IjR
         0F7w==
X-Forwarded-Encrypted: i=1; AJvYcCVMn76FQQoiqrTViAYlSLgh65jIa7NQ6J3mVS/wEhVWRqhOS2USfg2APQoINL0Fgyi/EZG3fwuAtCcGcLxtVJ5c@lists.infradead.org
X-Gm-Message-State: AOJu0YytuqC1vc8c6EH3bEAil6oPN+xIrbl6ZaFf4JdptqUjAK9ZbLoI
	ptkfsyCo1Jj2KyH0LhWkfsJqrRvxfCe4Z6stNnVbu8KQfPBs+aPFu25qtMITCqI=
X-Gm-Gg: ASbGncsU1jHrpwfNpGBa+Yq0bb0WyFdEPHOgwSrgJDzIN3yqIAZCw0u5kgoAyUN+kn8
	4dqu+vAKtdiJyuNF10ikjs14WQ7o4iSK/fNRoGchQdkE5pbxV6luq8iAoraRcs/ghqoIoEfvfF3
	w2+dlpY9o6F8kCaB4Ml6/LrTfeUnwsbG4Y4sUfLcg8w+aoLDGcioOV4pf9kcgNKgIeHiQdW42H/
	dRjsy/oZV/NA+PmIDKfmByyBdXh6KSRExj2fSMatsN98dlceAYqME7yzzgzyjm3yLrwuKa13Yan
	ScenIN3wS8u08AAuoMstrER/lFi9nhA=
X-Google-Smtp-Source: AGHT+IHF4Wz5gcDgdKwuRpBVbD6zHBbXFDhSzsPT6V4k0QqTqrpmiB0ymgyz8XwZE3Dv5j9kSPHaVA==
X-Received: by 2002:a5d:4312:0:b0:388:e377:8a1b with SMTP id ffacd0b85a97d-38bf57950eemr28290614f8f.28.1737970724282;
        Mon, 27 Jan 2025 01:38:44 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf65sm10687893f8f.64.2025.01.27.01.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:38:43 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 3/9] mm: Use common huge_ptep_get() function for riscv/arm64
Date: Mon, 27 Jan 2025 10:35:24 +0100
Message-Id: <20250127093530.19548-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013845_855734_CF5DB716 
X-CRM114-Status: GOOD (  24.89  )
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
 arch/arm64/include/asm/pgtable.h | 48 +++++++++++++++++++++++++---
 arch/arm64/mm/hugetlbpage.c      | 55 ++------------------------------
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/hugetlb.h |  6 ++--
 arch/riscv/include/asm/pgtable.h | 36 +++++++++++++++++++++
 arch/riscv/mm/hugetlbpage.c      | 45 ++++++--------------------
 include/linux/hugetlb_contpte.h  | 12 +++++++
 mm/Kconfig                       |  3 ++
 mm/Makefile                      |  1 +
 mm/hugetlb_contpte.c             | 44 +++++++++++++++++++++++++
 12 files changed, 157 insertions(+), 98 deletions(-)
 create mode 100644 include/linux/hugetlb_contpte.h
 create mode 100644 mm/hugetlb_contpte.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5..fb85d33bfe98 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -111,6 +111,7 @@ config ARM64
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_WANT_GENERAL_HUGETLB_CONTPTE
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index c6dff3e69539..27d7f4bdd724 100644
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
index 6986345b537a..cebbfcfb0e53 100644
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
@@ -1825,6 +1831,40 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+static inline int arch_contpte_get_num_contig(pte_t *ptep,
+					      unsigned long size,
+					      size_t *pgsize)
+{
+	int contig_ptes = 0;
+
+	if (pgsize)
+		*pgsize = size;
+
+	switch (size) {
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SIZE:
+		if (pud_sect_supported())
+			contig_ptes = 1;
+		break;
+#endif
+	case PMD_SIZE:
+		contig_ptes = 1;
+		break;
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
+	}
+
+	return contig_ptes;
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 3215adf48a1b..3458461adb90 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -98,57 +98,6 @@ static int find_num_contig(struct mm_struct *mm, unsigned long addr,
 	return CONT_PTES;
 }
 
-static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
-{
-	int contig_ptes = 0;
-
-	*pgsize = size;
-
-	switch (size) {
-#ifndef __PAGETABLE_PMD_FOLDED
-	case PUD_SIZE:
-		if (pud_sect_supported())
-			contig_ptes = 1;
-		break;
-#endif
-	case PMD_SIZE:
-		contig_ptes = 1;
-		break;
-	case CONT_PMD_SIZE:
-		*pgsize = PMD_SIZE;
-		contig_ptes = CONT_PMDS;
-		break;
-	case CONT_PTE_SIZE:
-		*pgsize = PAGE_SIZE;
-		contig_ptes = CONT_PTES;
-		break;
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
@@ -229,7 +178,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	unsigned long pfn, dpfn;
 	pgprot_t hugeprot;
 
-	ncontig = num_contig_ptes(sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 
 	if (!pte_present(pte)) {
 		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
@@ -390,7 +339,7 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 	int i, ncontig;
 	size_t pgsize;
 
-	ncontig = num_contig_ptes(sz, &pgsize);
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
 
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__pte_clear(mm, addr, ptep);
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..2fe8c68fba85 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -78,6 +78,7 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
+	select ARCH_WANT_GENERAL_HUGETLB_CONTPTE if RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index faf3624d8057..d9f9bfb84908 100644
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
@@ -43,9 +46,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty);
 
-#define __HAVE_ARCH_HUGE_PTEP_GET
-pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
-
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 82b264423b25..d4e6427b8ca9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -296,6 +296,8 @@ static inline unsigned long pte_napot(pte_t pte)
 	return pte_val(pte) & _PAGE_NAPOT;
 }
 
+#define pte_cont		pte_napot
+
 #define pte_valid_napot(pte)	(pte_present(pte) && pte_napot(pte))
 
 static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
@@ -587,6 +589,38 @@ static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
 	}
 }
 
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+static inline int arch_contpte_get_num_contig(pte_t *ptep, unsigned long size,
+					      size_t *pgsize)
+{
+	unsigned long hugepage_shift;
+	pte_t __pte;
+
+	if (size >= PGDIR_SIZE)
+		hugepage_shift = PGDIR_SHIFT;
+	else if (size >= P4D_SIZE)
+		hugepage_shift = P4D_SHIFT;
+	else if (size >= PUD_SIZE)
+		hugepage_shift = PUD_SHIFT;
+	else if (size >= PMD_SIZE)
+		hugepage_shift = PMD_SHIFT;
+	else
+		hugepage_shift = PAGE_SHIFT;
+
+	if (pgsize)
+		*pgsize = BIT(hugepage_shift);
+
+	/* We must read the raw value of the pte to get the size of the mapping */
+	__pte = __ptep_get(ptep);
+
+	/* Make sure __pte is not a swap entry */
+	if (pte_valid_napot(__pte))
+		return napot_pte_num(napot_cont_order(__pte));
+
+	return size >> hugepage_shift;
+}
+#endif
+
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
 {
@@ -671,6 +705,8 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 	__set_ptes(mm, addr, ptep, pteval, nr);
 }
 #define set_ptes			set_ptes
+#define set_contptes(mm, addr, ptep, pte, nr, pgsize)			\
+			set_ptes(mm, addr, ptep, pte, nr)
 
 static inline pte_t ptep_get(pte_t *ptep)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 59ed26ce6857..d51863824540 100644
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
@@ -266,15 +242,13 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       int dirty)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	unsigned long order;
 	pte_t orig_pte;
-	int i, pte_num;
+	int pte_num;
 
 	if (!pte_napot(pte))
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
-	order = napot_cont_order(pte);
-	pte_num = napot_pte_num(order);
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -298,7 +272,7 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 	if (!pte_napot(orig_pte))
 		return ptep_get_and_clear(mm, addr, ptep);
 
-	pte_num = napot_pte_num(napot_cont_order(orig_pte));
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 
 	return get_clear_contig(mm, addr, ptep, pte_num);
 }
@@ -308,17 +282,15 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     pte_t *ptep)
 {
 	pte_t pte = ptep_get(ptep);
-	unsigned long order;
 	pte_t orig_pte;
-	int i, pte_num;
+	int pte_num;
 
 	if (!pte_napot(pte)) {
 		ptep_set_wrprotect(mm, addr, ptep);
 		return;
 	}
 
-	order = napot_cont_order(pte);
-	pte_num = napot_pte_num(order);
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
@@ -336,7 +308,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	if (!pte_napot(pte))
 		return ptep_clear_flush(vma, addr, ptep);
 
-	pte_num = napot_pte_num(napot_cont_order(pte));
+	pte_num = arch_contpte_get_num_contig(ptep, 0, NULL);
 
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
@@ -346,6 +318,7 @@ void huge_pte_clear(struct mm_struct *mm,
 		    pte_t *ptep,
 		    unsigned long sz)
 {
+	size_t pgsize;
 	pte_t pte = ptep_get(ptep);
 	int i, pte_num;
 
@@ -354,8 +327,8 @@ void huge_pte_clear(struct mm_struct *mm,
 		return;
 	}
 
-	pte_num = napot_pte_num(napot_cont_order(pte));
-	for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
+	pte_num = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
 		pte_clear(mm, addr, ptep);
 }
 
diff --git a/include/linux/hugetlb_contpte.h b/include/linux/hugetlb_contpte.h
new file mode 100644
index 000000000000..ec4189cd65b8
--- /dev/null
+++ b/include/linux/hugetlb_contpte.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Rivos Inc.
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
index 84000b016808..8cd38de612ce 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -810,6 +810,9 @@ config NOMMU_INITIAL_TRIM_EXCESS
 config ARCH_WANT_GENERAL_HUGETLB
 	bool
 
+config ARCH_WANT_GENERAL_HUGETLB_CONTPTE
+	bool
+
 config ARCH_WANTS_THP_SWAP
 	def_bool n
 
diff --git a/mm/Makefile b/mm/Makefile
index dba52bb0da8a..1c1250fbb020 100644
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
index 000000000000..a03e91d3efb1
--- /dev/null
+++ b/mm/hugetlb_contpte.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Rivos Inc.
+ */
+
+#include <linux/pgtable.h>
+#include <linux/mm.h>
+#include <linux/hugetlb.h>
+
+/*
+ * Any arch that wants to use that needs to define:
+ *   - __ptep_get()
+ *   - pte_cont()
+ *   - arch_contpte_get_num_contig()
+ */
+
+/*
+ * This file implements the following contpte aware API:
+ *   - huge_ptep_get()
+ */
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


