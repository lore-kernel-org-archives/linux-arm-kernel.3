Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CB2CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=; b=lTSIpTulXDNCd4qb1h8OZymRg6
	DQpoInqEt9e0x0ACAfHqIqO/k7dxORW5zp3UwoDxWzB0KGheuP0yBs7DB4YAY7FhKnIiqEHrwZEnw
	AFTg1MNJrST9JUy4ULhPDe0ccs/yfwTgWTa+BlPeUkZjqrOYStzLEAOcrBiF+KROF2819xHosQQPc
	Fof2aGXLqXMo8u9QfOFmBqMWfyTkemXl5+jj9p2WEZXC3thMTTTuiZ+lNfvgqZqz9ULbYQpVPZ5Zi
	xV0+gismbU6O1AfRCXwYBAf6pMiSK3uRvktAkRkG6Hk4+Mv3kqeua2HNJGM0KVUXZs0toizS43U2x
	Z6z8V6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUV-0000000CM12-11CK;
	Tue, 04 Nov 2025 18:10:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUF-0000000CLd3-37R8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so31864305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279830; x=1762884630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=;
        b=f4eIo8wmPojxCb4sfvGGpUl/IyzqxCUDxyCp/2FCwKpD21cK7Bs0zANxQKnRD12Axp
         pCViHRRnJsJWIQ1mCdmHuBaGdRqRYJnAUNSGZ4xYLIsOV89vZZp62UuaOpPb26YAEA/L
         Fh8nGtKGF441ziYP4WZPCt+Z+nJlogIsJi1H8T0e5onmpDKjNPlPX+fIVWACmUY4Nsxt
         MG1zm+H0FvUry0led1nfbdCF5wY7gR8Rl03kjl0Unm4X0woJ7L+6LGiB3tOMu9nDEDeA
         0SiT/lC3FCgtjPLs3WmooLeYof/7HZS2DsKiQCiNDl1RGN6irFPukdOMVonPRLhtBfBT
         v2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279830; x=1762884630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9/AMl4xgUVEiUmyMxeIjWVAIaeS72AyB+f50sJb9qk=;
        b=Iyux/fR8ZB+cNtPqVxxmMCTfsVk71VRtjtRV04dQqJSfGmWA5AP8nUB94JTUPAXP0h
         rbpxWjQbXL5QLri78eRwGNNBZ4bd99bjLgIM7/goocGksF4VmWPX6czWMKQ07ND2XiHH
         WRRCCQZge9gqNPHWE9MAIf3zH+BI/6T/1G8NA7p/mNneUGpIRJCBHOnjdSielea9nrzd
         BLQBMxuTYj++DFQVauH3C8/MmZse6jjjUU94CoXe8dsgoMebuZpO3lMInHMsor02siPq
         J9j0+Bar3lzX2wuexZnj2rvausYYGlvPnhx8j63JlFuCXl30PD/vTeWKWpIIlVZwolM7
         6zDA==
X-Forwarded-Encrypted: i=1; AJvYcCUQn4yrapAuasMiky68rEB8XJmHjg9zD23qxw2YguJioqPsYI2yrAhFiAggwCg9ehGoH2nqqrpexKSLjaKwFV2/@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/hMTEm7d+rJlAn0xGOQas47qrm92TKa/eLrpxgYwqmxbGEEW
	PUJaoN9hijL+SQu3b67h2+2E3PCPc/Wdgs5/xh738iuC0hHDPut/Ju5T
