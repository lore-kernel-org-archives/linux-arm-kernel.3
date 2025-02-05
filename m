Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA729C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo0qgLaUDpVDO+Osvp+LrXOW2iS80qEjSY2xlQTPbVI=; b=zz11ez4lrmOKenbmpl54cm4ytJ
	MBSI/FHOpx1vE5G+/mWgSXXVzo0wmavOlyMKev8LkaBRkOgA5W/dSVGePeHTkdkGwlKXhMpNID+o4
	OQdSA/7OwtDRmrP14F2LKJ4l0fr/KWo/QVBA5XbD1sWEDk98Qs99g6tvAAtZl3euuynGQocH4/fob
	hzvrHCf3YHjBfR8EQman/p4g/4noeGLgwfag1ouoU5UIySQbzcHJwPe8btMolfVaD2Vivlmplxazs
	RiQ0jtnAiOTGOOEmTWc4N4W56g/HRPuCAQNONdVYbLqt8kHto5E8GKKlnLjy3CMODGaBsVhzi3ec8
	42sGcVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh9b-00000003jSc-2PRX;
	Wed, 05 Feb 2025 15:17:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfh30-00000003i9P-3iNL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:10:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DD511515;
	Wed,  5 Feb 2025 07:11:02 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11E403F5A1;
	Wed,  5 Feb 2025 07:10:35 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/16] arm64: hugetlb: Refine tlb maintenance scope
Date: Wed,  5 Feb 2025 15:09:44 +0000
Message-ID: <20250205151003.88959-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205151003.88959-1-ryan.roberts@arm.com>
References: <20250205151003.88959-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_071039_018342_15C4DE65 
X-CRM114-Status: GOOD (  15.51  )
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

When operating on contiguous blocks of ptes (or pmds) for some hugetlb
sizes, we must honour break-before-make requirements and clear down the
block to invalid state in the pgtable then invalidate the relevant tlb
entries before making the pgtable entries valid again.

However, the tlb maintenance is currently always done assuming the worst
case stride (PAGE_SIZE), last_level (false) and tlb_level
(TLBI_TTL_UNKNOWN). We can do much better with the hinting; In reality,
we know the stride from the huge_pte pgsize, we are always operating
only on the last level, and we always know the tlb_level, again based on
pgsize. So let's start providing these hints.

Additionally, avoid tlb maintenace in set_huge_pte_at().
Break-before-make is only required if we are transitioning the
contiguous pte block from valid -> valid. So let's elide the
clear-and-flush ("break") if the pte range was previously invalid.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/hugetlb.h | 29 +++++++++++++++++++----------
 arch/arm64/mm/hugetlbpage.c      |  9 ++++++---
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 8ab9542d2d22..c38f2944c20d 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -69,27 +69,36 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 
 #include <asm-generic/hugetlb.h>
 
-#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
-static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
-					   unsigned long start,
-					   unsigned long end)
+static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
+					     unsigned long start,
+					     unsigned long end,
+					     unsigned long stride,
+					     bool last_level)
 {
-	unsigned long stride = huge_page_size(hstate_vma(vma));
-
 	switch (stride) {
 	case PUD_SIZE:
-		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
+		__flush_tlb_range(vma, start, end, PUD_SIZE, last_level, 1);
 		break;
 	case CONT_PMD_SIZE:
 	case PMD_SIZE:
-		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
+		__flush_tlb_range(vma, start, end, PMD_SIZE, last_level, 2);
 		break;
 	case CONT_PTE_SIZE:
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, 3);
 		break;
 	default:
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, TLBI_TTL_UNKNOWN);
 	}
 }
 
+#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
+static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
+					   unsigned long start,
+					   unsigned long end)
+{
+	unsigned long stride = huge_page_size(hstate_vma(vma));
+
+	__flush_hugetlb_tlb_range(vma, start, end, stride, false);
+}
+
 #endif /* __ASM_HUGETLB_H */
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 328eec4bfe55..e870d01d12ea 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -190,8 +190,9 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
 {
 	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
 	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
+	unsigned long end = addr + (pgsize * ncontig);
 
-	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
+	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, true);
 	return orig_pte;
 }
 
@@ -216,7 +217,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear(mm, addr, ptep);
 
-	flush_tlb_range(&vma, saddr, addr);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
@@ -245,7 +246,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	dpfn = pgsize >> PAGE_SHIFT;
 	hugeprot = pte_pgprot(pte);
 
-	clear_flush(mm, addr, ptep, pgsize, ncontig);
+	/* Only need to "break" if transitioning valid -> valid. */
+	if (pte_valid(__ptep_get(ptep)))
+		clear_flush(mm, addr, ptep, pgsize, ncontig);
 
 	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
 		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
-- 
2.43.0


