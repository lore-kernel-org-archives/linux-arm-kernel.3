Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DCECD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRiBGQ2QPdeyt3UQcFiASOhwWyz97F1JtdNHI4C4Guw=; b=uL/3QYTu0UoVXNaHKzG2zzWT2T
	QyK+zYB2VP6XXDMzWldXRokGGNeK6p93bypzIjlj3UGvRAZ1+2ozESHe9o4SBMdvyC9X+/DDIqoLU
	ScutW/4M70cGo/dPpGgglggGpEFcYy80Dw3Ynmc/zJdJvkQwq05wGLr3vFCYLhF3QcdisDmbqVKOy
	mDOZ2sgLPJrpvWVopujg4H3bDZ3hG4vJTOA4N3I9nuczygwo5NlmlPLxx0GkZynXEHuKKKqOyZC4g
	+h3/wE/0pM9Onxs1dXGZnN/YUjVIe9hDRbUO6/eLHgMMEHwHFlu2T+aIsxMqxlGEbdw6vM4uHbYUN
	7BfE5PaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmum-00000009TOE-0ips;
	Sat, 09 May 2026 19:00:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuf-00000009TGe-216Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso28572405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353232; x=1778958032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRiBGQ2QPdeyt3UQcFiASOhwWyz97F1JtdNHI4C4Guw=;
        b=YVIQzN4t5nlZSENGr74s6lAQ027lrE3r4usXD2WT/9SO31SjkDEEcOm/Nd5+iCTZG1
         y3fjq/8X87hyZQYJCwq9TL5z6l2PPaHF1jCO5MiefTNaavUtnirOoLCbx24iiveflrAt
         RYsV5m13Yqqll//b1bp8uSkEOIy+zon1ffOIWP6TnpoLLAh5gjQf+d6i0yk/NMNPiisw
         neOW3lcKV9xTtr8iXUN98JQOfWXzHcRWwYOaobyZvNim68tLZar7NfIU4Ku4u6s1xQlI
         tdPM1qpp6WFkVKC0oZMqbspgEiMmEXVp/eNWc59TnlWjXE6UlDeWBWuc4yGgYgdIi2u1
         u+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353232; x=1778958032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dRiBGQ2QPdeyt3UQcFiASOhwWyz97F1JtdNHI4C4Guw=;
        b=hF9EwC8FMWGO5ASnRm4HacZ++TZw0Et4VVGe8j3JruBMxNtYC32HdjrbixtNxBlkKQ
         Yi8tH1usEzBcx7JMMWUnh7A4JwWUKHiATLiKqqo183k2ZckeEYWUQyXwVkA0dohLy+B6
         zBnGQJ/0oVW+1tigSTEWK1+vZ2LRgbqzQyZOP4W5+4zLSgM1ejTG+c9QFrmxNywlrgfe
         6OxvTav7lzn4gSx5ARE1iiTjwVOeY2q0LM2f/8GSXvslZ/+a3HTlD95YsjRD8tR5fYhy
         rGuLx5hpzg9lPjnGUBXrmvEMKQdjC5Kv51jHFrLeai5jqcxLmprSVk1gGJvwv5wq21x5
         04cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Vl1EegLW91fCaW5drQZ+Led5+Uy6C6AuDJ2tQYL8ivZjZP64fYMm5mTyjF+LthNCVMYyisvazaqZ/B0c/3KZQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzMaLCzHW5W33bue0hBMIenzuv4rwEVNjNdv7AhMmVO0h/CM01
	tWyW9Q8e8ZCJkNJoiUQPp3UsZnGYpUcc9ds9wkSCv1c0lTbQBncVxAfI
X-Gm-Gg: Acq92OHCjBxZiEIQjUWVXOheeHxLPeFpaCHYln9j0LMse+YRJ75/S2fCHHBDwq2YTvu
	cxoNL9uApCrE/clckAeFmL5tobst1ehHcCScT4szkMqvE7B1yuPUnMQZqkAR+xENdLZok48NQFG
	xt/e3GlhQMGWD2KqsbgbryIsM9FNzHrFwdRGW53Fn2dAhFWDkvgE4AjZVGibf7uf44G18C7kVVJ
	Q3MugYRAjMNbeeKzDOTkHDKxu7V3sXGpl1w0kBag7HVmISr7HynBcTgCxP9yTEkR8YaN5UdZkUe
	y0DKOWVQv4JOjy/WdxCnAbOWL/865stcr5bl59y7vXJcLxuO7YylW9bEec4xpyhJB0nY4Db16/Y
	n5Ic8G7sq4QYpZfa4xLjMzbAv/3UtaLK6YLL7Zs2SMma/PxQSIDbjeIUQNw3XZUOfaWt/Lhl2Hg
	cwoqyANRouFTe7T6DQgcGPPE3nYx0S9z7dvbSKOj2vVyLG+rXUMFtQRS423adBkgPcd9s=
X-Received: by 2002:a5d:5d85:0:b0:454:86d:b4d2 with SMTP id ffacd0b85a97d-45689baa9b3mr4635330f8f.8.1778353231444;
        Sat, 09 May 2026 12:00:31 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:31 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 8/8] drm/sun4i: switch DE33 to new bindings