X-Gm-Gg: ASbGncsI4JXYukECWC06wK3rHa7I2JNdMooG5r1nJE0sbjhWJZOVEOgPfpbTGwe2G+r
	cnsGZa8JhhEnvP50OMrw+G8GLgRmxu71iuGJ0DAEHQOorIpsuwI1DvpZuKc2kNiAxTkMZs4kd7+
	qcmCpRENVxFUtcjOSvqgJGd7ZSudVJISHDY8ujfUaPaxryQRTwsE4ZS59ZyWbOtn2ObBEJgU9nX
	JOVMtCZdgG4AMkwtJumAXqXhAC0JH00uS1HX4/apEmsBC7xXnC9dH6/EDEkqIZhXVVcpd9p2SAt
	AkFTYh+o6JrZQS42h6POtoiNZPVsG1Y4/U55TqFRWHLahXXiVazxvILsEudHhphRuwEm8yVHSBz
	8aC8YI/5o6mJhxE74nriJxwVj5055hix9bfxbi/AdMByrJ4HOs9QSp+8jEfgGwXbZ3aw8To1hbD
	WeWGiVcCsKGBD4DDO9Ew==
X-Google-Smtp-Source: AGHT+IE8pg2fqunzszYJMCpOfAsCZLtKqT6X6xX+b+FBqXNTS7M6/iDgmxVd2/hVTJsg7USbpjI7+w==
X-Received: by 2002:a05:600c:5403:b0:477:54cd:201c with SMTP id 5b1f17b1804b1-4775cd9c25amr2654245e9.6.1762279829609;
        Tue, 04 Nov 2025 10:10:29 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:29 -0800 (PST)
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
Subject: [PATCH v2 22/30] drm/sun4i: layers: add physical index arg
Date: Tue,  4 Nov 2025 19:09:34 +0100
Message-ID: <20251104180942.61538-23-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101032_314466_24F16EEF 
X-CRM114-Status: GOOD (  15.80  )
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

This avoids plane mapping in layers code, which allows future
refactoring, when layer code will move away from accessing mixer
structure.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 17 +++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  5 +++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  2 +-
 6 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index d2b7fc552a76..267a6f75feb2 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -283,14 +283,14 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		h = drm_rect_height(&plane_state->dst);
 
 		DRM_DEBUG_DRIVER("  plane %d: chan=%d ovl=%d en=%d zpos=%d x=%d y=%d w=%d h=%d\n",
-				 plane->base.id, layer->channel, layer->overlay,
+				 plane->base.id, layer->index, layer->overlay,
 				 enable, zpos, x, y, w, h);
 
 		if (!enable)
 			continue;
 
 		/* Route layer to pipe based on zpos */
-		route |= layer->channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
+		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
 		regmap_write(bld_regs,
@@ -317,6 +317,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
+	unsigned int phy_index;
 	int i;
 
 	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
@@ -331,9 +332,13 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
+		phy_index = i;
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			phy_index = mixer->cfg->map[i];
+
 		layer = sun8i_vi_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, i,
-						plane_cnt);
+						phy_index, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -352,9 +357,13 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
+		phy_index = index;
+		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+			phy_index = mixer->cfg->map[index];
+
 		layer = sun8i_ui_layer_init_one(drm, mixer, type,
 						mixer->engine.regs, index,
-						plane_cnt);
+						phy_index, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 2e3689008b50..d14188cdfab3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -212,6 +212,7 @@ struct sun8i_layer {
 	struct drm_plane	plane;
 	struct sun8i_mixer	*mixer;
 	int			type;
+	int			index;
 	int			channel;
 	int			overlay;
 	struct regmap		*regs;
@@ -246,7 +247,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
+		return DE33_CH_BASE + channel * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index dd6cb09c2c01..e65dc313c87d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -265,7 +265,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
@@ -277,7 +277,8 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = index;
+	layer->index = index;
+	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index e0b2cfa02749..9383c3364df3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -53,6 +53,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 4f0c929faf36..44e699910b70 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -411,7 +411,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
@@ -426,7 +426,8 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_VI;
-	layer->channel = index;
+	layer->index = index;
+	layer->channel = phy_index;
 	layer->overlay = 0;
 	layer->regs = regs;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 70766d752fa6..89d0c32e63cf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -58,6 +58,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
 					    struct regmap *regs,
-					    int index,
+					    int index, int phy_index,
 					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2


