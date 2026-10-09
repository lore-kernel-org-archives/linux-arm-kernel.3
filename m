Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FF3CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oW2AWBx47jdQ8MzKVWvVd3xWz1Lv6T7qQsd/pu1s3SQ=; b=YZah9OPnxdjZbdAPPuqUuIXngm
	iQ9ToFfgnQFUjzAG7d/rnd5v3W/4R7P3N0w0Rx9NKV0IAvXShbnMhSrUDQBS1XKZc/mmirdQ+vfg8
	/HtH7K3bwATaJBhqenoGC2m2QfS0fZd6g9R4QQynC/QrFbg4Ltorp0/DmFY5joY0Bk5Sxi9vQR45n
	YpsTUPwYUtGd9JVTp/KS12OknX5qnqG6SDr8ZOWU36Y+VN+ngkD+fwVxZHvUZd30qldGqRb2LhG9M
	A7YfO2wGGyYBnIg55mH7Ayn38cvXpXlGSacC6QswOxZ+oo5ph953lEfo68QC80heAZnMTTZirADk2
	U9Rg4pMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF186-00000005KUS-1aMP;
	Fri, 09 Oct 2026 03:18:44 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF182-00000005KIM-3tFV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:18:40 +0000
X-QQ-mid: zesmtpip2t1791515830tbb33f0fc
X-QQ-Originating-IP: 1yXzRkYE3qH1UuMYru7LuPsRRvS2YXzC1KUR3SgFG/c=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8012898157940025237
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:15:54 +0800
Subject: [PATCH v2 02/20] drm/connector: Drop early state allocation for
 max bpc registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736; i=sophon@radxa.com;
 h=from:subject:message-id; bh=o0Le8wc2L6kpMkxWzI0bIlS/W7PHaYO3TrOedahZL74=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlYsixe8Y+WokNMp4dagJs8aHzijp/e9a8eDPH/nC
 f/jfs7qKGVhEONikBVTZFGIZ5jLXpl77alYqR7MHFYmkCEMXJwCMBGBNYwME9ZoiBo0c2eWexr8
 m3V7RtAic+bb/Ft+zxTa8Ukk4lnWNob/JdLs53RXbvD1tun/Er28fk0jY7jhpoRN2zfd23XCaeY
 RHgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mp6z4bZjgTST21K9mNwCUWzMmvaW7IFWi+tiMqN3tTLk2klL6jDc5gLB
	2RX1kHYJ7QKNYWmArJYszlt+tSVHXB3fkzQIRRGdTNlH0CVvtz7Cm2gG1az/27qN55O8ORe
	DIdpgK8BHTWFTf6zgfQ3DBPD3xub8DWDgA+F1VJFsViRAL5ws2ewJJgdI3SH56gHrOcspxK
	MFZmqQlUB6f9x6Tthu2ohSAzs376UW4WOIj3Bcfn9SNjZR+XPIygZaqQNY453eEZ/iSwcEr
	Mjhqnohp3Z0uwY8DB4MDmhWAiQbEREOdytcmw2FP4JTSXv16IDj3O3bD9H3OMd9CgagVHeS
	9dNW+5jlqeFiOxHleNz35TyJeg1M1q08hsZ/xAKeEb+fgmmQsqfsal93PBULYIk0517N1cW
	bGshRTayldje4Bigpg8ZHPi4dzJb8JsClkLwKyPXX/2APg1AAWq4hC5fsMtIWee6JJ2aLAC
	NSMi/BlBUwKgmLWkqWchvVoILa2zOp+m7SwgnHi/RU8PNsvm4ZMcn3iRfu4ECKOFPsTDmOc
	D1BVpGIK/0bZFdD2y6s7AwPaCi/QtVGNbDtD1ubb/QfUeK6U5znWR3RkEzF8vlwLouRUlgN
	RDUZqlIdQy48TzWfm42CJRFw8MqCSxL4HLXVi0ArY3borddx/E7job2ZbbXMZ+eQtUtM9wS
	CSNTefFf/ylK3JuzLOKjC4vlIqIKQSLcpBM8EpC2TccITWUrTLefcGbCRdIOgnD0n2EUMxs
	05H5O+i5Z/9ZfCAi8tUv0QmhrUMszZDKwDxKeam5FQU0Fe2+H9gdGh/DPyrC5VXkRfINApi
	kUXarDpLwmvtBXuytKCyz1nTcZSO33oc3+gl/2IRVnx6pA8fgnQ2yNUfqBEfhs/+dSBetYi
	ZBdgm8O7Yw+KwZnM10rkgnLQjWNnovK5zzVL4VDXb/fmgCgmYs70XbEcLZ8CHqXmu7SuhQK
	374RYALhPp5VQQg4+q6bRSvCV3Wm9kAbkROV7ticWqP9lFzPki05R89LrsuT8nff/ySdjGd
	uSt/l/EDmLRdbuzqlE+r+Klw1zmQYj/3pKRnykPA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201839_319390_F9117826 
