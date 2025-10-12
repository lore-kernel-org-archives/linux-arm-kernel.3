Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178CCCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=; b=C8kCbb/bOnxJN4rglbtbRDsc8p
	NcDIlt1by8X0Ro/ujlEiFqmcRf8706wF2M7vwBsWMOWB8gMVPwwInyr9ZlcCC1vFEoRHtIP4NBPdc
	IO2tnLmzkXJm6AgPtToe1pd79ljMwZ3S96iS8FZ5ur9pq5LwcfNjL1t7w2FLpv1Tp1U46G1oRMI0u
	n8VBSeWRmkuP6FY5Ml3wskNtjDCIbC5IhMFfMrZBdw+HT+/nkCck6Jp49wsW7KbA4flyeTICckHU4
	81JtTITqyAm2RELdR1yZ5Nr36gPk7dofbkAYKUiK3jXq2AvEO/wVlLwpr12UCiv3pv15HjiiKesL8
	fWYmo/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gE-0000000BgWE-0hjR;
	Sun, 12 Oct 2025 19:24:30 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fp-0000000BftT-09YJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3e44f22f15so514477666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297043; x=1760901843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=;
        b=HENsL5QXubNPRkCFZOd4xbKVZ6l9kGqDlfM8HEANDZDb8z+Ests9vCS6Uv1cKKR2yI
         m/rXegaCwLuS7odZLkZ+asFKTEO1ugyC+uEWwq+ts/wfWkC5LzlHs9w+tCOC3dDOP3Gx
         4xwQOIHVGG8yEBS0bH2l9D4bjHAfOKy4S3Iu6JMXiKNebqSxtW8DMKQNDRXq+oIuKikS
         NiK//Q8I7JsCf0+hHqMnGD9YYGgdmoC9sNVdajHCPNmJ0oY7mfKs1C1YkomDE6BQQ17B
         sJdk4kpuddLbQJU79sIx1N54EG67LQKNPsu3kYNqodD9hxtJIuYjFmes4K4ZvrBpcAmc
         tFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297043; x=1760901843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPg7C4Ufc4hWFOGmxU8Q0n2wES7W0TyH0ijKt94tsok=;
        b=jePtSPmrprsi5jBlYb7bOxssFIAp6wFDixdPI55zslsre3XcTSGxtcKjpW5qQEumeu
         4qtLnm2Q/2iBVceZbXTrAPXPmenrrBJCBJkvQoDVC6l3Zm8b6bmKXF3XCTRZ2vqscBPO
         AVxfC0vr6bIHUfU9ZWeCCa8Z6gq72dZAptUqDeH2kSiGxwfKMGAzsWop2SxgLd9A4la8
         D/GVXOKCc04BB8RmEek86G3aSc4TnzmOy+otVYtr805T/m6P7XH3Zd+Bl0yJOwUJQiRR
         ONo31BYZgS2QL+CFXRGei/UkT6ByyqBj42TpuBcxUL3u0RZ+u+VzAiSazeWs85DejLzX
         ePpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXivI3C5UV8OjFKlV7i6TVnYHgHW1A6HQKXh2yXc3/5n5V0QIrfMlQJLuZsB9HSm1N8jmYEjPqsziNdrtPwRCBP@lists.infradead.org
X-Gm-Message-State: AOJu0YzAD5PAvl/ny49mdzRqod18+8TDw4c7fp8ffCPnlW147SW1kiKu
	Bfa6+3YV1Kd28IbHfzZdoo3UYhHyGMq25ln69crMCZCdSlmUw3nKVNXC
X-Gm-Gg: ASbGncuDk62z8WgoG8jmuNxnhaa7q8K1gIqMmhocurz4HfUtOwlVkIhx3oPktHhKiQo
	8TrQJSVfH7XWUtU2mDA/FBBEF8Oi64a48/finD2tMwvKA07X9oLgrr4AeXVvEBp1MAP6Wjnktls
	ziNP0RY7139FXFRKxjunjG/agEIy4K8hewJckO6Bz1It/dcm8Mewp6hud7m8w7fsPYbIrzlave6
	3X+7vmLbERcJNCKrQafrc6z5qT0T0AOLw6B6aRVoLl57opfmWK3605SdS8gLHBT4fFjHQaA+hQB
	KaLko+mXCm/Lwdf3eAl0U85SkVAN/I1v9gndV9p0SQh8puM6PYZ236JahTIYYyXWhIXsStKahSH
	B4awbWlzcE2W1+Hx/0xAE5pCPLj19Ekx3UfT/IwuiPtlcG1JLB3BpvDwdyfXutc7yT8+Uxi7Qfi
	w5fAzir6HDC0BbTjLYGP5Z6cIAnH2PviaClpSdyzTENg==
