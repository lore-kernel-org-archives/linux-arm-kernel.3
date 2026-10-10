Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B64CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMFXhSxAkMzYVCgsIsAAm4BW++S/HbIdY80ETULmyZw=; b=vOaOEibivKWAKEaccKYcwuXp2r
	PLzdPQhMOCMSOjZ1Zc4Zi/CA7P5VoOOIO4kRW8AlkiuxD1GJYlX4xayWWxP7+M5j2TjVVRGRIUEfV
	dwSDamMosK80e0bT8kY8vuuHv+W+zpBANsYxsPAUacDIxn/GftLdWLoKZOWw9HrVsOLHjYblIZVh6
	5y8BT0LKXNKWsfX4fABmYsi0CjTDUyUcjkxwbWoJcow7UMZx94pjqPR/+Ma1bFRFmDzOtSwwAomg/
	2meMvtS4bZvFGHpv/Gsr4OfNT9DIhdR5NH7WNhqCt50kaFB5tmzicIpKVJJeNO2e+t+ohvKb0xi8P
	WRAFQQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTJV-00000007kLI-2O3V;
	Sat, 10 Oct 2026 09:24:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTJK-00000007kBx-3Uvr;
	Sat, 10 Oct 2026 09:24:11 +0000
X-UUID: 57dbf43ec48c11f1acbe4559397dec65-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VMFXhSxAkMzYVCgsIsAAm4BW++S/HbIdY80ETULmyZw=;
	b=ncbQCaMOSBilJW8FpaBWZSj+mv222Un4+PrZfyGWFMNQRw2G/CDaD/AaFM8/KvPHuv5Pe3oFuEKyUYG6fvNNCNghrviTA6FIhs/LPOa9blAke6G1MPtMSTmkAA/WXDZ54qAy/kdK+WPTQ6a0P2l7jFxl41U4WOkVYe3NW8SKQmg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:14a550bf-6f7e-4a73-97cf-4d3c2833e101,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:94f82e95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57dbf43ec48c11f1acbe4559397dec65-20261010
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 106936429; Sat, 10 Oct 2026 02:24:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 17:24:04 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 17:24:03 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v11 03/10] media: mediatek: decoder: Move firmware selection to platform data
Date: Sat, 10 Oct 2026 17:23:51 +0800
Message-ID: <645b2108ecd3b1a83cab9d891d2b5a2fbcfb731e.1791623422.git.kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791623422.git.kyrie.wu@mediatek.com>
References: <cover.1791623422.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_022410_882218_908B2C63 
X-CRM114-Status: GOOD (  18.25  )
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

The decoder currently selects its firmware backend by testing optional
mediatek,vpu, mediatek,scp, and mediatek,vcp properties in the device
tree.  The firmware backend is, however, fixed by the decoder compatible.

Add the firmware type and initialization callback to the decoder platform
data, initialize them for each supported SoC, and use the callback from
the platform data at probe time.  This matches the existing encoder
platform-data design and removes the DT-property dependency.

Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")
Fixes: c7244811b1c9 ("media: mtk-vcodec: add SCP firmware ops")
Fixes: c3da5e939cbc ("media: mediatek: vcodec: support vcp architecture")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       | 21 ++-----------------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  7 +++++--
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 12 +++++++++++
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 8642947a..62e7bbbe 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -340,8 +340,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dec_dev *dev;
 	struct video_device *vfd_dec;
-	phandle rproc_phandle;
-	enum mtk_vcodec_fw_type fw_type;
 	int i, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -353,22 +351,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	mtk_vcodec_dec_get_chip_model(dev);
-	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
-				  &rproc_phandle)) {
-		fw_type = VPU;
-		dev->fw_init = mtk_vcodec_fw_vpu_init;
-	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
-					 &rproc_phandle)) {
-		fw_type = SCP;
-		dev->fw_init = mtk_vcodec_fw_scp_init;
-	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
-					 &rproc_phandle)) {
-		fw_type = VCP;
-		dev->fw_init = mtk_vcodec_fw_vcp_init;
-	} else {
-		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
-		return -ENODEV;
-	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 	if (dev->chip_model == 8196) {
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
@@ -378,7 +360,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER, dev->fw_init);
+	dev->fw_handler = mtk_vcodec_fw_select(dev, DECODER,
+					      dev->vdec_pdata->fw_init);
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 153c617d..d7ed7bfe 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -97,6 +97,8 @@ struct vdec_pic_info {
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
+ * @fw_type: firmware type (VPU, SCP, or VCP)
+ * @fw_init: firmware-specific initialization callback
  * @chip_model: platforms configuration values
  */
 struct mtk_vcodec_dec_pdata {
@@ -119,6 +121,9 @@ struct mtk_vcodec_dec_pdata {
 
 	bool is_subdev_supported;
 	bool uses_stateless_api;
+	enum mtk_vcodec_fw_type fw_type;
+	struct mtk_vcodec_fw *(*fw_init)(void *priv,
+					 enum mtk_vcodec_fw_use fw_use);
 	unsigned int chip_model;
 };
 
@@ -243,7 +248,6 @@ struct mtk_vcodec_dec_ctx {
  * @vdecsys_regmap: VDEC_SYS register space passed through syscon
  *
  * @fw_handler: used to communicate with the firmware.
- * @fw_init: firmware-specific init callback selected at probe time
  * @id_counter: used to identify current opened instance
  *
  * @dec_mutex: decoder hardware lock
@@ -285,7 +289,6 @@ struct mtk_vcodec_dec_dev {
 	struct regmap *vdecsys_regmap;
 
 	struct mtk_vcodec_fw *fw_handler;
-	struct mtk_vcodec_fw *(*fw_init)(void *priv, enum mtk_vcodec_fw_use fw_use);
 	u64 id_counter;
 
 	/* decoder hardware mutex lock */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 0e702d6a..e7ae90e8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -618,5 +618,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.fw_type = VPU,
+	.fw_init = mtk_vcodec_fw_vpu_init,
 	.chip_model = 8173,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 5ecbfc16..2a03395a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -935,6 +935,8 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8183,
 };
 
@@ -974,24 +976,32 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8188,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8192,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8195,
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.fw_type = VCP,
+	.fw_init = mtk_vcodec_fw_vcp_init,
 	.chip_model = 8196,
 };
 
@@ -1015,5 +1025,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.fw_type = SCP,
+	.fw_init = mtk_vcodec_fw_scp_init,
 	.chip_model = 8186,
 };
-- 
2.51.0.windows.2


