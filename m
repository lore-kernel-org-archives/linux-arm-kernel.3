Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF7ACCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DrFRmdaEbeeGFVkadVtzvz8t+dwN3rT/7iEQHdomrY=; b=j2VJZ8xOFkTpdKwKWUjIbj7TBy
	MzM1S2cghSeTNdaUugTBlnPZ34uEayLUJHQI7XQEchqDxShA0rYjSaI20rUl31MGvnRMk3lzgmiBR
	5/3impbU1jneYsj5Epm3pew4GkwNI2FZZvUeWbTzyNnYaymZpjxhEakxxMPBskjHTwrmHmaisISGi
	rIUhnzE+SrNdVsjU8NiEmwZ8Py/U8eO/vaU2mKaHiEAjOwK/zfNDdw3k5c9hHljmA2wh44eQbnAQn
	GjX+9tAscVbT1LopsfVyajzyD7PbgWG0yvjimc4WDpWA1atNcanwyZjXA6jG0PoyHfvv56kFfpQHn
	4wPegmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gP-0000000Bgno-2jU4;
	Sun, 12 Oct 2025 19:24:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fu-0000000Bg2U-2O3X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:14 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b00a9989633so650788066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297048; x=1760901848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DrFRmdaEbeeGFVkadVtzvz8t+dwN3rT/7iEQHdomrY=;
        b=QmYMmsdQvLhT5Mq93JoEg2+uxaMm1K9KacrJcluPunwEygUjqm13fPNYOlSfcQzSWe
         3c4SqNVVHyfr2spqZmWNhrYC9FP85v2sM3SDejpwVugi1sQ7hLkRYoRBc9YFFLcZ7S3T
         d8b9WBs0AP9oEvaIcTEWaXBYoeUIAafW0tCOU4A223M3Ryd9Z+symS2nqd0gsViSEaTQ
         ipPhr5dpoXGD739GhJXWrvo4AOOVL3iwg1TaXU4lAaVhsFwOlujIPk7iGtWNN7loF0bY
         Dt5EANC8QvqZmhAIp85nx1/ABMxChak3/GmtOulWE+zX1A+REYOC4ktYMQbiYGYXAEL3
         RjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297048; x=1760901848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DrFRmdaEbeeGFVkadVtzvz8t+dwN3rT/7iEQHdomrY=;
        b=mrVN5IIAK2CLJVkWKcwPKiW6H0hMRMrISETLGLSz4epZFrf6DXhhnMYCq6hOlMLpT/
         LryDfJt2Z0a1vEISu8ZliahM7OjkL6tu8ND6ypJdahwvd7FuvKrTN56lx0ehaXzPQ2iT
         cyTCqSH77n6CzPgOCTN9wNU/cF7WEtpTRVQjM6i2kNpQYOhf/L0zkyyeUQFb0v1vyELQ
         olI/T9KMv64BaCWbg6ToqP9BlOuDX9ExvNG3/W7ZyEZYkiR3uOYKGdqrseqcn/w0KOCH
         HKGfebTsSw6nd+6x8e8VgotiExmR+e9JKJDqGYqdjOa/Ifjp9iHGTrmVXSx6LWBWbhj+
         w07Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAU6lFVIhFSrIfEM94tgWrR6ed9zQg9oZAALC6+2rPsJTyhaVPPoysuCwW0TCVBECBlpsxoUvrUEYSn7t3gwLA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/lf4d+8h5Gg9p7iqBVS7tBFNcKVjQ+hXF8BiMgQlxd9OhRMx6
	fr4ullHOQqzBhiQJBvZ85NziOWJO6gNHQ4zjwwJgJRf2QhtUrE9wFMQO
X-Gm-Gg: ASbGnct4pl4LWQqrEYdz8aJyQca3uvypu9PFXe8rZEENjTUJ1MMR2vQikqEHK86xhTx
	dqgXZxF7AWmpKK9pmEty7Cj28uIRb32VfdbxAXInsEcNKKZyJiO29WK9UCTVq8M4Pwxk0NVcWtw
	cNRtQ62817C7gCJ/EKKVYFNnrR0EpxzqC4eljGzlJA4t4JOtSHsImGHau5HVkE06YSuwi2u2Lti
	F66CXEGE/9RXQASqih+lnUDeJcZHw1RgSU3XqZD0jaQT5aqL3KwyMspa3RZZ5/rg4P5RYRzA4ev
	jXykIkN+oKUJcmxm575w8j9s0fupzNi2FKTAKdUM6aQtxibhsqUdr5ZzChdPmoS2aVx1Id41Y9g
	OsqJFuq1UCkVvowbXF0sbVxNGmIHmWt3oncgKjXE20ns7PeeEPi813OMZarHSjsQievB9IYxv5r
	Yw7viF0GuZBUMyFzXE6jSo8OxoxMANpfw=
X-Google-Smtp-Source: AGHT+IER01mRpg7q1Zer+a2Fi+tE48PQj5/njKDNX56YMkXj51QtTvzlx/6vPlXBx59MZeSRaZhVJA==
X-Received: by 2002:a17:906:ee87:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b50bf7eb3cfmr2100938966b.30.1760297048395;
        Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
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
Subject: [PATCH 24/30] drm/sun4i: mixer: Convert heuristics to quirk
Date: Sun, 12 Oct 2025 21:23:24 +0200
Message-ID: <20251012192330.6903-25-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122410_725453_F8B62B1B 
X-CRM114-Status: GOOD (  14.59  )
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

Determination if FCC unit can be used for VI layer alpha depends on
number of VI channels. This info won't be available anymore in future
to VI layer driver because of DE33 way of allocating planes from same
pool to different mixers.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  9 +++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 +++++++-----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 267a6f75feb2..78bbfbe62833 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -707,6 +707,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -716,6 +717,7 @@ static const struct sun8i_mixer_cfg sun8i_a83t_mixer1_cfg = {
 	.de_type	= SUN8I_MIXER_DE2,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -726,6 +728,7 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.mod_rate	= 432000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -736,6 +739,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -746,6 +750,7 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -766,6 +771,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
@@ -776,6 +782,7 @@ static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x1,
 	.scanline_yuv	= 1024,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 0,
 	.vi_num		= 1,
 };
@@ -786,6 +793,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 3,
 	.vi_num		= 1,
 };
@@ -796,6 +804,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 	.mod_rate	= 297000000,
 	.scaler_mask	= 0x3,
 	.scanline_yuv	= 2048,
+	.de2_fcc_alpha	= 1,
 	.ui_num		= 1,
 	.vi_num		= 1,
 };
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d14188cdfab3..def07afd37e1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -176,6 +176,8 @@ enum sun8i_mixer_type {
  *	a functional block.
  * @de_type: sun8i_mixer_type enum representing the display engine generation.
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
+ * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
+ *	Most DE2 cores has FCC. If number of VI planes is one, enable this.
  * @map: channel map for DE variants processing YUV separately (DE33)
  */
 struct sun8i_mixer_cfg {
@@ -186,6 +188,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
+	unsigned int	de2_fcc_alpha : 1;
 	unsigned int	map[6];
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 44e699910b70..8eb3f167e664 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -48,14 +48,16 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 		val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
-	} else if (mixer->cfg->vi_num == 1) {
+	}
+
+	regmap_write(layer->regs,
+		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
+
+	if (mixer->cfg->de2_fcc_alpha) {
 		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
-
-	regmap_write(layer->regs,
-		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
 static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
@@ -450,7 +452,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (mixer->cfg->de2_fcc_alpha || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
 			dev_err(drm->dev, "Couldn't add alpha property\n");
-- 
2.51.0


