Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31721CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBq0no2Rd7WGrt8AoZwiXYr0+p0FJw+6NpIZTKWyHfk=; b=nJSeJDtUG+Hc12tvgJjWHOpw2y
	auPtxpUZF3vq9bxyboFBd86703IYXJjHBJZ//4VqHmRKUKtBPT3G/Qk0tOf5ugMDS1Me4kHtihT/3
	UYYDjRvN0bdxZxeYs30OBuW1TpBWLVbC+daHvwrnQL0shTXTIw97ZGJ6Zw4FTp1iBRBYpZyDc93XU
	m+jTdvU+nOEjj5z9GR0PEQLXyT9+ysqZ+ARXVG/4KqxvQMKfF83BDkv7Hik7LyuIAIiUgr3Sr87bV
	GQ1qKUyJX5mDIIoZXZ0LAaZh1TfsuGWEOlL3LVqU0DTaywpxuHFU7oycxYWMve7wbDZlGMbcsSq9l
	BBW3Wblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwq6-00000006dXM-0qIC;
	Wed, 30 Sep 2026 16:07:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpq-00000006dQy-2pZL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XBq0no2Rd7WGrt8AoZwiXYr0+p0FJw+6NpIZTKWyHfk=; b=gQTdhHshngPjRlTim0lz67vpWV
	phSbVgA1oT6L9H7AIjRQI4oQwEcDQZ+ob0c39r8MxeW52GX7rMc26lsW6ogEHxqKAZD1DwAKrIR1B
	2erzeAclzYtcBhlb7OD3WQPhTsEniozYU98BhRx5H6pfr18HzoYCaootVUh689PrXb18qEmYcVAbk
	7QIJFf2jSWaDLmcCCE64IqkuT97ptKvKvx9ine9JPskEb9pDNUtIIHrUyLCPhPPVbQKt8YopApxbA
	/A11uNYAiipJR2NSOVyBmvjXX2y9x/k+jbznFqmbO7RThRAAftps2n7Vw7XafLKDERrcmwKhRTLD2
	G1qD5K8w==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwpn-0000000435a-2Xs8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XBq0no2Rd7WGrt8AoZwiXYr0+p0FJw+6NpIZTKWyHfk=; b=uNswyTfU2oYZHmrNpW7T9hFyCF
	s3NwNAOA107MrBTBHRE0HZX6LVVLBqggBdR+cjc7LnHgoWcDAXVCOz8jKgd5BNtfxOYwgQSH0OjzQ
	6ZuFWFz5vTp8K6ffOaJWMX39X8PxsFz7XGmxD7bv25CAWOwhHB/JHurQzgGC8i27JgsLfPdiTNOz8
	HfgpCTiHdMYmqpdB8YdGJSdGTzZHJtPRsX3vOhrSo/g1MnTglQDf3Mxd2BYvddku8qBUA760wNg9r
	dVyTPQ4o8DSnmpk6znw2lpfKNs0spfW84YRnOjDcLC5B4vet6kxg383GcrYumwEgaFaThA7dTmWgU
	F9eZO0wQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwph-009IoV-0O;
	Wed, 30 Sep 2026 16:07:01 +0000
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
Subject: [PATCH v17 4/6] spi: pxa2xx: overhaul teardown and suspend sequence to synchronize IRQ before clock gating
Date: Thu,  1 Oct 2026 00:06:27 +0800
Message-Id: <20260930160629.1822-5-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930160629.1822-1-fourdollars@debian.org>
References: <20260930160629.1822-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_170708_194184_15FAF637 
X-CRM114-Status: GOOD (  19.47  )
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

When removing the driver or suspending the device, the clock must not
be disabled while shared interrupts are still active. Gating the clock
before waiting for in-flight interrupt handlers to complete results
in race conditions where the handler performs unclocked MMIO accesses,
causing PCIe Completion Timeouts.

