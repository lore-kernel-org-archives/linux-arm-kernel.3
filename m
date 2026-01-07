Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BD0CFD626
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBLw2S40lXZsCWRUXlFPSLF7ZKeEpxdBnBHyiWpX8NM=; b=1tdm+vHYqejwaFtwiYD/HO/MSJ
	3RB8u4D1fToJu/qAXn3E3Z3CDeGgfC7KTyQZAeKOkQK6OdMF97bn5XHvrOL6NDK+6En5LmFvi4pUd
	sFJeXyVg9kYAsq2yWOfeu/Sm0qAJiS80pcHmzRaTa1DduXXtTukZ86sdquiYERbAUWmSqznvTNL7A
	liLQgahYwUdyCzQrz8c+HNSXC91jzSG4yJe7z+9wYA/l183oT7ouW0HYbD6/cLG1Cn17zSxjk5Zhw
	M/R1Td/XO7CI4n/TW9K/5eDtzkqQNymv7OPJddxcrpLmab2njHAVhrTNUDgvATYZ5LN2giN8gKBb+
	Cpchbfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTM9-0000000EyGV-3h3r;
	Wed, 07 Jan 2026 13:13:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTM6-0000000EyEd-2Pnh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:13:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EF2A8C1EC90;
	Wed,  7 Jan 2026 13:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16CEC606F8;
	Wed,  7 Jan 2026 13:13:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55DC3103C8740;
	Wed,  7 Jan 2026 14:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PBLw2S40lXZsCWRUXlFPSLF7ZKeEpxdBnBHyiWpX8NM=;
	b=kHzad9vXzEwUE2BmbEnu0SjASKxFslKat9qDMqZAG/D+JHO/BN7FnI2C9e0nNVyMaAhV4P
	FrJ6PAOr3k9W8n5jcyOQR3xgO1a1QhCPkTfEDtJEOPQq0wijrfNyHqoyhPy00rxaZgOhvM
	QQd+OK3QKtydqgwOdYdv/hDsIS95rvJjsYT1hVWCVNAoocYOkr+R0linDC9XfV7/0tZff6
	8k7vdPTqKpss2Pa0q/o3YtQUJ7xeR/Y1dXGLH8OEI4KLBsxrlMVXSDyBTTzxYssRvKJ8eY
	IhkFCaGyEKNBgjHHM4OlMKCJUC5KWEPCpRjTMEm7ranXbuVaMmNzcQgDo5Po8Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:54 +0100
Subject: [PATCH 03/12] drm/bridge: sii902x: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-3-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
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
X-CRM114-CacheID: sfid-20260107_051342_759784_BF138CCA 
X-CRM114-Status: GOOD (  11.41  )
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 1f0aba28ad1e..12497f5ce4ff 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -175,7 +175,6 @@ struct sii902x {
 	struct i2c_client *i2c;
 	struct regmap *regmap;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
@@ -421,7 +420,7 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(encoder, sii902x->next_bridge,
+		return drm_bridge_attach(encoder, sii902x->bridge.next_bridge,
 					 bridge, flags);
 
 	drm_connector_helper_add(&sii902x->connector,
@@ -1204,9 +1203,9 @@ static int sii902x_probe(struct i2c_client *client)
 			return -ENODEV;
 		}
 
-		sii902x->next_bridge = of_drm_find_bridge(remote);
+		sii902x->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 		of_node_put(remote);
-		if (!sii902x->next_bridge)
+		if (!sii902x->bridge.next_bridge)
 			return dev_err_probe(dev, -EPROBE_DEFER,
 					     "Failed to find remote bridge\n");
 	}

-- 
2.52.0


