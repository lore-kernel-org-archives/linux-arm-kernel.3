Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C29CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7B5z/6FvG3I54OQ4ZNRVyTMbTdgGg3l1ZfyjU4MqtQ=; b=fBIdrxn8sYW3hgh68WybCeCyMO
	anyb5yuIKnuasGCGYQ76pmelqeLAygbG4kzsZm71+dEpRtCaynQn7nnV+qsgkuwb2KbPff6mZ7ptt
	4fAwemQHCuZlQMy9uFwEouF0j8Dxtq2Cv0DSfu5iuT6AGsY3WswVnIGLDO3kJC6nY1XW8vLdeyj4k
	TYkQ78PAh3B6Nvrz2cxS1VfXvdhQbBY4ddZQdinJxTujPaqGYB0dx0gjeh/78td0ATdgQwO5biQiz
	HT+xY0WTRHkp1Dd29qShUsF8MWoJPkRmi/mBs+tu0HyAvNFeNZNVx2cyZkdq/LFRlBJ29yLj+lZmX
	OCgyLROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81g1-0000000BgEu-43nx;
	Sun, 12 Oct 2025 19:24:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fk-0000000Bflp-0sde
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:01 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b4aed12cea3so575831866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297038; x=1760901838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7B5z/6FvG3I54OQ4ZNRVyTMbTdgGg3l1ZfyjU4MqtQ=;
        b=kSKa0w1jKfH5BzIlDWoC9Tq7bvVqi8tfh3g8Zo/BHoawAHcNY++0F7EZRTfSK8fpG8
         RtZboava/R2/raSb1kxeDrQxidElUKj4vJ0kkzBADKL4JdTK1E1mBKeJdxhwkAkPInd4
         4jm/TXqtcz9RQF5A0Q4xeWSP9MXXLLsbyCTHRKaQXbN/wvy/5w50Do3I5Z+CVT0aMg3d
         mKkH3omsa8WonKvrNLxU/IDGqdTs8BB/UpenNXAyWog/mrBzCakgRonC3uGhEvynr9X1
         kvvzVjzBvNapDTtf/2VVhuxzeMfh7Yxq2E7DRzERETfQLdFq7wZ+KFguDgmJpHic5Ygk
         2n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297038; x=1760901838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7B5z/6FvG3I54OQ4ZNRVyTMbTdgGg3l1ZfyjU4MqtQ=;
        b=pxtEz2e+gBelD+WWh4KDv8XOClVHtojssHxtP1s6E2N8oz0cd7ikeOwWdRl5GcDEPp
         +z82vyF0ykwdeTgzGYObnZ8SGjDQMM2d1CsG8svh1pc7TyhhvmfKHsf3xIVTHSewRrFj
         tFyObHSXTYgsCnUGwOwUbAmEzFUWS0E7ixiv+1+IRDf6HkVHM1Hz58xWjcwOTZOQMUH0
         BEnHdlblELLq0/xvG/yvtAbju+Bry6W1YUlw9qOn2ue3qY7W93be6PvHrh7VupcjEGoy
         8/e6Rt2o3XLSa3sS1Dc72XSomGsw3Y17V5TNaIMgqwCdF6IqO49p6JdvyVej9VB+7Kg5
         CUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1wPYHnqLOPOv4wTuEPvBUEB7fYFcz+1Pq77FGzs/3qXh3WEXrcR82S7809wX+xC6/RXHjelmufhE+WiNGt4AG@lists.infradead.org
X-Gm-Message-State: AOJu0YzY0atJIYCq8YJbls3EKu0AUMkXXJADuKb0j6QP5+OOeZvHfUTE
	q+hYkc7Rfv56IhCBIcCeetC/yprW+XV4FySUKSDCfOfBWzLGbuSG6Pui
