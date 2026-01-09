Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650B3D232EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMUIcmX1ssvYnvOCBSl/fsdMgg8W5jXv5tr1P/C0UEk=; b=QIXHEdDbMDL1W17z4Ha0vSAk4Y
	fEdMdvEpkfYoh+jd5HvtPHHONy7U+PfciInc13wBh73Cu+MEzrLsFgiOkcrvs95EhwIHGbOvlNSpV
	yoY/CK9zmdIYhFZj2TL9XriNSuLfuMKgtinUDEXMrSV2GIgmdBcSiC5ftQsIzofPPn2e1VXSlQYEe
	6b7kmidqGPR1NCYHLpKCM7AfgIHamGvNVtSwI505NKpXneYE7BdQyePhsqViYrOg/br+UlubIvjVH
	BRDefaEZBrbCfIWxddF7ACcvogwN1sesjp0FV1IZ3dU0deJxV2qqNzX63IpWeW9JMRfKMwvrp7LPt
	8ms27E7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6ye-00000001jHC-2Xzb;
	Fri, 09 Jan 2026 07:32:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yY-00000001jCe-0c1h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:32:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B888B4E4201B;
	Fri,  9 Jan 2026 07:32:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CD3760734;
	Fri,  9 Jan 2026 07:32:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5A6C103C881F;
	Fri,  9 Jan 2026 08:31:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMUIcmX1ssvYnvOCBSl/fsdMgg8W5jXv5tr1P/C0UEk=;
	b=iGbPeTtFCVzJVQ6tozr5mnARxFxazh+jedm+A1PS86TzzTDjfxP99pLlPgw/WahU3TlG8a
	FSP6f0gGNfM8KzqqAudm0ZbEN8AMxkWBpsWnmprHXfdTPIVk5cjpqG+VqjEM8dxo7qWyw/
	T1n3dh2qJTLwRq4haP4FK0wXoDFEHhkES8onZBbM5kzhO6KQ5b7QMBQjt2C9urOXCgJEl3
	w8447TOw8hlu314rpF+DqDMUb5pwXacWEPp0HslEDOwA4ofD20+THJmH543Sv8KkykeRAC
	dhzm1WtI1IeJb8fdYV61C0NRAHW+h5wOcMjYphEBuPiLGeNyh2INXctXcN4r/g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:35 +0100
Subject: [PATCH v2 04/12] drm/bridge: thc63lvd1024: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-4-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_233203_434594_3038B8FD 
X-CRM114-Status: GOOD (  11.74  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 2cb7cd0c0608..c804222846c3 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -32,7 +32,6 @@ struct thc63_dev {
 	struct gpio_desc *oe;
 
 	struct drm_bridge bridge;
-	struct drm_bridge *next;
 
 	struct drm_bridge_timings timings;
 };
@@ -48,7 +47,7 @@ static int thc63_attach(struct drm_bridge *bridge,
 {
 	struct thc63_dev *thc63 = to_thc63(bridge);
 
-	return drm_bridge_attach(encoder, thc63->next, bridge, flags);
+	return drm_bridge_attach(encoder, thc63->bridge.next_bridge, bridge, flags);
 }
 
 static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
@@ -132,9 +131,9 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 		return -ENODEV;
 	}
 
-	thc63->next = of_drm_find_bridge(remote);
+	thc63->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
-	if (!thc63->next)
+	if (!thc63->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,

-- 
2.52.0


