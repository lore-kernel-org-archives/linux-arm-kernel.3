Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22656C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 04:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WadW5Q5MaJQ9UA0d2WImQMezQ1r1N9kma4ilsq3MF3M=; b=odvSPdu8fI+MGpX0+1bd15Np6J
	9sDTpHalPElGsqoOa2TTSb+9OkbBCELnyp9H0hoaPZhDK3d7RfWQnwKKxvA/fT41QGI3rnoPLuP0p
	gvBgC6/jXLJ5/2D0Tu4stzxcdG30kgGBcWQJ/3kE2ZasHV67JqUMHssPsFMfZ3nTT6VPqD+t5ePbD
	JSk5HVOHIkmZzN4DPputpR5jrJI7vDO9HbRhtIjeTUPQ5KBYK5TxNdP0mU2LSA89weuThwCYEM9y/
	IXEvhCzF3L9MWAN0pQF2WwOunQobA27K/fuCJi0T72UzocwGn3ntd6ElW5kkrXd14WQzx8VZoNC2E
	/7D/NZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeaC-00000002CUI-0ekN;
	Sun, 15 Jun 2025 04:03:00 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQeVf-00000002BsG-21Bp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 03:58:20 +0000
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
Subject: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset can't be cleared issue.
Date: Sun, 15 Jun 2025 11:57:56 +0800
Message-ID: <20250615035803.3752235-2-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_205819_519080_275C75AC 
X-CRM114-Status: GOOD (  12.84  )
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

Replace sdhci software reset by scu reset from top.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 55 +++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d6de010551b9..01bc574272eb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include "sdhci-pltfm.h"
@@ -39,6 +40,7 @@
 struct aspeed_sdc {
 	struct clk *clk;
 	struct resource *res;
+	struct reset_control *rst;
 
 	spinlock_t lock;
 	void __iomem *regs;
@@ -328,13 +330,58 @@ static u32 aspeed_sdhci_readl(struct sdhci_host *host, int reg)
 	return val;
 }
 
+static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
+{
+	struct sdhci_pltfm_host *pltfm_priv;
+	struct aspeed_sdhci *aspeed_sdhci;
+	struct aspeed_sdc *aspeed_sdc;
+	u32 save_array[7];
+	u32 reg_array[] = {SDHCI_DMA_ADDRESS,
+			SDHCI_BLOCK_SIZE,
+			SDHCI_ARGUMENT,
+			SDHCI_HOST_CONTROL,
+			SDHCI_CLOCK_CONTROL,
+			SDHCI_INT_ENABLE,
+			SDHCI_SIGNAL_ENABLE};
+	int i;
+	u16 tran_mode;
+	u32 mmc8_mode;
+
+	pltfm_priv = sdhci_priv(host);
+	aspeed_sdhci = sdhci_pltfm_priv(pltfm_priv);
+	aspeed_sdc = aspeed_sdhci->parent;
+
+	if (!IS_ERR(aspeed_sdc->rst)) {
+		for (i = 0; i < ARRAY_SIZE(reg_array); i++)
+			save_array[i] = sdhci_readl(host, reg_array[i]);
+
+		tran_mode = sdhci_readw(host, SDHCI_TRANSFER_MODE);
+		mmc8_mode = readl(aspeed_sdc->regs);
+
+		reset_control_assert(aspeed_sdc->rst);
+		mdelay(1);
+		reset_control_deassert(aspeed_sdc->rst);
+		mdelay(1);
+
+		for (i = 0; i < ARRAY_SIZE(reg_array); i++)
+			sdhci_writel(host, save_array[i], reg_array[i]);
+
+		sdhci_writew(host, tran_mode, SDHCI_TRANSFER_MODE);
+		writel(mmc8_mode, aspeed_sdc->regs);
+
+		aspeed_sdhci_set_clock(host, host->clock);
+	}
+
+	sdhci_reset(host, mask);
+}
+
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.read_l = aspeed_sdhci_readl,
 	.set_clock = aspeed_sdhci_set_clock,
 	.get_max_clock = aspeed_sdhci_get_max_clock,
 	.set_bus_width = aspeed_sdhci_set_bus_width,
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
-	.reset = sdhci_reset,
+	.reset = aspeed_sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
 };
 
@@ -535,6 +582,12 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sdc->lock);
 
+	sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
+	if (!IS_ERR(sdc->rst)) {
+		reset_control_assert(sdc->rst);
+		reset_control_deassert(sdc->rst);
+	}
+
 	sdc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->clk))
 		return PTR_ERR(sdc->clk);
-- 
2.34.1


