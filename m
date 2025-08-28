Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0098CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrgvOZOhYf+QWhMuHwscyYFaAU7BrXS22/+q7CzokNk=; b=xwvJVQY+MHydo/oCO1Zv/miogm
	6dwhJwAdTXaLZKXowdwbj52lPqgPfmb/RifzJapP8/F/AVo3MVDSLufKBtLPv9vjH/9xWuNlaE5q0
	MSrP0L7rblmhXeOY50SzKOirDWK5tFnixUxUzPgFmzdMU3/I1ZR5QpKzrau0e+x6eyZ6ms3KmJdzM
	24TcF8NxE3rTtf6ayiMWiZYAZgSYYBoblV/FAKGqlb9Hlbx7pscLzzcy/uI3qiCk5b1fugTNt2Gd9
	wjeCribDe0LmSjIdJewWMHD6W7ETKtIewS2bvlm1B+XXCCJuc4ifiKus0XwI/QAUrWAbKweFYkfUU
	tpuJuMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYCt-00000000pse-3QXB;
	Thu, 28 Aug 2025 08:42:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXh3-00000000jQ1-3WIn;
	Thu, 28 Aug 2025 08:09:14 +0000
X-UUID: 45dcde0283e611f09f706fa2197c6ceb-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lrgvOZOhYf+QWhMuHwscyYFaAU7BrXS22/+q7CzokNk=;
	b=RATPxZwoavD3vJaPU7vhcvGbEnNfGZAn3EB+MuvVUWuChiHXVbgzVXnOvZTywj1orB7Vhc1I5F6gkHB5781evVR7RBHBBKnV4h76f+bxX41MtQEsMTbfqqydRePmxa1TWn/4hR7b2GGLc294hdevvPZEffzTtNSZyPVZbT0iV44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5637e319-e944-4d16-b62e-4d4c87dcb0e6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:7b9bb36d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 45dcde0283e611f09f706fa2197c6ceb-20250828
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1397542222; Thu, 28 Aug 2025 01:09:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:04 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 11/19] drm/mediatek: Rename OVL format naming
Date: Thu, 28 Aug 2025 16:07:06 +0800
Message-ID: <20250828080855.3502514-12-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010913_889881_859B585D 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Rename the OVL format naming

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e0236353d499..d4f096d37abc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -101,7 +101,7 @@ static inline bool is_10bit_rgb(u32 fmt)
 	return false;
 }
 
-static const u32 mt8173_formats[] = {
+static const u32 mt8173_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_BGRX8888,
@@ -115,7 +115,7 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
-static const u32 mt8195_formats[] = {
+static const u32 mt8195_ovl_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB2101010,
@@ -667,8 +667,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
@@ -676,8 +676,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -685,8 +685,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -694,8 +694,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -707,8 +707,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -720,8 +720,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8173_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8173_ovl_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -734,8 +734,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
 		       BIT(DRM_MODE_BLEND_COVERAGE) |
 		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
-	.formats = mt8195_formats,
-	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.formats = mt8195_ovl_formats,
+	.num_formats = ARRAY_SIZE(mt8195_ovl_formats),
 	.supports_clrfmt_ext = true,
 };
 
-- 
2.45.2


