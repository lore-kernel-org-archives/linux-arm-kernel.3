Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFAECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljTiHpH/7wCq4Sb80OipRX+gpuymv7x8m1cTbrMD8nQ=; b=tpPJiFkg3Jspdeug7dlcTWuqhr
	N+q+VK//6vIUad/iRW+oAtCOO83e9TrRKM4e0qXkh2lY6wL/9uYxMsjhGum64WpUrBBJLYSZfri5T
	lfM3VzqlPGY6dvaYNBYdlvNjZyGrTftOfluvWEP3USN9sFBMS3Tt+MkoUbjQ+ozTsL862IQgXZ4Vs
	ULggKDvPmC6OrJUZrBvifzJcdEuCVe1xwtVyZ+M86eDBzg9zdtd2tfHAZukG+VSXv3BJjguv+x1oT
	bJvMzVPlIsaJ/EaFr7Lp3AGVeTEY5vhIg62/i/WrjLwrEXZAtHcFHbVAVRHj878Bm5o9GduZYurf0
	nDHoK3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fn-0000000Bfts-2gDc;
	Sun, 12 Oct 2025 19:24:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81ff-0000000Bffj-1cTX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b3e44f22f15so514469466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297034; x=1760901834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljTiHpH/7wCq4Sb80OipRX+gpuymv7x8m1cTbrMD8nQ=;
        b=cs4v1Qm7bAOBPQ7pLPKb80FBBB4u+yezegSpgSgx4Qc/wPxCDDhnHG8YK+niDjHNR7
         XpKRjYdU08H9iYL76B7nPJc0++gnGX/ewIyyocImoQXMskSD3WRP0qOKpDY8231aZ4C/
         NAzOq7EZyJSNyc5OkCw7kzXbJBVsqNzFztQ6AvJqpdOc55HKlOZp9boLtFo+xiGQqI8/
         4f6Gk1rnckaDlb/VAjxyG7kQINsYVK1eUN/5TGMST+7x9u0gQOM4YR+Bz4fEdMZkqOjy
         dW0punPl+9AMuNB7j4yHYX4qT1/3+6zI8wbTuGOg5ysgkvseVqJVWWcC+sOM064lSwE6
         M0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297034; x=1760901834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljTiHpH/7wCq4Sb80OipRX+gpuymv7x8m1cTbrMD8nQ=;
        b=P8olcBx30UW6vR7lpuInMBDN5pGdO41xD6jOxZmc60jjF7OEvadGG7ciXosCRfHbjs
         Iah33QBOOYaQ1HCmyLYn25Om4qkkpFj5inBseTpxTlZtcT6+HzZwpXEd7hSaQML7I2Hg
         ETPWCBYzggL6jRa6ulocAIsGOkHLmf65N/Dn6QblmZYNoQpZ6fg7MedAoiCP+lhNziN9
         AcqPYzJwVCAxf7hNeRxuTt67yLRi6F53ktsDSmjDz0eWtoStFHKhXVOCBzL0v9uwXGgr
         JbzXD51KtoBVHHHW8+rnsB2SvuV3yhB3miQA/OacS/GXr1PFIvfJJcDJ/LC85LNcYsUT
         r4qw==
X-Forwarded-Encrypted: i=1; AJvYcCWMy94zGXzovofNQ9r13c+LGN2tDFCpbihbskml8GuQsQ/SkRY1XGvIDONU9jsrD7jw1iOEs8CSn7t1ceY/eKC5@lists.infradead.org
X-Gm-Message-State: AOJu0YyZo5X/XESYwodAiMssG0ta3rBHmQytJRtcxRV270mxsEj7lpqE
	gfh0CZkVHEEHWbErGE9E2BuMZvq7Ajngla3Lb3yCFfYSJvhjn/O+sWeE
X-Gm-Gg: ASbGncsDsyijUJLYraxnG8bBY7o9RB5G7+IHgjPyeWzvMP4K1cWrTWkCQH+AwDL2V02
	8pRnC2CWiKcLNcxy1x8mIO2C5wvcsKKOlr5QfINhsGHjdAkhipSTEmNvEaEwp/C014RGpaP/bs5
	D4JC6vGwQ2X7Q0O4kQwkobd0ILwTPAxdDeAS9mfXXCbiVmomGPPhpIbJ7+V0Re2bJd9W2YA046W
	A/oR0ZiBYt966jX9RtI1BFCimXkLwyucQ0b2VXY9wwAF0OE9HTj1Z9NHoxC76hQz3Sb3dEItZvo
	heDcsUXSmDaH8cordsa9wc2KXDhidBoocDLSI5Qk2Bx/Y2734VvKCjP7jWtOyy0r88ZOkuF7z2J
	9bMwtILvAn2anbI/Dcp3Ld5VCQo8YzScm7J3enExQwAEUUsip5fmoJO0wdcp2QXDK9HPnpp51y9
	gY9V6hrl0oInIilKhqPuuu
