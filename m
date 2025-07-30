Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC1AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 05:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zizjgYVjgckIukX1uQ4bGzAwUlK5tJfi8FiuOjPclE4=; b=o9+WaW7jA5cPGhHVj5q7ATbaRj
	QONXmYN6CsKB6sf9TxfY1nwUOZQ82DKwXqsteCueiYVJDbeRU/yKMeAe01b8ID/J8SJVOSHAVlA8V
	REyTm8m/G2T4rMyPGutvmgE04BPG733mjK6hNea1IiYZUqujXa8Mh0kcMS+0Z3xuB1kOVuoad5fAF
	ow+KcmlNU6Z1kmmkvPB6lxs9dJ292NHn+XKrCBEJCh7bERobdvph9q2mc50N4ck2J/c19j1Z7Zvj3
	GYoNfJa2RruCEtzBT5bY3tAXYrz7Tme6RsadJWvcp7UMEymMOIdiYgq4PNQA/9w77jwgplk+Z0iRF
	duwj16Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzc7-00000000jco-39n8;
	Wed, 30 Jul 2025 05:44:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzWm-00000000jJt-0fQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 05:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753853940; x=1785389940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aaF4RzhnHIcEcpz1/fOfbiJA8IKYcLEpZOP28Wzp2/8=;
  b=WSrBcbjTetUB0nKI4ihV8Wpbp+cfgH2odLSevds27LJ9t3nALK/iS9G2
   EDdAGMSjlF0IcP9zAWIlAAkZFHHkjgLNKGszk2jYquVgk2v3Go6D0Mds+
   /RruQ9CTPvnW7PPpAvamoGA/GTzh47GStJc5uAsdoYCKgVjsTyJrz9vzG
   Xqq3AZiGuOmPq/FhGo8Zs2+pfG/hi7nCEMlNfOc+tp7MwiL8sqhUJS1N1
   537UnRo0Vsy4a+FRFPxbuhGymIYSIx9HgLstcMsKZGdNIyeqmCmshaFvF
   vqknerCirqd8gbdqLbFNS/X7FXnxu76y9ID/vZAlGewMebId3A3bSSRjH
   A==;
X-CSE-ConnectionGUID: c14mdGTVRrKVZSCWv/A+CA==
X-CSE-MsgGUID: zJX4AgxoSUGlowh+GfPKcg==
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="45191583"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2025 22:38:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 29 Jul 2025 22:38:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 29 Jul 2025 22:38:51 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <ryan.wanner@microchip.com>, <broonie@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH 3/3] spi: atmel: Add support for handling GCLK as a clock source
Date: Wed, 30 Jul 2025 11:08:47 +0530
Message-ID: <20250730053847.262330-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_223900_260170_447E7ACA 
X-CRM114-Status: GOOD (  20.20  )
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

