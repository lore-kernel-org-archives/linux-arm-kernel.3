Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1CAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=; b=4DPKhWD9hhNTqRYBzkb2lWnHnU
	uULUP/3Q6/p2XOVXk6Tu3JuO0UXd5WVSvhepiqXqwUUYKf/Pu6lLuxkXqlf/orDSM9SxWBEAUcmZl
	S1NDO5j/6TnuOlTE4/eFU99ZVIdFEmpe6KTLOr9tC61v35vE0JphxLYKgZs1LhHstyH48lvxxMQGZ
	SGkpOc79k3z4hDLovxFh25OlkRq+U3VYW9p2zMTQWcFTfOmbG+G/Nufmv7DwxIwUngm/o7NXrXhqB
	3DQ24fbGwNEdNOQy33om3rPHexcGSGt4Sn96WkT+TVUB7PeZcP0YnXDHcEL3TjJG5X1UOSZgZAb1W
	pOKolUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOidp-00000005w0a-0AQv;
	Fri, 20 Dec 2024 19:26:29 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiV2-00000005taq-0drI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:17:26 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so24060421fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 11:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722242; x=1735327042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=dutZSBNEBqv6qHnMOTZ2mqTLjXZiS1V3xIeIxaz0DWVof3UGXspaivCjUztFpME+Sq
         TiEl8GMV6A4uwwYgydxaBvyHCHC8I5MwQpLWxxVsafwfNajC9+nws58LbMKKFz04J5h5
         +E2aJHFasg3Oixr+NYz+tO76lN+rk5FZaPC3lTwdA273QjL6y05yrITWt73R9LZmEAQ0
         aGi8101GPZkSKue+V5QtopgMwIvbYXzmgqkq2YLWaTz7XkcL4BaOFIkSoJXkgZrUIGiF
         OpNvjh3RjMvshbnlfGR/v1rxK/IFm+4FiD1awty/FlytcfXVgxs9I8sJi7QtmUk7A31n
         5rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722242; x=1735327042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=REZPtyE+iFgp0eWoMEcK7C4stlLQN1gG1vh0tUzdY8t3FaCLK6IRMYZq6y20LqPJZy
         OHPdEi34F+ixTjq8dGdGediQi1+clWRQASLp5jL3ic4HCqEOVBoMZJA915posEn1YOKr
         MUGUfphcgvQ7zw0RjIy4IXIJdx13PhC8pHa2N70gvBy7HVqYzfB29eJtL/cSUsS5FI48
         uvyTJfLp+z8vnnTWYwBrNjC2RMrte104dWHQw9Cppr6F102HxVA3f5sFZkicxBGi0Skx
         +OINUYe/iYrOZ5QS+vgPOiglhHxvzdmntzc8vDhPlLOLfkV+v8T4tupTMfHTqxPSyocq
         +0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeJf8FmZ6mNHwi/FHPPXzO42rVEsTrrX/i/KY+4KrZmo4/HcCng1T1Er1H2xWI+FJXprUrqvg5v4u/kIrmi9s@lists.infradead.org
X-Gm-Message-State: AOJu0YwA2YEqBwH12Ukyg8hZa8volRtWkT/03ceRAl4JKqqaR8+Fwkn/
	NaPzQ2zRqhp+xTw4k3YZSwD4P3wPtrUUkU2f8/x7xg9/ugE0eK2a2BlS8XSaX5g=
X-Gm-Gg: ASbGncscUEPDlRjdaRZL0+7hA2/q7q+mbIGdKH16Qn1RcznBIAnMxRzmMomEkcVQbr9
	t9E19+jDCTB6L5bBn1FbOkEP44JFeXzMowjh1RqWH2Lh8sTyS3L5TwuvIoOqoqEBVCAY/xJdrql
	Gd9pFbrhpH6SKHIoQ99drs/3yhOu0bfaIPj6YdAjjSYVQSTd2ip+EXGzELsZg1+OO3Xx0wwRDSw
	ARQMNolnyTsuNrElsEZ+bSLbithwPWPnK6uhBEF+DbGjPPd784/KtCVGWVwbCEV
X-Google-Smtp-Source: AGHT+IEptTJIjjBHJb6drHS6Ssf3ip8D9nli87J1i3Tl5U5BIoRVUbAgr22Q8lEZaYRdhxbZ2aDt2A==
X-Received: by 2002:a05:6512:ba9:b0:542:232c:d3eb with SMTP id 2adb3069b0e04-54229530111mr1143607e87.19.1734722241963;
        Fri, 20 Dec 2024 11:17:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:04 +0200
Subject: [PATCH v8 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-7-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKvRQ1DyEvUZ1bVLVKWFGtt2tlzDFohZ6VEy
 cv513jnLgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1VZZB/48AgSV1kDPiMY882P+b8lEru7SsHx6YLD9T1fz/l553VfG8tGAZ4zSgd8lyhfFF3Ugvw4
 zy5oID9hdz885xTx+UUeywPsD2hrB/WzGlsawx1pwmKboE6XIU214KCydAEFuFXTAb1Ncd1P4T/
 TqQvi7thRLweENmH/lapmF6aDNJ74rfeJrrgZTzyf6rjNMkOzMvwFjg03adlbeISOAYcjf993ja
 6H5af0Us6KBcRMkdKLbmesZB0TGqYhynDCbOVjJid3zmoIDD35wUb/CdkzrFHTDQUebxUfzdD9x
 TPLhFJiPj9m/4tUNtSPH40RcFpTeoTCnjwALIZ68OmXM++JX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_111724_265509_B616CC15 
X-CRM114-Status: GOOD (  17.23  )
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


