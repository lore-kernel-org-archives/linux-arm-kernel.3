Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D05FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+zO3Ol51NjjNZ26E8qDnrDKvdxz3CAM4/XWW6qiRlk=; b=OTpk7rQpnVLh247hVBP5wOg+Nl
	2FVUWh86L6asf/RL//u106YmD7umj4vXXpW2wpukxj6lVgRoONp0MsbR9Ez6vPOuV4Zb4cepQQbAM
	amKMtSvnuPO0UiLaHvMOj/MoPpUsBg3fR2k5VSKj+g5KHx+w2bKSMiomIDyjq8i2wsRXVJYqMPJw2
	SCeG3q94cBm7w+uB4b/zUvkagYwfUFLPagFvi0wdkRFfrFF68MUQcCJc1Q2rBneM/c2VJoSRDozDE
	6g6XvDqtY/ETY5Xwq3J6EZVHCBTaz7ZiOxFaTcyUbo5p/ugRHdv6DD1J+C40+gG3vPwojocNCu4Y1
	vacmtqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQmK-00000005jUy-2geq;
	Thu, 02 Jul 2026 23:25:08 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQmI-00000005jUY-2SlT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1783034241;
	bh=qKGLrumscDa5mByfkzFeZJ3yixyhaRNqBH/+a4LrUuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kI0ZrrZfPlxoG4/Z0tiTo2s0vWlYKNATLBiP+F25yyonDZ9d4qvoTn6RBqG7qY7AW
	 WblJ62o60WiK6or6rQtHk+4Ckm8u/LJAaF7z0/Le66MGclQuSpZb4MwCqIpEZf8IzN
	 ICDUW3K6pQOVBCq7m04FsXDSaNbO/EJlT2BkR5Ho=
Received: by gentwo.org (Postfix, from userid 1012)
	id C7D14406ED; Thu, 02 Jul 2026 16:17:21 -0700 (PDT)
From: Sayali Kulkarni <sk@gentwo.org>
To: linu.cherian@arm.com
Cc: anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	Sayali Kulkarni <sskulkarni@amperecomputing.com>
Subject: [PATCH] arm64: tlbflush: add debug counters for local vs broadcast flushes
Date: Thu,  2 Jul 2026 16:17:05 -0700
Message-ID: <20260702231706.3375924-1-sk@gentwo.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523134710.3827956-1-linu.cherian@arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_162506_659362_817865DB 
X-CRM114-Status: GOOD (  21.97  )
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

From: Sayali Kulkarni <sskulkarni@amperecomputing.com>

Add vmstat counters under CONFIG_DEBUG_TLBFLUSH to measure how often
the active_cpu optimization takes the local fast path versus a broadcast.
Tracks local/broadcast for mm and range flushes, plus the count of
broadcasts forced by active_cpu being MULTIPLE

Signed-off-by: Sayali Kulkarni <sskulkarni@amperecomputing.com>
---

Hi all,

To help analyze when this patch takes effect, I measured how
often TLB invalidations take the local fast path versus a broadcast, using
debug vmstat counters added under CONFIG_DEBUG_TLBFLUSH. The counters 
record local vs broadcast for whole-mm and range flushes, plus the count of
broadcasts caused by the mm being active on multiple CPUs.

Setup:
 - Ampere Altra, 64 cores
 - 7.2.0-rc1 base with the active_cpu patch plus the debug counters.
 - Hit rate = local flushes / (local + broadcast), read from /proc/vmstat before and 
    after each run.
 - Test: A program that repeatedly flips page’s protection using mprotect(), with a
    configurable number of threads sharing one address space 

Results: 

 workload                           local fraction
 -----------------------------      --------------
 mprotect, 1 thread, pinned         ~100%
 mprotect, 2 threads                ~0.06%
 mprotect, 4 threads                ~0.06%
 mprotect, 8 threads                ~0.06%
 stress-ng --vm 1, pinned           ~100%

For a genuinely single-threaded process, the local fast path is taken essentially 
every time. Both are consistent across repeated runs.

For multi-threaded process, active_cpu becomes MULTIPLE and broadcast takes
place for nearly every invalidation. 

One caveat worth noting: "stress-ng --vm 1" is not actually a single-CPU 
workload. It spawns a parent, a management process and the worker,
and the scheduler places them on different CPUs, so the mm becomes active on
more than one CPU and invalidations broadcast. Unpinned, this gives a highly
variable local fraction (I observed roughly 7%-57% across runs). Pinning it
to a single CPU, or using a genuinely single-threaded test, gives ~100%.

So the local fast path is taken while the mm stays active on a single CPU; 
broadcasts return once the mm becomes active on more than one CPU,
whether via task migration or via a workload spreading itself across CPUs.

This is a hit-rate measurement only; it does not measure the performance
delta of the local vs broadcast path, which would need separate kernel-level
timing.

Thanks,
Sayali Kulkarni (Ampere)
sskulkarni@amperecomputing.com

--
Debug counters patch used for these measurements is below / attached.

 arch/arm64/Kconfig.debug          |  9 +++++++++
 arch/arm64/include/asm/tlbflush.h | 21 +++++++++++++++++++--
 arch/arm64/mm/context.c           | 14 +++++++++++++-
 include/linux/vm_event_item.h     | 13 +++++++++++--
 mm/vmstat.c                       |  6 +++++-
 5 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index 265c4461031f..2229655f9d3d 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -20,4 +20,13 @@ config ARM64_RELOC_TEST
 	depends on m
 	tristate "Relocation testing module"
 
