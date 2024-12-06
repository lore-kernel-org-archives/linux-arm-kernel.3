Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CAAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=; b=st9uVFCkC6zVgarqOQGGz62WzE
	nd81oEdhxalH4H5anO1Uw9CDfde2rBD0ggDYKvlKHeYscJpORQIMApZq3O+Fw7L3J3Nrv8HtfK4XT
	qPfW2S1nOHVQTmoIYrGG24uRFWLQoIq4rtdd/Cg/4STFtHlB8vqK5sUvcdU3lXyNE62PUh48eept+
	jCClR1goVWpcYageZVm5iGYT6xEBmBbDahd3bvSt56eSEO0bC+hTfjp5VD/mPBr1l6jFFqwuQbF/m
	eAbSogwDLSWIcLK/NkG9RwL5o/1TKEULrG+5/W8WHeVyzBclWllG9MdrawLjeobIc8wRpWeJqIGS+
	UzNFQEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJViK-00000001KIm-27fg;
	Fri, 06 Dec 2024 10:37:36 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVON-00000001ENg-1pZ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:17:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53e22458fb5so1710051e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480217; x=1734085017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=;
        b=jKlH2QkLaaAlXKLldtZgDCtKyrZkC1mEY2mAewqqiwVj0lgpYB7TkGyMIufEKtX3Z6
         UgwwXaZ8+lnZXS4qccK1iMN3HQd8Zq9y8G3HGCIzmh2CSc47ha8cn192/75asZeWTd29
         s2bBpAk98oNZT3B79/6ZK3UfMwaqLsOhdBXcnHhpYJMWmXqLuqw1DfTtgVOUEY7BcKqG
         19kVwzSaxSitcQyAPeTiAXrsTUYnuusV6zkqW4n6AQWZ0wnT7DzD7MPlY5/KSetHor5b
         r5IT2fmffItvU88uYN4plhpxhdO7qdsGkjW6xIrViIaOb1PzYwSXSN4PFNvvrGqL5Nmp
         JS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480217; x=1734085017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=;
        b=HB0BbQCZLq2s3xEKFZSdnjxYtOLxmSgrwi+XZaqt0poDwTvzyrxnwFJnGPbIHhaNBX
         xymftJMHqWAfcCJ1e7rvzXYQBpO3QRhQFE5h5fPxEQSzK4iMxRgNn1vyWx1peUthBgvB
         5nWcP+/uHRzwDHMGMfIMNBuVDnjo+c177d2hexhyngUEH33ECWAEhtWaDqp+JxjiR78v
         OZ+QX7tVovOe14L+BWaC88RePoiXp9qGtD3anqc1eVQq9FWteZ+Ikg+NgyCcYW4svtj6
         r81n7N3kVxu4kF+AeYZnnQCnaKBF9tI+TpNVrkzS/+CcUQdGcbrq0BV/PXoy2Pj2s/Q1
         v+7A==
X-Forwarded-Encrypted: i=1; AJvYcCWLn89lJey63txr+BmbS3tKHGj1E1DOaCNF0/8PJnHsdIT1PoZsnyySlQEGvgxa0RySEaUNtQkoNMbadbgzBiws@lists.infradead.org
X-Gm-Message-State: AOJu0Yy82/F713Bk/UcbM+qHbmPI8zmVUod6yA0byztACfg9pnsnmhQd
	5/k4YE8dm98A9e4g1e0p7vwKk1SheWjRtWFQBBFaokq8jcG13JP6H3mq5TzJKhs=
X-Gm-Gg: ASbGncs+G56TboSa2rsi2cZsUdXbstB3Dp3FIFHJ2SFwdqhAS3kAh0jcHolW5GtV83m
	degJ8ip9guAQzxCOjc2QHe/ZWMBhTyvkFOZ5dff+uTdSF75gll/PhcaG8nAah8TXRR3z3CUbEXI
	UGjYwhqt/OI/xeoTXQXBOdVkT6oASFF8dNkqJ3oyfOuzPPL97I5XXe8Ah6j3IpSxesCSK8KSzgi
	a3vFpOwp+FK/5E3qSH3HUsRYo73ku/Xv31ESeo45JIfKZZVD7mo6ejH4g==
X-Google-Smtp-Source: AGHT+IHBBgF3TADMfzDewRh0RnUMlgyT5sj2IpwAyXtVR/5eduL7M8O2TXvbBzwVKqS3LKRU2nISMQ==
X-Received: by 2002:a05:6512:3b06:b0:53d:ef60:ca9d with SMTP id 2adb3069b0e04-53e2c2ededcmr746863e87.55.1733480217491;
        Fri, 06 Dec 2024 02:16:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:00 +0200
Subject: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4668;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cLr7rcMCKctpWvNtnt4BFuThw021W03l57sijxoziRQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8J3TYcPOcFa14DxHDG+xCfnhUgeaSE3pmsZ
 R3RuvxUPtiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCQAKCRCLPIo+Aiko
 1bY7B/4+CK2IPr0ZGyjRDhrjaTsOqjmocrfgRtyl3xVEfwHzU9LuHdX6kQQeAuBpj8yrhP95Lrc
 mJaqwUlGlJVWI2p41ZWrO45zfQXvGkclr3viN4DqtVp1wOkUrySmjzdDtwWb8O955/CXSlOkPj4
 shNBlMA/0EzPl4Sey9z5n5owN0nB1SFzkv7pXmLDh+ueroDtWgyLV6lM8aK/oC2d2vB3p5NonFj
 iq5QAwa4io9tByWFbLUrhaD3YP49rrj6olPhm2uUF+4vE+bhp+jb5smE9iwO6URvP0KGtG7W5Y8
 gww2J/ZuOGHRT1+pbIcV3exbZQ1jdd0TnTjcc8oprf9DeMWO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021659_506842_E0AE7417 
X-CRM114-Status: GOOD (  15.54  )
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

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87a45b6253f7dd12b 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug event for the HDMI connector passing custom EDID
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most
+ * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotplug()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
+					      enum drm_connector_status status,
+					      const struct drm_edid *drm_edid)
+{
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+	}
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_codec_plugged_notify(connector, true);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					 enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..4ffd40d73d50d89449508b7a5ce5836a596638a1 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,8 +6,11 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +22,11 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					     enum drm_connector_status status);
+int drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
+						  enum drm_connector_status status,
+						  const struct drm_edid *drm_edid);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,

-- 
2.39.5


