Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B378ECA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XEh8TAHmyixoPUH+ecissl+tF/mzv7ZHGaRd0hfcmo=; b=FnmGR37T39GEkHjItVof+KLOxh
	YsNvDpCzFRHc9c+dmxXAg5xrUR9ymdMEQc4Dq9NdqUvLwaYogf+yq/nD4bTMAbLxDXewDtCuYIhBb
	pD4cAwf9GDKWXP/WkovHmfEVwUWbRcoLIF5+MvPewRu2WjrLWrAm/RHW6PwLGe5xlc4XAQj8IxUm/
	w96+lgoWZsaXD3FMCHO8c+FpcoF36WOgf+euYGPX00GDAc8DND4nqevrkllgccDkpXUzFxp/l8+Xk
	V4GEuVD+PqPT1pqglug2BVkRO3bII5Apk9NM6d4xarmkPatKxCKxNHbAosLKrGniQ53fxgWKzWZKG
	/lq71u1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpo-00000006dQZ-2nnC;
	Wed, 30 Sep 2026 16:07:08 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpm-00000006dOi-1vof
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6XEh8TAHmyixoPUH+ecissl+tF/mzv7ZHGaRd0hfcmo=; b=YrHlJLl4tZ4CAtAN/JRxMwt7a0
	Xj3dblnVc194J2PvT9ATKgSvh/5bRJXxAYBDKZv60eAZJYjJERwRJ5rK2kYb7pT2CyGAYIX7u2PB1
	ppNv+GiISh9lIDWgeplgWt3AqmZCOz9Yrljm+HNWfqopQX2jbiXesiygblR1X2VkKSzej/3GzSX/i
	MUQcNOQUZmhUN7XV76ahKpEBmDulo1fqvN4w/dz/lKB6ND6/cwToR1+42VW3mxLfPXUR/sUzPay9y
	klYi+hV9bPbneuNbmseMEtZcfPeQunVDxyvVhprr1Db03Pr/hML9YxeqWq074SLj4aIsMLamZwQrC
	4DeUdrxg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwpd-009IoV-23;
	Wed, 30 Sep 2026 16:06:58 +0000
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v17 3/6] spi: pxa2xx: acquire active PM runtime reference in interrupt handler
Date: Thu,  1 Oct 2026 00:06:26 +0800
Message-Id: <20260930160629.1822-4-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930160629.1822-1-fourdollars@debian.org>
References: <20260930160629.1822-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_090706_665579_5EF8ECB9 
X-CRM114-Status: GOOD (  24.63  )
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

On a shared interrupt line, ssp_int() can be invoked while the SPI
controller is suspended or transitioning power states. In ssp_int(),
evaluating device power state without acquiring a reference before
accessing MMIO registers is not atomic: another thread executing
pm_runtime_suspend() can drop the last reference and gate the clock
immediately after the check passes. Accessing unclocked registers then
leads to PCIe Completion Timeouts and system hangs.

In addition, request_irq() is called in pxa2xx_spi_probe() before the
clock is enabled and the controller hardware is initialized, allowing
shared interrupts to fire against partially configured hardware.

Ensure the interrupt handler runs only when the hardware is clocked and
active:
1. In ssp_int(), check READ_ONCE(drv_data->clk_enabled), immediately
   returning IRQ_NONE if the clock is disabled. Update 'clk_enabled'
   with WRITE_ONCE() in the clock helpers to pair with the lockless
   reader.
2. Call pm_runtime_get_if_active(dev) in ssp_int() to atomically check
   if the device is active and acquire a PM runtime reference. If
   runtime PM is enabled and the device is suspended (return value 0),
   return IRQ_NONE without accessing MMIO registers. When runtime PM is
   disabled (return value -EINVAL), the controller is permanently
   active, so proceed with servicing the interrupt.
3. On exit, if an active PM reference was acquired (> 0), release it
   via pm_runtime_put_autosuspend() when an interrupt was handled
   (IRQ_HANDLED) to preserve the autosuspend delay, or via
   pm_runtime_put() on IRQ_NONE to avoid refreshing the autosuspend
   timer on foreign interrupts.
4. In pxa2xx_spi_probe(), move request_irq() after the clock is enabled
   and hardware registers are fully initialized, right before
   spi_register_controller(), ensuring no interrupt can run against
   unconfigured hardware, and update error unwinding accordingly.

Assisted-by: Antigravity:gemini-3.8-flash spin sparse
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 68 +++++++++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index a9d19d9a5343..b091434977af 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -721,7 +721,7 @@ static int pxa2xx_spi_clk_enable(struct driver_data *drv_data)
 	if (!drv_data->clk_enabled) {
 		ret = clk_prepare_enable(drv_data->ssp->clk);
 		if (!ret)
-			drv_data->clk_enabled = true;
+			WRITE_ONCE(drv_data->clk_enabled, true);
 	}
 	mutex_unlock(&drv_data->clk_lock);
 