Overhaul the remove, suspend, and runtime_suspend paths to use a strict
synchronized teardown order:
1. In remove, call free_irq() (which internally synchronizes any in-flight
   handlers) before disabling the clock via pxa2xx_spi_clk_disable().
2. In runtime_suspend, under clk_lock and only when the clock is enabled,
   disable the SSP peripheral via pxa_ssp_disable(), clear 'clk_enabled'
   via WRITE_ONCE() so that new interrupts immediately bail out with
   IRQ_NONE, drain in-flight handlers via synchronize_irq() while the
   clock is still running, and finally gate the clock with
   clk_disable_unprepare().
3. In system suspend, suspend the controller queue and use
   pm_runtime_force_suspend() to invoke runtime_suspend, ensuring
   in-flight interrupts are drained before the clock is gated. If
   pm_runtime_force_suspend() fails, resume the controller queue so
   the controller remains operational since the system will stay awake.
4. In system resume, restore the device state using
   pm_runtime_force_resume() before restarting the controller queue.
   If pm_runtime_force_resume() fails, return the error immediately
   without calling spi_controller_resume(), keeping the queue stopped
   to prevent transferring messages against unclocked or unpowered
   hardware. If the device was already runtime-suspended prior to
   system sleep, pm_runtime_force_resume() leaves the clock gated until
   the next transfer resumes it, optimizing idle power.

Throughout suspended states, 'clk_enabled' being false serves as the
primary invariant ensuring that any subsequent interrupt handler
invocation safely returns IRQ_NONE without accessing hardware registers.

Assisted-by: Antigravity:gemini-3.8-flash spin sparse
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index b091434977af..2a3fa9ca7213 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1520,31 +1520,33 @@ void pxa2xx_spi_remove(struct device *dev)
 
 	/* Disable the SSP at the peripheral and SOC level */
 	pxa_ssp_disable(ssp);
+
+	/* Release IRQ before gating the SOC clock */
+	free_irq(ssp->irq, drv_data);
+
+	/* Safe to disable the SSP clock now */
 	pxa2xx_spi_clk_disable(drv_data);
 
 	/* Release DMA */
 	if (drv_data->controller_info->enable_dma)
 		pxa2xx_spi_dma_release(drv_data);
-
-	/* Release IRQ */
-	free_irq(ssp->irq, drv_data);
 }
 EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_remove, "SPI_PXA2xx");
 
 static int pxa2xx_spi_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
-	struct ssp_device *ssp = drv_data->ssp;
 	int ret;
 
 	ret = spi_controller_suspend(drv_data->controller);
 	if (ret)
 		return ret;
 
-	pxa_ssp_disable(ssp);
-
-	if (!pm_runtime_suspended(dev))
-		pxa2xx_spi_clk_disable(drv_data);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		spi_controller_resume(drv_data->controller);
+		return ret;
+	}
 
 	return 0;
 }
@@ -1554,14 +1556,10 @@ static int pxa2xx_spi_resume(struct device *dev)
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Enable the SSP clock */
-	if (!pm_runtime_suspended(dev)) {
-		ret = pxa2xx_spi_clk_enable(drv_data);
-		if (ret)
-			return ret;
-	}
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
 
-	/* Start the queue running */
 	return spi_controller_resume(drv_data->controller);
 }
 
@@ -1569,7 +1567,16 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
-	pxa2xx_spi_clk_disable(drv_data);
+	mutex_lock(&drv_data->clk_lock);
+	if (drv_data->clk_enabled) {
+		pxa_ssp_disable(drv_data->ssp);
+		WRITE_ONCE(drv_data->clk_enabled, false);
+		mutex_unlock(&drv_data->clk_lock);
+		synchronize_irq(drv_data->ssp->irq);
+		clk_disable_unprepare(drv_data->ssp->clk);
+	} else {
+		mutex_unlock(&drv_data->clk_lock);
+	}
 	return 0;
 }
 
-- 
2.39.5


