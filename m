Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE3C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MAvboGTdt/idRB3l6LH8e+Wfi8Hz7aHj09Sqhpdqvc=; b=lCic06tDxCvPGq4adaGR4dz4GT
	XOeYzty3zRbAK9pmCoPvTWLjI51uBxDQ4hknoYNLQoyxkXcxnPaUoSiIaxPd3g0SIWNRDpKuSPuD1
	JRZd1w7/HeZ9FbxlPzesEq7X8cQv2U7KIZRh6zKFz8KjfjZIs9Lw23c54YTtqaU2SVi0NcdPppqYP
	WC7mZ2lfFX0RXj8HJnnEEn+JIUaakt4bGR4e03Yh2aSuJ32BPoc3dLiLXyYkwjGXCzPpf8OUSPdxI
	jMHWQCDa25b0tvM0MSnIwBtNbhnTZ/8vftwsWs/yOHig3Ag55fKpTAPObTK03VbLLucCFloWkuV8g
	3cfH4DgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TcU-0000000D73p-2fpb;
	Tue, 01 Sep 2026 18:54:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ta4-0000000D1bS-2aPY;
	Tue, 01 Sep 2026 18:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288694;
	bh=2FphXkEs5DxSnnWd+PhysCsnj7bm1CbZ3PIGCi97678=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VfTE5yh7FmjPZC7UGIt63cVMRRkKlxjumfIkSCXPIWxWa4Q8Oen/yvdTvBRLWykde
	 YFznIqMN3zhq535W6FSPg+v+W41AQlYc0fpNhgxaBUGS6o7M8B3v7/xerIX2TCaeyP
	 hHq8unvKErlXnBp4Ho/zlL27dL0AHYJ+fQaWmDJJ1kqGgdNR5y1MYr1efbqb4e+/FR
	 2ES0gzUYL/vuZ2kKGJ963DxuCNXSJEbBBuIbH0Oss5KfCToHOh3EO1UVc4laI2gC9x
	 GEwFKUYAWi3y/2O/NTmJh5qIxfy3n9L/sRYT1zX+H6p7l1UaKlAoxaHQhioZ5x+PaJ
	 djLkOdkb5YBVg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B863F17E3CA7;
	Tue, 01 Sep 2026 20:51:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:37 +0300
Subject: [PATCH v11 73/74] drm/connector: Use the SPD InfoFrame field
 length defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-73-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115137_644725_F894C916 
X-CRM114-Status: GOOD (  14.05  )
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

DRM_CONNECTOR_HDMI_{VENDOR,PRODUCT}_LEN used to size the vendor and
product arrays in struct drm_connector_hdmi.  Those arrays are gone and
both names are now only validated before being copied into the SPD
InfoFrame, hence the limits they have to be checked against are the ones
of the SPD InfoFrame fields themselves.

Switch the remaining users over to
HDMI_SPD_INFOFRAME_{VENDOR,PRODUCT}_LEN and drop the DRM specific
defines, so that the two cannot drift apart.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c            |  4 ++--
 drivers/gpu/drm/tests/drm_connector_test.c | 12 ++++++------
 include/drm/drm_connector.h                |  8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bb02e8626c0d..4bb43ac50b0a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -579,8 +579,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!hdmi_funcs->vendor || !hdmi_funcs->product)
 		return -EINVAL;
 
-	if ((strlen(hdmi_funcs->vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
-	    (strlen(hdmi_funcs->product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
+	if ((strlen(hdmi_funcs->vendor) > HDMI_SPD_INFOFRAME_VENDOR_LEN) ||
+	    (strlen(hdmi_funcs->product) > HDMI_SPD_INFOFRAME_PRODUCT_LEN))
 		return -EINVAL;
 
 	if (!hdmi_funcs->supported_formats ||
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index be2d24abeeb8..f79cea11d161 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -782,7 +782,7 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 	priv->hdmi_funcs.product = "Prod";
 
 	KUNIT_ASSERT_LT(test, strlen(priv->hdmi_funcs.product),
-			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+			HDMI_SPD_INFOFRAME_PRODUCT_LEN);
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
@@ -805,7 +805,7 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 	priv->hdmi_funcs.product = "ProductProductPr";
 
 	KUNIT_ASSERT_EQ(test, strlen(priv->hdmi_funcs.product),
-			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+			HDMI_SPD_INFOFRAME_PRODUCT_LEN);
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
@@ -828,7 +828,7 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
 	priv->hdmi_funcs.product = "ProductProductProduct";
 
 	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.product),
-			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+			HDMI_SPD_INFOFRAME_PRODUCT_LEN);
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
@@ -851,7 +851,7 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 	priv->hdmi_funcs.vendor = "Vend";
 
 	KUNIT_ASSERT_LT(test, strlen(priv->hdmi_funcs.vendor),
-			DRM_CONNECTOR_HDMI_VENDOR_LEN);
+			HDMI_SPD_INFOFRAME_VENDOR_LEN);
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
@@ -874,7 +874,7 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 	priv->hdmi_funcs.vendor = "VendorVe";
 
 	KUNIT_ASSERT_EQ(test, strlen(priv->hdmi_funcs.vendor),
-			DRM_CONNECTOR_HDMI_VENDOR_LEN);
+			HDMI_SPD_INFOFRAME_VENDOR_LEN);
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
@@ -895,7 +895,7 @@ static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *te
 
 	priv->hdmi_funcs = dummy_hdmi_funcs;
 	priv->hdmi_funcs.vendor = "VendorVendor";
-	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.vendor), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.vendor), HDMI_SPD_INFOFRAME_VENDOR_LEN);
 
 	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3b49799d12fd..2a804d42d4b1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1485,15 +1485,15 @@ struct drm_connector_infoframe_funcs {
  * and controller capabilities
  */
 struct drm_connector_hdmi_funcs {
-#define DRM_CONNECTOR_HDMI_VENDOR_LEN	8
 	/**
-	 * @vendor: HDMI Controller Vendor name.
+	 * @vendor: HDMI Controller Vendor name, at most
+	 * HDMI_SPD_INFOFRAME_VENDOR_LEN characters long.
 	 */
 	const char *vendor;
 
-#define DRM_CONNECTOR_HDMI_PRODUCT_LEN	16
 	/**
-	 * @product: HDMI Controller Product name
+	 * @product: HDMI Controller Product name, at most
+	 * HDMI_SPD_INFOFRAME_PRODUCT_LEN characters long.
 	 */
 	const char *product;
 

-- 
2.55.0


