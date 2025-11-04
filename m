Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F98CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3EV/MxibVMeuKGvb6vWmFsIs3Yu10QpUHip3gqCW54=; b=QKvV2zEViXTl1pQ2xU0AFCYxwb
	TyZFDCB1VcU8NVstnMOFqE0ocBL9MBq29WLS/dgdJkbZLS4OUIsCZaD0FPUb8qeBhUosRnhK4Gv1j
	4XSKpJnw8ph07SlJZ3YI8JWV7gyWTSS/xVZRygltuN/B9keJW99k9PqbFwT0+pedePGuTLJmhqdux
	tM2g2JlDjtMpJwAAlWNAElyT/3dAxWa4oqMlVmqTWWpSDMF8Sp8DsJREttb/k2UIC+Vb2Cne9+hUp
	LQ5QUu9HomsDwIWAze6zbCD2RpUzIvSpuax1vAlGuzi6IwMf9u6xxLU1EpWhfJooGaITzd/lMfq0l
	uUsia4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUK-0000000CLjD-08eI;
	Tue, 04 Nov 2025 18:10:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU9-0000000CLVI-2TDS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4710022571cso54539765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279824; x=1762884624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3EV/MxibVMeuKGvb6vWmFsIs3Yu10QpUHip3gqCW54=;
        b=GnGubfaCedwPI7DYApJ0lbrJd6DIpyfPmc9b4LQ2ZuTLf7Y4qn17hefAw38wHYM92a
         J2qLAH4bjCbzm0NZmF0DPh5827mUySwE7TNzP2RKJGBCtiGhNmYepYJ9bNiwumy/8cYZ
         458TQ9i3Nl1glQYO4tAzN2T7gBd8XfBs2zYKPhcPzJhTG94q4rQYl4oORQ8LySxmEnHf
         TMjYVpLmCm26xYN+ixRBksRHgL2CxC1ieqZAUm/U8ztaji1nKV7yjn5JMTQ5OWyUirN8
         OzeTu8xc7bYMhm1hw14tmxLw3Yr31z46NZiUeg0X1PBFsd5jM2RHpu1ZqbfBG98T37ya
         bDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279824; x=1762884624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3EV/MxibVMeuKGvb6vWmFsIs3Yu10QpUHip3gqCW54=;
        b=jv6cdg3UiOAUyTK5HIBL2Vzoajx+FKaaYBLYHr3madvON8D02dBXS1U3Ky3EBGBFbo
         h1ZCLL+HFxPQKMwoYapvEkEXKvnpr3ovGRjmVXOPXCJtTuRXS4GPNy4jzWnCdp562Lw4
         4fNrHKbZzYEv4Tg6LbvsCxN2CNBrk+6BIYuExY+LNacmrOJqRoKnIoPlYBBR/9XivCn/
         oXepU2ws8ucdFirB+fM5Uk7zSar75+y1PddoYLG+3D293kOPk3kbOwqT4NVFoB71gEWa
         GgH1XB/QsvkE6jf6nI3GH9HJqY5Fx53QOrsrqgDZhyQ5e8J/38xkDhGWU5weJEHqkrD1
         fpKA==
X-Forwarded-Encrypted: i=1; AJvYcCWgwCooGP2BYhuVnvpgJj8p4ulTAm4uDIMsoCvUJ5fWwqSGHQUK29+m0yh07ZQ0s9Ae482JdAfZwcdWnTybaJbW@lists.infradead.org
X-Gm-Message-State: AOJu0Yynd1Qa4lghpY8+N/IQ75QMfMnPBJsU5V5v5UIvEaP1vsWvFD70
	jnSazdZdvojjnlPTWNO//tQueW0QSKfyWfYED/rQCMTJAUVVzHZCWiWP
X-Gm-Gg: ASbGnctTfC7afUJA6HY7ugosLH8FgyQsjX6MSFeVwFO48V5cJxdv0AGZKBcZzfTFtlV
	oq7VZsW3K4zmC+5K0TmHJfAfPIPCydIhZfjZpXLr0hnbfL5gmTfNggebilBvl9D29Fy9BOxYinH
	sd0fU8S8PCd8uCrDcXte0fkhcyOFwajB2QK5FHhcy5qT8lyxN4H0a1sN7BdAzFyUDkuDr/Sdw9J
	6VSrBIpfAS4h33VHDqqXq1fIbsPNgmPB0vKWZl8m0cFpd1p7XSDatgBUespEYl39wYLEGsE9D+8
	ASNf95mGftts323BZKeImwN+SERtPBvbxiRuOmy/i/plngYiqzs14kBEWqKmi9G8LYJ0gVfKQUS
	q0Uu35c3aEWkXOvdj+7gUm6pL5hCRcFFGHlLsR+fqXvRMy8ljoRDg40JDpm16ohdmnlDpx/y3AA
	7N7DbwiWZyZccAuTGT46nxg70gFgO5
