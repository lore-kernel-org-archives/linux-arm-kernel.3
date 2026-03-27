Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479510F2863
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/FKMnOkOa1GQUBREmNXvdUXgOUxFMnV9Ru4pRJJQME=; b=wO9mZhJPRhdCqh5SKbRkCBhfhC
	kPZ0KbhlHjT6wFF45CsIcTVWCdrnrpSaLgLdyT/bMaVRd+aXqyYnFmHxJIncin7XWXmwRCMLFe4Um
	vgS2lUaxI7ZhRGhkvzVuZU6XtMmrYLpKSZD3o9a5QMVRMfjS7fg7MoyLhbXVSpLDAkxE8ATmSF7F9
	oIesKo1ojYC+xdsB11JhnaV/HezdXzxZbTPCJ9TJGQTpEYzmbJClH5NIGEaAMoKWmpTDEGo5/+L67
	oCRMTBpHXQene+jEJUGJ7eeCvKHGNSv9Sv4fxo0VKzSCAs2Row0ZEf6XsHDH19yV25i6qsIDDxgPx
	9UMUpjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BZc-00000007ucj-061t;
	Fri, 27 Mar 2026 18:06:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BZb-00000007ucT-2nuX;
	Fri, 27 Mar 2026 18:06:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C07E96013C;
	Fri, 27 Mar 2026 18:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC35C19424;
	Fri, 27 Mar 2026 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634778;
	bh=NF+8zTAwUcyuWSbqAv5EfRD6h1aQWSDUVa0i+26A4WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gvZc/nD9BrA4qpcVkqOmHYxig1qW4hyPs4RDjioeYgAxOM4RvzT8E2bvR7FosWKhd
	 6P/5xf245Sk3Fn58PRL1A514YqTS2foc1U8P38QjfjJ4/1meEI8B8YRsDIQYckXT3V
	 NgFTgRUKrNVRhgDcRuAl+uiCNUy+QQ79m7G6w+aHC4I8l3XKOQc8nZiL6U38LJumQx
	 l3wSEdsQuEN51nqKlP8oNgsMNZrfhznWNLPTt7tHD+M7vXvMoGVb0ElmdD11hR85W9
	 Ho+uJqTXTNkMBlxsWhD6nTqgblEtOX5/doBKTnwQTaBS1lUNvAkphnG6wTKqE4I8Je
	 A/FCt4C6AmxAA==
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
Subject: [PATCH resend v1 5/7] clocksource/drivers/rockchip: Use the TIMER_PDEV_DECLARE() macro
Date: Fri, 27 Mar 2026 19:05:57 +0100
Message-ID: <20260327180600.8150-6-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327180600.8150-1-daniel.lezcano@kernel.org>
References: <20260327180600.8150-1-daniel.lezcano@kernel.org>
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


