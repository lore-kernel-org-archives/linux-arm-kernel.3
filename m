Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5638CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J37od7VylY8s1OgC3uLV5wfOGm4SfNZZc7AuhkqKTIM=; b=3ApwVUSYiYrusAkc3O7lUbgbM8
	fNAvpojuvXwFPygSuBqOpyPVGhnPa5AZlyuEUXiAV6wciHUL2cgJOvA5zDTyRXX6SZEBUTTSstqpa
	QRHXmGKzqg7OIuBUKKdoC1G+KoDOFr+STTkbKdtJGMwriyo5YozLIOvim1jeivrNWad2cCcHcoGcB
	G4CvH6t2SJHyVFLCupzsg9YOffAvoqhNOlsdUta5sJ27AZst/RaHZijXwQi8EoPwVmIQ/lIbkysIs
	bdi3IP633wr167XZjCTXzhlCddaI45d0tiJhpBy8b34UOT9bwUa2ipAUx8fhmRvzeHDrI6+3iehIA
	ZToKKUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG9l-000000097ec-3SIs;
	Thu, 01 Oct 2026 12:45:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG9j-000000097ar-11xl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:45:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A8A1E1A24DD;
	Thu,  1 Oct 2026 12:44:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7490460341;
	Thu,  1 Oct 2026 12:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2282103280C2;
	Thu,  1 Oct 2026 14:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J37od7VylY8s1OgC3uLV5wfOGm4SfNZZc7AuhkqKTIM=;
	b=oZmPZJ8cm2BuGFlIWQ+DWojJEuh5j4c1xhUnrfCUYiiel1PdZN35fW8a3KgomlbdeXwYAZ
	v+rC5qKObqmmyna/2kTcyU2b9XUguN+IwHlPuuM6GV2uIjS59/4e6JXiz571GejwI9MXfu
	3rEd9OJ33Lnly+L9b+Pj8/Ov4pzNntBPtQXv2RIHEXNHZTPl8fEv5l7N7kgv/UMC8/WEe9
	80q1DO03c3SLHVHRRvdzaq91BP4PqSWx9YS7vqsi8E9Hzqd6iQPUgCmVwIdOefKqU2m4/E
	1QLhtXUIlBANFioif9w02x4wvPX1YTGuASrDRel/Lq98lMU2G68yFfbvLfJi3A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:44 +0200
Subject: [PATCH RFC v2 22/24] drm/bridge: samsung-dsim: implement
 .get_next_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-22-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_054459_439727_4DACB69E 
X-CRM114-Status: UNSURE (   9.45  )
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

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 6c48404fd60a..2da3a13260b9 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1821,6 +1821,13 @@ static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
+static struct drm_bridge *samsung_dsim_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+
+	return dsi->bridge.next_bridge ?: ERR_PTR(-ENODEV);
+}
+
 static int samsung_dsim_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -1835,6 +1842,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
+	.get_next_bridge		= samsung_dsim_get_next_bridge,
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state			= drm_atomic_helper_bridge_create_state,
@@ -2200,6 +2208,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	dsi->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)

-- 
2.55.0


