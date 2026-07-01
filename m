Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C75C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aog0Xvyq0MvgwUY+F8qpBo5tcMWJmlQeL3wfqKLKFIU=; b=NjQ2HJs0llPSYVee97Q8oeJSdd
	XGZ6C6K6vF1Q0LgcVZU9dTnebG5EsgJKjeNnijaWzFmd7K0Ha6Si8QSse8uXu2mnawM0mEVEhjZp8
	72MbRAKfh4XF8CHU61UKODPp6MXiPuNg6gav1rPgjCNsET4PRFrtwuSrnWLHBtpVHmJtXpvmJWMg9
	s/LwRPsZuoDVNZU8eAvsVeVUdv0K61bABx2nm8L4W9tPSHHOr5lmvBgGM4B8Rt0/dvsORWLulwKdN
	n52EuBVrlYovNVkqBf0rTCSAreH3omXa5xuhfvSwhcCMexVZm5h6o6R6bSxo0iMOQR+z6fw0ziVip
	uUKMqTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwX-00000001uNg-1Cfg;
	Wed, 01 Jul 2026 12:21:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetwB-00000001tX3-0lCJ;
	Wed, 01 Jul 2026 12:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908464;
	bh=ymB+zr0yyVevOZNXkW8L1qIjB6qUPedpzUM3brYF7SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iyq0Bqbv7C95OvwX5Vq7WNoQOD8toA6Cv+CLc1oXxLFfcEvqhbNuh2m+F5aLdIOUs
	 boVQGLKv8Dq8cR8y3qPx/gr8ley4lqGUjmClpXdPYlyaItjwcFSJGMYGCRzorjiKva
	 3C1PGwxiiYVYTmDdi/PUGZGear12A7kLEmwJ5r/hOZllmQ3IZO9EwPS58gZV/nVbV1
	 PWjKXosSTqaVTDsbG2F+ineAnbI2yNkBrBuQVTAKmZxq9Y4ZR7VNJWs6lDEz+fhQAY
	 +Nx2DkOilsA12V4Sy58KlGm2yTZvnjo68kPZd8qfa9GSJZ4QDCQuoMquJLYNOwj7q+
	 ZfHZh9nmMWj8Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D908417E0F44;
	Wed,  1 Jul 2026 14:21:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com,
	Paul-pl Chen <paul-pl.chen@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>
Subject: [PATCH 03/42] drm/mediatek: Export OVL Blend function
Date: Wed,  1 Jul 2026 14:20:18 +0200
Message-ID: <20260701122057.19648-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_052108_159062_1B6AC2F1 
X-CRM114-Status: GOOD (  19.65  )
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

For the new BLENDER component, the OVL ignore pixel alpha logic
should be exported as a function and reused it.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 68 +++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h |  8 +++
 2 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 9ded20202191..fa4607304acb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -215,6 +215,23 @@ void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
+bool mtk_ovl_is_ignore_pixel_alpha(struct mtk_plane_state *state, unsigned int blend_mode)
+{
+	if (!state->base.fb)
+		return false;
+
+	/*
+	 * Although the alpha channel can be ignored, CONST_BLD must be enabled
+	 * for XRGB format, otherwise OVL will still read the value from memory.
+	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
+	 * affect the result. Therefore we use !has_alpha as the condition.
+	 */
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
+		return true;
+
+	return false;
+}
+
 u32 mtk_ovl_get_blend_modes(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
@@ -401,6 +418,29 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
+unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
+{
+	unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
+
+	/*
+	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
+	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
+	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
+	 *
+	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
+	 * If not, use coverage mode instead to set it to the supported color formats.
+	 *
+	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
+	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
+	 * will get an error return from drm_plane_create_blend_mode_property() and
+	 * state->base.pixel_blend_mode should not be used.
+	 */
+	if (blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+		blend_mode = state->base.pixel_blend_mode;
+
+	return blend_mode;
+}
+
 unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
 				 bool fmt_rgb565_is_0, bool color_convert,
 				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap)
@@ -529,7 +569,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int rotation = pending->rotation;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
-	unsigned int blend_mode = state->base.pixel_blend_mode;
+	unsigned int blend_mode = mtk_ovl_get_blend_mode(state, ovl->data->blend_modes);
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 
@@ -554,17 +594,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		 * For blend_modes supported SoCs, always enable alpha blending.
 		 * For blend_modes unsupported SoCs, enable alpha blending when has_alpha is set.
 		 */
-		if (blend_mode || state->base.fb->format->has_alpha)
+		if (state->base.pixel_blend_mode || state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
-
-		/*
-		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
-		 * for XRGB format, otherwise OVL will still read the value from memory.
-		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
-		 * affect the result. Therefore we use !has_alpha as the condition.
-		 */
-		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
-			ignore_pixel_alpha = OVL_CONST_BLEND;
 	}
 
 	/*
@@ -590,6 +621,9 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
+
+	if (mtk_ovl_is_ignore_pixel_alpha(state, blend_mode))
+		ignore_pixel_alpha = OVL_CONST_BLEND;
 	mtk_ddp_write_relaxed(cmdq_pkt, pitch_lsb | ignore_pixel_alpha,
 			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
@@ -754,9 +788,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
 	.formats = mt8173_ovl_formats,
 	.num_formats = mt8173_ovl_formats_len,
 };
@@ -767,9 +799,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
 	.formats = mt8173_ovl_formats,
 	.num_formats = mt8173_ovl_formats_len,
 };
@@ -781,9 +811,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
 	.formats = mt8195_ovl_formats,
 	.num_formats = mt8195_ovl_formats_len,
 	.supports_clrfmt_ext = true,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
index 919498496bb6..419c2136006c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
@@ -6,12 +6,20 @@
 #ifndef __MTK_DISP_OVL_H__
 #define __MTK_DISP_OVL_H__
 
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 
+#define MTK_OVL_SUPPORT_BLEND_MODES \
+	 (BIT(DRM_MODE_BLEND_PREMULTI) | \
+	  BIT(DRM_MODE_BLEND_COVERAGE) | \
+	  BIT(DRM_MODE_BLEND_PIXEL_NONE))
+
 extern const u32 mt8195_ovl_formats[];
 extern const size_t mt8195_ovl_formats_len;
 
 bool mtk_ovl_is_10bit_rgb(unsigned int fmt);
+bool mtk_ovl_is_ignore_pixel_alpha(struct mtk_plane_state *state, unsigned int blend_mode);
+unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes);
 unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
 				 bool fmt_rgb565_is_0, bool color_convert,
 				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap);
-- 
2.54.0


