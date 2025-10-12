Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E0CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OE7z3Ym6vzsdMqeurGEJ9WmMXX0dMfNPsEVDzikE/Uo=; b=33L4rEpvMtmqKe0PF124STJPip
	Npc7jZgpZFSBFROOmA/dJll2mfq1PAOPy5rloctPswuXFbPCM5WwZST4/My65QeXybgIXDzdWcC5d
	4Ozd9+HSzHmRcr76Vvmlbe8wM98VOkVz0N4pfVrV51cSfiHtsk0iCzj539DlI9fow07geeOXc7i3P
	C0std0kJwbFkM2SQuKIASXt5pErxY6TcGJewaEpAvsd0fvC1JVNZ3pVymrTq8Gf/orXydVkl9+T9i
	sI+OjhytqlnPmJYi38wBGcw0cuhB8vf/J/IIh6S4GxIN9vtA9Rz+BCadQQpjabDauW8Y2xLDty7L/
	go14QFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81g4-0000000BgJD-0NJJ;
	Sun, 12 Oct 2025 19:24:20 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fl-0000000Bfn1-10Jk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b00a9989633so650775066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297039; x=1760901839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE7z3Ym6vzsdMqeurGEJ9WmMXX0dMfNPsEVDzikE/Uo=;
        b=LQHDwKv04Mqw+tFNDHSR/hxSjk/xCToW45r9US9StrTqkTpB3qgW1TZW0f6cs66QNJ
         Rh6WtAcAJzrJyXj+VM1OpiOjHgn2mMEL+Uwy9qCvNgq0JEWtTdsehZBL/buSkbG094tW
         XWV9d7y1dLptuOgWdNpWX4Zb7UAs+rxFEn0aND2vSNUklBzZ+MEu7R4nvWeYEcsZ1uze
         cvmk2Sh4eTIjVNeYZtQqJBvbzuvtIHEqWe6Ea2NfI/SDEL5NHymSowuZpmKf95VZQPmt
         z0z7bT0Gx4QIIxSymjXPnXRJQjZ796RYT/qaAQcDP9FIGhgWb0GIe5AM8FqS5PCaZJIU
         odSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297039; x=1760901839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE7z3Ym6vzsdMqeurGEJ9WmMXX0dMfNPsEVDzikE/Uo=;
        b=g+nH/xEGecJMEnwRKka1Bfc7ZGdWdXf5D0OXe7EPab8j+9uBzBTmvlfpIk89ZsRXUG
         gNyq87N5R1ZJENIvYPVAbGF8jUfnANhU3RLJAPfyMGEJyP4Bsmo97euLJp2rvtLKszfu
         xTZrB8fDGsY+O2u1GXqtKlec9/FJOZoWAv7kAFKHvqkegrUnjDLBhLsNa0JKRRPhThzF
         10Ysc+fia+CKLihGTc/9sIPoFe8ZbAg0G1Z+dOIgHQXQxsIWsIFpCR8HhrqkcEsq+hs3
         ye3XNNxinFG4ssWTerwEvtAI7TeQv3fhmmYXZUDvd/purXnxk2xWVt0rgu8NMUi+wPd1
         sPNg==
X-Forwarded-Encrypted: i=1; AJvYcCW+U0XNCaDLuFKf7JKmtOPxGcnPk95syhnvCGEycSaMIaFwcjN4c/Pu1Xbj4oaCdYuitoRM6P/CmHOG8n4ROi89@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9hFmeg/3Xywq7dlEXJbeDZdg0g8Rpc4AkpgkimXxHDpJnXTkZ
	J2JCUKZbtDR5TVXsarQlMihrkjWQ/K1nOW4Xn3xbZY3uSat/eyu6jRnB
X-Gm-Gg: ASbGncvR+RlwKbyjlow6SAY8rH0SrJRun9yPOvBBJDWEI4bis1idGL4qZqmEy46km9L
	9MjolgjcYg1w5G0ESMd1WWDbD/YNxReoZZfLYQOWzo/eFL0yAVmt7bWyIltBIDcZW3Bu9tagG5W
	tjh5KKI+YQ4Q0mBA6aVQCEG5XfOzic1mybkwsPM82Q7RL6PZfZZ/oG5n0fsOGqhYWqe46NGWNqv
	+6Fo14pzY2MHPGwNfY9jtaXV+8CoQL8b+sBh+CEyQOR9IKXdNZzA3Dpk9CBKeJxAP36B0xTUwvU
	YRdTY5Lt16pPgGQeZMntDOKE9D+Ug8OafWmTxmK8Cuh+q5Q/DTWsqYtEG8IubH+8BPjzB8bUuEh
	N4CtiRwOVDMS5jzZEuhUGRmPMKjtHT+o1z5gWwrz1yLhxZrjyv5W9cY+bvU+CFJEgTR4+ymUZEM
	rKIA7c8L8DXY1WZGdPFjQi
