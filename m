Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55475CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRPs2WrC0muI/wJzxFtAO5Vdp4gXV01r6InSF3JVrI4=; b=G2XK636fYN9JZ0oLhcLr8x+XQR
	GTTp78x5n9WR5EqvxisPSNlzFrN1Kg7gnidaQHaiJFXL9qGQ6ueAPuiptSuh4SNn0+KzF5n2WIydw
	7xZqEGNKGBbORwtXbvYjI+B0oXSp1fVM1UTeXfqK/ft80g2C8hk6vb2yyYEZyyDm2idLg6gGjKPJD
	9xRgWNx+Uicfv3Heg05D8FZeniAsiq3X+q+5DdXj4f47RUbfdw9Hj5reh8y2d5MRu7Uen+dAWhQt3
	a50CE1+AjuRMcS+QJHCQc+8gwSuUApOMNcuOj3SfZXCWYs7qoaZ1sbYaWAPT82GaA0QLadMAeoFVn
	Ms21ATMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8U-000000096cD-3ges;
	Thu, 01 Oct 2026 12:43:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8R-000000096YX-2fEo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:43:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C7FD4E416CC;
	Thu,  1 Oct 2026 12:43:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E207160341;
	Thu,  1 Oct 2026 12:43:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 568A5103280FE;
	Thu,  1 Oct 2026 14:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zRPs2WrC0muI/wJzxFtAO5Vdp4gXV01r6InSF3JVrI4=;
	b=KsKKfvxNAhJdVk4znvFhN6vpq9lGoMCcqrZWePNRFyPQFGqLMZTCPIxOtNm4IHXp0OYGOl
	P65GhfDnpDwVwNOW+4xBqdQJ8S4PgOw8NmBuCJ+hxf80gzeYX0qXkLQd//0lSCwehdOf6o
	VaDwwS66n5At2i2t5CBP8eBfsVEv4VXbiOvXruxPHXYzL3YIM+1JwKUzdg4UNEyP70kuVG
	SNDCoiRJW0rWJYIov4CbrhtwCpzKz9VqLDICopd3ZcmoDrqCB5oOgtxx4Z4Y2OSEbxNnC0
	NlLa7DDCkyuORYQEc+TrftGArcoffVo+oWpnZe2Q38yfpFOo+s7rWg0eDL680A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:31 +0200
Subject: [PATCH RFC v2 09/24] drm/bridge: initialize chain_node list head
 on detach and attach errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-9-8e34986dcb68@bootlin.com>
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
X-CRM114-CacheID: sfid-20261001_054339_833538_6BD8A8AE 
X-CRM114-Status: GOOD (  15.04  )
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

When a bridge is detached it is removed from the encoder bridge_chain list,
but the bridge::chain_node list head is not cleared. This is going to be
problematic with the upcoming hotplug bridge support because if a bridge is
detached from the encoder chain but not yet removed, when later detaching
it the encoder code may think it is still attached, thus trying to detach
it twice.

Avoid this by clearing the list head on detach, so there's a clear and
simple way to know when a bridge is not attached anymore.

Do the same in the error management code in drm_bridge_attach(), so that
chain_node is always empty [as in list_empty()] when it is not
(yet|anymore) in the bridge chain.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cd0c246f7e99..2a112ed69e20 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -663,7 +663,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	mutex_lock(&encoder->bridge_chain_mutex);
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	if (ret != -EPROBE_DEFER)
@@ -693,7 +693,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 
-	list_del(&bridge->chain_node);
+	list_del_init(&bridge->chain_node);
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.55.0


