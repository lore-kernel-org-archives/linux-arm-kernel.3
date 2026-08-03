Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858DEC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KP2LOm/b1vDApC79L7HU3Q+z5sMfbtyywYlbaxYaS3U=; b=weoUV+rckrw72W3s5/knYd+73l
	I7oS6R6UeksEM140RfV63E0H+MdMdlGZGX2eD5l6a3B7QYMunQowS+4IVFCm+jOvag0tfqIYq+upK
	CpXUxTIGoVy2RPMXAvMgleWaTeC3jjGki/drwuMzPvcAKFcMNXEtkbaD1gRiaKI7zRc4KmNKgUdhN
	8eFpCH65KFMiKdKVNZLdvn4r4/gbwyDKnGDSB+9zoDove2mfhOPXLtwUZcvR7LVr3bbd02BU/+9KX
	U8n2pZ4hB2KFk2haNJpJNz4mp6uGKaWCTqdUOJDdrxNgGTQmoT0vUgintvsKIv5LB6KKVhUALVFds
	2Vf8fKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt6E-0000000HGbP-1Rm5;
	Mon, 03 Aug 2026 13:53:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt6A-0000000HGa6-2GOX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:53:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so37699935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785765177; x=1786369977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KP2LOm/b1vDApC79L7HU3Q+z5sMfbtyywYlbaxYaS3U=;
        b=GNhr7E6wkawvOgQaTENdcCpjtKF3wNYnApIvBDRfqWiJS6+M/fXXQpnmEoElZFn8Ge
         6LOt1aust1K7oiAd2+8Qxe+ZxmXb+2pc+srWyCwyP0B/s/Ly1uv9BtI1EhfFjgv5daLS
         m123LaOULy1rqWbdar1nFRThdLV9q/byRt2C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765177; x=1786369977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP2LOm/b1vDApC79L7HU3Q+z5sMfbtyywYlbaxYaS3U=;
        b=IpIw/v8Va8QAM0WKiWFlNjmHvv9bE54sN+yG2XhNcBqwiU0jg+OAKsZvgE9kPnA4GS
         jPxcRWw3GM6HOfWsj8YDFCFuImaTVsAf7U0nAT/D+4TZRs+xw8sNNQJwa5XEK7rOsQCx
         YKQKU4y5WoxY7tGro2C6fQfEl0jV8qIgZ2HTcUONRXkQBeMXbj8Mfyqm7nPBwtt7n0wk
         6q3bZ/1QXNk7Zc4NmGIja2uSkc3KBF8qWIFSt9/RwI+d4Du+LE6GooB88PPpy2Gxtv4Z
         GHDvCGeZAdzbQIujvB0oQoeTL2jcBAZblVoKSUBMdub6hPO1H5biRxIXooiUW1iTRrHq
         yexg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/BVfdiuqj90XMQud/VouGPHmaUG2/0uETFLk53Di/c2uNXZtZTgbs/x0XbxqoA7DbdAFlwQIWCJAEPFHJPIEK@lists.infradead.org
X-Gm-Message-State: AOJu0YzMA1MPoLt+FfSXgnFfQge76mWbwZQSXzXhjgvcsfcAcSJYqNfu
	HqAmcmje3G+hD/SfWCiD1/ity+CzWPfcLRg+0UEVou+cLKE4RjuS0+PUcOLDMJm1+w==
