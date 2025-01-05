Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D780FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qbPaYdLjULZi5RoBrt7rDIF6XL0fx+U5ZuOgdKQUJ1E=; b=X0+Dyb76f5pUI/kRQ3GVHGUDez
	w6Lg/2lvZHNH0LkqZt/c6WeYAfV5VbGeV1h/CYanTp3h2Zb6L35tsrVEBjrqQUY9djK+5QDIgPJZg
	gXZ0PLXc7VhMwOxTKh0y+ys4YTt03z1QJSnQZBpyrhikaY2QCaOdo0EMzhw/k/kFoykK9cL4Jvea/
	zR6d+QljpKv2YcWO+SCj3vq2xoX3VAwNocaAB43hfoO8WGb4y6+AUychxJTihnJEqPJXT4leAQ4W9
	Pm9DciflnQXSgvqLtGfIp6c4gI2UipvCoDyzZZbXydICa0jMznO3dZ4vkhopwle7doxhP9taNnxEN
	WJr9Yy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVzS-0000000HI4D-11Dm;
	Sun, 05 Jan 2025 19:08:46 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVyG-0000000HHvV-2UYM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 19:07:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B97A10408FB9;
	Sun,  5 Jan 2025 20:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736104043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qbPaYdLjULZi5RoBrt7rDIF6XL0fx+U5ZuOgdKQUJ1E=;
	b=GHqctiTMczjRVgtsWG6Soz6dOGmoEeW8z37m9uwA+hZuvRarmIeegBvKgFYToYoVKINxVX
	rh6GLlAcd6VU4jZcvKpn4AqDJftLXiqcmx1RPoQ+yEWcDDC/kLFHlfRGfcmY9IhirnmPq/
	W3xw7W4tQYBQEMG2cFeCH+f8jAWI1FGkAnYgit+O0EwVNHna3AekTg9cM6op4FBO6ZessL
	bDSzgMgJ95TC3ggcD5Ky2+Ql1mbpH5f+txiIWrwsl8zBpvzJ/y4Fsm4hyavU9ntFDWcK/A
	i/Ln2IVfyuD5ZlEFJcv76cInMmt6Xdm5xK+X5pTk2ZXdd6wAcTEoqsf4iv0nEw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output port is optional
Date: Sun,  5 Jan 2025 20:06:03 +0100
Message-ID: <20250105190659.99941-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_110732_846433_24D1A614 
X-CRM114-Status: GOOD (  16.92  )
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

Add a flag meant purely to work around broken i.MX8MP DTs which enable
HDMI but do not contain the HDMI connector node. This flag allows such
DTs to work by creating the connector in the HDMI bridge driver. Do not
use this flag, do not proliferate this flag, please fix your DTs and add
the connector node this way:

```
/ {
    hdmi-connector {
        compatible = "hdmi-connector";
        label = "FIXME-Board-Specific-Connector-Label"; // Modify this
        type = "a";

        port {
            hdmi_connector_in: endpoint {
                remote-endpoint = <&hdmi_tx_out>;
            };
        };
    };
};

&hdmi_tx {
    ...

    ports {
        port@1 {
            hdmi_tx_out: endpoint {
                remote-endpoint = <&hdmi_connector_in>;
            };
        };
    };
};
```

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V3: New patch
V4: - Add HDMI connector node addition example into commit message
    - Bail from dw_hdmi_bridge_attach() if DRM_BRIDGE_ATTACH_NO_CONNECTOR
      is set and there is no hdmi->next_bridge , so the connector can
      be created in scanout driver.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 ++++++--
 include/drm/bridge/dw_hdmi.h              | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004..e84693faf46dc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		if (!hdmi->next_bridge)
+			return 0;
+
 		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
 					 bridge, flags);
+	}
 
 	return dw_hdmi_connector_create(hdmi);
 }
@@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 					  hdmi->plat_data->output_port,
 					  -1);
 	if (!remote)
-		return -ENODEV;
+		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
 
 	hdmi->next_bridge = of_drm_find_bridge(remote);
 	of_node_put(remote);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a46baa0737cd..3bb6e633424a8 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
 	unsigned int output_port;
+	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
+	bool output_port_optional;
 
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
-- 
2.45.2


