Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332DDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 04:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=InrEQrVqp3K1hemQqa6thTPxGOdQwWfEnlDdHiKCcgk=; b=LrL7uiLzKkv21Z8vic1gOKMDBf
	UVgDbymXplKAXWAI3jHqRGevAdWgGBVTuBdU1DfFsPHA/NioiJQYfIrI1Dp2yFtXioSg2NIc/dFeI
	2dZVNAJN5yCs70zIK3jC19MDdIYAX33R89wSIrC08fP+f0rT/gvqd1dR3grAthLkzKONrqaTbhKam
	zrAdaNXn2YOMGuZ1cH34nVSwL11aG08h4l0LNqweoSupjlU5VcSr2RhswuEr1Lvsm3bBNeLkdlAnV
	0sjOGlntHogKstu6NxrzjX+aa+KUjLI5ppsJToQ67SoJ60Dy3rmrYR70EbPu4MNsRmo0Kyl0ON++f
	IaYtBQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5dZj-0000000F63w-2IZT;
	Fri, 18 Apr 2025 04:43:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cNJ-0000000EyT9-0xkS;
	Fri, 18 Apr 2025 03:26:46 +0000
X-UUID: f1b6f2161c0411f0a1e849db4cc18d44-20250417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=InrEQrVqp3K1hemQqa6thTPxGOdQwWfEnlDdHiKCcgk=;
	b=tCNXBx7a67tEHKvYIOGq4zeCeeWKHsQ6bqfOhUiCSFeJfhIzDeuYggwiOwdFB11UJ8d/hxU3Xg3HSHve+qi8D4uWRCz2HyV0pzaRBIkQKnTkG4egdORkjF5LxorgGeFmbAwRMTzx99k/KVuU0LIoboa8RAzpKbBzPwJz2u6Jwig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5001f935-5cdf-456b-9b05-bfd29f6ebfdf,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:688138a6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f1b6f2161c0411f0a1e849db4cc18d44-20250417
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1081741198; Thu, 17 Apr 2025 20:26:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 11:26:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 11:26:37 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, jianhua.lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 1/1] media: mediatek: jpeg: fix buffer alignment
Date: Fri, 18 Apr 2025 11:25:59 +0800
Message-ID: <20250418032559.31043-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_202645_288035_385A246F 
X-CRM114-Status: GOOD (  10.13  )
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

From: "jianhua.lin" <jianhua.lin@mediatek.com>

The JPEG encoder image stride register must be MCU aligned.
For YUV422, it's 32-byte aligned, and for YUV420, it's
16-byte aligned.

The minimal DCT block size is 8x8, so the vertical buffer
alignment for YUV422 is 8-byte aligned, and for YUV420,
it's 16-byte aligned.

Signed-off-by: jianhua.lin <jianhua.lin@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 834d2a354692..7dd652e5b6d4 100644
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
-- 
2.46.0


