Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81ACD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwRYQlVa9VSG82PD2ABAHi/hwFVbqUI4Caq+1PvD/do=; b=2+as4pTAcd1tqQEtTBgNHWOw/x
	vTlHvrSadJQBr3vefk1AfGviN0KjiIfwI6GQ30k2bmvzs4dWMPR3JEyr/J7Ahp+1/Pne2zsuCoXqv
	MQJcCUlRnHfS6MmTsWdFSq/U+xg9+r3QBnwXnIGJgM3C//udYNlQgS8L9GpPaQAb25b8CZJ9dROmU
	8OquaOZMuvDaR+XmVc8dnVp9UEaIz0OEHVhMxididuPHdcqc+LvUW7KpMc9c3dyO1fXoQ0K2a+vTZ
	foR+0sxE6KjH81awCSoUYE9oo7CpbzpN9d6344mCqXaNNfgVIUGkaOLLq5Q2JNcsWJ2O3XYGirBL0
	4V9g/6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5AZ-00000006TMC-49g5;
	Tue, 09 Jun 2026 22:43:40 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX5AW-00000006TLd-2iJE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1781041003;
	bh=Q+kx8nEgw5M9vifAGLuHWXDXd2ioMRbM9o39JZEd3H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9HJ0A0kcCOEMZtFwVUiFRyA2sTv/RzIOBJbKCkhDYhgE7QJr5ctCPHyukCD+IQVz
	 EmD4YlzLz0KeQbOFVX1qRdsPSfCgpB4cyv0DUhyfS1/SILxg5vDApi0Y5/1fKuf8Dt
	 aijlFdzvfmcRqjSiYb6vHTME2g3/S27KmIj+G7wQ=
Received: by gentwo.org (Postfix, from userid 1012)
	id 5E23740BC4; Tue, 09 Jun 2026 14:36:43 -0700 (PDT)
From: sk@gentwo.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	cl@gentwo.org,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH 1/2] arm64: tlbflush: Don't broadcast if mm was only active on local cpu
Date: Tue,  9 Jun 2026 14:34:32 -0700
Message-ID: <20260609213615.2788698-2-sk@gentwo.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609213615.2788698-1-sk@gentwo.org>
References: <20260609213615.2788698-1-sk@gentwo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_154336_731918_88B9B75D 
X-CRM114-Status: GOOD (  29.77  )
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

From: Ryan Roberts <ryan.roberts@arm.com>

There are 3 variants of tlb flush that invalidate user mappings:
flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
would previously unconditionally broadcast their tlbis to all cpus in
the inner shareable domain.

But this is a waste of effort if we can prove that the mm for which we
are flushing the mappings has only ever been active on the local cpu. In
that case, it is safe to avoid the broadcast and simply invalidate the
current cpu.

