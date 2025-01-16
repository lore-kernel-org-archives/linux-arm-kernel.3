Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FE0C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AHsM/xZpI8A/qMMPV/jCRPz3k6aqqfjRJq3WCyku5yc=; b=VIAP31RAtclXN/ki7fj0pw+LEb
	x1kI7/pZvcvEbl6svqnVNroEpOV41pzQdp5BvuqkhQdr3M6pxaDIh87wMbEeBugwgWFT2+ORgfVK/
	bqhy1m06RwwYCZbEDd3p6GglzfadJaLHkWFDJ1AG6EHJ2RlMY3AiE+CqyfK1I+Dg6lJr7swXpPfUm
	pY94zxwmMpG9uslDGsZ9x0FQsPUpzvKDWrlp0oTERCBpvCSR94+kcNWEB0zB7poO8G+jJvwQWzqE7
	GvgtxTbbFIWBmSk4x+ODdr46S1Wm4S8iH6InLp4UiA/t7i2O93Ic2u+3dzcXmNmCJCgF01aLzrdhw
	IZ42VCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSdd-0000000FVG2-26fD;
	Thu, 16 Jan 2025 16:22:33 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYScN-0000000FV1W-0krE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 16:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737044475; x=1768580475;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2on8qZ4VjcAt0taSdQR59mTjZSUShqi/XYwJ4lDPBWY=;
  b=b/kMIvHabC2bEqx1INmFioqmJe2ppzlLgsIGRJdyL/tURYJoOW5FWRt9
   tbLLZuo8TBJBA3Je+Tua66iKdqYlBUh5xssotk9o0V3DhW1Dz3df2SdQ1
   htoUKGwNo9o5Lq7iAaDf/g9frfUaPcj8/mt94C7Shcxc/MplIq9jgSzhh
   KB5nQW4ny/SO1Wsx0W9ecpTO4NbsA/YFubJvdKUaLAgU/A7o8nMUJNfLy
   4pb15c6pFNBWlRgiJkTFeCVvf7V4vDnQxwfl0z+YjdNONS1hcuNf2k3v+
   BNeQIzVMv6T5IVaRl2wMeuPnIQT+z0+NjiX1RF40IIryWYtCVRBFAjd2m
   Q==;
X-CSE-ConnectionGUID: O4ETQPn4TOOM7zIg+krIBA==
X-CSE-MsgGUID: +9QeeGXeQKy0DRoe83roAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48030973"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="48030973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 08:21:13 -0800
X-CSE-ConnectionGUID: 1H0zFeM9TMK7M/oHeAhUaA==
X-CSE-MsgGUID: C4jbOm2SRpy8YOUom+Ib/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110164712"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jan 2025 08:21:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2DFAD39C; Thu, 16 Jan 2025 18:21:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v1 1/1] spi: pxa2xx: Introduce __lpss_ssp_update_priv() helper
Date: Thu, 16 Jan 2025 18:21:09 +0200
Message-ID: <20250116162109.263081-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_082115_234698_B7FAFD32 
X-CRM114-Status: GOOD (  17.79  )
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

