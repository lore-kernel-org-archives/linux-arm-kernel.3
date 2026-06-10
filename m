Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B50CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFJ/RlI4r1m8jEc3dwH3g/YozL4HYzmyO7tgTCsWeow=; b=aOx9nw0Sszx6+y0KiKf4h+foJI
	MuO9zu9eqJyNPNtmVrPkAiXIFdx3lCSaUNM0rpzHxFkeuoFTDUxz7XRa7HvNA6ZdMsThvHV24WE+b
	RCzGVQb6uLikaJYsucpF3+5X/59Lw6bjqtRfypPAOchXOp6v7uzPK5icyHyraOP9ghYxWJQDss4I9
	XZTY/f32tEkDaHlPx5Mk60KNi+QTmUfLzbw9gwlCp2JTvF/I06QQSItooow+dsmKebEwN0U546FCR
	t5uf80KpFr2NZCXkcjdkVF+fz4LXjv6Hoio6qDaHs76vV3bpylQ6d/kaG+UFgMGnvFevs35h6BpzM
	MHhI6lRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGUD-00000007SC8-41H2;
	Wed, 10 Jun 2026 10:48:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGUA-00000007SBM-376Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:48:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E47D21D70;
	Wed, 10 Jun 2026 03:48:31 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C637D3FDE2;
	Wed, 10 Jun 2026 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781088516; bh=SOvn4FmRk76gS6YwCujOM0HesBTLBz9YvXbs62nhflY=;
	h=From:To:Cc:Subject:Date:From;
	b=reF5+kihQ3ri7n9My3Gk8YUSEc3sQjd3TS+4WjByxKnM4gmu8SuJ3twJHaFzrH+um
	 L5ihS66nUbioGeQ+v6Z/hLgnqsATJEvpVvwfqEA2SaB6ekc8LVNeZgwU5HlTj3nBaP
	 3BzAmFlWlCcOH7tpp4wdsvBi+OfMbzIKAoG01w2E=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: Avoid eager DVMSync reclaim batches with C1-Pro SME erratum
Date: Wed, 10 Jun 2026 11:37:16 +0100
Message-ID: <20260610104829.1157497-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_034839_020065_F6C1B55C 
X-CRM114-Status: GOOD (  19.09  )
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

The C1-Pro SME DVMSync workaround currently samples mm_cpumask() from
arch_tlbbatch_add_pending(). It requires a DSB after every batched TLBI
so that the mask read is ordered after the hardware DVMSync, defeating
much of the reclaim batching benefit.

Introduce the sme_active_cpus mask tracking which CPUs run in user-space
with SME enabled and use it for batch flushing instead of accumulating
the mm_cpumask() of the unmapped pages.

Fixes: 0baba94a9779 ("arm64: errata: Work around early CME DVMSync acknowledgement")
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---

The dsb() in arch_tlbbatch_add_pending() -> sme_dvmsync_add_pending()
did introduce a performance regression for kswapd. This patch restores
the original behaviour with the barrier only issued when the TLB batch
is flushed. The trade-off is that the IPIs are now sent to all CPUs
running with SME enabled at EL0 even if the reclaimed pages do not
belong to SME tasks. This is acceptable for current SME deployments.

 arch/arm64/include/asm/tlbbatch.h | 10 ++-----
 arch/arm64/include/asm/tlbflush.h | 49 +++++--------------------------
 arch/arm64/kernel/fpsimd.c        | 10 +++++--
 arch/arm64/kernel/process.c       | 35 ----------------------
 4 files changed, 17 insertions(+), 87 deletions(-)

diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
index 6297631532e5..767f35ea62b3 100644
--- a/arch/arm64/include/asm/tlbbatch.h
+++ b/arch/arm64/include/asm/tlbbatch.h
@@ -2,17 +2,11 @@
 #ifndef _ARCH_ARM64_TLBBATCH_H
 #define _ARCH_ARM64_TLBBATCH_H
 
-#include <linux/cpumask.h>
-
 struct arch_tlbflush_unmap_batch {
-#ifdef CONFIG_ARM64_ERRATUM_4193714
 	/*
-	 * Track CPUs that need SME DVMSync on completion of this batch.
-	 * Otherwise, the arm64 HW can do tlb shootdown, so we don't need to
-	 * record cpumask for sending IPI
+	 * For arm64, HW can do TLB shootdown, so we don't need to record a
+	 * cpumask for sending IPIs.
 	 */
-	cpumask_var_t cpumask;
-#endif
 };
 
 #endif /* _ARCH_ARM64_TLBBATCH_H */
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index c0bf5b398041..57b4eda6a72b 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -82,6 +82,8 @@ static inline unsigned long get_trans_granule(void)
 
 #ifdef CONFIG_ARM64_ERRATUM_4193714
 
+extern cpumask_t sme_active_cpus;
+
 void sme_do_dvmsync(const struct cpumask *mask);
 
 static inline void sme_dvmsync(struct mm_struct *mm)
@@ -92,42 +94,12 @@ static inline void sme_dvmsync(struct mm_struct *mm)
 	sme_do_dvmsync(mm_cpumask(mm));
 }
 
