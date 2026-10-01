Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DF4CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn1qnP+9b79qTAxYoxjPVwEVJVuzkHh/e7CdZT+yjvw=; b=Bi51tqjQKL5agmFrWyljJuqjdc
	tRpgjfnbM8CYYW4BdkXKhHU0qmbrElJkRRWVBu9qiR2V1HQUCodXdDNU0WTdNFNA7skh6b+rH9E4B
	THYrm3D34QEY4FbMvoHz+42bfrCvisComId9UgxsPNEsVzh5OF6i7NlpNDHQsKJ4khFjQrlgmlX1N
	3e9i6+DR6/5wTc6G3fCJFvE6a1Esydy1BgCjRmh9zBmoNPjm0RcJHaRWLySB0zZ6YJZV8DqvrBvtY
	RMEIiUsydXSgE0TMNuBVp6XeAYlI/7Ak7ULsqeEB4PdjmahQbOEMtZ6u/YUBs6PmYJapvIh3Jl5MZ
	p2BU4Fbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8O-000000096Wh-0ttR;
	Thu, 01 Oct 2026 12:43:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8I-000000096SC-1lgt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:43:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73A534E416CC;
	Thu,  1 Oct 2026 12:43:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40EB760341;
	Thu,  1 Oct 2026 12:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30C4F1032811B;
	Thu,  1 Oct 2026 14:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dn1qnP+9b79qTAxYoxjPVwEVJVuzkHh/e7CdZT+yjvw=;
	b=1QOblAEfp54AHWRmf60xcezk9bykrl432AG6LobQRkJlSIND48VvOc2k5p5GdBvJKxP1G4
	GhJy8+5E0y/IlrXYgluX+IixocZ/VIruusTSmZqj2+Tk+/+6s8/XMAj10oA29K4mURmP6g
	5VflRpkzoeci/lvx7ug/lDjBCWJ5EsJXz0DBaHKlf54f4EPzHxQ74dO+w65qTiU04xhdtr
	5eIT+snrfR8y4y179swi1umfYP5W9B/Tgx+6vBIunAR3yfEEPIEAqnsMI1Im38sjkksd1N
	utnWY6itpNIEsM/lvRPC/S1RRjX1kcwU3aSKM4D7CCFo1/nX7XFikUsZfyTOrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:29 +0200
Subject: [PATCH RFC v2 07/24] drm/bridge: samsung-dsim: move
 drm_bridge_add() call to probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-7-8e34986dcb68@bootlin.com>
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
X-CRM114-CacheID: sfid-20261001_054330_826953_56403AFE 
X-CRM114-Status: GOOD (  23.74  )
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

This bridge driver calls drm_bridge_add() in the DSI host .attach callback
instead of in the probe function. This looks strange, even though
apparently not a problem for currently supported use cases.

However it is a problem for supporting hotplug of DRM bridges, which is in
the works [0][1][2][3]. The problematic case is when this DSI host is
always present while its DSI device is hot-pluggable. In such case with the
current code the DRM card will not be populated until after the DSI device
attaches to the host, and which could happen a very long time after
booting, or even not happen at all.

The reason is that the previous pipeline component (the encoder in this
case) when probing cannot find the samsung-dsim bridge. What happens is:

 [1 and 2 can happen in any order, same result]
 1) samsung-dsim probes (does not drm_bridge_add() itself)
 2) The lcdif starts probing multiple times, but
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() returns -EPROBE_DEFER because
             the samsung-dsim is not in the global bridge_list
             (deferred probe pending: imx-lcdif: Cannot connect bridge)

The samsung-dsim will not drm_bridge_add() itself until a DSI device will
try to mipi_dsi_attach() to the DSI Host, which can happen arbitratily late
or never on hot-pluggable hardware.

As a preliminary step to supporting hotplug move drm_bridge_add() at probe
time, so that the samsung-dsim DSI host bridge is available during boot,
even without a connected DSI device. This results in:

 1) samsung-dsim probes (and adds to drm_bridge_add() itself)
 2) The lcdif starts probing multiple times, but
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr
          -> drm_bridge_attach()
             -> samsung_dsim_attach()
                -> drm_bridge_attach()
		   -> -EINVAL because dsi->bridge.next_bridge is still NULL

So moving drm_bridge_add() allows one step further but it is not
enough. The reason is:

 * now the encoder driver finds this bridge instead of getting
   -EPROBE_DEFER as before
 * but it cannot attach it because the bridge attach function in turn tries
   to attach to the following bridge, which has not yet been hot-plugged

Solve this by returning 0 in the bridge attach function in case the
following bridge (i.e. the DSI device) is not yet present. In other words,
for the samsung-dsim bridge it is OK to not have a following bridge. It can
be hotplugged later on.

[0] https://lpc.events/event/18/contributions/1750/
[1] https://www.youtube.com/watch?v=C8dEQ4OzMnc
[2] https://lore.kernel.org/lkml/20240924174254.711c7138@booty/
[3] https://lore.kernel.org/lkml/20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-0-472b913b5cb7@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch is similar to [4] but different in code and with a largely
rewritten commit message.

[4] https://lore.kernel.org/lkml/20250725-drm-bridge-samsung-dsim-add-in-probe-v1-1-b23d29c23fbd@bootlin.com/
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index dc3ff880d7ac..6c48404fd60a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1827,6 +1827,9 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
+	if (!dsi->bridge.next_bridge)
+		return 0;
+
 	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
@@ -1965,8 +1968,6 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		     mipi_dsi_pixel_format_to_bpp(device->format),
 		     device->mode_flags);
 
-	drm_bridge_add(&dsi->bridge);
-
 	/*
 	 * This is a temporary solution and should be made by more generic way.
 	 *
@@ -1976,7 +1977,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		ret = samsung_dsim_register_te_irq(dsi, &device->dev);
 		if (ret)
-			goto err_remove_bridge;
+			return ret;
 	}
 
 	// The next bridge can be used by host_ops->attach
@@ -1998,8 +1999,6 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO))
 		samsung_dsim_unregister_te_irq(dsi);
-err_remove_bridge:
-	drm_bridge_remove(&dsi->bridge);
 	return ret;
 }
 
@@ -2016,8 +2015,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 
 	samsung_dsim_unregister_te_irq(dsi);
 
-	drm_bridge_remove(&dsi->bridge);
-
 	return 0;
 }
 
@@ -2216,6 +2213,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 			goto err_disable_runtime;
 	}
 
+	drm_bridge_add(&dsi->bridge);
+
 	return 0;
 
 err_disable_runtime:
@@ -2229,6 +2228,8 @@ void samsung_dsim_remove(struct platform_device *pdev)
 {
 	struct samsung_dsim *dsi = platform_get_drvdata(pdev);
 
+	drm_bridge_remove(&dsi->bridge);
+
 	pm_runtime_disable(&pdev->dev);
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_host)

-- 
2.55.0


