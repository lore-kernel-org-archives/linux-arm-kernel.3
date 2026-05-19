Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F05CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXzXfL976Jh5LzLUVnfB4dSuaOKmXeLa4YHSSt3GjME=; b=bxfUrqX5Trt2XCQR7e/pb3wU7e
	rWcPxAR77909NnmEyv7+e+nxopnhoZGrJo/MV9TPIL5d3oQBTJL6PlsUVBOSwINQkqTuaOzXQtm6g
	HPYtQSRvF9xeXkJRj9sxuQUvKC0M402MyhGc7yrBtKDxi46Li+Fr4TSOQ/b5mVt88TGQxgwRQBDyS
	jsK/AWGBCpN4pmwv7KLufdDIya7iJOcry+1CP/8rkAkCgAAm9oqr6TWbbo4xEptMOxZT5ctciRSIy
	QjOVIKZr7hynpqWuan8Lse4juuwELsxS9DKNtqaBHj77jzgSbk4agd4X52QWjdzNZYBkAGymHpPVZ
	ebOK7trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHr7-000000018K7-333D;
	Tue, 19 May 2026 10:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHr5-000000018Fx-0Jz2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 10:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MXzXfL976Jh5LzLUVnfB4dSuaOKmXeLa4YHSSt3GjME=; b=cKf07wNvZtIymDwERBnK7R2rnT
	b5kfsHl27E4GHk/JBy7AxhWC6KLNlXhcboKhtZgfw5JJ5P8xpg66t4osGQNx/OXCREwFhDpBLpTHG
	yY1AMSwsaTw9qKxepgWLG6kjjSwkAixlP/rQNgDRaobemH/ABOkweOlvACNYcveYlxH3LzFH6njGz
	Q9+ny1IJDLll1mC/U3ZGoDhg8qhkvZbOI8F3K0B/VEmvMa76MpQc4KEy5DdWqtP7ordlVQhpD3pVv
	+6+OcPRzdQIe6lORiJ+uOAW9xr3EeTnJvE+G04Ur5DdI5rbdpKNjDRNeY0fu1nO5lUbEg7nhTfa4m
	Ob9YHbgw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHr1-0000000DuCk-2HWU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:39:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2BB51A3628;
	Tue, 19 May 2026 10:39:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F33E606E9;
	Tue, 19 May 2026 10:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9ADA107E8AC3;
	Tue, 19 May 2026 12:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MXzXfL976Jh5LzLUVnfB4dSuaOKmXeLa4YHSSt3GjME=;
	b=mvr5e0VVd1QTAoTY4anq7bRyw806/vu0HCW5SbK80z86N8zp0Mfl3BqaF33jMA/doGTFo5
	k3U0N0lmciuV/30HYvH2FXk/QJy/2fDqpN0rCSVyB3+/xpy61VRFQOdjDyYq/cViH9MVqL
	HXAfdtuT9GVGvDqMMJEJD8NFWLOWa8GI5ApFLC6gtc6pN8/RbfIKt53lJQHkA2NM7H7pF1
	PsaiVu3x4XZebT/g5MQ3GL2l3wnHvFc5waYJRTdeqHYemx/Pb6QsVfhq0fAX5ab4CpxLVn
	1BzgrKx05o/youqmRQi2Tar7gFmUpG3RH32mTBh+EAxIwlS51Ox3BralXNDE6A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:31 +0200
Subject: [PATCH 14/37] drm/display: bridge-connector: add non-drmm variant
 of drm_bridge_connector_put_bridges()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-14-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_113916_350421_3CF1BBC8 
X-CRM114-Status: GOOD (  12.67  )
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

drm_bridge_connector_put_bridges() is currently meant as a drmm cleanup
action. In preparation for bridge hotplug add a non-drmm action, so it can
be called more simply in non-drmm context.

To do this split drm_bridge_connector_put_bridges() in two variants, both
doing the same actions and only differing in the name and arguments:

 * drm_bridge_connector_put_bridges() (same name as before) to be called
   directly by the drm_bridge_connector code with a drm_bridge_connector
   pointer as the only parameter
 * drmm_bridge_connector_put_bridges() (same name + drmm prefix) providing
   the same drmm calling convention as before

Update the only call site accordingly.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 2e96af8efb55..1fd104f1647b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -140,10 +140,8 @@ struct drm_bridge_connector {
 #define to_drm_bridge_connector(x) \
 	container_of(x, struct drm_bridge_connector, base)
 
-static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
+static void drm_bridge_connector_put_bridges(struct drm_bridge_connector *bridge_connector)
 {
-	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
-
 	drm_bridge_put(bridge_connector->bridge_edid);
 	drm_bridge_put(bridge_connector->bridge_hpd);
 	drm_bridge_put(bridge_connector->bridge_detect);
@@ -154,6 +152,13 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
 }
 
+static void drmm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
+{
+	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
+
+	drm_bridge_connector_put_bridges(bridge_connector);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Hot-Plug Handling
  */
@@ -1099,7 +1104,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
+	ret = drmm_add_action(drm, drmm_bridge_connector_put_bridges, bridge_connector);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.54.0