X-Gm-Gg: AR+sD1046W+8KN/5rKvgQ09ouTcCTsd/5NgY73re0cSy7sEkp/eB1TVecxBu6sI5Apm
	8NsKjqc/c/sXkblS3d0vRRVVLfLe5gKUMLewQ7w4T3ZdRRyHEuTRkt62DNbUEm0sruybLQKwi8y
	nwd03NpVn1LFOv9McW4HUFyhgDyEWO2HD+ujuEW8H4MKDhbRVNBDHdrFe/I8DYkglRWXtgYaZj7
	az+PibyF1fUCWj2R/hXb26tEjvQY8CuFRjinFe1nv1NO48xI0OU20mOg2vJZQIYJmKUSOisDd78
	L+/rvW+PiFsHImdrF4R9+rqbp3aNxh+BxFT+ANsSL/fOLKB/u9733XcWsjcW8K4pe9CUjRbXaa8
	znrcjzKpoQt/9qLxf8haGzd4plwVxZ4rFRcXKOp48hDE3KlvK+NitwZWOmuhhkLWkLv0Ikwr/F0
	HAznwiQc4VEEg1BayiEKKpjQdhC/aGoEJuG3oKWRgWnk/gNRF3W6ZCGt0DojU5qDrsLOrKmbMX7
	M8Sf9g4R4PPkFOvPxJV1BwLv1IJe1lu8pIynF8k/aNaDRHxVLWXhLup
X-Received: by 2002:a17:902:ce0b:b0:2cc:f4d4:299f with SMTP id d9443c01a7336-2d05229b34fmr106179645ad.27.1785765177126;
        Mon, 03 Aug 2026 06:52:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1c0b:57ba:92e2:e178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b12066fsm38791965ad.60.2026.08.03.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:52:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: Set supported modifiers during plane init
Date: Mon,  3 Aug 2026 21:52:47 +0800
Message-ID: <20260803135249.2898083-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_065258_720223_5A6EB3A0 
X-CRM114-Status: GOOD (  20.18  )
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

The exynos driver currently checks the modifier in a helper called by
the plane atomic check helper callback. This check only concerns whether
the selected plane supports the tiled format or not. This is tied to
the plane's hardware capability.

Turns out the tiled support was added around the same time modifiers
were being plumbed through DRM planes. The latter provided a way to
describe per-plane modifier support.

Add a field to the hardware plane capability struct to allow adding
an optional list of supported modifiers. This is passed to
drm_universal_plane_init(). This also allows the core to generate
and pass to userspace a list of supported modifiers for each plane.

EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
check is now down by the DRM atomic check.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 30 +----------------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++++-
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b126cd129944..ab0edb826261 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -92,7 +92,6 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
 #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
 #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
-#define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
 #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND	(1 << 4)
 #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND	(1 << 5)
 
@@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
 	const uint32_t *pixel_formats;
 	unsigned int num_pixel_formats;
 	unsigned int capabilities;
+	const uint64_t *modifiers;
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 5c04ef87e400..31f5f0941154 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -174,30 +174,6 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
 };
 
-static int
-exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
-			      struct exynos_drm_plane_state *state)
-{
-	struct drm_framebuffer *fb = state->base.fb;
-	struct drm_device *dev = fb->dev;
-
-	switch (fb->modifier) {
-	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
-		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
-			return -ENOTSUPP;
-		break;
-
-	case DRM_FORMAT_MOD_LINEAR:
-		break;
-
-	default:
-		DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifier");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
 static int
 exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 			    struct exynos_drm_plane_state *state)
@@ -245,10 +221,6 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
-	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
-	if (ret)
-		return ret;
-
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
@@ -312,7 +284,7 @@ int exynos_plane_init(struct drm_device *dev,
 				       &exynos_plane_funcs,
 				       config->pixel_formats,
 				       config->num_pixel_formats,
-				       NULL, config->type, NULL);
+				       config->modifiers, config->type, NULL);
 	if (err) {
 		DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 69dea5049309..d74e605a452b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -93,6 +93,12 @@ static const uint32_t vp_formats[] = {
 	DRM_FORMAT_NV21,
 };
 
+static const uint64_t vp_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
+	DRM_FORMAT_MOD_INVALID
+};
+
 struct mixer_context {
 	struct platform_device *pdev;
 	struct device		*dev;
@@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
 		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE |
 				EXYNOS_DRM_PLANE_CAP_ZPOS |
-				EXYNOS_DRM_PLANE_CAP_TILE |
 				EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
+		.modifiers = vp_modifiers,
 	},
 };
 
-- 
2.55.0.571.g244d577d93-goog


