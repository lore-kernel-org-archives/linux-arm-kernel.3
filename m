Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FD3CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEur3eg0WxHhimUwBT77oBMDrloZhIqqu554ATZTSIU=; b=nmx41NAdu+TmaELVXPNuuwxdqB
	QKJkzSbgIWX+7QYsW4N6tobGDW9TkPN2PXJSEWW95W8wq/8YdEv9sOvoMwdP5isg/zDEynVifdDB1
	xbu+1sFRz+vyH4gTdf3CN2DMDTQpCyLJSHeOV7BpJmJ80gwr5l9opdhkaSzKMNaYdYeXi8nKRiuV1
	FIoIMPV6oehOspnS2uYwVUzOCzE+TMp4Y5VhhP2csDGISfIs2+niNt91DMdGg9lcwo+u8H4dofE3/
	dsKtC/tqU8EyjGQZlVZOso45ZFYALCc4kgeI2HjY3mRzrlei/Xu6rPFzgRtnGQl5Dg/D6nvUQK4NO
	1iX+48AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gY-0000000Bh4V-2iZA;
	Sun, 12 Oct 2025 19:24:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81g0-0000000BgB1-231g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:21 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3e44f22f15so514486466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297053; x=1760901853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEur3eg0WxHhimUwBT77oBMDrloZhIqqu554ATZTSIU=;
        b=i8y00KzVO7uUXfTRWcl7XypwY/PazpKJ3Maj8M2gR/DLfa9XxwDNNRsKm/x5HWqij9
         5cm3egLoDoaRwvXrSOShGI6TLr7S7xPAgaKK9diJ+ImmDFjb+z5TsGLx4av3Jv/1MMtv
         PocT1uioIWkyN0KJnYX8qg4fVEqmF2OxjxvcINMB1ykE6hgJvTeIbIPWvrKUPBmL5i1p
         xHR/xzwMoIisCkPq/Kq0yIFh0ZNZeUkAftCzzWSKcd+zF8s8+I2jm5EviaPFuQiupWbU
         ihbPie2H/1W3SQRZsYQsZ10ETDLqxxev8bE4qM/IO2dT/mB0zKIVnnfBqaqzz7Lgwr2H
         Tbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297053; x=1760901853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEur3eg0WxHhimUwBT77oBMDrloZhIqqu554ATZTSIU=;
        b=hSC/q1xwMu4gOEfbueDot6cOVH96YpF/gB5lrrg5X+pjEtPmbSPdQbYBPQGF8UD1JM
         29Bjc5i9g8PtyPZr29AwKt4jvWFkGBM9WuKy8jjdbt/FdX7x6l4S7TgfkmvqbwRfOEkL
         5NZDFq+iq8yXeHqvc+lgUJMwETE3BioYd3MiyI9E30gaHIZdb6xu3+Zp8aUY9lsUym1l
         1WDb4DeXtDdMcYshgOq0yV0CJTki6JPk8eVE7r4LPUQLpzeHeliqaUxsy401VlLNizNl
         yzk9yXm3B+4ooBb4EcE7nDqrhg9xxdogAzQQv6SNIGTtshaNqp/C4AwGJ/fsRhbqxly1
         fpVw==
X-Forwarded-Encrypted: i=1; AJvYcCUd2w8ntXKZddhbwEZ8iq5J4vM+pKwjitQ4Gb5fXucOVY21llZDw/o9q8LmJ0O3zboR6MMktFVGr0c8w3rfv5fM@lists.infradead.org
X-Gm-Message-State: AOJu0YySR7ZbnQI/cYFoTyeO2MRa+A5SoLzVAaqx2zQPUF/NIPZISdh6
	Pgy5zU3JdApnd1sgLKSBoWPWwBMwkKjMrj5WGooRBFqdve+GLgjNtkS4
X-Gm-Gg: ASbGncuH20Ox7uQHw1oPXuxtRZzxHwrWIdZOz4ls7+soBuyZu+zmABKKMx/agqpj0iL
	bMY2/VItXrsvFV1CBtky6AWcwRoY0KHhv2I0KWr2Wsl0+HPn4Ee1D6jy2uj09AD9M7HgjWAz5Qj
	0aZxP/6kFtP9VNGiB3tYXjIWYl9UXwsHWZJ6ULWCISLPaj3t6EtkhVN/50ZoV+D0hYFdemuQQ7D
	loFAY2Evh+2WYW88f7D1XKQ0iBVi1p8OXTV73kJDL/RRbofeyZb5hL5VRgETIOYK5ivmVY5VW0j
	hO2bwnsI9669oGX5SvqD4E+5rlIk/YR+EuNIiSqrG660yQvUIkYPWRLfONXxuMkMRQQdROWG+fz
	ohbMx7ojRwCzd7RvbhInC9xwywEaJgnQV9jJD/6vQp6KC1Fc1REEH+ENxcUJwfHYLS0DhGNXQsB
	wJElr+YVZInCJMoPVFaNLu
