Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB1D10F2863
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/FKMnOkOa1GQUBREmNXvdUXgOUxFMnV9Ru4pRJJQME=; b=zxGxrx2tkFiCqZl+bEe06Vo39l
	9YPh0glW84y4CX/YEek5kLngV67fp6017CtrriIZH9DcF4oNr6x/Ql/qHqwGexr/+hd51Y8a0W035
	aeBbYD8v+WRa+Bv/srQFfGXGqrfyG9SYQQ52duZy/GvSE3Sxr2iEiaR9weES/1isMecXJi+mGQ8Dy
	/LXnFJgM5HL0rBpsnCDS46m8NJ/Jb0Jc0t5r4Syv8UL0k/odVuWwf4J3HH++MErrN6MJQhLgNENhO
	y5Y35K2mzFxlgJ/KpP5TuEvrzUGyTR1QI7Kmy1eQrVuT0XzJFqTswv7PdTH6NP4+FMB7kMYjjJBTv
	DYnLkNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BPo-00000007tSr-1G3B;
	Fri, 27 Mar 2026 17:56:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BPm-00000007tRy-1ItY;
	Fri, 27 Mar 2026 17:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7716A4338F;
	Fri, 27 Mar 2026 17:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FA0C19424;
	Fri, 27 Mar 2026 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634169;
	bh=NF+8zTAwUcyuWSbqAv5EfRD6h1aQWSDUVa0i+26A4WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMU/UO7yah7g58RdvelfWdTFJBeJqtlzqv45Uj99/U3yCbHikW6Vv5l7/fGocFQDi
	 UR4GnW8KnjtDfdxl5BuXD0Ya3XLMB6ULG88BI6dCK57wZ99SVgOzQC2x41Ie1T8D+m
	 njGPSiFyjZuDovWB99aKusvSiE8HEDLkb3dfNJRjTnOyVE9U3t6o/TC1KIu6P2R/Iy
	 kmP7KS6/ZAFwuNpdzaPk/xgWvIi4M2h1nJCa0/U7Q9j+5UEIA2m6TVShlHIy5txF5V
	 /fIgLaW3QpmY8jqWPnDOY4pYqvKecD+HewBpObjbS/n7Yv2LmNHFSiReTRQDAqMnFw
	 fWsDNJwttLFbw==
From: Daniel Lezcano <daniel.lezcano@kernel.org>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	zhipeng.wang_1@nxp.com
Cc: shawnguo@kernel.org,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
Subject: [PATCH v1 5/7] clocksource/drivers/rockchip: Use the TIMER_PDEV_DECLARE() macro
Date: Fri, 27 Mar 2026 18:55:29 +0100
Message-ID: <20260327175533.3044-9-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327175533.3044-1-daniel.lezcano@kernel.org>
References: <20260327175533.3044-1-daniel.lezcano@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_105610_390189_036339B0 
X-CRM114-Status: GOOD (  18.34  )
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

The previous changes introduced the TIMER_PDEV_DECLARE() macro which
allows to use the platform driver to initialize a timer driver with
the benefit of having the devres to rollback automatically in case of
error.

Use this macro and change the function to rely on the devm_ variants,
allowing to cleanup the code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
---
 drivers/clocksource/timer-rockchip.c | 99 ++++++++++------------------
 1 file changed, 34 insertions(+), 65 deletions(-)

diff --git a/drivers/clocksource/timer-rockchip.c b/drivers/clocksource/timer-rockchip.c
index 540a16667145..486bbffba464 100644
--- a/drivers/clocksource/timer-rockchip.c
+++ b/drivers/clocksource/timer-rockchip.c
@@ -124,18 +124,18 @@ static u64 notrace rk_timer_sched_read(void)
 	return ~readl_relaxed(rk_clksrc->base + TIMER_CURRENT_VALUE0);
 }
 
-static int __init
-rk_timer_probe(struct rk_timer *timer, struct device_node *np)
+static int rk_timer_init(struct rk_timer *timer, struct device *dev)
 {
+	struct device_node *np = dev->of_node;
 	struct clk *timer_clk;
 	struct clk *pclk;
-	int ret = -EINVAL, irq;
+	int irq;
 	u32 ctrl_reg = TIMER_CONTROL_REG3288;
 
-	timer->base = of_iomap(np, 0);
-	if (!timer->base) {
+	timer->base = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(timer->base)) {
 		pr_err("Failed to get base address for '%s'\n", TIMER_NAME);
-		return -ENXIO;
+		return PTR_ERR(timer->base);
 	}
 
 	if (of_device_is_compatible(np, "rockchip,rk3399-timer"))
@@ -143,31 +143,17 @@ rk_timer_probe(struct rk_timer *timer, struct device_node *np)
 
 	timer->ctrl = timer->base + ctrl_reg;
 
-	pclk = of_clk_get_by_name(np, "pclk");
+	pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(pclk)) {
-		ret = PTR_ERR(pclk);
 		pr_err("Failed to get pclk for '%s'\n", TIMER_NAME);
-		goto out_unmap;
-	}
-
-	ret = clk_prepare_enable(pclk);
-	if (ret) {
-		pr_err("Failed to enable pclk for '%s'\n", TIMER_NAME);
-		goto out_unmap;
+		return PTR_ERR(pclk);
 	}
 	timer->pclk = pclk;
 
