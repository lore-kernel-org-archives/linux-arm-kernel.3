Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72595C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4AOV2V5Pr+VVoS5llx0F+M/kezCmf883pBPOvuO/o8=; b=EtdmGP54TviK5mxYMr8XvnTplm
	R4jX8Dcn6tidoy2bIcKP47HOcnBUCjObgtajJtM3HPh0jVCIn5+3Y6QWhMU4L9UxzZQpfx/UW7Ihy
	G7lZZFsS/IF5hKCHjDh1JT87Pw7mdrQWWpNm/69RGFWFuVLW3eg93U6rGG/x7yrA2vTiLl+68E5sU
	MHVAXlyrmJXzYVA6UwN3PlIRKG8QVVME3qHGwHg36E1fLfkhWWN4xeTZKRsJhJciL9hEPTaSyi7WT
	Prz/8azOxq8+VkqIO7mcW6RQRuc5SFrpZm4kLcoTUrSUbjoy5yoJ8lYr+GVtRjnf5eGmvO46St6A3
	TVEMp9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ad5-0000000EuK6-3yBZ;
	Fri, 18 Sep 2026 15:35:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ad2-0000000EuJT-1FhZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789745761; x=1821281761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rTXEQS/4c/No4cusfrMb4rT1nMkSE1gMmPlhr/SAhWg=;
  b=VHjheNUYnGkGrTh9mezpIQD3fO/IITyIBn+QFd1roUnPA5pa3CPMOgsQ
   s9x+yC8++997NFiK4LJ4pdAg5NWVGyAffoh7ErKY2TE5A3qpjQiJScfkC
   IXtcF+aKmiBjG6LOSIGVDqRoAl0lAfU1+YzFFtQ1QbS8SGwRihUx4go3F
   JkjIGiN0ecrxat88iINQ8Q8Obtd7iXZ2JIJMVG+n68MH54QL4tM9OtR+V
   MsMCuPyMcNYOLM5+mlydGMkXEeK216s6S9pxWRNYuiYjQDWCUfjgpf5Ba
   E9TkSG/0aw6UQlLu30//1L723hm9MWptdu7zpQuDxuezkxcv5I7xUZhX8
   w==;
X-CSE-ConnectionGUID: w2bhoBCSSuq9+YKwtcsTHg==
X-CSE-MsgGUID: QjUTgLfMS+qldTVbdzbPCQ==
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="295232781"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:36:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 18 Sep 2026 08:35:54 -0700
Received: from ROU-LL-M51280.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 18 Sep 2026 08:35:51 -0700
From: Aubin Constans <aubin.constans@microchip.com>
To: Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
	Eugen Hristev <ehristev@kernel.org>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Romain Sioen <romain.sioen@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Robert Marko <robert.marko@sartura.hr>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Aubin Constans" <aubin.constans@microchip.com>
Subject: [PATCH] mmc: sdhci-of-at91: disable selectively clocks on pm runtime
Date: Fri, 18 Sep 2026 17:34:14 +0200
Message-ID: <20260918153414.909333-1-aubin.constans@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_083556_367146_65E4AAF4 
X-CRM114-Status: GOOD (  18.66  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

SAMA7G5's SDMMC run-time clock disabling is not supported.
Add support to avoid this scenario for SAMA7G5.

[Amended with a fix from Romain Sioen below this line]

Sama7 boards are impacted by an unbalanced prepare/unprepare
and enable/disable clock management in sdhci driver due to
the lack of support for SDMMC clock runtime disabling,
managed instead by the PMC driver.

Add conditions in the preset function to manage clock
depending on if the board support runtime clock disabling
and if we come from the probing or restoring procedure.

Add boolean start_clks variable to manage condition
in preset function.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
---
 drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 7c4ac65f247d..399856643e57 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
 	const struct sdhci_pltfm_data *pdata;
 	bool baseclk_is_generated_internally;
 	unsigned int divider_for_baseclk;
+	bool pm_runtime_disable_clks;
 };
 
 struct sdhci_at91_priv {
@@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d2_pdata = {
 static const struct sdhci_at91_soc_data soc_data_sama5d2 = {
 	.pdata = &sdhci_sama5d2_pdata,
 	.baseclk_is_generated_internally = false,
+	.pm_runtime_disable_clks = true,
 };
 
 static const struct sdhci_at91_soc_data soc_data_sam9x60 = {
 	.pdata = &sdhci_sama5d2_pdata,
 	.baseclk_is_generated_internally = true,
 	.divider_for_baseclk = 2,
+	.pm_runtime_disable_clks = true,
 };
 
 static const struct of_device_id sdhci_at91_dt_match[] = {
@@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
 
-static int sdhci_at91_set_clks_presets(struct device *dev)
+static int sdhci_at91_set_clks_presets(struct device *dev, bool start_clks)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	unsigned int			gck_rate, clk_base_rate;
 	unsigned int			preset_div;
 
-	clk_prepare_enable(priv->hclock);
+	/*
+	 * Manage clock prepare/enable procedure depending on if the board
+	 * support runtime clock disabling and if we come from the probing
+	 * or restoring procedure (for backup+self refresh).
+	 */
+	if (start_clks)
+		clk_prepare_enable(priv->hclock);
+
 	caps0 = readl(host->ioaddr + SDHCI_CAPABILITIES);
 	caps1 = readl(host->ioaddr + SDHCI_CAPABILITIES_1);
 
@@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
 	       host->ioaddr + SDHCI_PRESET_FOR_DDR50);
 
-	clk_prepare_enable(priv->mainck);
-	clk_prepare_enable(priv->gck);
+	/* Same clock management as for hclock */
+	if (start_clks) {
+		clk_prepare_enable(priv->mainck);
+		clk_prepare_enable(priv->gck);
+	}
 
 	return 0;
 }
@@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct device *dev)
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
 		mmc_retune_needed(host->mmc);
 
-	clk_disable_unprepare(priv->gck);
-	clk_disable_unprepare(priv->hclock);
-	clk_disable_unprepare(priv->mainck);
+	if (priv->soc_data->pm_runtime_disable_clks) {
+		clk_disable_unprepare(priv->gck);
+		clk_disable_unprepare(priv->hclock);
+		clk_disable_unprepare(priv->mainck);
+	}
 
 	return 0;
 }
@@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device *dev)
 	int ret;
 
 	if (priv->restore_needed) {
-		ret = sdhci_at91_set_clks_presets(dev);
+		ret = sdhci_at91_set_clks_presets(dev, priv->soc_data->pm_runtime_disable_clks);
 		if (ret)
 			return ret;
 
@@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device *dev)
 		goto out;
 	}
 
+	if (!priv->soc_data->pm_runtime_disable_clks)
+		goto out;
+
 	ret = clk_prepare_enable(priv->mainck);
 	if (ret) {
 		dev_err(dev, "can't enable mainck\n");
@@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
 				     "failed to get multclk\n");
 
-	ret = sdhci_at91_set_clks_presets(&pdev->dev);
+	ret = sdhci_at91_set_clks_presets(&pdev->dev, true);
 	if (ret)
 		return ret;
 
-- 
2.43.0


