Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB26CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=; b=KaTeU0nnJZtYFn17gVNbPFjpKO
	BxR44TNnkpPsENDPj46+2WgGlqtc++uNRU0wjWJBRjyAeJqyNss4valXbLnTAjx8NZztprHIhh8pS
	jxu9cgBuX332xvsuMtK3y3ExBbXXZotzSCPYG3LYuAkIAGhEZYEoDN+XGhm9qIUTBksUSMJpY+fbz
	aXw0cwinvqPcAyGWmD8wWK+U381yVL5ltbxP8lcI6SChk5eLRcEJH54GypE0bXq/bBJF017YH6gGn
	GuFhD2kgzc0H4D0vdur9Gzm//suZq3R4FSOckFwzJPgn9jf6eKjZG7d0pr+O4fgUlYashvMnRgqN5
	1/GtInGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUB-0000000CLZB-3wlR;
	Tue, 04 Nov 2025 18:10:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU4-0000000CLNc-073i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477563e28a3so789495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279818; x=1762884618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=;
        b=NDfwOQPiMvCUEXa9tb9Qa+RNTvD4xmhqtbJTTUqvQjKKt1DyX0LzjS3aoiUwguaBKU
         wQ47qBjJ8YCNoZd/mHICxtBkD4vWus5czBRyll6N75ebnwduWwXjYrOZUGYCCm5Rr4Fn
         +xHOrEZRj0VkhQH8aETqKV9Eb/+HKkDbw8Je4dUz8l9pB74tIlcVP9CTrilKq81oI5ny
         bAVkJ+bI/WUiYxyOuPu8DU3xNiAdAYDABfFNwkP1cTxMPne6aN3Xa+pzvLdgToRm9YCA
         42j3YbtXXFSsZcNC0FeYixmnZevi+RoNeQNuT7qHXeHDEHetmlosm7rYQs+9dgw6G0c7
         uJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279818; x=1762884618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDQI5x1cDX0/wzl8C9wFmlja3WFbUj4VL1aXgGGHPcI=;
        b=oSkO3NDhMR16dOEH3Fvvwh19L5xTKr7Co/qGxymKEXYuhcyB7iJJy/tAiDP8VEdUrk
         wjmRrQWt80aoLyhDDFdwJoddMtBAxZTyzrw1IunfLCkX1s6X0+hg737LvMqbgmufAD58
         lOoaeworD0G90gGdRVeiIsJLCXbMjG5feZhsGAyIZ5gthgug8vNtib9R2TuxsYQhq23e
         vpkVhlHapuCTumBvEDMkIKqEQXvflr+xBuQ4pcrJiBV5d2hXlB6QnlPZIQgKkqUXIlGf
         Wtwr5Td/OW3bi3KQIXh+d9JNuuRTvf5EPgI57NoHdQ7tMg5F7skdXHfE0EpUnWR4LrSu
         4hZg==
X-Forwarded-Encrypted: i=1; AJvYcCX1KYESPJGWhPGD2Rt1l8kYm8VylczX9O0Lvzyj7vDXIfemsRo1ctbE43TGzTIkXo1+e/3IEmcLTKnsrTYBq6GP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7EeRBFzO+D7mFNSQBHC6wKC4UBhVNmL19XDOcmBc2eFraRT0l
	L1aXnGHi+wqZsz2lYh/Y17fq/Uon2+hdxCaCPGrjjvBxOdtWoBuszTv2r3xqpw==
X-Gm-Gg: ASbGncvcwerKr4PTUWvII3LWZkqggw5Rcfx5qTyI9XNkW4WbasN6bZ1TNhmCW/cf+DK
	iYmcYsLR1CmRhE2Krsx6vzyvkR3TurWs5ZYCWyp/KXWjO0p8/Gtagl3OnWMRX1iBkGM+G2QvaKt
	hW/wn7QKuMfMkCPuOa5tDHFSxksjcwLotUr+VNEawB0Gv6+an07k0die2m88zlNMC62at99P61P
	vowPnWnwh4IPHx3dtbsmz5q6gOQ/djveAGLI1usNTFlCKQWlcwOjT0Hx1FWjWcbdJa9bArjHMYx
	VinALXNExBz+CSr0l10SlTydFLouMq286E4XE5o47q/kDhlQ4l99asulfDg90uCaQ9F386oBSLC
	J8niv+ZyWLhZmUf8xho4N4KRhrP9AAWF2LP7LxCBYMKoBYoiv8CPbgupqVThRqkUpeZl4BO0ILo
	D8LE1IHclX4u+PeicHvw==
X-Google-Smtp-Source: AGHT+IE6+wQNQgsRWOAqTzJlZBlSMUgDJYtvMonE1RZ+OJOG9YLIca0WKWGS8Pz1WvOiR/sQSuop1A==
X-Received: by 2002:a05:600c:6dd3:b0:475:d278:1ab8 with SMTP id 5b1f17b1804b1-47754c1c553mr27491185e9.2.1762279818149;
        Tue, 04 Nov 2025 10:10:18 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:17 -0800 (PST)
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
Subject: [PATCH v2 13/30] drm/sun4i: de2/de3: Move plane type determination to mixer
Date: Tue,  4 Nov 2025 19:09:25 +0100
Message-ID: <20251104180942.61538-14-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101020_109546_0C5A8BF2 
X-CRM114-Status: GOOD (  17.47  )
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

Plane type determination logic inside layer init functions doesn't allow
index register to be repurposed to plane sequence, which it almost is.

So move out the logic to mixer, which allows further rework for DE33
support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v2:
- fixed commit message

 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  5 +----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  5 +----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  1 +
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 1fca05a760b8..e7a66d9b622a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,6 +315,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	enum drm_plane_type type;
 	int i;
 
 	planes = devm_kcalloc(drm->dev,
@@ -326,7 +327,12 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	for (i = 0; i < mixer->cfg->vi_num; i++) {
 		struct sun8i_layer *layer;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, i);
+		if (i == 0 && !mixer->cfg->ui_num)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -339,7 +345,12 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
 		struct sun8i_layer *layer;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, i);
+		if (i == 0)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 9d5d5e0b7e63..8d74eddaa294 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -267,9 +267,9 @@ static const uint64_t sun8i_layer_modifiers[] = {
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
@@ -284,9 +284,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	layer->channel = channel;
 	layer->overlay = 0;
 
-	if (index == 0)
-		type = DRM_PLANE_TYPE_PRIMARY;
-
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_ui_layer_funcs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 83892f6ff211..7745aec32d76 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -51,5 +51,6 @@ struct sun8i_layer;
 
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cf83f7ce6c78..1192b17726d1 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -412,9 +412,9 @@ static const uint64_t sun8i_layer_modifiers[] = {
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	u32 supported_encodings, supported_ranges;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_layer *layer;
@@ -438,9 +438,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
 	}
 
-	if (!mixer->cfg->ui_num && index == 0)
-		type = DRM_PLANE_TYPE_PRIMARY;
-
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun8i_vi_layer_funcs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index 655440cdc78f..fc22b9a6bd8d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -56,5 +56,6 @@ struct sun8i_layer;
 
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
+					    enum drm_plane_type type,
 					    int index);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.2


