Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74741CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDehL28Q27cYBAOVsoKs4qDMfKKiwU8P48oybsPCNMI=; b=h9j8/7E6i06j4i9/z/9seXLdP1
	JwfZL/yU65miEaLEjwlHJJ3Gj63rq/UsbbOQdyUx4LL+9bsmbbcNxdfrxFb3MV1gYUnjlmjCr+PRa
	IyYNNmfLznx3DX0q+ORC6jDltY669vPm0vlUPZ9jXtVYarJt9mVpprayimnD3GMO+tIu/guoYVXoV
	e/mXy4zVG23hcnMXBFbW6/4kJO+MOlgokl1n/2AajxV42yELpCM4TjtbvAM+v47F0Gn8xITlmIUkK
	E02/7GnrF6eiPxCG1zGbblDIm6+MutsOnkm95GP7WVfKbfjjUK2lxPPAAZdLnypCL0nJ75H7K6oVb
	97VtTyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUN-0000000CLpH-1zE9;
	Tue, 04 Nov 2025 18:10:39 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU8-0000000CLUM-3uhw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:29 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471b80b994bso75235535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279822; x=1762884622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDehL28Q27cYBAOVsoKs4qDMfKKiwU8P48oybsPCNMI=;
        b=ZjKtCR0i5SQX6DGSJ//ItaD6KgIOiUL0kqFhPlTxo7hW+zshU3giLewvEkCFUV0vns
         NMS03e9UeU910eD6A7ghdgWXCIiyUIC1tRRp2ou58LDpjI/6klPgYBDxLQQgZra0IJzM
         a2TFkHErnfFevGr/0iWT/5zYUprBUBIiMyV6Z28md87h2GLq/S/Qua73k1zoXqv6mOcA
         wvDei4wXAD6zXh+Y6ojIQe5IFVfENufcokpq5w2qpA6lvgnUuO1juMiBP6IoiSio2mw8
         5eFHpPRL97rvKeDUn70CfBCluh+xAZz4QjLNLAAzOK80t5xpm6/Na+gxKYkqpSck/tD5
         TnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279822; x=1762884622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDehL28Q27cYBAOVsoKs4qDMfKKiwU8P48oybsPCNMI=;
        b=k7ZdR/299UWpXqS0IQXL+AF1onU17EsImHvJrAuJBOgtKTOvcVCTE1LH7KLBRMdesA
         hCX54DWTFAC3zQ1wxrz/vdn4qvQrv8+3FJsNQee0F2G5SHe94z13M+YOiTpkJiigXHZy
         rTkcXdJt6IY+VAceRQen3HJRpUhoa+WoHKpChuMs1MQnCKk/n7TRY6ZAJRVL0VzuffjE
         AGCT/GsuTHiGcTYcFYNdTvRX+S+rDywUir9supTbSm4Wj+k5REdyUu7fEokxi/Y2t97d
         j/4ZpcI73XLDLOveTJe35QlxXfEtNGhW7DIXfoyd9vTY1mGcWY4Zdb0APv+ouGbH+Eeo
         +ZLw==
X-Forwarded-Encrypted: i=1; AJvYcCWsO1wvuLXIFeHdXE7T7VlLDmVAEgm+5x4QgaBI0YMCTOEgnrpK/FFuKEo+GuUVSd8QUih5tlodrC9HEqlSj9UK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+PLP9qOB7+wXi5+fGPkbZaPJPiLPg+G0zqlDKlIZGcqaWT+iF
	eumoIuox8799qUOkyvSN7pzRlrs5v74z7II+gh7eU/OGAdW1WNEMm0oP
X-Gm-Gg: ASbGnctXt4sp/x/yaTNZhOw0EPHQ192LBK9Pd4d6ef7Ku681TwpvttJMJrjGeyf+UHN
	+hYUPtSpV2vs4MKAbw861+9V3lmZTTi1u9twpD5gp9hTHd7zWjgcrQQipsOsr+VI4ec5/Cohjin
	67DDB2otCjjgDKHoUh+3STVWwmawJd1mHpKyi+yYc6dcavHOI0TnK00MjVPUAkaaZNVN6sPGoMV
	NPOsxcSGVAG0RWvQX4BAba8LhUcqj9WRaLWxtOohk/QkhlMR2Rh24rmFl0QXAomue1vPd0a1NnI
	+fAa3zuO7X4Rm+B1aQ3AxCTu9zr1Lrd3z4QQ8CFb2KxBOkZAaXRynRWQojdbeNUYwjpsV8YkDUg
	P+WLv+y+sdzPLakq5ZdqN0HFYJC+EXhePr/V266fbNTwmfp6s08Opv7bYs0VLeEJ+QF5egSemSI
	86e1yOQA8DLJ0HZ1KxsaQlxKv0mbej
X-Google-Smtp-Source: AGHT+IH/l6jplGcrJTw+MVPwop24SPu0Xraro0pVDB1OrwY3EC8U4W4qSO/6idS4O2pFVK6xDaJeuQ==
X-Received: by 2002:a05:600c:a00c:b0:477:55ce:f3c8 with SMTP id 5b1f17b1804b1-4775ce13215mr2324825e9.25.1762279822265;
        Tue, 04 Nov 2025 10:10:22 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:21 -0800 (PST)
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
Subject: [PATCH v2 16/30] drm/sun4i: ui_layer: use layer struct instead of multiple args
Date: Tue,  4 Nov 2025 19:09:28 +0100
Message-ID: <20251104180942.61538-17-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101026_791104_8D18AAF8 
X-CRM114-Status: GOOD (  15.04  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2


