Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5CDC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GLXAlHPQKg36S1NM9ptjaDgtqucX8weeRbpw8WSXIo=; b=N3WcmBUetxmCGarLUb+qDcgtdL
	FOg/3F4aQ+rVOzbBSEqTJKakHzc69m6gCAo0VVyUQQSZJYpCp5XmQ6ZZehWFdteTj84RZaTBkVw40
	Dq+Jycg9u9IACiEcmAle1zkg06tP/RxOadhBjRANTU/fSBuJx8nvQ4l/60uF2Jce8lOwaatwIuV5H
	LpENDad8/cL9JBmaoz8ZPHHwEDPRRIq+oepF7TsR8fuTFgdiKEfCRt8lRtiguT41IAaJledqZj/Xz
	+aZyBzTYtqwyag8BuvUfAgposEbFHE4fBVxcVTPvOV8eWmqL/I4k7NmhZX8tVzXid2p5uuleLnm6l
	2DkIQtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLY-0000000D3MD-2Kup;
	Thu, 23 Jul 2026 01:35:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiL6-0000000D2pL-0zoW;
	Thu, 23 Jul 2026 01:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770504;
	bh=vhA+wgy4cYZ5g4cAf6ZAHYJ14on6Zt8ECV1YL2IdAPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XwDF7zU5a088wxjhgXD9lhMp0Cv3qda5y8Gm5dlS2pLvXX+G10SFaTWsC0/k2n5O3
	 lNyRhSTgdjqIY6s1uyOV+QnSORHtBpfr32gNDoKwLHN1bEjYfwGVvPSa5b8dlu3z4y
	 JkeHs86EGfWhKXb/GcVa8bSwE0oGCmDPXdRU8+D9v0W8/b6edTEd98VuNiR4foHo3e
	 RxZWk0bBr/xzkzBchcQvzTqFc2LXgql5DV1kRw5bQwt2nMa/q6yXAvDSvCfx5qYWQU
	 XCP20xxBmnP/m18KOwDFv3xYbSq4sGQuAs7MEf0lzV444VEPAQB62Yxymy6OYOcSW4
	 vu19QsxMwQavA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE17D17E1313;
	Thu, 23 Jul 2026 03:35:04 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:34:53 +0300
Subject: [PATCH v9 04/61] drm/display: bridge_connector: Convert to
 drmm_connector_hdmi_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-4-4fb12ea22ac9@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183508_479344_9CA7D696 
X-CRM114-Status: GOOD (  16.84  )
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

Switch drm_bridge_connector to the new drmm_connector_hdmi_init()
signature.  The vendor, product, supported_formats and max_bpc values
now live in struct drm_connector_hdmi_funcs instead of being passed as
separate arguments.  This allows future HDMI 2.x capabilities to be
plumbed without growing the function's argument list.

Introduce the supported_hdmi_ver field in struct drm_bridge to let
bridges declare the HDMI specification version they comply with,
as well as max_tmds_char_rate to allow them to override the limit
inferred from that version.  This is particularly useful when handling
chip variants with different capabilities.

