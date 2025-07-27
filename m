Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14814C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 07:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3xfRIA1MWnnwK9QehcSTbsTqW/dyTAHteqQQVk9tms=; b=DJ+LblWHDhaHbAifp9vYy8x0RZ
	fhD3f5Ka+rcJG8FBjZLSgSWzNKugFSTe6QRoaa65/hwTx6amURaaSu6HiFZQ7v+XTGMWDLGEVgwBm
	54Susw2JF9OukqKBFHTwp8t3A5SVnjdLRrg879nVgTIvDPmXMo0dJej0yIxKoxlNqvOXHur8VUH8O
	EqxWjDi7U0LZp8KCX492gC7bMnWpnrWyxkffgGdomy+FV5mJGPbpNpubEhjzfSrwIcsqP5h7d1mrU
	fxckHFCkxSrNBXSAiA6k3XLHjDIG6qWMrDmDtdpvqvwfI31EyStypb3MWuMYWpuZsiJYA0R8znVV+
	r4ibr1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufvjx-0000000CQXf-3mxz;
	Sun, 27 Jul 2025 07:24:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufvd0-0000000CPs4-2gy5;
	Sun, 27 Jul 2025 07:17:03 +0000
X-UUID: af8540746ab911f09eb0dd999d3936bf-20250727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=h3xfRIA1MWnnwK9QehcSTbsTqW/dyTAHteqQQVk9tms=;
	b=JwneVsfUROeRh9jwj+SSh9jROMaFIM9bq2HjHy6R6WVFe7y768TyrCKh2KZXL5FTstDSGPKbHkL8Qt9rAFD4TCdPLep3ijDOTS8k7ikvWTui02WoscXZfEEAsL+dE67ZeWL9odEgDzEjPY8mRkju6ttxVMdDEQzebOUIE0BZzPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ea8a25e1-3893-46d1-bb5b-dcc841a1d59c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:0d85360f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: af8540746ab911f09eb0dd999d3936bf-20250727
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1678462121; Sun, 27 Jul 2025 00:16:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 27 Jul 2025 15:16:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 27 Jul 2025 15:16:53 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jay Liu <jay.liu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/7] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n function issue
Date: Sun, 27 Jul 2025 15:15:52 +0800
Message-ID: <20250727071609.26037-3-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250727071609.26037-1-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_001702_683339_FF37C096 
X-CRM114-Status: GOOD (  14.15  )
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

if matrixbit is 11,
The range of color matrix is from 0 to (BIT(12) - 1).
Values from 0 to (BIT(11) - 1) represent positive numbers,
values from BIT(11) to (BIT(12) - 1) represent negative numbers.
For example, -1 need converted to 8191.
so convert S31.32 to HW Q2.11 format by drm_color_ctm_s31_32_to_qm_n,
and set int_bits to 2.

Fixes: 738ed4156fba ("drm/mediatek: Add matrix_bits private data for ccorr")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jay Liu <jay.liu@mediatek.com>
Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 24 ++---------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 85ba109d6383..b097c20877f3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -80,27 +80,6 @@ void mtk_ccorr_stop(struct device *dev)
 	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
 }
 
-/* Converts a DRM S31.32 value to the HW S1.n format. */
-static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
-{
-	u16 r;
-
-	/* Sign bit. */
-	r = in & BIT_ULL(63) ? BIT(n + 1) : 0;
-
-	if ((in & GENMASK_ULL(62, 33)) > 0) {
-		/* identity value 0x100000000 -> 0x400(mt8183), */
-		/* identity value 0x100000000 -> 0x800(mt8192), */
-		/* if bigger this, set it to max 0x7ff. */
-		r |= GENMASK(n, 0);
-	} else {
-		/* take the n+1 most important bits. */
-		r |= (in >> (32 - n)) & GENMASK(n, 0);
-	}
-
-	return r;
-}
-
 bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
@@ -109,6 +88,7 @@ bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	const u64 *input;
 	uint16_t coeffs[9] = { 0 };
 	int i;
+	int int_bits = 2;
 	struct cmdq_pkt *cmdq_pkt = NULL;
 	u32 matrix_bits = ccorr->data->matrix_bits;
 
@@ -119,7 +99,7 @@ bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	input = ctm->matrix;
 
 	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
+		coeffs[i] = drm_color_ctm_s31_32_to_qm_n(input[i], int_bits, matrix_bits);
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
-- 
2.46.0


