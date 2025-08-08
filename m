Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD07C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbCOuDGcaijQjHEdEUrB7djx5WhQhICYdMDk1/Oi8rQ=; b=yhO8uX87bNdA8ENPuvPdsz3/DA
	Rm2sMcw57utfQdpqwIBFBVv+KCaIhQj/HUoUgYIw0CwBpnum4QxG1WpgAfjFdqKDc2DhXv6yIIXQ3
	2vwtwO7cPO5whk7UNdKNOm4eea5JJq7oAsw+Qs2/6CBFxuOoy7NFtjelM+1l6rb9wJwD+J23iYllp
	SThWwv70VVzTNgXLNiQdcCgBoYLHTw8lI2viYDxRm5OEu0Ok3YB2X/x9iqj3ECzQYm2Lj8ZUs/nJ3
	pZqRjW7L99gxruLh3EvhYs5l1kSEn+Ri9L2TaQLJwYMY7gy9sWhuLpHEPheSpwS8b8Rt35HbMr881
	JKhpEcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMsK-00000002t8c-24NW;
	Fri, 08 Aug 2025 13:11:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMeu-00000002rJ7-2JZe;
	Fri, 08 Aug 2025 12:57:21 +0000
X-UUID: 352e9954745711f09f706fa2197c6ceb-20250808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hbCOuDGcaijQjHEdEUrB7djx5WhQhICYdMDk1/Oi8rQ=;
	b=i+F0Ff6LiEe1kSS5ihZ8YITEipnSm7zPM5MW/CAcbAijBzYEGt5/V22zBh2UCQod7BRVkPMLE1Sv4swnPm/AaJhvUvgkV0VNGSCLGcwwzoiUqz6EAIFjJUP7XBW2OjR94vc4kIfqyLzy5tjjco5q8sWUEz3V3qlnwuac53ZkX2M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ba165c0c-a110-42f4-9487-c2300f41d135,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:a0b1be9d-7ad4-4169-ab95-78e9164f00fe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 352e9954745711f09f706fa2197c6ceb-20250808
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1166827764; Fri, 08 Aug 2025 05:57:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 8 Aug 2025 20:57:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 8 Aug 2025 20:57:09 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>
Subject: [PATCH v3 5/6] drm/mediatek: Support multiple CCORR component
Date: Fri, 8 Aug 2025 20:54:00 +0800
Message-ID: <20250808125512.9788-6-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250808125512.9788-1-jay.liu@mediatek.com>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_055720_590955_8E3D85C4 
X-CRM114-Status: GOOD (  17.95  )
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

Add CCORR component support for MT8196.

CCORR is a hardware module that optimizes the visual effects of
images by adjusting the color matrix, enabling features such as
night light.

The 8196 SoC has two CCORR hardware units, which must be chained
together in a fixed order in the display path to display the image
correctly. the `mtk_ccorr_ctm_set` API only utilizes one of these units.
To prevent the unused CCORR unit from inadvertently taking effect,
we need to block it in the mtk_crtc.c.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c       | 5 ++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   | 3 ++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h   | 7 ++++---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 6 ++++--
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   | 2 +-
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index bc7527542fdc..6b9cb52e9207 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -859,11 +859,14 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
+	bool ctm_set = false;
 
 	if (crtc->state->color_mgmt_changed)
 		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
-			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
+			/* only set ctm once for the pipeline with two CCORR components */
+			if (!ctm_set)
+				ctm_set = mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
 		}
 	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ac6620e10262..850e3b18da61 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -458,7 +458,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
 	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
 	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
-	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
+	[DDP_COMPONENT_CCORR0]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
+	[DDP_COMPONENT_CCORR1]		= { MTK_DISP_CCORR,		1, &ddp_ccorr },
 	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
 	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
 	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 7289b3dcf22f..98a701ac4cde 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -77,7 +77,7 @@ struct mtk_ddp_comp_funcs {
 			  struct drm_crtc_state *state);
 	void (*bgclr_in_on)(struct device *dev);
 	void (*bgclr_in_off)(struct device *dev);
-	void (*ctm_set)(struct device *dev,
+	bool (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
 	struct device * (*dma_dev_get)(struct device *dev);
 	u32 (*get_blend_modes)(struct device *dev);
@@ -254,11 +254,12 @@ static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
 		comp->funcs->bgclr_in_off(comp->dev);
 }
 
-static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
+static inline bool mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 				   struct drm_crtc_state *state)
 {
 	if (comp->funcs && comp->funcs->ctm_set)
-		comp->funcs->ctm_set(comp->dev, state);
+		return comp->funcs->ctm_set(comp->dev, state);
+	return false;
 }
 
 static inline struct device *mtk_ddp_comp_dma_dev_get(struct mtk_ddp_comp *comp)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 10d60d2c2a56..85ba109d6383 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -101,7 +101,7 @@ static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
 	return r;
 }
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
+bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 	struct drm_property_blob *blob = state->ctm;
@@ -113,7 +113,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	u32 matrix_bits = ccorr->data->matrix_bits;
 
 	if (!blob)
-		return;
+		return false;
 
 	ctm = (struct drm_color_ctm *)blob->data;
 	input = ctm->matrix;
@@ -131,6 +131,8 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_3);
 	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_4);
+
+	return true;
 }
 
 static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 679d413bf10b..4203c28c38ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -22,7 +22,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
 void mtk_aal_start(struct device *dev);
 void mtk_aal_stop(struct device *dev);
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
+bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
 int mtk_ccorr_clk_enable(struct device *dev);
 void mtk_ccorr_clk_disable(struct device *dev);
 void mtk_ccorr_config(struct device *dev, unsigned int w,
-- 
2.46.0


