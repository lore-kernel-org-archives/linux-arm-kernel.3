Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC87CEA4E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ+ITDZnULHu10hpKMyEYfqQ6pdHP/yimPZhQGLCL6Y=; b=wWuvg7z+JgTekfPFxOqsAj1NaV
	VCq10/fXBFGnkfEPovlv2FVdNkEabJUGALuqtuhbw1RhPlCWpD8OO1IX28A5GORW3D2ohwOR6XUIv
	jGKRfF1BcaB0VSuqOr2PhZlaWEwR8ApCP/Z5d84+15U93Agqxt7G7vTZ4XTrbaFcOi0/DSN5BikGh
	GvgA3/pmpDLODSEBZoinYYO79EzIkwXYMzn9zxVDsQ+RSlj/k6EKoBSxLr1sxluQ69Jxs3G2069+2
	IZZ2nPAMO0y9oA1B4NADSohr9SGpm1td49uNwkG3euC4WtqjIpxto/CLGLskvT15kaFcLhHIKood/
	9uAbUVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lN-0000000DB3p-2Ien;
	Mon, 02 Mar 2026 13:56:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lK-0000000DAzS-0Aru
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:56:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E943A150C;
	Mon,  2 Mar 2026 05:56:34 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ADA93F73B;
	Mon,  2 Mar 2026 05:56:39 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/13] arm64: mm: More flags for __flush_tlb_range()
Date: Mon,  2 Mar 2026 13:55:58 +0000
Message-ID: <20260302135602.3716920-12-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_055642_180459_555E1805 
X-CRM114-Status: GOOD (  20.28  )
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

Refactor function variants with "_nosync", "_local" and "_nonotify" into
a single __always_inline implementation that takes flags and rely on
constant folding to select the parts that are actually needed at any
given callsite, based on the provided flags.

Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
to provide the strongest semantics (i.e. evict from walk cache,
broadcast, synchronise and notify). Each flag reduces the strength in
some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
complement the existing TLBF_NOWALKCACHE.

There are no users that require TLBF_NOBROADCAST without
TLBF_NOWALKCACHE so implement that as BUILD_BUG() to avoid needing to
introduce dead code for vae1 invalidations.

The result is a clearer, simpler, more powerful API.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 95 ++++++++++++++++++-------------
 arch/arm64/mm/contpte.c           |  9 ++-
 2 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index d134824ea5daa..5509927e45b93 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -295,7 +295,10 @@ static inline void __tlbi_sync_s1ish_hyp(void)
  *		no invalidation may take place. In the case where the level
  *		cannot be easily determined, the value TLBI_TTL_UNKNOWN will
  *		perform a non-hinted invalidation. flags may be TLBF_NONE (0) or
