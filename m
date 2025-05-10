Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645B5C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gADYw74csEBUNnKaQWCDgsGf/Crg494yQ5XTZTHGL40=; b=MD0J6ypq0WmJt1XrnraQ23S5DS
	YHVrdkp5DFyOfg343rjkKxF6B17XBWJE3um5FzXT7F2aMOVJC1a1Watj6j+qi4EmxANqSrcZAvA8t
	MFPctgTZYqgxRCg0Y5iwHhuI8wCkIJrbKMRH/yu6ZEqRUwehHgLAvn7npRAwLS+p+EBCoCTQhgyne
	lPyF8aoMLiEk6S+kO2idM2tOI772KnmoKVVeuE/7+ljVJnXGq49TuiFOCCShKtSjUR8SNl6nXCCfc
	yIZVyDZjNM8BLzrGypYmNKPhRAhV/NftaRZfwTKLlynuMAuyRosTkJzF3humvSD05fBZrbcOrG+Qe
	MJ554dBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfSN-00000005dZu-42wp;
	Sat, 10 May 2025 08:21:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDf6O-00000005ao1-1gNS;
	Sat, 10 May 2025 07:58:33 +0000
X-UUID: 8d7e84a42d7411f0bed96b30c12bc3d6-20250510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gADYw74csEBUNnKaQWCDgsGf/Crg494yQ5XTZTHGL40=;
	b=h6N6ko3vzy1UK17x7bqU91O9WdqP+DZ6oCnLlWgKi7VXk4ybSw7ul/BN6S4LgJgC3ymdn/d7i+8d63B5y+kTmPydwzPzR1uncc0iLTDEzFLtzEmH0UpxW9tcLmPMLmp2gCZ5l1iykgaCl5y38TfkrT5hso8FUmJAClHoDt4PxZ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6f120454-8952-4802-8f92-f68add70b3b1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f5da8db7-5e6b-4d0f-a080-a5e9cb36bea6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8d7e84a42d7411f0bed96b30c12bc3d6-20250510
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 321020708; Sat, 10 May 2025 00:58:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 10 May 2025 15:58:22 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 10 May 2025 15:58:21 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 07/14] media: mediatek: vcodec: define MT8196 vcodec levels.
Date: Sat, 10 May 2025 15:53:37 +0800
Message-ID: <20250510075357.11761-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250510075357.11761-1-yunfei.dong@mediatek.com>
References: <20250510075357.11761-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_005832_446234_3510C55A 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

The supported level and profile are not the same for different
codecs and architecture. Select the correct one.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d873159b9b30..c1cef78471a9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -555,6 +555,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
 		break;
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
 		break;
 	case MTK_VDEC_MT8183:
@@ -573,6 +574,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
 		break;
 	default:
@@ -589,6 +591,7 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
 		break;
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
 		break;
 	default:
@@ -603,6 +606,7 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
 		break;
 	default:
@@ -620,6 +624,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
 		break;
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
 		break;
 	case MTK_VDEC_MT8186:
@@ -637,6 +642,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
 	case MTK_VDEC_MT8195:
+	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
 		break;
 	default:
-- 
2.46.0


