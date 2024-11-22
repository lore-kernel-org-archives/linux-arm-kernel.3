Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBADE65D17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bn7n+Ij/Vq2ciN8r7fMFmAZOh0BG4t/fByh+MoATRM4=; b=rnWIv7ywws3x8OXZGYq3HTtekb
	O70mmlWGLp5sQiU9BzeDJv/GphmTDqrjYbdwEP1gSop5ATSPVqvNIeAeC5DT3CLdMcsljK7v1EF2O
	cKR0+xsXjVbJcdv1EY29/n9Cgcb5aiGprB9/1NUdD2AAxiAqJ8WMlnzkWSehpcorIJtvUsqO807vb
	ivKnrUF+1BuS2Nrn0ZW5htM50OQ9gttK+tAo+dvM8tIceNK9pv5IlSXHe4cghGRXy+s35b+SMrz8r
	y3L5fDZpq1sW86F/FRHjp0586mtciaDwOu9KKmwiDtJohRjsWw5nkkhiIQeRBSqGcI/lySAQxMcBH
	qfaHpKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPmi-0000000239n-1cQi;
	Fri, 22 Nov 2024 09:17:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPj4-000000021f8-3CL3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:19 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53da209492cso2433520e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266797; x=1732871597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bn7n+Ij/Vq2ciN8r7fMFmAZOh0BG4t/fByh+MoATRM4=;
        b=rBMY5boGuIXA27bV049oMnpyUtbHJl5H4aH1jQ/WH95MDa2msnPPa7ODSq+6xZc1yh
         SwvknvV870pYbgzKFPES98z4nqGQ3+X3pIT+Toy43Dl4QLjHNDPx7Gbn9QZPmX64weUA
         28TN08u4maXiH8ue1k39SR2jY8MjDSzSh87jJ4hdBhb4qxiCYdBHiPOmLRI8l7PGSyJH
         BVh+oZmQBs9ZTuus9vPgf09g/6HCNxlIqzYFnP8uM3H8tPp6ExF3VJIAMfysP9RGnBdn
         03nDQ20ijfhboAn683iaWAOjURS7D5nv0JboX7kG81ciIy5R/wJEI0dvPoXCXV3nfb34
         W4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266797; x=1732871597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn7n+Ij/Vq2ciN8r7fMFmAZOh0BG4t/fByh+MoATRM4=;
        b=dGkXdWBsd3zVSIHFI3i6lYzh5D3AO9aH150X6A0QVyHkmByjLvIAnJ1+M1qAliXBOC
         w7ZVQyaOc8KnfdoqZH4bHf+d38Lg1QB7kDqxCH5fEte+sorFIdtLZ/UX1nDtNsPnLZXp
         v65MFvQoaKkjr9yjeCo+0tejDB1TsL6nGAJIFerZOVkdH2sozemqOq3ndLlNRcEuewuM
         cWzLpqyb0YyoGpTMF2kUaYuCHI/xXcoDthDG98V6XqKzi7NRGvzouo0W5x3qfhH6d0jh
         aYEABma+7xNCQyLgI/NwMznUuvq0DtsHflXArdb9J+qsm2TGh0iNjgfHHwrSu0tMfI29
         quMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUoe6a5rzx8X28FEU6VOdDgFQQVUSFOZwgLS6agRnFmuXdhIs/IMJFezyYVlGpzdf/8L+jFoAeE/edS/SxSEhU@lists.infradead.org
X-Gm-Message-State: AOJu0YyAEYDCHxgMR4c5I6JvfVBhhdgbE8mfuASfQHcvdClcaAFEU1lv
	P6MTj+hRm2zr76LcUjkye38TsVD+JOw9rq84N/XawM2a56y0+yblDeF/mXBFW4U=
X-Gm-Gg: ASbGncuusZ8MS2roJ0RQvqqb5pXkfHMGghqZRvm7/WylAhlcfM6CuvMW1mZ0hYh4NwV
	xaMH56QXCUgINbhAtK+AJ+eBcalOWNgHZ0SUGGEe9+cLLrrvn4ZL+FgcXkWc4wed1qhRhVevlu7
	r9figskpRrA7E/cyaclUe4MKObQwPOmSv99arGfxbKcwaw2NlogOTw4uMIjm1zkfkuyUOkv4+AH
	7j7JbXoZBLjVkYgrXnz4m8e/a/VAGHXUYXJ4Q9DuO4kyCueFfQd8tz4GQ==
X-Google-Smtp-Source: AGHT+IFq3zbQ0De3BTK0sXYYbItGqTSGZgyN0ksGm0iVTU9b2Y4WWbgSyJUSMBI6BlqGlAARhL7baw==
X-Received: by 2002:a05:6512:3c83:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53dd39a4c72mr747793e87.45.1732266796855;
        Fri, 22 Nov 2024 01:13:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:59 +0200
Subject: [PATCH v4 03/10] drm/tests: hdmi: return meaningful value from
 set_connector_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-3-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6697;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ua4QBZ4riM6Opp9fYNSoyg41GZXfyIYINU+ndYQUB6k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshxoQTVi+os/StFFK828rJmRTkBm3HXf3HO
 zvtKRVX30SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1dt8CACsBNzvug3dVlllsHPsfMwgWOnSIMgZwk0MWkGA0gAUUoTWpzd8byhb5O2YUsxEjhr8Pkc
 rf4sGlX9xHatXY1VjWmQallOgJ47yMezHGxAXqU2PIBMvbWSRERsZLvhhV88v00dmoXIvnRK1Ft
 aJl73es6aUazP/Y54Ew7mQ67iwgmpbwBjLtXuP3QjxU34fWTp0ca1GTepxqcEtGyG/w24eNDcqW
 K3Wm9uQY70CNwQUwLIPOI50MQCd0FBUrZ2vx6S0JW3yvojemLbXB4Hz4Yhk+OscNHFE0URzxFq3
 UmTvOfjhJp4j5t73KK4l+jKMfEuWyAuHtsPfjDgiEftV8Snk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011318_842801_01890434 
X-CRM114-Status: GOOD (  12.10  )
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

The set_connector_edid() function returns a bogus 0, performing the
check on the connector->funcs->fill_modes() result internally. Make the
function pass the fill_modes()'s return value to the caller and move
corresponding checks to the caller site.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 31 +++++++++++-----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index d81254d46975e8af0d782249928217a1ebb7646e..c963d7015d179ac36e646d4c19d986ac5997dd2c 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -105,9 +105,8 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	mutex_lock(&drm->mode_config.mutex);
 	ret = connector->funcs->fill_modes(connector, 4096, 4096);
 	mutex_unlock(&drm->mode_config.mutex);
-	KUNIT_ASSERT_GT(test, ret, 0);
 
-	return 0;
+	return ret;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
@@ -223,7 +222,7 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	return priv;
 }
@@ -728,7 +727,7 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -802,7 +801,7 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -873,7 +872,7 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_dvi_1080p,
 				 ARRAY_SIZE(test_edid_dvi_1080p));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
@@ -920,7 +919,7 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -967,7 +966,7 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -1014,7 +1013,7 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
@@ -1121,7 +1120,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1190,7 +1189,7 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1254,7 +1253,7 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1314,7 +1313,7 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1381,7 +1380,7 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1447,7 +1446,7 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
@@ -1507,7 +1506,7 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	ret = set_connector_edid(test, conn,
 				 test_edid_hdmi_1080p_rgb_max_340mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_340mhz));
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_GT(test, ret, 0);
 
 	info = &conn->display_info;
 	KUNIT_ASSERT_TRUE(test, info->is_hdmi);

-- 
2.39.5


