Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BD5C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xYFAzvOq/dLglAF7sCC+6w76ikvUV3J0tm5XCoZrqM=; b=WKVHibPn3ZuidSKxMyfUeum1Jt
	SeLLRQd3mt4V+1UKCc1LYzgpfT7+V/k7HLhHRu10+GYnRYiTUblnD9F3l8Zp8bbktBiYKv6wnb6AI
	tpvXy+L3U3zRsxx+5aUuYX8oGdFvkv9f26oXqPXYcsA7Np5YvUgJ6wMz8GS/ohRUg1C+MncreQBgx
	bxlXqBjOaf9NgnCYxHV65BXFMcWrb6oXE5fCkkX7Gcx3RGIKsxfMu1QYSriHwl+xhMZ6MQkSToBMs
	FbLQaDgIxYVHMk8sptiSuDrCP0CJfkKdC0rLDzklVW1k9FHdLic8Wdu/N4TaSVnwz6o/CYgVEuC97
	//OQdvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq2n-0000000D5h9-0pji;
	Fri, 31 Jul 2026 16:25:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxq-0000000Czps-2da9;
	Fri, 31 Jul 2026 16:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514797;
	bh=b8b0g0mwg6DkAdX6Utag8Oehr2doi4sirDk5lkqvxCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pV7jxqqVl2oaCYn0DF6R5tiW48MSkpXK6SgQ3gB5CmULbdz71JgKzLXx+rLya8IE1
	 GSRSjMTIEJ83kjXi5plK4YN61xUIhxqvt3noNrF5NNgnNCps0vndkSbMiBHB/cBY/z
	 w0zKlc5qqOexJ0G0/fQQRbiNF6+lY4eKmSvR2URheNu3Wa2D39g8/UbSG1ij+P2w1T
	 XZAGw9DymjNXCtvYJyVH4+WQ2RNd8oZ6eb/Vcw/UPPLsqA/WgU8aL10NM0lEqSslMk
	 ah1GdHGDv3k0nDbb73ukRZg935SPIwwehBorvLO8Z0irUtB4pPqPQv/I8eOfABVQm4
	 OHEDu2Hhq1FYQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 626CE17E09A8;
	Fri, 31 Jul 2026 18:19:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:20:07 +0300
Subject: [PATCH v10 60/69] drm/tests: connector: Convert to
 drmm_connector_hdmi_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-60-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_092003_094822_BB4A1EB9 
X-CRM114-Status: GOOD (  15.25  )
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

Switch tests over to the new drmm_connector_hdmi_init() signature, where
the vendor, product, supported_formats and max_bpc values previously
passed as arguments are now provided through struct
drm_connector_hdmi_funcs.

As a consequence, the tests exercising those values can no longer share
the static dummy_hdmi_funcs and need a modified copy of their own.
Since the connector retains a pointer to it, such a copy must not be
placed on the stack, which is gone by the time the DRM-managed actions
release the connector.  Keep it in struct drm_connector_init_priv
instead: it embeds the DRM device and is only freed via
managed.final_kfree, i.e. once drm_dev_release() has run all DRM-managed
actions, so its lifetime strictly outlives the connector.

Note that a kunit_kzalloc() buffer would not be suitable, as KUnit
releases its resources in reverse order, hence one allocated by a test
would be freed before the DRM device allocated by the suite .init().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 251 ++++++++++++++---------------
 1 file changed, 119 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 3368aedd4e66..c53ccce21a42 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -23,6 +23,8 @@ struct drm_connector_init_priv {
 	struct drm_device drm;
 	struct drm_connector connector;
 	struct i2c_adapter ddc;
+	/* Mutable copy of a static instance for test-specific overrides */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
@@ -37,6 +39,11 @@ static int accept_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.vendor = "Vendor",
+	.product = "Product",
+	.supported_hdmi_ver = HDMI_VERSION_1_4,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
 	.avi = {
 		.clear_infoframe = accept_infoframe_clear_infoframe,
 		.write_infoframe = accept_infoframe_write_infoframe,
@@ -669,14 +676,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -689,14 +693,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       NULL,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       NULL);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -709,14 +710,14 @@ static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       NULL, "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = NULL;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -729,14 +730,14 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", NULL,
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = NULL;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -750,19 +751,19 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
 		'P', 'r', 'o', 'd',
 	};
