Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF34E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MZEWmN4GN5G1sABY/mv4D6+HIYv/6uOJhfv6635kFT8=; b=JSj2Z3XOun/dw1htsB4318hyRY
	YIRwwa4MP8tt0qNTIfc+PJ3pbR1LYOdGIssbNAXBJ9du68OW5BLGqr2gHE7Sm4JKEn6ZeUjX/MZGv
	N8L9zGkvX/hU3gHHR4dBJj+AEJthNkTm8VzLYSdG4zvUPilL3ZgHknXdkkJVDNtY0gNwozTFzOps6
	XG+EnNB79qsjDjsD5oILdiUCOjoO5EKX/lkfF1ztr92wAhVahFEX7yHbNxcBX7kW36vctT6920ISM
	LtSIz4aW17SwqEWsqS6oigHLnji/DrkK2BL95KuupJa/RnU5KNLzczsFRfP0iXFgKwDG0YPbEcx5A
	azDAZWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tShxH-00000007eom-3fKX;
	Tue, 31 Dec 2024 19:31:03 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShw7-00000007ehd-3wGp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 19:29:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9802E104855B1;
	Tue, 31 Dec 2024 20:29:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735673388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MZEWmN4GN5G1sABY/mv4D6+HIYv/6uOJhfv6635kFT8=;
	b=SSSiv3irUUXzx7nqQ6tWRryfPL3RUPx2U1XYOP5k8dgpHW9tWjWQWbYGFWKoyBI/lVWaPT
	291ngQmHU1jh3qYi6pXY7hpznxcKYrW/ToN7VKNE2nGq+uS5/N2c537QG2zprE7qhSquMZ
	0WHaNs5fSUrertBEKOltLXIoP+Mm24e/5mdu10VcfREEck46vybCD6tB/ZVQcrfHOBaX5j
	Kf2qAbgWJk/wrg52rumZ819AUsFbUv9Sjp781z25UxkfAa9E7GAp1qGqR1HE83OQO9p3b3
	VVZKVBOCGLHoA3nWYIIC03N1swSdWXafVV3Glykw5lSnI9NcmhOYFpZP+A1CWQ==
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
Subject: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output port is optional
Date: Tue, 31 Dec 2024 20:28:48 +0100
Message-ID: <20241231192925.97614-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_112952_137906_5F977D8E 
X-CRM114-Status: GOOD (  14.18  )
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
use this flag, do not proliferate this flag, please fix your DTs.

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
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
 include/drm/bridge/dw_hdmi.h              |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 996733ed2c004..852e73c0f686f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
-					 bridge, flags);
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
+			return dw_hdmi_connector_create(hdmi);
+		else
+			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
+						 bridge, flags);
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


