Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BEDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 02:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=; b=urMVARkgIGtvaSkmnci1jWLtGc
	ZtyHqEovHl6f2QPuSLV6oEujpcHMAd6QPWXw/5IthvrBTONiMYBXxhBjzJrzeUSYZh2yDRDjI5CEa
	evqKMw+QxlWMaK9ZsI36GdsYEdEQOgHqLjZso3pYPKzkKfE1sPuSR8DmHAsslqMyMQ3YBMDjbLnNp
	is6tm0tbpXWWdLskJIL51RSBP3eyghIoQVBZ6MZBLxYhv4IIhmcGcdn8cEjvHHgDCmEKsm11wFb6c
	9xdNu0DIm9jyQ1Rfa2zp2p5oLXaKtLATJeNm/uhHqUoGCPMxWveFPea55jqb5dunzV+QJNAI620PN
	ScDC/YUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPuDy-0000000B3ZP-3SvH;
	Tue, 24 Dec 2024 02:00:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu1z-0000000B1XJ-1xX8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:48:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so5219331e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004898; x=1735609698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=;
        b=aig4S1td2wHBvJhpyJ/zKEa3SKFbAVgcTjHX7tmMzNt3TPd80NxU1Qlj/aiw/ku277
         4cJx7t+M4MInAahlGnDc8FKnc/MfQQ2/pCxtvVheT0pCt9m48QoitxfWLX+PwokFuP2M
         hXSgQD4Zg0OXWxu7trdqoPek79od00AIxMaPNbwGmEkzi8HaNKx2Fi9InVIvEnsbyLjj
         NNrvfANzVEDqvkF8B63n8ZFCgKkBO0UkUx4FcOintnnlzCPY+Sig11N7uqcKuOpvkoD8
         d7LFvSiWtf75BDap4tbEfoC0TKW+n0jTgihSu0q+LE7SH/tchQj0ZRQ0OxV5swhD1oxK
         MZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004898; x=1735609698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nB23mOz5XEcaTKeAQs8DsK3CUkW4s4+le/27BZ2Xdw=;
        b=Ogvu1DMF0gXw5cTkYDPwADXUafCqC2BznvX6AhgtkFieFivgOn8LNLUKm9Kj9vto6g
         4bneD14mgaJVlR+R1g/PEEotLmJ0I3J1pvI4trNCICRsUgoaLdRTE04s7qrEGLh7C60p
         X5uFWVflEEYOTkyTz6W1RSU2TNNEIOSt8FP5eitB+0oaL6lN5eRyUBKBOQvl6XyKLGuf
         NKGRE9x0fPBvNnyHcyfUVvdZI1UEqJRi/obSsht2VaGLolflEjPddUkRYVGJaQFNjkB6
         r8xN4O+sh3yYG088bXHZ7GSe8lyu0IbvBmEvxhr82HUnOAkk7+tqPmgaKQ/i8rx8eJ8E
         KyDg==
X-Forwarded-Encrypted: i=1; AJvYcCVdD5OjGRRDTwGw6UCTi0xwvUn0A1YZznYK5FlrJ/uI+hiVXDTDMRCTig2Gd2eMFgMScrS9NL0oFyhu4FiLXkpn@lists.infradead.org
X-Gm-Message-State: AOJu0YwHHPUJl3fYyCgI34o2/Ve8QXl5Cro6lwL45GceuhV9t4foc5hI
	w5R5vwEWr2oT6sa4tH2u6O9WkQld7lYQ14j16FkjfueJuWEk0sMRFdZcpVE2Ebg=
X-Gm-Gg: ASbGnct3P4rw2H0VuxZ82zPKfpYj//mVKs9JW63ts4VPPiqrORd9aUVX8/cR4uKXgyf
	tVxl0kxt3e1k5+Frg4iKPuP6yyjRT1VT/mJbxaB3JpxYKQTd8E6e8rig7+oAj+EsMpNiU6RhKYR
	wOVihi6sPfqDsFdiFYUwbl1eSCzzgspsfqqqo3mTCwa6pwaB4Tpn2kIaWzl2GqbWPIBCyDpYGr4
	JJ3jaJFHGMetCb3LvCliTQod473WfDLRc5gEztzGAJhEv3FwE3pzarrOqnEzrGl
X-Google-Smtp-Source: AGHT+IGPqkn30jxniIP++g3DHBL/bjgtZ0I3v3hoP6RoKeGURCaPTg5NoNi6aq19h5jln67MzBZcug==
X-Received: by 2002:a05:6512:683:b0:542:2f0f:66d9 with SMTP id 2adb3069b0e04-5422f0f69d8mr3459595e87.16.1735004897679;
        Mon, 23 Dec 2024 17:48:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:59 +0200
Subject: [PATCH v10 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-7-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
 bh=hK86h8tSIYG4gNCwBsALiUu4fy8l5FoieDOZ0a2t+ng=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNlKk1pyY18Usd0pAsYgRQhoxcr7VaL4Ngy
 mqv7/G60TqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1UzgB/wLQTAl/PBvsBI087pXZoO4Xtg0wcjMMQ32OkBKFjWYFinkJTEVHSPdZ8RJl1HOBQiKBqP
 C0EP7jbuqRBtzkhax4sAkGMsZF5OmcJwMgvPlt0nGAWOtoH0jAJiVPDcR3Fs/D/MyZ4fS9ZZTWL
 GfzbiAIF39GTPL8myW0yoY4YIL+N6llV0uZ0yYejHvwFUV6D6/B4CFN9yLdUFOH4xpWo5YaZMcL
 Pk1jZXYaE09n/bNPxO+CkLslE4AlzgvszVNANChOpIwinIWkIAghEIGEZXGoa0XHdTd3anUV7kQ
 5DfNw5Xi4L8P8aAF97ZE4DEcrniGkLQU1O61s1IoP3YHcCUn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174819_512251_7DB54917 
X-CRM114-Status: GOOD (  17.05  )
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
index 3f18495c30a4a7fcdaf93b161cf1d30020788772..c4a1476c8bffb86b34e86bb9051194bcd912ae1f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
@@ -181,11 +182,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
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
@@ -204,6 +209,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
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
@@ -232,6 +247,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -277,6 +293,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
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
@@ -369,10 +393,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
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


