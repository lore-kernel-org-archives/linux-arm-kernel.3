Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8DBC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LwCVeFpA/Piyu+6TIfX5BmaS9Ohc00hSvCtLpd0ifXo=; b=XZ+xc2gfalG96bFLyiwxVQi+Bc
	lySbEdfBFeuPeDTEBHRrrL4kQKX76vyRex9MbBrm47PpAwEVzYzOclFnwwOIWkMsn8wweWQB2Felp
	21WIk+WbTEe8bFa/C3UFbnUybrUVaJlvdHOsHCVlt95DCKPRfpo4nCMWKuB3mNNf6OUHQK4DAQvbY
	FERI4xXfMzMQnomExNAdMpd4FI9lB4OkHpU6RUyTWTHOzi1L6V4wEr30MFEShHEh8V4sMCwfV73ph
	WHHA6jkP/HAX5COMF58luR+xVa0/MAP2U4mMhHQno8tCzKY5T8SZToPAjp3iqqmBc2DjVCp6E1jVu
	IB/zFHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp50N-00000000lMI-1ukY;
	Mon, 03 Mar 2025 12:34:43 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4F6-00000000cbE-3e9L;
	Mon, 03 Mar 2025 11:45:55 +0000
X-UUID: 0b2fc5b4f82511ef83f2a1c9db70dae0-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LwCVeFpA/Piyu+6TIfX5BmaS9Ohc00hSvCtLpd0ifXo=;
	b=JjNJeRbkEoeHHvxxflOd+eHgf9j8pfqdyqCSnh92L1ZF3nNgYuQ2/Hl8d7D5LIXib86UuZpFMcyz1FjyHf6HsyLWldKVvxInxZj2QVEmkZtabpMi01JFtSEkAjUOS/vZ2QgmEriRsuqUYGuPmygmIaQoJOIc19GtM5K6CexvZe8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d9d4737d-fbf1-4c26-9dc0-f798ef4cf0f9,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:47c71503-a373-400e-87fc-32443f153737,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b2fc5b4f82511ef83f2a1c9db70dae0-20250303
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <cloud.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 294756186; Mon, 03 Mar 2025 04:45:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 3 Mar 2025 19:45:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 3 Mar 2025 19:45:42 +0800
From: mtk22730 <Cloud.Zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, mtk22730
	<Cloud.Zhang@mediatek.com>, Cloud Zhang <cloud.zhang@mediatek.com>
Subject: [v2] spi: spi-mtk-nor: Modify the clock architecture of nor controller
Date: Mon, 3 Mar 2025 19:45:07 +0800
Message-ID: <20250303114540.1617-1-Cloud.Zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_034552_924081_E8ACAAF9 
X-CRM114-Status: GOOD (  17.87  )
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

The clocks used by different platforms are not same. So it is
necessary to modify the clock architecture to be adaptable to more
platforms.

Signed-off-by: Cloud Zhang <cloud.zhang@mediatek.com>
---
Changes in v2:
  -Use clk_bulk_xxx related functions to enable/disable clocks.

Changes in v1:
  -Add new function mtk_nor_parse_clk() to parse nor clock parameters.
---
---
 drivers/spi/spi-mtk-nor.c | 103 ++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 49 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 85ab5ce96c4d..4863b9cb2706 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -99,6 +99,8 @@
 
 #define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
 
