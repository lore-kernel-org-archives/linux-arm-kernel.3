Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742C2C44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ax1aSA+r+bXZwmgYMnldj0LHC/EdwvR+hmLAie3E1tA=; b=C0uIxnfF9wbvi+xTO2e2z0R8rX
	zceFzfazoUHjmX6k006r7dF67y6uqfpyVlosB3Rxq6oOEY639Bh18deYneDvhBPvIpgOUP0I3VF0B
	Ldp4kDr++DEPvTIH697VICWd0Ev48dALEgBY8oHKDBZN5AiS0mPClVV0xVTXSe/lzUVOeeMGC2h/R
	7BCtUS8ZMkXLxENX9v+zJDSFD3mJOC4MJl9DzOwJqpvqRAJ0FO1DKU9KGBEtnfYjCzYEfj0bfsjQR
	szuKgHfhpajthONKl07Ui2eXJtsMG7x+UdZTuFK3w4oF9mYF05M/D0uqaWmOahFc/YgrDIYj2W0li
	GofX5B8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiQF-0000000D8j7-0XT2;
	Thu, 23 Jul 2026 01:40:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLf-0000000D3Yu-3QEr;
	Thu, 23 Jul 2026 01:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770541;
	bh=m9u7i/rBLHSjK++bVbTfFwZqSX2MkNbO5+yAJ7Hk45o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dhB1bw9BnRkfxkEBA4N1W3GdJxaYF/hIFsa6MmFd0Y+PQIlyAv7wlDakASIWytCYT
	 qB+h2eorQPmZfDBcZ9w65DjNc5CxIeAetYD4LZrQuEhLuo82JlhC2etI7MZSWicXNT
	 c3kyjfw9T7k4Tru6oIEJgiP6rLSaAq5/gqcpJ7iRkszbnMMkFJa8J26Dh59sBTFsHH
	 kPT9we+O7BQA7Pv0Yqe4MzW6GM55LEtfsAOUcnwJ8Kn3WmBWBWN7gR+oGClKfKzpQx
	 lUz5QxW6olyBbwGddxqBPh9YxpMhOFpDiUaab3S2nSy7skBIIM930mQK55+GdPJdif
	 w8R3nh4N9k65Q==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF70F17E062C;
	Thu, 23 Jul 2026 03:35:41 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:46 +0300
Subject: [PATCH v9 57/61] drm/tests: hdmi_state_helper: Cover source-side
 scrambling decision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-57-4fb12ea22ac9@collabora.com>
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
X-CRM114-CacheID: sfid-20260722_183544_832371_B662779F 
X-CRM114-Status: GOOD (  13.23  )
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

Add a couple of atomic-check cases that initialise an HDMI 2.0
connector, so the core infers the scrambler support and the 600 MHz TMDS
limit, and assert that conn_state->hdmi.scrambler_needed stays clear for
a 1080p@60 CEA mode (~148.5 MHz TMDS) and is set for the 4K@60 RGB
preferred mode (~594 MHz TMDS), straddling the 340 MHz threshold.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 6410eca57a99..c46aba6cfe80 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -215,6 +215,34 @@ static const struct drm_connector_hdmi_funcs reject_over_165mhz_connector_hdmi_f
 	},
 };
 
+static int accept_scrambler_enable(struct drm_connector *connector)
+{
+	return 0;
+}
+
+static int accept_scrambler_disable(struct drm_connector *connector)
+{
+	return 0;
+}
+
+static const struct drm_connector_hdmi_funcs scrambler_connector_hdmi_funcs = {
+	.vendor = "Vendor",
+	.product = "Product",
+	.supported_hdmi_ver = HDMI_VERSION_2_0,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
+	.scrambler_enable	 = accept_scrambler_enable,
+	.scrambler_disable	 = accept_scrambler_disable,
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
@@ -2252,6 +2280,127 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+/*
+ * Test that on an HDMI connector with source+sink scrambling support, driving
+ * a sub-340 MHz CEA mode, we end up with scrambler_needed cleared.
+ */
+static void drm_test_check_scrambler_needed_low_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *low_rate_mode;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	unsigned long long rate;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				&scrambler_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_600mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, drm_connector_hdmi_scrambler_supported(conn));
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_TRUE(test, info->hdmi.scdc.supported);
+	KUNIT_ASSERT_TRUE(test, info->hdmi.scdc.scrambling.supported);
+
+	low_rate_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 16);
+	KUNIT_ASSERT_NOT_NULL(test, low_rate_mode);
+
+	rate = drm_hdmi_compute_mode_clock(low_rate_mode, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	KUNIT_ASSERT_LT(test, rate, HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, conn,
+						     low_rate_mode, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+
+	KUNIT_EXPECT_LE(test, conn_state->hdmi.tmds_char_rate,
+			HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+	KUNIT_EXPECT_FALSE(test, conn_state->hdmi.scrambler_needed);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test that on an HDMI connector with source+sink scrambling support, driving
+ * the 4K@60 RGB preferred mode (~594 MHz TMDS, above the 340 MHz threshold),
+ * we end up with scrambler_needed set.
+ */
+static void drm_test_check_scrambler_needed_high_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	unsigned long long rate;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				&scrambler_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_600mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	conn = &priv->connector;
+	info = &conn->display_info;
+	KUNIT_ASSERT_TRUE(test, drm_connector_hdmi_scrambler_supported(conn));
+	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
+	KUNIT_ASSERT_TRUE(test, info->hdmi.scdc.supported);
+	KUNIT_ASSERT_TRUE(test, info->hdmi.scdc.scrambling.supported);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	KUNIT_ASSERT_GT(test, rate, HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+retry_conn_enable:
+	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, conn,
+						     preferred, &ctx);
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry_conn_enable;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	conn_state = conn->state;
+	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+
+	KUNIT_EXPECT_GT(test, conn_state->hdmi.tmds_char_rate,
+			HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+	KUNIT_EXPECT_TRUE(test, conn_state->hdmi.scrambler_needed);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
 struct color_format_test_param {
 	enum drm_connector_color_format fmt;
 	enum drm_output_color_format expected;
@@ -2494,6 +2643,8 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_8bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_10bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_12bpc),
+	KUNIT_CASE(drm_test_check_scrambler_needed_low_rate),
+	KUNIT_CASE(drm_test_check_scrambler_needed_high_rate),
 	KUNIT_CASE_PARAM(drm_test_check_hdmi_color_format,
 			 check_hdmi_color_format_gen_params),
 	KUNIT_CASE_PARAM(drm_test_check_hdmi_color_format_420_only,

-- 
2.55.0


