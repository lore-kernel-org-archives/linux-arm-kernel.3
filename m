Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84800CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FC+thagwKj1TEPiVmc1OaHEPj4Ko6vShcCzv13/aPY=; b=m8F8bdXzyx5kXiQLv9FiTAD1e2
	8yF8X+C19nuNjON1E3LfRGIEsaV4ZRATxb+YotKK1eICmPJS+cymvWqYznZmjxXdPClACW7GVZS72
	8RqcxrH0dR9j1vfsQ+4RdYgkNr6P6DdvLxTg8L0BopIqT8gDDoeCzYV4+9HgENy/5FgET8yIt0RK5
	/ItGPfOhfOfLxLOz2ih+zi0Rw5H39F3B00EejDjSDV4f0rZkitOlI5ejFe7i0G1YGdyDFJMJfk9Lg
	OhAT295bKset4pbc434Y+f88EBzUTryTrtUbOXr1lWC74BM28UbKFqd8Iz3m7TtoOptqpUXDq692t
	2X+GMlzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8O-00000007TZJ-3cxg;
	Mon, 19 Oct 2026 13:10:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn8B-00000007TO8-3Xex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:10:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48F2B60233;
	Mon, 19 Oct 2026 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FCB1F000C6;
	Mon, 19 Oct 2026 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415423;
	bh=+FC+thagwKj1TEPiVmc1OaHEPj4Ko6vShcCzv13/aPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=huBTchtvFX2h6QFxjR7JOuhP9PAKtdxE3PBE6od8s8Ncai/rzicKrgmr/GZPBnceC
	 v7kKNSrnLyJVbnwVHdlDT8ak6ECOf1L/rVNbAr36hQrsBkhu+SKg1xWYVkVU5yjkqL
	 233fnkRL4ConhiZBATW2qzwkJkssanbkb3uZnCgBkDEBa6fYZhVNUKsYWqHkqOphOz
	 K0ECMpHYy7NYHQhLZOWODXd2IySzuYROF3IHxLZ5YmPOlTVFdGWJcyPi3qkUvORLZX
	 njjwKYtV/QBNPXCisyf3QRVRVUDLDZjkfx3U0WKUa1TBvYxmhyi7nJPfYH+3KrMTj9
	 BUHyETDLDOnYQ==
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
Subject: [RFC PATCH 27/49] ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:34 +0200
Message-ID: <20261019130856.49711-28-frederic@kernel.org>
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
index 1b3942012f2d..1a98d05c7f55 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


