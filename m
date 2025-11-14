Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10667CE7A8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kydea2ERvGOkNHgKcrHhLqiFo8q78ufRCZwLw/rrafc=; b=DIldbI6ml5BHfaHlghZl1yjE/c
	7G2cVEARNXmQ3EdSMTl3f3zIhau8ln6YzgZl56ovHN0ipnSW5aPLxU3gNULVFLpr3OAmRJg0fxSxt
	tJkEqb9TTKBW4IiGBqvb67oqAnrPhgsKWiYMAEAUzSDRQUuJekmWkdzIH4Bry/ynqiljNzwBOES91
	/Y/E/bpjiwQwYZivshessMDQluNNVVrKwqpcb3utzpIMitDAsT3rZM07eRMk3i6cgItk1ngqlm9wP
	Z0f3iZuS4MIx2UFo9Xpz+3+xWNRo7WY0GRdJbZWfD1OrSttdr1Ehl5KVUY1eAzgIkxO8nxVXQJss/
	fQy/5Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpZf-0000000BqEJ-2cOr;
	Fri, 14 Nov 2025 08:54:31 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpZd-0000000BqC3-0BMn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 08:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763110465; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Kydea2ERvGOkNHgKcrHhLqiFo8q78ufRCZwLw/rrafc=;
	b=CyGvB1LhmsxcTJXpVhcAP3TMw10f3PLq00lUqw2QjqbBpZd7q/ltVMUdVNBgq1PjMHeYJzO0MIukiwz3J1j0nyEw1Pq4sOlj9ZpeNG7dkFiyodOmUuwIT9h6dZtjLuZ8ZTOqeoxu6wnuEIaWvXvR1/b6xoroSxxqLkiyKNNH1bU=
Received: from localhost.localdomain(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WsMaAai_1763110461 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 14 Nov 2025 16:54:21 +0800
From: Huang Ying <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: Huang Ying <ying.huang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH -v6 2/2] arm64, tlbflush: don't TLBI broadcast if page reused in write fault
Date: Fri, 14 Nov 2025 16:54:03 +0800
Message-Id: <20251114085403.101552-3-ying.huang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251114085403.101552-1-ying.huang@linux.alibaba.com>
References: <20251114085403.101552-1-ying.huang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005429_363340_DC970ABA 
X-CRM114-Status: GOOD (  24.68  )
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

A multi-thread customer workload with large memory footprint uses
fork()/exec() to run some external programs every tens seconds.  When
running the workload on an arm64 server machine, it's observed that
quite some CPU cycles are spent in the TLB flushing functions.  While
running the workload on the x86_64 server machine, it's not.  This
causes the performance on arm64 to be much worse than that on x86_64.

During the workload running, after fork()/exec() write-protects all
pages in the parent process, memory writing in the parent process
will cause a write protection fault.  Then the page fault handler
will make the PTE/PDE writable if the page can be reused, which is
almost always true in the workload.  On arm64, to avoid the write
protection fault on other CPUs, the page fault handler flushes the TLB
globally with TLBI broadcast after changing the PTE/PDE.  However, this
isn't always necessary.  Firstly, it's safe to leave some stale
read-only TLB entries as long as they will be flushed finally.
Secondly, it's quite possible that the original read-only PTE/PDEs
aren't cached in remote TLB at all if the memory footprint is large.
In fact, on x86_64, the page fault handler doesn't flush the remote
TLB in this situation, which benefits the performance a lot.

To improve the performance on arm64, make the write protection fault
handler flush the TLB locally instead of globally via TLBI broadcast
after making the PTE/PDE writable.  If there are stale read-only TLB
entries in the remote CPUs, the page fault handler on these CPUs will
regard the page fault as spurious and flush the stale TLB entries.

