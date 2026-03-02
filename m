Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C55EA4E08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBKjLrGYsQBn2MUPKQOIjjbdoqrwQLahcH/n7D3T7ec=; b=2dOX9z18nW1cOeGNTD6SBfdZF/
	vhFiX1ivXKmgq5zZrj0N6Pj+UMDbnZ7Nz5hMskLJLh/3Cq9lxY3YKtKtC3FMosbfobtZrh23o3PZG
	ExKNRBEHwVAg6lSiXD23a/BxdsBPO573MJpJrNhI8DK1ftwDaLHqbhM/CJzxngGC0yatNg9ThkDpW
	Bh1pJmlC0LZWPACT7oPV1bGLpL5RexNZtCicOh72St0xmA0jnLGhEFePGzyvclrBEiO8id7W0QDBu
	TsIxMP6G/eeXSld3cNCaCasWnkXBB+KuvBfmWiu4A3P4J2juDxw0VSBvyIIvxyvVgTHPFuB0snZau
	uJEjjaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lR-0000000DB8t-1gJ9;
	Mon, 02 Mar 2026 13:56:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lQ-0000000DB63-0ejJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 13:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NBKjLrGYsQBn2MUPKQOIjjbdoqrwQLahcH/n7D3T7ec=; b=j+rNxx8E9zL6oQ/fsdmwL2s/PE
	9+8AfBGSEcITd13BeLCVhwcLb/iSkt395qnRUOcwkE3fkPztvHcV9Gupn2yagRq3soWa44pY1OOlA
	7gwifeYV1zgfON4rQfEJMzf0f0Gdow8mIlgP8DsianmL49lvhvylRKRYEs34J5IbWhjNsgJ/NYSCZ
	/xHcbgraxXHd4JYUO+FMBDK3UaRBVbSGuB1R/r+6Ot2vPCx1aQEsWrcNx6/dqbCfpmjZsZlpH+2Dl
	S0X4J/bGm1UWRJ64QnWTwIWHZ0id/dLfelCqpTJR7x5jN4gdtR+MBJmevL6qzPOGgh7uUHywj81+T
	0NjMc13g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lM-00000000E4F-3k5K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:56:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E4A91570;
	Mon,  2 Mar 2026 05:56:37 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 922513F73B;
	Mon,  2 Mar 2026 05:56:41 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v3 12/13] arm64: mm: Wrap flush_tlb_page() around __do_flush_tlb_range()
Date: Mon,  2 Mar 2026 13:55:59 +0000
Message-ID: <20260302135602.3716920-13-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_135645_536735_58CE4D2D 
X-CRM114-Status: GOOD (  17.52  )
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

Flushing a page from the tlb is just a special case of flushing a range.
So let's rework flush_tlb_page() so that it simply wraps
__do_flush_tlb_range(). While at it, let's also update the API to take
the same flags that we use when flushing a range. This allows us to
delete all the ugly "_nosync", "_local" and "_nonotify" variants.

Thanks to constant folding, all of the complex looping and tlbi-by-range
options get eliminated so that the generated code for flush_tlb_page()
looks very similar to the previous version.

Reviewed-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h  |  6 +--
 arch/arm64/include/asm/tlbflush.h | 81 ++++++++++---------------------
 arch/arm64/mm/fault.c             |  2 +-
 3 files changed, 29 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 88bb9275ac898..7039931df4622 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -101,10 +101,10 @@ static inline void arch_leave_lazy_mmu_mode(void)
  * entries exist.
  */
 #define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
-	local_flush_tlb_page_nonotify(vma, address)
+	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
 
 #define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
-	local_flush_tlb_page_nonotify(vma, address)
+	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
 
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
@@ -1320,7 +1320,7 @@ static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
 		 * context-switch, which provides a DSB to complete the TLB
 		 * invalidation.
 		 */
-		flush_tlb_page_nosync(vma, address);
+		__flush_tlb_page(vma, address, TLBF_NOSYNC);
 	}
 
 	return young;
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 5509927e45b93..5096ec7ab8650 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -269,10 +269,7 @@ static inline void __tlbi_sync_s1ish_hyp(void)
  *		unmapping pages from vmalloc/io space.
  *
  *	flush_tlb_page(vma, addr)
