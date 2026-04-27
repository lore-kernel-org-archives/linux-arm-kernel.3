Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414F9FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/5a/LDaVh9syJmhdoa0b9OgmeGK9z8+wBFRTev2V0I=; b=enOXIrd2+N/NRsPdwuc5NoFSuY
	QhWwp3sn6qi5zy/mnrfUUv2bDIVjW6ns1htSENuANQWuKV/XwVyY52j58L8mYBtecuAvi8YZTlh12
	k2ZPQMzMbhc0MLvWgysYh6Jmx2/iTwjDATKbaUPrGB/AG3cOzTGWSU9adQNy1iK5bB8dsAoKgmg5k
	OaaA0dmQVUdu5lRoIXDFIQp6PPhdW4zYRyQRWDgMDoZKNo+D2pZsslPHKjtJamw3Zs0HmTejCYyjG
	zII4qqGoHsMvZ025u1DdgRiNRVsdYLjqfR46vvbgv3hlwy15QCusDU22FJwqtZw/QbN8MLv2RPba2
	lomHZrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK2R-0000000Gmec-2N9l;
	Mon, 27 Apr 2026 11:22:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK2M-0000000GmaW-2aS6;
	Mon, 27 Apr 2026 11:22:03 +0000
X-UUID: 4ee48758422b11f1a6de359d7043e138-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1/5a/LDaVh9syJmhdoa0b9OgmeGK9z8+wBFRTev2V0I=;
	b=Ee78YgZrN9+gYmNTgGdygk64LikQy+WXeg0iFctt9lzFGOV9X0KdBYGbZECMvMKF2pf9zzTtIc+G5F0veIyoCC9YXbNf7h8JFABdxYFZfOtXDNCO2zBCHqVCNuQYLob7wK3UhfQKEBwz2B/tHl9RYeyPMBGE1gBZrBsiEbBfmiE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5de3f074-d75d-4d0d-b942-3d9b9eb7aa12,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:808b82be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ee48758422b11f1a6de359d7043e138-20260427
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1618132372; Mon, 27 Apr 2026 04:21:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:21:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:21:56 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>
Subject: [PATCH v5 5/6] drm/mediatek: Support multiple CCORR component
Date: Mon, 27 Apr 2026 19:20:19 +0800
Message-ID: <20260427112131.23423-6-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427112131.23423-1-jay.liu@mediatek.com>
References: <20260427112131.23423-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_042202_686238_C8AF2837 
X-CRM114-Status: GOOD (  17.69  )
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
CCORR is a hardware module that optimizes the visual effects of images
by adjusting the color matrix, enabling features such as night light.

The 8196 SoC has two CCORR hardware units, which must be chained together
in a fixed order in the display path to display the image correctly.
the `mtk_ccorr_ctm_set` API only utilizes one of these units. To prevent
the unused CCORR unit from inadvertently taking effect, we need to block
it in the mtk_crtc.c.

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
index fcb16f3f7b23..09b260a9a4ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -872,11 +872,14 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
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
index 9672ea1f91a2..5cbc4b995d66 100644
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
index 3f3d43f4330d..7244b55f6732 100644
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
index 6d7bf4afa78d..ac59d81dbb26 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -80,7 +80,7 @@ void mtk_ccorr_stop(struct device *dev)
 	writel_relaxed(0x0, ccorr->regs + DISP_CCORR_EN);
 }
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
+bool mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 	struct drm_property_blob *blob = state->ctm;
@@ -92,7 +92,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	u32 matrix_bits = ccorr->data->matrix_bits;
 
 	if (!blob)
-		return;
+		return false;
 
 	ctm = (struct drm_color_ctm *)blob->data;
 	input = ctm->matrix;
@@ -110,6 +110,8 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
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


