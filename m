Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F8A1093181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVK07dtXd6MJu8rTSu68T1HJgSA5P1uZrXZtGTW9kTc=; b=fn+LMOmhqFouSef/lL8md2bxWp
	3nwxhC0uSWtLLgZ48uHCniTJgRstRuxo1hVZCI4zR0P3JtVmW/wfu7QqNaghInZoaeOxeG/VabcDJ
	9Hlw3oS9/oBYWtjKjg+IK8ba7nPFSQs5m/1kRTlDtrS827UuLXnyZWT4Mlvg838/4ALelu/41ueAl
	Y+BoLXrq7w9dFw83hJJ+20wMCRRuyR6LCj6Onpr2o3KSETf+Qb78SbkFHmTDMKxgupXcPYtSz2FkK
	IOSeSJrEo0wpp+rYPEUV/Udt/s2bmKTA+cWQwoKv0OIjUuinUddoCCt0l3jw4m7g5zk0FxwcYjes3
	RO38R1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stw-0000000C7s3-1x2Z;
	Fri, 20 Mar 2026 06:00:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Stp-0000000C7kc-3BXD;
	Fri, 20 Mar 2026 05:59:58 +0000
X-UUID: 045b24fc242211f19e7563141e833ce8-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pVK07dtXd6MJu8rTSu68T1HJgSA5P1uZrXZtGTW9kTc=;
	b=KxIr/cg9jCEIP6BZVwgw+9CNmexWV31PbwwHJhDX8tvU0ZaD0QkNiFybKaFWCIAhrJSptQnuFi0YuD+KIgMw4cZTcZhm14lG1iUKOWOBq34d2HbqQnLHW61RtMaJIIoAeUXcw0Ib8YVFJrQ32Li64Urq2P1NceZBcucV54Wc2ZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:99f0e02a-ea2d-4ab5-8e19-fe3c25890c92,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:6891b64c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 045b24fc242211f19e7563141e833ce8-20260319
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2106542604; Thu, 19 Mar 2026 22:59:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 13:59:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 13:59:50 +0800
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
Subject: [PATCH v8 6/9] media: mediatek: vcodec: add decoder compatible to support MT8189
Date: Fri, 20 Mar 2026 13:59:37 +0800
Message-ID: <20260320055940.15961-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260320055940.15961-1-kyrie.wu@mediatek.com>
References: <20260320055940.15961-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_225957_829151_553C962F 
X-CRM114-Status: GOOD (  11.63  )
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

MT8189 is pure single core architecture. Add its compatible to
initialize platform data.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |  1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  4 ++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
index 80cb46f1cded..2bde871c0224 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
@@ -71,6 +71,7 @@ extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 6ebd82ba8d23..dc67c2b84776 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -555,6 +555,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8196-vcodec-dec",
 		.data = &mtk_vdec_8196_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8189-vcodec-dec",
+		.data = &mtk_vdec_8189_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 748725e563d8..b72a22b15834 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -1041,3 +1041,22 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
 		.prob_size = VP9_PROB_BUF_SIZE,
 	},
 };
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
+	MTK_STATELESS_DEC_DATA,
+	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
+	.chip_model = 8189,
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
+		.prob_size = VP9_4K_PROB_BUF_SIZE,
+	},
+};
-- 
2.45.2


