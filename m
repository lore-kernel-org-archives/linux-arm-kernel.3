Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12D7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmDycyrKedKl+dsAB3R2YpSJL9+g7fyKUBQKL63ne0k=; b=WUIZ7yeTncSn6E9qaAPtIt0hqc
	erAFmVD79aQN/FHkNKOkzSuE64mKfMUq8jY+m1Qx8jXRPjpmPuNtKt7uuTPS1IgoAI6qDHXAz/6LO
	MsR2cfWQbJINh5nVoKNS1ZLgbqyalsbGn+Y86XQ9pB31DIeIdixmepdAFZkCUDcNJARa8LBfW9Wi8
	tfUHzunXfpnfiAbnieehzxkTSAL2S/WFzNIdPgDGtVlAg3ts/KogwhzHeZPtjLV2+Wa7wxDIYyKwU
	TeblAjQNTBKMIf9NdXrem9CiMWYYH3qL9nbQ10SPArw+HtTDM77f/u+UeJDGlhlvRRrvpC+GQM/tJ
	E7QbqVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpZc-0000000HFWG-3aem;
	Mon, 21 Jul 2025 12:24:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoBC-0000000H0WU-1EX9;
	Mon, 21 Jul 2025 10:55:35 +0000
X-UUID: 38795764662111f09f706fa2197c6ceb-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dmDycyrKedKl+dsAB3R2YpSJL9+g7fyKUBQKL63ne0k=;
	b=ctcSHKxANktwkcN+rZ2EsAqcdG2af2xgpUUnKhHbu8DCWYccE7nVMxE1fwGKfzaxWeuFkhnI7rWWdJcj9N1CqyAamfRO3LTqxb0q+2jpW7K8poUOpaZvBTZwupNpfCBn82GzkSGGO7J3y80U2QyGxinU4xJSgmNM8elwd/ySj+c=;
X-CID-CACHE: Type:Local,Time:202507210339-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:97a2b469-2023-41dc-a156-5ea16cca3b7e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:7486ab84-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 38795764662111f09f706fa2197c6ceb-20250721
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1783940362; Mon, 21 Jul 2025 03:55:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 18:55:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 18:55:27 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v1 3/8] media: mediatek: vcodec: add profile and level supporting for MT8189
Date: Mon, 21 Jul 2025 18:55:15 +0800
Message-ID: <20250721105520.5625-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250721105520.5625-1-kyrie.wu@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_035534_328571_AF8E8CBF 
X-CRM114-Status: GOOD (  10.34  )
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

add profile and level supporting for H264 and vp9 of MT8189

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index c1cef78471a9..0a9bdc5316f9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -552,6 +552,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8192:
 	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8189:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
 		break;
 	case MTK_VDEC_MT8195:
@@ -573,6 +574,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 {
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8189:
 	case MTK_VDEC_MT8195:
 	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
@@ -623,6 +625,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 	case MTK_VDEC_MT8188:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
 		break;
+	case MTK_VDEC_MT8189:
 	case MTK_VDEC_MT8195:
 	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
@@ -641,6 +644,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 {
 	switch (ctx->dev->chip_name) {
 	case MTK_VDEC_MT8188:
+	case MTK_VDEC_MT8189:
 	case MTK_VDEC_MT8195:
 	case MTK_VDEC_MT8196:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
-- 
2.46.0


