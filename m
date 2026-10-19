Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D252CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVzuQgyRSMcF1cPObbB3KELngDUQbdY4OVt3CdDmVuw=; b=dHaseI0og7z77Z1m1wzPQzN2qG
	5C4m2WpMcBGMPhuguvuBG4ggNjF4TLq7jqL0RgF4TP9S+gYqkY5gGNbn+yKVqoe+USvVgLzK2yA/1
	zEs4rsnfINrWNcSnaup4KOaWcumw/YyxPtlRDw2nFjv2MIQJa2OHbBAYQb+7KWIs44aX5IoYthmWX
	gpTDb9RqWXcCp8xIrqwnJl9fQ6EUP/Z+Te21QlCjcln38bWSVsGdprNeB/RbR0FdhglPZpB2j1Hfs
	LGhEWa52cOubAdZEVMeoGqdnz2rkJDCNBUJoPIB0hocjlcXxz0Lf3qCSGAVFV7d77NN7peAp/D5P4
	6yOBNP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7o-00000007T49-15Hk;
	Mon, 19 Oct 2026 13:10:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7l-00000007T3L-2Th9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:09:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD82160238;
	Mon, 19 Oct 2026 13:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7790E1F000C5;
	Mon, 19 Oct 2026 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415396;
	bh=tVzuQgyRSMcF1cPObbB3KELngDUQbdY4OVt3CdDmVuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n3LxuVl8s9roRBlbS2hHlqvUnSN8pHgIXJAetNqTKL08/I3LtNCjYSAAXpMzDdaCH
	 v0AubukCKCs8tN6qp/d3N4xHqiCrKG2wRTE+cl7JXP4x/g+0/Y/9IiFP4WP/b+XMQC
	 PTJt+U5ZyjjzevN1Xoy61bZEacx6C8hX+wJKqw79/8mpwDbwAaZw1P+XOSqYtiPwLx
	 5b0IHf0u96+sZTH6mZLoZ5tZibz+oEOzJUmKuyiRaH6o6ujmNjCkhpFPzwSeuVRZml
	 U+KBpUE12sCqulu2uwtahhQYdRCpGMdFelYx/XghQ1s8B8YX+rkjnhZKL1ucT5bauL
	 3ZMiFwqHO4fTg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 17/49] ARM: vfp: Move CPUHP_AP_ARM_VFP_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:24 +0200
Message-ID: <20261019130856.49711-18-frederic@kernel.org>
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

The teardown callback here only removes the local VFP state which is
never accessed remotely. As such it can run concurrently with other
CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c20a822df803..b7f5d0683ff7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_XTENSA_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_VFP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_XTENSA_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_VFP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


