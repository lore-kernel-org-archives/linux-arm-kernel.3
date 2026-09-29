Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23265CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km5I+JcME5UXy42DduLtW/ez3raaO2PXP1hBWyAnM64=; b=Z8Syj4b1b4vX7TajEZVddOdTXl
	qCb/bd1CVwp9faNP0TuLZCHx+L0Or/lN3kD0pippYAxY23NcvXtQM5bz21ixflohtidnvtRa/L2lA
	rMsPv99wxQPaSHMsrsLTJmQ1mDxp5b4zAetngQvKddyNDTGda4k5T8rzHXKu4Y1n0OMvD9bBL8jin
	lhd2AK7tkplmykfM51bxBneL58AKFpieNgQD9j95mEPLCMnu4PLyK+bweA1AN9VZpARjO+P/lkeWn
	n+u0JlcuxLkGgiltzWNCBHJVTtPtqE/oSAcRBbP5z9tKNuUe08yheaiA5UAf0FIwch2EEqP/OSzpX
	dYToZFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDi-00000003Gvn-1ler;
	Tue, 29 Sep 2026 10:37:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVCv-00000003GU5-1CLJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=km5I+JcME5UXy42DduLtW/ez3raaO2PXP1hBWyAnM64=; b=qGf/IhNM5SCf/T01cYlWNwPFJx
	cbsZZGch0eG1qD8XUGcxNfY87wPdazgZgUofLnmSXNA7p9FrYCPFXZ9Ygs0n2TeIJq1Kif7g5vcLw
	1L2K/rIc6QPXpCD/RynCtmmoN1HHozbqx2prYHZ1IN3dfGbAoxOAhr1MowCDK98C6XpvbpmxIpcZ6
	cl0xk23sXZR2GINFJGxwoFz+zI+jWyMYQ4BVpGjkrsQt12ycQMMAgzSqHCWwwL+BF6cCcfwjqTaVR
	Pt0CV+WcI9ctKPz8mj4yAMXSBkhQuR8y5MU8sIa2Iw4VBUceAzfLplIcviSGXHP2YuT2DUqEg6q8I
	2REhE5WA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVCq-00000002VEy-1xUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37D4A4E410BC;
	Tue, 29 Sep 2026 10:37:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A3ED601BD;
	Tue, 29 Sep 2026 10:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D870103297AF;
	Tue, 29 Sep 2026 12:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=km5I+JcME5UXy42DduLtW/ez3raaO2PXP1hBWyAnM64=;
	b=M6cmUKKytgaFYQa8+E9bIANqk5CVnrl8p2/pBEXQ2Rd8TD1c2EKhiqJQT8S2z3yFYpn5mx
	iEsPFKoTpQkDbTjEcnq7rTpJCsQsdUC6opEFXMLZOjR0yBVtIX9cCLA1PftaKHPAy/nFxS
	MdKqQrRc2+Ex/I6xBHn+4NZJXz2ZqEiz+mfNOkjLLZXAhgfPmsVH5cy2QWu88MMKpMIaKa
	xsEvSWMi5SjnpbMtdTKTQM1xbaUddpnrbX0/ZQeRNDAndzL1cG+815Ped/EC065nADJEIo
	VxbTKHM64MgtHi0vbBEk4aNMdAD/JbwISQKnfNCvRW+v3Lz/HZqFPcopetndWw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:35 +0200
Subject: [PATCH 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113705_737993_1B92CC94 
X-CRM114-Status: GOOD (  13.37  )
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

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Fixes build failure when CONFIG_OF is disabled.

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 5dd475fcaacf..fad6c3f71032 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -244,7 +244,6 @@ struct debugfs_entries {
 struct dw_mipi_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	void __iomem *base;
 
@@ -333,12 +332,12 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	bridge = of_drm_get_bridge_by_endpoint(dsi->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
 	bridge->pre_enable_prev_first = true;
-	dsi->panel_bridge = bridge;
+	dsi->bridge.next_bridge = bridge;
 
 	drm_bridge_add(&dsi->bridge);
 
@@ -368,8 +367,6 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
-
 	drm_bridge_remove(&dsi->bridge);
 
 	return 0;
@@ -1086,7 +1083,7 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
 

-- 
2.55.0


