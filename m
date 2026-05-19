Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF6ECD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31ncBWdHqHsdjEKSp4vtUwOjKggaE/FUwi7+sB64GTA=; b=ZWzw1Z4isdMXx1CKVZzFCWZ4nI
	6qSiimycxmMaFahtDVq+osy86Ear+9C4uCdCrsT+eMmkIyPtRZS8wa/Yvl7fyAp3ExRS3xujMPX9P
	QsmvYBt8RMgkN+rNe7t3Uba4S3vpAqqfwXzFZ+0vqtMcostvvpchNLRJr5uvz78ij0aUeANGyfm+h
	p6jqNch6Rj+XdmSCUzvazjnGKaO9yIJDB4wL50Nr4QR6BycARCImyLZIxg3ByI2S6ThK7FkIrtjq5
	22TPv0zX4YL1lsx+j+lRsIyKCmQHwee1gQ09SliaFWCO9R2hPn8nXOqizOwJw0URtNlNlTypnHd/n
	XzVcNuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsS-00000001A1A-3y57;
	Tue, 19 May 2026 10:40:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsG-000000019j8-2H9s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDF7C4E42CF4;
	Tue, 19 May 2026 10:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C19AB606E9;
	Tue, 19 May 2026 10:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BEFB107E8AF0;
	Tue, 19 May 2026 12:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=31ncBWdHqHsdjEKSp4vtUwOjKggaE/FUwi7+sB64GTA=;
	b=MWJTDn5rArD4HU8/88qXnibhNRKlApYd92dhmLobr0VRJBSg9i4Nmt6jrwGXpugMvv5OmY
	TpUfO/dBOabgxWRFrU/10zDCAXFxbLEZqFMDOe9SMZ+IWfixPQSIzlnfZPdcq/IlO/VGIr
	dFET0eus81/DZyOLH05lag+6WmQfcgQnsk9qalj79k6mddr5R/6pKyUA6GZXb+BAR3V3S1
	23cN1nXngjKQfI+YmsdZ5lezoxal0KuUEipbhLwhHbrw/NnM5TGhNO3cytPQaGQ/MYB3KT
	wOl5qttM4Y1u2RSkUny+veut8wkeTbVCYw/TqNDZb1xMDLD4atb2o1XR1eJ69A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:50 +0200
Subject: [PATCH 33/37] drm/bridge: samsung-dsim: implement .is_tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-33-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_034032_752412_23F64334 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

This bridge is never a tail bridge, i.e. it always needs a following bridge
to complete the pipeline. Add a is_tail func to expose this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 3c70a45c5dce..55f4b0f16ade 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1716,6 +1716,11 @@ static const u32 samsung_dsim_pixel_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static bool samsung_dsim_is_tail(struct drm_bridge *bridge)
+{
+	return false;
+}
+
 static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
 {
 	int i;
@@ -1836,6 +1841,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
+	.is_tail			= samsung_dsim_is_tail,
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
@@ -2225,6 +2231,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	dsi->bridge.ops = DRM_BRIDGE_OP_IS_TAIL;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 

-- 
2.54.0