-	timer_clk = of_clk_get_by_name(np, "timer");
+	timer_clk = devm_clk_get_enabled(dev, "timer");
 	if (IS_ERR(timer_clk)) {
-		ret = PTR_ERR(timer_clk);
 		pr_err("Failed to get timer clock for '%s'\n", TIMER_NAME);
-		goto out_timer_clk;
-	}
-
-	ret = clk_prepare_enable(timer_clk);
-	if (ret) {
-		pr_err("Failed to enable timer clock\n");
-		goto out_timer_clk;
+		return PTR_ERR(timer_clk);
 	}
 	timer->clk = timer_clk;
 
@@ -175,47 +161,32 @@ rk_timer_probe(struct rk_timer *timer, struct device_node *np)
 
 	irq = irq_of_parse_and_map(np, 0);
 	if (!irq) {
-		ret = -EINVAL;
 		pr_err("Failed to map interrupts for '%s'\n", TIMER_NAME);
-		goto out_irq;
+		return -EINVAL;
 	}
 	timer->irq = irq;
 
 	rk_timer_interrupt_clear(timer);
 	rk_timer_disable(timer);
-	return 0;
-
-out_irq:
-	clk_disable_unprepare(timer_clk);
-out_timer_clk:
-	clk_disable_unprepare(pclk);
-out_unmap:
-	iounmap(timer->base);
-
-	return ret;
-}
 
-static void __init rk_timer_cleanup(struct rk_timer *timer)
-{
-	clk_disable_unprepare(timer->clk);
-	clk_disable_unprepare(timer->pclk);
-	iounmap(timer->base);
+	return 0;
 }
 
-static int __init rk_clkevt_init(struct device_node *np)
+static int rk_clkevt_init(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct clock_event_device *ce;
 	int ret = -EINVAL;
 
-	rk_clkevt = kzalloc_obj(struct rk_clkevt);
+	rk_clkevt = devm_kzalloc(dev, sizeof(*rk_clkevt), GFP_KERNEL);
 	if (!rk_clkevt) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	ret = rk_timer_probe(&rk_clkevt->timer, np);
+	ret = rk_timer_init(&rk_clkevt->timer, dev);
 	if (ret)
-		goto out_probe;
+		goto out;
 
 	ce = &rk_clkevt->ce;
 	ce->name = TIMER_NAME;
@@ -233,36 +204,33 @@ static int __init rk_clkevt_init(struct device_node *np)
 	if (ret) {
 		pr_err("Failed to initialize '%s': %d\n",
 			TIMER_NAME, ret);
-		goto out_irq;
+		goto out;
 	}
 
 	clockevents_config_and_register(&rk_clkevt->ce,
 					rk_clkevt->timer.freq, 1, UINT_MAX);
 	return 0;
 
-out_irq:
-	rk_timer_cleanup(&rk_clkevt->timer);
-out_probe:
-	kfree(rk_clkevt);
 out:
 	/* Leave rk_clkevt not NULL to prevent future init */
 	rk_clkevt = ERR_PTR(ret);
 	return ret;
 }
 
-static int __init rk_clksrc_init(struct device_node *np)
+static int rk_clksrc_init(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	int ret = -EINVAL;
 
-	rk_clksrc = kzalloc_obj(struct rk_timer);
+	rk_clksrc = devm_kzalloc(dev, sizeof(*rk_clksrc), GFP_KERNEL);
 	if (!rk_clksrc) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	ret = rk_timer_probe(rk_clksrc, np);
+	ret = rk_timer_init(rk_clksrc, dev);
 	if (ret)
-		goto out_probe;
+		goto out;
 
 	rk_timer_update_counter(UINT_MAX, rk_clksrc);
 	rk_timer_enable(rk_clksrc, 0);
@@ -272,33 +240,34 @@ static int __init rk_clksrc_init(struct device_node *np)
 		clocksource_mmio_readl_down);
 	if (ret) {
 		pr_err("Failed to register clocksource\n");
-		goto out_clocksource;
+		goto out;
 	}
 
 	sched_clock_register(rk_timer_sched_read, 32, rk_clksrc->freq);
 	return 0;
 
-out_clocksource:
-	rk_timer_cleanup(rk_clksrc);
-out_probe:
-	kfree(rk_clksrc);
 out:
 	/* Leave rk_clksrc not NULL to prevent future init */
 	rk_clksrc = ERR_PTR(ret);
 	return ret;
 }
 
-static int __init rk_timer_init(struct device_node *np)
+static int rk_timer_probe(struct platform_device *pdev)
 {
 	if (!rk_clkevt)
-		return rk_clkevt_init(np);
+		return rk_clkevt_init(pdev);
 
 	if (!rk_clksrc)
-		return rk_clksrc_init(np);
+		return rk_clksrc_init(pdev);
 
 	pr_err("Too many timer definitions for '%s'\n", TIMER_NAME);
 	return -EINVAL;
 }
 
-TIMER_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer", rk_timer_init);
-TIMER_OF_DECLARE(rk3399_timer, "rockchip,rk3399-timer", rk_timer_init);
+static const struct of_device_id rk_timer_match_table[] = {
+	{ .compatible = "rockchip,rk3288-timer" },
+	{ .compatible = "rockchip,rk3399-timer" },
+	{ /* sentinel */ }
+};
+
+TIMER_PDEV_DECLARE(rk_timer, rk_timer_probe, NULL, rk_timer_match_table);
-- 
2.43.0


