Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2BCC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXP1dNVyX5ttoayYYP2wqof7J1ea2vMRKyE59KGt70M=; b=Uzl5MvCc04rCGKEJbWyO8lDj2k
	fbFCsjMNkQ8kN2/APAd1isz/irJFhkfkJj7co+08c8GDoajzkbeSoV6FKBkOLcMtzdmbjZGWYvIYu
	OBciLvM3Q06b/CoXbH8bVjRe72Qv3hVCJQrSDA8Mx2/U157od1X1gr0wsD675tCseJjRZ7D31Zq26
	kx0ZjXtjGvx9zlnCHxpOl/QqR1bWo29+ToPTl2GyRMMgC5pa+gzgM6z+Ff173svDhZNPx4MEc4llG
	3O+cjl2Az3GllpAWw0Y19VLzlvuNth8snKf7UcwojQWv9k+kcuYHQSidmOq4NfX3hd+7c5DxeEhh1
	l4yInfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lWb-00000009OBD-3X58;
	Thu, 10 Apr 2025 06:36:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lQd-00000009N65-32BG;
	Thu, 10 Apr 2025 06:30:26 +0000
X-UUID: 4455cd7015d511f0a1e849db4cc18d44-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iXP1dNVyX5ttoayYYP2wqof7J1ea2vMRKyE59KGt70M=;
	b=oZO8pBgHtC6U6eMCiGpAt8Pqjld3Rodvis2fpT/F9KsC55Wdbk7GjYBJh40/5xr3mClRZ6p4jARDKSytum+yC1E5LbTDSXjsMh3P7n+vosU1deNtTzMdF9gM76RXQQVEf2d9re0YwZO+jpAfe0TPT0RbVf7KYVI/bDYOCos1Hx0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:229b40bf-ad0a-4ddb-bd73-51ce9c9d9447,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:cc1967c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT|NGT
X-CID-BAS: 5,DFT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4455cd7015d511f0a1e849db4cc18d44-20250409
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1441655214; Wed, 09 Apr 2025 23:30:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:13 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 03/12] media: mediatek: jpeg: add jpeg compatible
Date: Thu, 10 Apr 2025 14:29:56 +0800
Message-ID: <20250410063006.5313-4-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233023_811026_AD55C2B1 
X-CRM114-Status: GOOD (  10.90  )
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

Add jpeg dec and enc compatible for mt8196

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 34 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  3 ++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  3 ++
 3 files changed, 40 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 9517ebed0701..63a6efc8e21a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1922,6 +1922,19 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.jpeg_worker = mtk_jpegenc_worker,
 };
 
+static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.m2m_ops = &mtk_jpeg_multicore_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.multi_core = true,
+	.jpeg_worker = mtk_jpegenc_worker,
+};
+
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.formats = mtk_jpeg_dec_formats,
 	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
@@ -1935,6 +1948,19 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.jpeg_worker = mtk_jpegdec_worker,
 };
 
+static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.m2m_ops = &mtk_jpeg_multicore_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.multi_core = true,
+	.jpeg_worker = mtk_jpegdec_worker,
+};
+
 static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
 	.clks = mtk_jpeg_clocks,
 	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
@@ -1996,6 +2022,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt8188-jpgdec",
 		.data = &mtk8188_jpegdec_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8196-jpgenc",
+		.data = &mtk8196_jpegenc_drvdata,
+	},
+	{
+		.compatible = "mediatek,mt8196-jpgdec",
+		.data = &mtk8196_jpegdec_drvdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index ebded06ba92d..d868e46aaf37 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] = {
 	{
 		.compatible = "mediatek,mt8195-jpgdec-hw",
 	},
+	{
+		.compatible = "mediatek,mt8196-jpgdec-hw",
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 87fe1f324f23..ca06d4f435cd 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] = {
 	{
 		.compatible = "mediatek,mt8195-jpgenc-hw",
 	},
+	{
+		.compatible = "mediatek,mt8196-jpgenc-hw",
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
-- 
2.46.0


