Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6FFFD9E35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=; b=zBsH5J2J8nKfaA4XY95BE4iBhV
	bZ6BsLmiky8fk6AjgRb52tWEpoM2D85TEVMSItuSYlsTjiarb4kkiuR0kZfiW0envudOoVbe/vfOb
	hHp8KFcMeS8jKYt76GpnpcTIn9YPR3LMeKKuhYd3Av+nZE+o/BN2KNz0uvYv9w4v0DJjehIND90xw
	EJCMZE5TwIJKCqPMJKY3RXLqmIza3zCvlJL9CceE+NKdt6XRKf7g8Q1GHRt6IcfVJA/Whr9/AQP0E
	5woDM7tXyxNNNpFWCfrOemgHZGw+oRc99A2MxdHyhria0MQUJMz+bVME0Gb+y/gUHPv2xe8vfUmQC
	zw+hwcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUm-00000007bDK-18uH;
	Fri, 27 Feb 2026 03:26:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUh-00000007bBa-3Lpe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:26:25 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3591016f289so1271236a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 19:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162783; x=1772767583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=XiLwkZCCY4ECkdsyXsX7AAbLSnIC2rQNdFkENmGIhyxGkkpAz/IfCgRNDnLQlORIFF
         eYHI24KVyeRzxUa8yH1LH18ORYC1FWyHkxdb8zpUBRTV7GQVf8C7IV8QVjxRQD9mls9+
         Eo/dT51wf7y8sLbZqaOmzY0J/TfrJTzuYrp15eAfd2x4P7FQCC42Bwo5lFLxvlgpVoom
         YPdzwhDQj0lqefEm5rT6yQpRGjN+agbIspGxDwE8uqF43igO+qaq9b9X1mPYmEawPzAW
         luJqmH37xOTsasMxXf/16NIUBXzmcsO5q5+rPRe3tyPzW4oeif6anzWB91c9kRvJkD4x
         Z0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162783; x=1772767583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=A4DwaAsWWrMn5+QlPSKGwZWFXCLDY46HWAL6AVo3SnE6ZcUEP40V6fwbggtbKuePlF
         StkUwmqcQ2EokedCY2nKoMFmb5DmLm4zcSHx3OZ8mbg68klsrsD3OzDbeJRmdnRKPHhF
         jt75r/5MGN3d4Hs7t+piye/VOVAtgksGdkS/mpKfTPUwrfk0IT50WvVZyHI3tcrPvz/A
         DqpdNWUgl4KFDYPSoTyfySUIoeevX0XIm4cfprSjFTc25jcN4/O3dKDVzrw+yjP5Jtxx
         4U/yMZlazjZsjCeKgJ3VyJ2pntGLBU+9TSG1NCDa6+sF96amn1fqIPrNBf4wd83CXiBP
         j/lA==
X-Forwarded-Encrypted: i=1; AJvYcCV5FC3PcE/B7AyCGnXpZpbj6cywnVwdgeBt/1IHM8iUQTgtX2O3amDgxTFc3+3dKWNKL2uTb2v3BtrY8sbCJ3Kh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2BG9qKed4VaGKe2CInj2EeworBXWtfU1Vp2GESzTeZLwMsa2
	6NXdT9aAtQRL0FRzjaI5EdFggGb6uflDAXd3hSa0gF2fjOeJeS4K80SUw0orUA==
X-Gm-Gg: ATEYQzxoF+D+L4ucLphsbkklksMhGBczTPJiGbQ3mPkwFOJkp0pcs5vEzuPZE2OhRzC
	lCZPIdhUNXthYf0xqU9QSXKo6P/ehcDdhoWLaWk5imFbFCohQJB/rsx91BrnS5oE3UAK8LzTZ2k
	AT0w069llGBJnZwcdkaHtGdJ7kZw4pjeks5pK/b1hZdehHcBW0FQuZQvU4pf/aiQRMnOhyxuX7C
	+lKp3WNY0OUwI3+t/+LZ8SNNNt9+4gg83PRvia0GXnGvTr/vqiCyeTaXf8haJEltVh2X2N4R09X
	nviRpbDa70ehM5CzYyNBOHBrYQhbgk69sP9QWKa7E1uPta4GAUZp4NaPFpFL59KN36B/BaDXf79
	wT4ZDiq9JFo9bQAy+DIrhTwi6fZANvDo5v3Us2C/Rozf4qYTxbDNW8NPDeJfoSsIAN9V5byB4Db
	TuqwaDiUQ4V60TBw6PtT00N9yx3GyvBTu1dpwMAY3VQ+EMb5yxFQ==
X-Received: by 2002:a17:90a:e7cf:b0:34f:6312:f225 with SMTP id 98e67ed59e1d1-359388c4ea3mr4132576a91.14.1772162782843;
        Thu, 26 Feb 2026 19:26:22 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:22 -0800 (PST)
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
Subject: [PATCH 6.12.y 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 12:26:13 +0900
Message-Id: <20260227032615.108139-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227032615.108139-1-aha310510@gmail.com>
References: <20260227032615.108139-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_192623_839702_EC5EB99C 
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

