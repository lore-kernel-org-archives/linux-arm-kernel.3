Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3143EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11MMq9bq76q5jZNjt/p/AELnXyaWnnWQAMGdIi+5im8=; b=RWCPlf0kYQ4n2danvKlfQVx0w6
	nVqAKNgQ+UwEsuaIbshf9PAf8cvPOqzIxVZc+Cc4j0WJ0HTiX/IzfymQBiGs3zB3uyVixXRIZIPV2
	da+YxaF9PCjNjlDESVy1wiLPIs2JgwctF3OLnPWkx8+5R46ORofF3WeSJf2hlHvWp96OBaY/C/4Kd
	JlFcZ4DV4L8EA/rg9ApazAJDVWEPrCWwDJB0dVOlmPn/xqMM43ssomBuVFA2slBHpC5ARzEqiDESu
	6IZO7t7GHAjq+P7EyRSE2Ub3NhRnXnPcWMaRYAZdendaMT/HvzbJdwDNoGEMVKCbrgyF5wlTp9gUc
	cI6dyXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPuCo-0000000B3Qp-31M0;
	Tue, 24 Dec 2024 01:59:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu1w-0000000B1Vl-2Tjh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:48:18 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401e6efffcso5730120e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004895; x=1735609695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11MMq9bq76q5jZNjt/p/AELnXyaWnnWQAMGdIi+5im8=;
        b=oLDQTaedxE3IQ0MJN91TD7ZapnV/8DU8ElQJVvGkwyWMgTG1vzSVex4bXvLcvJjdS4
         hs/YCvM3hfSG3oBMhdDrTDYTw+fOpOTpj0978DGqcIEHn7Pp9FMH4jgm2NEoSx0LbVQD
         bdHDPwxsxAOLaeuFpvXiDXoTYtsjr+sLI84uFMWNRTC+UrEgfBaMnc5tD38/V2nuGZJ0
         KnE9qje1yc6sYhglpjW/ncz0PUOO9rdANu8t/r0nwaf6zEuwFkTgFb2gzDTyGPqKjN/b
         hM2/q9mdSawt1NTAgifhYl8CtQN1NeNHlFXT7EmEFifRN4TfH1WUOpcihTbopDc476hR
         y9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004895; x=1735609695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11MMq9bq76q5jZNjt/p/AELnXyaWnnWQAMGdIi+5im8=;
        b=T6h+kk0oak9YdemxVgLDNT65/rOReab3aFepuPOktZNWp7Kj/aiuFQnxhGCnGtkUVH
         FkZHYJ0YgaOi1T8A77iKqpJy4xzYySzL/JM3zmy162gT9U+SAt3LgfNv1uBcwzNaaf80
         wX24xrx7kXK1X8lXcvn0exRQd9AAW4g7nbg82Ny9WfbLVbQ6lbXKAgLf2MTS8taa6Myf
         ilO+xiEM9rOP2nijZCT1aetw0sUkjdf80EhxKWfDuPB2GpUXs/vZWPEnOECMQJTjaTXr
         IcFwI/BXHv8SOF3MIg2ePG07142CLntLx2dO4rg9dnGT0Mj/RRY2Q3AcxREmn6cEbegK
         zFAg==
X-Forwarded-Encrypted: i=1; AJvYcCULIva0RwLvxf7tqzNEKPdyiVmMfpVGL1u4R6kJP9aixCjg3g9CkIKq5pIRJHogUwmIn1JleNKuNoqrFv+jQSQu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ZjlukTa+3PxNSH+Wx3oL1eTLqN096VEB+9Tjf23FodwToOKv
	74pT3kpaWEDdrOIPQcR5/x5/I+dDVsfyHIEagJ8g0jtac+I7NEpwOYZs/GhSM5U=
