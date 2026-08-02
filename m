Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68BDC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DebX7evhEtlgthyyjGu18FUeYtqUAeNC8V77aBBdbns=; b=qyrwrX4isgDEB0EtoU6pqnQO8D
	aojR8zqg+qIhCVDOKC4tCN7LKIX+IkxkEHi7Y6d3MZtQHChzVKBOnuVldD9Nqi539yEC/vV54MHRB
	ldxocHzmiFJUB6a8tfpQLsowJjMpMwoCbVLQ0MvvWn4qNpOfwY8p1FEb2FKDJvn4nrxvgTwcaQF7M
	RfRXGMRqL1hs9kzaGBrRDz6/DxPcZ6EWcLXu1YHZt4K/iXaY4vCDjGwIYAJ82vP5LWLDfzbOo1h0a
	N2n313bE+Rb9mgW5QiWJSMOzKNSjyB4sm1RbEOWijvIsgkVDZoM5OthV/mjAthzXbBrs5TrkItbe1
	3eX8QTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRX-0000000FqmZ-45jr;
	Sun, 02 Aug 2026 16:53:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRW-0000000Fql9-294O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A18F660DFE;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512C21F00A3A;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689621;
	bh=DebX7evhEtlgthyyjGu18FUeYtqUAeNC8V77aBBdbns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ma03lMFjEIGpCCK44yCD73/RZdEU9x93nIEs2F3en0qOqsY0FmfYB3vaNfwB+Ltxl
	 wL+bii+DHKGgsy2WfccmrkYxZeg4hW6q+hrl8W4DYjitINoxZSDus4nsmMPNJmCyYx
	 naZzIQgzp+D4UwvnQGHeWHVhIMsSeZ5rfCjPATc+2SDLX0c0ulpHmhuHwsgSW2sNXz
	 KzK64QI9AA3L1ciSS3yVze7La95ayIWUhVOQQtXgdJp8m7WLy3ynD7FJHyMKONfPmV
	 BcmoPM44zc0wlYBry3D+sikoWFM9+EYRl0HGoSqXMJ73jfJZpYf9YT84PVWU9HgjUn
	 lGMfvgdUzYCdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRT-0000000BVIZ-10vj;
	Sun, 02 Aug 2026 16:53:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/8] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
Date: Sun,  2 Aug 2026 17:53:20 +0100
Message-ID: <20260802165327.385217-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The PMUv3 driver really wants to know whether sched_clock() is
backed by the architected timer. However, updates to the timer driver
have broken the check, as there is more than a single accessor
for the counters, depending on the level of brokenness of the HW.

Add a predicate that checks for those accessors, and update the PMUv3
driver to DTRT.

Fixes: 24ee7607b286b ("arm64/arch_timer: Provide noinstr sched_clock_read() functions")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/clocksource/arm_arch_timer.c | 10 ++++++++++
 drivers/perf/arm_pmuv3.c             |  2 +-
 include/clocksource/arm_arch_timer.h |  8 +++++++-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 4adf756423de9..c02e97f9b7af5 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -951,6 +951,16 @@ static void __init arch_counter_register(void)
 	sched_clock_register(scr, width, arch_timer_rate);
 }
 
+bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
+{
+	u64 (*rd)(void) = crd->read_sched_clock;
+
+	return (rd == raw_counter_get_cntvct_stable	||
+		rd == raw_counter_get_cntpct_stable	||
+		rd == arch_counter_get_cntvct		||
+		rd == arch_counter_get_cntpct);
+}
+
 static void arch_timer_stop(struct clock_event_device *clk)
 {
 	pr_debug("disable IRQ%d cpu #%d\n", clk->irq, smp_processor_id());
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8014ff766cff5..ed880145d41b3 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1624,7 +1624,7 @@ void arch_perf_update_userpage(struct perf_event *event,
 	do {
 		rd = sched_clock_read_begin(&seq);
 
-		if (rd->read_sched_clock != arch_timer_read_counter)
+		if (!read_sched_clock_is_arch_counter(rd))
 			return;
 
 		userpg->time_mult = rd->mult;
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 2eda895f19f54..84cdbaffcfb5e 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -84,13 +84,15 @@ struct arch_timer_mem {
 	struct arch_timer_mem_frame frame[ARCH_TIMER_MEM_MAX_FRAMES];
 };
 
+struct clock_read_data;
+
 #ifdef CONFIG_ARM_ARCH_TIMER
 
 extern u32 arch_timer_get_rate(void);
 extern u64 (*arch_timer_read_counter)(void);
 extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
 extern bool arch_timer_evtstrm_available(void);
-
+extern bool read_sched_clock_is_arch_counter(const struct clock_read_data *);
 #else
 
 static inline u32 arch_timer_get_rate(void)
@@ -108,6 +110,10 @@ static inline bool arch_timer_evtstrm_available(void)
 	return false;
 }
 
+static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
+{
+	return false;
+}
 #endif
 
 #endif
-- 
2.47.3


