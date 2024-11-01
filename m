Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13B0E67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=; b=mlsNMHucUCr96bg6r+uTFBev9o
	bYAGp3z+dyIdTqon+Jr5qsE38lI86Hnok2d4uMMfB2mMEXdM4LO/TcEJnqH0+JtU/uE7NT3fVOshb
	Ft609oK89aAAPziVNuejd29Qg6RSruwka/EN4t+KB8RJD3YcC7p884OshTqft5UWfubF1UVvpkR3T
	pkFaSrSHdcqf1PYSUbwm6guYTc51DTkxwnkTl61ofBPz+y82RUAKsEIU9wAbEEwtCtAA/A4yBtbO7
	pnegCdyo6w5XX+HYkovLq1D8UTUTPsIL9ltE2+STFqpfht4pny68g41dJuR9NLZOs2Djy3Fr+CbAW
	dUFuuaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fYE-00000005Inv-3tra;
	Fri, 01 Nov 2024 00:30:07 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTV-00000005Hoo-11bx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:14 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso1574304e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420711; x=1731025511; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=;
        b=WVzQiasnEpgEIBDIaULtEDmEgRZfAayDzQtIk1rcwRVNgJNOsWzVtxaOkY4y80H/qN
         bp72m2X6rpGAeqyf5k8PKtUz92yntluqw3peKgbeJ4xcLJ1TOf90q9pzZ/iyoo0AjaM+
         fkH7/LlnfpQW3X0xAc45OuhNO4CGnv7cqttCBznmEUiYxFkMq5nnS2TOkUumYS3WiXPs
         nv0tysNSDGAA5O0hJkVYwSndennxEhPRedoeCkqFcubDAAGHCsBnmZuTDsIsC03SeQrc
         byX6ymY0TYaVrmSNYK5p3uGrTDXAEMR7zuCbatx75623JSu1maVZOACyQC8crUIWMUIP
         jInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420711; x=1731025511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=;
        b=uNvymNsPaUphd1aZ0fNApFkrw2dBNxWR7pf6Pc9aRWCgIrbo0KJhKG5IIC1Be+x5ml
         /+J1BNSK+qyV7FkzANL5R4XjO5UP1JrpFzL+KA5JXCb7/09VZS4mb+X3hUlbWudEKpa8
         U9gjJ9SanLOdGrlfmZfP1oeyfALcoOrhJhbZiPI2FXZWA9mqZllYLUOpvdPtMcOF7hr2
         nRGvGJkaCxhJ3bB5byJzN6zRloJ/p9N/Fq7pTlL6zuvgJ/1qQwL8r3jqnnKyM15SYbuz
         BHze1Ai59cDe4B6raWSizJzga2SOeL8n9hvrmsJsHwIFRhyS4UL94eQ00g2Q8GSQ4cPx
         SZfA==
X-Forwarded-Encrypted: i=1; AJvYcCU8S9RoQaL/A2IgskGYe7rH/7AInBJOwrB4HDaNy5WV8U4BMe/lal64zMeQSWnz8GFOwg6vFGzAGz/cuKuAc4Pj@lists.infradead.org
X-Gm-Message-State: AOJu0YwD7eeoTgl/yQD3o/fBN3PzeJ7oIlJMVVveBiS0lBWlLn1FPh1e
	qlbEqRruq1Kjn44vT3RseAcWlNTBWyB7Y9L6uieFkCDgCJ2IYfnBXCdbs5OOA3k=
X-Google-Smtp-Source: AGHT+IFl02U+Enu+dOc8nLBGUqiQvjvTgpJmOb8nUqlghPqDc1+5KcRdRr4F22uyWdsyfKCDEEXcqg==
X-Received: by 2002:a05:6512:114f:b0:539:958a:8fb1 with SMTP id 2adb3069b0e04-53d65e1aeecmr830681e87.60.1730420710791;
        Thu, 31 Oct 2024 17:25:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:04 +0200
