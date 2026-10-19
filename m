Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F71CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVTV66EQARd6AtvNeKLH6twwh1vHhGz7zukKT167vwY=; b=dX1K+JCEjDIRpvxOz5lV+ZH/zW
	OywvuWWdRga87QAzk3/KzegvVs1bxLSb5MMM1AZOVjpAqYH3R+K515p/Lo27AdzvUhGBKHXTmf9jC
	UQkvnLCGpuYzi9nsm4RgahEGTLrr6x9OxHjC5pdudgeE0Q+3m8EmwgYnPJ4dzUDyC5QSbMq5/dGL4
	gW+gD7lzW030mQj8FwWvM3Xu4AhSV0FdGUGXi5Jwz9ertJxilF4dJSNHjHAqwWdbWD1lrbz+onk06
	c8MvdjNwAbqTTbpHZvKVoQ00y36d+j1YSgfVQZ0J2d2jTrr1K9WMg44WPPXMw9GqYn8CJ9Li2tum4
	YE3UG3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7B-00000007SoI-2ojE;
	Mon, 19 Oct 2026 13:09:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7A-00000007SoA-423Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:09:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0819B60258;
	Mon, 19 Oct 2026 13:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629221F000C5;
	Mon, 19 Oct 2026 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415359;
	bh=uVTV66EQARd6AtvNeKLH6twwh1vHhGz7zukKT167vwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KIAKJ1bfFSWtcXVF1B2lkRTfoMjdHlc2fA5Q+C67CfWsLwT1edMHgtPraNrtsjBEF
	 yWtU+FF7QvhQWJHlZubj+2QyUSZ1EH7SoI6q7hmKjQ9mRKTJWP5Rxc5FiioznW+Vm2
	 5SxGQxzJF0TxYJf+Yd+RDdgeJ/g42xzBW5j0pTwxB6XQKtB8C0z+ErF7/9OxWjSeB+
	 G0kRqhW4uIPJgKM4e6GsLkt0bN7xLVEx+1UzyyN3/H65cAfb065FwQgXnzF/BSpQf8
	 UoCfepbafHWusQM6FTjEA8pmrtDrYIrje2rJSXPT5eUQVUGYLrvV4ILklvRRdd7jZ5
	 PzbsaxOVuubWA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 05/49] cpuidle: Move CPUHP_AP_CPU_PM_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:12 +0200
Message-ID: <20261019130856.49711-6-frederic@kernel.org>
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

The teardown callback here only touches local data and also the local
power device under its power lock. Therefore it should be safe to run
against other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f22afb213d6f..68eb8de820d5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RCUTREE_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CPU_PM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_RCUTREE_DYING);
+	WARN_ON(st->state != CPUHP_AP_CPU_PM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


