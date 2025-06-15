Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B5C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77Me1yNJKKHFc8QWLnkbu5mgdELFUzXcCZkdinSW6yY=; b=Qw8TZZmPXpIgTpFE/0Q3nw5Ufh
	Oqw+zctZAmVELJ56FRFx9em9hGRPyjeM6CSfgC2kXHLg1Opm6CNB3bi6U39Y7Ich8jfeWjaS2MSza
	DoCIOASJZu+DHUnquKySIsqTGVVotrXdrtyDNjOP6KVaRXlYyYEwTw5k4SvYDv1NCS5PTFvpMpCCx
	B8Yw5JVlr+k/A5V9zqXypRj2sKIEiupl5EvbqfHAqCThATxV4WFuWbnR1m9PfiZJb7N9QCXzBxJ6+
	fQucgE5PFi+wKPx13kUEiFVrMOTJvLANx1tXkR7QTZ1LBaKdjkE/R3ilvNujPxVpMUpGXbMLTd11E
	+nbkqrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQenZ-00000002DEb-2Ygh;
	Sun, 15 Jun 2025 04:16:49 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVn-00000002BsG-2MyI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:28 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:04 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:04 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
Date: Sun, 15 Jun 2025 11:58:02 +0800
Message-ID: <20250615035803.3752235-8-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205827_602245_4C3FA384 
X-CRM114-Status: GOOD (  14.87  )
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

The timing phase is no more needed since the auto tuning is applied.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 178 +----------------------------
 1 file changed, 3 insertions(+), 175 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 92687fc30d1d..365c02215273 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -34,6 +34,9 @@
 #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
 #define   ASPEED_SDC_PHASE_MAX		31
 
+#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK	BIT(4)
+#define ASPEED_SDHCI_NR_TAPS		15
+
 /* SDIO{10,20} */
 #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
 /* SDIO{14,24} */
@@ -48,37 +51,14 @@ struct aspeed_sdc {
 	void __iomem *regs;
 };
 
-struct aspeed_sdhci_tap_param {
-	bool valid;
-
-#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK	BIT(4)
-	u8 in;
-	u8 out;
-};
-
-struct aspeed_sdhci_tap_desc {
-	u32 tap_mask;
-	u32 enable_mask;
-	u8 enable_value;
-};
-
-struct aspeed_sdhci_phase_desc {
-	struct aspeed_sdhci_tap_desc in;
-	struct aspeed_sdhci_tap_desc out;
-};
-
 struct aspeed_sdhci_pdata {
 	unsigned int clk_div_start;
-	const struct aspeed_sdhci_phase_desc *phase_desc;
-	size_t nr_phase_descs;
 };
 
 struct aspeed_sdhci {
 	const struct aspeed_sdhci_pdata *pdata;
 	struct aspeed_sdc *parent;
 	u32 width_mask;
-	struct mmc_clk_phase_map phase_map;
-	const struct aspeed_sdhci_phase_desc *phase_desc;
 };
 
 /*
@@ -129,114 +109,6 @@ static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
 	spin_unlock(&sdc->lock);
 }
 
-static u32
-aspeed_sdc_set_phase_tap(const struct aspeed_sdhci_tap_desc *desc,
-			 u8 tap, bool enable, u32 reg)
-{
-	reg &= ~(desc->enable_mask | desc->tap_mask);
-	if (enable) {
-		reg |= tap << __ffs(desc->tap_mask);
-		reg |= desc->enable_value << __ffs(desc->enable_mask);
-	}
-
-	return reg;
-}
-
-static void
-aspeed_sdc_set_phase_taps(struct aspeed_sdc *sdc,
-			  const struct aspeed_sdhci_phase_desc *desc,
-			  const struct aspeed_sdhci_tap_param *taps)
-{
-	u32 reg;
-
-	spin_lock(&sdc->lock);
-	reg = readl(sdc->regs + ASPEED_SDC_PHASE);
-
-	reg = aspeed_sdc_set_phase_tap(&desc->in, taps->in, taps->valid, reg);
-	reg = aspeed_sdc_set_phase_tap(&desc->out, taps->out, taps->valid, reg);
-
-	writel(reg, sdc->regs + ASPEED_SDC_PHASE);
-	spin_unlock(&sdc->lock);
-}
-
-#define PICOSECONDS_PER_SECOND		1000000000000ULL
-#define ASPEED_SDHCI_NR_TAPS		15
-/* Measured value with *handwave* environmentals and static loading */
-#define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
-static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
-				     int phase_deg)
-{
-	u64 phase_period_ps;
-	u64 prop_delay_ps;
-	u64 clk_period_ps;
-	unsigned int tap;
-	u8 inverted;
-
-	phase_deg %= 360;
-
-	if (phase_deg >= 180) {
-		inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
-		phase_deg -= 180;
-		dev_dbg(dev,
-			"Inverting clock to reduce phase correction from %d to %d degrees\n",
-			phase_deg + 180, phase_deg);
-	} else {
-		inverted = 0;
-	}
-
-	prop_delay_ps = ASPEED_SDHCI_MAX_TAP_DELAY_PS / ASPEED_SDHCI_NR_TAPS;
-	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
-	phase_period_ps = div_u64((u64)phase_deg * clk_period_ps, 360ULL);
-
-	tap = div_u64(phase_period_ps, prop_delay_ps);
-	if (tap > ASPEED_SDHCI_NR_TAPS) {
-		dev_dbg(dev,
-			 "Requested out of range phase tap %d for %d degrees of phase compensation at %luHz, clamping to tap %d\n",
-			 tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
-		tap = ASPEED_SDHCI_NR_TAPS;
-	}
-
-	return inverted | tap;
-}
-
-static void
-aspeed_sdhci_phases_to_taps(struct device *dev, unsigned long rate,
-			    const struct mmc_clk_phase *phases,
-			    struct aspeed_sdhci_tap_param *taps)
-{
-	taps->valid = phases->valid;
-
-	if (!phases->valid)
-		return;
-
-	taps->in = aspeed_sdhci_phase_to_tap(dev, rate, phases->in_deg);
-	taps->out = aspeed_sdhci_phase_to_tap(dev, rate, phases->out_deg);
-}
-
-static void
-aspeed_sdhci_configure_phase(struct sdhci_host *host, unsigned long rate)
-{
-	struct aspeed_sdhci_tap_param _taps = {0}, *taps = &_taps;
-	struct mmc_clk_phase *params;
-	struct aspeed_sdhci *sdhci;
-	struct device *dev;
-
-	dev = mmc_dev(host->mmc);
-	sdhci = sdhci_pltfm_priv(sdhci_priv(host));
-
-	if (!sdhci->phase_desc)
-		return;
-
-	params = &sdhci->phase_map.phase[host->timing];
-	aspeed_sdhci_phases_to_taps(dev, rate, params, taps);
-	aspeed_sdc_set_phase_taps(sdhci->parent, sdhci->phase_desc, taps);
-	dev_dbg(dev,
-		"Using taps [%d, %d] for [%d, %d] degrees of phase correction at %luHz (%d)\n",
-		taps->in & ASPEED_SDHCI_NR_TAPS,
-		taps->out & ASPEED_SDHCI_NR_TAPS,
-		params->in_deg, params->out_deg, rate, host->timing);
-}
-
 static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host;
@@ -287,8 +159,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	clk = div << SDHCI_DIVIDER_SHIFT;
 
-	aspeed_sdhci_configure_phase(host, bus);
-
 	sdhci_enable_clk(host, clk);
 }
 
