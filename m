Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE2CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGi+vdnTcOUyDYZpLxnZDrsIWdYfcQsWdysVijdDOkg=; b=43c/MKVqPVejV71ljEiia2Fo7a
	16QN2kVNkFZPiHbyQPR0snnmhCjKcVQoac0xTzLxYXKrdOPTosPzJ+awrEa1AiOIF7Rur3GBubLtx
	L/pSq0SiB7iEOLTt1/bDvyzNlWoYspg4UT2N9T5l0CHD9c8etp483eAHZlox3nJa6oKXvIr8+S9G6
	z9/BepZLQqlFyIpJZOyIBobygONWfOoojoq4vinn+QItKwhooGr900BIuFKiT12gomJcB5zggRW4o
	6Ou8ECFmTQII0jWoNx4Plc2N9TfIfDLN9zrfUucQkqP0k0o2hkdxcz9nqX3sDGX3KjADK5B2JMM2I
	UJMClvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUq-0000000CMUB-075R;
	Tue, 04 Nov 2025 18:11:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUN-0000000CLn5-3Raw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477442b1de0so20307645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279837; x=1762884637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGi+vdnTcOUyDYZpLxnZDrsIWdYfcQsWdysVijdDOkg=;
        b=XTzK7FHnED/J3Odn8X2fHTpR5IKf3+/aejPvAtnbr765ddJA/zPf0pHNUp89bpBFe2
         32bPzAvC3psfG3xmU1PS9UekGWX8rTXMEF2EhgNXkWyQ6TmXU4koKcRl+PPRGm8zHk5T
         yHmWqC6yoImwrVlT5TaG+lWvKhk2/KQ2LMqO9a+BlUd8QX5h/EYtqjjtjw3ADBiyjkv7
         Zvsm/HzIRviLKuV6Ibp0Es691u6UFddk0W6VmxYnrVgD/8GcQUVlYZ6F4XoTGlV2GJ32
         nxJu4BYb427iInzr7Nl0ANHtZZBpEcnAyyHLSGeMtQ8LCAX9uq2A0FG8+FvgpiDrvVk+
         wduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279837; x=1762884637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGi+vdnTcOUyDYZpLxnZDrsIWdYfcQsWdysVijdDOkg=;
        b=gsH7wjagngBRyFXCd9+K6k/upSNTBNrg5S12GgeVKMfRwnFXl+exsgOIVWquEnliMv
         d/FM6w+oDhSHlNKvFXGsF9MrVDD63PWVNoG4ajJjwCPaDVe9pYKK9UvabbvZsaw4oNPY
         SZ45Jm2js2ca/OT2uVEPztukqSwkRCgTwGTI6sVj+Uo35zPsP28PlEV5xoHpg8Z6DYPQ
         K32J1R8GMvQw9JbqL16gmY6YBK+KPFJ0ZzSeuk4ALHOfD81tgE7Y7d6Aak7e4Q8Vh++O
         arpRqV5ea1CoWoM5ApsyMMUiSDhVDGZzoCYZjgeTNBCuJFRHx3WQNRcWcjep4rSmgtYb
         /Mhg==
X-Forwarded-Encrypted: i=1; AJvYcCVwn2JRUGTzBXGJ/Nbwn4PqcoNs1GAxf+Y09uqxKwYBwt9UaZL3uUtiW+Rgve7liiKjiUkLC+gzLyh4qZPFRNfr@lists.infradead.org
X-Gm-Message-State: AOJu0YylvyKZItLy6l+WI1/DmExSC/cHdi6b6aUBT15zgt3yJRI05h9U
	oYyhQbCqY2cP+OoH+JjJx++bkz48/h91PmiDJEa/Indr2iMu79RrZUrw
X-Gm-Gg: ASbGncvdDQtMqsYTiRDR8MPmpmQma0vmuxwFfo+4O0/sMuoFe3chd8TtXpxsd6EPJtk
	8Suhyb1z8IgiTzi1jgvMstnGXgIw3EcUQc85VxXTzX5jKTQ3bVS36fzb6fgVWwAbFClRTUY7BSh
	yiyy/UigK6hiYi9dJTHYIaWJ8+4KZZk+p2Z3UcJAx2JKng8ZhqT65aKo7H5dPqSBhEUj+jniuxD
	AuevZSXTDhgupQAiLnA2i7Y5kbrZfBRF3gPgjpzOyJi9WZ4bkFb6RStdDzCHNSqf0wLGlZEmXX0
	a43baT0dwNin2Q4XWr8tJy8kHnuN22W3Mwv7kxrYNLO/vEFXWBCbBZ6exoel3X3yJj5PWJHnztj
	9Scy4vKtH6zfYXktoYS3b6jt5gtR9GezALMyIcvkKZKKc+C4qN7LpKv+MrlbmCyEIy+/zNr5zkV
	DokLspVbQl7mzci2JJ3fmhmewMLYUY
X-Google-Smtp-Source: AGHT+IHIwFu5ZH0/QDn36lvi+N0EaA4mwC2bsFB40ThRoEib3Q1pusV/RILcIs1eoSSs5+dZbwnBew==
X-Received: by 2002:a05:600c:3f0c:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-4775cdf4413mr1867405e9.24.1762279837126;
        Tue, 04 Nov 2025 10:10:37 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:36 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 28/30] drm/sun4i: layer: replace mixer with layer struct
Date: Tue,  4 Nov 2025 19:09:40 +0100
Message-ID: <20251104180942.61538-29-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101040_804397_7B78EB2D 
X-CRM114-Status: GOOD (  20.79  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
index 4559e959a32d..50fc20100c90 100644
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
index 5b6068755ad1..3948023e095b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -225,13 +225,14 @@ enum {
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
@@ -260,14 +261,14 @@ sun8i_blender_regmap(struct sun8i_mixer *mixer)
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
2.51.2


