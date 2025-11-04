Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC37CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9e8rf9e6LHkBiOZlGLaNm4D4EkbWbTfTmdYI52rOx4=; b=H3SHsxn26zReXr+XIvTIEU3CTb
	Av0HNkoIygaaPOEn4jIqeWl6Rh7rY4yzDM+35TC6oI2hve+x1mfbr5ZoXUqOa6vlVVPyDDaonH6Zu
	JzajUzxigYL8QOuooh9iGiK9PIDdkhGTF6xePma5DMvZCejhrFneNBZ3nEEYEQ3wQNatexdtjLkIw
	DXW95I5uDX5OBItrwc9+Kbdsw3de0WY8OhVSuRjmD0pC2yLNNKEleR/Tcuacl6NHG+L5tZKccwFBz
	8RTuFfleb0BB96QawMcl2dn6Nl2LxTnQ2uJoSEm0eon5ZnVMN5KagUM393purh7l/kiPbcwTbnlf7
	8F4kSDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUa-0000000CM70-0nAX;
	Tue, 04 Nov 2025 18:10:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUD-0000000CLZF-1kM5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47756a07b34so5041965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279827; x=1762884627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9e8rf9e6LHkBiOZlGLaNm4D4EkbWbTfTmdYI52rOx4=;
        b=KHWTO6fH2qJFePZgZC09bXzZTZmGyUSEBV9hlnZqJSMxl+D9vwtOCM7x0hkDY/Lenb
         V18cOmKfUIJzm1y2JlznAmOP8sAYuB5JHvE6mB/nLva3sxEzMN7IEtV5f2omlkXpEelT
         zal9C5hNfHPTQ+CSE4nYi8gNOR4bRIj6Gl2XxlZ0SqhPxuANcFZ0NChv/OYYccWr8HGL
         nbE+MbAXxxWf/8Sp/wa41mkZT7V4aeuuA1T0N5sAyReAdUGd9Uv42wbN8bxJ/viW3+zN
         5SQkqup+NpwqkzYRTQ5RAvDDHfY5i1Y481o6eGCxWHFr2Bw8E88zhhznurMjyR4ESmkp
         h7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279827; x=1762884627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9e8rf9e6LHkBiOZlGLaNm4D4EkbWbTfTmdYI52rOx4=;
        b=ltUk8O+VhJ5Cuwnio1q5NNJ4QaSHqiw5WmTZpVbX6Y9mft0zkCIGLZWw32cMBMwNFm
         Y6Zyy2lEdfDEjEbSZ31mthEXi9X1o5+Tbm+nAhtlnO6sTiwV1fIXLpLiRJH/qE3bb2Pt
         Th4ITZzlrG3+UGZSpbkRZnpee9F6wFVqLn5gceEi3URkICaHLiTWQs2KptELCrNJxcYo
         qkWcGyDmvL1Jb9cyvGMdUoYC/hOpLjzIcdx0i6MwsXp7iKbUKGTfuN7N/0D4gqSMoGST
         /Kw9Wbb4VspRPg6H/Q4PIO262zL7E4/C9vkXN4Cjxa5hHD+CWeHIKvl9+BhPnUQEstP6
         odKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk0/MCPaFydkQ6jS++ffPE3faL4/NBDO3u8uDNyax3yKoOFghgv5woSPHa3H38FHauEBFjHkXQMscp87kNHJP+@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ85VGP3VY/V9c/VCt2cRCewwowttI5K19sB4X+PFy+2602uul
	lpug+UxPpzpAQg9UhF8yVNPkfK71119+eVPWNg+LwFTOuf95/5msnL4r
X-Gm-Gg: ASbGncvmLKsju0MtoYdkNIP3sooxZOT69hQJmwaW4GQSYvtibD6mPf6V4AzibppTEc2
	RQtsScHuU1tnHgFu2a29/a2HmQxrKir9/O21O8nntFuEPzaxP1A4Kz+qJDUQ7WIvS97/rsDlfIv
	z2nv3b8NqRnljhyJLW9s49SeDL3ZVPuGzqgokrhfpPJiUoSvIKPLhpvq0weu8RckFQ4tGhtTED8
	ip54k2RfxQD1YyyYpMaq9EimtJMFm47PuICWXQEfcGqzTxVLRlT0i2esoTkirMeXYX1Nawb6XaS
	KOedKIxV0gjUuTxs87UuNzZyI+6k4T5Cj5/BiP+3hsZD1WRF5AxlPLBcA4VbYQHNRmLgW4y13ij
	V+FRTF7K40B1QC2EinvkCaIEXdYIployZswGqJ817e/1HTkE0RbqMYZ3EvRv6DTO8qJNBWB90TG
	MD8Mnv9SbJy5TanGrksQ==
