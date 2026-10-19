Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F8CCCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQ4wV/CtE843TsaJyn8NdxjU1otXO+lUSiOR4zR4+6M=; b=pkIXK0Ynji/JPdpAwXMNIjt+xP
	iog5KcMkc6LQik1nCJlTWzHuKHkGPO/JxEZR5ll8e4Z0BjpvFZOid0SPFRbT0JrBAnJWg5D3/EFiK
	ITI/yNvobzhOc6eNi9rSFzCS7t6LMqpMUcyxcQzy+T1L03klvAm+e20FMAsSMHeRkfwDV13Ds/K4u
	2mzGNdynnSORYxqP32hwxR8RullnBvBBBI/IeKVkYnkf8Gw7HvVrRgM3u844/Dq7EvkA2PJzdrfzL
	D/+YHQ0lD3NKFuq+j/cOm9nYOInm8nGkCGxYiMzibzSYPp8OorJDgGNyQx0NOm5jr7aMI527fSHg1
	FbPDI8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8n-00000007Ttm-0dCz;
	Mon, 19 Oct 2026 13:11:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8m-00000007TsY-0a2h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:11:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 924046020A;
	Mon, 19 Oct 2026 13:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E045C1F000C7;
	Mon, 19 Oct 2026 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415459;
	bh=sQ4wV/CtE843TsaJyn8NdxjU1otXO+lUSiOR4zR4+6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UYYhVV8DRwSugxc4w9TTb0o/rWDNMV80kuTV12atH3lBKClROKPctzL7bZd9hdFgv
	 PfWhK+tqVWRVA7qQkMj7dT0dnWY0hXHvfIgvLn8S4zOeBl+0okkfv7UJGsT9ZK+x6J
	 U3DvNv+Ss6hZiw4sprDxO9KEs6F6axzzZ84A2hpzBy9wwYEzr/G1ANlH5AHofU6Tiz
	 Uy5kF15EDPm7FE+G0xVDrufXD7ZER+IyTbn1RCyhJvJHjP5VxCxTbulIjhEpKg1U1Q
	 KtgogEtCjb3O4RgR5JeRmDA4jgOCJgFdhH96o7W3KYEtrATjxWWPIzXGacLidHxxvZ
	 5imvBcCnwnNnQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 41/49] ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:48 +0200
Message-ID: <20261019130856.49711-42-frederic@kernel.org>
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
index bc06cb1f0282..8509c6377a61 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


