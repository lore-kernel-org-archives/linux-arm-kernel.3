Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C22D2CE02
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4BbGZJrgKHBS1ebIHey0pr+uSHORCgdWsi8QrwBkOQ=; b=uwu0wEnxOHUEhYssB7VBg5fK/0
	k7FjGxWeZwWWojH+roqWXoetCnYXzPn+8t8YfowD1T1gvxLYwtnTOY5q6M0WY/xK/20jRvvOhUHXP
	ePZuI46+GM7iFzXN0/oTAj3bM+9xwX4lz25SMCOzMTmAXlmwR1uWHaIEbFabxYpuJOoSvlyzDXadu
	YL4aR9jgC/RVxMev1tbA+5FzDafKynT/fo8p2gK+5QKCIlbkRxxq79Y0eCzGiuZxpIK1Byoe3cO7l
	6ubH4sN63urQElPJAyLFYu+nfEKWMJ5joZdsNgZ2hyo2368rRB+JWZh9CEn4FyyQr0dtu5bRPVU8q
	mzATQSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLM-00000008qWF-1LoO;
	Fri, 05 Dec 2025 01:10:44 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLJ-00000008qU9-3MeE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:42 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7c7957d978aso1489072b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897040; x=1765501840; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4BbGZJrgKHBS1ebIHey0pr+uSHORCgdWsi8QrwBkOQ=;
        b=hmqX+nwfbBLGkZGJrH2GosiKABhe+5n1uybXBaDWgQIRXptOYr33zHArGbupwBW98Z
         mhGshompLIbQIH/BvIt0igeZJC8eQoUP83SLzlTgbk+ggbgf7E/3UgK9PNFBahqsO1Gv
         UO/BjChQDZNCKIf27VYMR5sG5nsNKX1j7NrozKfMyCrqEl4OKBjsxFJeLzxOXHMYRnVr
         csWCbTQTn0Tj39SRs61GHzbDR3aL3ROxGCCwnCD4xUNq041CBQoBHXvV+3gM0K6DxJ1P
         e9rSZUJMHAFJdhUibQzpeMb0Lyio4VPXXgmwLsNcqos6egSOaYzARGG8zcnIFc6Yhq+b
         HiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897040; x=1765501840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4BbGZJrgKHBS1ebIHey0pr+uSHORCgdWsi8QrwBkOQ=;
        b=Nbqdp7VLLBlHEILbgfkWKUVEq4RhIAuqja631cKJlOi2OjRPgsCT1GYLo6AZ7ytadw
         UQHwAr/sGBUnYalqut2uqc2NBuodwhCbtwa9b9SO+V9h/rnTCR5lNYITG1Bc2/2TnABd
         4V9TrIhRGwzPW8ZqU432Yesdgs8e25Cr5ag5TgNhDFUYCPnjXnDrM/GIodfJdWrftGDA
         LAY8A3ULTJhNKwj5bxCjqtfEkiNlXSYPgyyOeCL5nkLiXkninoGrdBnabd4Ug1OZJkIt
         ShOoUxjSOWiZjXGIaAlqO0LTsbM3kIEgReHleV/jTVh2nJrgUTAf+rfF/36cPR+f9e+p
         MLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpehStG+jfZLj44rm4LNFkxSwZ6gbDIRMOTx+RAhZcek8RWNLGUFYCH28AXB95mSjHxJKK8Xwj1AMqi9jUFo5N@lists.infradead.org
X-Gm-Message-State: AOJu0YxOI6ApcAgOQ2urFCBABeMxUSykUEEEt+6NHI1hQwod7CiJhGfT
	lw67yPoO7V+MnzsD//Sq/fo7pJonUwKK4kM5gMflyHD8OcFAaiSxmRF1N/mbtcOJkommAXe/vQX
	F+LdPMv7xsf7y/lybjg5rFxjEgil23w==
