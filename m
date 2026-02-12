Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDC6EB48EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxincR19n+n/u0r8OQlSgZvvbGiDFUYQw+mjXeEvtaQ=; b=KGzUSPscZLR3AZ5PThaIqDLJeb
	HbxdcTBNt/GYmu12zvyQn23OjkJVeSrXwOoHcvx0BjIdjd/Fnj26hWwVzWJglt9WOkZB7PiHOmiFI
	YVEaDx3Rpq+WSfuLyQ5GfnhS6Wkw48Z4pYr8jcgSbirYD7ZANDZWb548A+520L32/KbKGlCTJ/i00
	igmatzmJSvl95KwJYFYHPAxdVy4SFZJtmWNob0M2H8gJVDpoLHWZe7ir+BMWUwaNqfc9bSHCYMA3h
	BJe2u1wU8kPn/159T1MXeJ07nxf5FzRPTeB+v6evDKcyM5MViykYnT3FSsYgAkqhZG9YqRV/8Axvk
	cPVT5jwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTVq-00000001smJ-1Zmw;
	Thu, 12 Feb 2026 10:01:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTVi-00000001seE-1DWu;
	Thu, 12 Feb 2026 10:01:24 +0000
X-UUID: c747b1c807f911f1ad39f32c34db0b1c-20260212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YxincR19n+n/u0r8OQlSgZvvbGiDFUYQw+mjXeEvtaQ=;
	b=Tqvm04RJMH182oGl/VtN9C1nBY6drqTIXPY7iHYZrCB3KOWTtcLyOEQ/I75vLR3HbkgECd9zc2B11ZqgfzuQVod5WLd8NQw79A85327uOk4M5HNgmydmD3T3ip3wvZY1sh4e7xXkJqre84FFYrl/AbmJUH9UODWCZ+/ZscJSgPQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9eb0377c-fd98-4a7b-a48a-33efaa23388d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:7b2c9be9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c747b1c807f911f1ad39f32c34db0b1c-20260212
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1353901371; Thu, 12 Feb 2026 03:01:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Feb 2026 18:01:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Feb 2026 18:01:15 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <sebastian.fricke@collabora.com>, Tiffany
 Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 4/6] media: mediatek: encoder: Add a new platform data member
Date: Thu, 12 Feb 2026 18:01:01 +0800
Message-ID: <20260212100104.11863-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260212100104.11863-1-irui.wang@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_020122_351877_1CD8DA14 
X-CRM114-Status: GOOD (  15.41  )
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

Add a new platform data member to indicate each encoder IC, so that the
get chip name function by 'of_device_is_compatible' can be removed.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 22 ++-----------------
 .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  6 +++++
 .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  2 ++
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index f0344888f2cf..b2f911746c01 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -198,33 +198,15 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 			       pdata->num_output_formats);
 }
 
-static int mtk_vcodec_enc_get_chip_name(struct mtk_vcodec_enc_ctx *ctx)
-{
-	struct device *dev = &ctx->dev->plat_dev->dev;
-
-	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-enc"))
-		return 8173;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-enc"))
-		return 8183;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-enc"))
-		return 8192;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-enc"))
-		return 8195;
-	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-enc"))
-		return 8188;
-	else
-		return 8173;
-}
-
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
+	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
 	struct device *dev = &ctx->dev->plat_dev->dev;
-	int platform_name = mtk_vcodec_enc_get_chip_name(ctx);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
+	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", pdata->venc_model_num);
 
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 36065c8ad94f..9a94bd096397 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -381,6 +381,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
 	.output_formats = mtk_video_formats_output,
@@ -391,6 +392,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
+	.venc_model_num = 8173,
 	.capture_formats = mtk_video_formats_capture_vp8,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_vp8),
 	.output_formats = mtk_video_formats_output,
@@ -401,6 +403,7 @@ static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
+	.venc_model_num = 8183,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -412,6 +415,7 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
+	.venc_model_num = 8188,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -424,6 +428,7 @@ static const struct mtk_vcodec_enc_pdata mt8188_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
+	.venc_model_num = 8192,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
@@ -435,6 +440,7 @@ static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
 };
 
 static const struct mtk_vcodec_enc_pdata mt8195_pdata = {
+	.venc_model_num = 8195,
 	.uses_ext = true,
 	.capture_formats = mtk_video_formats_capture_h264,
 	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_h264),
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index 0529564027c4..769fb5009964 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -21,6 +21,7 @@
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
+ * @venc_model_num: encoder model number
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @min_bitrate: minimum supported encoding bitrate
  * @max_bitrate: maximum supported encoding bitrate
@@ -33,6 +34,7 @@
  * @uses_common_fw_iface: whether the encoder uses common driver interface
  */
 struct mtk_vcodec_enc_pdata {
+	u16 venc_model_num;
 	bool uses_ext;
 	u64 min_bitrate;
 	u64 max_bitrate;
-- 
2.45.2