Date: Sat,  9 May 2026 21:00:15 +0200
Message-ID: <20260509190015.79086-9-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120033_600821_28E457A6 
X-CRM114-Status: GOOD (  23.43  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Now that everything is in place, switch DE33 to new bindings.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- remove CONFIG_DRM_SUN50I_PLANES guard
- fix error path

 drivers/gpu/drm/sun4i/sun8i_mixer.c | 131 +++++++++++++++-------------
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
 2 files changed, 72 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 4071ab38b4ae..957db0938455 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -25,6 +26,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
+#include "sun50i_planes.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -257,7 +259,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
-	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -294,16 +295,16 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 			     SUN8I_MIXER_COORD(x, y));
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 			     SUN8I_MIXER_SIZE(w, h));
 	}
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	if (mixer->cfg->de_type != SUN8I_MIXER_DE33)
@@ -318,7 +319,6 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
-	unsigned int phy_index;
 	int i;
 
 	planes = devm_kcalloc(drm->dev, plane_cnt + 1, sizeof(*planes), GFP_KERNEL);
@@ -333,12 +333,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = i;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[i];
-
 		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
-						i, phy_index, plane_cnt,
+						i, i, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -358,12 +354,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = index;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[index];
-
 		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
-						index, phy_index, plane_cnt,
+						index, index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
@@ -377,16 +369,22 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	return planes;
 }
 
+static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
+					     struct sunxi_engine *engine)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+
+	return sun50i_planes_setup(mixer->planes_dev, drm, engine->id);
+}
+
 static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
-	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
@@ -398,14 +396,14 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -418,8 +416,14 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.mode_set	= sun8i_mixer_mode_set,
 };
 
+static const struct sunxi_engine_ops sun50i_engine_ops = {
+	.commit		= sun8i_mixer_commit,
+	.layers_init	= sun50i_layers_init,
+	.mode_set	= sun8i_mixer_mode_set,
+};
+
 static const struct regmap_config sun8i_mixer_regmap_config = {
-	.name		= "layers",
+	.name		= "display",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
@@ -434,14 +438,6 @@ static const struct regmap_config sun8i_top_regmap_config = {
 	.max_register	= 0x3c,
 };
 
-static const struct regmap_config sun8i_disp_regmap_config = {
-	.name		= "display",
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
-	.max_register	= 0x20000,
-};
-
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -464,17 +460,14 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
-	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
+	struct regmap *top_regs;
 	int plane_cnt, i;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 		top_regs = mixer->top_regs;
-		disp_regs = mixer->disp_regs;
-	} else {
+	else
 		top_regs = mixer->engine.regs;
-		disp_regs = mixer->engine.regs;
-	}
 
 	/* Enable the mixer */
 	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
@@ -484,25 +477,25 @@ static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
 
 	/* Set background color to black */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(disp_regs,
+		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -533,7 +526,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer)
 		return -ENOMEM;
 	dev_set_drvdata(dev, mixer);
-	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
 	/*
@@ -566,6 +558,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		mixer->engine.ops = &sun50i_engine_ops;
+	else
+		mixer->engine.ops = &sun8i_engine_ops;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -588,17 +585,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			dev_err(dev, "Couldn't create the top regmap\n");
 			return PTR_ERR(mixer->top_regs);
 		}
-
-		regs = devm_platform_ioremap_resource_byname(pdev, "display");
-		if (IS_ERR(regs))
-			return PTR_ERR(regs);
-
-		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
-							 &sun8i_disp_regmap_config);
-		if (IS_ERR(mixer->disp_regs)) {
-			dev_err(dev, "Couldn't create the disp regmap\n");
-			return PTR_ERR(mixer->disp_regs);
-		}
 	}
 
 	mixer->reset = devm_reset_control_get(dev, NULL);
@@ -638,6 +624,34 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	clk_prepare_enable(mixer->mod_clk);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		struct platform_device *pdev;
+		struct device_node *np;
+		void *data;
+
+		np = of_parse_phandle(dev->of_node, "allwinner,planes", 0);
+		if (!np) {
+			ret = -ENODEV;
+			goto err_disable_mod_clk;
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev) {
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+
+		data = platform_get_drvdata(pdev);
+		if (!data) {
+			put_device(&pdev->dev);
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+
+		mixer->planes_dev = &pdev->dev;
+	}
+
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
 	/* Reset registers and disable unused sub-engines */
@@ -672,6 +686,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	return 0;
 
+err_disable_mod_clk:
+	clk_disable_unprepare(mixer->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(mixer->bus_clk);
 err_assert_reset:
@@ -686,6 +702,9 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
 
 	list_del(&mixer->engine.list);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		put_device(mixer->planes_dev);
+
 	clk_disable_unprepare(mixer->mod_clk);
 	clk_disable_unprepare(mixer->bus_clk);
 	reset_control_assert(mixer->reset);
@@ -867,16 +886,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.lay_cfg = {
-		.de_type	= SUN8I_MIXER_DE33,
-		.scaler_mask	= 0xf,
-		.scanline_yuv	= 4096,
-	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.ui_num		= 3,
-	.vi_num		= 1,
-	.map		= {0, 6, 7, 8},
 };
 
 static const struct of_device_id sun8i_mixer_of_table[] = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index e2f83301aae8..7abc88c898d9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
 	int			ui_num;
 	unsigned int		de_type;
 	unsigned long		mod_rate;
-	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
@@ -216,7 +215,7 @@ struct sun8i_mixer {
 	struct clk			*mod_clk;
 
 	struct regmap			*top_regs;
-	struct regmap			*disp_regs;
+	struct device			*planes_dev;
 };
 
 enum {
@@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
-static inline struct regmap *
-sun8i_blender_regmap(struct sun8i_mixer *mixer)
-{
-	return mixer->cfg->de_type == SUN8I_MIXER_DE33 ?
-		mixer->disp_regs : mixer->engine.regs;
-}
-
 static inline u32
 sun8i_channel_base(struct sun8i_layer *layer)
 {
-- 
2.54.0