-	const char *product_name = "Prod";
 	int ret;
 
-	KUNIT_ASSERT_LT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = "Prod";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", product_name,
+	KUNIT_ASSERT_LT(test, strlen(priv->hdmi_funcs.product),
+			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.product,
@@ -783,19 +784,19 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 		'P', 'r', 'o', 'd', 'u', 'c', 't',
 		'P', 'r',
 	};
-	const char *product_name = "ProductProductPr";
 	int ret;
 
-	KUNIT_ASSERT_EQ(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = "ProductProductPr";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", product_name,
+	KUNIT_ASSERT_EQ(test, strlen(priv->hdmi_funcs.product),
+			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.product,
@@ -810,19 +811,19 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char *product_name = "ProductProductProduct";
 	int ret;
 
-	KUNIT_ASSERT_GT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.product = "ProductProductProduct";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", product_name,
+	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.product),
+			DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -836,19 +837,19 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
 		'V', 'e', 'n', 'd',
 	};
-	const char *vendor_name = "Vend";
 	int ret;
 
-	KUNIT_ASSERT_LT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = "Vend";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       vendor_name, "Product",
+	KUNIT_ASSERT_LT(test, strlen(priv->hdmi_funcs.vendor),
+			DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.vendor,
@@ -868,19 +869,19 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 		'V', 'e', 'n', 'd', 'o', 'r',
 		'V', 'e',
 	};
-	const char *vendor_name = "VendorVe";
 	int ret;
 
-	KUNIT_ASSERT_EQ(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = "VendorVe";
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       vendor_name, "Product",
+	KUNIT_ASSERT_EQ(test, strlen(priv->hdmi_funcs.vendor),
+			DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_MEMEQ(test,
 			   priv->connector.hdmi.vendor,
@@ -895,19 +896,17 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *test)
 {
 	struct drm_connector_init_priv *priv = test->priv;
-	const char *vendor_name = "VendorVendor";
 	int ret;
 
-	KUNIT_ASSERT_GT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.vendor = "VendorVendor";
+	KUNIT_ASSERT_GT(test, strlen(priv->hdmi_funcs.vendor), DRM_CONNECTOR_HDMI_VENDOR_LEN);
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       vendor_name, "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -920,14 +919,14 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 9;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       9);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -940,14 +939,14 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 0;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       0);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -965,14 +964,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
@@ -1006,14 +1002,14 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 10;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       10);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
@@ -1047,14 +1043,14 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.max_bpc = 12;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       12);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	prop = connector->max_bpc_property;
@@ -1083,14 +1079,14 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.supported_formats = 0;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       0,
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -1103,14 +1099,14 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -1161,14 +1157,14 @@ static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *te
 	params = test->param_value;
 	priv->connector.ycbcr_420_allowed = params->yuv420_allowed;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	priv->hdmi_funcs = dummy_hdmi_funcs;
+	priv->hdmi_funcs.supported_formats = params->supported_formats;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
-				       &dummy_hdmi_funcs,
+				       &priv->hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       params->supported_formats,
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, params->expected_result);
 }
 
@@ -1182,14 +1178,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
@@ -1217,14 +1210,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       connector_type,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
@@ -1494,14 +1484,11 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	struct drm_property *prop;
 	int ret;
 
-	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
-				       "Vendor", "Product",
+	ret = drmm_connector_hdmi_init(&priv->drm, connector,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       &priv->ddc,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       &priv->ddc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	ret = drm_connector_attach_broadcast_rgb_property(connector);

-- 
2.55.0