Additionally, add a warning in drm_bridge_add() if an HDMI bridge leaves
supported_hdmi_ver unset.  This alerts bridge drivers setting the
DRM_BRIDGE_OP_HDMI flag that they must also declare their supported HDMI
version.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 43 ++++++++++++++++----------
 drivers/gpu/drm/drm_bridge.c                   |  6 +++-
 include/drm/drm_bridge.h                       | 14 +++++++++
 3 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f75ce47a6350..9ad31e9df0ab 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -590,6 +590,8 @@ drm_bridge_connector_read_edid(struct drm_connector *connector)
 }
 
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.read_edid = drm_bridge_connector_read_edid,
 	.avi = {
@@ -823,8 +825,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *panel_bridge __free(drm_bridge_put) = NULL;
-	unsigned int supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
-	unsigned int max_bpc = 8;
 	bool support_hdcp = false;
 	int connector_type;
 	int ret;
@@ -907,11 +907,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				return ERR_PTR(-EINVAL);
 
 			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
-
-			if (bridge->supported_formats)
-				supported_formats = bridge->supported_formats;
-			if (bridge->max_bpc)
-				max_bpc = bridge->max_bpc;
 		}
 
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
@@ -993,11 +988,31 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 
 	if (bridge_connector->bridge_hdmi) {
-		if (!connector->ycbcr_420_allowed)
-			supported_formats &= ~BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
-
 		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
 
+		bridge_connector->hdmi_funcs.vendor = bridge_connector->bridge_hdmi->vendor;
+		bridge_connector->hdmi_funcs.product = bridge_connector->bridge_hdmi->product;
+
+		if (bridge_connector->bridge_hdmi->supported_hdmi_ver)
+			bridge_connector->hdmi_funcs.supported_hdmi_ver =
+				bridge_connector->bridge_hdmi->supported_hdmi_ver;
+
+		if (bridge_connector->bridge_hdmi->supported_formats)
+			bridge_connector->hdmi_funcs.supported_formats =
+				bridge_connector->bridge_hdmi->supported_formats;
+
+		if (!connector->ycbcr_420_allowed)
+			bridge_connector->hdmi_funcs.supported_formats &=
+				~BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
+		if (bridge_connector->bridge_hdmi->max_tmds_char_rate)
+			bridge_connector->hdmi_funcs.supported_tmds_char_rate =
+				bridge_connector->bridge_hdmi->max_tmds_char_rate;
+
+		if (bridge_connector->bridge_hdmi->max_bpc)
+			bridge_connector->hdmi_funcs.max_bpc =
+				bridge_connector->bridge_hdmi->max_bpc;
+
 		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
 			bridge_connector->hdmi_funcs.audio =
 				drm_bridge_connector_hdmi_audio_infoframe;
@@ -1010,14 +1025,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->hdmi_funcs.spd =
 				drm_bridge_connector_hdmi_spd_infoframe;
 
-		ret = drmm_connector_hdmi_ini2(drm, connector,
-					       bridge_connector->bridge_hdmi->vendor,
-					       bridge_connector->bridge_hdmi->product,
+		ret = drmm_connector_hdmi_init(drm, connector,
 					       &drm_bridge_connector_funcs,
 					       &bridge_connector->hdmi_funcs,
-					       connector_type, ddc,
-					       supported_formats,
-					       max_bpc);
+					       connector_type, ddc);
 		if (ret)
 			return ERR_PTR(ret);
 	} else {
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 83f1809a5d37..afaae272347c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -460,9 +460,13 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	mutex_init(&bridge->hpd_state_mutex);
 	mutex_init(&bridge->hpd_mutex);
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
+		if (bridge->supported_hdmi_ver == HDMI_VERSION_UNKNOWN)
+			DRM_WARN("HDMI bridge misses supported HDMI version\n");
+
 		bridge->ycbcr_420_allowed = !!(bridge->supported_formats &
 					       BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420));
+	}
 
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3ac84ed57ab2..727eeb94119a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1081,6 +1081,12 @@ struct drm_bridge {
 	 */
 	const char *product;
 
+	/**
+	 * @supported_hdmi_ver: HDMI version the bridge is conformant with.
+	 * This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	enum hdmi_version supported_hdmi_ver;
+
 	/**
 	 * @supported_formats: Bitmask of @drm_output_color_format listing
 	 * supported output formats. This is only relevant if
@@ -1088,6 +1094,14 @@ struct drm_bridge {
 	 */
 	unsigned int supported_formats;
 
+	/**
+	 * @max_tmds_char_rate: Maximum TMDS character rate, in Hz, the HDMI
+	 * bridge supports. A value of 0 means the core should use the default
+	 * limit implied by @supported_hdmi_ver. This is only relevant if
+	 * @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned long long max_tmds_char_rate;
+
 	/**
 	 * @max_bpc: Maximum bits per char the HDMI bridge supports. Allowed
 	 * values are 8, 10 and 12. This is only relevant if

-- 
2.55.0


