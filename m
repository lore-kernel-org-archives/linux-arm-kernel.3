Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F50C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAAyG8SRRqbLdivjdRdMUZVSQc5/o7iuh79T8Z5zcL0=; b=FQN6WdNHAhRiHZ9bSGOAkW0lgi
	yE2ZKYFeKNSyees9Wegtct3h7zoQ5omwJhKh78ETmamT74ieD4rxSITPNetSSXYymlUDatzlKbfqV
	6Un7J0G2S8tfSaA91cAUJ/h5EiF3v8j49WEHE3XjDhVCjim6eMsaU+ZiZCVdl8geRHqdY1MSGka0o
	v/D8/QpQPPkJrUusGp6JJdUXe0UDxj6wzfLapLbZ8r9MlfQ0FF0Vb9zaoqh4wu0Qw8GO3EVqc6PAR
	jYvNEujC6NEcYNBTrvDsjAb6lhcxH1Svv6TwvvLUuRcoiV0TFNnpM8JyV3RLYnTROSHiOsyw+4/dH
	Wwb96dcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRY-0000000Fqno-1e83;
	Sun, 02 Aug 2026 16:53:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRX-0000000Fqls-0EMZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC2274505A;
	Sun,  2 Aug 2026 16:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF14A1F00A3F;
	Sun,  2 Aug 2026 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689622;
	bh=ZAAyG8SRRqbLdivjdRdMUZVSQc5/o7iuh79T8Z5zcL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cH70UKcj1v4XNHl3vPR/tf6CtySyuW6jNWyslMQYi1GJBQIchHJ7vBETdMqJgyZ/I
	 Wb2gbUcmfVus5T4dxY/RPIhRYUMabZTyLqe+USI+B0jtuuLNmPy9X7qUuKX79W5D9S
	 BOPRgGeTegqs/n6bK/VYETVWxHIj0v0J1djqLb06jVb7Vq3f+AUEaiLl0JJ7dMfCK/
	 ABwWpJNHYJHr+thOBAu697YxcOgnvo2VCegHdG7T4DtyjFal3xUDyfqCq431DRYipA
	 KpddCi8wOiR55JfYAq1YaBWNqqPirGKxzk9zWZhRYJQAf2yxlz+lPON5+EZtZFO4V7
	 vfy+ALN9QQIoA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRU-0000000BVIZ-3eqS;
	Sun, 02 Aug 2026 16:53:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 5/8] clocksource/drivers/arm_arch_timer: Turn arch_timer_read_counter into a function
Date: Sun,  2 Aug 2026 17:53:24 +0100
Message-ID: <20260802165327.385217-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
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

Now that we control the workarounds applied to the counters with
a static key, we can also do the same thing for the selection
between virtual and physical counters, as this selection is
done on the boot CPU, where we have the freedom to flip static
keys.

With this, there is no need for arch_timer_read_counter to be
a function pointer, and we can directly promote it to an actual
function.

While we're at it, apply the same static key treatment to the raw_*
accessors.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 38 +++++++++++++++++-----------
 include/clocksource/arm_arch_timer.h |  2 +-
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 5085e87706f99..747f51d9225c2 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -134,9 +134,21 @@ static notrace u64 arch_counter_get_cntvct(void)
  * to exist on arm64. arm doesn't use this before DT is probed so even
  * if we don't have the cp15 accessors we won't have a problem.
  */
-u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
+static DEFINE_STATIC_KEY_TRUE(arch_counter_is_virtual);
+
+u64 notrace arch_timer_read_counter(void)
+{
+	return static_branch_likely(&arch_counter_is_virtual) ?
+		arch_counter_get_cntvct() : arch_counter_get_cntpct();
+}
 EXPORT_SYMBOL_GPL(arch_timer_read_counter);
 
+static u64 noinstr raw_arch_timer_read_counter(void)
+{
+	return static_branch_likely(&arch_counter_is_virtual) ?
+		raw_counter_get_cntvct() : raw_counter_get_cntpct();
+}
+
 static u64 arch_counter_read(struct clocksource *cs)
 {
 	return arch_timer_read_counter();
@@ -940,22 +952,19 @@ struct arch_timer_kvm_info *arch_timer_get_kvm_info(void)
 
 static void __init arch_counter_register(void)
 {
-	u64 (*scr)(void);
-	u64 (*rd)(void);
 	u64 start_count;
 	int width;
 
-	if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
-	    arch_timer_uses_ppi == ARCH_TIMER_VIRT_PPI ||
-	    arch_timer_uses_ppi == ARCH_TIMER_HYP_VIRT_PPI) {
-		rd = arch_counter_get_cntvct;
-		scr = raw_counter_get_cntvct;
-	} else {
-		rd = arch_counter_get_cntpct;
-		scr = raw_counter_get_cntpct;
+	switch (arch_timer_uses_ppi) {
+	case ARCH_TIMER_PHYS_SECURE_PPI:
+	case ARCH_TIMER_PHYS_NONSECURE_PPI:
+	case ARCH_TIMER_HYP_PPI:
+		static_branch_disable(&arch_counter_is_virtual);
+		break;
+	default:
+		break;
 	}
 
-	arch_timer_read_counter = rd;
 	clocksource_counter.vdso_clock_mode = vdso_default;
 
 	width = arch_counter_get_width();
@@ -971,15 +980,14 @@ static void __init arch_counter_register(void)
 	timecounter_init(&arch_timer_kvm_info.timecounter,
 			 &cyclecounter, start_count);
 
-	sched_clock_register(scr, width, arch_timer_rate);
+	sched_clock_register(raw_arch_timer_read_counter, width, arch_timer_rate);
 }
 
 bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
 {
 	u64 (*rd)(void) = crd->read_sched_clock;
 
-	return (rd == raw_counter_get_cntvct	||
-		rd == raw_counter_get_cntpct);
+	return (rd == raw_arch_timer_read_counter);
 }
 
 static void arch_timer_stop(struct clock_event_device *clk)
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 84cdbaffcfb5e..8deb815ed0a08 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -89,7 +89,7 @@ struct clock_read_data;
 #ifdef CONFIG_ARM_ARCH_TIMER
 
 extern u32 arch_timer_get_rate(void);
-extern u64 (*arch_timer_read_counter)(void);
+extern u64 arch_timer_read_counter(void);
 extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
 extern bool arch_timer_evtstrm_available(void);
 extern bool read_sched_clock_is_arch_counter(const struct clock_read_data *);
-- 
2.47.3