X-Google-Smtp-Source: AGHT+IFPlXF14w6080DzNThJvuRd4CnTuWjkOojD58VBx0OnrlrRgYOo8wgfu/qp0NZs9oaJy8dhYg==
X-Received: by 2002:a17:907:72cf:b0:b42:1324:7986 with SMTP id a640c23a62f3a-b50a9b61f8emr1913954466b.6.1760297042759;
        Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:02 -0700 (PDT)
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
Subject: [PATCH 19/30] drm/sun4i: vi_scaler: use layer instead of mixer for args
Date: Sun, 12 Oct 2025 21:23:19 +0200
Message-ID: <20251012192330.6903-20-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122405_229062_1557AD3F 
X-CRM114-Status: GOOD (  12.68  )
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

Layer related peripherals should take layer struct as a input. This
looks cleaner and also necessary for proper DE33 support later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  |  9 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 10 ++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9b938e3dae9c..5167c9d7b9c0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -103,11 +103,10 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 		vscale = state->src_h / state->crtc_h;
 
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
-			sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h,
-					      dst_w, dst_h, hscale, vscale,
-					      hphase, vphase,
+			sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+					      hscale, vscale, hphase, vphase,
 					      state->fb->format);
-			sun8i_vi_scaler_enable(mixer, layer->channel, true);
+			sun8i_vi_scaler_enable(layer, true);
 		} else {
 			sun8i_ui_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
 					      hscale, vscale, hphase, vphase);
@@ -116,7 +115,7 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
 		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			sun8i_vi_scaler_enable(mixer, layer->channel, false);
+			sun8i_vi_scaler_enable(layer, false);
 		else
 			sun8i_ui_scaler_enable(layer, false);
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ba9c03f04f03..ce71625fa06f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -162,13 +162,12 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		hscale = (src_w << 16) / dst_w;
 		vscale = (src_h << 16) / dst_h;
 
-		sun8i_vi_scaler_setup(mixer, layer->channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase,
-				      format);
-		sun8i_vi_scaler_enable(mixer, layer->channel, true);
+		sun8i_vi_scaler_setup(layer, src_w, src_h, dst_w, dst_h,
+				      hscale, vscale, hphase, vphase, format);
+		sun8i_vi_scaler_enable(layer, true);
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_vi_scaler_enable(mixer, layer->channel, false);
+		sun8i_vi_scaler_enable(layer, false);
 	}
 
 	regmap_write(mixer->engine.regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 82df6244af88..a76677a1649f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -909,11 +909,12 @@ static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
 	}
 }
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
+void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	base = sun8i_vi_scaler_base(mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_VSU_CTRL_EN |
@@ -925,16 +926,17 @@ void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable)
 		     SUN8I_SCALER_VSU_CTRL(base), val);
 }
 
-void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format)
 {
+	struct sun8i_mixer *mixer = layer->mixer;
 	u32 chphase, cvphase;
 	u32 insize, outsize;
 	u32 base;
 
-	base = sun8i_vi_scaler_base(mixer, layer);
+	base = sun8i_vi_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
 	vphase <<= SUN8I_VI_SCALER_PHASE_FRAC - 16;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 68f6593b369a..73eecc4d1b1d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -69,8 +69,8 @@
 #define SUN50I_SCALER_VSU_ANGLE_SHIFT(x)		(((x) << 16) & 0xF)
 #define SUN50I_SCALER_VSU_ANGLE_OFFSET(x)		((x) & 0xFF)
 
-void sun8i_vi_scaler_enable(struct sun8i_mixer *mixer, int layer, bool enable);
-void sun8i_vi_scaler_setup(struct sun8i_mixer *mixer, int layer,
+void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable);
+void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 			   u32 src_w, u32 src_h, u32 dst_w, u32 dst_h,
 			   u32 hscale, u32 vscale, u32 hphase, u32 vphase,
 			   const struct drm_format_info *format);
-- 
2.51.0


