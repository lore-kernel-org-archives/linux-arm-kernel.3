Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740C0E65D17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoL3aWMtjL9qLbqtGe43c2BpbewS4aE5M6KHnAUYZyA=; b=glT82KmAgmpu0pXDhHVRjZred2
	mlu+DSG83xVHtEVYXkJaI+ZVL6WAPx2/jZYwcxV+QbHBJulQt9t+i+o7JG2UW5ClSiIsvXISN0LxO
	tRAK2xT9iwjnLt+VGN4v3uMwP+lJ2MaOav5pIX6L7Zh0lus+IR4+8u4xjg0Qg4P94eGHXLcJjcbiZ
	q1WRKJ6SXVqbaVKbPIbLQPsypnlPP9HUitpnAwJaliJo+5Ls6YsJUYr0AhH1AOE/gVfItpWM2I5GI
	MlGvOrZPiNOHYHulJRdGemwjp5JOsoyoeBpsKpIsh0tgqmjxa2TXBA8zwccgwukyLGznmCu8ncSxk
	2fCHOIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPln-000000022tq-30vU;
	Fri, 22 Nov 2024 09:16:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPj2-000000021e2-125k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539ee1acb86so2066031e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266794; x=1732871594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoL3aWMtjL9qLbqtGe43c2BpbewS4aE5M6KHnAUYZyA=;
        b=OLoAAerMdiz5NvE6KpbJN2AlPBRtiGemEzpynNypCMVYtDCpxOdFg1wspvqD02J4ak
         SsYbSqqLrSL12Nam+BStq7dcyl/pp1N+JN9OPerrkxZfNyzrS2k4D4hiC+LFSb+xDZE1
         Y6XnBQDV18WzA8Bq/YZoHsNjvJOC4CidJmsZgs3ecKcb8IPcMwfAXEPb8hq/iN77HaaJ
         xpOQkJ1TDjmEJhWO5E+SEOSk3dbFI6JlsgcFhh/v2CvV36YLI1hW/LTrqwKubvln5cCL
         bqlexpT2MsEVI2jFDiD0I8yWxolpiVTnabW4C4G3PBVyr6TGthgm5If5TZ4bUb49+TEf
         i1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266794; x=1732871594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoL3aWMtjL9qLbqtGe43c2BpbewS4aE5M6KHnAUYZyA=;
        b=udyEeGu3CPqU5VEIHXGofKbrvy/c6aiPfymWLRtxTkt8tfdmfRRwGGp3xEoBm741DA
         3aHW1p39dCWkSzKsvbHUWhdwmyxqDNrsAAygOApom7zgPiisy0QxqM+qUgYookabUhNd
         +lEjZgm4n8zlpwhUNnpZlf/33M9U+QKM9aci3E8TTilXrIpeSusy6WgF32BS6WPRgrJk
         zuEP/tXaB8BXgkY3aZl1Wyg+HxyCGF9Jkuz2LjXQJnFu7Bqn+NW3wqxa6QD0toHwnLyT
         sH9tr0djPfZaRJkNrM/UbUxQcbe4kACrRPS9VklAhs8NZ33+cx965boMmwtu1WcLEElf
         U24A==
X-Forwarded-Encrypted: i=1; AJvYcCXXiAs3mMLkizE10qI2XV7MTyYEwMQHxKTcEtz6mS0rCCOTevJ6X/ZvwmHSvsrLgo76yIZl2SWE6/wlPDgAUXk0@lists.infradead.org
X-Gm-Message-State: AOJu0YyqhMMDMagLcmQYJ5PXfaMljr9nIU1JnKM+2sjgIZ/rjLEcN90e
	ljJG03scrgYr+tbozPLSXhhDOIpLzS/2lE4J/f4xT5Tc9vkrmx0hj6Yr3tQWwUs=
