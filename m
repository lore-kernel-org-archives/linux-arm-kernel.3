Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11473E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wDhN0XmPre4sSVFdX7AsOqi03BwPOpRqwx4iRqOkPwc=; b=VCebbf43Y7A0RHcIJFrbndecI/
	9ebYmMDAr57075IY8LMAE8oSLUvZ9DSiVCp1EIslovBJRDoc8aABIzQvWiweUKkgW3lyzHdrYO/9F
	iJ2IzfbD61LuIYhW32h6jUQBss5rj52Yc8RdOukhU5Ev52ow2R/FM0XTqsCflbbFFaSCZQWvvI11j
	Za489wM/qh2E9AgMh75ztv9wmPDkC9kIrDeuVIRumt2q60todkkR44xGWNBMAF900kz/f+Ztgtv19
	fcSZkVvtxBb8dk2LGwqdwMc+bPLDPs0ay08/y3bDA6m8c4lH9yQrhPwn3OQq4eMmDkZfvEusU8ZuY
	ADWaBkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu2R-0000000B1jo-3qhQ;
	Tue, 24 Dec 2024 01:48:47 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu1E-0000000B1KA-3dTf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:47:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CB401040DBFE;
	Tue, 24 Dec 2024 02:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735004849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wDhN0XmPre4sSVFdX7AsOqi03BwPOpRqwx4iRqOkPwc=;
	b=TYzTvkifQxLSk7mPY5WJmRMF7dZ3B55MLWgD/wAEEiNBotIEyDkPSblouS7ivIrMEjCIyN
	Zcr/RiT7jUe9PaO806d3KnBL7uatxr3iR8wl8QBhr84CrD8jRBkZtWiOcl+RPPceEgWBnH
	ZQuQdmSukx4ydB+woBHyPc6MpEa4WifLOqqNKB+fF/GdjA74jOCyk0ETkDeNvBe1gDpcbS
	tPHeVTE2K81PMKgBimPIacTF2P6QXwyDg9tznWGY1J9tTY++69W2iEzlFHf2+EE+n7NiDJ
	iBU/TCU/7+wLLM3yx8YYDlOZSHOwrjj+A54YDu0r7RjyaffEoLdk4RaiExNx3w==
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
Subject: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Tue, 24 Dec 2024 02:46:14 +0100
Message-ID: <20241224014701.253490-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174733_071189_B2DE1B1C 
X-CRM114-Status: GOOD (  12.20  )
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

The dw-hdmi output_port is set to 1 in order to look for a connector
next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
The output_port set to 1 makes the DW HDMI driver core look up the
next bridge in DT, where the next bridge is often the hdmi-connector .

Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")

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
V2: No change
---
 drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb856..d8e9fbf75edbb 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 config DRM_IMX8MP_HDMI_PVI
 	tristate "Freescale i.MX8MP HDMI PVI bridge support"
 	depends on OF
+	select DRM_DISPLAY_CONNECTOR
 	help
 	  Choose this to enable support for the internal HDMI TX Parallel
 	  Video Interface found on the Freescale i.MX8MP SoC.
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec2890..4ebae5ad072ad 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
+	plat_data->output_port = 1;
 
 	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
 	if (IS_ERR(hdmi->dw_hdmi))
-- 
2.45.2