Subject: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12996;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kVBUKzWAeHVvHBydx3EkRE4Q3REprXqMLr3/QDo5buM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/h+qQ1svDVzgd0LXjIU1mOZYulRshe8N4cO
 hhkv1trDDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1YsEB/oCWybrGbF8Zp55m5T5SgJSWWMvmHdwta73P4TbzdbYxcw2s2JeW3ZdBed51YYxvd29orC
 p6PB0KX/CZKEEyn4Xp9ZqQYRtEo4BZufIesiJxN6SWc+jisZtmmNry8JkoNh0C6UaLeip2k6dF3
 HHISp68oCmsgCVPYX7oPUN3Yv27H8YXfd1/UllhI2fuAMNtl4txBzdiPwRlvJpZEKv3CkGnOgeP
 QTdDn7BX88d9AjlBozZcgJa5Hib1obJ31EY57vKWvMxLt1vgPH5PIE1g94Nmq01lQdsUoZvV3GJ
 HjeNxTzyfa42+vFSYu0Zppy75ikECUbDVNoTowRpSr3FDqub
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172513_351601_C6D66381 
X-CRM114-Status: GOOD (  22.00  )
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
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
 include/drm/display/drm_hdmi_helper.h              |   4 +
 5 files changed, 229 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..560c5d4365ca54d3f669395349cedfd6f75fa033 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -9,6 +9,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_property.h>
 
+#include "drm_hdmi_helper_internal.h"
+
 static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
 {
 	return sink_eotf & BIT(output_eotf);
@@ -256,3 +258,46 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
 }
 EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
+
+enum drm_mode_status
+__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	const struct drm_display_info *info = &connector->display_info;
+
+	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
+		return MODE_CLOCK_HIGH;
+
+	if (funcs && funcs->tmds_char_rate_valid) {
+		enum drm_mode_status status;
+
+		status = funcs->tmds_char_rate_valid(connector, mode, clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
+	return MODE_OK;
+}
+
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
+	return __drm_hdmi_connector_clock_valid(connector, mode, clock);
+}
+EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
diff --git a/drivers/gpu/drm/display/drm_hdmi_helper_internal.h b/drivers/gpu/drm/display/drm_hdmi_helper_internal.h
new file mode 100644
index 0000000000000000000000000000000000000000..ee74435c04f62cf71b9857bdc427c46442b85697
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_helper_internal.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DP_HELPER_INTERNAL_H
+#define DRM_DP_HELPER_INTERNAL_H
+
+enum drm_mode_status
+__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock);
+
+#endif
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..29c2cb2c3171366a2a68fc6ad48f8ad8a4dc7e30 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -8,6 +8,8 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include "drm_hdmi_helper_internal.h"
+
 /**
  * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
  * @connector: DRM connector
@@ -198,28 +200,6 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 	return false;
 }
 
-static enum drm_mode_status
-hdmi_clock_valid(const struct drm_connector *connector,
-		 const struct drm_display_mode *mode,
-		 unsigned long long clock)
-{
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
-	const struct drm_display_info *info = &connector->display_info;
-
-	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
-		return MODE_CLOCK_HIGH;
-
-	if (funcs && funcs->tmds_char_rate_valid) {
-		enum drm_mode_status status;
-
-		status = funcs->tmds_char_rate_valid(connector, mode, clock);
-		if (status != MODE_OK)
-			return status;
-	}
-
-	return MODE_OK;
-}
-
 static int
 hdmi_compute_clock(const struct drm_connector *connector,
 		   struct drm_connector_state *conn_state,
@@ -233,7 +213,7 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	if (!clock)
 		return -EINVAL;
 
-	status = hdmi_clock_valid(connector, mode, clock);
+	status = __drm_hdmi_connector_clock_valid(connector, mode, clock);
 	if (status != MODE_OK)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 34ee95d41f2966ab23a60deb37d689430f6b0985..8640e7280053bd95852f53b92159f493b141f2bf 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -43,10 +43,12 @@ struct drm_atomic_helper_connector_hdmi_priv {
 static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
 {
 	struct drm_device *drm = connector->dev;
-	struct drm_display_mode *mode, *preferred;
+	struct drm_display_mode *mode, *preferred = NULL;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	if (!list_empty(&connector->modes))
+		preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;
@@ -125,6 +127,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
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
@@ -147,6 +161,33 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
 	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.get_modes	= dummy_connector_get_modes,
+	.mode_valid		= drm_hdmi_connector_mode_valid,
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
+	.mode_valid		= drm_hdmi_connector_mode_valid,
 };
 
 static void dummy_hdmi_connector_reset(struct drm_connector *connector)
@@ -1734,9 +1775,132 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
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
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
index 57e3b18c15ec79636d89267aba0e88f434c5d4db..93f0e566257338fb6e9a1f0b2cc14ce9c97ec0a5 100644
--- a/include/drm/display/drm_hdmi_helper.h
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -28,4 +28,8 @@ unsigned long long
 drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 			    unsigned int bpc, enum hdmi_colorspace fmt);
 
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode);
+
 #endif

-- 
2.39.5


