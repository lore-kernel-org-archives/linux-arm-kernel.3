Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E186310F3DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 05:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrmJUp2FeJ5yuP4dVxhzLWIBjkJPDyvnMvQ9bGnGcoI=; b=mX0JNvQCrWRs9C6LEtzQHe27LQ
	2gORHeFBuwA46+9AZ4VxPMLlbGBxPU7l6dnHGGu++VpYZP1MnugMBJXwgjWPgbYKrqR1rp7HuBfmV
	PYAmxE3tW0kn2C1phEHGLBUMToDvu6Y0WHm8AP9DsVTvHhY33bB5mCaE9pe9jqLwCTWLuG5kMtgRQ
	6S5Lymjzn1IK/4SqCtRAUcPQ6cRtdWWMsNDCx0xp0LLd0oKhVuH57p/1jPtZlxNBCbvVEFE7w9wfE
	ZQph8c/1tGS1biEgx6TPrxIQB0QtQFc/F8/BQR7UvpWN+4xGEbzesf+74mJ9Av2PVm4Df0Mx6DO2h
	A3Xc9Kzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6M37-00000008ZRR-0Drj;
	Sat, 28 Mar 2026 05:17:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6M2X-00000008Ywl-3NfX;
	Sat, 28 Mar 2026 05:16:54 +0000
X-UUID: 52c7bb3e2a6511f19e7563141e833ce8-20260327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RrmJUp2FeJ5yuP4dVxhzLWIBjkJPDyvnMvQ9bGnGcoI=;
	b=SbeXghEnDRwNgkzPdTVr4Mwbo6sqkjm5aBVHq6JsMulNKYXJBsw0KBdFsOof13Tj6LD8GJ+kBlpUNZGYpMuXo09ri1VdatjFV5mCOnQrBVJLmG3US6X5vtDfPBEAve2fUvN3x2Ob/9jdXXOyKhARx85NPL9s1Ajqj2V7KeQGJ0Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5a32b011-1e2f-4c04-b8a6-d99c7c3bac71,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1def3e3f-41ee-42eb-90dd-1068410e1f48,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 52c7bb3e2a6511f19e7563141e833ce8-20260327
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 546539427; Fri, 27 Mar 2026 22:16:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 28 Mar 2026 13:16:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 28 Mar 2026 13:16:45 +0800
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
Subject: [PATCH v4 12/14] media: mediatek: vcodec: add decoder compatible to support mt8196
Date: Sat, 28 Mar 2026 13:16:22 +0800
Message-ID: <20260328051630.7937-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260328051630.7937-1-yunfei.dong@mediatek.com>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_221653_853874_D4155725 
X-CRM114-Status: GOOD (  10.77  )
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

MT8196 is lat single core architecture. Support its compatible and
use `mtk_lat_sig_core_pdata` to initialize platform data.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 5a748a60b453..e7c140b26955 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
 		vdec_dev->chip_name = MTK_VDEC_MT8186;
 	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
 		vdec_dev->chip_name = MTK_VDEC_MT8188;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8196;
 	else
 		vdec_dev->chip_name = MTK_VDEC_INVAL;
 }
@@ -570,6 +572,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8188-vcodec-dec",
 		.data = &mtk_lat_sig_core_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8196-vcodec-dec",
+		.data = &mtk_lat_sig_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index c9d27534c63e..f06dfc1a3455 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_MT8188 = 8188,
 	MTK_VDEC_MT8192 = 8192,
 	MTK_VDEC_MT8195 = 8195,
+	MTK_VDEC_MT8196 = 8196,
 };
 
 /*
-- 
2.45.2


