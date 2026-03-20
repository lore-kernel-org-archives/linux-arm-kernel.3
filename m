Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FC0109317D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWxKExStOAZc57km/2fM7Wk/MBk+KqJmr+NV+wNKQG0=; b=M/pxpeDs5hFD8PxEH1jXn8AVUv
	LvRB7y+BP9vJEL1kkTBQyUxQ2NTGbNJ/8rqHwQo1RX3keTntkLxNnqE2OBrq+4PYxIV8Mw/Fs4orR
	PAI/WvCcslwQSHsKNlBQdpl84bOFKMhdjQL0Re2lKuqByS+38prM3SA1ihYgAselu8m3Q3+V+djk9
	DRN8NRpz8WbantYrrDrCBGOL8UmxVFZ0jtSsK5GtAScDBsiUZAeqnFfBlmkoiYQppvYIqx5aNBQNu
	2xJYlUndcSvpErg51f2WKj6ni5M+g5r/U1dXOprQY5WZgXRVDR4kziMO0CUph4JgDtqJl/pNGuwT9
	ldflkkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stu-0000000C7o6-14D4;
	Fri, 20 Mar 2026 06:00:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stm-0000000C7hs-3Ahx;
	Fri, 20 Mar 2026 05:59:55 +0000
X-UUID: 020ae296242211f19e7563141e833ce8-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zWxKExStOAZc57km/2fM7Wk/MBk+KqJmr+NV+wNKQG0=;
	b=WW0S9P735B2pvWTROBNwBg0WWBEGfQFQe1UOCTTPUznhfu5rcX/VNQFCwyz7BwJz1huATKDaWRf5f2a0HsKVs2RKXQizpgn/w6K04NDp6ZAXlUI+zbG+J2M9ExmdMXALQTFxVVv8crHxRkcN2z+dM85csxfGjCZ9Z1HODvlP+Og=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:13621890-a340-431f-8b55-30829b46dd8a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:2505eb16-aa6b-4b2e-be76-373ef1a42b04,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 020ae296242211f19e7563141e833ce8-20260319
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2089985348; Thu, 19 Mar 2026 22:59:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 13:59:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 13:59:47 +0800
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
Subject: [PATCH v8 3/9] media: mediatek: vcodec: Refactor Decoder profile & level Handling
Date: Fri, 20 Mar 2026 13:59:34 +0800
Message-ID: <20260320055940.15961-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260320055940.15961-1-kyrie.wu@mediatek.com>
References: <20260320055940.15961-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_225954_802614_FFD93642 
X-CRM114-Status: GOOD (  14.59  )
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

This commit refactors the handling of decoder parameters for H264,
H265, and VP9 codecs by introducing a new structure to standardize
supported level and profile information. By leveraging this change,
chipset-specific conditional logic in the codec configuration
functions is significantly reduced.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  16 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  12 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 165 ++++++++++--------
 3 files changed, 118 insertions(+), 75 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 7921588bf814..4ffc0eae855b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -78,6 +78,16 @@ struct vdec_pic_info {
 	unsigned int reserved;
 };
 
+/**
+ * struct mtk_vcodec_dec_params - decoder supported parameters
+ * @level: decoder supported vcodec level
+ * @profile: decoder supported vcodec profile
+ */
+struct mtk_vcodec_dec_params {
+	s64 level;
+	s64 profile;
+};
+
 /**
  * struct mtk_vcodec_dec_pdata - compatible data for each IC
  * @init_vdec_params: init vdec params
@@ -98,6 +108,9 @@ struct vdec_pic_info {
  * @is_subdev_supported: whether support parent-node architecture(subdev)
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  * @chip_model: platforms configuration values
+ * @h264_params: H264 decoder default supported params
+ * @h265_params: H265 decoder default supported params
+ * @vp9_params: VP9 decoder default supported params
  */
 struct mtk_vcodec_dec_pdata {
 	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
@@ -120,6 +133,9 @@ struct mtk_vcodec_dec_pdata {
 	bool is_subdev_supported;
 	bool uses_stateless_api;
 	unsigned int chip_model;
+	struct mtk_vcodec_dec_params h264_params;
+	struct mtk_vcodec_dec_params h265_params;
+	struct mtk_vcodec_dec_params vp9_params;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 0e702d6a43ed..64f32976d15e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_model = 8173,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 5ecbfc169805..efcd28f5f289 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -571,106 +571,49 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
 static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
-		break;
-	case 8183:
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h264_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 					   struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.level;
 }
 
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 					     struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->h265_params.profile;
 }
 
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 					  struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8192:
-	case 8188:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
-		break;
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
-		break;
-	case 8186:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.level;
 }
 
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 					    struct mtk_vcodec_dec_ctx *ctx)
 {
-	switch (ctx->dev->chip_model) {
-	case 8188:
-	case 8195:
-	case 8196:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
-		break;
-	default:
-		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
-		break;
-	}
+	struct mtk_vcodec_dec_dev *pdev = ctx->dev;
+
+	cfg->max = pdev->vdec_pdata->vp9_params.profile;
 }
 
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
@@ -936,6 +879,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_model = 8183,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 /* This platform data is used for one lat and one core architecture. */
@@ -975,24 +930,72 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8188,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8192,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8195,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_model = 8196,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
@@ -1016,4 +1019,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_model = 8186,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
-- 
2.45.2


