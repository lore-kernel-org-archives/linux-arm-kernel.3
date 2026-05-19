Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4B0CD5BA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hruhb1ZCQ/MBija+fhFHFu8qDzgA34c2IABg7xr74FQ=; b=23dN79jzp05brpejCs/nnrQ0Yo
	hrD8C0PeWb5cgz7ooUFqSilme9WUHUJmkgOf0nOki9/j1pMuLGIn9We9QjPYegVZ123jv4LfM7oFk
	nq9cmX11jU/J7AcjbvEKOIzyPlAYC5e6/RJ10owKv221hyn9PUrcq6ahYRIgHfabZIzgVoEg98rVR
	hPtaTCWcqWzNLuilraS6rQ0kKl4nKMw8kO3FmPNfWxBhgfPx6vaAkgWFXaqOSPz/XQE3icsXyhQX7
	4aepLjqifRCx1t9wbDLPePxiV8GbN5XzgdPb1jOB4nIswBCiJl9OvGsRupsOLQ3GbgVFdXv6fS40g
	FbaNo5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrH-000000018Wh-35Wx;
	Tue, 19 May 2026 10:39:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHr8-000000018J8-1eqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:39:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9E23C2B9DB;
	Tue, 19 May 2026 10:40:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9D18606E9;
	Tue, 19 May 2026 10:39:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8938E107E8AE7;
	Tue, 19 May 2026 12:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hruhb1ZCQ/MBija+fhFHFu8qDzgA34c2IABg7xr74FQ=;
	b=B8IVN01NRf+lvOHxqOAWPpYJOgdPVyJMoN+pKM3crUPNsOwQ6/0jMT/Ug4Nebna24uoapa
	mtDelWsbPRs9BYKYo8+M24XUYWPeBUDjJUvlGvhex4UeR6lRjMVjN9saKY2tZ9mEy15VVu
	lynCgYEA6tVoVMJm2bBGpMjQjEfVcE0tqyqpn+tpghSSy7kZeAN10ZTRFNNi6q0iDANvbx
	1n641SLj8gnd8VgQ46kfjal6Z6sEJt1e7UFwyj3mRVLK+QbgjkR4xCR0OO/rmcVAOfVA5s
	WryYGacIJ8LUCHaIKH2+oKLeLKLaVzB0+qGE2E3MqGh0PqBOzbOjWTwDR0W3vg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:34 +0200
Subject: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_033922_624082_EBFDF9E6 
X-CRM114-Status: GOOD (  11.71  )
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

Bridge hotplug will make the connector dynamically created and destroyed
based on hotplug events.

In preparation for that, add a mutex to mutually exclude connector creation
and destruction.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index bd421b6beb7c..b83da529cc7a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -152,6 +153,11 @@ struct drm_bridge_connector {
 	 * @dynconn: The DRM connector added by the drm_bridge_connector
 	 */
 	struct drm_bridge_connector_dynconn *dynconn;
+	/**
+	 * @dynconn_mutex: Protect @dynconn from concurrent creation and
+	 * destruction
+	 */
+	struct mutex dynconn_mutex;
 };
 
 static struct drm_bridge_connector_dynconn *
@@ -810,6 +816,8 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
 
 static void drm_bridge_connector_dynconn_release(struct drm_bridge_connector *bridge_connector)
 {
+	guard(mutex)(&bridge_connector->dynconn_mutex);
+
 	if (!bridge_connector->dynconn)
 		return;
 
@@ -1050,6 +1058,8 @@ static int drm_bridge_connector_add_connector(struct drm_bridge_connector *bridg
 	int connector_type;
 	int ret;
 
+	guard(mutex)(&bridge_connector->dynconn_mutex);
+
 	struct drm_bridge_connector_dynconn *dynconn = kzalloc_obj(*dynconn);
 	if (!dynconn)
 		return -ENOMEM;
@@ -1177,6 +1187,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&bridge_connector->dynconn_mutex);
 	bridge_connector->drm = drm;
 	bridge_connector->encoder = encoder;
 

-- 
2.54.0