X-Google-Smtp-Source: AGHT+IGg0aQdrYmzV5P5GOW060iMnYO5VpD+YP0Tghlk91Lx5RDEJPchD3QmVDA0/uwWSlF9oMe+KHNmQtXNYwhFoM4=
X-Received: from pgac5.prod.google.com ([2002:a05:6a02:2945:b0:bd9:a349:94a3])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:748d:b0:34f:b50e:e2e2 with SMTP id adf61e73a8af0-363f5ece732mr9688679637.58.1764897040426;
 Thu, 04 Dec 2025 17:10:40 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:17 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-5-willmcvicker@google.com>
Subject: [PATCH v7 4/6] clocksource/drivers/exynos_mct: Refactor driver init
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171041_865377_75210381 
X-CRM114-Status: GOOD (  25.70  )
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

This patch cleans up the driver a bit by
- refactoring mct_init_dt() to allow better separation of ARM 32-bit
  specific code and ARM64 code. Ultimately this allows the driver to
  access context data outside of mct_init_dt().
- adds driver data to distinguish the interrupt type which allows
  a single driver init function.

This clean up is in preparation for modularizing the MCT driver for only
ARM64 SoCs.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 199 +++++++++++++++++++------------
 1 file changed, 125 insertions(+), 74 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index fece6bbc190e..922c2b519a39 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -74,13 +74,22 @@ enum {
 	MCT_INT_PPI
 };
 
+/* Needs to be global for sched_clock_register() since we can't pass in data. */
 static void __iomem *reg_base;
