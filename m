Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5950E6FE29
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4brNfLxZJm+MWz7Ndny+z2WOkuiVUQpQbX6NtrA6sWU=; b=AfYBVa3zPj/r8M9Slea4jW8k/i
	wS4w6/moHaNSyPkh97XEI67qPlFS6PGxvF3ZavJWCAUNdx7Rw5fqeWm8aZlN2StvkmCuwtbqAdDJp
	8xh9f6+xLfrcEb0SgnnGO+9/eDSJ39y/XmT9P65YJIOZZpeMhuRGbol43sxlpOjE8ODX3+smMIkBa
	mAlPj1c2jv8jcd8wvm2lULHE7FUsqcbz4qDdIp9fITFd/OZQv3Rs3TplF2jgSLS8pClJEDPEftI8+
	NNE9OOIaO7cr73tqvOiyErG0Ugdv6oqINZblZs437/YLm6kZe4b5Yb0DhQ9F75JccDDfQjTQNVabi
	ebcWpqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LU-0000000G0FH-2BQS;
	Tue, 23 Dec 2025 19:47:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8LS-0000000G0Cn-0KVv;
	Tue, 23 Dec 2025 19:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519215;
	bh=GSvJUVxs8V0DeHgPED5wJ6OeDfsxhUhI5sRmm/TDJXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FgE4WWJx0SjrBWAAVdTVP0gnIg3EgFuH9/MebdkJ3+/eR0ZSHdUrHaU11r+uzKqfK
	 5rISNzDQ1sfbvJunA9G1CaSW4Hyd1cfe8k7nvMOgIRq0e0x3DlRjgb+oF1Ow3MmDci
	 cRKSDvTnjft6GhizVnVUTiITnzEeCRCflsTRoyIkW8f9fz7/NHtJ402+njIdUxckrR
	 DFLYYLq3DGDUScM/P7fS3sdLQ6wHsWxqxv4i8RbkuUctYy1kru715ZmkEOqusdVNEG
	 4qv/MI5SGDLA3p43KUx0WJxUmvfk63g46k1HwyJPQPr8AVKeh9nRL59PB/P6JMEwAF
	 aQbhSBcf9Pq7g==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACFEE17E151B;
	Tue, 23 Dec 2025 20:46:49 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:46 -0300
Subject: [PATCH 05/11] drm/mediatek: ovl: Implement support for Inverse
 Gamma
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-5-0cb99bd0ab33@collabora.com>
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
X-CRM114-CacheID: sfid-20251223_114658_276941_78F1F5D7 
X-CRM114-Status: GOOD (  16.13  )
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
functions for each layer through the Inverse Gamma setting. Available
functions are scRGB and BT.709. Implement support for it and expose it
as a colorop through the DRM plane color pipeline uAPI.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 169 ++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index e0c30c6c7cc8..fde31e3fcc4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -115,6 +115,7 @@ void mtk_ovl_disable_vblank(struct device *dev);
 u32 mtk_ovl_get_blend_modes(struct device *dev);
 const u32 *mtk_ovl_get_formats(struct device *dev);
 size_t mtk_ovl_get_num_formats(struct device *dev);
+int mtk_ovl_plane_colorops_init(struct device *dev, struct drm_plane *plane);
 bool mtk_ovl_is_afbc_supported(struct device *dev);
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index cfc6a3154f73..4eaa31541ccc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -4,8 +4,11 @@
  */
 
 #include <drm/drm_blend.h>
+#include <drm/drm_colorop.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 
 #include <linux/clk.h>
 #include <linux/component.h>
@@ -47,6 +50,12 @@
 #define OVL_CON_CLRFMT_BIT_DEPTH(depth, n)		((depth) << (4 * (n)))
 #define OVL_CON_CLRFMT_8_BIT				(0)
 #define OVL_CON_CLRFMT_10_BIT				(1)
+#define DISP_REG_OVL_WCG_CFG1			0x2d8
+#define IGAMMA_EN(layer)				BIT(0 + 4 * (layer))
+#define DISP_REG_OVL_WCG_CFG2			0x2dc
+#define IGAMMA_MASK(layer)				GENMASK((layer) * 4 + 1, (layer) * 4)
+#define IGAMMA_SCRGB					0
+#define IGAMMA_BT709					1
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -492,6 +501,91 @@ static void mtk_ovl_afbc_layer_config(struct mtk_disp_ovl *ovl,
 	}
 }
 
