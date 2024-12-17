Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6EE77183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 00:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzOQetYap6JlXujjWm1yaqFwEQG+fs4gdKxS6/azxrk=; b=OV1qsKMNuq3dpGIYUuhtXx2SD7
	FfowRzC/xaoPkBPO4AwpN0UlNigPHm2/UZc7C74LVlCecKeawgfw/BklTQ2/P5RdB09qaTAMz8p7D
	p04I8d3NFGZG/08mDMx2wQ/N/mgY/fvc2GUVL2akgeFqfXeHebBtEztKlhxk9/Z/6DbIXXny0Nqsg
	lWHKFBJAuFAqE1VrJ86RZjZmCTI7Tz0n5JeKg/Pe3yp5a/t1ON03Gc4Onmwr/W8l4VsgZ3uuU9AtS
	MotfguPJvwi5VOxWYIdkS5RfegPta1i05cYu722NkEDr9AzyknsyYcwjOW9LMzhnbgeH7Ws3in0Rz
	2JGICJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLl2-0000000BmxT-3p4d;
	Tue, 17 Dec 2024 00:48:16 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLdl-0000000Bkl3-1oA1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 00:40:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53f757134cdso5401744e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 16:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396044; x=1735000844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzOQetYap6JlXujjWm1yaqFwEQG+fs4gdKxS6/azxrk=;
        b=auiFJdWgi9wLRNCU4tD+eNZKQvmphAdApZyzOt43CGVtsy3VAaJlbZ2Fp/IzYrC4Fp
         y6PfVC7wAI1dlPUSGN+d50PXrt52PmYBPot9DVYvkFHhWsK4x8IVFIQtfd+Bk3o3HSH2
         ymkW6lmQ+DA5+vSgDfyfYJTmMzbD2a0zGKL8Ic9SuAy8M39k7spHFbud+CLB89Y3+Bo2
         4GvyZy4ZzcJi2BBxPSToFMCcduh07fWdMpuyuyzABigiF9NpkQdEbYMbHhwxtrIUDXO2
         6l3/nbDuR1M/axJ2tZ0AO14YUz+wTcUUnM/wmT977ktkLrcXGH4yMP88go20FWojTNWm
         htnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396044; x=1735000844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzOQetYap6JlXujjWm1yaqFwEQG+fs4gdKxS6/azxrk=;
        b=p5f921HP6hl5TaoDzhfOeS4edKlPA4fl4tJPGDXKDLfy9zMloh0vnpyFqdS/dVt6Tf
         gQAEFtmgTwQn+vOE2/nTZmtdRxHGPfH2wXZBSV7aX0eKngvwJ7seo4T6neS3WivB1inx
         ZT8qZkTRyFznXc96BE2XDREqwviWTy7Q+s7PXE9thtrCJjfSqx5+4KfK92Nr2IQkJZcT
         VkrD5+0blsmPS+Arz3NOmetf3yFoPdqwB7sekn5CcQPpUcsZbKJygwKfNrGrlfeO7l+c
         2uE/kx6oFWEh9c/5iXB4TWKnv9IbumacYkIrq5qInVDh4pTydvGwIWo77GKJezI+gO6v
         8TCA==
X-Forwarded-Encrypted: i=1; AJvYcCVq6rGjYgzqTFhUYbCzIcbPdPHiGsY7fbaSqGCPO7IvFkubfpediytcCKIXDB3Q+EBg6oAU1FLnuOPLpk6PiM1v@lists.infradead.org
X-Gm-Message-State: AOJu0YzSjDW9lTaNoFUC4ebCuSewhFc/qz9JA1q9utVyYt/ZhZfYnmch
	29pOx4eEHYxKyDaGFhUej2zeoUJ/a9yz2dKp5cEHPlxo7b4uIGZHFd3hDQCo4Gs=
X-Gm-Gg: ASbGnct/QgAcLqLCGiyJr5S+PS4h8yzYRPCjnwywxO5rCEGCjKbr4TjRTHnVzDiVT1V
	6oawFh702uMAru2fIvmJxislfWwgP+hOpznaqQ2JZs3MfwhvUAWSvSQCFw2Te6ogYusePuGn4GK
	hKq4IWJTAX5rs7SixEsSM5efqe7uhybYFwosmbGTeraaae3DdqbW+PMzHecOOSeys6fAYQiJJi1
	j75NfN0qSAc52Z7rhaeKjRlxWI9LtdCOzJ5+Ch5PkEl1VsLI1BqqcO3TF5Q1Ql7
X-Google-Smtp-Source: AGHT+IFtRuuo2fJF2WRiUyFfticNHErCMSgKEibB8GOCt/FpctKGI+IFSd6o87o+qJVqIfNTG9ocsQ==
X-Received: by 2002:a05:6512:3188:b0:53e:349c:45b6 with SMTP id 2adb3069b0e04-54131050b2amr443087e87.17.1734396043862;
        Mon, 16 Dec 2024 16:40:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:28 +0200
Subject: [PATCH v7 06/10] drm/display/hdmi: implement hotplug functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-6-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5694;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jOa+xmrHN60EcTtWZxceM55LJJb7yZ7lw0Rtlyo5CRg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rCiUolXV5D50aBgykmX6M9NRqbpZhyV6jJc9qKbGaec
 D3u5bZORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAExkkQkHw7I/GXvq5uvveN10
 RzyEe9nZK20WF20Dl799ZtBjUrOe33DWpP5jC7RDGMrWrvujfs6tVKXNpv3zynfrvPXicoOmr/f
 Va/GbLuJX9XjNvBehy1jULC7nt8/4ufBtZ5zbQhvu9YIWzvN28j5Rfs26+6/RPHXO7lKrVaFSvc
 9lmV4+zme5aXCiwp/D2HO+i2KXeNfvoGkS+hsfcx+8+uuku2aDnpmLfkJZ9zk3LfNJczO7df5na
 +8IX5y6fH5g0Zy5tnlf5f9K7JZZLCGy8+a+6xdrDis0+L3/L3W5OvLibJvroV+DW3b9u3/+baHS
 7nTrO27X3wZNO/Up6apjZg/bfh73Qt8wTTauV+xujlJHAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164045_502124_10FA4227 
X-CRM114-Status: GOOD (  18.39  )
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
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 56 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..e175c0eaa1cdc0b8b8b8408bdc3fdcf49067c634 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -769,3 +769,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
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
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
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
+		drm_connector_hdmi_codec_plugged_notify(connector, true);
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
index 536d604b6fb27368c43805a2ecf57fac06b3d472..23340696bf36313952da0089b9dc24dcf772a9c5 100644
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


