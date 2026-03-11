Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C5F1125858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RP68PcI6ervNypYQaigF2gEu0Zy3JEcNuqJVUw3tqk=; b=IQ3nY/AiJV7Enm2tWiNEYYwLnO
	Beq9jB6kTRuRZNoOcoLL1YtEXfN/Cup96H09jYiPq+km9k4mXj30M5Bl9xyEOKCOp0YR/81naRTKM
	pOacWbwRkyW050L+QJ/i3GaGPZ5/A2mdr270j6seh5Jt+qhN0aZwk1uI3bpU5HgcIWGesPv/DFE9Q
	jzHv/TJxRXcDk9tLo/VkfYw+6XdJJUqiWToUrembuFaECLEmdZJV/DRWtP+jArQHP41vtqj3FHY0p
	ZLVZOw08ZNWgqfsxjePjvp9qAEGbVVSWeLnE2KaLGsXNVa1QW+MvLrb8fsPiqJzMtBw+kJnoBZ3DQ
	zfHtsvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Nil-0000000C5Y8-3wd9;
	Wed, 11 Mar 2026 17:51:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Nii-0000000C5XF-43WN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:51:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 330381682;
	Wed, 11 Mar 2026 10:51:35 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.1.194.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E166B3F73B;
	Wed, 11 Mar 2026 10:51:39 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	David Hildenbrand <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: mte: Skip TFSR_EL1 checks and barriers in synchronous tag check mode
Date: Wed, 11 Mar 2026 17:50:50 +0000
Message-ID: <20260311175054.3889093-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_105145_090865_6FE44F64 
X-CRM114-Status: GOOD (  12.94  )
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

In MTE synchronous mode, tag check faults are reported as immediate
Data Abort exceptions. The TFSR_EL1.TF1 bit is never set, since faults
never go through the asynchronous path. Therefore, reading TFSR_EL1
and executing data and instruction barriers on kernel entry, exit,
context switch, and suspend is unnecessary overhead in sync mode.

The exit path (mte_check_tfsr_exit) and the assembly paths
(check_mte_async_tcf / clear_mte_async_tcf in entry.S) already had this
check. Extend the same optimization on kernel entry/exit, context
switch and suspend.

All mte kselftests pass. The kunit before and after the patch show same
results.

A selection of test_vmalloc benchmarks running on a arm64 machine.
v6.19 is the baseline. (>0 is faster, <0 is slower, (R)/(I) =
statistically significant Regression/Improvement). Based on significance
and ignoring the noise, the benchmarks improved.

* 77 result classes were considered, with 9 wins, 0 losses and 68 ties

Results of fastpath [1] on v6.19 vs this patch:

