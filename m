Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98BFCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=; b=BE9+4oym01GyO1tvt6MifqC2kB
	Hlt06yj77rDe5zVeZQ1bIp77GFaHPIeGhvhkshk41QyvxCmZBpVnVaA34oMyc/aPaY4grfHkf3T7m
	f31yi9Szhc1kalH9oeBEvF0hxbeV4huAEwsELEcpQgXRerD5tR7/HbShGFLpEHYXThfNL6c5mXpse
	wf1nDnO7vmIul1GzOfXx8y2J7qY2oWz92ozx1s27h970thQ9Cir84uwzkGZvggQ5xjhIYMTH4TNPy
	WA0QjY11ZzZ2Tg1HUCIPL5Jw86Ko0XELnxa/9uCEYc0mlkiTq1Bxr0l05bLGvYmAQadSz1Y7gSTuo
	F38z38yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUC-0000000CLaT-2wtS;
	Tue, 04 Nov 2025 18:10:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLU5-0000000CLQJ-3N2S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47117f92e32so47878855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279820; x=1762884620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=;
        b=Kc2SQHlrq+kgJJJBi0OR9X2768LbpcS3JRnkSjPEQlCSBlOeG55LfQLsN2leHJvTmZ
         kKZCeZqKBqGAcf53U+RFwRunrfjLbVFvSMqqZCF5Ny1o1KeHzBTAJxm/l0rsOWpLNzKd
         wwi5Ft28gWBrTyasJhFeucly064SE0OaG1HMl62CeS/NyIK2v7Yz9Vwu4OWgAaI9UEBe
         cpkWexB9Rrqz3dkSo+d5ZiS7A8CQ+fl/k4D8yw4qS1xtd9bmyFmVxIsbv6H+gCXvbUyl
         8jsdEBHCLup7uIspJbxAuuj/hStel6OLR+T0iMSeK3rRwdb/zenCFl8T6/pDlMprsUXW
         meKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279820; x=1762884620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkKFWxjvfnPBPsn+5nRw8D/GMWr7S+bsKZMhSPQ9djA=;
        b=o6V0xBwwJ3nk+GWBJ1VNzKGnWCAa7yzKEtf5dt7XtYKEA+traSv6b9BCUpwJV9XExr
         7yLbJ9t5U5P+/03YbKX7Da+R0h2FPGp/TWlzLEkNr7NA9i711500vgimdrUEa/1ca4SU
         kz8cswWdoDK26HB3sg/VEgw/n36ZrqYq7bxy7+1Iog6xOrrmxhc7AN8PcfikSsWx4YeS
         rWFUQQBfHM8HPyv/pK3zFHNezZO8HTk6bh1F9KRWpMbszeqP8eJH6v+Os4DRuoGTO2g0
         HvmDUvcBexKaH7jpSHwrvglbEpWdbA70OFcJm05LHhpOHaMfiNOnqNepdK0ReWO/EtNP
         Dh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXefCC81rXzhPYsfzeQYFOtKSgixy3MDlB4GQE6zkPHf4aU6bdIIy4/aUbBtK4y2WDwmIzmPNLzNWEA6b69HTa9@lists.infradead.org
X-Gm-Message-State: AOJu0YyJJTuP9UI9TfX3YBcvpyQ5xilIOai2eb/Oe0HISYwW9BozOaPt
	2gdjlgcYeF5pJxmN2/q+EvENjPiNMrPJwFcZIqYxBsxIFPBGlCxyP1Cb
X-Gm-Gg: ASbGncsEESM0TSBJRQpwE5sTM0qSDCVZT5hp6YxwBFTf97ExzwJkB22ZZ9au4s8zDzr
	XuVYAG3+7Owpm5a0KnaPQiSI3op+DP1qz5gDbyzTcK5TfeUlzLTpVAHYqTYYRMR5wioU6L6r/fp
	src35e9ldVPgAmH4XcIKOfjgihaMSyicQzdv14y3i/sPLNgQDMuKd89+zehfGGQf5G4VDcCBWzE
	SPoSl3wTIqIsV+0Ee3AdgfxWLdpuzbPyC6vaUYG8T7lG50vex9tVD6V2wlepoNIMnmJPEAOkv12
	GSFcRQXEndONx2IfRdZf01m7zNzvJpmx17flRjn5/UdAL8fJ2hm6KCZm9C4UdyB0GHtIlylb91h
	BYThg7wL9iKSx19tx4qlBVMTY043QSaz/YFPx6BUuCCQoB7uusCe6LxLOyGD5FqfsEMLRQ+UNCU
	0jyCEoWUbI1KE8G0fzGg==
X-Google-Smtp-Source: AGHT+IE0VNeGup3E339ZS9R9hdH9raL7VWlmheMAS7dvWwXActLDGmTaSE0UPI06AOF5H0yvEXihPQ==
X-Received: by 2002:a05:600c:a0d:b0:477:1622:7f78 with SMTP id 5b1f17b1804b1-4775ce24859mr2137695e9.40.1762279819619;
        Tue, 04 Nov 2025 10:10:19 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:19 -0800 (PST)
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
Subject: [PATCH v2 14/30] drm/sun4i: ui_layer: Change index meaning
Date: Tue,  4 Nov 2025 19:09:26 +0100
Message-ID: <20251104180942.61538-15-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101021_959174_E6C2E6BA 
X-CRM114-Status: GOOD (  13.94  )
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

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2


