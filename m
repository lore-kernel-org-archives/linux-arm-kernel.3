Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFC3D5C0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44tXZxyJfffYFvudW/Nw6ajonTz5Eom4JLi8h6SqM6c=; b=C1xikyXXSwfACNyed/eEZY5BK9
	oTvY8ZXBUyJVDVtPboAsqSQ0TqPyuBpfrPxTaRiCQ5i/lsYylbrwfgn7JxeFfhV6Fa37NgQ6C0Hmc
	eB8BI1GBO4uASoh112W/e0IYIxRid7LUh2zN7VYwk3OMjJqq3IdTYPKZn2NbPq/aq7h7iLwunPKtq
	nx2ZrliwIoyQX0cjlsG7hzLQSt43O1xO3KlyeZdCRnHl/VTqRs/eF8FZdCXmtdgfip+YUTLmfBGjK
	kXrAIjS4X0M+BUu6UzlkFh+kRBP5zyxqvjOaMpYKErXIFJ36vuLMSK1SaRWuC+HFJaXgck00fHLxk
	zzoiTeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWK1-00000005MwJ-2wMB;
	Tue, 16 Dec 2025 14:46:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJp-00000005MkB-1BwO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:46:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F2491682;
	Tue, 16 Dec 2025 06:46:21 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99463F73F;
	Tue, 16 Dec 2025 06:46:26 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/13] arm64: mm: Refactor __flush_tlb_range() to take flags
Date: Tue, 16 Dec 2025 14:45:55 +0000
Message-ID: <20251216144601.2106412-11-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216144601.2106412-1-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064630_250148_68EFC0A6 
X-CRM114-Status: GOOD (  20.53  )
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

We have function variants with "_nosync", "_local", "_nonotify" as well
as the "last_level" parameter. Let's generalize and simplify by using a
flags parameter to encode all these variants.

As a first step, convert the "last_level" boolean parameter to a flags
parameter and create the first flag, TLBF_NOWALKCACHE. When present,
walk cache entries are not evicted, which is the same as the old
last_level=true.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/hugetlb.h  | 12 ++++++------
 arch/arm64/include/asm/pgtable.h  |  4 ++--
 arch/arm64/include/asm/tlb.h      |  6 +++---
 arch/arm64/include/asm/tlbflush.h | 28 ++++++++++++++++------------
 arch/arm64/mm/contpte.c           |  5 +++--
 arch/arm64/mm/hugetlbpage.c       |  4 ++--
 arch/arm64/mm/mmu.c               |  2 +-
 7 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 44c1f757bfcf..04af9499faf2 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -73,23 +73,23 @@ static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 					     unsigned long start,
 					     unsigned long end,
 					     unsigned long stride,
-					     bool last_level)
+					     tlbf_t flags)
 {
 	switch (stride) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		__flush_tlb_range(vma, start, end, PUD_SIZE, last_level, 1);
+		__flush_tlb_range(vma, start, end, PUD_SIZE, 1, flags);
 		break;
 #endif
 	case CONT_PMD_SIZE:
 	case PMD_SIZE:
-		__flush_tlb_range(vma, start, end, PMD_SIZE, last_level, 2);
+		__flush_tlb_range(vma, start, end, PMD_SIZE, 2, flags);
 		break;
 	case CONT_PTE_SIZE:
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, 3);
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, 3, flags);
 		break;
 	default:
-		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, TLBI_TTL_UNKNOWN);
+		__flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN, flags);
 	}
 }
 
@@ -100,7 +100,7 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 {
 	unsigned long stride = huge_page_size(hstate_vma(vma));
 
-	__flush_hugetlb_tlb_range(vma, start, end, stride, false);
+	__flush_hugetlb_tlb_range(vma, start, end, stride, TLBF_NONE);
 }
 
 #endif /* __ASM_HUGETLB_H */
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 64d5f1d9cce9..736747fbc843 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -124,9 +124,9 @@ static inline void arch_leave_lazy_mmu_mode(void)
 
 /* Set stride and tlb_level in flush_*_tlb_range */
 #define flush_pmd_tlb_range(vma, addr, end)	\
-	__flush_tlb_range(vma, addr, end, PMD_SIZE, false, 2)
+	__flush_tlb_range(vma, addr, end, PMD_SIZE, 2, TLBF_NONE)
 #define flush_pud_tlb_range(vma, addr, end)	\