- *		TLBF_NOWALKCACHE (elide eviction of walk cache entries).
+ *		any combination of TLBF_NOWALKCACHE (elide eviction of walk
+ *		cache entries), TLBF_NONOTIFY (don't call mmu notifiers),
+ *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
+ *		(only perform the invalidation for the local cpu).
  *
  *	local_flush_tlb_page(vma, addr)
  *		Local variant of flush_tlb_page().  Stale TLB entries may
@@ -305,12 +308,6 @@ static inline void __tlbi_sync_s1ish_hyp(void)
  *		Same as local_flush_tlb_page() except MMU notifier will not be
  *		called.
  *
- *	local_flush_tlb_contpte(vma, addr)
- *		Invalidate the virtual-address range
- *		'[addr, addr+CONT_PTE_SIZE)' mapped with contpte on local CPU
- *		for the user address space corresponding to 'vma->mm'.  Stale
- *		TLB entries may remain in remote CPUs.
- *
  *	Finally, take a look at asm/tlb.h to see how tlb_flush() is implemented
  *	on top of these routines, since that is our interface to the mmu_gather
  *	API as used by munmap() and friends.
@@ -552,15 +549,23 @@ typedef unsigned __bitwise tlbf_t;
 /* Invalidate tlb entries only, leaving the page table walk cache intact. */
 #define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
 
-static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
-				     unsigned long start, unsigned long end,
-				     unsigned long stride, int tlb_level,
-				     tlbf_t flags)
+/* Skip the trailing dsb after issuing tlbi. */
+#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
+
+/* Suppress tlb notifier callbacks for this flush operation. */
+#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
+
+/* Perform the tlbi locally without broadcasting to other CPUs. */
+#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
+
+static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
+					unsigned long start, unsigned long end,
+					unsigned long stride, int tlb_level,
+					tlbf_t flags)
 {
+	struct mm_struct *mm = vma->vm_mm;
 	unsigned long asid, pages;
 
-	start = round_down(start, stride);
-	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
 	if (__flush_tlb_range_limit_excess(pages, stride)) {
@@ -568,17 +573,41 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 		return;
 	}
 
-	dsb(ishst);
+	if (!(flags & TLBF_NOBROADCAST))
+		dsb(ishst);
+	else
+		dsb(nshst);
+
 	asid = ASID(mm);
 
-	if (flags & TLBF_NOWALKCACHE)
-		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
-				     asid, tlb_level);
-	else
+	switch (flags & (TLBF_NOWALKCACHE | TLBF_NOBROADCAST)) {
+	case TLBF_NONE:
 		__flush_s1_tlb_range_op(vae1is, start, pages, stride,
-				     asid, tlb_level);
+					asid, tlb_level);
+		break;
+	case TLBF_NOWALKCACHE:
+		__flush_s1_tlb_range_op(vale1is, start, pages, stride,
+					asid, tlb_level);
+		break;
+	case TLBF_NOBROADCAST:
+		/* Combination unused */
+		BUG();
+		break;
+	case TLBF_NOWALKCACHE | TLBF_NOBROADCAST:
+		__flush_s1_tlb_range_op(vale1, start, pages, stride,
+					asid, tlb_level);
+		break;
+	}
+
+	if (!(flags & TLBF_NONOTIFY))
+		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 
-	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
+	if (!(flags & TLBF_NOSYNC)) {
+		if (!(flags & TLBF_NOBROADCAST))
+			__tlbi_sync_s1ish();
+		else
+			dsb(nsh);
+	}
 }
 
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
@@ -586,24 +615,9 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long stride, int tlb_level,
 				     tlbf_t flags)
 {
-	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
-				 tlb_level, flags);
-	__tlbi_sync_s1ish();
-}
-
-static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
-					   unsigned long addr)
-{
-	unsigned long asid;
-
-	addr = round_down(addr, CONT_PTE_SIZE);
-
-	dsb(nshst);
-	asid = ASID(vma->vm_mm);
-	__flush_s1_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid, 3);
-	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
-						    addr + CONT_PTE_SIZE);
-	dsb(nsh);
+	start = round_down(start, stride);
+	end = round_up(end, stride);
+	__do_flush_tlb_range(vma, start, end, stride, tlb_level, flags);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
@@ -656,7 +670,10 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
-	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, 3, TLBF_NOWALKCACHE);
+	struct vm_area_struct vma = { .vm_mm = mm, .vm_flags = 0 };
+
+	__flush_tlb_range(&vma, start, end, PAGE_SIZE, 3,
+			  TLBF_NOWALKCACHE | TLBF_NOSYNC);
 }
 
 static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 681f22fac52a1..3f1a3e86353de 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -552,8 +552,8 @@ int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
 		 * See comment in __ptep_clear_flush_young(); same rationale for
 		 * eliding the trailing DSB applies here.
 		 */
-		__flush_tlb_range_nosync(vma->vm_mm, addr, end,
-					 PAGE_SIZE, 3, TLBF_NOWALKCACHE);
+		__flush_tlb_range(vma, addr, end, PAGE_SIZE, 3,
+				  TLBF_NOWALKCACHE | TLBF_NOSYNC);
 	}
 
 	return young;
@@ -641,7 +641,10 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
 			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
 
 		if (dirty)
-			local_flush_tlb_contpte(vma, start_addr);
+			__flush_tlb_range(vma, start_addr,
+					  start_addr + CONT_PTE_SIZE,
+					  PAGE_SIZE, 3,
+					  TLBF_NOWALKCACHE | TLBF_NOBROADCAST);
 	} else {
 		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
 		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-- 
2.43.0


