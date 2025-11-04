Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7042ACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdhmcynnandPsql64nAYpaShGCfSEifyPJ/Np9JnIqU=; b=bFmIxdrxmKOtKsm4/NFdLRxfN9
	H+QNqxh8sSyH+KRisVVImmzFvD7lI8x5h/YL8sQqJDLEpjQGC8Ofoi4I65vgTqOHzT4R1rvzUp382
	Dfwt54ep6ObBFBaM8GhefRoG0eTJC4vpJAEZN06DtSnOk6sMyrcneWVLh9r5iFMtbnDvmih/9zyKI
	t3f+ZP9te9p+NX7jQF3z9j3gFQIz9q3v4zEGkAbUfFEYpgkrrGtF+QB5XDPevMQFxwEBjdwVvHje2
	E8ER4wGbdiBq2p/AR/zYolculfsk5J9Q2iX69U+bVb2QEHHuLMSQ4tf86gB8/Hc4OSWBXNXup/Aa/
	BD/x7AUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU8-0000000CLVg-37zS;
	Tue, 04 Nov 2025 18:10:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU2-0000000CLLC-3ssU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4775ae77516so4396055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279817; x=1762884617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdhmcynnandPsql64nAYpaShGCfSEifyPJ/Np9JnIqU=;
        b=H7UtRM8UwL1QmxX/4idjCjzvhVH1uQ/KExhovrc79QivzJbmhS0E7tfzGzz5T0anBm
         NwmMqxuWosUY0t+1TuvSBASihqCZ1eE9TE21NDpT5My0FeHooC8Q1dezwD8//0KGrX0o
         K+Xhy8bkXdcv7x+BtcqMcNJkhgktBDHYgWDlVcVUlZjtuxMReBCvsPZxBtjZ0gi8iqjH
         xknDlV9DrY2zItErV915hUG5c+JWXYu+zc/8bXR98QhpbVGF2Irs00F6oKczQlKtYHSY
         x95IGtnaiF6dFCW1I5qfGRM2h6xdXf+iBwOizVHvQjZs47U9XRtLkTAQziyTxqM4TXGp
         UG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279817; x=1762884617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdhmcynnandPsql64nAYpaShGCfSEifyPJ/Np9JnIqU=;
        b=UBoyGS+wiBQECzTst3AGI92Jcgn1FnqmSQvWOXoU0ebyxXt64Vxz5xO+9ksYjw8wNg
         oxLJ/4CUxNocFz9mUe6wFha1g6lKH0cTWICpV9eiXAWuCULVZ8XXwjZagG9GnjOH3idQ
         UYVpRda+M78L8SqXf5pg0STUIPgoBQD+khTRaMAAJMkAaG7PK7MXiGDBmvN8cNUDAL9i
         2PQhVq2iWS4oWRYY4OyCYMhx5A4ql1I8+jaW8xNiLqcRT9Mtq8PJig/jUWDS5Qul8dAn
         KbzrNOi5lLT9/2T42jvZosGgRXX5b/X77Ul7mAAT4Q0+FOA2pRXxaavkdBB5VAE8fH+y
         Hiow==
X-Forwarded-Encrypted: i=1; AJvYcCX5hv1e7rWC0KUGVc/TrdpiU/U+WQ2ZmFMpT9hvRjPkTOVehuAFuqa67+tmHSm10sLDCg4Us8ImV1nnyqZ3rPdp@lists.infradead.org
X-Gm-Message-State: AOJu0YzVOmuljb4JpH1LzcswWfZSnp0L6DovQhxRGnwe6DmY+D+MF8hW
	rQf9WdidW1afq1ad+XNcbMXm7Vn5ZqwnBg+PmVEbLNSzQbVXnCdr7R+c
X-Gm-Gg: ASbGncv4pEis0BNZ8cLzHh9r1H0ibd38Jl4OiCI8e5FS1ubscfz3G+fvuU1mXXJvx0+
	VxtHUd8zIAtF6Di5BVwNciOPqBhlJJC+FLaeznrIePIcIYtnKhbvOqnXKPdkiFBxgKlDzIbs+Aj
	hnygVvk1lvL8SlpdlOrR19w/T/4rQ1d51wlRtBxOql79tZ1pk+Az/2UV2WEDKeaZ/5AJU5FK6ZY
	UF5W04TmYDXWwTGvxJ+COeDQcFG7YsRKghqBERRdiTSERu3n4nYaLBvmgiRaYl/4490BRifywSI
	JdCg8YBT4k4o2zU4kvjfZ0qUek24HoBaphOS8XOrh9iun/S1NDqPbn5F7xl2Qd29EqOStRorfgp
	NRxhFXH/6d6vA7WWCIxmvfP12ol5VABSpRy9uhnz0vJ6Jv+bssD4Zmfj28ft7/VJ+0Tm4jqO0Jv
	ob3VrF/RxIIvAuRZeM55XDG9EOEVMB