-	__flush_tlb_range(vma, addr, end, PUD_SIZE, false, 1)
+	__flush_tlb_range(vma, addr, end, PUD_SIZE, 1, TLBF_NONE)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 8d762607285c..10869d7731b8 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -53,7 +53,7 @@ static inline int tlb_get_level(struct mmu_gather *tlb)
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	struct vm_area_struct vma = TLB_FLUSH_VMA(tlb->mm, 0);
-	bool last_level = !tlb->freed_tables;
+	tlbf_t flags = tlb->freed_tables ? TLBF_NONE : TLBF_NOWALKCACHE;
 	unsigned long stride = tlb_get_unmap_size(tlb);
 	int tlb_level = tlb_get_level(tlb);
 
@@ -63,13 +63,13 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	 * reallocate our ASID without invalidating the entire TLB.
 	 */
 	if (tlb->fullmm) {
-		if (!last_level)
+		if (tlb->freed_tables)
 			flush_tlb_mm(tlb->mm);
 		return;
 	}
 
 	__flush_tlb_range(&vma, tlb->start, tlb->end, stride,
-			  last_level, tlb_level);
+			  tlb_level, flags);
 }
 
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 37c782ddc149..9a37a6a014dc 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -267,16 +267,16 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
  *		CPUs, ensuring that any walk-cache entries associated with the
  *		translation are also invalidated.
  *
- *	__flush_tlb_range(vma, start, end, stride, last_level, tlb_level)
+ *	__flush_tlb_range(vma, start, end, stride, last_level, tlb_level, flags)
  *		Invalidate the virtual-address range '[start, end)' on all
  *		CPUs for the user address space corresponding to 'vma->mm'.
  *		The invalidation operations are issued at a granularity
- *		determined by 'stride' and only affect any walk-cache entries
- *		if 'last_level' is equal to false. tlb_level is the level at
+ *		determined by 'stride'. tlb_level is the level at
  *		which the invalidation must take place. If the level is wrong,
  *		no invalidation may take place. In the case where the level
  *		cannot be easily determined, the value TLBI_TTL_UNKNOWN will
- *		perform a non-hinted invalidation.
+ *		perform a non-hinted invalidation. flags may be TLBF_NONE (0) or
+ *		TLBF_NOWALKCACHE (elide eviction of walk cache entries).
  *
  *	local_flush_tlb_page(vma, addr)
  *		Local variant of flush_tlb_page().  Stale TLB entries may
@@ -528,10 +528,14 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
 	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
 }
 
+typedef unsigned __bitwise tlbf_t;
+#define TLBF_NONE		((__force tlbf_t)0)
+#define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
+
 static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 				     unsigned long start, unsigned long end,
-				     unsigned long stride, bool last_level,
-				     int tlb_level)
+				     unsigned long stride, int tlb_level,
+				     tlbf_t flags)
 {
 	unsigned long asid, pages;
 
@@ -547,7 +551,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	dsb(ishst);
 	asid = ASID(mm);
 
-	if (last_level)
+	if (flags & TLBF_NOWALKCACHE)
 		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
 				     asid, tlb_level);
 	else
@@ -559,11 +563,11 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long start, unsigned long end,
-				     unsigned long stride, bool last_level,
-				     int tlb_level)
+				     unsigned long stride, int tlb_level,
+				     tlbf_t flags)
 {
 	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
-				 last_level, tlb_level);
+				 tlb_level, flags);
 	dsb(ish);
 }
 
@@ -591,7 +595,7 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 	 * Set the tlb_level to TLBI_TTL_UNKNOWN because we can not get enough
 	 * information here.
 	 */
-	__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
+	__flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN, TLBF_NONE);
 }
 
 static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
@@ -632,7 +636,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
-	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
+	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, 3, TLBF_NOWALKCACHE);
 }
 
 static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 589bcf878938..1a12bb728ee1 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -205,7 +205,8 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
 	 */
 
 	if (!system_supports_bbml2_noabort())
-		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
+		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, 3,
+				  TLBF_NOWALKCACHE);
 
 	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
 }
@@ -527,7 +528,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 		 */
 		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
 		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
-					 PAGE_SIZE, true, 3);
+					 PAGE_SIZE, 3, TLBF_NOWALKCACHE);
 	}
 
 	return young;
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 1d90a7e75333..7b95663f8c76 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -184,7 +184,7 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
 	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
 	unsigned long end = addr + (pgsize * ncontig);
 
-	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, true);
+	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, TLBF_NOWALKCACHE);
 	return orig_pte;
 }
 
@@ -212,7 +212,7 @@ static void clear_flush(struct mm_struct *mm,
 	if (mm == &init_mm)
 		flush_tlb_kernel_range(saddr, addr);
 	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
+		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9ae7ce00a7ef..a17d617a959a 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2150,7 +2150,7 @@ pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
 		 */
 		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
 			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
-					  PAGE_SIZE, true, 3);
+					  PAGE_SIZE, 3, TLBF_NOWALKCACHE);
 	}
 
 	return pte;
-- 
2.43.0