In a few places we repeat RMW IO operations on LPSS private
registers. Let's introduce a helper to make the code better
to read and maintain.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.c | 88 ++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 48 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 903d76145272..5f9cac41baff 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -73,8 +73,9 @@ struct chip_data {
 #define LPSS_CAPS_CS_EN_MASK			(0xf << LPSS_CAPS_CS_EN_SHIFT)
 
 #define LPSS_PRIV_CLOCK_GATE 0x38
-#define LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK 0x3
-#define LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON 0x3
+#define LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK	0x3
+#define LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON	0x3
+#define LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_OFF	0x0
 
 struct lpss_config {
 	/* LPSS offset from drv_data->ioaddr */
@@ -321,6 +322,20 @@ static void __lpss_ssp_write_priv(struct driver_data *drv_data,
 	writel(value, drv_data->lpss_base + offset);
 }
 
+static bool __lpss_ssp_update_priv(struct driver_data *drv_data, unsigned int offset,
+				   u32 mask, u32 value)
+{
+	u32 new, curr;
+
+	curr = __lpss_ssp_read_priv(drv_data, offset);
+	new = (curr & ~mask) | (value & mask);
+	if (new == curr)
+		return false;
+
+	__lpss_ssp_write_priv(drv_data, offset, new);
+	return true;
+}
+
 /*
  * lpss_ssp_setup - perform LPSS SSP specific setup
  * @drv_data: pointer to the driver private data
@@ -337,21 +352,16 @@ static void lpss_ssp_setup(struct driver_data *drv_data)
 	drv_data->lpss_base = drv_data->ssp->mmio_base + config->offset;
 
 	/* Enable software chip select control */
-	value = __lpss_ssp_read_priv(drv_data, config->reg_cs_ctrl);
-	value &= ~(LPSS_CS_CONTROL_SW_MODE | LPSS_CS_CONTROL_CS_HIGH);
-	value |= LPSS_CS_CONTROL_SW_MODE | LPSS_CS_CONTROL_CS_HIGH;
-	__lpss_ssp_write_priv(drv_data, config->reg_cs_ctrl, value);
+	value = LPSS_CS_CONTROL_SW_MODE | LPSS_CS_CONTROL_CS_HIGH;
+	__lpss_ssp_update_priv(drv_data, config->reg_cs_ctrl, value, value);
 
 	/* Enable multiblock DMA transfers */
 	if (drv_data->controller_info->enable_dma) {
-		__lpss_ssp_write_priv(drv_data, config->reg_ssp, 1);
+		__lpss_ssp_update_priv(drv_data, config->reg_ssp, BIT(0), BIT(0));
 
 		if (config->reg_general >= 0) {
-			value = __lpss_ssp_read_priv(drv_data,
-						     config->reg_general);
-			value |= LPSS_GENERAL_REG_RXTO_HOLDOFF_DISABLE;
-			__lpss_ssp_write_priv(drv_data,
-					      config->reg_general, value);
+			value = LPSS_GENERAL_REG_RXTO_HOLDOFF_DISABLE;
+			__lpss_ssp_update_priv(drv_data, config->reg_general, value, value);
 		}
 	}
 }
@@ -361,30 +371,19 @@ static void lpss_ssp_select_cs(struct spi_device *spi,
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
-	u32 value, cs;
+	u32 cs;
 
-	if (!config->cs_sel_mask)
+	cs = spi_get_chipselect(spi, 0) << config->cs_sel_shift;
+	if (!__lpss_ssp_update_priv(drv_data, config->reg_cs_ctrl, config->cs_sel_mask, cs))
 		return;
 
-	value = __lpss_ssp_read_priv(drv_data, config->reg_cs_ctrl);
-
-	cs = spi_get_chipselect(spi, 0);
-	cs <<= config->cs_sel_shift;
-	if (cs != (value & config->cs_sel_mask)) {
-		/*
-		 * When switching another chip select output active the
-		 * output must be selected first and wait 2 ssp_clk cycles
-		 * before changing state to active. Otherwise a short
-		 * glitch will occur on the previous chip select since
-		 * output select is latched but state control is not.
-		 */
-		value &= ~config->cs_sel_mask;
-		value |= cs;
-		__lpss_ssp_write_priv(drv_data,
-				      config->reg_cs_ctrl, value);
-		ndelay(1000000000 /
-		       (drv_data->controller->max_speed_hz / 2));
-	}
+	/*
+	 * When switching another chip select output active the output must be
+	 * selected first and wait 2 ssp_clk cycles before changing state to
+	 * active. Otherwise a short glitch will occur on the previous chip
+	 * select since output select is latched but state control is not.
+	 */
+	ndelay(1000000000 / (drv_data->controller->max_speed_hz / 2));
 }
 
 static void lpss_ssp_cs_control(struct spi_device *spi, bool enable)
@@ -392,34 +391,27 @@ static void lpss_ssp_cs_control(struct spi_device *spi, bool enable)
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
 	const struct lpss_config *config;
-	u32 value;
+	u32 mask;
 
 	config = lpss_get_config(drv_data);
 
 	if (enable)
 		lpss_ssp_select_cs(spi, config);
 
-	value = __lpss_ssp_read_priv(drv_data, config->reg_cs_ctrl);
-	if (enable)
-		value &= ~LPSS_CS_CONTROL_CS_HIGH;
-	else
-		value |= LPSS_CS_CONTROL_CS_HIGH;
-	__lpss_ssp_write_priv(drv_data, config->reg_cs_ctrl, value);
+	mask = LPSS_CS_CONTROL_CS_HIGH;
+	__lpss_ssp_update_priv(drv_data, config->reg_cs_ctrl, mask, enable ? mask : 0);
 	if (config->cs_clk_stays_gated) {
-		u32 clkgate;
-
 		/*
 		 * Changing CS alone when dynamic clock gating is on won't
 		 * actually flip CS at that time. This ruins SPI transfers
 		 * that specify delays, or have no data. Toggle the clock mode
 		 * to force on briefly to poke the CS pin to move.
 		 */
-		clkgate = __lpss_ssp_read_priv(drv_data, LPSS_PRIV_CLOCK_GATE);
-		value = (clkgate & ~LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK) |
-			LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON;
-
-		__lpss_ssp_write_priv(drv_data, LPSS_PRIV_CLOCK_GATE, value);
-		__lpss_ssp_write_priv(drv_data, LPSS_PRIV_CLOCK_GATE, clkgate);
+		mask = LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK;
+		if (__lpss_ssp_update_priv(drv_data, LPSS_PRIV_CLOCK_GATE, mask,
+					   LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON))
+			__lpss_ssp_update_priv(drv_data, LPSS_PRIV_CLOCK_GATE, mask,
+					       LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_OFF);
 	}
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