+#define MAX_CLOCK_CNT		6
+
 struct mtk_nor_caps {
 	u8 dma_bits;
 
@@ -116,10 +118,8 @@ struct mtk_nor {
 	void __iomem *base;
 	u8 *buffer;
 	dma_addr_t buffer_dma;
-	struct clk *spi_clk;
-	struct clk *ctlr_clk;
-	struct clk *axi_clk;
-	struct clk *axi_s_clk;
+	struct clk_bulk_data clocks[MAX_CLOCK_CNT];
+	int clock_cnt;
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
@@ -703,44 +703,68 @@ static int mtk_nor_transfer_one_message(struct spi_controller *host,
 
 static void mtk_nor_disable_clk(struct mtk_nor *sp)
 {
-	clk_disable_unprepare(sp->spi_clk);
-	clk_disable_unprepare(sp->ctlr_clk);
-	clk_disable_unprepare(sp->axi_clk);
-	clk_disable_unprepare(sp->axi_s_clk);
+	clk_bulk_disable_unprepare(sp->clock_cnt, sp->clocks);
 }
 
 static int mtk_nor_enable_clk(struct mtk_nor *sp)
 {
 	int ret;
+	int i;
 
-	ret = clk_prepare_enable(sp->spi_clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(sp->ctlr_clk);
+	ret = clk_bulk_prepare_enable(sp->clock_cnt, sp->clocks);
 	if (ret) {
-		clk_disable_unprepare(sp->spi_clk);
+		dev_err(sp->dev, "enable clk failed\n");
 		return ret;
 	}
 
-	ret = clk_prepare_enable(sp->axi_clk);
-	if (ret) {
-		clk_disable_unprepare(sp->spi_clk);
-		clk_disable_unprepare(sp->ctlr_clk);
-		return ret;
-	}
+	for (i = 0; i < sp->clock_cnt; i++) {
+		if (IS_ERR(sp->clocks[i].clk)) {
+			dev_err(sp->dev, "get %s fail\n", sp->clocks[i].id);
+			return PTR_ERR(sp->clocks[i].clk);
+		}
 
-	ret = clk_prepare_enable(sp->axi_s_clk);
-	if (ret) {
-		clk_disable_unprepare(sp->spi_clk);
-		clk_disable_unprepare(sp->ctlr_clk);
-		clk_disable_unprepare(sp->axi_clk);
-		return ret;
+		if (!strcmp(sp->clocks[i].id, "spi"))
+			sp->spi_freq = clk_get_rate(sp->clocks[i].clk);
 	}
 
 	return 0;
 }
 
+static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
+{
+	struct device_node *np = dev->of_node;
+	int ret;
+	const char *name;
+	int cnt, i;
+
+	cnt = of_property_count_strings(np, "clock-names");
+	if (!cnt || (cnt == -EINVAL)) {
+		dev_err(dev, "Unable to find clocks\n");
+		ret = -EINVAL;
+		goto out;
+	} else if (cnt < 0) {
+		dev_err(dev, "Count clock strings failed, err %d\n", cnt);
+		ret = cnt;
+		goto out;
+	}
+
+	sp->clock_cnt = cnt;
+	for (i = 0; i < cnt; i++) {
+		ret = of_property_read_string_index(np, "clock-names", i, &name);
+		if (ret) {
+			dev_err(dev, "failed to get clock string\n");
+			return ret;
+		}
+
+		sp->clocks[i].id = name;
+	}
+
+	ret = devm_clk_bulk_get(dev, sp->clock_cnt, sp->clocks);
+
+out:
+	return ret;
+}
+
 static void mtk_nor_init(struct mtk_nor *sp)
 {
 	writel(0, sp->base + MTK_NOR_REG_IRQ_EN);
@@ -813,29 +837,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	struct mtk_nor *sp;
 	struct mtk_nor_caps *caps;
 	void __iomem *base;
-	struct clk *spi_clk, *ctlr_clk, *axi_clk, *axi_s_clk;
 	int ret, irq;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	spi_clk = devm_clk_get(&pdev->dev, "spi");
-	if (IS_ERR(spi_clk))
-		return PTR_ERR(spi_clk);
-
-	ctlr_clk = devm_clk_get(&pdev->dev, "sf");
-	if (IS_ERR(ctlr_clk))
-		return PTR_ERR(ctlr_clk);
-
-	axi_clk = devm_clk_get_optional(&pdev->dev, "axi");
-	if (IS_ERR(axi_clk))
-		return PTR_ERR(axi_clk);
-
-	axi_s_clk = devm_clk_get_optional(&pdev->dev, "axi_s");
-	if (IS_ERR(axi_s_clk))
-		return PTR_ERR(axi_s_clk);
-
 	caps = (struct mtk_nor_caps *)of_device_get_match_data(&pdev->dev);
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(caps->dma_bits));
@@ -868,10 +875,6 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	sp->wbuf_en = false;
 	sp->ctlr = ctlr;
 	sp->dev = &pdev->dev;
-	sp->spi_clk = spi_clk;
-	sp->ctlr_clk = ctlr_clk;
-	sp->axi_clk = axi_clk;
-	sp->axi_s_clk = axi_s_clk;
 	sp->caps = caps;
 	sp->high_dma = caps->dma_bits > 32;
 	sp->buffer = dmam_alloc_coherent(&pdev->dev,
@@ -885,11 +888,13 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	ret = mtk_nor_enable_clk(sp);
+	ret = mtk_nor_parse_clk(sp->dev, sp);
 	if (ret < 0)
 		return ret;
 
-	sp->spi_freq = clk_get_rate(sp->spi_clk);
+	ret = mtk_nor_enable_clk(sp);
+	if (ret < 0)
+		return ret;
 
 	mtk_nor_init(sp);
 
-- 
2.46.0


