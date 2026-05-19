Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCF3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGMsYlYt9mcY7NwGwKaGJYaOC5KWQAxBqwt/f2CcMdA=; b=HyDOf0A7UESKsZ67zVspDo7nVC
	zuM4i97YVaSFKUw3zfWwNxNaO7bRVBtmJzckZDtEApegchkSrbGRBjA8IpF2ZSX8UHzCYVTuJDvwh
	P8BGM1XNZNMdJ+FBNFuK2Z3p117/A8qcZymEi1W7cxQL1EIQbUDT9Du+2qfB89kBIyPcneMLK5fmL
	eW2oQmlo6nqkTX0T9qpH4BlUpzt4QLyo9fl5amaHronnBpYpw+Gl8bzM/4eufglnYqt7CNK4dXNR2
	tdc9NOY5cukKOxmTyjyhtSiK6Oj8swv4DSGni6KByo6qfZI+Gx/y7cIMlZvMn08a7mAfWSv/BYI1f
	d2JpcFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqX-000000017XA-2N5b;
	Tue, 19 May 2026 10:38:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqN-000000017K9-1Df3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:38:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53DD6C2B9E5;
	Tue, 19 May 2026 10:39:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A329606E9;
	Tue, 19 May 2026 10:38:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E1EB107E8ACA;
	Tue, 19 May 2026 12:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pGMsYlYt9mcY7NwGwKaGJYaOC5KWQAxBqwt/f2CcMdA=;
	b=J0EO0XJfuiOfRnAq8HMXUUMSgfogKn0SYvWGsY1bBlP4dK4F6wbQsQzoXWuD9nMNm0sPwt
	C4C7T6/FRsSvoxtE3Qg2Xzr0qBZ4J5taiALqLJysPU1Pmt7hhXUheAV029REJ0Bd/VP9XR
	VC7nwp6+lAfA4iLCES7ENAYrqs0tPlVC7Nb17FF86L0xzevNKe735Wc3MGyzaXDh6wmGn1
	+Mrv7hem3dPmr8XrIK08uY6oVQ7KKSW7SI0xyUjnzZUN6h70EiOTEZar9Bjn+36LBHgeRj
	pC5U9faLWhg8Lz6WFaNN+VOriV4brh0RJyGf9mmK+CEtD7DK9iLRPOXCqLtVaA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:23 +0200
Subject: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_033835_535828_06903970 
X-CRM114-Status: GOOD (  14.31  )
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

Currently drm_bridge_connector_init() always returns the added connector or
errors out. When adding bridge hotplug the bridge-connector can be
successfully initialized without creating a connector, which can be added
later when the pipeline will be complete.

For this the internal function drm_bridge_connector_add_connector() must be
able to return a valid drm_bridge_connector even without any drm_connector.

In preparation to support bridge hotplug, change its return value to be the
same drm_bridge_connector pointer it gets as input, or a PTR_ERR.

No functional changes, just changing an internal API.

Note the return value could now become an int (0 or negative error) because
returning the same value received as input does not carry any added
value. However this would be change a lot of lines, so leave such change as
a future cleanup.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 6813c6008985..eb1912611cd6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -780,10 +780,10 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
  * @bridge_connector->drm and @bridge_connector->encoder fields are
  * assigned at least)
  *
- * Returns a pointer to the new drm_connector on success, or a negative
- * error pointer otherwise.
+ * Returns a pointer to @bridge_connector on success, or a negative error
+ * pointer otherwise.
  */
-static struct drm_connector *
+static struct drm_bridge_connector *
 drm_bridge_connector_add_connector(struct drm_bridge_connector *bridge_connector)
 {
 	struct drm_connector *connector;
@@ -1049,7 +1049,7 @@ drm_bridge_connector_add_connector(struct drm_bridge_connector *bridge_connector
 	if (ret)
 		return ERR_PTR(ret);
 
-	return connector;
+	return bridge_connector;
 }
 
 /**
@@ -1086,6 +1086,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	bridge_connector->drm = drm;
 	bridge_connector->encoder = encoder;
 
-	return drm_bridge_connector_add_connector(bridge_connector);
+	bridge_connector = drm_bridge_connector_add_connector(bridge_connector);
+	if (IS_ERR(bridge_connector))
+		return ERR_CAST(bridge_connector);
+
+	return &bridge_connector->base;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);

-- 
2.54.0


