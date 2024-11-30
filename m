Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52690D735EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 01:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=; b=J8EyOwBOCWz+FnQUEVkRpRFTbU
	kPWUguNjmyXGsbLNfVvKuEBD+6HPCb9UGGRo5R0035sl3MN5Lw/SIIzXorx2eG6PydsmAUU42MaAX
	Vl2h68XK0i2U/jaZ4h/WBGk1EqabtZqP0jQW8EFzwCBGLMB7EDQvtQcEIQfulWqiC/irav39a1LlP
	U+3zgAaddXu/mWi4H7WoPqGt7BsVTXBKg5FB81HOHpImkaoW6vee9wRIdk+igWH56G7IK4o5tNmh+
	7oO+J1XUw4W8MMo9x6HZU+sMHi7Erj86p6JecAM8EXBikLRcq/ShNc6fX3/4cdPCCg/pCnm9qCkiV
	St//JJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCht-00000001HBO-3u8C;
	Sat, 30 Nov 2024 01:55:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHCf4-00000001GPr-2X1p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 01:52:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53df1e063d8so3074843e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931561; x=1733536361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=;
        b=lLdh2fA045NOuljY2wAW2PvuQChHrePWTRC7fx+b4d4/Imjs0f5rxmnJOXQdHmFjsT
         xDf+FFSxt5N5Szn26d47KPR7htHfl3s5TJoKIIjmod60PGWSLWbvQHz6rgjp+IxEKUDE
         hWm+ypyydf6Q9NGmyIcrx06m2/HhSnOM3zIq91TmPVKaK4O0hHTJqVyaAaeCl5P9FEEX
         bTxZbLJM4Rnal3Y5f9227HxTmJLpTGrEGaAqLmBVPLQqhis/g98Wtzt+P0csMlMc2Vmh
         VIA/uch49FxMSMebHeGEfSnErG4/S8yLVw1jv/DSorBiAdTme+zqyLz+C0Z6BdqjsBUq
         MOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931561; x=1733536361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4B0Y8eeW8nijFHMU2wdPBEmou1JUmUHuwSM02tCW6A=;
        b=koMxBBl5KzOzXBsWXlkzf96hrJwERpR+oLyB5X3/zPv9llAUTzof3+H3iH5KnWdIhQ
         cDfIG6L7BlbMskrz3Ys6mcdSes4b9S1A+WtWgBJCEwhTHPzwa6Apt/rrTJVUM8USaAzL
         ZdLw0M5F2OwGNnRUFxvwdxPFHIzIoVI+7IYrGrTeTuAAe+sBXlXNEgjBEKzruraOp5JE
         BCgGUuezuldavbHBAC96cDBDOmlg/+lysAYyKMdmdtuzavVA8huej4ONl5reCWAmiqAV
         vxMykXhRGtEXokx4FQDMGx/9o6VHchV57ze62HXg/sASN00raqZPAaYHqHmR6Fmg3ckF
         gwZA==
X-Forwarded-Encrypted: i=1; AJvYcCWk6wsHuLLtPjhds7zKC1mZaRolsGOnedqeCwvYkkbNgbTD1iRY6Zoja9fa5Nu2JMj0t/5IvTWaXIXqcesiMevm@lists.infradead.org
X-Gm-Message-State: AOJu0YyXpkYyns33zoofwdOiv4lA4dWSmRXrK3Htousvimm4R0yQQcK1
	M7RS8xwAddQUCdTHJO5LqlW005BgkxcERqWqj5SNfoHYz2hZ2YLMja0yu6FgU4U=
X-Gm-Gg: ASbGncsKeNYUfK7GxfUPQkBzQLAnzCN8ThPuyqfayr1N2HR1noDZbcoXXAEdMzgQ73A
	aA6aDY59yU2zanCo7b9VJwtsIPffRH0L2rzvzQapJ7dCq7LeJouXqARY+yhdu75tEHQrB3Z/9Jm
	8kPAniWHNU0kPriGCyXwWvVIv3JU/8W9+UDUT+/R25OA8mHdnNJMMIaeqAzu16kTt/QvFmTR8OO
	J/GleLH6Ifg5u+u7xxKE4K4XdLDbmIiRrRRQx6eTNRT1CEhQV+Ke860vA==