@@ -550,14 +420,6 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	else if (slot >= 2)
 		return -EINVAL;
 
-	if (slot < dev->pdata->nr_phase_descs) {
-		dev->phase_desc = &dev->pdata->phase_desc[slot];
-	} else {
-		dev_info(&pdev->dev,
-			 "Phase control not supported for slot %d\n", slot);
-		dev->phase_desc = NULL;
-	}
-
 	dev->width_mask = !slot ? ASPEED_SDC_S0_MMC8 : ASPEED_SDC_S1_MMC8;
 
 	dev_info(&pdev->dev, "Configured for slot %d\n", slot);
@@ -589,9 +451,6 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_sdhci_add;
 
-	if (dev->phase_desc)
-		mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
-
 	ret = sdhci_add_host(host);
 	if (ret)
 		goto err_sdhci_add;
@@ -624,39 +483,8 @@ static const struct aspeed_sdhci_pdata ast2400_sdhci_pdata = {
 	.clk_div_start = 2,
 };
 
-static const struct aspeed_sdhci_phase_desc ast2600_sdhci_phase[] = {
-	/* SDHCI/Slot 0 */
-	[0] = {
-		.in = {
-			.tap_mask = ASPEED_SDC_S0_PHASE_IN,
-			.enable_mask = ASPEED_SDC_S0_PHASE_IN_EN,
-			.enable_value = 1,
-		},
-		.out = {
-			.tap_mask = ASPEED_SDC_S0_PHASE_OUT,
-			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
-			.enable_value = 3,
-		},
-	},
-	/* SDHCI/Slot 1 */
-	[1] = {
-		.in = {
-			.tap_mask = ASPEED_SDC_S1_PHASE_IN,
-			.enable_mask = ASPEED_SDC_S1_PHASE_IN_EN,
-			.enable_value = 1,
-		},
-		.out = {
-			.tap_mask = ASPEED_SDC_S1_PHASE_OUT,
-			.enable_mask = ASPEED_SDC_S1_PHASE_OUT_EN,
-			.enable_value = 3,
-		},
-	},
-};
-
 static const struct aspeed_sdhci_pdata ast2600_sdhci_pdata = {
 	.clk_div_start = 1,
-	.phase_desc = ast2600_sdhci_phase,
-	.nr_phase_descs = ARRAY_SIZE(ast2600_sdhci_phase),
 };
 
 static const struct of_device_id aspeed_sdhci_of_match[] = {
-- 
2.34.1


