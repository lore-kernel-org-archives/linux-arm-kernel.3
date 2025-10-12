Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A1BCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG8bmd+ZBK/ghOVMNjmCpTsnMqAGeyE2Wx03CRuhE1M=; b=VJv29X600jf1oVNe6gqRyrcQoo
	dvPRt3pBsaQeS4Wsa3SPvcKBmqI+TbavvG9Sm8Wq3dAF09rajxZ/m+1fBTJTK/2HSnficz1S1TZcE
	hnFpoEW23XtQeigUW4tA9ijcj+A1+vBULZnynWxu9RP3L3jlfY/nBYNzXEnVN8ubcpjlxwJIdglNW
	a1lyu9YtZNumChIC3rgvI9d3/YDLprH/EK0TCsuZu2LiCb/MsPvlCaCen6o/r8AtwPnJVu1916Evz
	DS/vqwy5D18H6woxH2/vTzxfnwYkyEy7hsbFD/Mhs5/4wbvp9ovEXZIiRoOcptkz7x0qM0RnS/zDk
	sXDyb6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fd-0000000Bfes-3MzP;
	Sun, 12 Oct 2025 19:23:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fZ-0000000BfYm-25xa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7322da8so36333466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297028; x=1760901828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG8bmd+ZBK/ghOVMNjmCpTsnMqAGeyE2Wx03CRuhE1M=;
        b=SqsOm00cSc/mzC3nWq7HB4VBOGaiNxeKNRn3RcVGd7ZgNWfNSgtO7h2PzMjDllbl5D
         L2eNimHgwp6wUW24wwecjfUzq6IaHM1VNuByMno7PETm7AZRDwYSEqSOaqtLyWomahrM
         DmI696AYDH9WW/8X4R5YtxLXf4ojm+lepRnTlyT0SU6oCfr8rf+vP6g1Gm5eQh11x/eJ
         P5MPtHH6tl1K1qHmQwDnOwG1tKFTJ0otvjPNAdWZ8LzsraWVfryuQeSO+OEmxMIpt3nD
         bKkCn01ElnERT+dJYenm9FovA61ROX2VT00yZGlskyYTKmkKmX04UZJrAzz/5h8ziwCv
         hcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297028; x=1760901828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG8bmd+ZBK/ghOVMNjmCpTsnMqAGeyE2Wx03CRuhE1M=;
        b=ZUJBldhO7w1cSiDtyJ7quokab1Z37/e2+SmGc4f/Uz0cWBHoCy5NatFEXEFXqueHdS
         2BgZ4KDrwgq5+yZLC+ooTDCdh1muaI8ln1sGNMfP4p5L9TKfJgTBmgrak2b73SeLGme5
         QyzF8ZCqDfsqbwf3TGcZKkhB0VJ/I3dw3fR7pwr/XYAV4akWCxSdBuH/R9Pmr5nPoNIZ
         hIJarUPD8848Jtw9F3tv/yTXiU4kpXrR0NhJ1ZYeBdOFvxhYtqb2vRAb/qXETwWcyMKj
         qTUWBBCOLYSPtg6y48Bq0Z0szZhbQpgL8Axn+3U8LIUl6vSBbCixGvoLR6SvPf5h3o2F
         6mBw==
X-Forwarded-Encrypted: i=1; AJvYcCU7zKHMgSvUXigwarV+rnSBPHwoTkSPvuUXzZrb7sPoMRseuEY4mH/RHJehKkjNkiFTBhmHaldJlY/UM8enkXUl@lists.infradead.org
X-Gm-Message-State: AOJu0YylIeuCdPiXNKIdc9HPdG+gZnafSwTHCKCqdXmiQ+kc2WF/mOqY
	TWtggxK6MA6yNH8esqaTm5pjCRTWvNEt7mAGxYwdXKsdMnFpE4UUvMti
X-Gm-Gg: ASbGncsqkSEZnC/8YSAeAnbuKRJI1IxCaLcRVtz9m42dKEVoX1iutoSfyKxOAnFlAsy
	tDm6pmi8zNibnXT6Iok+A2Bz6TWzUlUmpKpPnFLWJylmQQTmn6uzAQiFXbhvCTQjkxnRm0FNN/w
	IErNwRFKD59zYMLhcaBktsqGOdn53V4wz5CQG3sk+whLgLjmJa+2oc+PJRbGde+CGEEEsb72b9t
	m5OOYW11PZdUGdqztBeL1pSG6oZ4tnx0p5lHZb90a2LlaAeYjFfEonDyn/wC7VotNChRVT2MjyM
	OxEsphMkgPMy5JeCDSQUFhgv40HEW7CDCiHVD0KN10iJySRWqKs5wn8tj2z/XmycCc8Mc32ECFm
	Eus7qrjm7LNIfPIo15YQmVlNfUUbJ5sh0RCCYobW8B/aOHqACKEavwpwaiXxgH7hIq9gLV2hBN6
	zgG22isOZFOrfL3Fj4B144vkAKpsvBF9g=
