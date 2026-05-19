Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F07ACD5BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRIgFduSx5LrCBKqsod6YR/tv16FPuPFSGj6OkltIK0=; b=bUoFH+2X0mOuJ62wpg0d5Sudh0
	M8tfK8fmu5TCXa4dZrP+oFyY4J56YQmYNDHB4VGO/lFwdmR6QlZw5ojxczNREgzEZkdjBYFkf43xX
	RHEdzl6Mn9+RQA0OdUvZWm9e3OVSEArYmhOVlhTUT8nSYnQH+nAAdO5F1UgTcsCvk7RC60T4q9yBA
	hVGCNZwHS0UgBLt3rQXw3Hp+koLuvvif6FsvDqti4XxRr7ranTdbmloMPwLgTerxOicju6Pj9syv5
	oNF0sxGkxOprxsD9HTO/OYUcs0Gz2eDLIMBChv0tbqK4AFWraF8pyODkbJEo6SkJwg8VEYLRhgtg7
	aM50qe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqA-000000017CA-2M2f;
	Tue, 19 May 2026 10:38:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHq8-000000017AG-0WAH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:38:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB4581A3627;
	Tue, 19 May 2026 10:38:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88012606E9;
	Tue, 19 May 2026 10:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6BD107E8AC3;
	Tue, 19 May 2026 12:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fRIgFduSx5LrCBKqsod6YR/tv16FPuPFSGj6OkltIK0=;
	b=fl4SN8gAWvj/PAiytK2mcEd2traVpn5cG4m+z9kQKTNCNDfgWVHadA/ResQaAPMBDhSf2a
	2fcKYgI8FG4j2mS/8mivgiNk2FGbRzn7YJhQ/FYmvJTAtl9MlKS9Azt+aY7Z5WYYPYF6iA
	6y1j39oW/ih8WimyqqcBX9t6mZwHjaeV81Xv58upXqf3DR1ufWU4A8hi1rpEnepdec3/zi
	sOUhea5qCZrzitRgzqn5ugyewn87IguREaVbkLxu+iI+X9rk+5wmp/wa5Yh6cSZIZkCbRk
	DvmhUpAML1cXNeCUw/gYfGdVZj01oNQwMsqGO6OBLdrB6kdyPCYZEocOYFhJ1g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:20 +0200
Subject: [PATCH 03/37] drm/display: bridge-connector: rename variable for
 consistency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-3-45e2bdb3dfb4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260519_033820_726186_D3B40349 
X-CRM114-Status: GOOD (  10.38  )
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

All struct drm_bridge_connector pointers are called bridge_connector except
this one. Rename it for consistency.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..bf9b8a6bca78 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -153,10 +153,10 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	}
 }
 
-static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
+static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *bridge_connector,
 					    enum drm_connector_status status)
 {
-	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_connector *connector = &bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
 	mutex_lock(&dev->mode_config.mutex);

-- 
2.54.0