+config DEBUG_TLBFLUSH
+	bool "Add vmstat counters to analyze TLB handling"
+	depends on DEBUG_KERNEL
+	help
+	 This option adds vmstat counters that track how arm64 TLB invalidations
+	 are handled, specifically how many take the local fast path versus a
+	 broadcast. The counts are exposed in /proc/vmstat and are useful for
+	 analyzing the active_cpu optimization. If unsure, say N.
+
 source "drivers/hwtracing/coresight/Kconfig"
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 90b4e4147590..cbda203aa020 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -16,7 +16,13 @@
 #include <linux/mmu_notifier.h>
 #include <asm/cputype.h>
 #include <asm/mmu.h>
-
+#include <linux/vm_event_item.h>
+#ifdef CONFIG_DEBUG_TLBFLUSH
+extern void _count_vm_tlb_event(enum vm_event_item);
+#define count_tlb_event(x) _count_vm_tlb_event(x)
+#else
+#define count_tlb_event(x) do { } while (0)
+#endif
 /*
  * Raw TLBI operations.
  *
@@ -370,8 +376,12 @@ static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
 	}
 
 	local = active == self;
-	if (!local)
+	if (!local) {
+		if (active == ACTIVE_CPU_MULTIPLE)
+			/* broadcast because mm is active on multiple CPUs */
+			count_tlb_event(NR_TLB_ARM64_BROADCAST_MULTIPLE);
 		migrate_enable();
+	}
 
 	return local;
 }
@@ -490,10 +500,12 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 		__tlbi(aside1, asid);
 		__tlbi_user(aside1, asid);
 		dsb(nsh);
+		count_tlb_event(NR_TLB_LOCAL_FLUSH_ALL);
 	} else {
 		__tlbi(aside1is, asid);
 		__tlbi_user(aside1is, asid);
 		__tlbi_sync_s1ish(mm);
+		count_tlb_event(NR_TLB_FLUSH_ALL);
 	}
 	flush_tlb_user_post(local);
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
@@ -712,6 +724,11 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 			dsb(nsh);
 	}
 
+	if (local)
+		count_tlb_event(NR_TLB_LOCAL_FLUSH_RANGE);
+	else
+		count_tlb_event(NR_TLB_FLUSH_RANGE);
+
 	flush_tlb_user_post(local);
 }
 
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index f34ed78393e0..d41c1b517abf 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -11,7 +11,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
-
+#include <linux/vmstat.h>
 #include <asm/cpufeature.h>
 #include <asm/mmu_context.h>
 #include <asm/smp.h>
@@ -443,4 +443,16 @@ static int asids_init(void)
 		set_kpti_asid_bits(asid_map);
 	return 0;
 }
+
+#ifdef CONFIG_DEBUG_TLBFLUSH
+/*
+ * Helper so the TLB flush inlines in tlbflush.h can update the vmstat TLB
+ * counters without pulling vmstat internals into the header.
+ */
+void _count_vm_tlb_event(enum vm_event_item x)
+{
+	count_vm_tlb_event(x);
+}
+#endif
+
 early_initcall(asids_init);
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 03fe95f5a020..edd508f3b1fc 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -117,10 +117,19 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 #endif /* CONFIG_BALLOON_MIGRATION */
 #endif /* CONFIG_BALLOON */
 #ifdef CONFIG_DEBUG_TLBFLUSH
+		/*
+		 * arm64 TLB flush accounting for the active_cpu optimization
+		 * local_* counters mean the local-only fast path was taken;
+		 * the broadcast counters mean a full broadcast was required.
+		 */
 		NR_TLB_REMOTE_FLUSH,	/* cpu tried to flush others' tlbs */
 		NR_TLB_REMOTE_FLUSH_RECEIVED,/* cpu received ipi for flush */
-		NR_TLB_LOCAL_FLUSH_ALL,
-		NR_TLB_LOCAL_FLUSH_ONE,
+		NR_TLB_LOCAL_FLUSH_ALL,     /* local whole-mm flush */
+		NR_TLB_LOCAL_FLUSH_ONE,     /* used by x86 */
+		NR_TLB_LOCAL_FLUSH_RANGE,   /* local range flush (incl. single page) */
+		NR_TLB_FLUSH_ALL,           /* broadcast whole-mm flush */
+		NR_TLB_FLUSH_RANGE,         /* broadcast range flush; also single page */
+		NR_TLB_ARM64_BROADCAST_MULTIPLE,  /* broadcast; mm active on multiple CPUs */
 #endif /* CONFIG_DEBUG_TLBFLUSH */
 #ifdef CONFIG_SWAP
 		SWAP_RA,
diff --git a/mm/vmstat.c b/mm/vmstat.c
index f534972f517d..b5b7a3268cb2 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1433,7 +1433,11 @@ const char * const vmstat_text[] = {
 	[I(NR_TLB_REMOTE_FLUSH)]		= "nr_tlb_remote_flush",
 	[I(NR_TLB_REMOTE_FLUSH_RECEIVED)]	= "nr_tlb_remote_flush_received",
 	[I(NR_TLB_LOCAL_FLUSH_ALL)]		= "nr_tlb_local_flush_all",
-	[I(NR_TLB_LOCAL_FLUSH_ONE)]		= "nr_tlb_local_flush_one",
+	[I(NR_TLB_LOCAL_FLUSH_ONE)]             = "nr_tlb_local_flush_one",
+	[I(NR_TLB_LOCAL_FLUSH_RANGE)]           = "nr_tlb_local_flush_range",
+	[I(NR_TLB_FLUSH_ALL)]                   = "nr_tlb_flush_all",
+	[I(NR_TLB_FLUSH_RANGE)]                 = "nr_tlb_flush_range",
+	[I(NR_TLB_ARM64_BROADCAST_MULTIPLE)]    = "nr_tlb_arm64_broadcast_multiple",
 #endif /* CONFIG_DEBUG_TLBFLUSH */
 
 #ifdef CONFIG_SWAP
-- 
2.47.3


