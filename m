Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47063CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjLO44dhfAsonysE/RA7p9Yc1ofbKzZyoAUfve5uIp4=; b=TzqIN3NXGuyoPivUf7s8As8HQn
	LN9+/pixRFtrMJ/ZxptZauzgFYDhhG5ygt+cNM56j6fa1tw5STSHMW0i8gQhZmfSJRtAPTdOLrnps
	G00NNEcR4q3tDfB7S7nH9CBrtCZEtFrVoM5SsXCajb5OA786yvG3Adr0dUJ2QAMYcFP8nCnsaHFrh
	SrcLgmbXcBXZfgM4Q3XaY5X79zA08VagWaINLGuKp2oBHyy6nrG7ClHOxyEx9C3f194TSy/esyZdf
	7rqiAz3nIbecDWldPaKfA+PWXnDaNPtHv8QyaeJumyGOwoW8gcHlU+rpT4H1dVoeJzs8+6V4Cbq8r
	fc928oeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbnn-00000000DHk-1Q6u;
	Thu, 14 Aug 2025 17:31:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma9t-0000000HWiZ-1U6y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 137FB45AA0;
	Thu, 14 Aug 2025 15:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC754C4CEEF;
	Thu, 14 Aug 2025 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755186388;
	bh=iSjzjmWTu80cwcbL4cT/to0KlVsFsM7JJGnphItTq5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fF7wYjhZFUqs3vr7YwAWauWU54banRqHRl2x4hrTX4DI+Lud6nrQu1ZY4dXh7sI8f
	 b4VbGwLI/89AghcGVtl+bD53+vwY3/9SVfcBv0ghRl3/8+Lun/5RM2Wcv1NuBFfT82
	 i/ePzioR8hvE+zj2bODZDNxeAu1vVs6NOj6k/xUsMubVquDHmQ819m+aZdzfHBOddB
	 iOFDz/U2uNE56pnrAu8RkAaa1ixZbWrxK/LKgCHZIfPoIGsaAwIY6E0oWDbVYidsoo
	 RdfRP2ENVzwWjO1jijYkXurAVX+7HnZg3XupfxyrAznJ761iLb8gN5PNQUoi3M4Qq6
	 v7/tOpG3VQbNg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uma9q-007VqB-Qc;
	Thu, 14 Aug 2025 16:46:26 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v2 4/4] clocksource/drivers/arm_arch_timer_mmio: Add MMIO clocksource
Date: Thu, 14 Aug 2025 16:46:22 +0100
Message-Id: <20250814154622.10193-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814154622.10193-1-maz@kernel.org>
References: <20250814154622.10193-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, alexandru.elisei@arm.com, steven.price@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_084629_431211_38C39B06 
X-CRM114-Status: GOOD (  13.68  )
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

The MMIO driver can also double as a clocksource, something that was
missing in its previous incarnation. Add it for completeness.

Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20250807160243.1970533-5-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer_mmio.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index 3522d1d8cb97b..ebe1987d651eb 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -45,6 +45,7 @@ enum arch_timer_access {
 
 struct arch_timer {
 	struct clock_event_device	evt;
+	struct clocksource		cs;
 	struct arch_timer_mem		*gt_block;
 	void __iomem			*base;
 	enum arch_timer_access		access;
@@ -52,6 +53,7 @@ struct arch_timer {
 };
 
 #define evt_to_arch_timer(e) container_of(e, struct arch_timer, evt)
+#define cs_to_arch_timer(c) container_of(c, struct arch_timer, cs)
 
 static void arch_timer_mmio_write(struct arch_timer *timer,
 				  enum arch_timer_reg reg, u64 val)
@@ -128,6 +130,13 @@ static noinstr u64 arch_counter_mmio_get_cnt(struct arch_timer *t)
 	return ((u64) cnt_hi << 32) | cnt_lo;
 }
 
+static u64 arch_mmio_counter_read(struct clocksource *cs)
+{
+	struct arch_timer *at = cs_to_arch_timer(cs);
+
+	return arch_counter_mmio_get_cnt(at);
+}
+
 static int arch_timer_mmio_shutdown(struct clock_event_device *clk)
 {
 	struct arch_timer *at = evt_to_arch_timer(clk);
@@ -256,6 +265,16 @@ static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
 					(unsigned long)CLOCKSOURCE_MASK(56));
 
 	enable_irq(at->evt.irq);
+
+	at->cs = (struct clocksource) {
+		.name	= "arch_mmio_counter",
+		.rating	= 300,
+		.read	= arch_mmio_counter_read,
+		.mask	= CLOCKSOURCE_MASK(56),
+		.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
+	};
+
+	clocksource_register_hz(&at->cs, at->rate);
 }
 
 static int arch_timer_mmio_frame_register(struct platform_device *pdev,
-- 
2.39.2