X-Gm-Gg: ASbGncvx58SSruORmcg45rCBtG0+x3eDJr+Ijk7dNCze6mQ1LT7impf/Fe6RBtp0sdp
	aJp8nNVq4ONmUO39yYItOA2uA2dMrcBOmac8MlLHGPbFSFadPv+AeUR7kOMheyhd0cniAPdnddN
	LxvnQWg8rElqHrQ2L5v/H3GhvlsOdUv553sLe2KI/bHXRevZwZAx6nui3EjG9IqWpXLUxZezjZt
	lO2pWThupg3H9LGoBa7E8fgFPAwOmBNuTVft+UDZKgQSG8jTxCeUZvFnw==
X-Google-Smtp-Source: AGHT+IGsVNjOq27k776zE/cKgwN70tM6uYhT0eEceng2yr5gRWog07KJFnzoL9IEms+6bvRWR289/w==
X-Received: by 2002:a05:6512:b8a:b0:53d:d2d0:7c8f with SMTP id 2adb3069b0e04-53dd389d8c5mr910882e87.34.1732266794264;
        Fri, 22 Nov 2024 01:13:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:58 +0200
Subject: [PATCH v4 02/10] drm/tests: hdmi: rename connector creation
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-2-2fee4a83ab79@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11003;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=g90UV4snbYK1PCsg8Vi4l6YeLj+54jyCttfyA/beoL8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshr58WmNMo81MG4tiQNHQeSCPOdq5T4NQZ4
 z8ZTDVJEraJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1fMGB/9ZOhAOQVgQ06z4Dsew8aMKvh7Gsx2b8vApxlPuSYhFhnespRjpeyhSCxW5AAYYPlS87N3
 OpezjjaXuXIKqiV1jqN8LW1Mdu4T94LRA30YeLbaImenTe4zJULUTIPgSb0YhDqlBtKMplZ+ztr
 xZa14xzq/fyMB1B0/kW6cpcS8Aija2dpwz7SD2cUXZ+WnR2224RqWvRC5r+3Yh3JTatsclMYRqT
 zFyZjeJDH8l2dK/pK7ipe0HJbkZdttc3WuNvlFBXzitXJaNC1t8gP7mfTF4ENXVC6Tna2YUX3un
 gPH6KVG+TF4XJf8zdGy9/ks9y9P+2SD6uG+UcQHbET/Akc4+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011316_304073_47E1F7F4 
X-CRM114-Status: GOOD (  11.81  )
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 58 +++++++++++-----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 1e77689af6549f162eb3026c7bd2bbd59516ed98..d81254d46975e8af0d782249928217a1ebb7646e 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -164,7 +164,7 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_atomic_helper_connector_hdmi_init(struct kunit *test,
+drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 				      unsigned int formats,
 				      unsigned int max_bpc)
 {
@@ -247,7 +247,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -310,7 +310,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -373,7 +373,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -429,7 +429,7 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -485,7 +485,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -543,7 +543,7 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -601,7 +601,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -659,7 +659,7 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -719,7 +719,7 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -793,7 +793,7 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -862,7 +862,7 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -911,7 +911,7 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -958,7 +958,7 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1005,7 +1005,7 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1056,7 +1056,7 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1112,7 +1112,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1179,7 +1179,7 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1242,7 +1242,7 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1305,7 +1305,7 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1370,7 +1370,7 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1438,7 +1438,7 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1496,7 +1496,7 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	struct drm_crtc *crtc;
 	int ret;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1593,7 +1593,7 @@ static void drm_test_check_broadcast_rgb_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1615,7 +1615,7 @@ static void drm_test_check_bpc_8_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     8);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1639,7 +1639,7 @@ static void drm_test_check_bpc_10_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1663,7 +1663,7 @@ static void drm_test_check_bpc_12_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB),
 						     12);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
@@ -1685,7 +1685,7 @@ static void drm_test_check_format_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),
@@ -1707,7 +1707,7 @@ static void drm_test_check_tmds_char_value(struct kunit *test)
 	struct drm_connector_state *conn_state;
 	struct drm_connector *conn;
 
-	priv = drm_atomic_helper_connector_hdmi_init(test,
+	priv = drm_kunit_helper_connector_hdmi_init(test,
 						     BIT(HDMI_COLORSPACE_RGB) |
 						     BIT(HDMI_COLORSPACE_YUV422) |
 						     BIT(HDMI_COLORSPACE_YUV444),

-- 
2.39.5


