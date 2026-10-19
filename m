Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA2DCCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rzj8BT/yawvlFvWiKgY7YWEOrf8AruxVG6QySahLhSk=; b=x3J24fB9A6nztEHhnkE1TuCFAQ
	SHuE4cqVn4QU32a9SXIPBPu1YAq6ennsWM9ubgOsexIK+INkiDIBoXNmszzuIZm2SS58odh0x2TLQ
	kJF28sl0PhQVpDcANzhwQjuHDxMZU404/WxPei/fX4fkIvkprAOaQP45ycU/KU0QCEp1mtiRW0CwD
	aW77uy8fb9a7HSvPkdjd0x+4/t48TmyK8bQcrOGhmOTeOu40NkGBAKXg/Q7HpRMN2XivpgugYaUL3
	e5gBU8IdgsPcYC3Cme1KVVd9aEk+PTRMxKM+Ge75WHSrOsz1eTAi/G1TIJxcJUzlDztzCu2ObMik4
	WhWw5rMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn95-00000007U43-19sL;
	Mon, 19 Oct 2026 13:11:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn94-00000007U3B-1icM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:11:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D40266020A;
	Mon, 19 Oct 2026 13:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332541F000C4;
	Mon, 19 Oct 2026 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415477;
	bh=Rzj8BT/yawvlFvWiKgY7YWEOrf8AruxVG6QySahLhSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fFrdQ4ZBvqImuWldbCFDLDLKbl3TWVVr/rHfINDcsOZRggF0LXKDHBvzkLErT8zzV
	 KF6ryk/CTVKV9vUM/nLP5LH+es/yX43fP8l02r/o4eKOV24Q5JVn63WmQcWt1oPA0P
	 Ibm/hw4lfaX8TdRYAu3yusIM1IRIIkyFbEDYCmpldhC5VK3zZCTtMy7OClZXtpZS6n
	 Tki3CGAQEYrCd6ZAjThgbybkptMXqQyXc9K2pqd3/ESnRTi6YwftymrmON/qJUKHZE
	 CI0szDe0UVmqswwX0ibh90I4nDUzv2CapfP4fFIPJBD3M2QocoPt5AV129SUsa+RUX
	 +hMmEDQBwir7w==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 49/49] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:56 +0200
Message-ID: <20261019130856.49711-50-frederic@kernel.org>
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

It *looks ok* to disable the cache readahead globally while the other
CPUs are running.

Move this teardown callback to post stop_machine() accordingly.

But please double check.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 87680f7c6493..36f8e6588196 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ONLINE);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
+	WARN_ON(st->state != CPUHP_AP_ONLINE);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


