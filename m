Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A55C44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBCndLSt6VEOday3UPPc5BWagScSjYmko+jMm42lUiI=; b=yg3C5L9j3uWd4GPdC08avn022r
	YUm/T9aa+ESB6zA/meChlBRw24zPdKsEr8gG0lEDSksNjnVjd4PRoqw11QZuUE6+zT3nOznyhlf9i
	+ZrA1asd8o0qbkQa95XL55NgqoToepTUwnUC93TWR0PxvpcnMKzL+2Bdrr6lOHcZwdQ7AjUQh+cLM
	8NsjLdj74/+SNfiwu/oNuT5Gt/Z2B01EKCgzeu0byOX+W2nfZwsd8VgL4BiuJZMYTWiFatG+YLWR4
	EvL9Tf1kShk21jYhok7M3OrHHzMGhIYsEFsBYdoLYYPMJPCZNxA7kpOlYUOUMiekQlVPSbM4W/291
	sMAusKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLI-0000000D32g-1rrC;
	Thu, 23 Jul 2026 01:35:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiL4-0000000D2oT-0BEF;
	Thu, 23 Jul 2026 01:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770503;
	bh=j3UBn+8aHnvj7OWQqEmYPBqUKwjIgdMcEo6BLe+ttNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SN+REnXqPibGh2niXrvYyvVH4AOLXb95NGALe9PmBidpAQtdwj1ce/5BfbOkMbC3O
	 7ViOToQjzQLVGicoflMIa9W1sxhweFY3EXIPcS5aeRwddzTzlcqSTVYhxpfpqZ6dKM
	 p19xra8Jf3g3V/xxs9ebYn2E47VGS3LXWAhKUdapU8VRAzFMukcX54WMNXLr/4kqIu
	 7Cda9RS9CRoQUxmgcCwukjzuZyoSAJgEc6pJ8hwSIsPfVkaH30hEotymfDdvHe4oz8
	 ziTfRM/tGXpXW5doS6q/esvXvYBZHS3IuqEe1nfo2BX9odkOaIEICa/6KEI6u8P7rr
	 z/gOE7EpDe0EQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7054817E0857;
	Thu, 23 Jul 2026 03:35:03 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:51 +0300
Subject: [PATCH v9 02/61] drm/display: hdmi: Rename
 drmm_connector_hdmi_init() to *_ini2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-2-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
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
X-CRM114-CacheID: sfid-20260722_183506_392225_232DAB34 
X-CRM114-Status: GOOD (  15.39  )
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

In preparation for changing the signature of drmm_connector_hdmi_init(),
i.e. dropping the vendor, product, supported_formats and max_bpc
arguments, which are being moved into struct drm_connector_hdmi_funcs,
temporarily rename the helper to drmm_connector_hdmi_ini2().

This lets the new signature be introduced under the original name while
callers are converted incrementally.  The final patch removes *_ini2()
once no callers remain.

This is a mechanical, same-length rename performed with sed:

  $ git grep -l 'drmm_connector_hdmi_init' -- '*.[ch]' \
    | xargs sed -i 's/drmm_connector_hdmi_init/drmm_connector_hdmi_ini2/g'

The transitional name matches the original's length so continuation-line
arguments stay aligned to the opening parenthesis, keeping the diff to
the identifier itself and avoiding re-alignment churn here and in the
later conversions.

No functional change intended.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     |  2 +-
 drivers/gpu/drm/drm_connector.c                    |  6 ++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
 drivers/gpu/drm/tests/drm_connector_test.c         | 42 +++++++++++-----------
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
 include/drm/drm_connector.h                        |  2 +-
 7 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..f75ce47a6350 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1010,7 +1010,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->hdmi_funcs.spd =
 				drm_bridge_connector_hdmi_spd_infoframe;
 
