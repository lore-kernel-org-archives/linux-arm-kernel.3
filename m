Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA60CCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6bzNLxpYNUITKX58xGsvra/Cn0d0UUUdSZn56eyZ7E=; b=Y6421X5O1baYa8xR7nUFc3mszR
	yKMmJgY2C8Up1PtrQXD0ymrchyMVGHYPTJcM0TpLxtgB/pwdY/UKSMgZ8krhP5a0wx9mjxPp2gnvS
	ohuW2K4zOhzMVITGd92GyaH0bsMLfZDdtqLqcTIZ2k7YDGJ2VgIYcyZ+zHjGt/FJJiBprhsqTZldb
	8N0rVoGjF4TePKn3u6ttRBIKSw+H5jcDU5E8iNAgvpAJzowQTsyjSt0nJsrV5VkJALVSlpy1R1ye9
	sUE0DcUf0WCHpADxftLM5tGvvri+rp/fe2vvZk1wb/q/rtD5t3Oax8hO8AwCoen56ee7WpurdjFj9
	3l58C/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn89-00000007TMC-37AX;
	Mon, 19 Oct 2026 13:10:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn86-00000007TJN-3Ld0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E3C94183A;
	Mon, 19 Oct 2026 13:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FFE1F000C6;
	Mon, 19 Oct 2026 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415418;
	bh=H6bzNLxpYNUITKX58xGsvra/Cn0d0UUUdSZn56eyZ7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KHDeNEIfiUoy/yBewk4Bum2FRQ2vVsMQ4iBe3RmKTpoWDvr9+gbYaQ4x7q1H2Mqxm
	 ZZ5izqE3OeuuoOGWUUyMMAQ/CzOECoVKW8MbmVK4Kclq2FBatd6KfgxSQ22+deq40v
	 lqOkHguNOGkSjWuSr5QhKMWBBfsEccG4cClIw29r2S9pjejpeg06UXgt1ahN2khS7f
	 7nt7zi5Tayg3TyWtAd+zzFMfl02B/et89puu6ydhVBy+JzF495IHGTp2PaJOQO4HMx
	 1iqjl4ejXinyC2wO+doKSw/P13wb0aST9NURBrQZSx5xi1j0DagEhPgB5vgoP1I09Q
	 OJ8gHgGMlXjGg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 25/49] clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:32 +0200
Message-ID: <20261019130856.49711-26-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index ca335111abb2..7bc94829b68c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


