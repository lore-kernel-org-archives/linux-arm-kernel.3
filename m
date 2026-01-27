Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD4D25922
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 02:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOhrBJB6xKWyt7Vc8LF2aOahSsaVAuC8zJPvM2SQorY=; b=lUIAC5zWZWAFqX2zzCDJDDBjZo
	hRtW2D9Syh2htghAhAgneLDuCAF8AD3dM9nLy47wu2B231yO4t1UAXcrykfQJ+RNCp4M4ougQ2DSQ
	aEYOt0TrxzEJQjgLhZHL0TfCJS0tEDx//6UFtpFRG+3QDZ5sENndHMU2gSUR1jrXtUVWNqsDcmJTC
	xZDUOhTejcJywPgn2YI6zYkrVap0xI/Etb24I+ug+wycvzEXaZjatUJ7WVXmByvQNETuCBLTb9eiB
	fLlXFcB/e2/JrIczmnfjKKkWs0pll6oL5mN/ZIS1iUvfEveqRUCke+Ih9CY0czDXuwUZHuUMMAe8s
	HXXe06Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZ3A-0000000DVf2-1k06;
	Tue, 27 Jan 2026 02:43:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZ2y-0000000DVU3-3Q2J;
	Tue, 27 Jan 2026 02:43:17 +0000
X-UUID: eabbc356fb2911f0ad39f32c34db0b1c-20260126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iOhrBJB6xKWyt7Vc8LF2aOahSsaVAuC8zJPvM2SQorY=;
	b=ZryUt474H9bzR3a8zUb6n8AvxlhhEyd55VYzpOAtGEm5mb5atmCuGz4SEy1ll+bSMtUkrMu06ffsHLhnnXNNF0DtcqfknSaJY5q00VWwBxMeob53qaIcMiwiQrhRkuLQyIf0TNBKp74kXy5dfeObzglJfaO48rYvH3eql+fj24Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f2c01285-6a48-4131-9aa4-e77bd5d7df32,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:140d985a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eabbc356fb2911f0ad39f32c34db0b1c-20260126
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 83711247; Mon, 26 Jan 2026 19:43:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 27 Jan 2026 10:43:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 27 Jan 2026 10:43:06 +0800
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
Subject: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile & level Initialization
Date: Tue, 27 Jan 2026 10:42:42 +0800
Message-ID: <20260127024248.18406-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260127024248.18406-1-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_184316_868453_5E6DA47E 
X-CRM114-Status: GOOD (  11.37  )
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

This commit initializes codec profile & level for VDEC. It sets
default values for H264, H265, and VP9 codecs across multiple
chipset configurations.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  | 12 +++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84 +++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 8ddb61670dc6..a47906b9d717 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_name = 8173,
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
index a1f419202a24..b571c4ed3f79 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_name = 8183,
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
@@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_name = 8188,
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
 	.chip_name = 8192,
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
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
+	},
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_name = 8195,
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
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 	.chip_name = 8196,
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
@@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 	MTK_STATELESS_DEC_DATA,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_name = 8186,
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
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
@@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 	.chip_name = 8189,
+	.h264_params = {
+		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
+	},
+	.h265_params = {
+		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
+		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+	},
+	.vp9_params = {
+		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
+		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+	},
 };
-- 
2.45.2