X-Google-Smtp-Source: AGHT+IH2UBZhZnnANHj8S5Ub3yMR8kafMnVt2A0h1CRlogccMK2B7fLAfojkqBw32F0r0liwzWP3zA==
X-Received: by 2002:a17:907:da1:b0:b3a:e4b3:eeb9 with SMTP id a640c23a62f3a-b50abfcd075mr2031796166b.55.1760297033577;
        Sun, 12 Oct 2025 12:23:53 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:53 -0700 (PDT)
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
Subject: [PATCH 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
Date: Sun, 12 Oct 2025 21:23:11 +0200
Message-ID: <20251012192330.6903-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122355_556333_F788184D 
X-CRM114-Status: GOOD (  13.90  )
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

Merging both function into one lets this one decide on it's own if CSC
should be enabled or not. Currently heuristics for that is pretty simple
- enable it for YUV formats and disable for RGB. DE3 and newer allows
YUV pipeline, which will be easier to implement these way.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 89 ++++++++++----------------
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  9 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 11 +---
 3 files changed, 40 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index c100d29b1a89..cf0c5121661b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -107,23 +107,28 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
-static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_csc_mode mode,
-				       enum drm_color_encoding encoding,
-				       enum drm_color_range range)
+static void sun8i_csc_setup(struct regmap *map, u32 base,
+			    enum sun8i_csc_mode mode,
+			    enum drm_color_encoding encoding,
+			    enum drm_color_range range)
 {
+	u32 base_reg, val;
 	const u32 *table;
-	u32 base_reg;
 	int i;
 
 	table = yuv2rgb[range][encoding];
 
 	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
 	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
 	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -135,28 +140,37 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
-static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_csc_mode mode,
-					    enum drm_color_encoding encoding,
-					    enum drm_color_range range)
+static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
+				 enum sun8i_csc_mode mode,
+				 enum drm_color_encoding encoding,
+				 enum drm_color_range range)
 {
+	u32 addr, val, mask;
 	const u32 *table;
-	u32 addr;
 	int i;
 
+	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
 	table = yuv2rgb_de3[range][encoding];
 
 	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
 	case SUN8I_CSC_MODE_YUV2RGB:
+		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case SUN8I_CSC_MODE_YVU2RGB:
+		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -173,67 +187,30 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 		}
 		break;
 	default:
+		val = 0;
 		DRM_WARN("Wrong CSC mode specified.\n");
 		return;
 	}
-}
-
-static void sun8i_csc_enable(struct regmap *map, u32 base, bool enable)
-{
-	u32 val;
-
-	if (enable)
-		val = SUN8I_CSC_CTRL_EN;
-	else
-		val = 0;
-
-	regmap_update_bits(map, SUN8I_CSC_CTRL(base), SUN8I_CSC_CTRL_EN, val);
-}
-
-static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
-{
-	u32 val, mask;
-
-	mask = SUN50I_MIXER_BLEND_CSC_CTL_EN(layer);
-
-	if (enable)
-		val = mask;
-	else
-		val = 0;
 
 	regmap_update_bits(map, SUN50I_MIXER_BLEND_CSC_CTL(DE3_BLD_BASE),
 			   mask, val);
 }
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range)
+void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+		      enum sun8i_csc_mode mode,
+		      enum drm_color_encoding encoding,
+		      enum drm_color_range range)
 {
 	u32 base;
 
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						mode, encoding, range);
+		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+				     mode, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   mode, encoding, range);
-}
-
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
-{
-	u32 base;
-
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_enable(mixer->engine.regs, layer, enable);
-		return;
-	}
-
-	base = ccsc_base[mixer->cfg->ccsc][layer];
-
-	sun8i_csc_enable(mixer->engine.regs, base, enable);
+	sun8i_csc_setup(mixer->engine.regs, base,
+			mode, encoding, range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 828b86fd0cab..27b6807fc786 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -28,10 +28,9 @@ enum sun8i_csc_mode {
 	SUN8I_CSC_MODE_YVU2RGB,
 };
 
-void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
-				     enum drm_color_encoding encoding,
-				     enum drm_color_range range);
-void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
+void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+		      enum sun8i_csc_mode mode,
+		      enum drm_color_encoding encoding,
+		      enum drm_color_range range);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 727117658c6c..adcd05acba1b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -213,14 +213,9 @@ static void sun8i_vi_layer_update_colors(struct sun8i_mixer *mixer, int channel,
 
 	fmt = state->fb->format;
 	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	if (csc_mode != SUN8I_CSC_MODE_OFF) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
-						state->color_encoding,
-						state->color_range);
-		sun8i_csc_enable_ccsc(mixer, channel, true);
-	} else {
-		sun8i_csc_enable_ccsc(mixer, channel, false);
-	}
+	sun8i_csc_config(mixer, channel, csc_mode,
+			 state->color_encoding,
+			 state->color_range);
 }
 
 static void sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
-- 
2.51.0


