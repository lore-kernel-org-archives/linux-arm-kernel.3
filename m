Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B382ED167FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7yKYTktaJ5QBYIv/riMau9mtMOQxGCnsiL5HskQuQs=; b=jifQxyFi1nrlOsvco37uQqBXZN
	hRMWrp1zJNA9WCXBZhJCD+T3Ajcfwbqdn77rrU1nCnK5XwPP8ULeh7of/fHdRCIhvxg5NmsREFBpC
	ttsqaW5ADD+n1AUbany1dey8PrKJ4nyFQ8gyeIFzRSgOiD6GndZ88eQ8JVHKDnlm7Vkrj0mhNVqcH
	+Gfdx7UNSFR+wLBEFmFIyxQcMtQXuVRmgA8LLCilidOHSIQ8p8L4+Ydb3IYrNq2/JoGEAXb/4lHmS
	2lCnVhwsPgvcPzEpY20IWI5QJoePHkJ1Gf8KhrC6gukGKshU7n4CoCCKWkWfloBiGEL38YyEsNcGJ
	1DKVrOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LN-000000025aH-2Raw;
	Fri, 09 Jan 2026 10:03:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LL-000000025Wl-3DKE;
	Fri, 09 Jan 2026 10:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e7yKYTktaJ5QBYIv/riMau9mtMOQxGCnsiL5HskQuQs=; b=PyNYD3awRQ+Jss/rjMufFoChF3
	ALDsDVdNQoTRqb05uFROLO6hh6NWi+LJdoaE8Toa8W00atkKd7UumyUx0oGnUp6z1DIuh+WikgFgI
	2u2chP3Eb0oNYAJZ9tkrcj4PeMA5Zr/ZvrYmE/y+9Uw5MwqQq+eGmCpSP8WCpJtpeDJkgbrz90QtU
	zeDJJOTj3zRunLL27DcogHM9h+AgiSRbTFG9S+f8IZf04jT24CkJ7jBu/mqEuwxoyiRBpYGZdRwgm
	x7RI4JUIiaialsKYA9sE0p5aEnxdefWcwtNInGpYefU/ladUXcvVa0d/RWZWS5pfdh1bYAycCj+3u
	jqqQkyhg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9LH-0000000Exhe-1ZbB;
	Fri, 09 Jan 2026 10:03:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 621121A273D;
	Fri,  9 Jan 2026 10:03:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33F5A60734;
	Fri,  9 Jan 2026 10:03:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32C3E103C88A8;
	Fri,  9 Jan 2026 11:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767953009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7yKYTktaJ5QBYIv/riMau9mtMOQxGCnsiL5HskQuQs=;
	b=0Y4aL+WhrqX8pFZoSHXt+GHmfUVCLeSuTr+X3dQAvdxLYKoCo/T47xKtVtnl13bEHRzgER
	OiUc1Rxr0DZAN1DpP/MZ8T9yxTDShFSiU4WPVzdnZL7JRdZMto8U/SaRiuKcT/Zm2eY9Ig
	AYWB4UoLm+w/n+7PmJttTEbXGZmEeIN1D1WKUrOdGEXIKqgYrX/S7dIYT5PoCgKjwR24jH
	YQEUIK0pSwHRjiqSXEg5Uc/ybUUVKGaItruo4ogLPrNsGUlN3lRyC8UhJjUQJL0KSzk6OQ
	TJBwqIM+d/FQizQHv8ds7ex8LeiOIpHdOfpBgG1dsNQpYPq8UGexwV/I/4OC5Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 11:02:52 +0100
Subject: [PATCH v2 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-3-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_100339_487968_ECAD7CF2 
X-CRM114-Status: GOOD (  14.06  )
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
is put when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes  in v2:
- add missing drm_bridge_put() on component_add() failure
- reorder lines in dw_hdmi_imx_remove()
---
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index 07e5f96202d4..398f3cce5532 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(hdmi->hdmi))
 		return PTR_ERR(hdmi->hdmi);
 
-	hdmi->bridge = of_drm_find_bridge(np);
+	hdmi->bridge = of_drm_find_and_get_bridge(np);
 	if (!hdmi->bridge) {
 		dev_err(hdmi->dev, "Unable to find bridge\n");
 		dw_hdmi_remove(hdmi->hdmi);
@@ -249,8 +249,10 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	}
 
 	ret = component_add(&pdev->dev, &dw_hdmi_imx_ops);
-	if (ret)
+	if (ret) {
+		drm_bridge_put(hdmi->bridge);
 		dw_hdmi_remove(hdmi->hdmi);
+	}
 
 	return ret;
 }
@@ -260,6 +262,7 @@ static void dw_hdmi_imx_remove(struct platform_device *pdev)
 	struct imx_hdmi *hdmi = platform_get_drvdata(pdev);
 
 	component_del(&pdev->dev, &dw_hdmi_imx_ops);
+	drm_bridge_put(hdmi->bridge);
 	dw_hdmi_remove(hdmi->hdmi);
 }
 

-- 
2.52.0


