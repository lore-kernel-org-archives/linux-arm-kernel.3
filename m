Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC454E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 03:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=; b=TfoIpjyPmAAMTl9SpSQD/pojaz
	zuwDd1kMzmDViNIqHVbiw/r7hU4DeZPRr6fihF3SkRWi0iffyiEX/zJ/7grL79dRau5NceQyxf0mb
	/8MRbSd9PHfIvNF90pVU1wQsIvzdoP3XMt6VhLGcNJ9RxAks6bX4jirPo3ZicgqLTwLuc5ZDDKF+2
	ICBRuCWGTa1szrile/sgqYurfzFqLJW2AfvWOx2Iqr03AwjwpUz6TkEFN0Nz9N9sUYqBwIDX9J6q/
	fj+qa2/u1Z58u0DzZ4GJ3pdnHm6GOGHFZIKwonCiaN8UmVlziSi1RRAnHUrOdCH9dnNpydUmG064b
	cK6934yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYoK-00000009EPb-3mFO;
	Mon, 23 Dec 2024 03:08:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYf8-00000009Bwe-2d1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53f22fd6832so4048285e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922757; x=1735527557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=J+f/1ro41Pp0wxcON+cxM3Z4WXjgIZDzfbGAhB8UZmSGPAbB2+oFZUi6M3qw7EEE8T
         czfACt+G1al2Z3wupRuytpvUwnPHQy2YD3thsjvfrgKah50+o33Cj04DT7vOK9UYcZvt
         5rzzVGGPQCIurvSoPtCoWo7aaL/41X4sjf9Q7IUc3nMDQAWY1MH0I7aqvnzjybV2d/WP
         kSy6wwgWa0YTRltRSDMWRB1DlDL310UR3EJiutOH6Z1c0s2aDeFFieEtmb7ZusmU3RI/
         sKfJdQa4pQQhrkEQGiHrj2QfYT49XL9GXIU4RDqZV5AyVvw8EHY1svIEMEezLovoU32r
         iUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922757; x=1735527557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=vpE250g2ucVK4osy5AYfsyx26Z2P1+FfORRA7VRzFaS6tnhtA4Gce+agiGHWrAH1/W
         WbmT/VHPAWtRv0h4ceHYhEU40z+GmZ1hL5WPxzL/RIvmC9/O9WDs1Y5L01oT4LlWMcsq
         gu2bxhTOYC/uv2FATPUlAklb3F+LEzQVpeUBHXHWD2J6oOvlZoR3dQiWHLrGcdHpVbZr
         detairNsYjvEe4FP96kOmULfEs0Q/5yuxJ5PqK6ycrc1rc6MZD5E5DHz6hcVZPUyndZP
         1B/eR6S0Xwa6w6hWyrIDsKFDeSi5ylb1hbAA5ubNPaUqVyR0j79p4V9ot2JvTaHT+8A6
         +6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSavMnuF35p0ThXQT/PD9JQc3EXWoH5gvqimPU/dCJA6sIQ+GozT4gP9fmSceH1cJt7zhLn2NQZPeogsAUeLDA@lists.infradead.org
X-Gm-Message-State: AOJu0Yym6rD/uClMRzn/6LNe0d8acpM0uwu+vIYWKNKjr/SLDPWaxzQr
	vO4qUW6WyazpJ2tSZSN9E5cSCrjUlDZOpuWE3vfZ86sgY1QPhNz82WtoLMvOFrU=
X-Gm-Gg: ASbGnct1F7iJn8fnmJ8/SXPC2/R44EZ9FGIc7buhJ2vVgvgMEKw+7PsY+lRLkwuOuiE
	/HLeeP5qL8g+RGCDUk9FJOVgPfs6Jz9WbvHIAIjzhjuoIRxy0ikmnFIzuobwNPyeK41Tn8DXQVy
	7XPLl/jt7e4gPbveBJ+UojuK/ozmWlEH5sMANpgyAL3XZhr3KGD3Dhprl64jgyg06xAJ7cCv9Qs
	Jk9OXCxNegtI2GBRUpE3Kb0nAnlDw/FBTsVgpGvwaUtngYGYHZro5D61q+EZ8EH
X-Google-Smtp-Source: AGHT+IEsAJNSOOaV9y+nIfiI5YFrovLlSSoOsQwRPv3DQ9rP0DXXCsbsdQs9e6lOh7MvObzo8vwB4A==
X-Received: by 2002:a05:6512:10cd:b0:542:2a20:e696 with SMTP id 2adb3069b0e04-5422a20e763mr3184995e87.12.1734922757058;
        Sun, 22 Dec 2024 18:59:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:58 +0200
Subject: [PATCH v9 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-7-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxc64kwoBabpycJjPJSrQzZBWx0rjDhWX0g
 hu7SI/TS3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1cRAB/0Y9MaFBTfXRl+OHwE9mEz9kBDl4uUf9S6zWWs5/Zspm3g4ocdNYQPOVPvzfLv3YzIz4yx
 07/Txug+JO/W7Gc8yBtcurFBnkP9QHxdv3R6RXY50q1W2f3vYxo13mVHjvUjRH8ARihdxR1sl3B
 Vi+VFMo928lRyBfodzdLdjEpD7Q5GAVwjtKAiA6kyt6UBaL0HagIRPmPPd/hz7LvUu79Detl5Rk
 6xGL1yl5xvss0d2T4mlB9aMCNSgKrF+9qFBRcUSYwyqwjq7t2bRd/Bqg2EkROAPFELoBK18uEEZ
 2mVg1jyCMy06rHFflzxviEd1a/5+MhQjaHaBrksBliJeH57c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185918_715995_DA00F2FF 
X-CRM114-Status: GOOD (  17.22  )
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index cc955ee008d843d73fedb891e97143a4168fd311..66e4ab81fa0c2717490193e896389757f0a903f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -180,11 +181,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -203,6 +208,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
+static void drm_bridge_connector_force(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		drm_atomic_helper_connector_hdmi_force(connector);
+}
+
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -231,6 +246,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -276,6 +292,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.
@@ -368,10 +392,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	return drm_bridge_edid_read(bridge, connector);
+}
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.read_edid = drm_bridge_connector_read_edid,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)

-- 
2.39.5


