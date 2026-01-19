Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5FACA6007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=; b=c9K2Sy++E6gd+mLWazeatUnfVt
	Ty/ATiNS7cm/aRrehRR1N28/MUeTZFUIbyLombwkuCwDggz78IPSqsNzz110sH4BigAN8d6gS2DUc
	UGpsseHJHvLpxE7BH+9TYsCqpkpCJgTgNXnMpWmC6dtufM/+oUiFQC2HdsNiTn/jQOp0k/IjzqVZD
	192LVRWWG7oWW1ReHv8YuGuSOpymmitiI0Tmff+RDKzLZRp/22n5gWsW3V11CLrf/VZRg7KV15ouS
	8h2zBH94H5FcaYWN0cog7ek46mdb7Vb+bBtYU4qnNgPIuS3qPM3mbO1p/bXs7+2GWGOnWzMxP6PQS
	l2FGf6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaR-00000001Ygc-2kl8;
	Mon, 19 Jan 2026 08:26:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaM-00000001Yep-0Oco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:26:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a12ebe4b74so39108085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811165; x=1769415965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
        b=lkniiZ8RNakb/7WnlJXBGAoTPeVKLCOG3fq7xsUfvSxG2EJBEJwp2ABUBrowzImGms
         EyuQRCCP6dGDOBpq0vr/5q0YUibejiHHKAQLzGToD8SnlLHIKE5pS3sW7pSE1R7pL3eB
         C3P0CzvdmLfQP15yYRuXhu7HpJn56vYQePUAnC+SlJRXTdvE89fCmSn24WjbKCHPoA+n
         7YF4ymDL5l6vCaAFOnNqBnMd7/SJOk4McunWuim5Zekf9pbtcIAdZz22KQIdqwGJdXFi
         OnX7sAxFit6bb2JifNfGDjNeshdnbi1YTpn2sQDUvoRZtQs5Et1QIUxAjT5EANprbFYQ
         FcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811165; x=1769415965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
        b=qU/ohssm2Xk0NnJZuz86jO8zmQRNwX3tdsuDwIn2XO362VduxzI/mrLs98hbJbSwGE
         c+ysa8SwLZR3rdlxsQBjS5rmpdNH1Zj8e9dJnFejiXcKKqkO35rOhfjZP4iFsSNy09il
         YZd6L6aBESav/0s2m/zlTHLkj71EGsR8+zGOXQwtpvlVkBSUzInTBU+afCxqh63t3tis
         aFsueFD8eIi3zZUbo6cvmfEp2D6XVgLLho7Si1pvEbZ2Q9FP3I56QonWXoAd74Swns1n
         TObCSAu6f/aCnaSm9I8+oyg1TxWA0AGk9V9wpC9yjz9iKliqR05AYbL7mo47k1mNdOzn
         UIHw==
X-Forwarded-Encrypted: i=1; AJvYcCVsCOAiqb3BiJOOaCuqp4COHVzaDX7y/W/qj9xbp3d6WSerCV2w8mJovLH2o1P+C6IvjEqzKO3UKT6/LUrXPw26@lists.infradead.org
X-Gm-Message-State: AOJu0YyAH9O0ev64DzlV/Zl7aerq561O0ay2KzGDr/m7KesXQ1H6hesd
	oEiH0uU3AL3lWVPrRyoPXAK4jXTPKz97K4dfqKohLc+zWNEQt9iTKMNL
X-Gm-Gg: AZuq6aIc+6f4gK+cq9/lJ1BvSwlWO8DhdKeDWdWn/qN0WWCGGuqu0edQC1mFqtY1hRV
	K7Gp1C+BgWXZnXe8g4Ps3I2rNlSDOfXZaq1XP+OXElJ5rE7s8vH3jpKYcHVHh8t2JUUKFYFREzp
	2ovHz+0Z57pSL76bua56vPuYt2eqE2170xmGji01DUEqeDzMl/St4qTsPUhSiPC7ew2uc45N1vf
	vmnezAnc87ZMkddCndRB/4mFNnQL3JVrxU3wDs6SztNGjge1NHamWsILuqJhSNRrUqQt8OiPi9l
	qtCmJAy0GJa0D42LGv3lsds8ASrpB/zz9Un7d7yYkfsZqYaUrXi+/BsdNHxxre0U74sk78FWgVI
	rEUghQYc0xzvwVAvG5YiwHGdpqL+6qr712IYZhKniE2akxYJAebw8Mji73IISG3RRjIkpkLUr7p
	9kA+4BBy01EXnnPjyz49HvuFHKBOYKIfkbpZbE3w==
X-Received: by 2002:a17:903:1ae4:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a7175cc0f1mr100262275ad.28.1768811165155;
        Mon, 19 Jan 2026 00:26:05 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:26:04 -0800 (PST)
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
Subject: [PATCH 1/3 RESEND] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Mon, 19 Jan 2026 17:25:51 +0900
Message-Id: <20260119082553.195181-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_002606_147608_546824C3 
X-CRM114-Status: GOOD (  17.58  )
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

