Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA6FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OL13JVBR68Mnkp/wlBnyHndHAIOOG8QbF4G75eYPA1k=; b=4AY58Kt5kmC+QEYVPyiDpHzj47
	gZ6XCGYGayAd5u9MCyNaw8PtOf6Nx0ctVbwoY73h8LJbssY96wwH//H2uWlNgizEPIqKMCMPm5HOv
	ACDi31YvmbW3J1oEWv0ySoYq6xNC77aFuaN+EgdchoN0qrccaJm4IJtB1L/mEAGnRPz+VUL8AihIx
	Td4sJWXfvUIrfx9WK5psQmwh0PK/ZXuHDzBGx5rRayfJ5MqF4go8YWDEeuWGUqMc39cileEkMG75G
	onjcb56/7g1o8ZuPdBwhNlmXADDCSP9MOCqQrgrtRB/Xti/nU1LfY3WWIBrQvXR7UbPbfA4OgrLXh
	1+njCAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIhd-00000004gxy-0KnQ;
	Thu, 02 Jul 2026 14:47:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIgu-00000004fFk-0SkY;
	Thu, 02 Jul 2026 14:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783003617;
	bh=2nxPpRr0flrGE7hSOuNVa4V/V3MS4CEdYR5bHb19ASY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c8gYdzJKAXWgLpLje16loYg2FHWsu/T9v7OEYO+zIssXLlj+skjbHT/cxaDoh6ZWM
	 4vT5y2MgKo65qZy8UEgjtCkpK6+pgsPFHNF7NYW7aB0WcWQ6yhy/TO2kq1iAigB1CI
	 s9f/NtXXPvPETVU6W/oVt+rUjLUb7gwlR83L0lcembcUSN4x003RT2YnqmMsXXF0dd
	 6VNNR0XDywCbHcGLs35jl3g2B02pGcXn10IL1uhQun4wNkz9C6P6TEBM9jJCeTESkz
	 tMU79OTUW3RS7ROdWLDPkrdhe3tHJfWEb88SlsIJ16h4f6MYNVdN1y3e8/uXE4iNlb
	 cOp10m4tCiAzA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8720D17E367D;
	Thu,  2 Jul 2026 16:46:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 02 Jul 2026 17:46:48 +0300
Subject: [PATCH v8 35/39] drm/tests: hdmi_state_helper: Add
 max_tmds_char_rate fallback tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dw-hdmi-qp-scramb-v8-35-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_074700_560316_F5FE3B25 
X-CRM114-Status: GOOD (  15.44  )
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

Cover the fallback in hdmi_clock_valid() that rejects modes whose TMDS
character rate exceeds connector->hdmi.max_tmds_char_rate when the
driver provides no .tmds_char_rate_valid() callback. Exercise both an
explicit limit set through drm_connector_hdmi_caps and the limit
inferred from caps.supported_hdmi_ver, and confirm that a driver hook
takes precedence over the connector limit.

The connector limit is installed via the new
drm_kunit_helper_connector_hdmi_init_with_caps_edid_funcs() helper so it
is in place before mode probing runs.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 6a7dd2de002a..b8ae5fad2794 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -174,6 +174,26 @@ static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs
 	},
 };
 
+static enum drm_mode_status
+accept_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+				      const struct drm_display_mode *mode,
+				      unsigned long long tmds_rate)
+{
+	return MODE_OK;
+}
+
+static const struct drm_connector_hdmi_funcs accept_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= accept_connector_tmds_char_rate_valid,
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
@@ -2771,6 +2791,103 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
 }
 
+/*
+ * Test that a driver-provided .tmds_char_rate_valid() hook takes precedence
+ * over the connector->hdmi.max_tmds_char_rate fallback: the fallback must
+ * not be consulted when the hook is present.
+ */
+static void
+drm_test_check_mode_valid_driver_hook_overrides_max_tmds_char_rate(struct kunit *test)
+{
+	struct drm_connector_hdmi_caps caps = {
+		.supported_hdmi_ver = HDMI_VERSION_1_3,
+		.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+		.max_bpc = 8,
+		.max_tmds_char_rate = 100ULL * 1000 * 1000,
+	};
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *preferred;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_caps_edid_funcs(test,
+					&caps,
+					&accept_connector_hdmi_funcs,
+					test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
+}
+
+/*
+ * Test that drm_hdmi_connector_mode_valid() falls back to
+ * connector->hdmi.max_tmds_char_rate when the driver provides no
+ * .tmds_char_rate_valid() hook, rejecting modes whose computed TMDS character
+ * rate exceeds the connector limit.
+ */
+static void
+drm_test_check_mode_valid_reject_connector_max_tmds_char_rate(struct kunit *test)
+{
+	struct drm_connector_hdmi_caps caps = {
+		.supported_hdmi_ver = HDMI_VERSION_1_3,
+		.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+		.max_bpc = 8,
+		.max_tmds_char_rate = 100ULL * 1000 * 1000,
+	};
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *preferred;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_caps_edid_funcs(test,
+					&caps,
+					&dummy_connector_hdmi_funcs,
+					test_edid_hdmi_1080p_rgb_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+/*
+ * Test that the max_tmds_char_rate inferred from caps.supported_hdmi_ver
+ * is applied as a mode-filtering limit: with an HDMI 1.3 connector
+ * (340 MHz inferred cap) and no driver hook, modes whose RGB444/8bpc TMDS
+ * rate exceeds 340 MHz must be filtered out even though the sink itself
+ * advertises a higher limit.
+ */
+static void
+drm_test_check_mode_valid_reject_inferred_max_tmds_char_rate(struct kunit *test)
+{
+	struct drm_connector_hdmi_caps caps = {
+		.supported_hdmi_ver = HDMI_VERSION_1_3,
+		.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+		.max_bpc = 8,
+	};
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *preferred;
+	unsigned long long rate;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_caps_edid_funcs(test,
+					&caps,
+					&dummy_connector_hdmi_funcs,
+					test_edid_hdmi_4k_rgb_yuv420_dc_max_600mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	KUNIT_ASSERT_EQ(test, priv->connector.hdmi.max_tmds_char_rate,
+			HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	rate = drm_hdmi_compute_mode_clock(preferred, 8,
+					   DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	KUNIT_EXPECT_LE(test, rate, HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ);
+}
+
 /*
  * Test that drm_hdmi_connector_mode_valid() will accept modes that require a
  * 4:2:0 chroma subsampling, even if said mode would violate maximum clock
@@ -2865,6 +2982,9 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
 	KUNIT_CASE(drm_test_check_mode_valid_reject),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	KUNIT_CASE(drm_test_check_mode_valid_driver_hook_overrides_max_tmds_char_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_connector_max_tmds_char_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_inferred_max_tmds_char_rate),
 	KUNIT_CASE(drm_test_check_mode_valid_yuv420_only_max_clock),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_yuv420_only_connector),
 	KUNIT_CASE(drm_test_check_mode_valid_accept_yuv420_also_connector_rgb),

-- 
2.54.0