-static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
-					   struct mm_struct *mm)
+static inline void sme_dvmsync_batch(void)
 {
 	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
 		return;
 
-	/*
-	 * Order the mm_cpumask() read after the hardware DVMSync.
-	 */
-	dsb(ish);
-	if (cpumask_empty(mm_cpumask(mm)))
-		return;
-
-	/*
-	 * Allocate the batch cpumask on first use. Fall back to an immediate
-	 * IPI for this mm in case of failure.
-	 */
-	if (!cpumask_available(batch->cpumask) &&
-	    !zalloc_cpumask_var(&batch->cpumask, GFP_ATOMIC)) {
-		sme_do_dvmsync(mm_cpumask(mm));
-		return;
-	}
-
-	cpumask_or(batch->cpumask, batch->cpumask, mm_cpumask(mm));
-}
-
-static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
-{
-	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
-		return;
-
-	if (!cpumask_available(batch->cpumask))
-		return;
-
-	sme_do_dvmsync(batch->cpumask);
-	cpumask_clear(batch->cpumask);
+	sme_do_dvmsync(&sme_active_cpus);
 }
 
 #else
@@ -135,11 +107,7 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
 static inline void sme_dvmsync(struct mm_struct *mm)
 {
 }
-static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
-					   struct mm_struct *mm)
-{
-}
-static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
+static inline void sme_dvmsync_batch(void)
 {
 }
 
@@ -285,11 +253,11 @@ static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
 	sme_dvmsync(mm);
 }
 
-static inline void __tlbi_sync_s1ish_batch(struct arch_tlbflush_unmap_batch *batch)
+static inline void __tlbi_sync_s1ish_batch(void)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
-	sme_dvmsync_batch(batch);
+	sme_dvmsync_batch();
 }
 
 static inline void __tlbi_sync_s1ish_kernel(void)
@@ -434,7 +402,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish_batch(batch);
+	__tlbi_sync_s1ish_batch();
 }
 
 /*
@@ -722,7 +690,6 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 
 	__flush_tlb_range(&vma, start, end, PAGE_SIZE, 3,
 			  TLBF_NOWALKCACHE | TLBF_NOSYNC);
-	sme_dvmsync_add_pending(batch, mm);
 }
 
 static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 60a45d600b46..ab3b63621fd0 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1366,6 +1366,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
  * SME/CME erratum handling.
  */
 static cpumask_t sme_dvmsync_cpus;
+cpumask_t sme_active_cpus;
 
 /*
  * These helpers are only called from non-preemptible contexts, so
@@ -1379,13 +1380,15 @@ void sme_set_active(void)
 		return;
 
 	cpumask_set_cpu(cpu, mm_cpumask(current->mm));
+	cpumask_set_cpu(cpu, &sme_active_cpus);
 
 	/*
 	 * A subsequent (post ERET) SME access may use a stale address
 	 * translation. On C1-Pro, a TLBI+DSB on a different CPU will wait for
-	 * the completion of cpumask_set_cpu() above as it appears in program
-	 * order before the SME access. The post-TLBI+DSB read of mm_cpumask()
-	 * will lead to the IPI being issued.
+	 * the completion of the cpumask_set_cpu() operations above as they
+	 * appear in program order before the SME access. The post-TLBI+DSB
+	 * read of mm_cpumask() or sme_active_cpus will lead to the IPI being
+	 * issued.
 	 *
 	 * https://lore.kernel.org/r/ablEXwhfKyJW1i7l@J2N7QTR9R3
 	 */
@@ -1403,6 +1406,7 @@ void sme_clear_active(void)
 	 * completed on entering EL1.
 	 */
 	cpumask_clear_cpu(cpu, mm_cpumask(current->mm));
+	cpumask_clear_cpu(cpu, &sme_active_cpus);
 }
 
 static void sme_dvmsync_ipi(void *unused)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 033643cd4e5e..581f80e9b9b7 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,41 +341,8 @@ void flush_thread(void)
 	flush_gcs();
 }
 
-#ifdef CONFIG_ARM64_ERRATUM_4193714
-
-static void arch_dup_tlbbatch_mask(struct task_struct *dst)
-{
-	/*
-	 * Clear the inherited cpumask with memset() to cover both cases where
-	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
-	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
-	 */
-	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
-		memset(&dst->tlb_ubc.arch.cpumask, 0,
-		       sizeof(dst->tlb_ubc.arch.cpumask));
-}
-
-static void arch_release_tlbbatch_mask(struct task_struct *tsk)
-{
-	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
-		free_cpumask_var(tsk->tlb_ubc.arch.cpumask);
-}
-
-#else
-
-static void arch_dup_tlbbatch_mask(struct task_struct *dst)
-{
-}
-
-static void arch_release_tlbbatch_mask(struct task_struct *tsk)
-{
-}
-
-#endif /* CONFIG_ARM64_ERRATUM_4193714 */
-
 void arch_release_task_struct(struct task_struct *tsk)
 {
-	arch_release_tlbbatch_mask(tsk);
 	fpsimd_release_task(tsk);
 }
 
@@ -391,8 +358,6 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 
 	*dst = *src;
 
-	arch_dup_tlbbatch_mask(dst);
-
 	/*
 	 * Drop stale reference to src's sve_state and convert dst to
 	 * non-streaming FPSIMD mode.

