Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72314CCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KUzkwxT6B3k7iZO7xyoYKNfooeaFIjmsalL+8Yuh5g=; b=IxjZCh9pqvDx9D9FTJdzrX6hnW
	awJmnvmVClowqDxidvgvxq7K//V9pqOuyEFGw+2aCOEnNfbsbn9/rBZZF+4X2KB72ZIkypWLDNkhR
	nMvnNpdbwekEbfxknMdJITFJUewzzptH/D9B9NpsamQQ7m/0nMDlwBkGnfWCW1zYIE64oW5brpfRn
	tfDSR7a2PxaJUvrsFH2pQ+GmwhF8UB5rO60eXX3X/hAaKChNvli4A3SuQzsXdEpth8Do3jUt8xcAM
	d3hQCvSQKTwSp84wxkLvnpImzfJ2HAPyTbscny7xPIQ19qe4TNBzGbiQ47//JBWLowVlCuQDwkNk3
	6AECppVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7x-00000007TA9-1w6y;
	Mon, 19 Oct 2026 13:10:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7u-00000007T8V-1d0I;
	Mon, 19 Oct 2026 13:10:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA9E760214;
	Mon, 19 Oct 2026 13:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB22A1F000C4;
	Mon, 19 Oct 2026 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415405;
	bh=5KUzkwxT6B3k7iZO7xyoYKNfooeaFIjmsalL+8Yuh5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oaj/uQ0xpKpH+RbLxHdNBhU0cH4rJi/VrWI8reVtPQ1VmXDt57S4itU06PMtqTy33
	 ul08ke7/hVuzuRe7tWsdSBPIxOv1mGIQCg6ESobCEJ3w94Hv9FoxUyStbZe+tBqLIb
	 NnLQqczJfhVQupMFx2i+0YGj+ON+cQ0hyQy7jGudFAMs3mgMFD/7zpQjG4PLV3y4QF
	 gLpgaaQMMxbcgZZ5yt584n13abXYrWYtxQkB6dFjAK2KPxFUYd8QhnOYwuQbeLHlbn
	 HcTLGCGayeRAqsO/Qd69JerrzwbcUSgFESjuqrAhnekFWFQ94/tqQFy9SevwDgByip
	 EGrXfK//znusQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 20/49] perf: RISC-V: Move CPUHP_AP_PERF_RISCV_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:27 +0200
Message-ID: <20261019130856.49711-21-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here:

* Disables the per-cpu IRQ
* Disables user-mode access to the CPU counter
* Disables the shared memory snapshot of the CPU PMU.

All these operations are local to the CPU and should be able to execute
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 95cc6655cf7b..c69a265e4383 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_ARM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


