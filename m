Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBABCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=; b=zDWvM5CY8JUnigxFhD+sepnEim
	Si3RaPm4UQuHdsDOCl/kumhqyo+Zn4XysBjEL1C8VjofJi5BK2mxqbm+almCwk/9YypFGkdQ30Hh4
	RMnYSS7a1womT0PEkzMh3PskfLhW0mHHIp8T6A4ZaWMFKeoNLBcIJKN4LZ8SGkEQz69XseUmHHz4/
	p8FPuPwmIbDz3QdZbp07IOmGwFFGqtE+qKfxLK/s/+p7oPwpFVoFMHYVokmJiDQEWBqebyxV3piY6
	rMl+9A9UhQZ9OFIrCDbVcQLVHKT5PFUDjWmSM1i2Se9BaAH/jAwXMFDQTYxon/9kWyAluztyn5bYR
	bZT/tEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fx-0000000BgAJ-4C4g;
	Sun, 12 Oct 2025 19:24:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fi-0000000Bfjh-3tX3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso6536663a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297037; x=1760901837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=;
        b=iPP26f/cz7wzhqIqwwpEGXwWdwAsv5+/H/+i+I71hK3S/IgnTBiehjF/OmknUKa+tk
         +m9ReGAIez6ThKsWcW/Zq4/7l0kULNrFYwtZiyth6sa1bVXH4xh6ZXUAdu/pgK+utGhp
         vrphEQqrZ4qf7QVCg8e8QaevxadSGiPQlMjrojkGYEJHuA3acAzWI9aUAtrtAAHhV4kB
         HlOUgfDkSX/JxlJjdEHzP1tui8zoZH1yCjpFdvWZMHFOaVm0TUD0llU6RVLKziUufnz0
         bcGcIDmFd1sO8vmiIQRnZUVHiLOvSkVqS3MlrusS6myJ6TmhdjF3R1RU6Ro3DL27ysnt
         PPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297037; x=1760901837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rXnVYjWRna1Dp2XBUdGu2XgFBNqeWg8iiIcPP8l+VE=;
        b=j678VJjCZdGZ86E+WC3I3L2TGx50ype5hw2MWG7uGpfc3x9HvIbCVkth5IqGmg3DIX
         qEOcCh3+8qJPQzRzrJHr4M4u0Abd+e+mDAWRX/GIQTP6lBcPhPFSgdDHCFDZlf6KgDY4
         vpIAE0zRriAt+OL93XG6Pg/nL80TR0lEz2294Bl4U/3dTMpGpCJMW4VtZHglTtrnOSGS
         FgVI3lEYOxCye8FXIufKtFfF88peX0FZtZ+vwiKcGoHll5v4w79oNYS7dVgtoVWxEmQM
         SDvK3jOC5dlLXUL1S9awHqobkyF0s6Zm/aVGzjmaqbhPgzLjHto2v2mboeprmRZ9+BcJ
         tnzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAALfIoxOvdRrUR57bCpLoFh5E92xBQurTXaxVqb+TqwIxAQB3ypJaviTsDZGus/8I/yBbWMyQo9aEy1qZ0WTR@lists.infradead.org
X-Gm-Message-State: AOJu0YwVZaIk0v3ie1H4k39T/eelMLtXlDaCc2elM+Nb2Eboa2ozyNhH
	tW7WawgFrwI3GyHgQP2E80T5f+eY9bnQRZ65+Uu5x+7mveYZzkSKBKKR
X-Gm-Gg: ASbGnctmBKbO/j8M8d7wwoviMWZ+H8+D0yT0afXBPW96DtgkERZWRIHhaRJ51cloTit
	y7VI3QE6zb8Lq8pU6FgEYLA3didH80gs87bAz65cttOFE2tskh1yn7vQzCo1StXn1OmxZU/qySr
	6e9b5QJqP5PvTC5AS2/0yvmScWDwDP5qxJNt3jI7F366Wjia797aV4wedobkf9Uv4Oz19zq4ln3
	p6yArdHwPIJqhpTwTOTM5PqbLp4PpwSmrLzLRTgvNOvfgUNzK6TxxV16uudAQdHunSLhGAaPd4I
	aZ3zVU+d1kDY81dd76VmSD1E3+tpa7+a0ALAPPYqoBNqGsqYJjbpIW8LeQjcKCDkhNg0rbHYjAE
	e/cIUZYDQ191VHcLpf0lEevTTJ4IcW6pmy/SaJ3KWT2DxiQit4uSNZmGCj1TkqKl1bRQcW61qgu
	wwsKkNCOkPoD0YpFZsj3M6
X-Google-Smtp-Source: AGHT+IG0I+CtyMQ9AS5dyUihgRwKpeygER1fugmzO1P668vrEqp3088Kprh13QnASf90ghU3NNQmHg==
X-Received: by 2002:a17:907:2d07:b0:b04:708e:7348 with SMTP id a640c23a62f3a-b50ac2cf4cfmr2032278666b.30.1760297037018;
        Sun, 12 Oct 2025 12:23:57 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:56 -0700 (PDT)
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
Subject: [PATCH 14/30] drm/sun4i: ui_layer: Change index meaning
Date: Sun, 12 Oct 2025 21:23:14 +0200
Message-ID: <20251012192330.6903-15-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122359_003707_004F9A71 
X-CRM114-Status: GOOD (  13.23  )
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

In the pursuit of making UI/VI layer code independent of DE version,
change meaning of UI index to index of the plane within mixer. DE33 can
split amount of VI and UI planes between multiple mixer in whatever way
it deems acceptable, so simple calculation VI num + UI index won't be
meaningful anymore.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index e7a66d9b622a..17c0ab5860b5 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -343,6 +343,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	}
 
 	for (i = 0; i < mixer->cfg->ui_num; i++) {
+		unsigned int index = mixer->cfg->vi_num + i;
 		struct sun8i_layer *layer;
 
 		if (i == 0)
@@ -350,14 +351,14 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		layer = sun8i_ui_layer_init_one(drm, mixer, type, i);
+		layer = sun8i_ui_layer_init_one(drm, mixer, type, index);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
 				i ? "overlay" : "primary");
 			return ERR_CAST(layer);
 		}
 
-		planes[mixer->cfg->vi_num + i] = &layer->plane;
+		planes[index] = &layer->plane;
 	}
 
 	return planes;
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 8d74eddaa294..4f6c8b0acba6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -270,7 +270,6 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 					    enum drm_plane_type type,
 					    int index)
 {
-	int channel = mixer->cfg->vi_num + index;
 	struct sun8i_layer *layer;
 	unsigned int plane_cnt;
 	int ret;
@@ -281,7 +280,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 
 	layer->mixer = mixer;
 	layer->type = SUN8I_LAYER_TYPE_UI;
-	layer->channel = channel;
+	layer->channel = index;
 	layer->overlay = 0;
 
 	/* possible crtcs are set later */
@@ -303,7 +302,7 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_plane_create_zpos_property(&layer->plane, channel,
+	ret = drm_plane_create_zpos_property(&layer->plane, index,
 					     0, plane_cnt - 1);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add zpos property\n");
-- 
2.51.0


