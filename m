Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B808CE7315A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=; b=MGhpNlsjypNTC8fJ18LXQNmCC3
	aZ6TQm2QXn8qtStl2TA+rOWtx3I9jU+PDRwdLFPuKmUSyyDFCizoN8XAvIoaClj0pht/Vs0//NL6o
	bAevRNEGRURBZAL3FfTQKseRHCWvMj6jxjFGwde+syCdrHiLPh/QBoSGEpnKUM/0XdhdI2kk6/0w6
	AeRpa/Q/DoAAHr6A4oXp1avMW+ZTL+lwDx8ZxNXWA/CcEA+I0XqSfzDFBK3vInP71/pTbS7ts4R0V
	LNmKSN5iKKdYqqP4Iio7yC6UooYbyKQ3zhWY5l/3xXgFDGbedsCltKldp2OMjX7tpA7g71ph2PBIT
	eWy9X3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAg-00000004u7a-21c8;
	Mon, 02 Feb 2026 11:32:46 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAe-00000004u6K-1vew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:32:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso3592481b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031963; x=1770636763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=;
        b=l35QGd0GxJOFkjf1QkwO4k2bGJQ+vfCWLnmJudbKjkgcPBVe06r9ht6jqJ4aKg+MKN
         Hkq6BkmsWDKZFc9PFfdb6oPSAStkTx49+zKOOSYin3jX0gb9jqg/1kNqOapFVrG44Dhg
         on291longzx67sAFNlMe8Aoes9/L9nTcJ26a1pxKBVQbS6YfZt4jU4wMG1et/FVF91Lk
         dA+39yoKa/r6rsDbUJsZYY/f3C/FFIkXPksKRexND2ILlS+uIZe8tEzPi/EfA01FI1HD
         BvWtqIZLQIBRp6Z9TslZOy9N3VtWpA1kLoilFAMIaFaccvJNX4HLFgxKSom0FHTf0VGs
         el8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031963; x=1770636763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=;
        b=NLeioCNIkjjvr/XSuj8lGRtutQ3UPsmcQSB1dvvvgdKcJPbEtO4+Zj4L7547/oRjND
         mpbDKrZex7I1+QiLQdOOyYvyGVRV945FKfWf0Vl8jObeiKmw82Fjg53OiHzB5tbJCv3E
         tvcfIXvGKSyIjNc5FysOiMTZfRt79t8nLTspuPkOMpcl+iKLtbH8ifDkwhTSLLT3YSyz
         yhhrbUsbFoEE+OqkNRhvpeAk9i6Ze8inWaFkrYg5vrKL9oQOQzv+EJCO07SkfGOcSS7/
         uWz1obQGYLPEHa7bdeXrmEqsu7yqv9fmBjSQuGTw9HBnJnU6JUL6j/43FH5ajM98v/AE
         W5FA==
X-Forwarded-Encrypted: i=1; AJvYcCXG6OQjgJm2kEjjydtl5F3YAWiwMWbOXB2W9b5cK5au7Kksn5thVXkPaAcrnBIRKk50bt+LhwxT1CXj7FS35A4L@lists.infradead.org
X-Gm-Message-State: AOJu0YydWEDGgM92cokTqzCGEPaxOmVrG1pr+WLe4R8y96Xb9ut0x1Bn
	bxqwkqGTzwCfHnGkuSHyORDk4SSj5HZHvaVdOSc5T9CDLMHyD36piSl2
X-Gm-Gg: AZuq6aLpgag4sj0xdzbb4Evg1bo8GU6ziRRZe0fv7yBj2+kGUx4/9Fr0r3IU1u60lkw
	QFN+MnuTmjbGRrQ5gzBKvhXgIEUmALwcXsF5nExCfyaEqwA1Sec2Fo+jmyT8VIT1eFfcou2lGJH
	I+sA30/hiLprBCbf+qIWTe/tsbmHAcrajHR7mdCzlRGKEaKQPSInFd4mue2Pa0Guz5pq0VfINeX
	yi+2yNdLtH0EXjCzUfEVGe26tb+qmbP6L3zhsV9wzJhJboNpJGKTX1YIMOk3h/Yx+dfNTQAr0Vd
	CVmOpQQxoYfxHi90INCHmYMrfAOKqOs11q1isuNiYpCkD6zTWY6YiErfHWf9Ec0ib9HgFc7NNeb
	g85K+0P6U6+PBuzOj36saVbcKLvv3gs7FXmPrQOX6yxUFa8E231GNGZFqqYdzs/ENUkB5K3KMnb
	8XzpeqmJU205jg4EDTZB0ADOflt0ULRKB17wltzg==
X-Received: by 2002:a05:6a21:7804:b0:393:8fc:5284 with SMTP id adf61e73a8af0-39308fc8453mr4806502637.70.1770031963552;
        Mon, 02 Feb 2026 03:32:43 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:43 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 1/3 v2] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Mon,  2 Feb 2026 20:32:32 +0900
Message-Id: <20260202113234.183393-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033244_498350_177BA565 
X-CRM114-Status: GOOD (  17.84  )
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
Fixes: cf67cc9a29ac ("drm/exynos: remove struct exynos_drm_display")
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