-		ret = drmm_connector_hdmi_init(drm, connector,
+		ret = drmm_connector_hdmi_ini2(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8b4baed060f3..a112a522807e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -543,7 +543,7 @@ int drmm_connector_init(struct drm_device *dev,
 EXPORT_SYMBOL(drmm_connector_init);
 
 /**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * drmm_connector_hdmi_ini2 - Init a preallocated HDMI connector
  * @dev: DRM device
  * @connector: A pointer to the HDMI connector to init
  * @vendor: HDMI Controller Vendor name
@@ -568,7 +568,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  * Returns:
  * Zero on success, error code on failure.
  */
-int drmm_connector_hdmi_init(struct drm_device *dev,
+int drmm_connector_hdmi_ini2(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,
@@ -644,7 +644,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL(drmm_connector_hdmi_init);
+EXPORT_SYMBOL(drmm_connector_hdmi_ini2);
 
 /**
  * drm_connector_attach_edid_property - attach edid property.
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index e99f52ebb26f..96b2b597caa6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -653,7 +653,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &sun4i_hdmi_connector_helper_funcs);
-	ret = drmm_connector_hdmi_init(drm, &hdmi->connector,
+	ret = drmm_connector_hdmi_ini2(drm, &hdmi->connector,
 				       /*
 					* NOTE: Those are likely to be
 					* wrong, but I couldn't find the
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index beb1d50a6646..3368aedd4e66 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -669,7 +669,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -689,7 +689,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -709,7 +709,7 @@ static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       NULL, "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -729,7 +729,7 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", NULL,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -755,7 +755,7 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
 
 	KUNIT_ASSERT_LT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", product_name,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -788,7 +788,7 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
 
 	KUNIT_ASSERT_EQ(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", product_name,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -815,7 +815,7 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
 
 	KUNIT_ASSERT_GT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", product_name,
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -841,7 +841,7 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
 
 	KUNIT_ASSERT_LT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       vendor_name, "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -873,7 +873,7 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
 
 	KUNIT_ASSERT_EQ(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       vendor_name, "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -900,7 +900,7 @@ static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *te
 
 	KUNIT_ASSERT_GT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       vendor_name, "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -920,7 +920,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -940,7 +940,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -965,7 +965,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1006,7 +1006,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1047,7 +1047,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	uint64_t val;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1083,7 +1083,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1103,7 +1103,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 	struct drm_connector_init_priv *priv = test->priv;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1161,7 +1161,7 @@ static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *te
 	params = test->param_value;
 	priv->connector.ycbcr_420_allowed = params->yuv420_allowed;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1182,7 +1182,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1217,7 +1217,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
 	unsigned int connector_type = *(unsigned int *)test->param_value;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, &priv->connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
@@ -1494,7 +1494,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
 	struct drm_property *prop;
 	int ret;
 
-	ret = drmm_connector_hdmi_init(&priv->drm, connector,
+	ret = drmm_connector_hdmi_ini2(&priv->drm, connector,
 				       "Vendor", "Product",
 				       &dummy_funcs,
 				       &dummy_hdmi_funcs,
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 353a261d42da..4c2a400bc15a 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -275,7 +275,7 @@ __connector_hdmi_init(struct kunit *test,
 	conn = &priv->connector;
 	conn->ycbcr_420_allowed = !!(formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420));
 
-	ret = drmm_connector_hdmi_init(drm, conn,
+	ret = drmm_connector_hdmi_ini2(drm, conn,
 				       "Vendor", "Product",
 				       &dummy_connector_funcs,
 				       hdmi_funcs,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 17c8635c5afa..72ff95ca97de 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -541,7 +541,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (vc4_hdmi->variant->supports_hdr)
 		max_bpc = 12;
 
-	ret = drmm_connector_hdmi_init(dev, connector,
+	ret = drmm_connector_hdmi_ini2(dev, connector,
 				       "Broadcom", "Videocore",
 				       &vc4_hdmi_connector_funcs,
 				       &vc4_hdmi_hdmi_connector_funcs,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a0cf0268de48..2e7d75cb0adf 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2549,7 +2549,7 @@ int drmm_connector_init(struct drm_device *dev,
 			const struct drm_connector_funcs *funcs,
 			int connector_type,
 			struct i2c_adapter *ddc);
-int drmm_connector_hdmi_init(struct drm_device *dev,
+int drmm_connector_hdmi_ini2(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,
 			     const struct drm_connector_funcs *funcs,

-- 
2.55.0


