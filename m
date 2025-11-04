Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC2DCCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bd2rGfbR52BnpdSsNRlsO1gNn2vRHDyP0CX62x34+dg=; b=LiSpuLoUpGfJm0ijg6y7qtTOVv
	md8rsGgOuSYHKJEatihmXU8qd3ChZSKWCqbHwzMibeEHX6gcoOTCJdn2qCiK/YEnUIYDFnhC/EWWz
	xPLvLNSOOC1dFj4TNpXn0ESdf2ovw/FcFTZzFFsdxgMw/2GS5WdvOAKttEa6bbjufTthraQ9NoKm4
	PO82fWtpopZtZ0lkyN+k1Lvs2MPwJdDK2XH/w4KXF/BKrVsh9sD3HC7GtE4yWwhr4KBIlh3dy/BBB
	cYl0b4l3SZ3bEHQKYvDfrgY4VeC/rA4ZCSXdI6QRg1OKBV9sMyq78+RO2cBD4jonzvoOPraRrDvan
	uXZLM27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU4-0000000CLQx-3mhV;
	Tue, 04 Nov 2025 18:10:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU1-0000000CLJN-1OEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477563bcaacso7269425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279816; x=1762884616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd2rGfbR52BnpdSsNRlsO1gNn2vRHDyP0CX62x34+dg=;
        b=h6Lc9S5JhzWcjX0w1DmCc63xoZCteGgv+wfnbY+cp7FHtOBZfnT8Q8StyzPZ59bwou
         XtNKqeee327oaEeP6HYY03s22YVDzpKYikdNBi6qXV3njM2EIlykkPgtsZjhiPM4i4UB
         BnCDQe36/vEN/x6dw56w2LlF/BqG2bAd5Eifpl/2zBszi4z1Q7xb2LCr0dZSSe5Nn01H
         ZjYM7ONDf1qTFDG57e50qkxL7tfAxupmmAc+b5quk6QR+13iCeTz2IBlR5t2CYU787HM
         oudjErp9p/Ok5B5YFewO0ekwIL4vMUC9KVzbiSFu9756c9mW3fZzjcCEaBFjm+wjG7xm
         bV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279816; x=1762884616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd2rGfbR52BnpdSsNRlsO1gNn2vRHDyP0CX62x34+dg=;
        b=DRKrcSdtpf8ejGs7a+DS8JpKrTwyCgSKb7lZS4sglFtWbEcMm80Zv2Dcc7cqMnqyIh
         rvE0NxP9C2Nwxk9w9ganU+PMx6rXK7qIXzDanq7zZK9pvnm0NTz0w5hyTOniRHkmSdyS
         KWQa3R616beBcUcBNmos2bIs5gWaCuarAetfmn6GJL4AnqK83DUs1WHNwEH9jHJvCT0x
         1lRyqgEsUO6vsOCh3PEiQhMxfF2F6HS3mcWnEj/L/2Ylgh74AS7BJZ8GZ4M8XFtogn+L
         KE+o0UBbmnOuxU401HdLYD+zf5MSd3OrHBnl1IMW8p2J27GaYZs6XXcF4cQiMQR38IhT
         JXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUwEwG4oV7EhB1cSjSp5a8yDot1s+Be1mbFQdTXM+Gg/Hk2fjKg9LkiQaYgBJBL65T31xGimfsbF2l9JhnVdXKs@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZHH5J8ZzJCGgiarB30ug5SNOoBArCM1B8RJxKtalPXMr6tf+
	eMbyL0JcXsroGSZEfknP14QM6MLrnEe+KbsXGFcIGG04LtZArfzfBdry
X-Gm-Gg: ASbGncvye5DUJj6XvyFhBxR0eZH/tkJX7byuTBQFeRNHdIVTRazxZTv+7YUrarvWsTj
	IhYA0K34b5tPEtzMz6+7AdKERqle8HUaT2h/lOKnFdUZlpVP+JEXXSkgTvbdiyBOx5T8MP6NJRE
	CuIKlJUBLP6rW7gOqkZJPd9Q4L7Obb3KU25EahynnikJVzvF5UJ9G3tj0HGaaN/ix6TnnpSTr1v
	oAGwkCpkeD0mThLFUwRTBTS1/uxUEm/2uip9nX+LX3YmsiYb50TCr5iPXRakFfo+iEhDgEWw6fc
	T8gLJ8xArSc/rZi02UHTrt8F1fP7Ogs9Y8f/PbcnyfskhLPzIy+wfvqwkyUqSv82PKINSLwQgQn
	CLYcrlrHk1ZDWEiWG/sU6leylYK6Vbv/XDsdJFBUGTeC+vYNGTRjfrpqRAMM6/B9ht63FvizXqX
	zyAlYqgCIBlHv08OwOXzmMssF9qtq7
X-Google-Smtp-Source: AGHT+IG2sBblS49qAXjvkf0vtV34n/K/LEVc1O2UQPjWyBa6gyH0Uf01mtvCoKB5v5EtjbqR1NJhbg==
X-Received: by 2002:a05:600c:1994:b0:475:dd59:d8d8 with SMTP id 5b1f17b1804b1-4775ce9ba5cmr1913685e9.8.1762279815509;
        Tue, 04 Nov 2025 10:10:15 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:15 -0800 (PST)
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
Subject: [PATCH v2 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
Date: Tue,  4 Nov 2025 19:09:23 +0100
Message-ID: <20251104180942.61538-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101017_442599_08C2BE9D 
X-CRM114-Status: GOOD (  14.80  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2


