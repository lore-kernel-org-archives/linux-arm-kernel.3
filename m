Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E2C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 03:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=; b=Nqk+rCbIztrCmFTlBCsC9KaA31
	mL9x9mRqZqtshIm8eiRAVICg7O/EhW0/yrJSPe06hByUDoT+0PSP7XN1xNwXkExLXJmxh46/U3ZoM
	bO+CTJpfl/ZZa2tA3zhMJ5WKiu5bX+E31g9Pxp/If49wYFEfsx38MBUwWRl3SsHah00lqONsBn7FO
	ypZQCsMg0jhxxuUBsEC3bg2ZekeYxZKb+o+2MDRwisUmHcPaWF25pQnPn+cb/yscxcoeGECEJGKj6
	V2dAUgIjuqx/ovO4C97QPh93189p6W3eRYfMNAkkTaAK8cng16Abw7y9A0BnQRhu1/lvXq5Y0k/gx
	BELk9QsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHJB-0000000DBGR-2qKa;
	Fri, 20 Feb 2026 03:36:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHJ9-0000000DBFd-3N8C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 03:36:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ad4d639db3so7996365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558559; x=1772163359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=;
        b=c7n1gd3uOkqR/8lnTgdZiIGJnH5JaIJ9sKl7BbqNxJs7z4FcLhYtUQPtF3RHcefa9Y
         gTbrxjMb9G+Kh0AphT2N5VpkwIdE+Xxgp16pmJjxbbYQg72fhS5jr9/6IyJ2CbWrgIB/
         hSnbeMRsaGkaIwEKZYrYZk+RiNTbNfT0ZmGA0r/ZgiELPR7yxD4NY2/WMbRxySpyWco0
         2WktCmayH+rZEvPT8bmr5sEXOSvpGgpYQ8Fwtg8MGAnwjwa3zZ2HrJ13N2wPzGKyopHe
         4cw7i9kJugz1M3lly4WK5KEooIBgAwy8peuvewDsltQ5j/1WZBBaZPrwMYT2AYgISi64
         DZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558559; x=1772163359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=;
        b=g8ktZ8hc1nyUrFp96JUAcWzCEVEfZbsoR6G59r4okg0n/VF2/5OrKX/Sa3J806NHqY
         AH3W4WKWxzxYhWNNH0E6WGNrQYrk4s+TZPAm06oYcSlE0CisEyAXbCtdEFJPC/v9FQTP
         g2sopUJNHWHVQjKUPZFAMIIZOgTMsPAUs6/8Nmx3AtWredjVdU7miu5m1WfSi1juflQY
         shyvZ5HfFq5rjox+0PCYEdFBDw7uUmCEEQfXpB5ItlHyfI0WemPLS8OzylmELlViDoOO
         WWmGC0njuJRAwegHEGusCTgzFfpb/DUP1rAFvyHTnRyLT4NsAqo4gzEVgxiexy2i0b2K
         k1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWpGpfd0VdAFnvL1cQ4rCnohAC5WsEBMJDogwGpTl90Gbfklem7jG6qwf4iH8CRUk51PjbepxhmaS2JIoB4rv/5@lists.infradead.org
X-Gm-Message-State: AOJu0YwJpduRQFnS7b4jf0Nyrvg8VBRIALANK8zW9PmbTztEqbFdFlxV
	QVaDmKbBOEMRDrx8o05+/goBYgZ6+hat253qLGn1u/DwL6HPeafVwaf0
X-Gm-Gg: AZuq6aLGRvCSvV9qC1Xk4ZfyMiMw++qd6EMIZ6KbAqoYGpgUWr3VrkIGRcnY2V1FwcP
	qW4RCLHisk4LAV3M+POWwSKA5W3ERtx4uzFRmmXZQkqpXSkM3fkec0/OTwbINjnDVUFZ7kYZH4m
	aL8tx4sAdEX/YtLXm+unJi3uBum/lAA8wMyqlxfnTIRCMePgOQJYxeN6V4u52mI1vb/klY5l97i
	psc+ZL7M5SmyuPRgDslTXOyQFfW/1iBHBRs4qBsrVY1bXJysWc/UYnAsF14d5DtGucvMJyTgWQa
	ekR5w/RhvYHt5lME1G+X/Z1OFnqWfXDK3VEYpj0coOJxYJX3Xw2uiP8wYMJr5gq0SgsuM/n8JtM
	xDX36YBNugpaPZtFuzRqmoK3GAUHnuizu2Gp4sFxdGvEhllYqQOkY4Niahdh6ZK0PZ2WRA31D4X
	Zgf9SCFDUEMAVQJddOmeCV/RlvI87Oiutn/JPq96LH/z21dtIKUw==
X-Received: by 2002:a17:903:1aa7:b0:2aa:e23c:2697 with SMTP id d9443c01a7336-2ad175b1491mr182585685ad.57.1771558558897;
        Thu, 19 Feb 2026 19:35:58 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 19:35:58 -0800 (PST)
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
Subject: [PATCH 6.19.y 6.18.y 1/2] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 20 Feb 2026 12:35:49 +0900
Message-Id: <20260220033550.124346-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220033550.124346-1-aha310510@gmail.com>
References: <20260220033550.124346-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_193559_843751_103D710C 
X-CRM114-Status: GOOD (  17.69  )
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

