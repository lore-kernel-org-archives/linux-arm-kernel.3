Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61E7CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb/LHn6YrmdgZdljrcbF7YxTFHXAXRpDPhG81H7HP7M=; b=34YsZrsHDafbCxddrUIkwVxOto
	LzSMzfK+gfo9WGOoKOakxgDVgsN2zauw8UFI9GNk/2KEhzKQtgaU9dLgdwduf9IjUNpYZ9uosfiQr
	EUoRYtVvDBq8MfJTD0XOJk5e9R9B1DVb0wNNH6Q8qsG7Y+vSahjFMXtpJQyKh7w2oGGQjspOG+GPB
	7/DlbFgSnRs44SqC6CQ12PSrmzflCCYwze49ZbLcXkDY4CPN1Ia3qla70lZIFoODMcLquRqAMHXZB
	25od8UirbNxlVUij+jG7mglQvkygMr6A9PKabuZv/pXHrZzr/Z4yQSLsyyCbp3hB7kQciTDnyrtye
	j9fAYyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn89-00000007TLZ-2G2t;
	Mon, 19 Oct 2026 13:10:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn82-00000007TEa-1POt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD49F6020A;
	Mon, 19 Oct 2026 13:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356A61F000C4;
	Mon, 19 Oct 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415413;
	bh=Yb/LHn6YrmdgZdljrcbF7YxTFHXAXRpDPhG81H7HP7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=arD8Tfou+Nn5srm0vu5BqKqra8FirHoi8VO58OWbN6bWw3bzWyqXcw4+7R2c2Ps7S
	 uzqeSmRYJ+ONJAqKAbj8SZGcbMcvPF9gUHUH2m2BnA1EMQ9AcK8sF2slwGvSgNVl7q
	 kcCLjlNxKRSJ5YuvcywolQv4rFImtC2YczNq5w+aKgdqW9aQLDrQvUh0o0LB2dtQVn
	 O32n6G2tIiRqb5r/KogvuX5SIQSWpjlZzDgLK7uLyH5aWsTxzHUGg4o0IIACVsgxng
	 PCZL2sHhtH7DKh9rC8HKH8eO3jrXp3FcVLYlg7hNjKHQ6P+rIkTLqS9sep/cy2xGbr
	 KBvHjmEwvpXLw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 23/49] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:30 +0200
Message-ID: <20261019130856.49711-24-frederic@kernel.org>
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

The teardown callback here simply performs IRQs disablement, which can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 27e6542fb6c4..90d37ee0f282 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