X-Gm-Gg: ASbGncv3lKp9nGttlw7+3O7J3mMZNhDRISoQjv81qRN4hxPualqAj1EtXdkbVTDTt9r
	vDura96zMdG98rm1a6squKQ6UeB3OLDVnByk4JuOWXw4vuS6olwImuJNliDyA4nQoaBOvamqoQ5
	KWUACsEScizD4nQe9srECrht340tjhTOgO1Uv05gucQHJQxehjLxneV+/YnPl92aV4Sjdk8s0Mf
	Aufi5tAt8tpE3xRcDvGdTgwM7awlWuXh++k/ZxcLU9L7g5+IaSCAiH+e3E9rZ2iImNbRQU5kUfc
	y95MtcdTuc0YUwMbMQVskc2UfV7rwXOlzZ6fwoWUj62JreyXxlJncyE627vkaLRhzz04Z28rhQ6
	M+Qe13gQDFKfKNj7NW27uupinLIqqF80XvzNV30rjQ76Bc7lfFxxgbtvJQdJxmHHCUTp6mqBTU6
	r3q34kYtyNQ4MIx7KSHanct/inFNCjNs8=
X-Google-Smtp-Source: AGHT+IEht1RvYv+GrJVSKlpD0bZZHYXhupsubyTU9aRKjX6qUxe0ggNfr/uDwTEge6IoB2ejpquang==
X-Received: by 2002:a17:907:da2:b0:b3c:de0e:7091 with SMTP id a640c23a62f3a-b50aa28f291mr1959386666b.8.1760297038157;
        Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
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
Subject: [PATCH 15/30] drm/sun4i: layer: move num of planes calc out of layer code
Date: Sun, 12 Oct 2025 21:23:15 +0200
Message-ID: <20251012192330.6903-16-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122400_306747_F0D08A06 
X-CRM114-Status: GOOD (  14.01  )
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

With DE33, number of planes no longer depends on mixer because layers
are shared between all mixers.

Get this value via parameter, so DE specific code can fill in proper
value.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  6 ++----
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h |  3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  7 +++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h |  3 ++-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 17c0ab5860b5..18dd998364ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -315,12 +315,11 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 {
 	struct drm_plane **planes;
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
 	int i;
 
-	planes = devm_kcalloc(drm->dev,
-			      mixer->cfg->vi_num + mixer->cfg->ui_num + 1,
-			      sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
@@ -332,7 +331,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_vi_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_vi_layer_init_one(drm, mixer, type, i, plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
 				"Couldn't initialize overlay plane\n");
@@ -351,7 +350,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index,
+						plane_cnt);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 4f6c8b0acba6..8f6fcdfcf52a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -268,10 +268,10 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	struct sun8i_layer *layer;
-	unsigned int plane_cnt;
 	int ret;
 
 	layer = devm_kzalloc(drm->dev, sizeof(*layer), GFP_KERNEL);
@@ -294,8 +294,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	ret = drm_plane_create_alpha_property(&layer->plane);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add alpha property\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
index 7745aec32d76..0613b34d36e0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.h
@@ -52,5 +52,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_UI_LAYER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1192b17726d1..805db4ea714b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -413,10 +413,11 @@ static const uint64_t sun8i_layer_modifiers[] = {
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index)
+					    int index,
+					    int plane_cnt)
 {
 	u32 supported_encodings, supported_ranges;
-	unsigned int plane_cnt, format_count;
+	unsigned int format_count;
 	struct sun8i_layer *layer;
 	const u32 *formats;
 	int ret;
@@ -449,8 +450,6 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
-
 	if (mixer->cfg->vi_num == 1 || mixer->cfg->de_type >= SUN8I_MIXER_DE3) {
 		ret = drm_plane_create_alpha_property(&layer->plane);
 		if (ret) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
index fc22b9a6bd8d..a568e1db1e19 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.h
@@ -57,5 +57,6 @@ struct sun8i_layer;
 struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					    struct sun8i_mixer *mixer,
 					    enum drm_plane_type type,
-					    int index);
+					    int index,
+					    int plane_cnt);
 #endif /* _SUN8I_VI_LAYER_H_ */
-- 
2.51.0


