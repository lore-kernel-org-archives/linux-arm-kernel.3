Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFD3CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eL2EBWUDT3u08ZkUVEOOStqc7WgxRVhnqkwZQdEEL5M=; b=n70vZEV5DxxctOMbCpUlXFQpSn
	NQfX1eJr17iKc8xMuXe0Yn/75ZMrLZY2sp0Mt2ze6KWrwrzadIZAn5XkR6yyL1XKyEPhktvOFYQHO
	GnKAB5ulxjqBPUB+aeKXRrGhDkTv8OQOQtDVffCwwdb2Ra3mHd8kkMeoyuZPyN8f07TcqeILbdCrk
	tsNWRKhdxB5vSJljolx2ikYryEzSrXlhZ77T0mSTGZEHXE4KB3gv8KP9HI5Yl97Z9GJ7koWlCR8g8
	4Z6jRgIa4Tnt/duI5/j0U1easJ1aWIWtKvY1EixSK56804L+C/aVVcqOPI3nm/hY1yOUVmAk7mhn+
	m5GnXknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81g7-0000000BgNQ-1jhe;
	Sun, 12 Oct 2025 19:24:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fm-0000000Bfpq-3uba
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b403bb7843eso768489666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297041; x=1760901841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL2EBWUDT3u08ZkUVEOOStqc7WgxRVhnqkwZQdEEL5M=;
        b=D2nTq739HsDOsbAYTYNbyFDhfRfjLGgxxO4q1hjsC0sn4HrkzWAC4hEkWMaYVVen8u
         ME/WgrgPqjR4z9WhY8fv/nTgZOAHHPsDvpZfaZYSTABFBqIP6ChtVRnWae2hooehiYoo
         HQkLnYktK6gjMwNDr3NYXAB8zAgNolE8WW2tal0hsF5KBYV/vVOJKDWVstwmoXOt+vb5
         7tTyEYJ+G5bcy4d7H581X/xNclbjvaxHCI1NjVV4VYYD/bRWLlzvbT0LQYa3m9luZWkE
         BtDH+pyhlcEsvq8BVwPhznA70omjSIuB7JJoKj9wsiNqLET2yYt6ZFlbpiYV4ByBsvl3
         t07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297041; x=1760901841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL2EBWUDT3u08ZkUVEOOStqc7WgxRVhnqkwZQdEEL5M=;
        b=I1aDw7ZcajiA9kVX3q0FH1FXD/3UrbUwXylwLhmvmMFAP/4JssKQPZJOmjJ5+QDzdy
         LctKHnt/40Sf+3MUsCyJHrAuBNxFiD2B3mJpVNE2q75FkzKvW3XbzPbhB5N5jlV7WI+j
         Kabt1swMJLRFwWz78vrlm6Dip4DhwUz4Ib7MUOcrcV6MkIQl2xaAfNT6kBJ7nhZIbjcr
         /Ot0qJVmQfBkNBWERySeqD/qeOIVc5TlbblVAnuxWJ8+zreVtQVebi0eXGdcL7HK850b
         85AE5jynI23SeWEUjNYRD8g9O2VlV+mm6I+e1s0B//2t1IfaD9LvJuiH0QN5/RhK31ZY
         4uMA==
X-Forwarded-Encrypted: i=1; AJvYcCWO+BKPAdKpkzGmwpYRz14fTP9mSGMLznLN80b+FyDYyaLOTdY2iepPgzespjX0b10L4zUNysm2Ba13zBHEfys0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu7dDhIkTxU/ekEsc/glB1pWs1Onre56XsnBKZOTySuwI1T5o9
	oqg1H420PWUng2A10CVECYkP7B7yMkMK7RQZjSSIWu6OHVDr9Ff+PvXR
X-Gm-Gg: ASbGncv3po7F1okZZFLkuP3RbtAkRddOLY5ydfJWuoYpos2BRp61t84SerG2BByvMbn
	g2PiAIgQKH/GB5HjnrCQvsJXo8lb45Rfv/uGzxkESPSn5h2NNmAOuuAO3V3D6QO8gz2OnI/Kqzy
	NrOcKXKAp3umGx/Z5fj+4Sm0kNa1ft9eZHNgLveZlexM4Mph03er84X0FBlNcgFkupwLxbaQP9u
	nqYYtI9Onr9QDN/6OMkneCS3NTOo5rgKJ2YjDtNYw9UIDkqe1aBjlrd/6JSsK7VyziEvCNhxJXn
	5Az/3lvzlIRHgC4X1zXmdJh+nV5mco6SSZ1bt8s5BH3LCvsJYnVodhfPOcXoq2MQ0bBh4bQMaAq
	k6DvdfHVAN6Y4xIHdgA12Ef3n1NJ7co+qhvSJaKq2bnbzCZUx7Dem32ExituhZLAMCIvtB6lZOy
	A63TEOpNjDCjVQicY/7SI1PJcZMYqR5Wdw1L6gOIE5zA==
X-Google-Smtp-Source: AGHT+IGPkp7VdpjnXUyPQLeT83O0qdM4azwPi4L4aE39Db/9aQTPTuI9Yl565PGYAFHx9WevGbF8Hg==
X-Received: by 2002:a17:907:3e21:b0:b41:e675:95e5 with SMTP id a640c23a62f3a-b50aaa98160mr1845501866b.23.1760297040342;
        Sun, 12 Oct 2025 12:24:00 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:00 -0700 (PDT)
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
Subject: [PATCH 17/30] drm/sun4i: vi_layer: use layer struct instead of multiple args
Date: Sun, 12 Oct 2025 21:23:17 +0200
Message-ID: <20251012192330.6903-18-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122403_133977_25B0606D 
X-CRM114-Status: GOOD (  12.64  )
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
2.51.0


