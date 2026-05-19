Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B94DCD5BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+kT7vAmUewDgxn0HFnyrYRIIpXTDKvHS24hGWBZNk8=; b=MyGCbC6RrbIPwjzxx/aO/17FLK
	DRKfZ3vlzRQ/4W2FYKxVo/DnNI1AVTf3bM13Nzs/aSottngO6zZ5CBiTG5bCTLmOQgVe5nL0JrWTD
	22B1t45HoU4iKAau9ofd3bQM7SzH2FTwlrDJkzUuVEANthg2lxRI8ZzfbzTffp2YTusyck9RWCC6X
	7GnjdLchH3myRCkR2GKD8wcdy61ji1HwQPzDoz38Bn1GdjsFsQ4I8UM/3Hq5Y7t+lARikE7b3WcSy
	jRo2TTmMjPkvv8jmIFTE0wjHPXcNeEcVjSBu5QDwJcTLqnue5bJYWijH893UzC7XXSlGkUI0pHUte
	2NQ6aqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqH-000000017HZ-30pN;
	Tue, 19 May 2026 10:38:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqD-000000017D7-0POe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:38:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A984F4E42CF1;
	Tue, 19 May 2026 10:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7662D606E9;
	Tue, 19 May 2026 10:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59BD0107E8AC6;
	Tue, 19 May 2026 12:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n+kT7vAmUewDgxn0HFnyrYRIIpXTDKvHS24hGWBZNk8=;
	b=kHr+SgeMkKDgHfFsBa+jwf3WSU+g6MmNk/Zd47ZGKQzMTxsmVgm/iEanabVx+q6IT7wS0q
	tMk6l552cVuw6bofUI3j/qxXtUyAQUwE8HwsbE3LJV/782dzziRnN/lSKp5NGTs2eA6tdp
	R7bG0UYPTZyhpM8dIFLPDM2D7bMSJYmYVpMmAkGKqA7UEGTyd4EeTM1FYjnHCghdQD5c5G
	liZfh0xicJEwiqBL2kvDWQxavhLJnP4Sfzz3nbkEcjyp1hHIgHCRz5I2bXKLPHFbhM3mNF
	i5uWNB0i/MKl37Itesk4hc+40tgMtRg5nYbL4CoEX7ORJVQ6yq/M3s9EjVfo0Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:21 +0200
Subject: [PATCH 04/37] drm/display: bridge-connector: store the drm_device
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-4-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_033825_272156_ACBF0713 
X-CRM114-Status: GOOD (  13.10  )
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

Currently the struct drm_device pointer is only needed during the initial
drm_bridge_connector_init() and in drm_bridge_connector_handle_hpd() which
gets it from the struct drm_connector.

This will be insufficient when introducing bridge hotplugging, because:

 * some of the actions in drm_bridge_connector_init() will have to be
   performed later on, when a bridge is hot(un)plugged
 * the connector will be removed and re-added based on hotplug events,
   so the drm_connector might just not exist or its content be cleared

Store the drm_device pointer in struct drm_bridge_connector for any later
needs. Also convert drm_bridge_connector_handle_hpd() to use the newly
stored value.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index bf9b8a6bca78..62c4cb1e241f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -60,6 +60,10 @@ struct drm_bridge_connector {
 	 * @base: The base DRM connector
 	 */
 	struct drm_connector base;
+	/**
+	 * @drm: The DRM device we belong to
+	 */
+	struct drm_device *drm;
 	/**
 	 * @encoder:
 	 *
@@ -157,7 +161,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *bridge_
 					    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &bridge_connector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = bridge_connector->drm;
 
 	mutex_lock(&dev->mode_config.mutex);
 	connector->status = status;
@@ -806,6 +810,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
+	bridge_connector->drm = drm;
 	bridge_connector->encoder = encoder;
 
 	/*

-- 
2.54.0


