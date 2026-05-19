Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56B3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPnXnL28rnew1q1eDqo7jc72bZYvB4PM1bXhy+LViR8=; b=yyXQGMC9UEc+G8vHo1eX3UToXB
	ol6E98MVcuVZc6YmQLmRW4JWiBD3RzCDV2R2r1JamSHIVZQcrB8PdSEpcYth1H9uG/TZQapOyWqU0
	/g0sHLQflvXGKbZiPHN/XUF+M3ePs+xRVIzS2lflV3Ofb0HfhYEbXNBLjf6lX1fEHCRRZjPkp52ct
	CelgjFjK+4Esl8fbdI7my1R1Rt1FZh3pRcYBShgYEczA7Thc4+wxFiqURX6JNJ+UWyJmDAmZcAfo/
	6Ea+RnjIJnI/fUUGywd+PSFcTr5pi0GjzxW3GUWTZApIVuxynvbkUm4IkluHX7t79QFuxwoeeuyx9
	0louNQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHs2-000000019Qa-0Wlr;
	Tue, 19 May 2026 10:40:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHry-000000019LX-1tl6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1501E1A3629;
	Tue, 19 May 2026 10:40:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3401606E9;
	Tue, 19 May 2026 10:40:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AA2D107E8AE7;
	Tue, 19 May 2026 12:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XPnXnL28rnew1q1eDqo7jc72bZYvB4PM1bXhy+LViR8=;
	b=xIWpGSJc3I8LET6EbkDG+Nla5ohZq8g8XGvlTlC07NzLdPwZGXhp1zST0RdzD0veUGtI4S
	swuJhpmqt27iNxEG9ucGtb3qbiUh+/+Q75tNRTdED/VgMgv16qHq8Wq2H703LS1W1euRFB
	jAx6EIvItpAPEFP+ZfGO2wvKcc6oahowivGxMUSWP1R6Zf96JcUO9fkUvnP54/vuiqCDDw
	xZkOCZx3yJrXJLK2zytWtiuN1keBO9My/He1vAIFhcMzEmIEo70kF7vtIQ/LRUM+Y6F1ZU
	Dha7WXg6MAOJozjGtVdjwVnUBqnJczTXe7jLji9m/SCxFpQivb2XeEVhle7kxQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:46 +0200
Subject: [PATCH 29/37] drm/mipi-dsi: notify about DSI attach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-29-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_034014_646960_CA51A9FE 
X-CRM114-Status: GOOD (  10.36  )
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

In preparation to support DRM bridge hotplug, let the drm_mipi_dsi code
emit an event when a DSI device is attached to the corresponding DSI host,
so that this event can trigger the actions needed to deconfigure the
pipeline and unregister the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig        | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3093d5f30724..288845b6621b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -45,6 +45,7 @@ config DRM_MIPI_DBI
 config DRM_MIPI_DSI
 	tristate
 	depends on DRM
+	select DRM_EVENT_NOTIFIER
 
 config DRM_KMS_HELPER
 	tristate
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3ac1dd5ad640..eaa474da4a51 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/drm_event_notifier.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
@@ -386,6 +387,8 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 
 	dsi->attached = true;
 
+	drm_event_notifier_notify(DRM_MIPI_DSI_ATTACHED, dsi);
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);

-- 
2.54.0