X-Google-Smtp-Source: AGHT+IHHuFPEO5bRJtmX+wIbazQ9iUtA2JClYO8n4N9bsYlSgFBEHJB1cpM0BM4TFWJSTf5vGjjwxg==
X-Received: by 2002:a17:907:7251:b0:b3d:d6be:4ca5 with SMTP id a640c23a62f3a-b50a9a6cb5amr1846998566b.1.1760297052910;
        Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:12 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 28/30] drm/sun4i: layer: replace mixer with layer struct
Date: Sun, 12 Oct 2025 21:23:28 +0200
Message-ID: <20251012192330.6903-29-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122416_839887_737E3065 
X-CRM114-Status: GOOD (  20.20  )
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

This allows to almost completely decouple layer code from mixer. This is
important for DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c       |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c     |  6 +++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h     | 27 ++++++++++-----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 24 +++++++++----------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 16 ++++++-------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 31 ++++++++++++-------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 19 +++++++--------
 9 files changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 30779db2f9b2..ce81c12f511d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -233,14 +233,14 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type == SUN8I_MIXER_DE3) {
 		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[layer->mixer->cfg->lay_cfg.ccsc][layer->channel];
+	base = ccsc_base[layer->cfg->ccsc][layer->channel];
 
 	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index a01eccfca3a9..10e40ec9a67a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -338,7 +338,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 
 		layer = sun8i_vi_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, i,
-						phy_index, plane_cnt);
+						phy_index, plane_cnt,
+						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -363,7 +364,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 
 		layer = sun8i_ui_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, index,
-						phy_index, plane_cnt);
+						phy_index, plane_cnt,
+						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 8629e21f9cf6..52d1b40ab71e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -224,13 +224,14 @@ enum {
 };
 
 struct sun8i_layer {
-	struct drm_plane	plane;
-	struct sun8i_mixer	*mixer;
-	int			type;
-	int			index;
-	int			channel;
-	int			overlay;
-	struct regmap		*regs;
+	struct drm_plane		plane;
+	struct sun8i_mixer		*mixer;
+	int				type;
+	int				index;
+	int				channel;
+	int				overlay;
+	struct regmap			*regs;
+	const struct sun8i_layer_cfg	*cfg;
 };
 
 static inline struct sun8i_layer *
@@ -259,14 +260,14 @@ sun8i_blender_regmap(struct sun8i_mixer *mixer)
 }
 
 static inline u32
-sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
+sun8i_channel_base(struct sun8i_layer *layer)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return DE33_CH_BASE + channel * DE33_CH_SIZE;
-	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
-		return DE3_CH_BASE + channel * DE3_CH_SIZE;
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33)
+		return DE33_CH_BASE + layer->channel * DE33_CH_SIZE;
+	else if (layer->cfg->de_type == SUN8I_MIXER_DE3)
+		return DE3_CH_BASE + layer->channel * DE3_CH_SIZE;
 	else
-		return DE2_CH_BASE + channel * DE2_CH_SIZE;
+		return DE2_CH_BASE + layer->channel * DE2_CH_SIZE;
 }
 
 int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f71f5a8d0427..dc4298590024 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -27,10 +27,9 @@
 
 static void sun8i_ui_layer_disable(struct sun8i_layer *layer)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
-	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
+	u32 ch_base = sun8i_channel_base(layer);
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
@@ -38,11 +37,10 @@ static void sun8i_ui_layer_update_attributes(struct sun8i_layer *layer,
 					     struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 	fmt = state->fb->format;
 	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
@@ -61,7 +59,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -70,7 +67,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
 			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -102,7 +99,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
 			sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
 					      hscale, vscale, hphase, vphase,
 					      state->fb->format);
@@ -114,7 +111,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		if (layer->cfg->de_type == SUN8I_MIXER_DE33)
 			sun8i_vi_scaler_enable(layer, false);
 		else
 			sun8i_ui_scaler_enable(layer, false);
@@ -125,14 +122,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int bpp;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	/* Get the physical address of the buffer in memory */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
@@ -190,7 +186,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
+	if (layer->cfg->scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_UI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
@@ -266,7 +262,8 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt)
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg)
 {
 	struct sun8i_layer *layer;
 	int ret;
@@ -281,6 +278,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
+	layer->cfg = cfg;
 
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 9383c3364df3..c357b39999ff 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -54,5 +54,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt);
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 4d06c366de7f..a178da8f532a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -89,18 +89,18 @@ static const u32 lan2coefftab16[240] = {
 	0x0b1c1603, 0x0d1c1502, 0x0e1d1401, 0x0f1d1301,
 };
 