-static unsigned long clk_rate;
-static unsigned int mct_int_type;
-static int mct_irqs[MCT_NR_IRQS];
+
+struct mct_data {
+	unsigned int int_type;
+};
+
+struct mct_context {
+	const struct mct_data *drvdata;
+	unsigned long clk_rate;
+	int mct_irqs[MCT_NR_IRQS];
+};
 
 struct mct_clock_event_device {
 	struct clock_event_device evt;
+	struct mct_context *ctx;
 	unsigned long base;
 	/**
 	 *  The length of the name must be adjusted if number of
@@ -89,6 +98,12 @@ struct mct_clock_event_device {
 	char name[11];
 };
 
+static struct mct_clock_event_device *
+to_mct_clock_event_device(struct clock_event_device *evt)
+{
+	return container_of(evt, struct mct_clock_event_device, evt);
+}
+
 static void exynos4_mct_write(unsigned int value, unsigned long offset)
 {
 	unsigned long stat_addr;
@@ -241,7 +256,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int __init exynos4_clocksource_init(struct mct_context *ctx, bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -252,18 +267,9 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	else
 		exynos4_mct_frc_start();
 
-#if defined(CONFIG_ARM)
-	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
-	exynos4_delay_timer.freq = clk_rate;
-	register_current_timer_delay(&exynos4_delay_timer);
-
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
-#endif
-
-	if (clocksource_register_hz(&mct_frc, clk_rate))
+	if (clocksource_register_hz(&mct_frc, ctx->clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-
 	return 0;
 }
 
@@ -297,7 +303,7 @@ static void exynos4_mct_comp0_start(bool periodic, unsigned long cycles)
 	exynos4_mct_write(0x1, EXYNOS4_MCT_G_INT_ENB);
 
 	tcon |= MCT_G_TCON_COMP0_ENABLE;
-	exynos4_mct_write(tcon , EXYNOS4_MCT_G_TCON);
+	exynos4_mct_write(tcon, EXYNOS4_MCT_G_TCON);
 }
 
 static int exynos4_comp_set_next_event(unsigned long cycles,
@@ -325,17 +331,19 @@ static int mct_set_state_periodic(struct clock_event_device *evt)
 	return 0;
 }
 
-static struct clock_event_device mct_comp_device = {
-	.name			= "mct-comp",
-	.features		= CLOCK_EVT_FEAT_PERIODIC |
-				  CLOCK_EVT_FEAT_ONESHOT,
-	.rating			= 250,
-	.set_next_event		= exynos4_comp_set_next_event,
-	.set_state_periodic	= mct_set_state_periodic,
-	.set_state_shutdown	= mct_set_state_shutdown,
-	.set_state_oneshot	= mct_set_state_shutdown,
-	.set_state_oneshot_stopped = mct_set_state_shutdown,
-	.tick_resume		= mct_set_state_shutdown,
+static struct mct_clock_event_device mct_comp_device = {
+	.evt = {
+		.name			= "mct-comp",
+		.features		= CLOCK_EVT_FEAT_PERIODIC |
+					  CLOCK_EVT_FEAT_ONESHOT,
+		.rating			= 250,
+		.set_next_event		= exynos4_comp_set_next_event,
+		.set_state_periodic	= mct_set_state_periodic,
+		.set_state_shutdown	= mct_set_state_shutdown,
+		.set_state_oneshot	= mct_set_state_shutdown,
+		.set_state_oneshot_stopped = mct_set_state_shutdown,
+		.tick_resume		= mct_set_state_shutdown,
+	},
 };
 
 static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
@@ -349,14 +357,16 @@ static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int exynos4_clockevent_init(void)
+static int exynos4_clockevent_init(struct mct_context *ctx)
 {
-	mct_comp_device.cpumask = cpumask_of(0);
-	clockevents_config_and_register(&mct_comp_device, clk_rate,
+	struct clock_event_device *evt = &mct_comp_device.evt;
+
+	mct_comp_device.ctx = ctx;
+	evt->cpumask = cpumask_of(0);
+	clockevents_config_and_register(evt, ctx->clk_rate,
 					0xf, 0xffffffff);
-	if (request_irq(mct_irqs[MCT_G0_IRQ], exynos4_mct_comp_isr,
-			IRQF_TIMER | IRQF_IRQPOLL, "mct_comp_irq",
-			&mct_comp_device))
+	if (request_irq(ctx->mct_irqs[MCT_G0_IRQ], exynos4_mct_comp_isr,
+			IRQF_TIMER | IRQF_IRQPOLL, "mct_comp_irq", evt))
 		pr_err("%s: request_irq() failed\n", "mct_comp_irq");
 
 	return 0;
@@ -409,18 +419,16 @@ static void exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
 static int exynos4_tick_set_next_event(unsigned long cycles,
 				       struct clock_event_device *evt)
 {
-	struct mct_clock_event_device *mevt;
+	struct mct_clock_event_device *mevt = to_mct_clock_event_device(evt);
 
-	mevt = container_of(evt, struct mct_clock_event_device, evt);
 	exynos4_mct_tick_start(cycles, mevt);
 	return 0;
 }
 
 static int set_state_shutdown(struct clock_event_device *evt)
 {
-	struct mct_clock_event_device *mevt;
+	struct mct_clock_event_device *mevt = to_mct_clock_event_device(evt);
 
-	mevt = container_of(evt, struct mct_clock_event_device, evt);
 	exynos4_mct_tick_stop(mevt);
 	exynos4_mct_tick_clear(mevt);
 	return 0;
@@ -428,10 +436,9 @@ static int set_state_shutdown(struct clock_event_device *evt)
 
 static int set_state_periodic(struct clock_event_device *evt)
 {
-	struct mct_clock_event_device *mevt;
+	struct mct_clock_event_device *mevt = to_mct_clock_event_device(evt);
 	unsigned long cycles_per_jiffy;
 
-	mevt = container_of(evt, struct mct_clock_event_device, evt);
 	cycles_per_jiffy = (((unsigned long long)NSEC_PER_SEC / HZ * evt->mult)
 			    >> evt->shift);
 	exynos4_mct_tick_stop(mevt);
@@ -464,6 +471,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 	struct mct_clock_event_device *mevt =
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
+	struct mct_context *ctx = mevt->ctx;
 
 	evt->name = mevt->name;
 	evt->cpumask = cpumask_of(cpu);
@@ -479,7 +487,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 
 	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
-	if (mct_int_type == MCT_INT_SPI) {
+	if (ctx->drvdata->int_type == MCT_INT_SPI) {
 
 		if (evt->irq == -1)
 			return -EIO;
@@ -487,9 +495,9 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 		irq_force_affinity(evt->irq, cpumask_of(cpu));
 		enable_irq(evt->irq);
 	} else {
-		enable_percpu_irq(mct_irqs[MCT_L0_IRQ], 0);
+		enable_percpu_irq(ctx->mct_irqs[MCT_L0_IRQ], 0);
 	}
-	clockevents_config_and_register(evt, clk_rate / (TICK_BASE_CNT + 1),
+	clockevents_config_and_register(evt, ctx->clk_rate / (TICK_BASE_CNT + 1),
 					0xf, 0x7fffffff);
 
 	return 0;
@@ -500,18 +508,20 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	struct mct_clock_event_device *mevt =
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
+	struct mct_context *ctx = mevt->ctx;
 
-	if (mct_int_type == MCT_INT_SPI) {
+	if (ctx->drvdata->int_type == MCT_INT_SPI) {
 		if (evt->irq != -1)
 			disable_irq_nosync(evt->irq);
 		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
 	} else {
-		disable_percpu_irq(mct_irqs[MCT_L0_IRQ]);
+		disable_percpu_irq(ctx->mct_irqs[MCT_L0_IRQ]);
 	}
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int __init exynos4_timer_resources(struct mct_context *ctx,
+					  struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -522,7 +532,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
 	tick_clk = of_clk_get_by_name(np, "fin_pll");
 	if (IS_ERR(tick_clk))
 		panic("%s: unable to determine tick clock rate\n", __func__);
-	clk_rate = clk_get_rate(tick_clk);
+	ctx->clk_rate = clk_get_rate(tick_clk);
 
 	mct_clk = of_clk_get_by_name(np, "mct");
 	if (IS_ERR(mct_clk))
@@ -534,22 +544,20 @@ static int __init exynos4_timer_resources(struct device_node *np)
 
 /**
  * exynos4_timer_interrupts - initialize MCT interrupts
+ * @ctx: device context
  * @np: device node for MCT
- * @int_type: interrupt type, MCT_INT_PPI or MCT_INT_SPI
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
-					   unsigned int int_type,
+static int __init exynos4_timer_interrupts(struct mct_context *ctx,
+					   struct device_node *np,
 					   const u32 *local_idx,
 					   size_t nr_local)
 {
 	int nr_irqs, i, err, cpu;
 
-	mct_int_type = int_type;
-
 	/* This driver uses only one global timer interrupt */
-	mct_irqs[MCT_G0_IRQ] = irq_of_parse_and_map(np, MCT_G0_IRQ);
+	ctx->mct_irqs[MCT_G0_IRQ] = irq_of_parse_and_map(np, MCT_G0_IRQ);
 
 	/*
 	 * Find out the number of local irqs specified. The local
@@ -557,29 +565,30 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	 * irqs are specified.
 	 */
 	nr_irqs = of_irq_count(np);
-	if (nr_irqs > ARRAY_SIZE(mct_irqs)) {
+	if (nr_irqs > ARRAY_SIZE(ctx->mct_irqs)) {
 		pr_err("exynos-mct: too many (%d) interrupts configured in DT\n",
 			nr_irqs);
-		nr_irqs = ARRAY_SIZE(mct_irqs);
+		nr_irqs = ARRAY_SIZE(ctx->mct_irqs);
 	}
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
-		mct_irqs[i] = irq_of_parse_and_map(np, i);
+		ctx->mct_irqs[i] = irq_of_parse_and_map(np, i);
 
 	for_each_possible_cpu(cpu) {
 		struct mct_clock_event_device *mevt =
 		    per_cpu_ptr(&percpu_mct_tick, cpu);
 
+		mevt->ctx = ctx;
 		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
 			 cpu);
 	}
 
-	if (mct_int_type == MCT_INT_PPI) {
+	if (ctx->drvdata->int_type == MCT_INT_PPI) {
 
-		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
+		err = request_percpu_irq(ctx->mct_irqs[MCT_L0_IRQ],
 					 exynos4_mct_tick_isr, "MCT",
 					 &percpu_mct_tick);
 		WARN(err, "MCT: can't request IRQ %d (%d)\n",
-		     mct_irqs[MCT_L0_IRQ], err);
+		     ctx->mct_irqs[MCT_L0_IRQ], err);
 	} else {
 		for_each_possible_cpu(cpu) {
 			int mct_irq;
@@ -595,9 +604,9 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_idx = MCT_L0_IRQ + local_idx[cpu];
 
 			pcpu_mevt->evt.irq = -1;
-			if (irq_idx >= ARRAY_SIZE(mct_irqs))
+			if (irq_idx >= ARRAY_SIZE(ctx->mct_irqs))
 				break;
-			mct_irq = mct_irqs[irq_idx];
+			mct_irq = ctx->mct_irqs[irq_idx];
 
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
@@ -637,8 +646,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return 0;
 
 out_irq:
-	if (mct_int_type == MCT_INT_PPI) {
-		free_percpu_irq(mct_irqs[MCT_L0_IRQ], &percpu_mct_tick);
+	if (ctx->drvdata->int_type == MCT_INT_PPI) {
+		free_percpu_irq(ctx->mct_irqs[MCT_L0_IRQ], &percpu_mct_tick);
 	} else {
 		for_each_possible_cpu(cpu) {
 			struct mct_clock_event_device *pcpu_mevt =
@@ -653,7 +662,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int __init mct_init_dt(struct mct_context *ctx, struct device_node *np)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -679,15 +688,15 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 			local_idx[i] = i;
 	}
 
-	ret = exynos4_timer_resources(np);
+	ret = exynos4_timer_resources(ctx, np);
 	if (ret)
 		return ret;
 
-	ret = exynos4_timer_interrupts(np, int_type, local_idx, nr_local);
+	ret = exynos4_timer_interrupts(ctx, np, local_idx, nr_local);
 	if (ret)
 		return ret;
 
-	ret = exynos4_clocksource_init(frc_shared);
+	ret = exynos4_clocksource_init(ctx, frc_shared);
 	if (ret)
 		return ret;
 
@@ -698,18 +707,60 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	if (frc_shared)
 		return 0;
 
-	return exynos4_clockevent_init();
+	ret = exynos4_clockevent_init(ctx);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
+static const struct mct_data exynos4210_mct_data = { .int_type = MCT_INT_SPI, };
+static const struct mct_data exynos4412_mct_data = { .int_type = MCT_INT_PPI, };
 
-static int __init mct_init_spi(struct device_node *np)
-{
-	return mct_init_dt(np, MCT_INT_SPI);
-}
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct", .data = &exynos4210_mct_data, },
+	{ .compatible = "samsung,exynos4412-mct", .data = &exynos4412_mct_data, },
+	{}
+};
 
-static int __init mct_init_ppi(struct device_node *np)
+/* Note, legacy ARM 32-bit systems depend on the MCT as the only clocksource
+ * which requires this driver to be initialized very early. We need to keep this
+ * special condition until we can transparently support modular and early init
+ * timers.
+ */
+static int __init mct_of_declare_init(struct device_node *np)
 {
-	return mct_init_dt(np, MCT_INT_PPI);
+	struct mct_context *ctx;
+	const struct of_device_id *match;
+	int ret;
+
+	match = of_match_node(exynos4_mct_match_table, np);
+	if (!match || !match->data)
+		return -ENODEV;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->drvdata = match->data;
+
+	ret = mct_init_dt(ctx, np);
+	if (ret)
+		goto out_ctx;
+
+#if defined(CONFIG_ARM)
+	sched_clock_register(exynos4_read_sched_clock, 32, ctx->clk_rate);
+
+	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
+	exynos4_delay_timer.freq = ctx->clk_rate;
+	register_current_timer_delay(&exynos4_delay_timer);
+#endif
+
+	return 0;
+
+out_ctx:
+	kfree(ctx);
+	return ret;
 }
-TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
-TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_of_declare_init);
+TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_of_declare_init);
-- 
2.52.0.223.gf5cc29aaa4-goog