X-Google-Smtp-Source: AGHT+IEDIL5NJwC44TfJ1I5nI96VrWmynMGreSQjJO21/d5ma6GdYAfY8ReIx6RrzS2f3OpOdrWl4g==
X-Received: by 2002:a17:906:ef04:b0:b3c:8b25:ab74 with SMTP id a640c23a62f3a-b50aa393c32mr2123217066b.10.1760297027731;
        Sun, 12 Oct 2025 12:23:47 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:47 -0700 (PDT)
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
Subject: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Sun, 12 Oct 2025 21:23:07 +0200
Message-ID: <20251012192330.6903-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122349_580893_7FB678B6 
X-CRM114-Status: GOOD (  13.50  )
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

With upcoming DE33 support, layer management must be decoupled from
other operations like blender configuration. There are two reasons:
- DE33 will have separate driver for planes and thus it will be harder
  to manage different register spaces
- Architecturaly it's better to split access by modules. Blender is now
  exclusively managed by mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 17 ++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 22 +++-------------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 22 +++-------------------
 3 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index f7f210a925f8..a3194b71dc6d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -283,8 +283,8 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 
 	drm_for_each_plane(plane, state->dev) {
 		struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
+		int w, h, x, y, zpos;
 		bool enable;
-		int zpos;
 
 		if (!(plane->possible_crtcs & drm_crtc_mask(crtc)) || layer->mixer != mixer)
 			continue;
@@ -295,10 +295,14 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 
 		enable = plane_state->crtc && plane_state->visible;
 		zpos = plane_state->normalized_zpos;
+		x = plane_state->dst.x1;
+		y = plane_state->dst.y1;
+		w = drm_rect_width(&plane_state->dst);
+		h = drm_rect_height(&plane_state->dst);
 
-		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d\n",
+		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d x=%d y=%d w=%d h=%d\n",
 				 plane->base.id, layer->channel, layer->overlay,
-				 enable, zpos);
+				 enable, zpos, x, y, w, h);
 
 		/*
 		 * We always update the layer enable bit, because it can clear
@@ -312,6 +316,13 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		/* Route layer to pipe based on zpos */
 		route |= layer->channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
+
+		regmap_write(bld_regs,
+			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
+			     SUN8I_MIXER_COORD(x, y));
+		regmap_write(bld_regs,
+			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
+			     SUN8I_MIXER_SIZE(w, h));
 	}
 
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8baa1d0b53bd..12c83c54f9bc 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -47,21 +47,17 @@ static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane,
-					unsigned int zpos)
+					int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	u32 src_w, src_h, dst_w, dst_h;
-	struct regmap *bld_regs;
-	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
+	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
 			 channel, overlay);
 
-	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -113,17 +109,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		else
 			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
-
-	/* Set base coordinates */
-	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
-			 state->dst.x1, state->dst.y1);
-	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
-		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
-		     outsize);
 }
 
 static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
@@ -230,14 +215,13 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
+				    layer->overlay, plane);
 	sun8i_ui_layer_update_alpha(mixer, layer->channel,
 				    layer->overlay, plane);
 	sun8i_ui_layer_update_formats(mixer, layer->channel,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index dae6f83cea6e..1f4fa63ef153 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -49,25 +49,21 @@ static void sun8i_vi_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane,
-					unsigned int zpos)
+					int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
 	u32 src_w, src_h, dst_w, dst_h;
-	struct regmap *bld_regs;
-	u32 bld_base, ch_base;
 	u32 outsize, insize;
 	u32 hphase, vphase;
 	u32 hn = 0, hm = 0;
 	u32 vn = 0, vm = 0;
 	bool subsampled;
+	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
 			 channel, overlay);
 
-	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
@@ -180,17 +176,6 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_VDS_UV(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(vn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
-
-	/* Set base coordinates */
-	DRM_DEBUG_DRIVER("Layer destination coordinates X: %d Y: %d\n",
-			 state->dst.x1, state->dst.y1);
-	DRM_DEBUG_DRIVER("Layer destination size W: %d H: %d\n", dst_w, dst_h);
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
-		     SUN8I_MIXER_COORD(state->dst.x1, state->dst.y1));
-	regmap_write(bld_regs,
-		     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
-		     outsize);
 }
 
 static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
@@ -350,14 +335,13 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	unsigned int zpos = new_state->normalized_zpos;
 	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane, zpos);
+				    layer->overlay, plane);
 	sun8i_vi_layer_update_alpha(mixer, layer->channel,
 				    layer->overlay, plane);
 	sun8i_vi_layer_update_formats(mixer, layer->channel,
-- 
2.51.0


