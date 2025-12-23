Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A86DE6FE2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=im3amyw7Z/DSECSytOkMcJmyL2am1VO/4+gKE9cCLR4=; b=wKi/86wvp1+A5mLYQhyKAu4oJV
	MJY/nnHozQy+snsOrjrQ9aF1TcntM/RgoZmUIzH2DDFIKfImeOLyWS4JKlEARsGTYIds1QaQSM3Eb
	DBSKPF+1skHOWsGG80fU9llEnjeKrmqwqOB6VyG1ajRxQFIbL4sFjCfnsk83ExJLDr0daSWm1gkDO
	6eXpNiYpzLj35bdLxGolkOIB0QshjqQG287QLfqijfYdyY0AyDWvpanpFWc9OchtgG2OuiyADGmXO
	vuZF3ghDV5G2Z/ayv0EDbqF5J258uOULYLaWP+ZkHgGQNcspflhEVEXF1Nzac5Tns2JjGVjfb9y3B
	ab5+PITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Lk-0000000G0VO-0YBP;
	Tue, 23 Dec 2025 19:47:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Li-0000000G0Rs-0plf;
	Tue, 23 Dec 2025 19:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519232;
	bh=aaopciM4Y2qsD6YiU8UzhAYbus2vCxtY2mv/Rv39MaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JLnGVDv2gsgTMVlKTA9T0OqZbS1FyhvlF9NbVol4kQeCs13/LnIsjTGyjCEHMnoTH
	 LKD4lVT6eFTYUtbV0jmlzGye8wsudw0KFrNeoZXDtOSsM+o4ta68Ml5XoDwFxRnkVF
	 mSC8G+5QFWCW60i0LFEJvr6iWY7YYTZpMM57PFN0gv8i0w9FQFzaKdX4C478s7GReb
	 Lzhuoa0Sa/NaLj4PECkquxeBzLCbyyRs5Oif3J2sdhXTJm/5iAxRjWcH5nOzGV6R4o
	 yTPe29Gl6ZJ5P1C87QulfAsq2+x7yffQ/pyX7e8kgMmi4TG9e3/kP3WZeUQ3fBkVzs
	 Dcpdg0VYQq8MA==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02CCA17E1543;
	Tue, 23 Dec 2025 20:47:06 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:49 -0300
Subject: [PATCH 08/11] drm/mediatek: ovl: Implement support for Gamma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-8-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114714_401102_5FF0848B 
X-CRM114-Status: GOOD (  14.88  )
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

The OVL hardware allows selecting between different fixed transfer
functions for each layer through the Gamma setting. Available
functions are scRGB, BT.709, BT.2020 and HLG. Implement support for it
and expose it as a colorop through the DRM plane color pipeline uAPI.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 67 ++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 4eaa31541ccc..a70092c792a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -52,10 +52,16 @@
 #define OVL_CON_CLRFMT_10_BIT				(1)
 #define DISP_REG_OVL_WCG_CFG1			0x2d8
 #define IGAMMA_EN(layer)				BIT(0 + 4 * (layer))
+#define GAMMA_EN(layer)					BIT(2 + 4 * (layer))
 #define DISP_REG_OVL_WCG_CFG2			0x2dc
 #define IGAMMA_MASK(layer)				GENMASK((layer) * 4 + 1, (layer) * 4)
 #define IGAMMA_SCRGB					0
 #define IGAMMA_BT709					1
+#define GAMMA_MASK(layer)				GENMASK((layer) * 4 + 3, (layer) * 4 + 2)
+#define GAMMA_SCRGB					0
+#define GAMMA_BT709					1
+#define GAMMA_BT2020					2
+#define GAMMA_HLG					3
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -508,11 +514,41 @@ static int mtk_ovl_colorop_curve_to_reg_val(enum drm_colorop_curve_1d_type curve
 		return IGAMMA_SCRGB;
 	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
 		return IGAMMA_BT709;
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+		return GAMMA_SCRGB;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+		return GAMMA_BT2020;
+	case DRM_COLOROP_1D_CURVE_HLG_EOTF:
+		return GAMMA_HLG;
 	default:
 		return -EINVAL;
 	}
 }
 
+static void mtk_ovl_apply_gamma(struct mtk_disp_ovl *ovl, unsigned int idx,
+				struct drm_colorop *colorop,
+				struct cmdq_pkt *cmdq_pkt)
+{
+	int curve_reg_val;
+
+	curve_reg_val = mtk_ovl_colorop_curve_to_reg_val(colorop->state->curve_1d_type);
+	if (curve_reg_val < 0) {
+		drm_WARN(ovl->crtc->dev, 1, "Invalid curve 1d type %u\n",
+			 colorop->state->curve_1d_type);
+		return;
+	}
+
+	mtk_ddp_write_mask(cmdq_pkt,
+			   field_prep(GAMMA_MASK(idx), curve_reg_val),
+			   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_WCG_CFG2,
+			   GAMMA_MASK(idx));
+
+	mtk_ddp_write_mask(cmdq_pkt,
+			   colorop->state->bypass ? 0 : GAMMA_EN(idx),
+			   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_WCG_CFG1,
+			   GAMMA_EN(idx));
+}
+
 static void mtk_ovl_apply_igamma(struct mtk_disp_ovl *ovl, unsigned int idx,
 				 struct drm_colorop *colorop,
 				 struct cmdq_pkt *cmdq_pkt)
@@ -549,7 +585,11 @@ static void mtk_ovl_apply_colorop(struct mtk_disp_ovl *ovl, unsigned int idx,
 {
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_CURVE:
-		mtk_ovl_apply_igamma(ovl, idx, colorop, cmdq_pkt);
+		/* gamma is the last colorop in pipeline */
+		if (!colorop->next)
+			mtk_ovl_apply_gamma(ovl, idx, colorop, cmdq_pkt);
+		else
+			mtk_ovl_apply_igamma(ovl, idx, colorop, cmdq_pkt);
 		break;
 	default:
 		drm_WARN(ovl->crtc->dev, 1, "Invalid colorop type %u\n", colorop->type);
@@ -562,7 +602,7 @@ static void mtk_ovl_disable_colorops(struct mtk_disp_ovl *ovl, unsigned int idx,
 {
 	mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_WCG_CFG1,
-			   IGAMMA_EN(idx));
+			   IGAMMA_EN(idx) | GAMMA_EN(idx));
 
 	/* igamma curve needs to be set to default when igamma is disabled */
 	mtk_ddp_write_mask(cmdq_pkt, IGAMMA_SCRGB, &ovl->cmdq_reg, ovl->regs,
@@ -697,6 +737,11 @@ static const u64 igamma_supported_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
 
+static const u64 gamma_supported_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
+	BIT(DRM_COLOROP_1D_CURVE_HLG_EOTF);
+
 #define MAX_COLOR_PIPELINE_OPS 3
 
 static int
@@ -724,6 +769,24 @@ mtk_ovl_initialize_plane_color_pipeline(struct drm_plane *plane,
 	if (ret)
 		goto err_colorop_init;
 
+	i++;
+
+	/* 3rd op: OVL's Gamma */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      &mtk_ovl_colorop_funcs,
+					      gamma_supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto err_colorop_init;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
 	pipeline->type = ops[0]->base.id;
 	pipeline->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
 

-- 
2.51.0