+----------------------------+----------------------------------------------------------+------------+
| Benchmark                  | Result Class                                             |   barriers |
+============================+==========================================================+============+
| micromm/fork               | fork: p:1, d:10 (seconds)                                |  (I) 2.75% |
|                            | fork: p:512, d:10 (seconds)                              |      0.96% |
+----------------------------+----------------------------------------------------------+------------+
| micromm/munmap             | munmap: p:1, d:10 (seconds)                              |     -1.78% |
|                            | munmap: p:512, d:10 (seconds)                            |      5.02% |
+----------------------------+----------------------------------------------------------+------------+
| micromm/vmalloc            | fix_align_alloc_test: p:1, h:0, l:500000 (usec)          |     -0.56% |
|                            | fix_size_alloc_test: p:1, h:0, l:500000 (usec)           |      0.70% |
|                            | fix_size_alloc_test: p:4, h:0, l:500000 (usec)           |      1.18% |
|                            | fix_size_alloc_test: p:16, h:0, l:500000 (usec)          |     -5.01% |
|                            | fix_size_alloc_test: p:16, h:1, l:500000 (usec)          |     13.81% |
|                            | fix_size_alloc_test: p:64, h:0, l:100000 (usec)          |      6.51% |
|                            | fix_size_alloc_test: p:64, h:1, l:100000 (usec)          |     32.87% |
|                            | fix_size_alloc_test: p:256, h:0, l:100000 (usec)         |      4.17% |
|                            | fix_size_alloc_test: p:256, h:1, l:100000 (usec)         |      8.40% |
|                            | fix_size_alloc_test: p:512, h:0, l:100000 (usec)         |     -0.48% |
|                            | fix_size_alloc_test: p:512, h:1, l:100000 (usec)         |     -0.74% |
|                            | full_fit_alloc_test: p:1, h:0, l:500000 (usec)           |      0.53% |
|                            | kvfree_rcu_1_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.81% |
|                            | kvfree_rcu_2_arg_vmalloc_test: p:1, h:0, l:500000 (usec) |     -2.06% |
|                            | long_busy_list_alloc_test: p:1, h:0, l:500000 (usec)     |     -0.56% |
|                            | pcpu_alloc_test: p:1, h:0, l:500000 (usec)               |     -0.41% |
|                            | random_size_align_alloc_test: p:1, h:0, l:500000 (usec)  |      0.89% |
|                            | random_size_alloc_test: p:1, h:0, l:500000 (usec)        |      1.71% |
|                            | vm_map_ram_test: p:1, h:0, l:500000 (usec)               |      0.83% |
+----------------------------+----------------------------------------------------------+------------+
| schbench/thread-contention | -m 16 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |      0.05% |
|                            | -m 16 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.60% |
|                            | -m 16 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
|                            | -m 16 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
|                            | -m 16 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.58% |
|                            | -m 16 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      9.09% |
|                            | -m 16 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.74% |
|                            | -m 16 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |     -1.40% |
|                            | -m 16 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.00% |
|                            | -m 16 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |     -0.78% |
|                            | -m 16 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |     -0.11% |
|                            | -m 16 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
|                            | -m 16 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.64% |
|                            | -m 16 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      3.15% |
|                            | -m 16 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     17.54% |
|                            | -m 32 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -1.22% |
|                            | -m 32 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |      0.85% |
|                            | -m 32 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
|                            | -m 32 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.34% |
|                            | -m 32 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      1.05% |
|                            | -m 32 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
|                            | -m 32 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.41% |
|                            | -m 32 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.58% |
|                            | -m 32 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      2.13% |
|                            | -m 32 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.67% |
|                            | -m 32 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      2.07% |
|                            | -m 32 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -1.28% |
|                            | -m 32 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      1.01% |
|                            | -m 32 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      0.69% |
|                            | -m 32 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     13.12% |
|                            | -m 64 -t 1 -r 10 -s 1000, avg_rps (req/sec)              |     -0.25% |
|                            | -m 64 -t 1 -r 10 -s 1000, req_latency_p99 (usec)         |     -0.48% |
|                            | -m 64 -t 1 -r 10 -s 1000, wakeup_latency_p99 (usec)      |     10.53% |
|                            | -m 64 -t 4 -r 10 -s 1000, avg_rps (req/sec)              |     -0.06% |
|                            | -m 64 -t 4 -r 10 -s 1000, req_latency_p99 (usec)         |      0.00% |
|                            | -m 64 -t 4 -r 10 -s 1000, wakeup_latency_p99 (usec)      |      0.00% |
|                            | -m 64 -t 16 -r 10 -s 1000, avg_rps (req/sec)             |     -0.36% |
|                            | -m 64 -t 16 -r 10 -s 1000, req_latency_p99 (usec)        |      0.52% |
|                            | -m 64 -t 16 -r 10 -s 1000, wakeup_latency_p99 (usec)     |      0.11% |
|                            | -m 64 -t 64 -r 10 -s 1000, avg_rps (req/sec)             |      0.52% |
|                            | -m 64 -t 64 -r 10 -s 1000, req_latency_p99 (usec)        |      3.53% |
|                            | -m 64 -t 64 -r 10 -s 1000, wakeup_latency_p99 (usec)     |     -0.10% |
|                            | -m 64 -t 256 -r 10 -s 1000, avg_rps (req/sec)            |      2.53% |
|                            | -m 64 -t 256 -r 10 -s 1000, req_latency_p99 (usec)       |      1.82% |
|                            | -m 64 -t 256 -r 10 -s 1000, wakeup_latency_p99 (usec)    |     -5.80% |
+----------------------------+----------------------------------------------------------+------------+
| syscall/getpid             | mean (ns)                                                | (I) 15.98% |
|                            | p99 (ns)                                                 | (I) 11.11% |
|                            | p99.9 (ns)                                               | (I) 16.13% |
+----------------------------+----------------------------------------------------------+------------+
| syscall/getppid            | mean (ns)                                                | (I) 14.82% |
|                            | p99 (ns)                                                 | (I) 17.86% |
|                            | p99.9 (ns)                                               |  (I) 9.09% |
+----------------------------+----------------------------------------------------------+------------+
| syscall/invalid            | mean (ns)                                                | (I) 17.78% |
|                            | p99 (ns)                                                 | (I) 11.11% |
|                            | p99.9 (ns)                                               |     13.33% |
+----------------------------+----------------------------------------------------------+------------+

[1] https://gitlab.arm.com/tooling/fastpath

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
The patch applies on v6.19 and next-20260309.
---
 arch/arm64/include/asm/mte.h | 6 +++++-
 arch/arm64/kernel/mte.c      | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 6d4a78b9dc3e6..0e05d20cf2583 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -252,7 +252,8 @@ static inline void mte_check_tfsr_entry(void)
 	if (!kasan_hw_tags_enabled())
 		return;
 
-	mte_check_tfsr_el1();
+	if (system_uses_mte_async_or_asymm_mode())
+		mte_check_tfsr_el1();
 }
 
 static inline void mte_check_tfsr_exit(void)
@@ -260,6 +261,9 @@ static inline void mte_check_tfsr_exit(void)
 	if (!kasan_hw_tags_enabled())
 		return;
 
+	if (!system_uses_mte_async_or_asymm_mode())
+		return;
+
 	/*
 	 * The asynchronous faults are sync'ed automatically with
 	 * TFSR_EL1 on kernel entry but for exit an explicit dsb()
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 32148bf09c1dc..8da2891b834d7 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -291,6 +291,8 @@ void mte_thread_switch(struct task_struct *next)
 	/* TCO may not have been disabled on exception entry for the current task. */
 	mte_disable_tco_entry(next);
 
+	if (!system_uses_mte_async_or_asymm_mode())
+		return;
 	/*
 	 * Check if an async tag exception occurred at EL1.
 	 *
@@ -350,6 +352,9 @@ void mte_suspend_enter(void)
 	if (!system_supports_mte())
 		return;
 
+	if (!system_uses_mte_async_or_asymm_mode())
+		return;
+
 	/*
 	 * The barriers are required to guarantee that the indirect writes
 	 * to TFSR_EL1 are synchronized before we report the state.
-- 
2.47.3


