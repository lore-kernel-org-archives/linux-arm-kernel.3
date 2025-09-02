Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E1CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=; b=imhQ6A6rU4WvuO25jYLY4GbTIB
	j4N+BN9duJqYOXQ/G0vEVJQ2MvAzl/FHnj0EAdAqyP+sqR+v6az49LcbrQdqlnSceQZUgNtG1ZFM7
	MVg7RXe1iByA7+/8Au+FdATpr0hlve87xG03DBEF0xvuhDhW4oU9adlhEEbr+wYocubL1ZWt0VWnY
	WDnHRRvfl1hmC5DY1zlsE73h+BRw0IdFI/9aSTVW2RS5i4vsLhaUfxaUThExp76vKEARVhSDg09OM
	22ObSUQhHF4ogRgIZ6E7GTmKUCuEvJBoCSNHUbkqBw8jgXOo8u2xpJ5D76Rc4OagqRoHp9mAVq8cJ
	uJ/gccag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQT3-0000000HR0S-1lJs;
	Tue, 02 Sep 2025 12:50:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP52-0000000Gtgt-11Ni
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:21:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77264a94031so829037b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756812099; x=1757416899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
        b=iOtBuDPKx9bteXhSLsRT1UXe7XBaXTYeypZaoqFd8LH++50erEsujUatvXUp0WFFcW
         Z4dAWprhR8UPxtz4QtX6bDPjsgDsClnssxHeox+YUcFlJpDXCkan/xr6V7lGg3MPweMa
         nbE/hXZJbTmNiNjauNDHlU/zwSnfn6/oiL1onG4ziMGm8UWxsCoy/+Gf7EL3Uc8e+c91
         VMp777Nw/YwFV46MFtYN0jQww2Ni93A8UM9qryw0RcTIqxPUMh99eYfxP8iVJrx3YolG
         ztpsXc1VYwKY9g3/zfUviLsSMNphAEzHYqe/kY56YfqxwUeosEbYH5KBLVvb+FAson2K
         lUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756812099; x=1757416899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
        b=Mafu/0kcZvmVWAHmwL1LsUgvmESdrMZn6kKCBu9QMfZsRZvoBSRkLyQZneNcTldzHX
         iZ9Ah/PVoCPCXCB1tgSLXoLyRGcln411J2Nk+wDZimLdTOa0skRvgM3/cDkl/VWcgS76
         7oD97oRGa1PuCvz9j9gEgPtfkj2G5ekRnhOhHBD8Q+CSGvKfDgNLSzzGzt7sc1HoULs8
         HdQaMi28oDF9Bbhr56ehBuw7ckQLPFJnrC5hboGTbZyVxegrAo6PMxOqwvBdaptS5tbP
         sj43O7dr/xTiPr6znn69RKNAdrZ+5MPslKJD5hxpV96XDuiAy3invMBr5fdF8By0GMHI
         sZ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUTyAmB8jSlJVHtXfAigwYJEiZr8+u1vAcqHvaKSSRn+NVH6uvp36Of6dF2RQEsUNd10nC/WL+5IzeePPyx5dx7@lists.infradead.org
X-Gm-Message-State: AOJu0YwZeNSoz17y9hQ5fJ3CMkn5JqzdNHicaxS8wD3F9DFpjyebxW0n
	ZiIyi3TtJwfOqYSkH6ErcmGvujjJe8itMgspTBP/jietmeeFDgTEVYW6
X-Gm-Gg: ASbGnctyYRUsaHacRMdsCOfHZI7zwqROReT+oNOoUt9MDZ0XrAKdpKVo/Qu5CJelCNS
	BdwUOU7nFDJ2GcVSmusIgzyKQG3qOMAdI2xLhC7/Ns+0bE3huH2Wa3NJLNWx7GgGPV6z9Uhr7tq
	Mh726SQJo/gPSy4icw8NjEfa4NEqaEpaCjq4wwluMdZ6LmfWiK/LVrQuG+hrIPfkXHxMTlf61pU
	2WAR6klVp6sn5KT5ciser6qCRH1u9SvABC6nl27gjrzL+cVXwPpA4sVgEE7uS6kaz9UaPT9a+ze
	Ssd/UeWRsLtw1EsJQS6+4tCSrH4gXo/h/HAM0HdVshb5MHWg8My0wLwCFPL1rgqZfXRsKNZiWj1
	lnjOVnLRbtSaJwZ5i1HCZIeqO76qD0gcZh3CHlUolatGb6nkYGcOPRUBbebpa
X-Google-Smtp-Source: AGHT+IHYpnAEN97dhppR5gZj3bV2/ORfp7nw4JDDkTPmEAt+EIglpgn6hekUrxJELxqoV+MTc9dF5A==
X-Received: by 2002:a05:6a00:14d6:b0:76b:c9b9:a11b with SMTP id d2e1a72fcca58-7723e21e594mr12353303b3a.3.1756812099412;
        Tue, 02 Sep 2025 04:21:39 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:21:39 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com
Subject: [PATCH 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Tue,  2 Sep 2025 20:20:41 +0900
Message-Id: <20250902112043.3525123-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902112043.3525123-1-aha310510@gmail.com>
References: <20250902112043.3525123-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_042140_282197_46C1EBEA 
X-CRM114-Status: GOOD (  17.26  )
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

vidi_connection_ioctl() retrieves the driver_data from drm_dev->dev to
obtain a struct vidi_context pointer. However, drm_dev->dev is the
exynos-drm master device, and the driver_data contained therein is not
the vidi component device, but a completely different device.

This can lead to various bugs, ranging from null pointer dereferences and
garbage value accesses to, in unlucky cases, out-of-bounds errors,
use-after-free errors, and more.

To resolve this issue, we need to store/delete the vidi device pointer in
exynos_drm_private->vidi_dev during bind/unbind, and then read this
exynos_drm_private->vidi_dev within ioctl() to obtain the correct
struct vidi_context pointer.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 23646e55f142..06c29ff2aac0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *vidi_dev;
 	void *mapping;
 
 	/* for atomic commit */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e094b8bbc0f1..1fe297d512e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -223,9 +223,14 @@ ATTRIBUTE_GROUPS(vidi);
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = priv ? priv->vidi_dev : NULL;
+	struct vidi_context *ctx = dev ? dev_get_drvdata(dev) : NULL;
 	struct drm_exynos_vidi_connection *vidi = data;
 
+	if (!ctx)
+		return -ENODEV;
+
 	if (!vidi) {
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "user data for vidi is null.\n");
@@ -371,6 +376,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -378,6 +384,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -423,8 +431,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	timer_delete_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--