@@ -732,7 +732,7 @@ static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
 {
 	mutex_lock(&drv_data->clk_lock);
 	if (drv_data->clk_enabled) {
-		drv_data->clk_enabled = false;
+		WRITE_ONCE(drv_data->clk_enabled, false);
 		clk_disable_unprepare(drv_data->ssp->clk);
 	}
 	mutex_unlock(&drv_data->clk_lock);
@@ -741,17 +741,25 @@ static void pxa2xx_spi_clk_disable(struct driver_data *drv_data)
 static irqreturn_t ssp_int(int irq, void *dev_id)
 {
 	struct driver_data *drv_data = dev_id;
+	struct device *dev = drv_data->ssp->dev;
 	u32 sccr1_reg;
 	u32 mask = drv_data->mask_sr;
 	u32 status;
+	irqreturn_t ret;
+	int active;
 
 	/*
-	 * The IRQ might be shared with other peripherals so we must first
-	 * check that are we RPM suspended or not. If we are we assume that
-	 * the IRQ was not for us (we shouldn't be RPM suspended when the
-	 * interrupt is enabled).
+	 * The IRQ might be shared with other peripherals or trigger during
+	 * power state transitions. Ensure the clock is active, and acquire
+	 * an active PM runtime reference while ssp_int() runs. If runtime
+	 * PM is enabled and the device is suspended (active == 0), return
+	 * IRQ_NONE immediately without touching MMIO registers.
 	 */
-	if (pm_runtime_suspended(drv_data->ssp->dev))
+	if (!READ_ONCE(drv_data->clk_enabled))
+		return IRQ_NONE;
+
+	active = pm_runtime_get_if_active(dev);
+	if (active == 0)
 		return IRQ_NONE;
 
 	/*
@@ -762,7 +770,7 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
 	 */
 	status = pxa2xx_spi_read(drv_data, SSSR);
 	if (status == ~0)
-		return IRQ_NONE;
+		goto out_put;
 
 	sccr1_reg = pxa2xx_spi_read(drv_data, SSCR1);
 
@@ -775,18 +783,32 @@ static irqreturn_t ssp_int(int irq, void *dev_id)
 		mask &= ~SSSR_TINT;
 
 	if (!(status & mask))
-		return IRQ_NONE;
+		goto out_put;
 
 	pxa2xx_spi_write(drv_data, SSCR1, sccr1_reg & ~drv_data->int_cr1);
 	pxa2xx_spi_write(drv_data, SSCR1, sccr1_reg);
 
 	if (!drv_data->controller->cur_msg) {
 		handle_bad_msg(drv_data);
-		/* Never fail */
-		return IRQ_HANDLED;
+		ret = IRQ_HANDLED;
+		goto out;
 	}
 
-	return drv_data->transfer_handler(drv_data);
+	ret = drv_data->transfer_handler(drv_data);
+	goto out;
+
+out_put:
+	ret = IRQ_NONE;
+
+out:
+	if (active > 0) {
+		if (ret == IRQ_HANDLED)
+			pm_runtime_put_autosuspend(dev);
+		else
+			pm_runtime_put(dev);
+	}
+
+	return ret;
 }
 
 /*
@@ -1356,11 +1378,6 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 						| SSSR_ROR | SSSR_TUR;
 	}
 
-	ret = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
-			drv_data);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "cannot get IRQ %d\n", ssp->irq);
-
 	/* Setup DMA if requested */
 	if (platform_info->enable_dma) {
 		ret = pxa2xx_spi_dma_setup(drv_data);
@@ -1380,7 +1397,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 	/* Enable SOC clock */
 	ret = pxa2xx_spi_clk_enable(drv_data);
 	if (ret)
-		goto out_error_dma_irq_alloc;
+		goto out_error_dma_alloc;
 
 	controller->max_speed_hz = clk_get_rate(ssp->clk);
 	/*
@@ -1464,22 +1481,31 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 		}
 	}
 
+	ret = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
+			drv_data);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "cannot get IRQ %d\n", ssp->irq);
+		goto out_error_clock_enabled;
+	}
+
 	/* Register with the SPI framework */
 	dev_set_drvdata(dev, drv_data);
 	ret = spi_register_controller(controller);
 	if (ret) {
 		dev_err_probe(dev, ret, "problem registering SPI controller\n");
-		goto out_error_clock_enabled;
+		goto out_error_irq_alloc;
 	}
 
 	return ret;
 
+out_error_irq_alloc:
+	free_irq(ssp->irq, drv_data);
+
 out_error_clock_enabled:
 	pxa2xx_spi_clk_disable(drv_data);
 
-out_error_dma_irq_alloc:
+out_error_dma_alloc:
 	pxa2xx_spi_dma_release(drv_data);
-	free_irq(ssp->irq, drv_data);
 
 	return ret;
 }
-- 
2.39.5