X-Google-Smtp-Source: AGHT+IELopkSWYIIl/VfNpl6r5Rq+Y8BoYl0VoNX5IZB/3eyJjkFq08R9m6g4B9BfaHixSE6+v7NTA==
X-Received: by 2002:a05:600c:4f0d:b0:476:84e9:b571 with SMTP id 5b1f17b1804b1-4775cdc0ed2mr2735205e9.14.1762279827150;
        Tue, 04 Nov 2025 10:10:27 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:26 -0800 (PST)
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
Subject: [PATCH v2 20/30] drm/sun4i: layers: Make regmap for layers configurable
Date: Tue,  4 Nov 2025 19:09:32 +0100
Message-ID: <20251104180942.61538-21-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101029_646173_5C1FCFAA 
X-CRM114-Status: GOOD (  18.59  )
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

Till DE33, there were no reason to decouple registers from mixer.
However, with future new plane driver, this will be necessary.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c     |  7 ++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h     |  1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 12 ++++++----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h  |  1 +
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 16 ++++++-------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 22 ++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h  |  1 +
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 31 ++++++++++++-------------
 8 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 18dd998364ae..d2b7fc552a76 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -331,7 +331,9 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type, i, plane_cnt);
+		layer = sun8i_vi_layer_init_one(drm, mixer, type,
+						mixer->engine.regs, i,
+						plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -350,7 +352,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, index,
+		layer = sun8i_ui_layer_init_one(drm, mixer, type,
+						mixer->engine.regs, index,
 						plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index b5badfa2c997..2e3689008b50 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -214,6 +214,7 @@ struct sun8i_layer {
 	int			type;
 	int			channel;
 	int			overlay;
+	struct regmap		*regs;
 };
 
 static inline struct sun8i_layer *
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 5167c9d7b9c0..dd6cb09c2c01 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -53,7 +53,7 @@ static void sun8i_ui_layer_update_attributes(struct sun8i_layer *layer,
 	val |= hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
 	val |= SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
@@ -87,10 +87,10 @@ static void sun8i_ui_layer_update_coord(struct sun8i_layer *layer,
 	DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
 			 state->src.x1 >> 16, state->src.y1 >> 16);
 	DRM_DEBUG_DRIVER("Layer source size W: %d H: %d\n", src_w, src_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_SIZE(ch_base, layer->overlay),
 		     insize);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_OVL_SIZE(ch_base),
 		     insize);
 
@@ -149,13 +149,13 @@ static void sun8i_ui_layer_update_buffer(struct sun8i_layer *layer,
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch_base, layer->overlay),
 		     fb->pitches[0]);
 
 	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &dma_addr);
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, layer->overlay),
 		     lower_32_bits(dma_addr));
 }
@@ -264,6 +264,7 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
+					    struct regmap *regs,
 					    int index,
 					    int plane_cnt)
 {
@@ -278,6 +279,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	layer->type = SUN8I_LAYER_TYPE_UI;
 	layer->channel = index;
 	layer->overlay = 0;
+	layer->regs = regs;
 
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 0613b34d36e0..e0b2cfa02749 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -52,6 +52,7 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
+					    struct regmap *regs,
 					    int index,
 					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index fcd72c4fd49a..2fc54dc20307 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -143,7 +143,7 @@ void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 	else
 		val = 0;
 
-	regmap_write(mixer->engine.regs, SUN8I_SCALER_GSU_CTRL(base), val);
+	regmap_write(layer->regs, SUN8I_SCALER_GSU_CTRL(base), val);
 }
 
 void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
@@ -168,22 +168,22 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 	insize = SUN8I_UI_SCALER_SIZE(src_w, src_h);
 	outsize = SUN8I_UI_SCALER_SIZE(dst_w, dst_h);
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_GSU_OUTSIZE(base), outsize);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_GSU_INSIZE(base), insize);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_GSU_HSTEP(base), hscale);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_GSU_VSTEP(base), vscale);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_GSU_HPHASE(base), hphase);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_GSU_VPHASE(base), vphase);
 	offset = sun8i_ui_scaler_coef_index(hscale) *
 			SUN8I_UI_SCALER_COEFF_COUNT;
 	for (i = 0; i < SUN8I_UI_SCALER_COEFF_COUNT; i++)
