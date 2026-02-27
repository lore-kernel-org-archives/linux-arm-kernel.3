Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CD7FD9E1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=; b=LzkrKPfbBW8X0FN8ZZfUYhTnY0
	EQCG8l81ZvsoEqAE7cPAJFddPb8P8xE1/Za1Y8F4SBB6+3Oafvs5I2Hdq6xCoVNrXpLvVqP4NzE0r
	QQ1O4NZC/RCN6q1yQQsiDyp/Wan/b1Of5+u3gEwEeBwRyeyLnnXb/LRuBWsFMymsSBl2a6rPLhCj7
	Gu8KQkyQoLH3LU7KJVJSfjZuq5Qt0KIX8P1BMFhfsMe0BXeksYOGndwuj0PuzS2fSUlCWZDGyr0Iz
	UTnmuGnUND8vVBu21rCrJLZHignMH/1f5LGXeQk8YzYAUJD+p0yOC9Z51aUrEjI/7L7wx86WQRBGF
	i/+wg/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxN-00000007fuF-3Vor;
	Fri, 27 Feb 2026 05:00:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxK-00000007fsl-01G5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:00:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82735a41920so665736b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168401; x=1772773201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=Unx0A/FqQU7mfADO7T7fZ3MaqZ5T+5izKRazkccKO/EPy7FvOu/A0k73XzGimv0rGF
         vm8BfjC4jkf7ncjj8RVwjGPWbaJlUiUWAj45y8Iv3n5lXFNF9eS/ZpAWrYcNiJ05L4S+
         XUn6b+XnmUZKvPrXV11J1n5eNos9fvJhlghgiTltYv3Qne1KNcW8CxABVkpoF4Xw8KZU
         Ust2hdt8qQo97iAz9RF40/pkzGCnoyTyrkt12Rs9zY89aTRnUzZedEpV8d+J3pZcn/v2
         21lRxZkCa8WOkRgGKqC1mjRIOfxfuGkFsIoXUIJgYWTc3UL04udBVxGjj7NP3wf7oTaO
         tW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168401; x=1772773201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=Cqyi5HHQyTFFNN6G9+0VrpPPb59jSkgmNW7BxP5zyaGu80wKIAZr1YvbsafozmBK0O
         5TJOMt4XJ0gmOGgqrGkA5IJTX+TY74dtQC/0v5NPjemaeNPoUDX4g/2kDlB83UM4VvT4
         KYY9yie6BJ5MWEQqjqyxs4Sdzx0s5G/aPQAS14F4WC2IQaz45PCqj/ZH+qOq2Hg55uP6
         NN9iYDekXYv4AgAE6L/RJpXTNx0/jyt6V08F/q1EFjMk5B3b4OHMJR8pFFROglxpqW7O
         CfNkPWJxole4Nsg3a7W+0nBDKpgdxmEU4c9JP3/sshbAU6DEvHK8fAVIxxdYjBiCCf1y
         Qp0A==
X-Forwarded-Encrypted: i=1; AJvYcCVcsdprdwJ448qjP9qhEonaFMUvvcQvk0Ydd7EYvW0qZ+QS08kQcmqkuTwDEKaMqJDWUPl6wXbvzc4oAUck0Fw/@lists.infradead.org
X-Gm-Message-State: AOJu0YxQgHMq6OxJx23MK/PqFtBRbi3tCgiwSYlNGZ51DLRYn1R8hbnl
	GrriI4pJ98ft9X2FQTZp8Q1BJdRjYOcFyXXQeJDB2V7CljxG9ha/4FgJ
X-Gm-Gg: ATEYQzy4kw0/DtVY0fJQniNiXkt/r5szUw1O/i9cQMp1IrT0tEqpC/3RWCl4GanvAr6
	cjQZsT2sWHaFTSbKq1LvznMQ3q7d8Kk8x1pUp+9HnhfX++E5Rnp3zO6m/qqipvgeq2mwuF7JCu1
	HDHSqg/8T8hlPWpNGC6FuAdKbdx8H2Vgbc7G60g0YP6L0lsmiSN0EX0UIUFaUK+gZXJSx2CCZLL
	95WJwjNZx4L3GKOK4U8JoHxNCqgMPjCZTjHBf8r+TvwlJzuMgqIIIG+kLxdIVqr/UMSGnK4hGxC
	wTrKp1gSWqYlPQ54d2UTuSacZSBr7JMX6BHLmLyVybp5g690vlgb2qMgrby3RXbpyy2EokIMJSw
	rXALKMhPvx8qHiaxpXLBHydVnoz4MXsWxH5hy6UNcE7mhS1hHtupOD3ST/GJBEj9M/He50lDAbr
	8Zmh05pISmPPKipyMvLEjLwf+QnW5zrjWY3YY9jU3ZNynoZNvoLA==
X-Received: by 2002:a05:6a00:9518:b0:823:30a1:d5ba with SMTP id d2e1a72fcca58-8274da04bfbmr1455329b3a.51.1772168401020;
        Thu, 26 Feb 2026 21:00:01 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.20.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:00:00 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.6.y 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 13:59:51 +0900
Message-Id: <20260227045953.165751-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227045953.165751-1-aha310510@gmail.com>
References: <20260227045953.165751-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_210002_050194_2AAA5D5E 
X-CRM114-Status: GOOD (  17.66  )
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

[ Upstream commit d3968a0d85b211e197f2f4f06268a7031079e0d0 ]

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
Signed-off-by: Inki Dae <inki.dae@samsung.com>
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
index 6de0cced6c9d..b31eefb3a8b1 100644
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
@@ -374,6 +379,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -381,6 +387,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -426,8 +434,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	del_timer_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--

