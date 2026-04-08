Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CDAFF513A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfEJGQkOg2o3WNMaKGJLy2ouK5PnZENAR6Z2/gFdBJs=; b=XjoZd4fioKQ+nQ1Fy09pxMJx+p
	l/a6URryOUGbC2qn/6QEOZIzZSmK1PQvZzCIfV6HjSU7TP5IhnGX4WK0Ajw/HgQ8xgiAuEBy1FwAt
	g9UO1Uj9MJtr2XorQ5pyfQJK/VWKaHhJKqu6RHPnqD6Jdk77UsQzvBETBL9Bsoqiq5TAYT3zF8yEa
	Ge2fR4p7MN5IsFlmxE7qvYU0ZgOPQxi///v4jJ3uF6Pr4CWOds6DEg5DbCZqjmQlp556MYV5k67VS
	44pxUEmxbEFLHBilE4uLla9O/J0QbzVXYCa0/yaeDTuPmhHEOd4FyEk+zlCpRtUuhnyxNsi5s2keH
	YKDFzi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ16-000000089Bj-3pgl;
	Wed, 08 Apr 2026 02:51:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJ15-000000089B6-0q8M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A18DA60138;
	Wed,  8 Apr 2026 02:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9872CC116C6;
	Wed,  8 Apr 2026 02:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775616702;
	bh=vLbaLx4OjOo4lPW5G2eyteG1jD4WkqeXjsMrkMJ13sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNKTa01piFnudi3PShsKsr4fjMQhJQweXnRAGNJInS81yIwQ0/WNgLRLHXzOtXi8T
	 +f+GOdgecQ0+UKlxiWWECMDV6AUIMrOdtUAbRrZ7XLxpMMytszyB7FQGlte8tETF4+
	 37ds6U1eurtYjfkcH5ysxGsB+MTLyUhUkScCx83nAspwbJq7IHGUtbRm6ymsgtTQ2W
	 y5twO6kfteIv78kJHPd210N2a3N7djdUf/DP/9MR0beotXu2yYaDv3ZdIHd8CqabmW
	 /DDW1p9LILJ1vaNB0SYFBXpPz+kxV0UbcWu61Wwq3vqyDsoHTLvM/ZVT1a/qKGGsBs
	 p2tOBr9D8GzzQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	ajd@linux.ibm.com,
	rppt@kernel.org,
	david@kernel.org,
	Xueyuan.chen21@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH 3/8] mm/vmalloc: Extend vmap_small_pages_range_noflush() to support larger page_shift sizes
Date: Wed,  8 Apr 2026 10:51:10 +0800
Message-Id: <20260408025115.27368-4-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260408025115.27368-1-baohua@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
MIME-Version: 1.0
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

vmap_small_pages_range_noflush() provides a clean interface by taking
struct page **pages and mapping them via direct PTE iteration. This
avoids the page table zigzag seen when using
vmap_range_noflush() for page_shift values other than PAGE_SHIFT.

Extend it to support larger page_shift values, and add PMD- and
contiguous-PTE mappings as well.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmalloc.c | 54 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 57eae99d9909..5bf072297536 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -524,8 +524,9 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned int steps = 1;
 	int err = 0;
 	pte_t *pte;
 
@@ -543,6 +544,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 	do {
 		struct page *page = pages[*nr];
 
+		steps = 1;
 		if (WARN_ON(!pte_none(ptep_get(pte)))) {
 			err = -EBUSY;
 			break;
@@ -556,9 +558,24 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			break;
 		}
 
+#ifdef CONFIG_HUGETLB_PAGE
+		if (shift != PAGE_SHIFT) {
+			unsigned long pfn = page_to_pfn(page), size;
+
+			size = arch_vmap_pte_range_map_size(addr, end, pfn, shift);
+			if (size != PAGE_SIZE) {
+				steps = size >> PAGE_SHIFT;
+				pte_t entry = pfn_pte(pfn, prot);
+
+				entry = arch_make_huge_pte(entry, ilog2(size), 0);
+				set_huge_pte_at(&init_mm, addr, pte, entry, size);
+				continue;
+			}
+		}
+#endif
+
 		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
-		(*nr)++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += steps, *nr += steps, addr += PAGE_SIZE * steps, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -568,7 +585,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -578,7 +595,20 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
+
+		if (shift == PMD_SHIFT) {
+			struct page *page = pages[*nr];
+			phys_addr_t phys_addr = page_to_phys(page);
+
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
+						shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1 << (shift - PAGE_SHIFT);
+				continue;
+			}
+		}
+
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
@@ -586,7 +616,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -596,7 +626,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
@@ -604,7 +634,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -614,14 +644,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
+		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
 			return -ENOMEM;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -636,7 +666,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -665,7 +695,7 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
 			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+		return vmap_small_pages_range_noflush(addr, end, prot, pages, PAGE_SHIFT);
 
 	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
 		int err;
-- 
2.39.3 (Apple Git-146)


