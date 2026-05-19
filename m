Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A26CD5BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a85Cizij9kXPn9Kt9sHvek1PwQkqP3FwMIAwRQz/a8o=; b=WnoVOlMvlsDAP79wWNfaQE5BUt
	1XBz2r06fF5/PQnR0TfHq4N+G4sHfDl/+7zLtSILXOjTw2tpNxIs9fJ6s89ECWY/Qo5gJwb1KUCEo
	iCaq195wZ+QzJothJJXB58OOLt7UOOlSPQbTYDtU+Q7li/adKo11POYXYRTajsx0UpDwTgK33kxAV
	YPbOFLEjmJCZqnCQb79xz4GldbdY4n3fYoGYHebrEeKxlCdmO4WOeVsbRhiD005/AobuWREO5V9pG
	4kGdX0h3phlNkegXqz/JCAjIEENUjzV27r7+KkVNjxgLoNKOGWXOj/m4fHMmSu00QHEiQ5h4R+Kkp
	7rEGT5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsy-00000001ATz-0mSR;
	Tue, 19 May 2026 10:41:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHsX-00000001A6T-1xuL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DCF12C2B9E5;
	Tue, 19 May 2026 10:41:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1F81606E9;
	Tue, 19 May 2026 10:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 765BF107E8B03;
	Tue, 19 May 2026 12:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a85Cizij9kXPn9Kt9sHvek1PwQkqP3FwMIAwRQz/a8o=;
	b=Z4gYPq7Q2NDsQG86vprBtBK5lBZtFpPE0bbnPnYGs+sZFFnP+Mx3El6bvsqAlrqEDPrXvG
	Bc6deDtultuXkpkS+kJUU8sSQq/k+pG0sItxEciHnatzT1rMygUpHH1JVeKOaP0J1Wexc/
	g/d4eNtw/H9oBJkG//mVXKZR/uVaCRtS8RAQ6qfLnFu5XaZyAtgT35XTgHuW9ibLocjq8R
	pLWk+i1KMpk9BL78GCZHLpZLA92njKTPr83cHZVLYHUtWgj2WPuCeG7b3LNkUMTb54/Jok
	3p/XrWjvtJaaf8BMe3w6qRFOoMGtCEbNgAY6cjGIIP5pqupG/gqzbwNnvMRT4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:54 +0200
Subject: [PATCH 37/37] drm/mxsfb/lcdif: enable bridge hotplug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-37-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_034049_892651_DC3D7F01 
X-CRM114-Status: GOOD (  10.07  )
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

Switch to the new drmm_bridge_connector_init() so the drm_bridge_connector
will handle bridge hotplugging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e2173c4d6fc2..0a7c197dbc1e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -58,7 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		struct of_endpoint of_ep;
 		struct drm_bridge *bridge;
 		struct drm_encoder *encoder;
-		struct drm_connector *connector;
+		struct drm_bridge_connector *bridge_connector;
 		int ret;
 
 		if (!of_device_is_available(remote))
@@ -94,9 +94,9 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
 
-		connector = drm_bridge_connector_init(lcdif->drm, encoder);
-		if (IS_ERR(connector))
-			return dev_err_probe(dev, PTR_ERR(connector),
+		bridge_connector = drmm_bridge_connector_init(lcdif->drm, encoder);
+		if (IS_ERR(bridge_connector))
+			return dev_err_probe(dev, PTR_ERR(bridge_connector),
 					     "Failed to init bridge_connector for endpoint%u\n",
 					     of_ep.id);
 	}

-- 
2.54.0


