Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F5D5E369
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+nD5HJByLExsTSOICbG27tCgbmZZrKa+DbcceQO2vk=; b=fjBrzqUidQcI1lsS28bZDdkwZ9
	3gVh1U8BXWuNl8njqZV2vFmY28LFf8uwiIVZDr23YIhtdsUtnQ53FDJt0DPQRBhgdNgxy4UugffCs
	a0KsxL+2mjiw15Z0N5vkoWUllGTTE7PnQ8rpD8zOszY3+vSJ5ZRqp2jsP7zBUsa+ikydMrZcqLSKe
	8oJozMd/uDrxnKOFZyhO7DGFmKtw4GmAy9PralThKR7+Zzstj+UIc6vErLBwu3XsQH2dxhs+/THR1
	nO2JTw3brXbTxY11BmLv+0O38+u2IyK0V32lbCBfAb8fLDJ++rQLOx67p/lIdBVJSnh3SUmpegdz2
	LMw/Trww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kjy-0000000DJpd-3glO;
	Sat, 09 Nov 2024 12:38:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9kgQ-0000000DJ2V-3lcT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 12:35:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53c73f01284so3728253e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 04:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731155717; x=1731760517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+nD5HJByLExsTSOICbG27tCgbmZZrKa+DbcceQO2vk=;
        b=HaIxWrJSlg3hfhlIh+BI/DsaOa+tGtgo4iUitJtP/tKKN1N2e0uKoA6fu7nGE3FHXQ
         OhAZ2Zrywba6705tf4k0bqo3kzEu9G8YFq3vcnbZFD4hMVqTrfFaLIoYXDIkygoYIV8A
         SjtPdw+sYcHPfWfNk9yFDNAx7nJphOWeCLtSmk1JlC76R3egYn8guxzgwOe1dVhJEhnf
         nQLt5uBJ9gQLISvhcRa2NjOZlaHO5p7FXLscarZmLJC9uO7jjeCJuobek3EetVLdjAQ5
         fEIDhjbwzD0adid6JUEks2tR0Y6o6YwCkIF9L8gn2Q9Jjq7IxQhgyVqNuN/z/s2qyRRH
         i86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731155717; x=1731760517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+nD5HJByLExsTSOICbG27tCgbmZZrKa+DbcceQO2vk=;
        b=UPTZUXuhnDnliygZxbOBghNsnQnKl8ZPDDUlLsdbn4IX5ARtQHaSBYb0nSOuqMFe4t
         Ldgpk5wcURw5dsBxfW1HVumQtND7So36JYRSZqowGdzeiGIDItKoiUvhiSKvXp1Z5soD
         3VxexrZuN//MBzVKO8vw/zADSZO6OTxN/IvaQTABHeldWZV4MGo0f1Emga1bZvsQ9wCB
         MzAcuJQCUJH0b4XCx1mhLhhQjZSuY07KRacqRw2fb9mYV/hdPXUIVuDNySgsDvsud9LD
         oTW1TfU9mqPR/OSTmN25WPgqI9XJzFCn3KIez7nYWwH/otEP4UUnODai933lC1qbImTO
         MqLw==
X-Forwarded-Encrypted: i=1; AJvYcCXCWNgscNi7lyjMWVckBUOeEaKrMglFFrA6eCdBj007V13o6MDmC5Lly33l2fUMtAwO7OLMJm4IbiruHCo8gLcV@lists.infradead.org
X-Gm-Message-State: AOJu0YxjiLUDJMOO72UuddmRqjjMsbQKs0O5kEerjdNtde4wQ3w4g6Hk
	sZx2+ivIroKzM9z/K4FpOkXVVd8I1xno7PhIsECrzb0L1hZp+9w/J4Q/vrD0sso=
X-Google-Smtp-Source: AGHT+IGJo4jZoEglm9go0nIAPmKBkvOJcvZk4GwfWpbMZ+lIEILOqU9QXlUgXQNesCnZ0pMqP2i/gQ==
X-Received: by 2002:a05:6512:3c8e:b0:536:553f:3ef9 with SMTP id 2adb3069b0e04-53d86296487mr3367516e87.27.1731155716900;
        Sat, 09 Nov 2024 04:35:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:35:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:05 +0200
