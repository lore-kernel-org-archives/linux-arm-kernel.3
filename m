Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D5DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN9JZUnTMzqv0Kva4/oSm7+m7qLCjBjh91j5rj1nu0o=; b=cKtVW/5U6E9GkyVoldAIR0wCHC
	pLhtH3UQqMnUQ0JwmQZmcJbMnJH/Bo43MmY1jooxJB40z83hcrqaNTUJ6n+Ry5n+zDiHuOIDJ/zxM
	krOwguVOPScs5xmwwtAXECstnwSo0PH204cVtlT4GqmSuqfEC1Fty7OVoyfoFaYxkC4e60C75+Axz
	IRmLZhjjhzQG+vJjjrZ0QAZCGymvGlvIr4804ft8wTuNRqTmBYBAdomrmoHQWtZy+FCzGfPLGy19Z
	V5mDYDv+iFoh+aTeN4MdBXSUFolcp6XE22RmLPu1OVMoWv3M7TbDLwoiMBnAgToUDUJ9u53B4SEdH
	jL0rLAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fo-0000000BfvC-2RrG;
	Sun, 12 Oct 2025 19:24:04 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fg-0000000BfhF-2uYn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b4c89df6145so588341466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297035; x=1760901835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN9JZUnTMzqv0Kva4/oSm7+m7qLCjBjh91j5rj1nu0o=;
        b=blNFdN6AiYJJKEgtoN4N3C0UgUHqeZXd9thhLnLaW5gWjT0clOJuN1G58zYnOewo/6
         UL+SCUmLa2sO3G+XnMTyrMwVjimkYrIMwLzSpdrlrON1Q+1Mk4CM9ihuyYBIdYjeqWQN
         GbKM4TwfPOAoIFbWPVaoBP69QXQDJyrpDTXgGsZ62eSWQyrynlDaWGSroJ42XDFxgKmB
         lduH95JXzZnChDoAEvnxgiKT+l7b+OUZJnV9BDXw0Ms/v3QKPPqey5M2cm5LZXF+5vwl
         qZjiMzBJEHrZKb+eKLzfUzQZFFfPcvZL53MdAC4YLhSzDLn7LFopf4b7+IvuhcTQ+Yl1
         pvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297035; x=1760901835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN9JZUnTMzqv0Kva4/oSm7+m7qLCjBjh91j5rj1nu0o=;
        b=KsYOHy4msgCEUe/jiptmUGWZB/jKnPzGnK8nc06KnQ7KzXbmJsrVMBmPuu34yYzJXW
         KqudkV4R84OmHi/JoYMvj/yUBnKiENg6XSvRz+vYvZqRN1EII02z/+nrjNSps8VK9dKL
         qV3huecIYTUE6rO2r1M0TiTlmhmfy8bkVAvrrdFpl2vnfu2de5v2G5s/2IxRPN44zfzj
         ItBa1jUUgNP3WjAngdzG8ll811uNVRf0oUrrp1nJfNjH1/Aunqn+pBrn+VKFAN3ZXRHY
         oXaTM5gO+W86Q3nsF0EcmuOeYTEtRRfbXutoZMDgfdLpj/mxJ/LGO2LRIi7pFeh6w9cV
         T37w==
X-Forwarded-Encrypted: i=1; AJvYcCUmk7xQT0rfiWg1uzB0V5WJvDJ184yJq/2LOkySQbeGUskjfgjy2HC3nkIW4kMPe8N75pXMf2OPJZ75mPWaHcZv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi5iUuCvFFBLB7rfiMiOv6R/xxIskW8PL/793aWJpIgM/1IkNi
	4c3zyzs5n35AAc63sqCcO4JgoHY6mqLn6hiMN9yGCyWsrzqvgT/weExb
X-Gm-Gg: ASbGncuXf40pQ8WAwhIYOUxZiMnYz0aO97Zf01rmHBNJf98G9t1qiq5mXE3NgZIIOt+
	98hkquYCDbIVihj4+BLcjmhQRaZPZKBxCfqE0YGNuyxdVDCGeOfNgHRSeGvmxE24/u7usQYuRDO
	rYLf84e/rK8WOQrwiTHxNSo3pHxbQtm4WVhY8+ZZameJvYo36ItjPCaYqkPDX184RmVbCk3l6nJ
	MW0GqJzMWy0vV9UYi395mG7J6TozOQxf24Mle0RR7GHDGoIEQApyKBk7whVJq8lRCZ9f5IdviKb
	bqqoWX80+Lr4dNSKZPd4chGHTC2eFmkw2oix4Q+1/ZE93i7ZuCHJJsl3il6x++EXL/4J4wGrC1M
	OR/QpdQG1N916ayojPpR9ve2kAQG5OfUsRT0Kfu6A8IX/cT/sXFZiSOE0Jn2XyXFQLLZN7egDMP
	l8Tav/en8xCIFyTtNAKccE
X-Google-Smtp-Source: AGHT+IEtEdBabmTMqnIubXcrSPakmD6rKWlEr2K1/L9cKjSZtJR06uujVWalB21YsUjTI/XrkX/8/g==
X-Received: by 2002:a17:906:dc8d:b0:b4e:b7ee:deea with SMTP id a640c23a62f3a-b50aae98206mr2123778566b.27.1760297034667;
        Sun, 12 Oct 2025 12:23:54 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:54 -0700 (PDT)
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
Subject: [PATCH 12/30] drm/sun4i: csc: Simplify arguments with taking plane state
Date: Sun, 12 Oct 2025 21:23:12 +0200
Message-ID: <20251012192330.6903-13-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122356_773191_CD4A8B64 
X-CRM114-Status: GOOD (  14.73  )
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
2.51.0


