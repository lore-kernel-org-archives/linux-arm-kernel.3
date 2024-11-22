Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16466E65D0A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 00:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=; b=bpXeOZuqKihDL5ziWXrKW6Bgzd
	kgnQYJRRz2HfxUcEAjDFtC7BpdrjwYdavvJ9hDHiep+W9LOp6l0KpsJcluVWB0vt4iB1D5c6CQ5YG
	JkCfZjUhqxyNOtnCIJ6f03BBRxPrQOKn3KM4QNYE7Ekap0yrZjllalgWGWIERaQR9rHa0aNCE8L59
	dgLwPGVUQS7A/fjJdPi85RgVl7exoTAqmffQguQaZFcNoN3P6j6MtFD+O+mC7jZNNnizAEkUOaCax
	sixDcay8kYmSCbAXFk4pp5S27jTjxlHzLkfc4XAmM7Fxbwp83e2Cg2Y4fj5qNvVRr9yvubYuQjMIe
	WIDc8AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHwQ-00000001HI4-43dB;
	Fri, 22 Nov 2024 00:54:34 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHq1-00000001G67-19mV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 00:47:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ff589728e4so29518201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236476; x=1732841276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=SvI5qQQuph8IgYj+dy96JnRN/vjjTNH0wIYRV9NWKKFD4Q1hMTfbjxrdtSPz6FBV0X
         5eb3517IE53HEH3J5UMqv9Vp2R01tJHNlNnwI8mqSpSdciwTm/GWBfKdVRhYMS+fBWa2
         e+Wg3A9IgiYDOVLcvqCLHM3VM8Y5N3m+iIEAOcNFyoEwE8pVhYFjuQ13xeCD7Y8QdKPb
         a2PBJ9jA+vvDiDfPvks15avnaiFaFTzKEwQrRYj8XwVE5EKSwRJTF4ptiKueTjhe8ZS6
         O6oxQdJn+MqEwvJr0JKTR9k1nipeFzuADRTePuvVgdYnxCCtOWHXJaKnLo4GaGuqQ4NX
         VtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236476; x=1732841276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=oGyDIAfMCDJvezqgfu0LrIfn/ZkhJv8a2KthRBkv7U5pEpCkcBlUlqHHi8olFm2g26
         dp6sgh31Zir9guN/unygllR6FU8IcHTGQCGHweoZ9mnCy+JhItfg7fJR9qQ5jpzrmPbY
         9c/JwubniswXYCXLBRrQNsG5IkjZqImNF0BslJ0pXA775rNiXwdPZmytc8Y2JM1V1FMH
         dUgEnlRnlzDuOqygQVS9QZMEZqyeNZlQKNC0Sz8zKTWJSvu+q4L4rjnx79T+CqTZFcsL
         UCv8x3BAD/PoVCzucfL8rRMazIG/WHzh8Ez65iq35jSx7U+pg4n7BLdPJNmIN6n2+Wp6
         YWvw==
X-Forwarded-Encrypted: i=1; AJvYcCW9APjYXBQr0DINZ4d+2gAvbbtJossjsJyLdSUK34o39yLn1ebgEdZkgyrJ6KAm5n3Eb7fO/bhGSUtPAu5bxIos@lists.infradead.org
X-Gm-Message-State: AOJu0YzJxHyJxw2wfwwNbirraLVAawkSljyAd/6yrR/2o5UGStbK5myg
	qsFXbeWvzaKtNi9Pc94zNoTs2CS+J3tPe8Jc/sNw9czE9lO8PoKswHMAF/zbJqc=
X-Gm-Gg: ASbGncslXcIEdwV2n6Da/DaA8h1zrqKwUGrDNwpyjmldAuNoQ3eWjGX9ao4EFKamIIO
	Gj3sUbjC/hmrrElxa29QMvrfnr8gdYqbSMRI6X9BDtgDYukZ1wQrjxNzYdNLCz+g4lIQfXMERLo
	AaGvEZPU4pjPhxE7lW878JgbORCc0K9ZCqJ4wb09cTpGqFiLFeKknTPGQvoPy8/rd13dIp8XB7T
	45moSDUlWmfxLywBU4lfWk9W/ToNkgzgGsPwpRKYydTY03bsBlqkLzzPw==
X-Google-Smtp-Source: AGHT+IHkN4nXkCVt6nZPpHcWzC2bWbGpwg4sMZCFQ0fvcq24XIw4gri2A5l4rqWLYlEyB/ESg+byOw==
X-Received: by 2002:a2e:a593:0:b0:2fa:d086:bca0 with SMTP id 38308e7fff4ca-2ff969a16ddmr15367841fa.10.1732236475685;
        Thu, 21 Nov 2024 16:47:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:36 +0200
Subject: [PATCH v4 6/7] drm/display/hdmi: implement connector update
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-6-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h4SDlLdLeTf2M3phGYhMa3icgLWVQxFU2Yi+KA0yVFA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9SoeZGpNl267MxKzahXC2JqO9fXLs+4r7B2b
 jseNQkh83WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqAAKCRCLPIo+Aiko
 1RYrCACo07vR5CSktkmxVEZbETbBqQjxDEeirXgkPjqknr/6Ldh0teXQADgZkx9HHdy58CDSdc+
 ga4kgK0+ZJXjgpg7TnqA4pPgCDv7PJoOvu6y0R7OjtUAaSt01YNT2WdetJ/IKZIgYMz5us0+iaQ
 k0/tU7kVnXK5+fblJV+pE18lR12Yt+SV+MVUlmv/ftN7GvhZJEJ6Df6cHgmGNg/Sdy8rSrFHBFR
 w3uWFPjcHPScLXfZLrdBHstD1OaRB/6FKaVApC2rme2tOi4WXrmB2Itk78OwNOC/b64r9oLTmhO
 inwbgxXewxRuJicQQlp2xm2P+7/BdBVJMjpy58NyXHJAQ+3f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_164757_346261_6556C08D 
X-CRM114-Status: GOOD (  16.31  )
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
the HDMI Codec framework) to be used by driver utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 59 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..2230b7fc92cfee46a9cad2479edce71822d30934 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
+ * @connector: A pointer to the HDMI connector
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most of
+ * the drivers should be able to use @drm_atomic_helper_connector_hdmi_update()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+					     const struct drm_edid *drm_edid)
+{
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+
+		return 0;
+	}
+
+	drm_connector_hdmi_codec_plugged_notify(connector, true);
+
+	// TODO: also handle CEC and scramber, HDMI sink is now connected.
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..61c43e744051886ba5f2024197fcc90688670ebe 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,6 +6,7 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
@@ -20,4 +21,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5