Subject: [PATCH v3 1/7] drm/display: hdmi: add generic mode_valid helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-1-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10210;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=O0+dNPOmXaHGOBHqPcLUaOUNdAb4skVm7YApfGYSVUE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+2L9z8q471i1Ic2Gzf/eb68z07L/TghJ9VywN2NKgG
 nXnxZV3nYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyAUV9v+pyQtrY8KOBvWl
 cATFFCX/u3qFUz7+u2HChUUB7+fFHGjM6c+Pq7j71DOPxXfecUWOR6kFr9gKG70W6iT6atRUc92
 d1zqvSNT2h/0G6W8JcoohfOu4771VcT2S4Mj9IG9iS+jLRo+e6bwJNX5PXAzi+MUnTvUVqBJs//
 aNpSNud83SKdNPzMgpMgs9LnO6deG/nMcsVr+UT/F0s7YuXOxayJcpq7iLMyI1VPHIuXM85Quv6
 c2YfNXcNJ3p8hY7BbbLkXLCPHtEnV+IJ0pr9x76qP1WIsVl2dmQOWdiixt5fyi5XttozqA584Bz
 0/GsaDVbp90+Fy6enhbGMMOmSEl7yu+pXLdUgqbrnbkDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_043518_983706_2A1FCFEA 
X-CRM114-Status: GOOD (  19.49  )
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

Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
It can be either used directly or as a part of the .mode_valid callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 +++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 181 ++++++++++++++++++++-
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 3 files changed, 204 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -521,6 +521,27 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
+/**
+ * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
+ * @connector: DRM connector to validate the mode
+ * @mode: Display mode to validate
+ *
+ * Generic .mode_valid implementation for HDMI connectors.
+ */
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	unsigned long long clock;
+
+	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (!clock)
+		return MODE_ERROR;
+
+	return hdmi_clock_valid(connector, mode, clock);
+}
+EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
+
 static int clear_device_infoframe(struct drm_connector *connector,
 				  enum hdmi_infoframe_type type)
 {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710dc56772f839c2db9c2e487bbc1e..67c3e882592b00d803d8cba5d183aa90339a16b4 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -43,10 +43,14 @@ struct drm_atomic_helper_connector_hdmi_priv {
 static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
 {
 	struct drm_device *drm = connector->dev;
-	struct drm_display_mode *mode, *preferred;
+	struct drm_display_mode *mode, *preferred = NULL;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+
+	/* Handle the case when all modes were rejected by mode_valid() */
+	if (!list_empty(&connector->modes))
+		preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;
@@ -125,6 +129,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
 };
 
+static enum drm_mode_status
+reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					     const struct drm_display_mode *mode,
+					     unsigned long long tmds_rate)
+{
+	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
+}
+
+static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -147,6 +163,33 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
 	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.get_modes	= dummy_connector_get_modes,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
+};
+
+static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connector *connector)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		connector_to_priv(connector);
+	const struct drm_edid *edid;
+	unsigned int num_modes;
+
+	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
+	if (!edid)
+		return -EINVAL;
+
+	drm_edid_connector_update(connector, edid);
+	connector->display_info.max_tmds_clock = 100 * 1000;
+	num_modes = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(edid);
+
+	return num_modes;
+}
+
+static const struct drm_connector_helper_funcs dummy_connector_helper_funcs_max_tmds_clock = {
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.get_modes	= dummy_connector_get_modes_100MHz_max_clock,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 };
 
 static void dummy_hdmi_connector_reset(struct drm_connector *connector)
@@ -1734,9 +1777,143 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
 	.test_cases	= drm_atomic_helper_connector_hdmi_reset_tests,
 };
 
+static void drm_test_check_mode_valid(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
+}
+
+/*
+ * Verify that tmds_char_rate_valid() can reject all modes.
+ */
+static void drm_test_check_mode_valid_reject(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	struct drm_device *drm;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
+
+	priv->current_edid = test_edid_hdmi_1080p_rgb_max_200mhz;
+	priv->current_edid_len = ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz);
+
+	drm = &priv->drm;
+
+	mutex_lock(&drm->mode_config.mutex);
+	ret = conn->funcs->fill_modes(conn, 4096, 4096);
+	mutex_unlock(&drm->mode_config.mutex);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NULL(test, preferred);
+}
+
+/*
+ * Verify that tmds_char_rate_valid() can correctly filter out high-rate modes,
+ * but allows small modes.
+ */
+static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_100_MHz_connector_hdmi_funcs;
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+/*
+ * Verify that the framework filters modes based on info.max_tmds_clock, while
+ * allowing small resolution modes.
+ */
+static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	drm_connector_helper_add(conn, &dummy_connector_helper_funcs_max_tmds_clock);
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
+	KUNIT_CASE(drm_test_check_mode_valid),
+	KUNIT_CASE(drm_test_check_mode_valid_reject),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_mode_valid",
+	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
+};
+
 kunit_test_suites(
 	&drm_atomic_helper_connector_hdmi_check_test_suite,
 	&drm_atomic_helper_connector_hdmi_reset_test_suite,
+	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..d6d65da6d8f9ee46de33114cce2d6fbe6098a862 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5


