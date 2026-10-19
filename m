Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734CDCCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6PkF4bnp6I0pVDOC8OuHY00fV+VdeZIgzJShsLaxsQ=; b=xzGu0PpJFeJCW85IBr5iiQ7X5b
	jnzTqxcowhhWRSnqeU7JUp8n7xMj9rIqgSbDBaroFCowVDeyVL22676hKsM4DOc2dgZedUGECPkWF
	GkSuEkYwX8b8Ld0+HgMqcCT8L0HPTMbGIEJ6WL2ow0LzzAw3cE2jsCmNQS2L6+bhhXs5sXyekL39h
	SBW8f5QNraE5jNY0zxRSvNyhjtaLAfH1ZzmhLk1ppy+3hmaZTxP3QRijLKCtK2H/kyZ79Sm4kg8Nm
	RMTcUSct+tn7XcRIZ1WFx/p3M6GoV1RfwyEjKpy3uAH/H8CYwkK3Uxv3COIWAz1l0AWq71C6WmGCc
	fGMxRnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn82-00000007TF6-1YQ8;
	Mon, 19 Oct 2026 13:10:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7z-00000007TC5-0bkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEBBE40140;
	Mon, 19 Oct 2026 13:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E211F000C6;
	Mon, 19 Oct 2026 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415410;
	bh=r6PkF4bnp6I0pVDOC8OuHY00fV+VdeZIgzJShsLaxsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RQfP/Wu/5UbTHx27ISIBvQBqbCm+3a/H+6MqmbDpIiq140xxhhCuWJGpTASB78+4w
	 kwNn9qtpFHJDEYXI1WuuznYeWHwi6qUJDuK+xuyjLiqf/T6AIkMP3bB7o+MRSm1+wK
	 zswGvgjCtBlSLOaXL18WF3VB7zyutByrJF8bwxccXrT+hAE5/eJScRWeqH2V1nxScQ
	 WDbpEd086FTp+MTPhRKSz/lFlanDpF+JrGn34z2W8CJY+2zc/ObfZ8Zu7kC5Aczm0k
	 ei+/ENwXcP432E6HX02g2Vs5kOdTKyv225a5aFx/ffU5sWskf7qfJDROnF3wWnMsJ2
	 t4wr/36dYgeFA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 22/49] clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:29 +0200
Message-ID: <20261019130856.49711-23-frederic@kernel.org>
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

The teardown callback here simply disables the IRQ and clears/ack the
interrupt bit on the local device. All these operations can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c08ef67e3499..27e6542fb6c4 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
+	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