X-Google-Smtp-Source: AGHT+IF1xOKgWuyI+oCZN9C/Rgac5TfDhPy4n+lEBLcOmhbH8TpPGj6H1LBb8Yf8EpbwReOe4/+GPA==
X-Received: by 2002:a17:907:d48d:b0:b4d:71e9:1662 with SMTP id a640c23a62f3a-b4f43730a39mr2759401266b.30.1760297039238;
        Sun, 12 Oct 2025 12:23:59 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
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
Subject: [PATCH 16/30] drm/sun4i: ui_layer: use layer struct instead of multiple args
Date: Sun, 12 Oct 2025 21:23:16 +0200
Message-ID: <20251012192330.6903-17-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122401_443999_1CE959D7 
X-CRM114-Status: GOOD (  14.14  )
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

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 62 +++++++++++++-------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8f6fcdfcf52a..d5b7241acdea 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,24 +25,24 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_disable(struct sun8i_mixer *mixer,
-				   int channel, int overlay)
+static void sun8i_ui_layer_disable(struct sun8i_layer *layer)
 {
-	u32 ch_base = sun8i_channel_base(mixer, channel);
+	struct sun8i_mixer *mixer = layer->mixer;
+	u32 ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), 0);
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), 0);
 }
 
-static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
-					     int channel, int overlay,
+static void sun8i_ui_layer_update_attributes(struct sun8i_layer *layer,
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
 
@@ -54,22 +54,23 @@ static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
 	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
-static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
+					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
 	u32 ch_base;
 
 	DRM_DEBUG_DRIVER("Updating UI channel %d overlay %d\n",
-			 channel, overlay);
+			 layer->channel, layer->overlay);
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	src_w = drm_rect_width(&state->src) >> 16;
 	src_h = drm_rect_height(&state->src) >> 16;
@@ -87,7 +88,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 			 state->src.x1 >> 16, state->src.y1 >> 16);
 	DRM_DEBUG_DRIVER("Layer source size W: %d H: %d\n", src_w, src_h);
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_SIZE(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_UI_LAYER_SIZE(ch_base, layer->overlay),
 		     insize);
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_OVL_SIZE(ch_base),
@@ -102,37 +103,38 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		vscale = state->src_h / state->crtc_h;
 
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
-			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+			sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h,
 					      dst_w, dst_h, hscale, vscale,
 					      hphase, vphase,
 					      state->fb->format);
-			sun8i_vi_scaler_enable(mixer, channel, true);
+			sun8i_vi_scaler_enable(mixer, layer->channel, true);
 		} else {
-			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+			sun8i_ui_scaler_setup(mixer, layer->channel, src_w, src_h,
 					      dst_w, dst_h, hscale, vscale,
 					      hphase, vphase);
-			sun8i_ui_scaler_enable(mixer, channel, true);
+			sun8i_ui_scaler_enable(mixer, layer->channel, true);
 		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			sun8i_vi_scaler_enable(mixer, channel, false);
+			sun8i_vi_scaler_enable(mixer, layer->channel, false);
 		else
-			sun8i_ui_scaler_enable(mixer, channel, false);
+			sun8i_ui_scaler_enable(mixer, layer->channel, false);
 	}
 }
 
-static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
+					 struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun8i_mixer *mixer = layer->mixer;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
 	dma_addr_t dma_addr;
 	u32 ch_base;
 	int bpp;
 
-	ch_base = sun8i_channel_base(mixer, channel);
+	ch_base = sun8i_channel_base(mixer, layer->channel);
 
 	/* Get the physical address of the buffer in memory */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
@@ -150,13 +152,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch_base, layer->overlay),
 		     fb->pitches[0]);
 
 	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &dma_addr);
 
 	regmap_write(mixer->engine.regs,
-		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
+		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, layer->overlay),
 		     lower_32_bits(dma_addr));
 }
 
@@ -208,19 +210,15 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct sun8i_layer *layer = plane_to_sun8i_layer(plane);
-	struct sun8i_mixer *mixer = layer->mixer;
 
 	if (!new_state->crtc || !new_state->visible) {
-		sun8i_ui_layer_disable(mixer, layer->channel, layer->overlay);
+		sun8i_ui_layer_disable(layer);
 		return;
 	}
 
-	sun8i_ui_layer_update_attributes(mixer, layer->channel,
-					 layer->overlay, plane);
-	sun8i_ui_layer_update_coord(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_buffer(mixer, layer->channel,
-				     layer->overlay, plane);
+	sun8i_ui_layer_update_attributes(layer, plane);
+	sun8i_ui_layer_update_coord(layer, plane);
+	sun8i_ui_layer_update_buffer(layer, plane);
 }
 
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
-- 
2.51.0


