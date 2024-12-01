Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9FFD7361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=; b=aRIP3nmQy/tzLRJvCUEs5i+PBw
	+MUX30rN/nCJXyXCepmNnMOJM+DAMWovXOwX4sjUWvTEt6DMp8Uk/DnZgmf0mdJMph5IPNvTcULGi
	dk51ZnykLQpzgn/mXFcCWDanVFzfp4rX6QMjJfcNtjfoPBLS1MN0lh3sn//5DnKzbQlxfmMZxxz36
	lIXRlXPu2vSafZFcRgy8xG+2m1e8+cW1YALt2GvgGm0zTOt3xjS2jUHXfJ5akn1K5I0XOOUE0ZUL7
	DTUsOL5SGGWJAU3CgNf6kZqzbzP1/fJNaFopzamqvdGiITAg1VTf6hf33Xb733JFTVZ793QqcHblZ
	h4Isq2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHYEN-00000002qXr-2okM;
	Sun, 01 Dec 2024 00:54:35 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHY4i-00000002odc-3f26
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 00:44:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cfc19065ffso3550668a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 16:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733013875; x=1733618675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=zi6xutgD7UG6GDGx92F68BC6pAqVUOFWJrtdrvTJi/3GQzxzB3KL4diI+p9NxRcOdu
         0+wStTFc+Cf/NGvlACM322n0/LYZydb7qF3mcJxjpjzWhrvIbw8RbBWq0//AHFMnMbwf
         Zv41Aypg1W06tLglDUgcZS67X3kS/wjjDkAzVxIbszEaboo9bnWC2VFgKihbNVK2c+XQ
         PQEpyouBTPD0JH0mdKTlLCiZyTXsU6oHDzNHmtMpITgvHgoMAuyznkBFZNu7kEyCQ4xE
         8fPnK+SJI+gAyVJC2Qm8A732Y71NIDmuDnj3qHS1RJVArwxRpUTkZKPm3+1UW9BZUJ1D
         z71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733013875; x=1733618675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=rh5tHznyXEMXtAkEZ1SwqgtegjoXnj9525cz/rGjXoLMotXRhCWp2JIHs51sFO8pzE
         zFAMPtezYUgpq8CgT9IxKbYl+fyNonTLoI8bdwMyiGmpm5Dpm8Y9eKKm4aB3FdsZPnMA
         K2i9lml9pYQc/ya83KzyY7dwfxTlty0odClFzuKINzzSKquf6qofd0ND5XCma3bloX07
         ugekIVtjKOdUIxvg9Co86akbnz3frpMuP+Q+NfODulmTSUqTlPMiHokOI1kzg5LY0ChS
         w2/UskzRow915DlGYe/5dIVcxh3NQnKj+NtrUyRlQXrBpRjrp3S1kU/qZ62Ks8vjijUt
         vaZA==
X-Forwarded-Encrypted: i=1; AJvYcCUCmOdEs4HdmZDg/3ypsJv/vInqcwINL77xvl6CYBT8fANnxADFPxiCpjlQ2jTEqhNKOrjYVDdbdGcFCrf7szwW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxht/wu+kZBWbBai4+6hhhtkGXx9OTDI5PZjUrUB7CPM/YFKILM
	zPE0rIusRdAfxHYQedJHb8ZIzkRXbyID1bpkML1aDkzyD0pZXe1+LYRni0iqf44=
X-Gm-Gg: ASbGncsgrETpdLtZpc3G6ZG6VVZJLQPaP6eOajd9buaL1RXRE2veUlkWA9m3Nqrx0RO
	DEa07rm/pw1AEGzQGPaClMsinf/oZbtFLbH7UDrDn566LCAb4nMrQc9g6bMdKpQhyRTqIIp13wN
	ysn7L1iK5Bq087exw1RWbqijqtkl4lCuetwh9iva4X/uDfWj3kGp9LzP5jp6bLKkTQ58xpw/yeq
	BT7e4mI3v5WBMhPC85TO9kzlITQuPSSVfdQnfCa+2vWXMB3y1K5bi3Idw==
X-Google-Smtp-Source: AGHT+IEQE3aFNcx/37qoHBi5BMr3sqVY3NtBCKtfjfV7wHKGekaptxA3m+vL9XUBY/7vfCR2ueAcgA==
X-Received: by 2002:a05:6402:3225:b0:5d0:b7c5:c3fc with SMTP id 4fb4d7f45d1cf-5d0b7c5c655mr10108773a12.3.1733013875542;
        Sat, 30 Nov 2024 16:44:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 16:44:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:11 +0200
Subject: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yRmYAaGG5FuJnzbiAwK+r8Wa4ofx1aRyHEGe3Ks/gxw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FY195bWef1JWzfBClWB4oHD1yzTC9EFWMzD
 80mNHc4qGeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWAAKCRCLPIo+Aiko
 1WzCB/9dbK/ZL6sq0Z7J3uaSWrvo3v868opAAukc6WNxiaV18XuCxz1ddbnDi63j79YdQb5B8GP
 D0KYTNeGLC5UNMe6kDdKQJdRdGu7ziyexcz8z0ahYZ9B7SzemDlaGs9gLyk0P9W5R368lIIu/Se
 Bn49wArWPZi4BhJHy1u6QiBWJM9uNBWvGsUqnu329vDvgUYww9US9Iuif3+7YTjhkYVtT8N7avI
 woTrJfPaHazIr/m+2iKsIgFy6NXIiGqDUgLWv80FAnpxXW5sX25muyz7cAXbC28cNDik6ZPCIYy
 pgiATl7OmZDXqwI8VuDxI8l378ZDecWH//5U6eNsb1he4Mh6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_164436_918794_C810ECBC 
X-CRM114-Status: GOOD (  18.18  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector,
+			       enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	const struct drm_edid *drm_edid;
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	if (status != connector_status_connected)
+		return NULL;
+
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
+		return NULL;
+	}
+
+	return drm_edid;
+}
+
 static enum drm_connector_status
 drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid;
+			int ret;
+
+			drm_edid = drm_bridge_connector_read_edid(connector, status);
+			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+
+			drm_edid_free(drm_edid);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
-	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
-		goto no_edid;
+		return 0;
 
-	drm_edid = drm_bridge_edid_read(bridge, connector);
-	if (!drm_edid_valid(drm_edid)) {
+	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
+	if (!hdmi) {
+		drm_edid = drm_bridge_connector_read_edid(connector, status);
+		if (!drm_edid) {
+			drm_edid_connector_update(connector, NULL);
+			return 0;
+		}
+
+		drm_edid_connector_update(connector, drm_edid);
 		drm_edid_free(drm_edid);
-		goto no_edid;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-	n = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-	return n;
-
-no_edid:
-	drm_edid_connector_update(connector, NULL);
-	return 0;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
2.39.5


