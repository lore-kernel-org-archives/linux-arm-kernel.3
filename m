Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA09C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGtjHx6cqk/IoEviwQ3UR0x/lfXLIpLJhQtpRCQRULs=; b=R3IDyRWaJo6LidMpeALvtLF1io
	/0AlFc7YjBFV0vuvCm97oqp+KctJLr0z7dXWrl9t0nHl4AlVH1clvQXMT0Uh70hWbqVIkUmfi5Zv8
	AdUUdCRR0MRv8oYwVh/jEsSH9ACbwvqAHVbcOj1h84qoE/98xVLw64pnsBPLnjPFT/oDr+yM9D/yw
	7Ho6aMtOmPz+GWbXzZIjthwRCG1J70crMsPcBvLyucOAwxzaDmOkHfR9K5Mxj6W2Wyx2ouM28CrFw
	6tlrEFTJB47ffh6FL/J5/pu6UPd4ZBCv8SaQx2zLMmUTg4cVNGl8M2+vG1jhEk9ActX44HZdQvTlr
	hPTwr4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tntne-00000009rfT-3KBC;
	Fri, 28 Feb 2025 06:24:42 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tntlx-00000009rSS-3dFs;
	Fri, 28 Feb 2025 06:23:07 +0000
X-UUID: 70112080f59c11ef83f2a1c9db70dae0-20250227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EGtjHx6cqk/IoEviwQ3UR0x/lfXLIpLJhQtpRCQRULs=;
	b=gl9N/KeBxaUb9OkchgOL2MQhNfo0m4u8fyFi5FV4zkxLgbKZue3HT4e/zWEmdevmbw44QqdK+ux4OCOZam6Hzg14Jgib8MuAEJPkS5TJkkl9yhFTiIFDvofHyKMOgs1HL2/H953aZqM7W337Q5ymC+eKBehewhiJGxhQeLnMuQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:8df5e115-c9da-4693-a930-c0cea4adc3fb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:c5f7adb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70112080f59c11ef83f2a1c9db70dae0-20250227
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <leilk.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 277971277; Thu, 27 Feb 2025 23:22:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 28 Feb 2025 14:22:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 28 Feb 2025 14:22:48 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
	<leilk.liu@mediatek.com>
Subject: [PATCH v1] spi: mt65xx: add PM QoS support
Date: Fri, 28 Feb 2025 14:22:03 +0800
Message-ID: <20250228062246.24186-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_222257_911613_A196ACBF 
X-CRM114-Status: GOOD (  14.97  )
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

Enable Quality of Service(QoS) support to speed up interrupt service
routine handle. Sometimes, a gic interrupt will be generated after
SPI transmission, but at this time the CPU is in an idle state and the
processing handler will be ver slow. It takes time to exit the idle state
and then become active. This will cause the SPI handler to execute slowly
and cause SPI transfer timeouts.

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 197bf2dbe5de..2ab65f858a21 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -20,6 +20,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/dma-mapping.h>
+#include <linux/pm_qos.h>
 
 #define SPI_CFG0_REG			0x0000
 #define SPI_CFG1_REG			0x0004
@@ -166,6 +167,7 @@ struct mtk_spi {
 	struct scatterlist *tx_sgl, *rx_sgl;
 	u32 tx_sgl_len, rx_sgl_len;
 	const struct mtk_spi_compatible *dev_comp;
+	struct pm_qos_request qos_request;
 	u32 spi_clk_hz;
 	struct completion spimem_done;
 	bool use_spimem;
@@ -356,6 +358,7 @@ static int mtk_spi_hw_init(struct spi_controller *host,
 	struct mtk_chip_config *chip_config = spi->controller_data;
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 
+	cpu_latency_qos_update_request(&mdata->qos_request, 500);
 	cpha = spi->mode & SPI_CPHA ? 1 : 0;
 	cpol = spi->mode & SPI_CPOL ? 1 : 0;
 
@@ -459,6 +462,15 @@ static int mtk_spi_prepare_message(struct spi_controller *host,
 	return mtk_spi_hw_init(host, msg->spi);
 }
 
+static int mtk_spi_unprepare_message(struct spi_controller *host,
+				     struct spi_message *message)
+{
+	struct mtk_spi *mdata = spi_controller_get_devdata(host);
+
+	cpu_latency_qos_update_request(&mdata->qos_request, PM_QOS_DEFAULT_VALUE);
+	return 0;
+}
+
 static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
 {
 	u32 reg_val;
@@ -1143,6 +1155,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	host->set_cs = mtk_spi_set_cs;
 	host->prepare_message = mtk_spi_prepare_message;
+	host->unprepare_message = mtk_spi_unprepare_message;
 	host->transfer_one = mtk_spi_transfer_one;
 	host->can_dma = mtk_spi_can_dma;
 	host->setup = mtk_spi_setup;
@@ -1249,6 +1262,8 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
+	cpu_latency_qos_add_request(&mdata->qos_request, PM_QOS_DEFAULT_VALUE);
+
 	if (mdata->dev_comp->need_pad_sel) {
 		if (mdata->pad_num != host->num_chipselect)
 			return dev_err_probe(dev, -EINVAL,
@@ -1292,6 +1307,7 @@ static void mtk_spi_remove(struct platform_device *pdev)
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 	int ret;
 
+	cpu_latency_qos_remove_request(&mdata->qos_request);
 	if (mdata->use_spimem && !completion_done(&mdata->spimem_done))
 		complete(&mdata->spimem_done);
 
-- 
2.46.0