-		regmap_write(mixer->engine.regs,
+		regmap_write(layer->regs,
 			     SUN8I_SCALER_GSU_HCOEFF(base, i),
 			     lan2coefftab16[offset + i]);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index ce71625fa06f..2290c983e177 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -49,12 +49,12 @@ static void sun8i_vi_layer_update_attributes(struct sun8i_layer *layer,
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_PIXEL :
 			SUN50I_MIXER_CHAN_VI_LAYER_ATTR_ALPHA_MODE_COMBINED;
 	} else if (mixer->cfg->vi_num == 1) {
-		regmap_write(mixer->engine.regs,
+		regmap_write(layer->regs,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA_REG,
 			     SUN8I_MIXER_FCC_GLOBAL_ALPHA(state->alpha >> 8));
 	}
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, layer->overlay), val);
 }
 
@@ -112,10 +112,10 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 			 (state->src.x1 >> 16) & ~(format->hsub - 1),
 			 (state->src.y1 >> 16) & ~(format->vsub - 1));
 	DRM_DEBUG_DRIVER("Layer source size W: %d H: %d\n", src_w, src_h);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_LAYER_SIZE(ch_base, layer->overlay),
 		     insize);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_OVL_SIZE(ch_base),
 		     insize);
 
@@ -170,19 +170,19 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 		sun8i_vi_scaler_enable(layer, false);
 	}
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_HDS_Y(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(hn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(hm));
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_HDS_UV(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(hn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(hm));
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_VDS_Y(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(vn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_MIXER_CHAN_VI_VDS_UV(ch_base),
 		     SUN8I_MIXER_CHAN_VI_DS_N(vn) |
 		     SUN8I_MIXER_CHAN_VI_DS_M(vm));
@@ -231,7 +231,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
 				 i + 1, fb->pitches[i]);
-		regmap_write(mixer->engine.regs,
+		regmap_write(layer->regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_PITCH(ch_base,
 							     layer->overlay, i),
 			     fb->pitches[i]);
@@ -239,7 +239,7 @@ static void sun8i_vi_layer_update_buffer(struct sun8i_layer *layer,
 		DRM_DEBUG_DRIVER("Setting %d. buffer address to %pad\n",
 				 i + 1, &dma_addr);
 
-		regmap_write(mixer->engine.regs,
+		regmap_write(layer->regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_TOP_LADDR(ch_base,
 								 layer->overlay, i),
 			     lower_32_bits(dma_addr));
@@ -410,6 +410,7 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
+					    struct regmap *regs,
 					    int index,
 					    int plane_cnt)
 {
@@ -427,6 +428,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->type = SUN8I_LAYER_TYPE_VI;
 	layer->channel = index;
 	layer->overlay = 0;
+	layer->regs = regs;
 
 	if (mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index a568e1db1e19..70766d752fa6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -57,6 +57,7 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
+					    struct regmap *regs,
 					    int index,
 					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index a76677a1649f..0e308feb492a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -911,10 +911,9 @@ static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
 
 void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 {
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	base = sun8i_vi_scaler_base(mixer, layer->channel);
+	base = sun8i_vi_scaler_base(layer->mixer, layer->channel);
 
 	if (enable)
 		val = SUN8I_SCALER_VSU_CTRL_EN |
@@ -922,7 +921,7 @@ void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
 	else
 		val = 0;
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_CTRL(base), val);
 }
 
@@ -968,36 +967,36 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 		else
 			val = SUN50I_SCALER_VSU_SCALE_MODE_NORMAL;
 
-		regmap_write(mixer->engine.regs,
+		regmap_write(layer->regs,
 			     SUN50I_SCALER_VSU_SCALE_MODE(base), val);
 	}
 
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_OUTSIZE(base), outsize);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_YINSIZE(base), insize);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_YHSTEP(base), hscale);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_YVSTEP(base), vscale);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_YHPHASE(base), hphase);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_YVPHASE(base), vphase);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_CINSIZE(base),
 		     SUN8I_VI_SCALER_SIZE(src_w / format->hsub,
 					  src_h / format->vsub));
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_CHSTEP(base),
 		     hscale / format->hsub);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_CVSTEP(base),
 		     vscale / format->vsub);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_CHPHASE(base), chphase);
-	regmap_write(mixer->engine.regs,
+	regmap_write(layer->regs,
 		     SUN8I_SCALER_VSU_CVPHASE(base), cvphase);
-	sun8i_vi_scaler_set_coeff(mixer->engine.regs, base,
+	sun8i_vi_scaler_set_coeff(layer->regs, base,
 				  hscale, vscale, format);
 }
-- 
2.51.2