-static u32 sun8i_ui_scaler_base(struct sun8i_mixer *mixer, int channel)
+static u32 sun8i_ui_scaler_base(struct sun8i_layer *layer)
 {
-	int offset = mixer->cfg->lay_cfg.vi_scaler_num;
+	int offset = layer->cfg->vi_scaler_num;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+	if (layer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * offset +
-		       DE3_UI_SCALER_UNIT_SIZE * (channel - offset);
+		       DE3_UI_SCALER_UNIT_SIZE * (layer->channel - offset);
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
 		       DE2_VI_SCALER_UNIT_SIZE * offset +
-		       DE2_UI_SCALER_UNIT_SIZE * (channel - offset);
+		       DE2_UI_SCALER_UNIT_SIZE * (layer->channel - offset);
 }
 
 static int sun8i_ui_scaler_coef_index(unsigned int step)
@@ -129,10 +129,9 @@ static int sun8i_ui_scaler_coef_index(unsigned int step)
 
 void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	base = sun8i_ui_scaler_base(mixer, layer->channel);
+	base = sun8i_ui_scaler_base(layer);
 
 	if (enable)
 		val = SUN8I_SCALER_GSU_CTRL_EN |
@@ -147,12 +146,11 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 insize, outsize;
 	int i, offset;
 	u32 base;
 
-	base = sun8i_ui_scaler_base(mixer, layer->channel);
+	base = sun8i_ui_scaler_base(layer);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 0286e7322612..afe38ea03beb 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -20,10 +20,9 @@
 
 static void sun8i_vi_layer_disable(struct sun8i_layer *layer)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
-	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
+	u32 ch_base = sun8i_channel_base(layer);
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
@@ -31,11 +30,10 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 					     struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 	fmt = state->fb->format;
 	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
@@ -43,7 +41,7 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 	if (!fmt->is_yuv)
 		val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_RGB_MODE;
 	val |= SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN;
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		val |= SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA(state->alpha >> 8);
 		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
@@ -53,7 +51,7 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 
-	if (mixer->cfg->lay_cfg.de2_fcc_alpha) {
+	if (layer->cfg->de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
@@ -77,7 +75,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
 			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -152,7 +150,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		}
 
 		/* it seems that every RGB scaler has buffer for 2048 pixels */
-		scanline = subsampled ? mixer->cfg->lay_cfg.scanline_yuv : 2048;
+		scanline = subsampled ? layer->cfg->scanline_yuv : 2048;
 
 		if (src_w > scanline) {
 			DRM_DEBUG_DRIVER("Using horizontal coarse scaling\n");
@@ -194,7 +192,6 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *gem;
@@ -203,7 +200,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 	u32 ch_base;
 	int i;
 
-	ch_base = sun8i_channel_base(mixer, layer->channel);
+	ch_base = sun8i_channel_base(layer);
 
 	/* Adjust x and y to be dividable by subsampling factor */
 	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
@@ -278,7 +275,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
 
-	if (layer->mixer->cfg->lay_cfg.scaler_mask & BIT(layer->channel)) {
+	if (layer->cfg->scaler_mask & BIT(layer->channel)) {
 		min_scale = SUN8I_VI_SCALER_SCALE_MIN;
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
@@ -414,7 +411,8 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt)
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg)
 {
 	u32 supported_encodings, supported_ranges;
 	unsigned int format_count;
@@ -432,8 +430,9 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
+	layer->cfg = cfg;
 
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
@@ -452,7 +451,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->lay_cfg.de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de2_fcc_alpha || layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
@@ -469,7 +468,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
 			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3)
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
 		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 89d0c32e63cf..6ec68baa2409 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -59,5 +59,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
 					    int index, int phy_index,
-					    int plane_cnt);
+					    int plane_cnt,
+					    const struct sun8i_layer_cfg *cfg);
 #endif /* _SUN8I_VI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index fe0bb1de6f08..3dec4eeb1ba2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -833,17 +833,17 @@ static const u32 bicubic4coefftab32[480] = {
 	0x1012110d, 0x1012110d, 0x1013110c, 0x1013110c,
 };
 
-static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
+static u32 sun8i_vi_scaler_base(struct sun8i_layer *layer)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33)
 		return DE33_VI_SCALER_UNIT_BASE +
-		       DE33_CH_SIZE * channel;
-	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+		       DE33_CH_SIZE * layer->channel;
+	else if (layer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
-		       DE3_VI_SCALER_UNIT_SIZE * channel;
+		       DE3_VI_SCALER_UNIT_SIZE * layer->channel;
 	else
 		return DE2_VI_SCALER_UNIT_BASE +
-		       DE2_VI_SCALER_UNIT_SIZE * channel;
+		       DE2_VI_SCALER_UNIT_SIZE * layer->channel;
 }
 
 static int sun8i_vi_scaler_coef_index(unsigned int step)
@@ -914,7 +914,7 @@ void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
 	u32 val, base;
 
-	base = sun8i_vi_scaler_base(layer->mixer, layer->channel);
+	base = sun8i_vi_scaler_base(layer);
 
 	if (enable)
 		val = SUN8I_SCALER_VSU_CTRL_EN |
@@ -931,12 +931,11 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 chphase, cvphase;
 	u32 insize, outsize;
 	u32 base;
 
-	base = sun8i_vi_scaler_base(mixer, layer->channel);
+	base = sun8i_vi_scaler_base(layer);
 
 	hphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
@@ -960,7 +959,7 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 		cvphase = vphase;
 	}
 
-	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		u32 val;
 
 		if (format->hsub == 1 && format->vsub == 1)
-- 
2.51.0


