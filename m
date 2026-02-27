Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADB7FD9E3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=; b=ouvxQKxGfI1DGETzpZHHjLE/fu
	9JCndU8/9608NN3WNTypDcLo1Wfj6YDH3k/LnEWfHEYIf3wbDiUV6QpNoof9n/Scdr4BAJ/jn2Ykd
	IMhMyFTKVChQzRreN/geaJuACNQhJzDpWs9ohK+XVKPP1u/uTgB87ATMQlK1fWktfnotFgZw2LFae
	RF0/+idiSudRkH5hJOfv8mvP9g6nvKVsOAW3rVJ/+qaP46kHoATdBmxfCEz8NzFfTyxjndTW0AaR5
	Rx53e0K8eoEvmx5+VSdWpbB5vyKe3ydOtesm5ORDmiSYvLnLWatuw1fq105MNNZwVQBK1odq0X5/B
	Mt0YVLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTh-00000007ieI-0wSW;
	Fri, 27 Feb 2026 05:33:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTd-00000007id6-21II
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:33:26 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-824b32875e7so893191b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170404; x=1772775204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=I9nn9LsGYRBbmQyAzDlrP1HGYigFdvGyqXM5qVFItrRBbVY5qhZivYUYqaXWeSD3el
         iKPHFxnO7CNfp7zswkMEthRqDLz7bWwvWiBoM3CnO4MK5rBY+gxkZYCpbPNVHvMguSIJ
         cqjRsSJCVx4XUQqVkk+tINs3LzF2Obhl6tDvts8LszoSS6rwj1AA3FqbZYBVEKHNIUce
         WcWgWfGmyk0EcEGP8rGPVtKdvGBFEAlR78+DmD5UJknaaati5q6kjyvR3aAECB480VGw
         aaso6kH+I4mPpe/B/eKUfu+eBEpbRKLE2ehlzho/KFyF6/HZuHMOaOCAZc5sXsP2J+lf
         h5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170404; x=1772775204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=U4xb1SqPA2Jl44M8iN/jzFxk3daw+2Bvr4dKDhykZYhbBI0hgLO1Mi5X50WJ+S0U7Z
         8mEvNzdl1Y0S5YEVg3miAbVF/3rOWxMHZi75NlnuFmg0+nZPqbojp8aVjBH2bRmi+8G+
         0Tb/dRY7ceW6fpubCmznFRWLNzzMbu1sr/ZvzoZpzbd0aJ5OflubOpUc97ED21SvxxvX
         qdU4CshFWXLs/RUMXm4dfoadkkZws1Tt8XexdPwaqZBXvhAH5rFGjN9BhH2w3TKLO3eK
         ealVh665mOikeQxJr9bBMsUlxsZe+gBKSipAqLpnOhe4+ABeQiu5jkth5yiXbInA27v7
         dhew==
X-Forwarded-Encrypted: i=1; AJvYcCWdVKg7pz4LeDIhL0vCzYKQafr8gVequMVJjzrzPLL/bZ4B8fhKUPHfe1z/7vAfTaYH8swNlh2ankF6GCwX41Tp@lists.infradead.org
X-Gm-Message-State: AOJu0YxIqCKDvpbFcc2Oi1Qp3J7ACkq1kuM8hirk+WXqbtDRrAmf8yMW
	054C2K03jL8ZvlgR4QdC/ANBUIrKq+RveRoUnqYRnQkIMKCPkwO3lpM+
X-Gm-Gg: ATEYQzykNlNp2GOxfQMG3TC1KEA3MUXrQWDPVqXApuxBwgARob1rguEAEP++duzblvR
	OQdPksS/tCCkvp7F0i44ZAkefu3F9lzTPvWzbG7CbLFAWSRhvNXFTNYvPZBlcATmWhMOYVCu84n
	tmpsPQy/d/GIQYrpK+mOUIMdBj7IZDcemAT2vX0NNYiQY+wRl4Oq5sWB0UALm0/bAR3E5DeieTf
	tHo3QuNFT8RBn81ZSKGuSQ/wZ9MLbnHpv34FUWNMt6d76rTl9QZTGvtd07uqPnG+ql/j1Jn9t4x
	OY6Q3vmcOAnGdP8Hb1N6C+r5mAKdFJnrm6lD43+qJygWPVAXh0mwwyJ57I18fj7JuCncNVKlnpg
	G0M7LDomPxud+sTpl5AeqLCaNaWoF73zWHrSrbXtQKIhKf337dplul+eJCCjgkS6cDeNyHZev6r
	jZ43mmIRI2MsC6o0t3C4XPHY45On77WZSohn1UmvJ5TfdroiRnrA==
X-Received: by 2002:a05:6a00:2d11:b0:824:16ae:9ec4 with SMTP id d2e1a72fcca58-8274da248famr1742089b3a.63.1772170404587;
        Thu, 26 Feb 2026 21:33:24 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:24 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 14:33:15 +0900
Message-Id: <20260227053317.426000-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213325_517833_C7F5F6DE 
X-CRM114-Status: GOOD (  17.56  )
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

