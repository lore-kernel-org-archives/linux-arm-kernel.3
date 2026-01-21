Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256BEC4452E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXpbPJgYV7Ucupj7vxYUaS+G1urBtfcN3fBzW9iWqU8=; b=gzxjI3AIKFFTlAUzH7cXbU4Q0P
	kt8qJ9AO7XRwAhIWm7zTPbDlxrwhK0rOQ3br0D3BgCOkjlD9gvYQD5VVDZgq4V6byUvTSohrugb78
	oAdR5MfrvkND6vjsldJYHS8yi9lgrZTBSAvXmdZ55UcUx/lALbdDsrf0zcnFZKBLqxgSzRHcU4JcQ
	tykx5GPerIDqMZwCburjpQWxBrKoPt1przEmtd6L8sp8QHrruEai/K4uWbYDCpfQEjzrtBfz6Cx5i
	vDzkabMAe6YqoFAlRQIt1X35QuCXyXia0ElSJeGOmYExVTwrE+3EivMf3uuA5jhhkeNxqb6Gt0EfW
	VFyUsCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZu-00000005XHG-0GYj;
	Wed, 21 Jan 2026 13:48:58 +0000
Received: from sender4-pp-g121.zoho.com ([136.143.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYZl-00000005X6H-2b1a;
	Wed, 21 Jan 2026 13:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769003299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qwpg9DWAbRPC91hP8Fj9N+KiTlsJaTYfUHPPwB+b4Raos3LVB6Xyhm5ZXxKOlSep/LIEYyto56rHSHh3l7EmAunMpu8D+6FmyRX+jtN0wIwdrRPbCxCvObQBOevU4zibwx8ksDF+bokMYMOEHtCMpnCJdOcwIr0QIL8pOrCsGbg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003299; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FXpbPJgYV7Ucupj7vxYUaS+G1urBtfcN3fBzW9iWqU8=; 
	b=TPtI+27aD1cU9awm1/DF4e2LcPZ8yVQeQ/nbUXAyuyK7dQRqf1NpcQsru5n9D5j1W1StGSqZjpbCEwm2EBJvdhzLtbJs9+lLfuhPChlOycMwfjRSRCRwK3Sb52mK51hfRhfWoxOhpBezCWqR/HnQKqYmRw3hGmvCoHwVaWEY4TQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003299;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FXpbPJgYV7Ucupj7vxYUaS+G1urBtfcN3fBzW9iWqU8=;
	b=F8pYhEYl/ZkioaZbNU8PawYFIUkMSRR/N1h8HUxkW0iXCyCNUrP2WMAw+JcirH96
	fc0WF9geUqVakxiVHoUq1I2oQQ2DRYIoJpQDhkbPK+3iCrTpP4W/yLFHlVpBp+AiG+9
	wuIJLvilhUCz7YzW4VKFdaDD2FCb6O+gZkoko/WM=
Received: by mx.zohomail.com with SMTPS id 1769003297130194.78690146603606;
	Wed, 21 Jan 2026 05:48:17 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:44 +0100
Subject: [PATCH v6 18/21] drm/tests: hdmi: Add tests for the color_format
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-18-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_054849_745846_0F7CD7CE 
X-CRM114-Status: GOOD (  17.99  )
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

Add some KUnit tests to check the color_format property is working as
expected with the HDMI state helper.

Existing tests are extended to also test the DRM_COLOR_FORMAT_AUTO case,
in order to avoid duplicating test cases. For the explicitly selected
color format cases, parameterized tests are added.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 191 +++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 4bdcea3c7435..f9648f9de46b 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -60,6 +60,23 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	return preferred;
 }
 
+static struct drm_display_mode *find_420_only_mode(struct drm_connector *connector)
+{
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode;
+
+	mutex_lock(&drm->mode_config.mutex);
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (drm_mode_is_420_only(&connector->display_info, mode)) {
+			mutex_unlock(&drm->mode_config.mutex);
+			return mode;
+		}
+	}
+	mutex_unlock(&drm->mode_config.mutex);
+
+	return NULL;
+}
+
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
 			      const void *edid, size_t edid_len)
 {
@@ -1547,6 +1564,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_yuv420(struct kunit *test)
  *   RGB/10bpc
  * - The chosen mode has a TMDS character rate lower than the display
  *   supports in YUV422/12bpc.
+ * - The HDMI connector state's color format property is unset (i.e. AUTO)
  *
  * Then we will prefer to keep the RGB format with a lower bpc over
  * picking YUV422.
@@ -1609,6 +1627,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+	KUNIT_ASSERT_EQ(test, conn_state->color_format, DRM_COLOR_FORMAT_AUTO);
 
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 10);
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
@@ -1626,6 +1645,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422(struct kunit
  *   RGB/8bpc
  * - The chosen mode has a TMDS character rate lower than the display
  *   supports in YUV420/12bpc.
+ * - The HDMI connector state's color format property is unset (i.e. AUTO)
  *
  * Then we will prefer to keep the RGB format with a lower bpc over
  * picking YUV420.
@@ -1687,6 +1707,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420(struct kunit
 
 	conn_state = conn->state;
 	KUNIT_ASSERT_NOT_NULL(test, conn_state);
+	KUNIT_ASSERT_EQ(test, conn_state->color_format, DRM_COLOR_FORMAT_AUTO);
 
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
@@ -2198,6 +2219,172 @@ static void drm_test_check_disable_connector(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
+struct color_format_test_param {
+	enum drm_color_format fmt;
+	enum hdmi_colorspace expected;
+	int expected_ret;
+	const char *desc;
+};
+
+/* Test that if:
+ * - an HDMI connector supports RGB, YUV444, YUV422, and YUV420
+ * - the display supports RGB, YUV444, YUV422, and YUV420
+ * - the "color format" property is set
+ * then, for the preferred mode, for a given "color format" option:
+ * - DRM_COLOR_FORMAT_AUTO results in an HDMI output format of RGB
+ * - DRM_COLOR_FORMAT_YCBCR422 results in an HDMI output format of YUV422
+ * - DRM_COLOR_FORMAT_YCBCR420 results in an HDMI output format of YUV420
+ * - DRM_COLOR_FORMAT_YCBCR444 results in an HDMI output format of YUV444
+ * - DRM_COLOR_FORMAT_RGB results in an HDMI output format of RGB
+ */
+static void drm_test_check_hdmi_color_format(struct kunit *test)
+{
+	const struct color_format_test_param *param = test->param_value;
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_info *info;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV420) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	KUNIT_ASSERT_TRUE(test, priv->connector.ycbcr_420_allowed);
+
+	info = &priv->connector.display_info;
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, info);
+	preferred = find_preferred_mode(&priv->connector);
+	KUNIT_ASSERT_TRUE(test, drm_mode_is_420(info, preferred));
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, &priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->color_format = param->fmt;
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, preferred);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_EXPECT_EQ(test, ret, param->expected_ret);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, param->expected);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static const struct color_format_test_param hdmi_color_format_params[] = {
+	{ DRM_COLOR_FORMAT_AUTO, HDMI_COLORSPACE_RGB, 0, "AUTO -> RGB" },
+	{ DRM_COLOR_FORMAT_YCBCR422, HDMI_COLORSPACE_YUV422, 0, "YCBCR422 -> YUV422" },
+	{ DRM_COLOR_FORMAT_YCBCR420, HDMI_COLORSPACE_YUV420, 0, "YCBCR420 -> YUV420" },
+	{ DRM_COLOR_FORMAT_YCBCR444, HDMI_COLORSPACE_YUV444, 0, "YCBCR444 -> YUV444" },
+	{ DRM_COLOR_FORMAT_RGB444, HDMI_COLORSPACE_RGB, 0, "RGB -> RGB" },
+};
+
+KUNIT_ARRAY_PARAM_DESC(check_hdmi_color_format, hdmi_color_format_params, desc);
+
+/* Test that if:
+ * - the HDMI connector supports RGB, YUV422, YUV420, and YUV444
+ * - the display has a YUV420-only mode
+ * - the "color format" property is explicitly set (i.e. !AUTO)
+ * then:
+ * - color format DRM_COLOR_FORMAT_RGB will fail drm_atomic_check_only for the
+ *   YUV420-only mode with -EINVAL
+ * - color format DRM_COLOR_FORMAT_YCBCR444 will fail drm_atomic_check_only for
+ *   the YUV420-only mode with -EINVAL
+ * - color format DRM_COLOR_FORMAT_YCBCR422 will fail drm_atomic_check_only for
+ *   the YUV420-only mode with -EINVAL
+ * - color format DRM_COLOR_FORMAT_YCBCR420 passes drm_atomic_check_only for
+ *   the YUV420-only mode
+ */
+static void drm_test_check_hdmi_color_format_420_only(struct kunit *test)
+{
+	const struct color_format_test_param *param = test->param_value;
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *dank;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV422) |
+				BIT(HDMI_COLORSPACE_YUV420) |
+				BIT(HDMI_COLORSPACE_YUV444),
+				12,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	dank = find_420_only_mode(&priv->connector);
+	KUNIT_ASSERT_NOT_NULL(test, dank);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	conn_state = drm_atomic_get_connector_state(state, &priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->color_format = param->fmt;
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, dank);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_EXPECT_EQ(test, ret, param->expected_ret);
+	if (!param->expected_ret)
+		KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, param->expected);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+};
+
+static const struct color_format_test_param hdmi_color_format_420_only_params[] = {
+	{ DRM_COLOR_FORMAT_RGB444, HDMI_COLORSPACE_RGB, -EINVAL, "RGB should fail" },
+	{ DRM_COLOR_FORMAT_YCBCR444, HDMI_COLORSPACE_YUV444, -EINVAL, "YUV444 should fail" },
+	{ DRM_COLOR_FORMAT_YCBCR422, HDMI_COLORSPACE_YUV422, -EINVAL, "YUV422 should fail" },
+	{ DRM_COLOR_FORMAT_YCBCR420, HDMI_COLORSPACE_YUV420, 0, "YUV420 should work" },
+};
+
+KUNIT_ARRAY_PARAM_DESC(check_hdmi_color_format_420_only,
+		       hdmi_color_format_420_only_params, desc);
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
@@ -2227,6 +2414,10 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_8bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_10bpc),
 	KUNIT_CASE(drm_test_check_tmds_char_rate_rgb_12bpc),
+	KUNIT_CASE_PARAM(drm_test_check_hdmi_color_format,
+			 check_hdmi_color_format_gen_params),
+	KUNIT_CASE_PARAM(drm_test_check_hdmi_color_format_420_only,
+			 check_hdmi_color_format_420_only_gen_params),
 	/*
 	 * TODO: We should have tests to check that a change in the
 	 * format triggers a CRTC mode change just like we do for the

-- 
2.52.0


