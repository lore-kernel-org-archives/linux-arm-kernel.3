Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92334C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hD2CUq82ftY/OYVnYF6TvjfIYmmKPNtqA8Ta04bd8IQ=; b=J76sfeUw+RRFmfuDXdDp6XMP26
	hdMdK9hKLXu5iJaatLSfFt+7/AgnXALyxrYVuTsbu49H7zZMnX5iG0HLU36UI5h4bC53VMmYpMFXL
	mwBo6S9wXWMseFdFRjhHff/hMY9tTGBRZvjDJz3dqdD9hZFKn4gS1z3VYfXlg/ODQ2zKjDHBkA8mc
	oT6wWUGyO+DWUrW2F2AdbfHKTVwKyK2lSHpDUPYVoIjpUz11rreQQbfbpMb01rLjPmre5Bhk0FD1V
	s9TDUKW9gHV8Cp+YshnpaUXMC4uhmXQLIZN6OKPONcFW1yKMHEbnx9fAxrhwPgwNKFR/9IvMEhx97
	ZClskpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Ge-00000006PUm-04xR;
	Tue, 22 Apr 2025 08:46:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78qB-00000006Gjf-1hb4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:18:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64F7A152B;
	Tue, 22 Apr 2025 01:18:45 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F893F66E;
	Tue, 22 Apr 2025 01:18:47 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/11] arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
Date: Tue, 22 Apr 2025 09:18:12 +0100
Message-ID: <20250422081822.1836315-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422081822.1836315-1-ryan.roberts@arm.com>
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_011851_526497_B2C00AB5 
X-CRM114-Status: GOOD (  15.35  )
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

Refactor __set_ptes(), set_pmd_at() and set_pud_at() so that they are
all a thin wrapper around a new common __set_ptes_anysz(), which takes
pgsize parameter. Additionally, refactor __ptep_get_and_clear() and
pmdp_huge_get_and_clear() to use a new common
__ptep_get_and_clear_anysz() which also takes a pgsize parameter.

These changes will permit the huge_pte API to efficiently batch-set
pgtable entries and take advantage of the future barrier optimizations.
Additionally since the new *_anysz() helpers call the correct
page_table_check_*_set() API based on pgsize, this means that huge_ptes
will be able to get proper coverage. Currently the huge_pte API always
uses the pte API which assumes an entry only covers a single page.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 114 ++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..d80aa9ba0a16 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -423,23 +423,6 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
 	return pfn_pte(pte_pfn(pte) + nr, pte_pgprot(pte));
 }
 
-static inline void __set_ptes(struct mm_struct *mm,
-			      unsigned long __always_unused addr,
-			      pte_t *ptep, pte_t pte, unsigned int nr)
-{
-	page_table_check_ptes_set(mm, ptep, pte, nr);
-	__sync_cache_and_tags(pte, nr);
-
-	for (;;) {
-		__check_safe_pte_update(mm, ptep, pte);
-		__set_pte(ptep, pte);
-		if (--nr == 0)
-			break;
-		ptep++;
-		pte = pte_advance_pfn(pte, 1);
-	}
-}
-
 /*
  * Hugetlb definitions.
  */
@@ -649,30 +632,62 @@ static inline pgprot_t pud_pgprot(pud_t pud)
 	return __pgprot(pud_val(pfn_pud(pfn, __pgprot(0))) ^ pud_val(pud));
 }
 
-static inline void __set_pte_at(struct mm_struct *mm,
-				unsigned long __always_unused addr,
-				pte_t *ptep, pte_t pte, unsigned int nr)
+static inline void __set_ptes_anysz(struct mm_struct *mm, pte_t *ptep,
+				    pte_t pte, unsigned int nr,
+				    unsigned long pgsize)
 {
-	__sync_cache_and_tags(pte, nr);
-	__check_safe_pte_update(mm, ptep, pte);
-	__set_pte(ptep, pte);
+	unsigned long stride = pgsize >> PAGE_SHIFT;
+
+	switch (pgsize) {
+	case PAGE_SIZE:
+		page_table_check_ptes_set(mm, ptep, pte, nr);
+		break;
+	case PMD_SIZE:
+		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
+		break;
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SIZE:
+		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
+		break;
+#endif
+	default:
+		VM_WARN_ON(1);
+	}
+
+	__sync_cache_and_tags(pte, nr * stride);
+
+	for (;;) {
+		__check_safe_pte_update(mm, ptep, pte);
+		__set_pte(ptep, pte);
+		if (--nr == 0)
+			break;
+		ptep++;
+		pte = pte_advance_pfn(pte, stride);
+	}
+}
+
+static inline void __set_ptes(struct mm_struct *mm,
+			      unsigned long __always_unused addr,
+			      pte_t *ptep, pte_t pte, unsigned int nr)
+{
+	__set_ptes_anysz(mm, ptep, pte, nr, PAGE_SIZE);
 }
 
-static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
-			      pmd_t *pmdp, pmd_t pmd)
+static inline void __set_pmds(struct mm_struct *mm,
+			      unsigned long __always_unused addr,
+			      pmd_t *pmdp, pmd_t pmd, unsigned int nr)
 {
-	page_table_check_pmd_set(mm, pmdp, pmd);
-	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd),
-						PMD_SIZE >> PAGE_SHIFT);
+	__set_ptes_anysz(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
 }
+#define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, 1)
 
-static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
-			      pud_t *pudp, pud_t pud)
+static inline void __set_puds(struct mm_struct *mm,
+			      unsigned long __always_unused addr,
+			      pud_t *pudp, pud_t pud, unsigned int nr)
 {
-	page_table_check_pud_set(mm, pudp, pud);
-	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
-						PUD_SIZE >> PAGE_SHIFT);
+	__set_ptes_anysz(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
 }
+#define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, 1)
 
 #define __p4d_to_phys(p4d)	__pte_to_phys(p4d_pte(p4d))
 #define __phys_to_p4d_val(phys)	__phys_to_pte_val(phys)
@@ -1301,16 +1316,37 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 
-static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
+					       pte_t *ptep,
+					       unsigned long pgsize)
 {
 	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
 
-	page_table_check_pte_clear(mm, pte);
+	switch (pgsize) {
+	case PAGE_SIZE:
+		page_table_check_pte_clear(mm, pte);
+		break;
+	case PMD_SIZE:
+		page_table_check_pmd_clear(mm, pte_pmd(pte));
+		break;
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SIZE:
+		page_table_check_pud_clear(mm, pte_pud(pte));
+		break;
+#endif
+	default:
+		VM_WARN_ON(1);
+	}
 
 	return pte;
 }
 
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+				       unsigned long address, pte_t *ptep)
+{
+	return __ptep_get_and_clear_anysz(mm, ptep, PAGE_SIZE);
+}
+
 static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full)
 {
@@ -1347,11 +1383,7 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long address, pmd_t *pmdp)
 {
-	pmd_t pmd = __pmd(xchg_relaxed(&pmd_val(*pmdp), 0));
-
-	page_table_check_pmd_clear(mm, pmd);
-
-	return pmd;
+	return pte_pmd(__ptep_get_and_clear_anysz(mm, (pte_t *)pmdp, PMD_SIZE));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-- 
2.43.0


