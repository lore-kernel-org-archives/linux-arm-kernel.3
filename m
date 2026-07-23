Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26562C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69/y0meMAkptx5Dw1nm8R9XFFdzs1zemOmZCpzv9t00=; b=HzDfTMZtES4pp4J0LQtT1toqEu
	tlmo6YJWmA5MtC9thST6syQWCMG5TeyMg/RMBaYkm3kAs+PRuin6rmrEqlE+zf6rvmXl04hhzWnTw
	1tx5IWRSBOv3OI7+MJHoS8XmsFicRevjTYgOXLUXc+tHTmFiuJqbU6bkL+xehOJqaa0XImsh5FfRw
	VuvQmuvXYWRueTaY03dW1UTeznjqQr6bpr/8Og4FjotpDY0/s1tspQ71o7Uno4h3r0kYEJD83QkEc
	vIWyupuvJcEuJzFPLYBcBK5VwLozmjEjvml/fxPw9ZLuiuMW9y4ROXBZN0w98p1zcUxzalw0CXsMP
	xHD8zeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiQ6-0000000D8bh-3zwW;
	Thu, 23 Jul 2026 01:40:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLf-0000000D3Wy-0SDW;
	Thu, 23 Jul 2026 01:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770541;
	bh=1Vzn7su6rOQ52y73RK6RVJhKKl0bPsG7lJ3gcEDnl2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yaznco3S6ClKua9KFEbmIqEHoIlj5CSdw+xwqWojr4os+YCa2OLwqRcZ7S2wu2C8F
	 Ljs3jC4MlBjI7Clf5tLj1RSDQI6VwHTnhBeFJIozPGGLo7sM3+DRqcsyj3eZwZLojv
	 XHFodnFzc0TK6CFAj6Rbxw1Cv4qSYsIlcVQhKQIvZW6myknrtdBD7VnIOptk6l9Ula
	 z+NO3VL/zqQjzomoI53epz4TEZVXAT2XEr/NcKlmtvxC3UhfkR+A/dgIj9VhyTySfP
	 KU5B0k2NWSbATiwluRW/NRDIGGLZzpxa9e7u0apHi3xJfmVR9hVRnCLHSIEs2cbxg3
	 FX+myUkDFrDeA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1886017E0857;
	Thu, 23 Jul 2026 03:35:41 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:45 +0300
Subject: [PATCH v9 56/61] drm/tests: hdmi_state_helper: Add
 connector-provided max_tmds_char_rate coverage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-56-4fb12ea22ac9@collabora.com>
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
X-CRM114-CacheID: sfid-20260722_183543_470309_1E40841E 
X-CRM114-Status: GOOD (  13.56  )
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

Test the hdmi_clock_valid() logic that rejects modes whose TMDS
character rate exceeds connector->hdmi.max_tmds_char_rate.

Exercise both an explicit limit set through drm_connector_hdmi_funcs'
supported_tmds_char_rate and the limit inferred from supported_hdmi_ver.

Also verify that a driver hook can further restrict the connector limit.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 478c4b6c6207..6410eca57a99 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -189,6 +189,32 @@ static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs
 	},
 };
 
+static enum drm_mode_status
+accept_any_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					  const struct drm_display_mode *mode,
+					  unsigned long long tmds_rate)
+{
+	return MODE_OK;
+}
+
+static const struct drm_connector_hdmi_funcs reject_over_165mhz_connector_hdmi_funcs = {
+	.vendor = "Vendor",
+	.product = "Product",
+	.supported_hdmi_ver = HDMI_VERSION_1_3,
+	.supported_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
+	.tmds_char_rate_valid = accept_any_connector_tmds_char_rate_valid,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -2751,6 +2777,93 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
 }
 
+/*
+ * Test that the max_tmds_char_rate inferred from caps.supported_hdmi_ver
+ * is applied as a mode-filtering limit: with an HDMI 1.3 connector and no
+ * driver hook, drm_hdmi_connector_mode_valid() will reject modes whose TMDS
+ * character rate exceeds 340 MHz, even though the sink itself advertises
+ * a higher limit (600 MHz).
+ */
+static void
+drm_test_check_mode_valid_reject_inferred_max_tmds_char_rate(struct kunit *test)
+{
+	struct drm_connector_hdmi_funcs hdmi_funcs = dummy_connector_hdmi_funcs;
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *preferred;
+
+	hdmi_funcs.supported_hdmi_ver = HDMI_VERSION_1_3;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, &hdmi_funcs,
+					test_edid_hdmi_4k_rgb_yuv420_dc_max_600mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	KUNIT_ASSERT_EQ(test, priv->connector.hdmi.max_tmds_char_rate,
+			HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 2560);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1600);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 268500);
+}
+
+/*
+ * Test that a connector-provided max_tmds_char_rate limit (165 MHz) takes
+ * precedence over a permissive .tmds_char_rate_valid() driver hook and
+ * drm_hdmi_connector_mode_valid() will reject modes whose computed TMDS
+ * character exceeds the connector limit.
+ */
+static void
+drm_test_check_mode_valid_connector_max_tmds_char_rate_precedes_driver_hook(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *preferred;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+					&reject_over_165mhz_connector_hdmi_funcs,
+					test_edid_hdmi_4k_rgb_yuv420_dc_max_600mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	KUNIT_ASSERT_EQ(test, priv->connector.hdmi.max_tmds_char_rate,
+			HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 2048);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1152);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 162000);
+}
+
+/*
+ * Test that a connector-provided max_tmds_char_rate (165 MHz) can be further
+ * limited by a more restrictive (100 MHz) .tmds_char_rate_valid() driver hook
+ * and drm_hdmi_connector_mode_valid() will reject modes whose computed TMDS
+ * character exceeds the hook limit.
+ */
+static void
+drm_test_check_mode_valid_driver_hook_limits_connector_max_tmds_char_rate(struct kunit *test)
+{
+	struct drm_connector_hdmi_funcs hdmi_funcs = reject_100mhz_connector_hdmi_funcs;
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *preferred;
+
+	hdmi_funcs.supported_hdmi_ver = HDMI_VERSION_1_3;
+	hdmi_funcs.supported_tmds_char_rate = HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, &hdmi_funcs,
+					test_edid_hdmi_4k_rgb_yuv420_dc_max_600mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	KUNIT_ASSERT_EQ(test, priv->connector.hdmi.max_tmds_char_rate,
+			HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1440);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 900);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 88750);
+}
+
 /*
  * Test that drm_hdmi_connector_mode_valid() will accept modes that require a
  * 4:2:0 chroma subsampling, even if said mode would violate maximum clock
@@ -2841,6 +2954,9 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
 	KUNIT_CASE(drm_test_check_mode_valid_reject),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_inferred_max_tmds_char_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_connector_max_tmds_char_rate_precedes_driver_hook),
+	KUNIT_CASE(drm_test_check_mode_valid_driver_hook_limits_connector_max_tmds_char_rate),
 	KUNIT_CASE(drm_test_check_mode_valid_yuv420_only_max_clock),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_yuv420_only_connector),
 	KUNIT_CASE(drm_test_check_mode_valid_accept_yuv420_also_connector_rgb),

-- 
2.55.0


