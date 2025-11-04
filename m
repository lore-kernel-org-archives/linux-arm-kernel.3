Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3822BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=; b=WI92dMt+ajVY2rmsEW4z2jiIDf
	hIeVW+/Hlkq/zwdq6SONs32UEaumrZHyAhC00u5tdtHg1u1CI7JvL2UX3N7x1nTUtNDBMzge+1dqv
	wybAwlp4gTjTjSInC7d3P23mT+KBCkUpYiX8R6VLReMZAkbDr1bjLGigVA89HcWQYYR5aXEI0WZnX
	vx6DhxReYNzo+opsTysShPHb2W7VfUk6mOsYGOF3IEkTtA8EGXFxHrhP+VNNNGCoL+ErKPls4Z2SM
	KWTrohPCjTyw89gspRxJLbWARxcox9Xox6bkYx+xrFER+tMT+L1xTKbd4XUB8T0b244dQeB3De/nt
	YTxtoHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU1-0000000CLLo-3x1F;
	Tue, 04 Nov 2025 18:10:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTx-0000000CLFg-3Ai1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47112a73785so38743765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279812; x=1762884612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=;
        b=TodCGgZ6/ASBORWTLuCrj7Fvn/3NiHCG4UWLNTKIpKUaeD01KgkLA1gs1KcmILj1Q5
         b+DwUjOJRpoQcFaFuvy+o3+D3B2W2h6OshTnSlQ8+AZZjfEa3Ai7tm7YTSWmiRuAa6sN
         fwOjhWa9oiLtdbDfOCVeh2TST0qQC6axqO7pnNvN1hiHmJAwBdPqclTjQQa4QGyJLRvJ
         O4nilNvpSbDKaXjs/B3IWc/9xbOiqT/6eb8JpDuuo89bjSg22B0hc0jumpmoLDaAYCB7
         LhEE12RPfjTm0p2WJgdp+ErJyaZux+ZgMwPXwota065vWpWu29jhvjiu8+CsRBm8kWOH
         MMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279812; x=1762884612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V+kePNpXO72CJenp34f7uw6E8+eMdcIi2DhwUlA3KQ=;
        b=g/9KH+S1tYAxdP3mHzgHIXYuB7QUA/zIKWx4xdyz4wXuXLzmSMJonH8z0xYwO6h02B
         uEwmSEgV99RagbPhSHTJBPK4xqKKrgi6GTtjbkryD8TqIghMjN8Ra6jk3H/QSoQZ/ECG
         1kh9L1nr7tPUnCKZoNHGlcgISDX+d59GU4QbVHvSmlQNAoCP3GG9c7YXZ9aivV1TD/J/
         bYJY3LoTJgYiMfjjchlsgYTJLfNeH3waro43SNgEtsIeQ388qyNEPLEosyzf9xwnRfe0
         dvUlioByJKxwxwVbsRgGTPT1+hyWL0HHjeFZSm0f4JrvZgvfUIDCr7gqyl/S60WoUSeH
         IMGA==
X-Forwarded-Encrypted: i=1; AJvYcCWWS+lZSR4VOOZ1OoNwrsrBfMB43vGubQ3EWPKdzwS6qFYUAAXRy5XxlmutHK9S1RjGH7PEoDoxIG693/S2AMBO@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZj3dP/Ubmvi9sEamy+JZADnrZ8jjM2f06kz8V+AbXulNTtBw
	fgLokfsKpxVN1nsrqks+Mu2hd0SXnl6JMTEZ+7KDyumM3zVRpyY1Mp/E
X-Gm-Gg: ASbGncteapqMM6K1ao40Vst8VxKhY4VeatkIALW3SpDrV/Z/p9r0x14wnOEmQrWU9nH
	4Q5udOKIDxgZtb2fIGyjrq09bTzPM2uNIA6tjJ6UgWqjTIeBLqlnIIWD8Tz1+Fv97D3whOz1cDu
	ChgdQbFDaXRJqLgk8pe+ePFwvkfmL37sxCoOxgoIXTrO+PsEPBPM4Z+XpzTfBgxp2odELcPKHCO
	liY+HwDnahii2ptT7tx6rno6BvkjvGrfyY4FS0v5A1LZDkg9lGCeH0HmRUxvbY6d7QGJh+f3Gbb
	8I9SyxV8fDNQVSawxIvLCOxjUpgEccpY3RUnierAb1YEGyfeNVcA73xtF5PyH3l+esBSzGl7Al9
	WitRqMjRIXgbI0VqQ8+SeGI6DHVC+d5QBANMgk8xRhhkylW6aNgmv7SVwGBA6R/aBYEFX+4mkVF
	c+35haWMkUxetszcNdqw==
X-Google-Smtp-Source: AGHT+IFZg22fNOBq2/+K7yxgA1ojsJmdSdVgUH3x4JG8OH5BRdNvWipWSBISKSpBHgCgvYmvB7tQTA==
X-Received: by 2002:a05:600c:6990:b0:475:de68:3c28 with SMTP id 5b1f17b1804b1-4775cdad710mr2567035e9.8.1762279811690;
        Tue, 04 Nov 2025 10:10:11 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:11 -0800 (PST)
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
Subject: [PATCH v2 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Tue,  4 Nov 2025 19:09:20 +0100
Message-ID: <20251104180942.61538-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101014_286278_75708571 
X-CRM114-Status: GOOD (  12.66  )
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

It turns out that none of the UI channel registers were meant to be
read. Mostly it works fine but sometimes it returns incorrect values.

Rework UI layer code to write all registers in one go to avoid reads.

This rework will also allow proper code separation.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 12c83c54f9bc..8634d2ee613a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -25,25 +25,27 @@
 #include "sun8i_ui_scaler.h"
 #include "sun8i_vi_scaler.h"
 
-static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int channel,
-					int overlay, struct drm_plane *plane)
+static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
+					     int channel, int overlay,
+					     struct drm_plane *plane)
 {
-	u32 mask, val, ch_base;
+	struct drm_plane_state *state = plane->state;
+	const struct drm_format_info *fmt;
+	u32 val, ch_base, hw_fmt;
 
 	ch_base = sun8i_channel_base(mixer, channel);
+	fmt = state->fb->format;
+	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
 
-	mask = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
-		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
-
-	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alpha >> 8);
-
-	val |= (plane->state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
+	val = SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
+	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 		SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
+	val |= hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
+	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   mask, val);
+	regmap_write(mixer->engine.regs,
+		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), val);
 }
 
 static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
@@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	}
 }
 
-static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
-					  int overlay, struct drm_plane *plane)
-{
-	struct drm_plane_state *state = plane->state;
-	const struct drm_format_info *fmt;
-	u32 val, ch_base, hw_fmt;
-
-	ch_base = sun8i_channel_base(mixer, channel);
-
-	fmt = state->fb->format;
-	sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
-
-	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
-	regmap_update_bits(mixer->engine.regs,
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
-			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
-}
-
 static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
@@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 	if (!new_state->crtc || !new_state->visible)
 		return;
 
+	sun8i_ui_layer_update_attributes(mixer, layer->channel,
+					 layer->overlay, plane);
 	sun8i_ui_layer_update_coord(mixer, layer->channel,
 				    layer->overlay, plane);
-	sun8i_ui_layer_update_alpha(mixer, layer->channel,
-				    layer->overlay, plane);
-	sun8i_ui_layer_update_formats(mixer, layer->channel,
-				      layer->overlay, plane);
 	sun8i_ui_layer_update_buffer(mixer, layer->channel,
 				     layer->overlay, plane);
 }
-- 
2.51.2


