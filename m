Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66762CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaRojExYl7oDQMVosyTzIB3HUYTJPqu2bnKuYOk2cdo=; b=NBBJcVSmGKf/dhS9EUDyvA/osg
	katRP15rfq1stCFZKlDNo/f9m4M7uFHBM5KcL41NQVnyf2pDwguvBIY2Nh5n/kzBYfqp9U158T+0/
	5my8balFdx8kmBhKTpQ/ukPE/28gUW9GZXiL2R0GJ5nRm5ERLUP99EfLiUuGN08lh9IN9cHL3bgsa
	ZxjYTDgkq1IuhsDgZeTzuGoIvewmiVdLnE/71mfBXL8geW9xlz9GrHwrX/5D59QVsNsqpD8Qphz07
	KhLFgltfmU+6rLU5p+Sk/FnP3/abtc0CCUQnDI2xz7CHleYocvea1ivEuWCnrgpZ/ueGRtYPavHYd
	b6LeQ/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18O-00000005Khf-0rGz;
	Fri, 09 Oct 2026 03:19:00 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18I-00000005KNk-0lVw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:18:59 +0000
X-QQ-mid: zesmtpip2t1791515850tc30037a9
X-QQ-Originating-IP: aSGd6OVV+xf3PiTsG/D4LwATaC3JbU9u/HkEDXPIHtY=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9398557567907882420
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:59 +0800
Subject: [PATCH v2 07/20] drm/msm/dp: Serialize stream operations with HPD
 processing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4913; i=sophon@radxa.com;
 h=from:subject:message-id; bh=y0Qxe6uEfYyWn21dpm7+XJNy2fWN1WyeLFfBAJmoLMI=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZWMF5+vqL/zuyM03XtTtOrtp9YIOhhuzd4q+Wze
 F7m958MOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEyko4Phr2jC5hMBzt56KSKe
 oauZThxVyWG8V7PdwDjcN1HrLoPzL4b/ETN5Cov0tgu5iW4+e9lup72H4dQpFq69qawBds++/Nj
 NAQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Ne1qJH8n09EwSUqBbSvhlaploINu90D9cIePlnT2+BEzn1Y8HgqfX430
	zgqBzrnDq83Y1zVXhWyGpiyu7Jknzwy7TedwyApbvJZPBhdfgMOTkPwGuUOYcUsYdryW0Oa
	m5zHc9kmroX6H0TdLgxofY0NmrznioBSY/pUTBrAKSrZgxEnrscbkqidX4itFBAID6k+eTY
	OY92oCxjh+7jJ2JQ/nelXTsefmh+ep3+4SAefOg2LmZlK89DdU2KdtrpeU74m86+JlG24jE
	8nt27RecIwgWfdGAIQ74IWrhUccb8rYaMhHB7q333l9tM/oUShjwpOVJW2BXNJAOvRPdK75
	iDk3mLthjTxGmh+R81A9tYz/AJhP5ntbcoY6CWmlDDDlfc+bPB1dimgtZagfFQSiKHX1pZz
	Syg+dQpPGxelyOIAzaSLW/Wa2QtfC7PqdgkiEexDRB2f2qZFGRPZk7uGtSE9pBHk9pWpUva
	P/nXBTEV1/JqE7Vaix8E9wyXPOA8iVjmjVEqTfkhCxxlRelJJRDRsDydkEa/LrWibdRmn20
	O/e2RyUxin2G1mmcz4DlkE1antgSEjFjRPoB9dPehUNWkDhCZuCtdZX6Y7Lu5iP2l997RYA
	1IdiYOL/IjQtxtzEOmRH/2L0+CMSNjNhzmGoOVMAw+W6mOw1B3cOLPtzrodXFkHUwHk1aZM
	2mcK96x9BXLxtsq4IsLd4MLS59en6sMh/s1uOEWC9AegvobnZ4tPN/7y6iGd1sPQsTWv9in
	urY6NcNHNcGYaS9ysor3c2wwi8CYD7uqhvxnnQT1fp/XEo0Pc5DRvtd1m9w4JZKJOHNvPRG
	+CGKq5Zrk0hT8vUbUMs5ObKStS4Sgk7qwkz2znFiffwRjGDrDNV2mB4WGS9RMXEwHEYNk2M
	M+M63N6VYIH/GJFmjADH4J/Wdm0zZk/oivDi8/ZqJeTc8sBV5Ge2rZZZ4kUXwtPfqE/Bi4k
	yAzsR7dLukGBWVbXGTemKJy6rP8Kn2SWG+JW96Wsg+s1aJdDa74xNXR1vqFGoj1gUdyLgaX
	G4hbRLExG0x12/Ijdrmj3Mr7VwvxLsyAZqAewcySBBoADjew5Qzcc9cYH6BuU=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201854_691147_6A662F05 
X-CRM114-Status: GOOD (  15.97  )
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

HPD PHY test requests stop and restart the mainlink under plugged_lock,
but atomic stream enable and disable do not take that lock. Both paths
can check a resource flag before either updates it and acquire duplicate
clock or PHY references. They can also reset a link while the other path
is training it or enabling video.

Hold plugged_lock across link preparation, stream enable and post-enable,
and protect stream disable and PSR transitions with the same lock. Add
lock assertions to the internal stream helpers. Acquire the runtime PM
reference and handle the eDP plug event before entering the critical
section, and leave audio shutdown waits and runtime PM release outside.

This provides the serialization required by PHY ownership tracking and
the subsequent stream enable rollback paths.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 32a2ac89d8ed..787efbcb6c12 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -53,6 +53,7 @@ struct msm_dp_display_private {
 	bool phy_initialized;
 	bool audio_supported;
 
+	/* Serializes HPD, stream and PSR operations while runtime active. */
 	struct mutex plugged_lock;
 	bool plugged;
 
@@ -623,13 +624,10 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-	int rc = 0;
-	bool force_link_train = false;
-
-	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+	int rc;
 
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
@@ -640,6 +638,19 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
+	return 0;
+}
+
+static int msm_dp_display_prepare_link_locked(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	int rc = 0;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+
+	lockdep_assert_held(&dp->plugged_lock);
+
 	if (dp->link->sink_count == 0)
 		return -ENOTCONN;
 
@@ -664,6 +675,8 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	lockdep_assert_held(&dp->plugged_lock);
+
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 	if (msm_dp_display->power_on) {
 		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
@@ -684,6 +697,8 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	lockdep_assert_held(&dp->plugged_lock);
+
 	rate = dp->link->link_params.rate;
 
 	if (dp->audio_supported) {
@@ -721,6 +736,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	lockdep_assert_held(&dp->plugged_lock);
+
 	if (!msm_dp_display->power_on)
 		return 0;
 
@@ -880,6 +897,8 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	}
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+	guard(mutex)(&dp->plugged_lock);
+
 	msm_dp_ctrl_set_psr(dp->ctrl, dp->panel, enter);
 }
 
@@ -1449,7 +1468,13 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_prepare_link(dp);
+	rc = msm_dp_display_prepare(dp);
+	if (rc)
+		return;
+
+	guard(mutex)(&dp->plugged_lock);
+
+	rc = msm_dp_display_prepare_link_locked(dp);
 	if (rc) {
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		return;
@@ -1474,6 +1499,8 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
 	/*
 	 * If .atomic_enable() bailed out - link training failure is the common
 	 * case - the mainlink was never brought up and ->power_on stayed false.
@@ -1511,7 +1538,8 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
+	scoped_guard(mutex, &msm_dp_display->plugged_lock)
+		msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.56.0