X-CRM114-Status: GOOD (  12.19  )
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

The max bpc property can now be attached before connector state exists,
and the atomic state helper restores its default when creating state.
Remove the early state allocation that was only needed to satisfy the
old property attachment requirement in the HDMI connector helper, Meson
and DW HDMI.

Update the HDMI connector tests to check bit-depth defaults after the
normal mode configuration reset, and check that property registration
itself no longer allocates state.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  |  6 ------
 drivers/gpu/drm/drm_connector.c            | 16 ----------------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  6 ------
 drivers/gpu/drm/tests/drm_connector_test.c |  9 +++++++++
 4 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 34c5f583e910..a061a3a23ee5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2601,12 +2601,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
 
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	drm_atomic_helper_connector_reset(connector);
-
 	drm_connector_attach_max_bpc_property(connector, 8, 16);
 
 	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 34c30469f405..2e0dbc58c13b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -614,22 +614,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	strtomem_pad(connector->hdmi.vendor, vendor, 0);
 	strtomem_pad(connector->hdmi.product, product, 0);
 
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	if (connector->funcs->atomic_create_state) {
-		struct drm_connector_state *state;
-
-		state = connector->funcs->atomic_create_state(connector);
-		if (IS_ERR(state))
-			return PTR_ERR(state);
-
-		connector->state = state;
-	} else if (connector->funcs->reset) {
-		connector->funcs->reset(connector);
-	}
-
 	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
 	connector->max_bpc = max_bpc;
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0c7a72cb514a..3bfb4f8bec2c 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -439,12 +439,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	 * encoder->[hdmi encoder bridge]->[dw-hdmi bridge]->[display connector bridge]->[display connector]
 	 */
 
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	drm_atomic_helper_connector_reset(meson_encoder_hdmi->connector);
-
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
 	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
 	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 1174607441b9..af5dda3701cf 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -1036,7 +1036,10 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val, 8);
 
+	KUNIT_EXPECT_NULL(test, connector->state);
+	drm_mode_config_reset(&priv->drm);
 	state = connector->state;
+	KUNIT_ASSERT_NOT_NULL(test, state);
 	KUNIT_EXPECT_EQ(test, state->max_bpc, 8);
 	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 8);
 
@@ -1077,7 +1080,10 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val, 10);
 
+	KUNIT_EXPECT_NULL(test, connector->state);
+	drm_mode_config_reset(&priv->drm);
 	state = connector->state;
+	KUNIT_ASSERT_NOT_NULL(test, state);
 	KUNIT_EXPECT_EQ(test, state->max_bpc, 10);
 	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 10);
 
@@ -1118,7 +1124,10 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val, 12);
 
+	KUNIT_EXPECT_NULL(test, connector->state);
+	drm_mode_config_reset(&priv->drm);
 	state = connector->state;
+	KUNIT_ASSERT_NOT_NULL(test, state);
 	KUNIT_EXPECT_EQ(test, state->max_bpc, 12);
 	KUNIT_EXPECT_EQ(test, state->max_requested_bpc, 12);
 

-- 
2.56.0