So let's track in mm_context_t::active_cpu either the mm has never been
active on any cpu, has been active on more than 1 cpu, or has been
active on precisely 1 cpu - and in that case, which one. We update this
when switching context, being careful to ensure that it gets updated
*before* installing the mm's pgtables. On the reader side, we ensure we
read *after* the previous write(s) to the pgtable(s) that necessitated
the tlb flush have completed. This guarrantees that if a cpu that is
doing a tlb flush sees it's own id in active_cpu, then the old pgtable
entry cannot have been seen by any other cpu and we can flush only the
local cpu.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
[linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/include/asm/mmu.h         |  12 +++
 arch/arm64/include/asm/mmu_context.h |   2 +
 arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
 arch/arm64/mm/context.c              |  30 ++++++-
 4 files changed, 141 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..0002101c1f21 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -16,6 +16,17 @@
 #include <linux/refcount.h>
 #include <asm/cpufeature.h>
 
+/*
+ * Sentinal values for mm_context_t::active_cpu. ACTIVE_CPU_NONE indicates the
+ * mm has never been active on any CPU. ACTIVE_CPU_MULTIPLE indicates the mm
+ * has been active on multiple CPUs. Any other value is the ID of the single
+ * CPU that the mm has been active on.
+ */
+enum active_cpu {
+	ACTIVE_CPU_NONE = UINT_MAX,
+	ACTIVE_CPU_MULTIPLE = UINT_MAX - 1,
+};
+
 typedef struct {
 	atomic64_t	id;
 #ifdef CONFIG_COMPAT
@@ -25,6 +36,7 @@ typedef struct {
 	void		*vdso;
 	unsigned long	flags;
 	u8		pkey_allocation_map;
+	unsigned int	active_cpu;
 } mm_context_t;
 
 /*
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..101cae0c7262 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -172,6 +172,8 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 	/* pkey 0 is the default, so always reserve it. */
 	mm->context.pkey_allocation_map = BIT(0);
 
+	WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
+
 	return 0;
 }
 
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index c0bf5b398041..1f75bce4fa0d 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -164,6 +164,12 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
 
 typedef void (*tlbi_op)(u64 arg);
 
+static __always_inline void vae1(u64 arg)
+{
+	__tlbi(vae1, arg);
+	__tlbi_user(vae1, arg);
+}
+
 static __always_inline void vae1is(u64 arg)
 {
 	__tlbi(vae1is, arg);
@@ -308,6 +314,74 @@ static inline void __tlbi_sync_s1ish_hyp(void)
 	__repeat_tlbi_sync(vale2is, 0);
 }
 
+typedef unsigned __bitwise tlbf_t;
+
+/* No special behaviour. */
+#define TLBF_NONE		((__force tlbf_t)0)
+
+/* Invalidate tlb entries only, leaving the page table walk cache intact. */
+#define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
+
+/* Skip the trailing dsb after issuing tlbi. */
+#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
+
+/* Suppress tlb notifier callbacks for this flush operation. */
+#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
+
+/* Perform the tlbi locally without broadcasting to other CPUs. */
+#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
+
+/*
+ * Determines whether the user tlbi invalidation can be performed only on the
+ * local CPU or whether it needs to be broadcast. (Returns true for local).
+ * Additionally issues appropriate barrier to ensure prior pgtable updates are
+ * visible to the table walker. Must be paired with flush_tlb_user_post().
+ */
+static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
+{
+	unsigned int self, active;
+	bool local;
+
+	migrate_disable();
+
+	if (flags & TLBF_NOBROADCAST) {
+		dsb(nshst);
+		return true;
+	}
+
+	self = smp_processor_id();
+
+	/*
+	 * The load of mm->context.active_cpu must not be reordered before the
+	 * store to the pgtable that necessitated this flush. This ensures that
+	 * if the value read is our cpu id, then no other cpu can have seen the
+	 * old pgtable value and therefore does not need this old value to be
+	 * flushed from its tlb. But we don't want to upgrade the dsb(ishst),
+	 * needed to make the pgtable updates visible to the walker, to a
+	 * dsb(ish) by default. So speculatively load without a barrier and if
+	 * it indicates our cpu id, then upgrade the barrier and re-load.
+	 */
+	active = READ_ONCE(mm->context.active_cpu);
+	if (active == self) {
+		dsb(ish);
+		active = READ_ONCE(mm->context.active_cpu);
+	} else {
+		dsb(ishst);
+	}
+
+	local = active == self;
+	if (!local)
+		migrate_enable();
+
+	return local;
+}
+
+static inline void flush_tlb_user_post(bool local)
+{
+	if (local)
+		migrate_enable();
+}
+
 /*
  *	TLB Invalidation
  *	================
@@ -408,12 +482,20 @@ static inline void flush_tlb_all(void)
 static inline void flush_tlb_mm(struct mm_struct *mm)
 {
 	unsigned long asid;
+	bool local;
 
-	dsb(ishst);
+	local = flush_tlb_user_pre(mm, TLBF_NONE);
 	asid = __TLBI_VADDR(0, ASID(mm));
-	__tlbi(aside1is, asid);
-	__tlbi_user(aside1is, asid);
-	__tlbi_sync_s1ish(mm);
+	if (local) {
+		__tlbi(aside1, asid);
+		__tlbi_user(aside1, asid);
+		dsb(nsh);
+	} else {
+		__tlbi(aside1is, asid);
+		__tlbi_user(aside1is, asid);
+		__tlbi_sync_s1ish(mm);
+	}
+	flush_tlb_user_post(local);
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
@@ -475,6 +557,12 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  *    operations can only span an even number of pages. We save this for last to
  *    ensure 64KB start alignment is maintained for the LPA2 case.
  */
+static __always_inline void rvae1(u64 arg)
+{
+	__tlbi(rvae1, arg);
+	__tlbi_user(rvae1, arg);
+}
+
 static __always_inline void rvae1is(u64 arg)
 {
 	__tlbi(rvae1is, arg);
@@ -573,23 +661,6 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
 	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
 }
 
-typedef unsigned __bitwise tlbf_t;
-
-/* No special behaviour. */
-#define TLBF_NONE		((__force tlbf_t)0)
-
-/* Invalidate tlb entries only, leaving the page table walk cache intact. */
-#define TLBF_NOWALKCACHE	((__force tlbf_t)BIT(0))
-
-/* Skip the trailing dsb after issuing tlbi. */
-#define TLBF_NOSYNC		((__force tlbf_t)BIT(1))
-
-/* Suppress tlb notifier callbacks for this flush operation. */
-#define TLBF_NONOTIFY		((__force tlbf_t)BIT(2))
-
-/* Perform the tlbi locally without broadcasting to other CPUs. */
-#define TLBF_NOBROADCAST	((__force tlbf_t)BIT(3))
-
 static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 					unsigned long start, unsigned long end,
 					unsigned long stride, int tlb_level,
@@ -597,6 +668,7 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long asid, pages;
+	bool local;
 
 	pages = (end - start) >> PAGE_SHIFT;
 
@@ -605,10 +677,9 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 		return;
 	}
 