To test the patchset, make the usemem.c from
vm-scalability (https://git.kernel.org/pub/scm/linux/kernel/git/wfg/vm-scalability.git).
support calling fork()/exec() periodically.  To mimic the behavior of
the customer workload, run usemem with 4 threads, access 100GB memory,
and call fork()/exec() every 40 seconds.  Test results show that with
the patchset the score of usemem improves ~40.6%.  The cycles% of TLB
flush functions reduces from ~50.5% to ~0.3% in perf profile.

Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
---
 arch/arm64/include/asm/pgtable.h  | 14 +++++---
 arch/arm64/include/asm/tlbflush.h | 56 +++++++++++++++++++++++++++++++
 arch/arm64/mm/contpte.c           |  3 +-
 arch/arm64/mm/fault.c             |  8 +++--
 4 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0944e296dd4a..9e1ff5195bde 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -130,12 +130,16 @@ static inline void arch_leave_lazy_mmu_mode(void)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
- * Outside of a few very special situations (e.g. hibernation), we always
- * use broadcast TLB invalidation instructions, therefore a spurious page
- * fault on one CPU which has been handled concurrently by another CPU
- * does not need to perform additional invalidation.
+ * We use local TLB invalidation instruction when reusing page in
+ * write protection fault handler to avoid TLBI broadcast in the hot
+ * path.  This will cause spurious page faults if stale read-only TLB
+ * entries exist.
  */
-#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)
+#define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
+	local_flush_tlb_page_nonotify(vma, address)
+
+#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
+	local_flush_tlb_page_nonotify(vma, address)
 
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 18a5dc0c9a54..682a01df71d2 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -249,6 +249,19 @@ static inline unsigned long get_trans_granule(void)
  *		cannot be easily determined, the value TLBI_TTL_UNKNOWN will
  *		perform a non-hinted invalidation.
  *
+ *	local_flush_tlb_page(vma, addr)
+ *		Local variant of flush_tlb_page().  Stale TLB entries may
+ *		remain in remote CPUs.
+ *
+ *	local_flush_tlb_page_nonotify(vma, addr)
+ *		Same as local_flush_tlb_page() except MMU notifier will not be
+ *		called.
+ *
+ *	local_flush_tlb_contpte(vma, addr)
+ *		Invalidate the virtual-address range
+ *		'[addr, addr+CONT_PTE_SIZE)' mapped with contpte on local CPU
+ *		for the user address space corresponding to 'vma->mm'.  Stale
+ *		TLB entries may remain in remote CPUs.
  *
  *	Finally, take a look at asm/tlb.h to see how tlb_flush() is implemented
  *	on top of these routines, since that is our interface to the mmu_gather
@@ -282,6 +295,33 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
+static inline void __local_flush_tlb_page_nonotify_nosync(struct mm_struct *mm,
+							  unsigned long uaddr)
+{
+	unsigned long addr;
+
+	dsb(nshst);
+	addr = __TLBI_VADDR(uaddr, ASID(mm));
+	__tlbi(vale1, addr);
+	__tlbi_user(vale1, addr);
+}
+
+static inline void local_flush_tlb_page_nonotify(struct vm_area_struct *vma,
+						 unsigned long uaddr)
+{
+	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
+	dsb(nsh);
+}
+
+static inline void local_flush_tlb_page(struct vm_area_struct *vma,
+					unsigned long uaddr)
+{
+	__local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
+						(uaddr & PAGE_MASK) + PAGE_SIZE);
+	dsb(nsh);
+}
+
 static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
 					   unsigned long uaddr)
 {
@@ -472,6 +512,22 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 	dsb(ish);
 }
 
+static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
+					   unsigned long addr)
+{
+	unsigned long asid;
+
+	addr = round_down(addr, CONT_PTE_SIZE);
+
+	dsb(nshst);
+	asid = ASID(vma->vm_mm);
+	__flush_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid,
+			     3, true, lpa2_is_enabled());
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
+						    addr + CONT_PTE_SIZE);
+	dsb(nsh);
+}
+
 static inline void flush_tlb_range(struct vm_area_struct *vma,
 				   unsigned long start, unsigned long end)
 {
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index c0557945939c..589bcf878938 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -622,8 +622,7 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
 			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
 
 		if (dirty)
-			__flush_tlb_range(vma, start_addr, addr,
-							PAGE_SIZE, true, 3);
+			local_flush_tlb_contpte(vma, start_addr);
 	} else {
 		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
 		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index d816ff44faff..4ecdfa6bcdbb 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -233,9 +233,13 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
 		pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
 	} while (pteval != old_pteval);
 
-	/* Invalidate a stale read-only entry */
+	/*
+	 * Invalidate the local stale read-only entry.  Remote stale entries
+	 * may still cause page faults and be invalidated via
+	 * flush_tlb_fix_spurious_fault().
+	 */
 	if (dirty)
-		flush_tlb_page(vma, address);
+		local_flush_tlb_page(vma, address);
 	return 1;
 }
 
-- 
2.39.5


