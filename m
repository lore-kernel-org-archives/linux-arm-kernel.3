Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F00CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=; b=KioXQCry6pQTpNZq/PCPv3MELR
	0WBJ0yGmfLh1Fye6IT0HJtETKm87naphUzWnCuSDWanwzMgDkCnDqVpg4dIzJVAEF1nAOZyR6kdAu
	lVpg4ZXXueXLUWC4H8fkwsNxJq8YeAJS1akac8c00M/69O3DTnohOUl3iaPjxO6OXZF/9bL65dXK1
	jXUxtinDZhK3Z8w7sc6aW9KwEZsInN45Y0ahMv6uQNeR7dMV6mjD1PFNjoQuOsAIIF4rAyCYbICOu
	neVIe3v7O6R52dyL5PSt8YT8JC133s9i79sYrrrp/XTvxD+B2okNYa+httTToD8hLlLd48luLt8+F
	/h52H9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fs-0000000Bg25-3zu3;
	Sun, 12 Oct 2025 19:24:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fh-0000000BfiW-2a0A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b4539dddd99so728703566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297036; x=1760901836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=;
        b=kV2XPBV3s5idCRg9iCzbvy75egjtMV8dEiVOTq9oyTcZ6A2I3EIlYOiRQuoaXPMddE
         SVVHScpTiPoMr6hx0+e0ijZzGGW25qgQzvyyVJxkQFxezhr1+CL5GNcJgKMr3XQkOfuT
         8IOoDXUjrdA5V6m8kMTSVQceFlIxHsreAwiUeNApUySZsAnQnlXMcGOOAq7I/KRD033p
         nj82gwEHLwokOYgvu4D98VddqE9g0faT1Lm/yGGwoIXlv0RDgCu+kMRLSX+FDdgf5GTr
         HBO/BXNMkLnO/fhjAxqCA5moPbF9AxKhY6NTj5d2B1uF1q9iPRGPpL44T1CZcExiqphq
         h3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297036; x=1760901836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQIOjRIdDsBl/wnqSd50NloWouLj/f2wu4NfISu0ViQ=;
        b=ekI1FLaFtz6NLRaciyylCUsiaN8RkEfAUCSUL89MQ+q/DzgNeJZZhATOa6A0VHEXsY
         FgTEFOwwPnvGdj0ZAOsQ3YLjMYFXc/V/Ze/BVVHeL2CaCYF9oe808BuvVQEa5qtVRUvJ
         CMxqJTc8ax9UxMQQwToYTGt6wr3o+jQOux9e04rjrdi4OmT5b6mKRxturMQ4V9kPenv0
         lJetcgUmzVe0gtN05P7TcndPWXj9eJjTRnkblkH7Be60do8kSj+WDqyepr581UFCxvGg
         /EiV/EQ7TCcFDD6DuoUSQTSlSCElpwu1mDS9zLPC210HI83tw5SZFhFOYbnqzgIXFiOa
         H6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVid3kTPOxuT9cdILG2T3MRf/lrZtvH3+YW2pPWcpzygMkXk/PH5+s3NN5NBREAJXrKPVQvbDkG+QSAnh3TlA56@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3WLuXDO/Wfrf64KLnjRkpeTNYAyknmy3Ymozl5fFCHLV2fsdg
	bQb3dJ6h3CyIpmZwIChObgGKcraFA2YkatIIWeyNCbGcHWtdj7tNy7x7QC+Bu8zb
X-Gm-Gg: ASbGncuY2cHy5S6SZu67SiyxxX5v8k4MSVWVssRh0a2eFLTYhtBUvxMUU/EA/kzyOdL
	MYL0lYCnGjNRHrUAW/lZksqUdXKx7+bzB7B1YM1mNJJX/Sojvosm77cas8DTJJngY9v7whgZV9D
	585iBMBCM0ZVJiNPqRNGk2YUZ8vuXe54lv1Ai3Qq/nRYdonluiaYVqeipsgz+sOwEAqmRYQlGWz
	WzcM3UXc5nPsvjewc53AdU8Fa34144WwD1JqVdzl/fhRRVdmESA+pO49KBqls28zitRT2l0CyWJ
	Zs9aihJXqXo9RVna7glzmDpXmQ1qWx0Gvv7ULl6wevHNSo9sZNtIOuykybYOwrqMMGkBvd0UKZj
	qrPctKja66Y3RHIMJrF5NTzFIaYEcsd85hgQMQWjaNWBCh7+aFY0MgvuBpIT5qX0OBHhOWjORVc
	/8aPz1LPlu1hOXNOiAK5xLriKtI5CWJ8w=
X-Google-Smtp-Source: AGHT+IEo0mmA5QLs7FFLs9zM7BuOIhHX0fkAtfXbVZQzrSvZ8WwfBQOC4GT4ec3HCn2JTDhgwgWT7g==
X-Received: by 2002:a17:906:f589:b0:b41:abc9:6154 with SMTP id a640c23a62f3a-b50abaa45a1mr2062111266b.30.1760297035817;
        Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:55 -0700 (PDT)
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
Subject: [PATCH 13/30] drm/sun4i: de2/de3: Move plane type determination to mixer
Date: Sun, 12 Oct 2025 21:23:13 +0200
Message-ID: <20251012192330.6903-14-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122357_691725_F214848C 
X-CRM114-Status: GOOD (  16.71  )
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

So move out the logic to mixer, which allows furter rework for DE33
support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.0