X-Gm-Gg: ASbGncvxZLuXyP69P/8t4tWddyKiSnC+GhyU3XGeNDYdcw6iseQxEUon0aQlGIQDx3X
	2P/rQNRSrCO34l3/sepSEOENnm5OTusTt8uUCh44zigzlpYafis8vLlxXdK5dcMejRAZKmQxysE
	nkrhVWhPxsgZW++K0aKV/KryG2M+0dZHoVX2ZgAc8JMy8PJ/Jyuj+kqZg8xIGMRHdZOF8qt5oAD
	aA8yebsPTGGY3waK/ME4gf2aVYOqK+p3hcAWQRQ2kpvrhUzm+rMiXrCVHvY72/t
X-Google-Smtp-Source: AGHT+IEnqRxDjCeeazsBTgHI7OCuUe1Vp/FdlFUFuT3jtGX/NcJpZR9vWjBPsZ3WUZOozuTNZ3MDbw==
X-Received: by 2002:a05:6512:23a0:b0:540:75d3:95a4 with SMTP id 2adb3069b0e04-54229538b24mr5215859e87.17.1735004895002;
        Mon, 23 Dec 2024 17:48:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:58 +0200
Subject: [PATCH v10 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-6-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6555;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2s0WLoIO3OfL4EsRz0mMJb2gfo20/WlMm825XzWtaMs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNxMawD6cVknB37e5e3k5Uhm/mSz2wAhYpK
 H+rJ2bQm5CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1b9cB/0dqEXjqOcrvKbfKLUvLoZMXrr5x2OCQ3fyzEVeYrVc2yBzdJORHvsa7QE4Zhf5c/cEKvB
 bwUDvNqn8vx9YzVp4YoUrw2C6RNy5pRNjDSGhB/Lz7fazOYWRKoED1/PRtEGWl/EB43bQi+XOmK
 Z3Dq/EfeLI8b7hC9TCTwkl8L5xn5vSfH3+ROGVwkvWaUWy+7s5QGRZf0jGKv73p6qEba4P4hJWl
 +hUCMMbwprsSUDF7uA2/5FscifFml78DWTgYnvUyNCsQhjb07wRVN8I+zEzlIpVQ7H0vSMNJPV8
 zjTSYLf5UbyFr42aEeqsljxDDrEK5kes+XG1jaU2kKnqdam1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174816_696070_01FA5F2B 
X-CRM114-Status: GOOD (  19.59  )
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                 |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 57 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 4 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 2619fa2476eb149e1befc3135131ed5aaeb5bb4c..8d22b7627d41f7bc015decf24ae02a05bc00f055 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -89,6 +89,7 @@ config DRM_DISPLAY_HDMI_HELPER
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d678c635a6935050ca9c1ccafbb0865f21df5d4e..cfc2aaee1da08a103cbf933c891d5cc31b0886a8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -5,6 +5,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -777,3 +778,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+static void
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+	}
+
+	if (connector->hdmi.funcs->read_edid)
+		drm_edid = connector->hdmi.funcs->read_edid(connector);
+	else
+		drm_edid = drm_edid_read(connector);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+	}
+}
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * callbacks, updating the HDMI-specific connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
+
+/**
+ * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function implements the .force() callback for the HDMI connectors. It
+ * can either be used directly as the callback or should be called from within
+ * the .force() callback implementation to maintain the HDMI-specific
+ * connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..9ae19f3caf727f9a0fe06e6afe5fc46db924444f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,6 +8,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +21,9 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status);
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1d4c27948e8750191e7daf8ff6cda97d944905b4..f13d597370a30dc1b14c630ee00145256052ba56 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -45,6 +45,7 @@ struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
+struct drm_edid;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1247,6 +1248,21 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @read_edid:
+	 *
+	 * This callback is used by the framework as a replacement for reading
+	 * the EDID from connector->ddc. It is still recommended to provide
+	 * connector->ddc instead of implementing this callback. Returned EDID
+	 * should be freed via the drm_edid_free().
+	 *
+	 * The @read_edid callback is optional.
+	 *
+	 * Returns:
+	 * Valid EDID on success, NULL in case of failure.
+	 */
+	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
 };
 
 /**

-- 
2.39.5


