Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C601AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+L4VjX2JCCDTCMFLd88+LcuNW5Apnj1Z8Dzhxz61/yI=; b=CiGyxOtztOHzGqcd/JV2kEZ3z9
	9wPuJIxg5DyA8jTROcbz8+9yCSehzTGm7IHV1816+j+NhbwRHlzKzar9CzR4gt2D4XnWadZlN7xZJ
	bjJW1s5E23LR2UXldQZd9+KkWHzqX80rS3XE/ypvKB+E24yJ5zfIfv7EncH8pbveRejKKokrLupWM
	+9Bhh6PKHkX2WTmGDMK1PnfLdIq8Mke5UYQmYN5SzCBSVD3ODnxme6+ogSQjdpDZZwKYKsOEJspil
	CmOKcgT5AbiqwgrlPny+7jGRCkw6C//MBecDL4VIHPr31l5U8+e5elxV4m5iQTPvNkuHigjsRKV+5
	5vTMv6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUL4-00000008Xd2-2WPx;
	Mon, 26 May 2025 09:41:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUG3-00000008Wv3-25Zp;
	Mon, 26 May 2025 09:36:36 +0000
X-UUID: e7713c3e3a1411f08d385d50fb11b32d-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+L4VjX2JCCDTCMFLd88+LcuNW5Apnj1Z8Dzhxz61/yI=;
	b=udaZWIuA5euLc9gnsnwhqyoWnGZyd5A6Ikz9+geKt0eQ/TLJ9hIaZdQdRj4iU+y3y4iCIww2ViqU6bu9+Iq7LgIOUv4vF617gAmDDN6iC4MnVBsKlGKM/AIUh2Cwi7pqiRh12YdetnkdNdh+YPjs9CKvJQCJSBu4fXyBZ0I5uVE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:13bc895a-bb91-4b57-991b-575816a43862,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:97cf1e59-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e7713c3e3a1411f08d385d50fb11b32d-20250526
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 539789144; Mon, 26 May 2025 02:36:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 17:36:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 17:36:26 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH v3 1/1] media: mediatek: jpeg: fix buffer alignment
Date: Mon, 26 May 2025 17:36:24 +0800
Message-ID: <20250526093624.4760-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_023635_538219_A2E8C990 
X-CRM114-Status: GOOD (  13.32  )
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

The JPEG encoder image stride register must be MCU aligned.
For YUV422, it's 32-byte aligned, and for YUV420, it's
16-byte aligned.

The minimal DCT block size is 8x8, so the vertical buffer
alignment for YUV422 is 8-byte aligned, and for YUV420,
it's 16-byte aligned.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
Changes compared with v2:
- Add missing subject

Changes compared with v1:
- Fix the side effects of v1
  when encoding YUV420 with resolution 720x480, the ouput image is abnormal.
- Fix signed-off-by

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 834d2a354692..f01a81feb692 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -40,8 +40,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {4, 4},
 		.v_sample	= {4, 2},
 		.colplanes	= 2,
-		.h_align	= 4,
-		.v_align	= 4,
+		.h_align	= 16,
+		.v_align	= 16,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
@@ -50,8 +50,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {4, 4},
 		.v_sample	= {4, 2},
 		.colplanes	= 2,
-		.h_align	= 4,
-		.v_align	= 4,
+		.h_align	= 16,
+		.v_align	= 16,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
@@ -60,8 +60,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {8},
 		.v_sample	= {4},
 		.colplanes	= 1,
-		.h_align	= 5,
-		.v_align	= 3,
+		.h_align	= 32,
+		.v_align	= 8,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
@@ -70,8 +70,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {8},
 		.v_sample	= {4},
 		.colplanes	= 1,
-		.h_align	= 5,
-		.v_align	= 3,
+		.h_align	= 32,
+		.v_align	= 8,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 };
@@ -87,8 +87,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 		.h_sample	= {4, 2, 2},
 		.v_sample	= {4, 2, 2},
 		.colplanes	= 3,
-		.h_align	= 5,
-		.v_align	= 4,
+		.h_align	= 16,
+		.v_align	= 16,
 		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 	{
@@ -96,8 +96,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 		.h_sample	= {4, 2, 2},
 		.v_sample	= {4, 4, 4},
 		.colplanes	= 3,
-		.h_align	= 5,
-		.v_align	= 3,
+		.h_align	= 32,
+		.v_align	= 8,
 		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 };
@@ -260,6 +260,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 				   struct mtk_jpeg_fmt *fmt)
 {
 	int i;
+	u32 h_align;
 
 	pix_mp->field = V4L2_FIELD_NONE;
 
@@ -283,9 +284,15 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 	}
 
 	/* other fourcc */
+	if (pix_mp->pixelformat == V4L2_PIX_FMT_YUYV ||
+	    pix_mp->pixelformat == V4L2_PIX_FMT_YVYU)
+		h_align = fmt->h_align / 2;
+	else
+		h_align = fmt->h_align;
+
 	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
 			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
-	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
+	pix_mp->width = clamp(round_up(pix_mp->width, h_align),
 			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
 
 	for (i = 0; i < fmt->colplanes; i++) {
@@ -293,8 +300,15 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
 		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
 
-		pfmt->bytesperline = stride;
-		pfmt->sizeimage = stride * h;
+		if (pix_mp->pixelformat == V4L2_PIX_FMT_YUYV ||
+		    pix_mp->pixelformat == V4L2_PIX_FMT_YVYU) {
+			stride = round_up(stride, fmt->h_align);
+			pfmt->bytesperline = stride;
+			pfmt->sizeimage = stride * h;
+		} else {
+			pfmt->bytesperline = stride;
+			pfmt->sizeimage = stride * h;
+		}
 	}
 	return 0;
 }
-- 
2.46.0


