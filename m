Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F8CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfFnHIQswXgjAATM2WjaIntcOReaKHtse3Er3j4flI4=; b=TXKikrOfklpn5Lkihfi/eaXR7I
	Yq9al61IhOEZKAptrl8uGd/5AXY7cmT83DlNM1Q+d5WaIp5nlH2m6j1AuA0nqpJ/KbU+IffrN/LfR
	SwiZOCVJ5RJcuk1JUUKEKylwKfjZxsxFv4GhNE5XUEklDRNdipsGKLO8FAMa6nCmoqQmtO9NX3M8+
	hWSQ/LnHTfKhjPfsBMLj+T/BuAnskBakZWCsRFZX9U0wnQYBt+avC7pTEhJd4Vsi5fCkW/c4aKybV
	Dq9lsI8KW7N9/cDX+/p3UcqBTq2Yr3RfkmIUKKSgVW2wTr+bAXr+5qxlmhzmAxSfdtNe5fN6hj+wq
	zWmhiYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7x-00000007TAa-2uxx;
	Mon, 19 Oct 2026 13:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn7w-00000007T9I-2Fdn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E181A4183A;
	Mon, 19 Oct 2026 13:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76411F000C5;
	Mon, 19 Oct 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415407;
	bh=JfFnHIQswXgjAATM2WjaIntcOReaKHtse3Er3j4flI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GFLzlrrNT+70mA4GzKfeMRQNoaifWC7yKQlW5LhmrYCpOt1NItlopgVdL/5SX/es9
	 /C/UIhXQso0AN0oXVTdy6lYWAwYo0Rj0eeZRc7dIIBl4582zR2YkinIEZbOi8vfVkr
	 zrKh8N1yM5Ru1kk8qPkX25+c/2rZnQ7zNjNRxpCSqV5RJxGzl9R98lGN8TOB4Y3gwP
	 DWwQrHPF6LFcRVippaz1QQi+d/lfBH97dumtl7sHIHuY62jUrSanx9ELq2EWTibXso
	 4Ll1EIXdq2bIMe0odF7DGEo5VskUQbDhCDzsh6E4noYg/Su3q38rZyYGZ/rVuxKYtQ
	 eZGgCLlAMnKwA==
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
Subject: [RFC PATCH 21/49] ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:28 +0200
Message-ID: <20261019130856.49711-22-frederic@kernel.org>
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

The teardown callback here disables the L1/L2 cache prefetch and the
write full line of zeros mode. These operations should only impact the
outgoing CPU and can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c69a265e4383..c08ef67e3499 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


