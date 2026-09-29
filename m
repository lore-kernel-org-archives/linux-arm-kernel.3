Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FFCC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFc2KSUFkKfmphddM59adQNexTXZELrN5Dok5gsfyrE=; b=IqhXWvO/Lt6TJgVzUx/McYAQTI
	zxYqr7i1Y4fWTVJmqQsSfvrOKsa+CvfUcz68EHbcdPMS9m6taPlzS3OcTlC6oinAgMfye6UXnHaFk
	NxfLLRHhk4jbsa+7nTJq16RXT3Qgf1JLmD2zHbG+p5d6zi59P0XAqsPLm5N0u5styo6Hy5b40aFiF
	4DmNYaTgO7Ysra4roNgroEtNaCyMaWkCe6cm+Hf8Qperniha0nynHWb7VxC1xWn00zfMEpHmaYM37
	uAj5O9gfHfc+KM74GhDxHLjwN+wuGzSy8eUx5rLuebOHGH6HNFx5SYIfrY6KQO5YYwaA1fj1nC9bL
	Dw6Tdkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRHW-00000002Rm8-0tzr;
	Tue, 29 Sep 2026 06:25:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRHK-00000002Rhd-3wxJ;
	Tue, 29 Sep 2026 06:25:28 +0000
X-UUID: 8c9c8b78bbce11f1acbe4559397dec65-20260928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QFc2KSUFkKfmphddM59adQNexTXZELrN5Dok5gsfyrE=;
	b=sv98azqCqgTtv2KffKwlQVQrS0/j1zkNyxTDSRBggjbhm7gtGsKBungqpegQPForoNy55vu+dIxIKVq1GrdnpyEcpuwHrpew9M0Ifa6jrcVCFHrz8x1chXf+GX8oVSgkNQLDvveei4y1kpXJ3WcoB36Rp/nJYqcP4oeyS5wCGyk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:462e5aee-d2e7-4305-a20e-5accee7c1e9a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:1a71a858-f207-4360-abb2-8a360f715574,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8c9c8b78bbce11f1acbe4559397dec65-20260928
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <tim.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1968054659; Mon, 28 Sep 2026 23:25:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 29 Sep 2026 14:25:19 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 29 Sep 2026 14:25:19 +0800
From: Tim Kuo <Tim.Kuo@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>, Tim Kuo <Tim.Kuo@mediatek.com>
Subject: [PATCH v2 2/2] spi: mt65xx: support wider tick delay field on IPM v59
Date: Tue, 29 Sep 2026 14:25:16 +0800
Message-ID: <20260929062516.416368-2-Tim.Kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260929062516.416368-1-Tim.Kuo@mediatek.com>
References: <20260929062516.416368-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_232527_686411_6C06EAA2 
X-CRM114-Status: GOOD (  17.68  )
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

The IPM v59 SPI IP widens the tick delay field in SPI_CMD_REG from
3 bits (bits 24:22) to 7 bits (bits 28:22), so the field width can no
longer be hardcoded in mtk_spi_hw_init().

Add a tick_dly_mask member to struct mtk_spi_compatible and use
field_prep() with the per-SoC mask instead of the open-coded
mask-and-shift, then add a mtk_ipm_v59_compat entry carrying the wider
mask along with a "mediatek,spi-ipm-v59" compatible. Any further changes
related to IPM v59 can be modified based on this compatible.

Existing IPM designs keep GENMASK(24, 22) and are functionally
unchanged.

Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
---
v2: remove unused tickdly offset deadcode

 drivers/spi/spi-mt65xx.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index b845a599f7c6..e9ec58ce1e1f 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -4,6 +4,7 @@
  * Author: Leilk Liu <leilk.liu@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -78,9 +79,9 @@
 #define SPI_CMD_PAUSE_IE		BIT(17)
 #define SPI_CMD_IPM_NONIDLE_MODE	BIT(19)
 #define SPI_CMD_IPM_SPIM_LOOP		BIT(21)
-#define SPI_CMD_IPM_GET_TICKDLY_OFFSET	22
 
 #define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
+#define SPI_CMD_IPM_V59_GET_TICKDLY_MASK	GENMASK(28, 22)
 
 #define PIN_MODE_CFG(x)	((x) / 2)
 
@@ -120,6 +121,7 @@
  * @dma_ext:		DMA address extension supported
  * @no_need_unprepare:	Don't unprepare the SPI clk during runtime
  * @ipm_design:		Adjust/extend registers to support IPM design IP features
+ * @tick_dly_mask:	Tick delay field of SPI_CMD_REG, IPM designs only
  */
 struct mtk_spi_compatible {
 	bool need_pad_sel;
@@ -128,6 +130,7 @@ struct mtk_spi_compatible {
 	bool dma_ext;
 	bool no_need_unprepare;
 	bool ipm_design;
+	u32 tick_dly_mask;
 };
 
 /**
@@ -187,6 +190,15 @@ static const struct mtk_spi_compatible mtk_ipm_compat = {
 	.enhance_timing = true,
 	.dma_ext = true,
 	.ipm_design = true,
+	.tick_dly_mask = SPI_CMD_IPM_GET_TICKDLY_MASK,
+};
+
+/* Every SoC with IPM v59 or newer shares this */
+static const struct mtk_spi_compatible mtk_ipm_v59_compat = {
+	.enhance_timing = true,
+	.dma_ext = true,
+	.ipm_design = true,
+	.tick_dly_mask = SPI_CMD_IPM_V59_GET_TICKDLY_MASK,
 };
 
 static const struct mtk_spi_compatible mt6765_compat = {
@@ -226,6 +238,7 @@ static const struct mtk_spi_compatible mt6991_compat = {
 	.enhance_timing = true,
 	.dma_ext = true,
 	.ipm_design = true,
+	.tick_dly_mask = SPI_CMD_IPM_GET_TICKDLY_MASK,
 };
 
 /*
@@ -241,6 +254,9 @@ static const struct of_device_id mtk_spi_of_match[] = {
 	{ .compatible = "mediatek,spi-ipm",
 		.data = (void *)&mtk_ipm_compat,
 	},
+	{ .compatible = "mediatek,spi-ipm-v59",
+		.data = (void *)&mtk_ipm_v59_compat,
+	},
 	{ .compatible = "mediatek,mt2701-spi",
 		.data = (void *)&mtk_common_compat,
 	},
@@ -366,7 +382,7 @@ static int mtk_spi_hw_init(struct spi_controller *host,
 			   struct spi_device *spi)
 {
 	u16 cpha, cpol;
-	u32 reg_val;
+	u32 reg_val, mask;
 	struct mtk_chip_config *chip_config = spi->controller_data;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 
@@ -443,10 +459,10 @@ static int mtk_spi_hw_init(struct spi_controller *host,
 	/* tick delay */
 	if (mdata->dev_comp->enhance_timing) {
 		if (mdata->dev_comp->ipm_design) {
+			mask = mdata->dev_comp->tick_dly_mask;
 			reg_val = readl(mdata->base + SPI_CMD_REG);
-			reg_val &= ~SPI_CMD_IPM_GET_TICKDLY_MASK;
-			reg_val |= ((chip_config->tick_delay & 0x7)
-				    << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
+			reg_val &= ~mask;
+			reg_val |= field_prep(mask, chip_config->tick_delay);
 			writel(reg_val, mdata->base + SPI_CMD_REG);
 		} else {
 			reg_val = readl(mdata->base + SPI_CFG1_REG);
-- 
2.45.2