X-Google-Smtp-Source: AGHT+IG3T52xUW38yiQP+ctGCFR1rUHrIm69DPF54UH5khemOeYMj6ikOX9GGLBlfNHgLEUvN0EOGw==
X-Received: by 2002:a05:600c:6286:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-4775ce61516mr2003715e9.23.1762279823483;
        Tue, 04 Nov 2025 10:10:23 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:23 -0800 (PST)
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
Subject: [PATCH v2 17/30] drm/sun4i: vi_layer: use layer struct instead of multiple args
Date: Tue,  4 Nov 2025 19:09:29 +0100
Message-ID: <20251104180942.61538-18-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101026_815281_1D4CE38F 
X-CRM114-Status: GOOD (  13.54  )
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

This change is equally a cleanup (less arguments) and preparation for
DE33 separate plane driver. It will introduce additional register space.

No functional changes.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 58 +++++++++++++-------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 805db4ea714b..ba9c03f04f03 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -18,24 +18,24 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_vi_layer_disable(struct sun8i_mixer *mixer,
-				   int channel, int overlay)
+static void sun8i_vi_layer_disable(struct sun8i_layer *layer)
 {
-	u32 ch_base = sun8i_channel_base(mixer, channel);
+	struct sun8i_mixer *mixer = layer->mixer;
+	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), 0);
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
-static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
-					     int channel, int overlay,
+static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 					     struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	const struct drm_format_info *fmt;
 	u32 val, ch_base, hw_fmt;
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 	fmt = state->fb->format;
 	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
@@ -55,14 +55,15 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_mixer *mixer,
 	}
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay), val);
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
-static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
+					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
 	const struct drm_format_info *format = state->fb->format;
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
@@ -72,9 +73,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating VI channel %d overlay %d\n",
-			 channel, overlay);
+			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -112,7 +113,7 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 (state->src.y1 >> 16) & ~(format->vsub - 1));
 	DRM_DEBUG_DRIVER("Layer source size W: %d H: %d\n", src_w, src_h);
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_SIZE(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_VI_LAYER_SIZE(ch_base, layer->overlay),
 		     insize);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_VI_OVL_SIZE(ch_base),
@@ -161,13 +162,13 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = (src_w << 16) / dst_w;
 		vscale = (src_h << 16) / dst_h;
 
-		sun8i_vi_scaler_setup(mixer, channel, src_w, src_h, dst_w,
+		sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h, dst_w,
 				      dst_h, hscale, vscale, hphase, vphase,
 				      format);
-		sun8i_vi_scaler_enable(mixer, channel, true);
+		sun8i_vi_scaler_enable(mixer, layer->channel, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, channel, false);
+		sun8i_vi_scaler_enable(mixer, layer->channel, false);
 	}
 
 	regmap_write(mixer->engine.regs,
@@ -188,10 +189,11 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
 }
 
-static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
+					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *gem;
@@ -200,7 +202,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	u32 ch_base;
 	int i;
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	/* Adjust x and y to be dividable by subsampling factor */
 	src_x = (state->src.x1 >> 16) & ~(format->hsub - 1);
@@ -232,7 +234,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 				 i + 1, fb->pitches[i]);
 		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_PITCH(ch_base,
-							     overlay, i),
+							     layer->overlay, i),
 			     fb->pitches[i]);
 
 		DRM_DEBUG_DRIVER("Setting %d. buffer address to %pad\n",
@@ -240,7 +242,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 
 		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_TOP_LADDR(ch_base,
-								 overlay, i),
+								 layer->overlay, i),
 			     lower_32_bits(dma_addr));
 	}
 }
@@ -292,20 +294,16 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible) {
-		sun8i_vi_layer_disable(mixer, layer->channel, layer->overlay);
+		sun8i_vi_layer_disable(layer);
 		return;
 	}
 
-	sun8i_vi_layer_update_attributes(mixer, layer->channel,
-					 layer->overlay, plane);
-	sun8i_vi_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_csc_config(mixer, layer->channel, new_state);
-	sun8i_vi_layer_update_buffer(mixer, layer->channel,
-				     layer->overlay, plane);
+	sun8i_vi_layer_update_attributes(layer, plane);
+	sun8i_vi_layer_update_coord(layer, plane);
+	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
-- 
2.51.2


