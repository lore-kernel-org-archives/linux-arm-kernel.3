Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B88C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re+5s6sOgkPP794UUBeAX30NWnufkF6mDghKiC7da5w=; b=ufDDCt7mo7adJ/evIszBGGflXv
	URLtZmjLbINncURrvG0IXsQjNLkMKNwMxGxRV3zCZeLSdz+Vii8LgRCHFm+UQ77BeLeoySDWEA0gJ
	f7VTz8Q9OGeD2p1HYk51B6uLF+zLKy2lTIsX37IaGyw1YguBijLZdBedBTENvLgY1fk5sOKT2TMgm
	83tkzLpZxABnysiwa+Vi1O8lpsmk2SQhvd4JraGHboF5VGL4aC9SDgsTr+S/CDhCB3E35SCpFBllP
	hGiNrEIXqXZSp/fF3CTkFhF3tX+CaAhhAfKJvzFeAdTXTE8ZbgbXc+ls+5pAWkaOBTuZkRsV0IabV
	MwxfQzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQecU-00000002Cds-3sgh;
	Sun, 15 Jun 2025 04:05:22 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVg-00000002BsG-3XlE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:21 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:03 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:03 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/8] mmc: sdhci-of-aspeed: Add runtime tuning
Date: Sun, 15 Jun 2025 11:57:57 +0800
Message-ID: <20250615035803.3752235-3-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205820_881053_70D274C1 
X-CRM114-Status: GOOD (  14.33  )
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

Add support for runtime tuning in the Aspeed SDHCI driver.
Using the timing phase register to adjust the clock phase with mmc
tuning command to find the left and right boundary.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 01bc574272eb..5e5ae1894456 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -24,6 +24,7 @@
 #define ASPEED_SDC_PHASE		0xf4
 #define   ASPEED_SDC_S1_PHASE_IN	GENMASK(25, 21)
 #define   ASPEED_SDC_S0_PHASE_IN	GENMASK(20, 16)
+#define   ASPEED_SDC_S0_PHASE_IN_SHIFT  16
 #define   ASPEED_SDC_S1_PHASE_OUT	GENMASK(15, 11)
 #define   ASPEED_SDC_S1_PHASE_IN_EN	BIT(10)
 #define   ASPEED_SDC_S1_PHASE_OUT_EN	GENMASK(9, 8)
@@ -375,6 +376,72 @@ static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
+{
+	struct sdhci_pltfm_host *pltfm_priv;
+	struct aspeed_sdhci *sdhci;
+	struct aspeed_sdc *sdc;
+	struct device *dev;
+
+	u32 val, left, right, edge;
+	u32 window, oldwindow = 0, center;
+	u32 in_phase, out_phase, enable_mask, inverted = 0;
+
+	dev = mmc_dev(host->mmc);
+	pltfm_priv = sdhci_priv(host);
+	sdhci = sdhci_pltfm_priv(pltfm_priv);
+	sdc = sdhci->parent;
+
+	out_phase = readl(sdc->regs + ASPEED_SDC_PHASE) & ASPEED_SDC_S0_PHASE_OUT;
+
+	enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN | ASPEED_SDC_S0_PHASE_IN_EN;
+
+	/*
+	 * There are two window upon clock rising and falling edge.
+	 * Iterate each tap delay to find the valid window and choose the
+	 * bigger one, set the tap delay at the middle of window.
+	 */
+	for (edge = 0; edge < 2; edge++) {
+		if (edge == 1)
+			inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
+
+		val = (out_phase | enable_mask | (inverted << ASPEED_SDC_S0_PHASE_IN_SHIFT));
+
+		/* find the left boundary */
+		for (left = 0; left < ASPEED_SDHCI_NR_TAPS + 1; left++) {
+			in_phase = val | (left << ASPEED_SDC_S0_PHASE_IN_SHIFT);
+			writel(in_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (!mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		/* find the right boundary */
+		for (right = left + 1; right < ASPEED_SDHCI_NR_TAPS + 1; right++) {
+			in_phase = val | (right << ASPEED_SDC_S0_PHASE_IN_SHIFT);
+			writel(in_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		window = right - left;
+		dev_info(dev, "tuning window = %d\n", window);
+
+		if (window > oldwindow) {
+			oldwindow = window;
+			center = (((right - 1) + left) / 2) | inverted;
+		}
+	}
+
+	val = (out_phase | enable_mask | (center << ASPEED_SDC_S0_PHASE_IN_SHIFT));
+	writel(val, sdc->regs + ASPEED_SDC_PHASE);
+
+	dev_info(dev, "tuning result=%x\n", val);
+
+	return mmc_send_tuning(host->mmc, opcode, NULL);
+}
+
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.read_l = aspeed_sdhci_readl,
 	.set_clock = aspeed_sdhci_set_clock,
@@ -383,6 +450,7 @@ static const struct sdhci_ops aspeed_sdhci_ops = {
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
 	.reset = aspeed_sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
+	.platform_execute_tuning = aspeed_sdhci_execute_tuning,
 };
 
 static const struct sdhci_pltfm_data aspeed_sdhci_pdata = {
-- 
2.34.1


