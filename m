Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AEFCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXvWsmt1Dzl8GlEdRb8uf55RYf0uTWm1vCPWOIYaG+k=; b=Fh3D/bnopT7NT1ZXw+ql9DhgAH
	wcDjPKt4Rm/ySLdW9SD5jyFqHny5tFWz/Z9NprYA13OpdWF3Yon2K1IeeQqOWGb05wEJrqeB5UwJe
	Wr/hPw2mNiwBlZfrm6ZxvPalKdajgAsdvZz9/iXG4RGQdGVEFBq5I5qucCIYlh5SXPbgThKt8PUsV
	wKUu/oVOKBH8zmSKQv2RIQdzldRSCkCck8td9GRPrB6WJ65+32o3w2MeeynyQRBUQw4J70rKDatNC
	/BBRihpvsdo60H5e17rR4DUqKpsoFFJA5k4qAv+phVdw1f/wkfzY+eY3QQKXXJgSaZmWyeRF4aUX7
	yOjeOeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUS-0000000CLwg-0QhT;
	Tue, 04 Nov 2025 18:10:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUG-0000000CLdW-1LvO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QXvWsmt1Dzl8GlEdRb8uf55RYf0uTWm1vCPWOIYaG+k=; b=ReV9TEarumyD5EzIcNRXk3M0vt
	vQ3uxn8Or1q9f3z0pD6kCEXaPTVpD7UdklipIEO5vJ2yyR7FUSY9it3mnE76XDmolFXkknJsyOL6Z
	btvPqPFG0qMQolMSMeOh+AYNS6kKit23cHFSh7AhhCklIySS0IqMdStCuazA8cm+w2IsrO/WHm/v1
	PLuTMEQavjjFrj6qYqrN6Jmk3iXEdsKl39xXB30yyBAKokbBZbRRVGhJF66twjAEB+x4BuKWbQcwE
	rLYdGs2kszc//aHHnQeDQwjGQdcShVJfC0NPJxKzzQGABoRd4nC3AUQyGeBo3KqDMQ9j73mwUiYyM
	QLu9W30Q==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKcV-00000000akh-0YB8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:15:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47721743fd0so31653685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279826; x=1762884626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXvWsmt1Dzl8GlEdRb8uf55RYf0uTWm1vCPWOIYaG+k=;
        b=IGGCQqsuLC+Xue21BeW2UWCF91cSUdH/UWSqvT5SXDngEEaPl2qnSFo08vh8okVYIi
         6FFzpRnJ1A4KqamOz/XKFHaphzq3U51PkOBEJiEtPwtRkJ0rpFVwXA9lW8lFJSLIlhsL
         xYajRnzsAsPcsGpGzKDVxuD5voXwh3hA0ExmIfRzHSF9TM0p1zuj1sCKouYPdS2gu8Uu
         CY1DRYUqYmcah4rQkB7HbBdmW9k6GmROoJpCItEXpAjr9+XAcu1Xlx0ngPnBnASMbUz7
         wYZfHROYTCQuOVD1gHsOarWa5NRaLDWkGTd+l3lEuDqODmQuzBJ7bOGqRIwKyV0igSG0
         9ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279826; x=1762884626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXvWsmt1Dzl8GlEdRb8uf55RYf0uTWm1vCPWOIYaG+k=;
        b=KraDF60jXv8aVIGtSZkSCiegg2FoLDAn5NuMjMQQMlfGMOI13LPw38HUeMapo6YAtx
         wRvvKjjVHV+DrJnfUGZkYMF3utj6qkgO7Q+zNDxbW8wYeVXl2HgKQX9wGv5eN7Hr7y25
         RlsTbXSD5PqJhrmnUJGTrOJlMO63IlcP+GwBKasIrYuxwKbuzBRsnOU9BrXi02vppCuj
         f69m+D+8D9lwH95SSS7Twca7F7pJvU7qg5AB+8KfzDoegY5MQMPwLhHxHKAzgcpPRqwr
         1Tkh4+OFG1s9S7AwjPnm/rjghXebWQRdYlBZo3novcxoEflcNCel6V41cEyiluQfehqs
         rO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMTK0J2AuqiwTGfDqnyeuK2UwRIItMf18C7j4aQS56mVm10xlNk9/9R/lYFwK1eqLQ+zILvsQIhcPvdQKHJofu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7WiOXIAmmGI3ihjJAwL0FxnaDIYfqwaPcetx22W7qXLereawP
	JvVXfZgUx9FrDGyaSpVkU6HDU52LipVCDfs+LBH3ymOpjcSMZm4pJDT+
X-Gm-Gg: ASbGnctss7S0ySQrSWMTTA8A32J3Le6uMtB0Yy3E18rXSuI4IbSrE1BqqB7oJBAhNSy
	9xDvGQ3+WhgW6ziXxjrDl6RwwCIxC9bvVCO7U8ceTSGAuo75xTUe59Lu2RX9paG1Onxs8zrjGar
	aSM7chcfhMoc7ilTNKzpVpA4v1Ix1quByUx/SXc22pGaaoJCyuWosBY5DMYGJTZgsHL5MvJ8Izm
	znWsts93Ml/yFCY/1E7T8EGIihvRM4dF8jENwg1SCO4uD2tawDV/KjO3f9lw+Am3Cbopf/7rQg+
	Ki87cBU0fnpx8zDwsT3R5bp24nyrfwqpA7ULn5o3yv0rxPZfRSH250JzBB2a6WOTVP0UBii8JhY
	UCEZFPDt5GAcphI7+h0yF1z3W1ulPnVvhqXlkzHbKwdxojU4Hjxt5KWRJppRxrlznyoBjGQp9Y/
	nE9sVVtRnRRslmk6iQeQ==
X-Google-Smtp-Source: AGHT+IFE3mxZcmB3xFrOwCz13wK7MeGXCTbyLCsueT8YPunx796HFToC9lCdkfkmFYbtx1fnK13ZUA==
X-Received: by 2002:a05:600c:46ce:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4775cdcfbb5mr2723405e9.17.1762279825932;
        Tue, 04 Nov 2025 10:10:25 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:25 -0800 (PST)
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
Subject: [PATCH v2 19/30] drm/sun4i: vi_scaler: use layer instead of mixer for args
Date: Tue,  4 Nov 2025 19:09:31 +0100
Message-ID: <20251104180942.61538-20-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171459_293251_C025BFF1 
X-CRM114-Status: GOOD (  13.53  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2