+static int mtk_ovl_colorop_curve_to_reg_val(enum drm_colorop_curve_1d_type curve)
+{
+	switch (curve) {
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return IGAMMA_SCRGB;
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return IGAMMA_BT709;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void mtk_ovl_apply_igamma(struct mtk_disp_ovl *ovl, unsigned int idx,
+				 struct drm_colorop *colorop,
+				 struct cmdq_pkt *cmdq_pkt)
+{
+	int curve_reg_val;
+
+	if (colorop->state->bypass) {
+		/* igamma curve needs to be set to default when igamma is disabled */
+		curve_reg_val = IGAMMA_SCRGB;
+	} else {
+		curve_reg_val = mtk_ovl_colorop_curve_to_reg_val(colorop->state->curve_1d_type);
+		if (curve_reg_val < 0) {
+			drm_WARN(ovl->crtc->dev, 1,
+				 "Invalid curve 1d type %u\n",
+				 colorop->state->curve_1d_type);
+			return;
+		}
+	}
+
+	mtk_ddp_write_mask(cmdq_pkt,
+			   field_prep(IGAMMA_MASK(idx), curve_reg_val),
+			   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_WCG_CFG2,
+			   IGAMMA_MASK(idx));
+
+	mtk_ddp_write_mask(cmdq_pkt,
+			   colorop->state->bypass ? 0 : IGAMMA_EN(idx),
+			   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_WCG_CFG1,
+			   IGAMMA_EN(idx));
+}
+
+static void mtk_ovl_apply_colorop(struct mtk_disp_ovl *ovl, unsigned int idx,
+				  struct drm_colorop *colorop,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		mtk_ovl_apply_igamma(ovl, idx, colorop, cmdq_pkt);
+		break;
+	default:
+		drm_WARN(ovl->crtc->dev, 1, "Invalid colorop type %u\n", colorop->type);
+		break;
+	}
+}
+
+static void mtk_ovl_disable_colorops(struct mtk_disp_ovl *ovl, unsigned int idx,
+				     struct cmdq_pkt *cmdq_pkt)
+{
+	mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
+			   DISP_REG_OVL_WCG_CFG1,
+			   IGAMMA_EN(idx));
+
+	/* igamma curve needs to be set to default when igamma is disabled */
+	mtk_ddp_write_mask(cmdq_pkt, IGAMMA_SCRGB, &ovl->cmdq_reg, ovl->regs,
+			   DISP_REG_OVL_WCG_CFG2, IGAMMA_MASK(idx));
+}
+
+static void mtk_ovl_apply_colorops(struct mtk_disp_ovl *ovl, unsigned int idx,
+				   struct mtk_plane_state *state,
+				   struct cmdq_pkt *cmdq_pkt)
+{
+	if (!ovl->data->supports_plane_colorops)
+		return;
+
+	if (!state->base.color_pipeline) {
+		mtk_ovl_disable_colorops(ovl, idx, cmdq_pkt);
+		return;
+	}
+
+	for (struct drm_colorop *colorop = state->base.color_pipeline; colorop;
+	     colorop = colorop->next)
+		mtk_ovl_apply_colorop(ovl, idx, colorop, cmdq_pkt);
+}
+
 void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			  struct mtk_plane_state *state,
 			  struct cmdq_pkt *cmdq_pkt)
@@ -513,6 +607,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
+	mtk_ovl_apply_colorops(ovl, idx, state, cmdq_pkt);
+
 	con = mtk_ovl_fmt_convert(ovl, state);
 	if (state->base.fb) {
 		con |= state->base.alpha & OVL_CON_ALPHA;
@@ -593,6 +689,79 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
 	writel(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 }
 
+static const struct drm_colorop_funcs mtk_ovl_colorop_funcs = {
+	.destroy = drm_colorop_destroy,
+};
+
+static const u64 igamma_supported_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
+
+#define MAX_COLOR_PIPELINE_OPS 3
+
+static int
+mtk_ovl_initialize_plane_color_pipeline(struct drm_plane *plane,
+					struct drm_prop_enum_list *pipeline)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	int i = 0;
+	int ret;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1st op: OVL's Inverse Gamma */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      &mtk_ovl_colorop_funcs,
+					      igamma_supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto err_colorop_init;
+
+	pipeline->type = ops[0]->base.id;
+	pipeline->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
+
+	return 0;
+
+err_colorop_init:
+	kfree(ops[i]);
+
+err_alloc:
+	i--;
+	for (; i >= 0; i--) {
+		drm_colorop_cleanup(ops[i]);
+		kfree(ops[i]);
+	}
+
+	return ret;
+}
+
+int mtk_ovl_plane_colorops_init(struct device *dev, struct drm_plane *plane)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	struct drm_prop_enum_list pipeline = {};
+	int ret;
+
+	if (!ovl->data->supports_plane_colorops)
+		return 0;
+
+	ret = mtk_ovl_initialize_plane_color_pipeline(plane, &pipeline);
+	if (ret)
+		return ret;
+
+	ret = drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
+
+	kfree(pipeline.name);
+
+	return ret;
+}
+
 static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
 			     void *data)
 {

-- 
2.51.0


