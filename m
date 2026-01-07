Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040BBCFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBqUSZHP9faWTOajqmUZYb1s0xdbzsuq/IoY2BwG7wg=; b=ONYKFrjezxSs8YlKy21TN8P5Qk
	dU3hvl644k7uXq/izTlNs2/GyO2h7x1Nsq+Bt1W6tBFxYOMOSGdzzAZC6MaQnmeDfIMhH2hxU15kv
	/u28h3K9vOOnEdFzm+3ZHxnWSi1eq6Yux2+yGEUxi+GIW5PqbclpigUVxYrXRs9XXpMg4kq1udgEL
	ybRBHhej6ZGW4gwLyaT3W/6NUUVu6L+F4yY0Dn/BdpLssi1BZsaglmq6ePOKGvZN+zf7l5FvsXJCu
	4n+Qx0sq2SK/0sfNEnChY/YhoJPzq7KybrP8zdmNJE/shpLqHwJ4BdHfl8qv9QmBL2kXfOsvgxmkD
	otQIP0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMd-0000000Eye3-1SHh;
	Wed, 07 Jan 2026 13:14:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMb-0000000EybG-1dP5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:14:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD55B4E41FDE;
	Wed,  7 Jan 2026 13:14:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2687606F8;
	Wed,  7 Jan 2026 13:14:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80936103C8740;
	Wed,  7 Jan 2026 14:14:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RBqUSZHP9faWTOajqmUZYb1s0xdbzsuq/IoY2BwG7wg=;
	b=umQzvQVNUyRPS5y24EHZZCJXGxuMgt0642mKmxUXB3y5Sj0BkjvtYs0fk/IItPAwaqaHJw
	CfaZS1ynKbR0Mu7BixQ6QT3drbM9K8MsK202+MIvpbKadB62+ccfrmJ5EhY1M7dbsZQwio
	V2iTg3xkRt8E0/PGd3K3KGjrvzhPIKthtTCSmk4381g9U+MZGLNk3x6WQNJYT1cXXdsqf9
	GIRuLvxBxHgfcNAlRouxvK+q86uA44tjBZoMDWbdk3+4d3Mx5+u8WqD3rjn20n8p/RPcIq
	4awG2rTD5N/kyJk0WD8sxxDvfLHLkfv55sr0tMFyxSjxJ828grX4UdEMAONqRg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:13:01 +0100
Subject: [PATCH 10/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach:
 use a temporary variable for the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
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
X-CRM114-CacheID: sfid-20260107_051413_571795_B354D74F 
X-CRM114-Status: GOOD (  14.01  )
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

In preparation to handle refcounting of the out_bridge, we need to ensure
the out_bridge pointer contains either a valid bridge pointer or NULL, not
an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
redeference an ERR_PTR.

As a preliminary cleanup, add a temporary local 'next_bridge' pointer and
only copy it in dsi->out_bridge when returning successfully.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eabc4c32f6ab..b3003aa49dc3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1886,6 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
+	struct drm_bridge *next_bridge;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
@@ -1924,17 +1925,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
+		next_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(remote);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
+		next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge)
+			next_bridge = ERR_PTR(-EINVAL);
 	}
 
 	of_node_put(remote);
 
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
+	if (IS_ERR(next_bridge)) {
+		ret = PTR_ERR(next_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}
@@ -1967,6 +1968,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
+	dsi->out_bridge = next_bridge;
 
 	return 0;
 }

-- 
2.52.0