-	if (!(flags & TLBF_NOBROADCAST))
-		dsb(ishst);
-	else
-		dsb(nshst);
+	local = flush_tlb_user_pre(mm, flags);
+	if (local && !(flags & TLBF_NOBROADCAST))
+		flags |= TLBF_NOBROADCAST;
 
 	asid = ASID(mm);
 
@@ -622,8 +693,8 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 					asid, tlb_level);
 		break;
 	case TLBF_NOBROADCAST:
-		/* Combination unused */
-		BUG();
+		__flush_s1_tlb_range_op(vae1, start, pages, stride,
+					asid, tlb_level);
 		break;
 	case TLBF_NOWALKCACHE | TLBF_NOBROADCAST:
 		__flush_s1_tlb_range_op(vale1, start, pages, stride,
@@ -640,6 +711,8 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 		else
 			dsb(nsh);
 	}
+
+	flush_tlb_user_post(local);
 }
 
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..f34ed78393e0 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -214,9 +214,10 @@ static u64 new_context(struct mm_struct *mm)
 
 void check_and_switch_context(struct mm_struct *mm)
 {
-	unsigned long flags;
-	unsigned int cpu;
+	unsigned int cpu = smp_processor_id();
 	u64 asid, old_active_asid;
+	unsigned int active;
+	unsigned long flags;
 
 	if (system_supports_cnp())
 		cpu_set_reserved_ttbr0();
@@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
 		atomic64_set(&mm->context.id, asid);
 	}
 
-	cpu = smp_processor_id();
 	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
 		local_flush_tlb_all();
 
@@ -262,6 +262,30 @@ void check_and_switch_context(struct mm_struct *mm)
 
 	arm64_apply_bp_hardening();
 
+	/*
+	 * Update mm->context.active_cpu in such a manner that we avoid cmpxchg
+	 * and dsb unless we definitely need it. If initially ACTIVE_CPU_NONE
+	 * then we are the first cpu to run so set it to our id. If initially
+	 * any id other than ours, we are the second cpu to run so set it to
+	 * ACTIVE_CPU_MULTIPLE. If we update the value then we must issue
+	 * dsb(ishst) to ensure stores to mm->context.active_cpu are ordered
+	 * against the TTBR0 write in cpu_switch_mm()/uaccess_enable(); the
+	 * store must be visible to another cpu before this cpu could have
+	 * populated any TLB entries based on the pgtables that will be
+	 * installed.
+	 */
+	active = READ_ONCE(mm->context.active_cpu);
+	if (active != cpu && active != ACTIVE_CPU_MULTIPLE) {
+		if (active == ACTIVE_CPU_NONE)
+			active = cmpxchg_relaxed(&mm->context.active_cpu,
+						 ACTIVE_CPU_NONE, cpu);
+
+		if (active != ACTIVE_CPU_NONE)
+			WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_MULTIPLE);
+
+		dsb(ishst);
+	}
+
 	/*
 	 * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
 	 * emulating PAN.
-- 
2.47.3