The SPI peripheral clock is typically used to derive the serial
clock (SPCK) via the FLEX_SPI_CSRx.SCBR field. However, on platforms
like the SAM9X7 SoC, where the peripheral clock can reach up to 266 MHz,
this may exceed the SCBR limit, causing SPI transfers to fail.
This patch adds support for using the SPI Generic Clock (GCLK) as an
alternative and more flexible clock source for SPCK generation.
The FLEX_SPI_MR.BRSRCCLK bit is updated accordingly to select between the
peripheral clock and GCLK.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/spi/spi-atmel.c | 64 +++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 409f544d8983..89977bff76d2 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -256,6 +256,7 @@ struct atmel_spi {
 	void __iomem		*regs;
 	int			irq;
 	struct clk		*clk;
+	struct clk		*gclk;
 	struct platform_device	*pdev;
 	unsigned long		spi_clk;
 
@@ -1480,6 +1481,8 @@ static void atmel_get_caps(struct atmel_spi *as)
 
 static void atmel_spi_init(struct atmel_spi *as)
 {
+	u32 mr = 0;
+
 	spi_writel(as, CR, SPI_BIT(SWRST));
 	spi_writel(as, CR, SPI_BIT(SWRST)); /* AT91SAM9263 Rev B workaround */
 
@@ -1487,12 +1490,17 @@ static void atmel_spi_init(struct atmel_spi *as)
 	if (as->fifo_size)
 		spi_writel(as, CR, SPI_BIT(FIFOEN));
 
-	if (as->caps.has_wdrbt) {
-		spi_writel(as, MR, SPI_BIT(WDRBT) | SPI_BIT(MODFDIS)
-				| SPI_BIT(MSTR));
-	} else {
-		spi_writel(as, MR, SPI_BIT(MSTR) | SPI_BIT(MODFDIS));
-	}
+	/*
+	 * If GCLK is selected as the source clock for the bit rate generation
+	 * Enable the BRSRCCLK/FDIV/DIV32 bit
+	 */
+	if (as->gclk)
+		mr |= SPI_BIT(FDIV);
+
+	if (as->caps.has_wdrbt)
+		mr |= SPI_BIT(WDRBT);
+
+	spi_writel(as, MR, mr | SPI_BIT(MODFDIS) | SPI_BIT(MSTR));
 
 	if (as->use_pdc)
 		spi_writel(as, PTCR, SPI_BIT(RXTDIS) | SPI_BIT(TXTDIS));
@@ -1555,6 +1563,11 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	as->phybase = regs->start;
 	as->irq = irq;
 	as->clk = clk;
+	as->gclk = devm_clk_get_optional(&pdev->dev, "spi_gclk");
+	if (IS_ERR(as->gclk)) {
+		ret = PTR_ERR(as->gclk);
+		goto out_unmap_regs;
+	}
 
 	init_completion(&as->xfer_completion);
 
@@ -1615,7 +1628,19 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free_irq;
 
-	as->spi_clk = clk_get_rate(clk);
+	/*
+	 * In cases where the peripheral clock is higher,the FLEX_SPI_CSRx.SCBR
+	 * exceeds the threshold (SCBR ≤ 255), the GCLK is used as the source clock
+	 * for the SPCK (SPI Serial Clock) bit rate generation
+	 */
+	if (as->gclk) {
+		ret = clk_prepare_enable(as->gclk);
+		if (ret)
+			goto out_disable_clk;
+		as->spi_clk = clk_get_rate(as->gclk);
+	} else {
+		as->spi_clk = clk_get_rate(clk);
+	}
 
 	as->fifo_size = 0;
 	if (!of_property_read_u32(pdev->dev.of_node, "atmel,fifo-size",
@@ -1650,6 +1675,8 @@ static int atmel_spi_probe(struct platform_device *pdev)
 
 	spi_writel(as, CR, SPI_BIT(SWRST));
 	spi_writel(as, CR, SPI_BIT(SWRST)); /* AT91SAM9263 Rev B workaround */
+	clk_disable_unprepare(as->gclk);
+out_disable_clk:
 	clk_disable_unprepare(clk);
 out_free_irq:
 out_unmap_regs:
@@ -1685,6 +1712,8 @@ static void atmel_spi_remove(struct platform_device *pdev)
 	spin_unlock_irq(&as->lock);
 
 	clk_disable_unprepare(as->clk);
+	if (as->gclk)
+		clk_disable_unprepare(as->gclk);
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1696,6 +1725,8 @@ static int atmel_spi_runtime_suspend(struct device *dev)
 	struct atmel_spi *as = spi_controller_get_devdata(host);
 
 	clk_disable_unprepare(as->clk);
+	if (as->gclk)
+		clk_disable_unprepare(as->gclk);
 	pinctrl_pm_select_sleep_state(dev);
 
 	return 0;
@@ -1705,10 +1736,20 @@ static int atmel_spi_runtime_resume(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct atmel_spi *as = spi_controller_get_devdata(host);
+	int ret;
 
 	pinctrl_pm_select_default_state(dev);
 
-	return clk_prepare_enable(as->clk);
+	ret = clk_prepare_enable(as->clk);
+	if (ret)
+		return ret;
+	if (as->gclk) {
+		ret = clk_prepare_enable(as->gclk);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int atmel_spi_suspend(struct device *dev)
@@ -1736,10 +1777,17 @@ static int atmel_spi_resume(struct device *dev)
 	ret = clk_prepare_enable(as->clk);
 	if (ret)
 		return ret;
+	if (as->gclk) {
+		ret = clk_prepare_enable(as->gclk);
+		if (ret)
+			return ret;
+	}
 
 	atmel_spi_init(as);
 
 	clk_disable_unprepare(as->clk);
+	if (as->gclk)
+		clk_disable_unprepare(as->gclk);
 
 	if (!pm_runtime_suspended(dev)) {
 		ret = atmel_spi_runtime_resume(dev);
-- 
2.25.1


