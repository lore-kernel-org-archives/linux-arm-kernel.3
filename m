Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB2FCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND0w8x6SjvxTQcT5Pm7Wq/sYjQ6rNdvUYUeltXYrX2I=; b=V8fdUGM9xLR0nh9E+nAZJbo+e2
	Y8jqPMb/m+rqckMUrqk70UcG61AiQm3NQkl6kWk6Z2lBXojuotlH1b+YuvQmsvevCIu3v/5PmFrau
	3KGA4X3w13/SI4TJjeqIPan5RFxDLoVUnMzLDQ+SZeNu7nM+d1+3c5zN72nzZtIN0wQKW/3ESMLoX
	9K9xuMIPLQMAFBT1whkOE9cQ2M4JVu66Qn+OqY6tbZ9cWVqPBMyj21p65JawiX5T/MmUaGtX29Ou1
	RPGCtzJkJpezteQlTo+17aL0Ec7NoEEnL0ArBQg5SDN6RnYxtcl0ueT4Fz22YtBcByNRMDyUgIC67
	rrcKm6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8E-000000096QC-2uXS;
	Thu, 01 Oct 2026 12:43:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8C-000000096NZ-1Wqk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:43:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA56D1A24E0;
	Thu,  1 Oct 2026 12:43:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC37160341;
	Thu,  1 Oct 2026 12:43:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D73901032809F;
	Thu,  1 Oct 2026 14:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ND0w8x6SjvxTQcT5Pm7Wq/sYjQ6rNdvUYUeltXYrX2I=;
	b=hjBDSF0xjz9+SLnKqtULk9L55F1t8IHF76eLE6yPLuVb+1l5WFbPCkfQjyi0qfF4PN4t8T
	KgRDk4m8eGkbk4dsTxhAcR0hZkKofIvhOfBv+MUafnzpCefoSZIBcFOFIhmCQtEV76Hen+
	UxAcEvq15ExeMRrovYIVArVwjUTFWSX+w2JdDtbqEbql6L4mhyU/y2bZ5wK28NeRM2PxTe
	oHq0Oq+41eK9MBbFHOOiQUPxitam1w3sOzAUdRxW4qeVahONucK4sa/TrhbQaepQaA7q+9
	14MV+SgjQLxz8KGH1BQ84dIpyoE9ceFiPWg7NDpoPzk7xaleqTuK3VvsDJ26Pw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:28 +0200
Subject: [PATCH RFC v2 06/24] drm/display: bridge-connector: add APIs to
 add/remove the connector dynamically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-6-8e34986dcb68@bootlin.com>
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
X-CRM114-CacheID: sfid-20261001_054324_560838_6E1BB58B 
X-CRM114-Status: GOOD (  16.06  )
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

drm_bridge_connector_init() adds a drmm-allocated connector. For bridge
hotplug drmm allocations are not suitable because a connector may have to
be added and removed multiple times in the lifetime of a card.

In preparation for bridge hotplug, add APIs to add and remove a connector
using regular non-managed allocations.

For the dynamic connector, this requires the kfree() the allocated struct
drm_bridge_connector in the destroy func. However that func will be called
even when using the pre-existing drmm API, leading to a double free
(kfree() in the destroy callback + drmm).

One option to avoid this issue is introducing two mostly identical
drm_connector_funcs instances, one with .destroy and one without. But that
would be an annoying code duplication. Instead take a different approach:
always allocate using non-drmm kzalloc_obj(), so that deallocation always
happen in destroy->kfree().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Uhm, maybe the change from drmm_kzalloc to kzalloc_obj and addition of
kfree to the destroy callback should eb a separate commit?
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 +++++++++++++++++++++++-
 include/drm/drm_bridge_connector.h             |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1c222e27767d..2a0065208fb8 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -285,6 +285,7 @@ static void drm_bridge_connector_dynconn_destroy(struct drm_connector *connector
 
 	drm_connector_cleanup(connector);
 	drm_bridge_connector_put_bridges(bridge_connector);
+	kfree(bridge_connector);
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
@@ -1184,7 +1185,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = kzalloc_obj(*bridge_connector);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -1199,3 +1200,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
+
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+
+	bridge_connector = kzalloc_obj(*bridge_connector);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	return drm_bridge_connector_initialize(bridge_connector, drm, encoder);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_add);
+
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector = to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_fini(bridge_connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_remove);
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 69630815fb09..de6ec91dbfab 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -9,8 +9,12 @@
 struct drm_connector;
 struct drm_device;
 struct drm_encoder;
+struct drm_bridge_connector;
 
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder);
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector);
 
 #endif /* __DRM_BRIDGE_CONNECTOR_H__ */

-- 
2.55.0


