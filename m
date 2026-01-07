Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC67CD5824
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kg0Uw3LRVfNHDM/aCR6pFV93DPSIETQ7K2PCrzE/Fng=; b=g5VL9HDB2QEHcmNkFts+7Z/GW2
	WCr8rnMZKpKbOZonr3rFA9vPmehfTVZeCUTrCCcBn2Q6Y4G7GPj2c++4d/NN7VrOdHjeeOi0Lw9iL
	MRBHLm0JdIQF81VpOjnPfnrXcrr2KsNAl+LSpXR0SCIyrR8PQckrQpllO2hSr1KKoatA2vBYFxDkO
	+hzQU3iazL4ue/9i6vZaVT00tO6zRL7Msz5F2cmLcoHdvkdwXDJXmFYhlRRHYD4VWuufFI0Hovw4G
	L2Gd0xVmCh6fYzvQmP1sZe3sF8Tn2iuYt08GVGEOolz7vQyazN1TRqb728wFkzOmQLMOfFmE1/zQd
	bthSzLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQHv-0000000Ec5x-0eAn;
	Wed, 07 Jan 2026 09:57:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQHs-0000000Ec3o-0vlI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:57:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E60371A26E2;
	Wed,  7 Jan 2026 09:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9C0960734;
	Wed,  7 Jan 2026 09:57:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FDB7103C8715;
	Wed,  7 Jan 2026 10:57:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kg0Uw3LRVfNHDM/aCR6pFV93DPSIETQ7K2PCrzE/Fng=;
	b=rYnPVNBLZYpCqpKk3jfP1C3fIOxJbc/uPxJX55MAzfCVcUAF77Qrt4M2/TvzAWre2/cnZH
	MxSmRRIqTSTX6PhkXPJTIJ8jqIWDdsUFh0TyORZ+P11SCsV6OieT7s06IFrjYOhcwH0WqT
	zFM5Td2WtFhW55sH6IcW/tbGANs+v/ULB233DgjC3N2leYIMVdxel4qyZ8EcSO3kTpaAER
	B7yhRtvSuFGf1e3hLaOCINZuZuwY6NuOEN/ISSUfkbhNjFGJrvY2ygzdAMjVA465fVAXT4
	77PvsXWkeC6vngnMed0PIEotNVrEGjwp07xyB0OoE/aohRu2/6pAEIJ8MzAT/w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 10:56:28 +0100
Subject: [PATCH v4 3/4] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-3-a62b4399a6bf@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015708_397938_CF8C52DD 
X-CRM114-Status: GOOD (  14.27  )
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

In preparation for using bridge->next_bridge, we need to ensure that it
will never contain anything but NULL or a valid bridge pointer. Current
code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
out. Instead of fixing that after the facts in the caller, change the
function to internally set pl->next_bridge and just return an int error
value.

No functional changes.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 0c5ed06eee1b..91e4f4d55469 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -256,8 +256,7 @@ static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl
 	return imx8qxp_pixel_link_disable_sync(pl);
 }
 
-static struct drm_bridge *
-imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
@@ -282,7 +281,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 
 	if (!found_port) {
 		DRM_DEV_ERROR(pl->dev, "no available output port\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
@@ -300,7 +299,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
 		if (!next_bridge)
-			return ERR_PTR(-EPROBE_DEFER);
+			return -EPROBE_DEFER;
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -311,8 +310,9 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	pl->mst_addr = port_id - 1;
+	pl->next_bridge = selected_bridge;
 
-	return selected_bridge;
+	return 0;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
@@ -368,9 +368,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge))
-		return PTR_ERR(pl->next_bridge);
+	ret = imx8qxp_pixel_link_find_next_bridge(pl);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, pl);
 

-- 
2.52.0


