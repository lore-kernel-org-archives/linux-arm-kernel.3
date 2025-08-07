Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E4DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l+atq8ti6pmkRhFvkgGWD7H3JokrafStmwOc3EReSo=; b=Zx/IGwQK8vvmeVWhAuMRBPpxII
	EbTBy4iNQZEfwuNi7yo+NU9dnK825P5KMpD/L9QcAdsYr4Lij8BbSDFh6IMFoZ/LyI0l9BMTRSnIR
	w8hMG9bxsqvtQYbJOVfd2PS/YE5O6feLMQAKxoigfNhP8Ozy/99LDNORPDY9NKi57ppW3a5yhTuvU
	KdPkhB6C+AoiiE7Jy+U8RLvA55iAH4gGhy1VT2fa+0xffvI4cRpBJd0FOVvuItl6OcYCZ8eHW+jcd
	IQNe6kUEnF/nNzrqQfPvndWwqLd54Q5EsnT3ll1X3uMcrWD0MTeWwt5snEGqKaSw8CexwiRclVcNi
	r9jdWD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3CQ-000000015Qf-2avO;
	Thu, 07 Aug 2025 16:10:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk34s-000000014UH-1pml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 16:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 235784582B;
	Thu,  7 Aug 2025 16:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D6BC4CEF6;
	Thu,  7 Aug 2025 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754582570;
	bh=QS9aCXpsi//WfO6u/n4Am6+277W66GDkBWxlcRfXNUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YXps3WOIzyMVj0wFG6cpAgPh9DupqJ2rFpAU5SNFKRlTN1uJQmxLM9vAQmZeeiS8O
	 bTkkqtnKIkD/7i0sS2UTzIRZmd7cTSogE/ot8XLH4YfvtWcZMNHOVT8EMlUrL56+5Z
	 kcjKqtaflNrhAIM0F/dvp9+TP1SOqr8qo3q7AXDYbHExXse85O9ltUxtE5sgM9HaJS
	 Ry85+LznugGYAiNYOZRSmSzFS3pcnqLRXgs5e3tUhYDVU1DLTLAFnBulPCirN12I6L
	 ej3+lkgIXxxpR3Q7jM4W1EX7ejh24LYJ06f6h08c85XKc3kuIHtun/pHjK2EHd2a2x
	 NGtEu4gG/rKhA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uk34p-004zf7-II;
	Thu, 07 Aug 2025 17:02:47 +0100
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
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 4/4] clocksource/drivers/arm_arch_timer_mmio: Add MMIO clocksource
Date: Thu,  7 Aug 2025 17:02:43 +0100
Message-Id: <20250807160243.1970533-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250807160243.1970533-1-maz@kernel.org>
References: <20250807160243.1970533-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_090250_510549_503F97C8 
X-CRM114-Status: GOOD (  13.92  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer_mmio.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index fa7294ab609ce..f88e960c24006 100644
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
@@ -255,6 +264,16 @@ static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
 	clockevents_config_and_register(&at->evt, at->rate, 0xf, CLOCKSOURCE_MASK(56));
 
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


