Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE651093179
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAXrdupkuSVERovQ8wGJ213SL8rS7SkIUkd7HGZC1I8=; b=vHmpFzEGsdbxZOlaj7cKM6D6gA
	RpKijzsIEHm2vN29Q6reuh8aBwxCXLY+gLQzHsIJ6gDnL7YmvlH3RGSn1c6Cg6E+X0jhvkjbNTORP
	z/b+TTdL1zo+ejmVNZX35z0YTdyGHR4wTQTN02c5mlXq0Xt6PzXM0CX1ql2ihUr5+VTMMKXGZCWQO
	8YHApEGpNuDBBnLheQK8En4K8/qiJuSdb5ZonOvwsf5+d7uwiOfuWjTaaXjZ/Tsc5WbK7+djFpkBv
	sOWxYsVMp4OveOcDU1SwkQ2HM6rOamrE63cZJMiAvSdqBgqYTn4pwvK4oyIYjj5I8jnWcrvgLTEWB
	2LIQHNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stt-0000000C7mA-02EJ;
	Fri, 20 Mar 2026 06:00:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stl-0000000C7gp-3JJo;
	Fri, 20 Mar 2026 05:59:54 +0000
X-UUID: 00c35ada242211f19e7563141e833ce8-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yAXrdupkuSVERovQ8wGJ213SL8rS7SkIUkd7HGZC1I8=;
	b=RzTQUluX4vVH6Jh9UbP6eUBzQJkfRDUzeAYG/dMhk7ZKfbfEaydvDOvXBMOd8FQQaOTHwd6vIH5S8S7qCzwqojSyRaiFFYOgGjynj+AHz6YB6UcybZa7/3SZ7Wn5INg45bjSoxE0i82ssjcqLFI4GwbLZ3+eyJ1l9UDpH0vwG2g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9fed5b6d-6ae9-4c84-a122-c768650c8416,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0205eb16-aa6b-4b2e-be76-373ef1a42b04,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 00c35ada242211f19e7563141e833ce8-20260319
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 580872478; Thu, 19 Mar 2026 22:59:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 13:59:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 13:59:45 +0800
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
Subject: [PATCH v8 2/9] media: mediatek: decoder: Add a new platform data member
Date: Fri, 20 Mar 2026 13:59:33 +0800
Message-ID: <20260320055940.15961-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260320055940.15961-1-kyrie.wu@mediatek.com>
References: <20260320055940.15961-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_225953_855778_CA06810C 
X-CRM114-Status: GOOD (  20.65  )
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

Move the chip model information into the codec match data
and remove the second compatible matching code.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  39 ++-----
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  17 +--
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 104 +++++++++++++-----
 7 files changed, 96 insertions(+), 74 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..13d70acda88b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -263,7 +263,7 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 	struct device *dev = &ctx->dev->plat_dev->dev;
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", ctx->dev->chip_name);
+	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", ctx->dev->chip_model);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
index 1af075fc0194..80cb46f1cded 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
@@ -69,6 +69,11 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e7c140b26955..6ebd82ba8d23 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -331,26 +331,9 @@ static const struct v4l2_file_operations mtk_vcodec_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
+static void mtk_vcodec_dec_get_chip_model(struct mtk_vcodec_dec_dev *vdec_dev)
 {
-	struct device *dev = &vdec_dev->plat_dev->dev;
-
-	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8173;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8183;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8192;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8195;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8186;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8188;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
-		vdec_dev->chip_name = MTK_VDEC_MT8196;
-	else
-		vdec_dev->chip_name = MTK_VDEC_INVAL;
+	vdec_dev->chip_model = vdec_dev->vdec_pdata->chip_model;
 }
 
 static int mtk_vcodec_probe(struct platform_device *pdev)
@@ -368,11 +351,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dev->ctx_list);
 	dev->plat_dev = pdev;
 
-	mtk_vcodec_dec_get_chip_name(dev);
-	if (dev->chip_name == MTK_VDEC_INVAL) {
-		dev_err(&pdev->dev, "Failed to get decoder chip name");
-		return -EINVAL;
-	}
+	mtk_vcodec_dec_get_chip_model(dev);
 
 	dev->vdec_pdata = of_device_get_match_data(&pdev->dev);
 	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