- *		Invalidate a single user mapping for address 'addr' in the
- *		address space corresponding to 'vma->mm'.  Note that this
- *		operation only invalidates a single, last-level page-table
- *		entry and therefore does not affect any walk-caches.
+ *		Equivalent to __flush_tlb_page(..., flags=TLBF_NONE)
  *
  *
  *	Next, we have some undocumented invalidation routines that you probably
@@ -300,13 +297,14 @@ static inline void __tlbi_sync_s1ish_hyp(void)
  *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
  *		(only perform the invalidation for the local cpu).
  *
- *	local_flush_tlb_page(vma, addr)
- *		Local variant of flush_tlb_page().  Stale TLB entries may
- *		remain in remote CPUs.
- *
- *	local_flush_tlb_page_nonotify(vma, addr)
- *		Same as local_flush_tlb_page() except MMU notifier will not be
- *		called.
+ *	__flush_tlb_page(vma, addr, flags)
+ *		Invalidate a single user mapping for address 'addr' in the
+ *		address space corresponding to 'vma->mm'.  Note that this
+ *		operation only invalidates a single, last-level page-table entry
+ *		and therefore does not affect any walk-caches. flags may contain
+ *		any combination of TLBF_NONOTIFY (don't call mmu notifiers),
+ *		TLBF_NOSYNC (don't issue trailing dsb) and TLBF_NOBROADCAST
+ *		(only perform the invalidation for the local cpu).
  *
  *	Finally, take a look at asm/tlb.h to see how tlb_flush() is implemented
  *	on top of these routines, since that is our interface to the mmu_gather
@@ -340,51 +338,6 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
-static inline void __local_flush_tlb_page_nonotify_nosync(struct mm_struct *mm,
-							  unsigned long uaddr)
-{
-	dsb(nshst);
-	__tlbi_level_asid(vale1, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
-}
-
-static inline void local_flush_tlb_page_nonotify(struct vm_area_struct *vma,
-						 unsigned long uaddr)
-{
-	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
-	dsb(nsh);
-}
-
-static inline void local_flush_tlb_page(struct vm_area_struct *vma,
-					unsigned long uaddr)
-{
-	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
-	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
-						(uaddr & PAGE_MASK) + PAGE_SIZE);
-	dsb(nsh);
-}
-
-static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
-					   unsigned long uaddr)
-{
-	dsb(ishst);
-	__tlbi_level_asid(vale1is, uaddr, TLBI_TTL_UNKNOWN, ASID(mm));
-	mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
-						(uaddr & PAGE_MASK) + PAGE_SIZE);
-}
-
-static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
-					 unsigned long uaddr)
-{
-	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
-}
-
-static inline void flush_tlb_page(struct vm_area_struct *vma,
-				  unsigned long uaddr)
-{
-	flush_tlb_page_nosync(vma, uaddr);
-	__tlbi_sync_s1ish();
-}
-
 static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 {
 	return true;
@@ -632,6 +585,22 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 	__flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN, TLBF_NONE);
 }
 
+static inline void __flush_tlb_page(struct vm_area_struct *vma,
+				    unsigned long uaddr, tlbf_t flags)
+{
+	unsigned long start = round_down(uaddr, PAGE_SIZE);
+	unsigned long end = start + PAGE_SIZE;
+
+	__do_flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN,
+			     TLBF_NOWALKCACHE | flags);
+}
+
+static inline void flush_tlb_page(struct vm_area_struct *vma,
+				  unsigned long uaddr)
+{
+	__flush_tlb_page(vma, uaddr, TLBF_NONE);
+}
+
 static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
 	const unsigned long stride = PAGE_SIZE;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index be9dab2c7d6a8..f91aa686f1428 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -239,7 +239,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
 	 * flush_tlb_fix_spurious_fault().
 	 */
 	if (dirty)
-		local_flush_tlb_page(vma, address);
+		__flush_tlb_page(vma, address, TLBF_NOBROADCAST);
 	return 1;
 }
 
-- 
2.43.0