X-Google-Smtp-Source: AGHT+IHr7e6eqX9Z0gQvURdKQ1bdtAFQTJZejUyHCz6bKeZj+mC0/lLghPW0EOJgTJMIplS8zy4hNg==
X-Received: by 2002:a05:6512:32c1:b0:53d:a68f:d901 with SMTP id 2adb3069b0e04-53df00d1b06mr7609554e87.15.1732931560699;
        Fri, 29 Nov 2024 17:52:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:52:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:27 +0200
Subject: [PATCH v5 02/10] drm/tests: hdmi: rename connector creation
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-2-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=v8BoSRVhNVLNIqn0L1HvmQQ2nfTsZdUMUqZ1imeVKuY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fLC3qTV5FPAg0koUKF7mCCVp4yjgnKY2Ob
 7XbeEcO7OuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1W8+B/wK+y74BQCSvsvXrO6Z3w7xSSgmnVQ99HIWNd93CVXPYrCnNdWqf/FAeZisVnWQRjmqeyV
 L0N+uCP5Wt1zYJyCnIFQC4R5WgF8vMQ8v39fsp9Ab3f03lvV/5/BpvWcBC6FQdGTBx6ObXov7xp
 VOVE5CIYcE5LxJWlebKEE2e5J0cZTNEH9IyhHjYq8gERQmh2oAKbBBWHs7HpDuSZta1oid9nUZi
 cdWlFnP4EajV5XBJ6VleF4Ideqv6+Vg/KH7ZUCelcHS5hnxwnbxlw9r1GOLUIc+Gzuk/BCs+E0Y
 uh9d/yk0xHTcrLsNtUfZ36YteFQsA33xM6D/deRqQpwMun9D
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_175242_651199_45FC4B25 
X-CRM114-Status: GOOD (  12.48  )
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

As pointed out by Maxime, the drm_atomic_helper_connector_hdmi_init()
isn't a good name for a function inside KUnit tests. Rename it to
drm_kunit_helper_connector_hdmi_init().

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 202 ++++++++++-----------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 1e77689af6549f162eb3026c7bd2bbd59516ed98..60b1e37522837ee183c65413e3ba6c6ec4fed341 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -164,9 +164,9 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test,
-				      unsigned int formats,
-				      unsigned int max_bpc)
+drm_kunit_helper_connector_hdmi_init(struct kunit *test,
+				     unsigned int formats,
+				     unsigned int max_bpc)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -247,9 +247,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -310,9 +310,9 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -373,9 +373,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -429,9 +429,9 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -485,9 +485,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -543,9 +543,9 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -601,9 +601,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -659,9 +659,9 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -719,9 +719,9 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -793,9 +793,9 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -862,11 +862,11 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -911,9 +911,9 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -958,9 +958,9 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1005,9 +1005,9 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1056,9 +1056,9 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
@@ -1112,9 +1112,9 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1179,11 +1179,11 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1242,11 +1242,11 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	drm = &priv->drm;
@@ -1305,9 +1305,9 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1370,11 +1370,11 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1438,9 +1438,9 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1496,11 +1496,11 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1593,9 +1593,9 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1615,9 +1615,9 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1639,9 +1639,9 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     10);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1663,9 +1663,9 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1685,11 +1685,11 @@ static void drm_test_check_format_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     8);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;
@@ -1707,11 +1707,11 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
-						     BIT(HDMI_COLORSPACE_RGB) |
-						     BIT(HDMI_COLORSPACE_YUV422) |
-						     BIT(HDMI_COLORSPACE_YUV444),
-						     12);
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB) |
+						    BIT(HDMI_COLORSPACE_YUV422) |
+						    BIT(HDMI_COLORSPACE_YUV444),
+						    12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
 	conn = &priv->connector;

-- 
2.39.5