X-Google-Smtp-Source: AGHT+IHAn9E17efLdK3gkIKUuQG/k5i67Pxhzd6m2tYSUMyKeGk6z7xhuvIzYFMNgqNcBWlY1dxfwQ==
X-Received: by 2002:a05:600c:524d:b0:46e:436c:2191 with SMTP id 5b1f17b1804b1-4775ce12cbcmr2349175e9.25.1762279816823;
        Tue, 04 Nov 2025 10:10:16 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:16 -0800 (PST)
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
Subject: [PATCH v2 12/30] drm/sun4i: csc: Simplify arguments with taking plane state
Date: Tue,  4 Nov 2025 19:09:24 +0100
Message-ID: <20251104180942.61538-13-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101018_996291_680190BD 
X-CRM114-Status: GOOD (  15.44  )
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

Taking plane state directly reduces number of arguments, avoids copying
values and allows making additional decisions. For example, when plane
is disabled, CSC should be turned off.

This is also cleanup for later patches which will move call to another
place.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 42 +++++++++++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h      | 11 ++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 33 +-------------------
 3 files changed, 40 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index cf0c5121661b..ac7b62adc7df 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -3,11 +3,20 @@
  * Copyright (C) Jernej Skrabec <jernej.skrabec@siol.net>
  */
 
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 
+enum sun8i_csc_mode {
+	SUN8I_CSC_MODE_OFF,
+	SUN8I_CSC_MODE_YUV2RGB,
+	SUN8I_CSC_MODE_YVU2RGB,
+};
+
 static const u32 ccsc_base[][2] = {
 	[CCSC_MIXER0_LAYOUT]	= {CCSC00_OFFSET, CCSC01_OFFSET},
 	[CCSC_MIXER1_LAYOUT]	= {CCSC10_OFFSET, CCSC11_OFFSET},
@@ -196,21 +205,44 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
+{
+	const struct drm_format_info *format;
+
+	if (!state->crtc || !state->visible)
+		return SUN8I_CSC_MODE_OFF;
+
+	format = state->fb->format;
+	if (!format->is_yuv)
+		return SUN8I_CSC_MODE_OFF;
+
+	switch (format->format) {
+	case DRM_FORMAT_YVU411:
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YVU422:
+	case DRM_FORMAT_YVU444:
+		return SUN8I_CSC_MODE_YVU2RGB;
+	default:
+		return SUN8I_CSC_MODE_YUV2RGB;
+	}
+}
+
 void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
-		      enum sun8i_csc_mode mode,
-		      enum drm_color_encoding encoding,
-		      enum drm_color_range range)
+		      struct drm_plane_state *state)
 {
+	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
 		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
-				     mode, encoding, range);
+				     mode, state->color_encoding,
+				     state->color_range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
 	sun8i_csc_setup(mixer->engine.regs, base,
-			mode, encoding, range);
+			mode, state->color_encoding,
+			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 27b6807fc786..ce921521aaca 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_color_mgmt.h>
 
+struct drm_plane_state;
 struct sun8i_mixer;
 
 /* VI channel CSC units offsets */
@@ -22,15 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-enum sun8i_csc_mode {
-	SUN8I_CSC_MODE_OFF,
-	SUN8I_CSC_MODE_YUV2RGB,
-	SUN8I_CSC_MODE_YVU2RGB,
-};
-
 void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
-		      enum sun8i_csc_mode mode,
-		      enum drm_color_encoding encoding,
-		      enum drm_color_range range);
+		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index adcd05acba1b..cf83f7ce6c78 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -188,36 +188,6 @@ static void sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
 }
 
-static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
-{
-	if (!format->is_yuv)
-		return SUN8I_CSC_MODE_OFF;
-
-	switch (format->format) {
-	case DRM_FORMAT_YVU411:
-	case DRM_FORMAT_YVU420:
-	case DRM_FORMAT_YVU422:
-	case DRM_FORMAT_YVU444:
-		return SUN8I_CSC_MODE_YVU2RGB;
-	default:
-		return SUN8I_CSC_MODE_YUV2RGB;
-	}
-}
-
-static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
-					 int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 csc_mode;
-
-	fmt = state->fb->format;
-	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	sun8i_csc_config(mixer, channel, csc_mode,
-			 state->color_encoding,
-			 state->color_range);
-}
-
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -333,8 +303,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 					 layer->overlay, plane);
 	sun8i_vi_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_vi_layer_update_colors(mixer, layer->channel,
-				     layer->overlay, plane);
+	sun8i_csc_config(mixer, layer->channel, new_state);
 	sun8i_vi_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2