@@ -389,7 +368,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
-	if (dev->chip_name == MTK_VDEC_MT8196) {
+	if (dev->chip_model == 8196) {
 		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
@@ -558,23 +537,23 @@ static const struct of_device_id mtk_vcodec_match[] = {
 	},
 	{
 		.compatible = "mediatek,mt8192-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8192_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8186-vcodec-dec",
-		.data = &mtk_vdec_single_core_pdata,
+		.data = &mtk_vdec_8186_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8195-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8195_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8188-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8188_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8196-vcodec-dec",
-		.data = &mtk_lat_sig_core_pdata,
+		.data = &mtk_vdec_8196_pdata,
 	},
 	{},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index f06dfc1a3455..7921588bf814 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -21,17 +21,6 @@
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
 #define IS_VDEC_SUPPORT_EXT(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EXT)
 
-enum mtk_vcodec_dec_chip_name {
-	MTK_VDEC_INVAL = 0,
-	MTK_VDEC_MT8173 = 8173,
-	MTK_VDEC_MT8183 = 8183,
-	MTK_VDEC_MT8186 = 8186,
-	MTK_VDEC_MT8188 = 8188,
-	MTK_VDEC_MT8192 = 8192,
-	MTK_VDEC_MT8195 = 8195,
-	MTK_VDEC_MT8196 = 8196,
-};
-
 /*
  * enum mtk_vdec_format_types - Structure used to get supported
  *		  format types according to decoder capability
@@ -108,6 +97,7 @@ struct vdec_pic_info {
  *
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
+ * @chip_model: platforms configuration values
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -129,6 +119,7 @@ struct mtk_vcodec_dec_pdata {
 
 	bool is_subdev_supported;
 	bool uses_stateless_api;
+	unsigned int chip_model;
 };
 
 /**
@@ -276,7 +267,7 @@ struct mtk_vcodec_dec_ctx {
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
  * @dbgfs: debug log related information
  *
- * @chip_name: used to distinguish platforms and select the correct codec configuration values
+ * @chip_model: used to distinguish platforms and select the correct codec configuration values
  */
 struct mtk_vcodec_dec_dev {
 	struct v4l2_device v4l2_dev;
@@ -319,7 +310,7 @@ struct mtk_vcodec_dec_dev {
 	struct mutex dec_racing_info_mutex;
 	struct mtk_vcodec_dbgfs dbgfs;
 
-	enum mtk_vcodec_dec_chip_name chip_name;
+	unsigned int chip_model;
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index e4e527fe54dc..149f1ad58152 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -76,7 +76,7 @@ static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
 {
 	u32 val, mask, addr = VDEC_XPC_CLEAN_ADDR;
 
-	if (dev->main_dev->chip_name != MTK_VDEC_MT8196)
+	if (dev->main_dev->chip_model != 8196)
 		return;
 
 	val = dev->hw_idx == MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_CORE_VAL;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..0e702d6a43ed 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -618,4 +618,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.flush_decoder = mtk_vdec_flush_decoder,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8173,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 472ece5713a5..5ecbfc169805 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -571,17 +571,17 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8192:
-	case MTK_VDEC_MT8188:
+	switch (ctx->dev->chip_model) {
+	case 8192:
+	case 8188:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
 		break;
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
 		break;
-	case MTK_VDEC_MT8183:
-	case MTK_VDEC_MT8186:
+	case 8183:
+	case 8186:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
 		break;
 	default:
@@ -593,10 +593,10 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	switch (ctx->dev->chip_model) {
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
 		break;
 	default:
@@ -608,12 +608,12 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
+	switch (ctx->dev->chip_model) {
+	case 8188:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
 		break;
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
 		break;
 	default:
@@ -625,10 +625,10 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	switch (ctx->dev->chip_model) {
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
 		break;
 	default:
@@ -640,16 +640,16 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8192:
-	case MTK_VDEC_MT8188:
+	switch (ctx->dev->chip_model) {
+	case 8192:
+	case 8188:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
 		break;
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
 		break;
-	case MTK_VDEC_MT8186:
+	case 8186:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
 		break;
 	default:
@@ -661,10 +661,10 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_name) {
-	case MTK_VDEC_MT8188:
-	case MTK_VDEC_MT8195:
-	case MTK_VDEC_MT8196:
+	switch (ctx->dev->chip_model) {
+	case 8188:
+	case 8195:
+	case 8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
 		break;
 	default:
@@ -935,6 +935,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8183,
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -955,6 +956,45 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
 
+#define MTK_STATELESS_DEC_DATA \
+	.init_vdec_params = mtk_init_vdec_params, \
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup, \
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops, \
+	.vdec_formats = mtk_video_formats, \
+	.num_formats = &num_formats, \
+	.default_out_fmt = &default_out_format, \
+	.default_cap_fmt = &default_cap_format, \
+	.uses_stateless_api = true, \
+	.worker = mtk_vdec_worker, \
+	.flush_decoder = mtk_vdec_flush_decoder, \
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp, \
+	.get_cap_buffer = vdec_get_cap_buffer, \
+	.is_subdev_supported = true
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8188,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8192,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8195,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
+	.chip_model = 8196,
+};
+
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
@@ -971,3 +1011,9 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8186,
+};
-- 
2.45.2


