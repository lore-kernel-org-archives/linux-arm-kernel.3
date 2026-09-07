Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153A6C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaWEgmueo8IVck4dwZ9rseBcFsOQjJHuo9EpQo9RZ2Q=; b=IM2+vQSWpByZjoJW2pf1S6pggl
	9+Fg5jOYTvuySSgDyfRLm0FuuJoRfyPUxOn3LwUnQ2J12HGdqJldgY68pU0YQ2WbNh43FCP9Mgayx
	gBnlQ6CwjKId7ru4sgTOsL6KyNAC1r92m8QISGZmG610cdyvG6srLX+eCYjcRuFjRMy9MgtUY91DN
	NjaX4l6tYENjvIHsy/BJVzHibiqNvyzYNFzfDMLwYHPchkasLdNhi02w6Onvz8fbVcPW9YWuX/eGH
	hWA4+Xs0FOsiSF5SZjJoXbCukbaHv74VhTevhfoUAu8KQSsLLTnZy6B+1e1tUs/0bkCn/H1sfXS19
	n9KywiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOl-00000007LIS-3lK9;
	Mon, 07 Sep 2026 16:40:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOi-00000007LHG-0wo3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:40:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E417843319;
	Mon,  7 Sep 2026 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A86F1F00A3D;
	Mon,  7 Sep 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799243;
	bh=PaWEgmueo8IVck4dwZ9rseBcFsOQjJHuo9EpQo9RZ2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GqQiwLF6RV4PV/kPo9LX/Uy9wh7QegNKRRoE7fAt79YnY2JfLZFFZy60iRpZOp5WB
	 tdjgrwZcdhoE1wd/pTZSJfNdGTo8O5ppaUQI4ffmQFR4/9ummYcWOwiO4PJ6CBotNx
	 sHVV8Kg5d3WlkKtpMfEcyWchmhitnmtbqd/ff8eG02835Scub+c5eC+InTP87TQY75
	 unamOUxBVHNQI1zhqs1SffAPEJF/g1zbbRegcGwI72bhowr2OPT9SgceLYEdAUYk9q
	 vtGYxNdK6m5Fk8UumgaEWP2N9XxlKr2NLJmo4G+Ov2xx7JSi3QK25FPrFpgERLqK3a
	 KEBuXf0R5I3dQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
Date: Mon,  7 Sep 2026 17:40:06 +0100
Message-ID: <20260907164024.17164-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
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

On some architectures (such as arm64), cpu_relax() is effectively a NOP
and so isn't particularly efficient when used in a tight polling loop
such as the CPU state synchronisation in cpuhp_wait_for_sync_state().

Once an incoming CPU has reached the SYNC_STATE_ALIVE state, we know
that it is executing within the kernel and so we can use the more
efficient polling mechanism provided by the atomic_cond_read* API.

Extend the generic implementation of arch_cpuhp_sync_state_poll() to
take the state details as additional parameters and polling using
atomic_cond_read_relaxed() instead of cpu_relax() once we have reached
the alive state. No change on x86.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/x86/kernel/smpboot.c  |  2 +-
 include/linux/cpuhotplug.h |  2 +-
 kernel/cpu.c               | 13 +++++++++----
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ba01a9e919b7..362f85cbdbaf 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1138,7 +1138,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 		pr_info("CPU %u is now offline\n", cpu);
 }
 
-void arch_cpuhp_sync_state_poll(void)
+void arch_cpuhp_sync_state_poll(atomic_t *st, int old)
 {
 	if (smp_ops.poll_sync_state)
 		smp_ops.poll_sync_state();
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index feb32949aeea..bbcee650155f 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -509,7 +509,7 @@ static inline void cpuhp_online_idle(enum cpuhp_state state) { }
 struct task_struct;
 
 void cpuhp_ap_sync_alive(void);
-void arch_cpuhp_sync_state_poll(void);
+void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 bool arch_cpuhp_init_parallel_bringup(void);
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 97a9bfe4edad..d9fe204f02cb 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
 	(void)atomic_xchg(st, state);
 }
 
-void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
+void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
+{
+	if (old < SYNC_STATE_ALIVE)
+		cpu_relax();
+	else
+		atomic_cond_read_relaxed(st, VAL != old);
+}
 
 static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state state,
 				      enum cpuhp_sync_state next_state)
@@ -328,7 +334,7 @@ static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state st
 			return false;
 		} else if (now - start < NSEC_PER_MSEC) {
 			/* Poll for one millisecond */
-			arch_cpuhp_sync_state_poll();
+			arch_cpuhp_sync_state_poll(st, sync);
 		} else {
 			usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
 		}
@@ -395,8 +401,7 @@ void cpuhp_ap_sync_alive(void)
 	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
 
 	/* Wait for the control CPU to release it. */
-	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
-		cpu_relax();
+	atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);
 }
 
 static bool cpuhp_can_boot_ap(unsigned int cpu)
-- 
2.55.0.979.g7e5102b832-goog


