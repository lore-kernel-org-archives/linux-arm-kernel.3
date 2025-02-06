Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9310EC0219C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHGKRRwUFJ1hKE8GkVs2Ez/vUs0X0HmXOnbYhe5x4PU=; b=j/Xa90oIB6K7XzOusfqabs8zQd
	wEKQSuktOf8axXVEWJ7EMtUH1xfrUCrlTDxZ0Gtg+OfFzjSjL2VONnl6+4GVDOYTIvKNAPqwv00NK
	5rzdXWhZTCSalD+HJabCYzt3lrOjp0fGlbmAr/YapwUbCdjJW58In/X+zMDApNOsu0Wch90/7ydob
	WXLc7ivCDpkxWvvrq0OAHWetp3xjpzDqKz5CQJN/w2jCbhnm5uuKZbzlzD8VN0maj5iSt8n/9G9jW
	dRRBMo64iCad37mzIpbJmSys9cWI8pChqG+W1jexOzAp6+//tm3K0T066nJWkHsn5xpJ+Frs+GocN
	x7zX7IeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77g-00000007HsW-3SEE;
	Thu, 06 Feb 2025 19:01:12 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6P6-000000077xp-0esj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40FB8442D4;
	Thu,  6 Feb 2025 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHGKRRwUFJ1hKE8GkVs2Ez/vUs0X0HmXOnbYhe5x4PU=;
	b=alWZYw5+dkL1Byea1MLItdJnR6sEkiLtF/qRlFzH1fH1o4wc/B4cVix0giMXpxuxotAKXa
	NUxXCTo2oIqOHWXSlduliLid5Crv24bFILYvn1IbnSK27Whtmcb/TBmea6vTn7FN2YQYXE
	mJra3HiBro5kWZ8s/BtEmjYo0TNah5iAwh/NBNB2dDz/+lIc2p+veWwuQ3AwsXn361k+oo
	yooIP1PA4lKDQRWoZF797UY8kLWybJI8TgpEQ1QVjmtKuxqkpQ7jk7QOrPlhyRwiXFN6pc
	pcJD+hz+3tEYSBdhayBdlJKDSXWdzIRwxeLILbi0VeHKoHLZzVp8olo3WUcW2Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:26 +0100
Subject: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101508_347299_62BC9A22 
X-CRM114-Status: GOOD (  22.22  )
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

In order to support panels described either via graph links or via a
subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
to find the next bridge. The resulting logic is complex and duplicates code
already present in the DRM bridge core. Switch to the new APIs in DRM
bridge core that allow to do the same in a much cleaner way.

Note there are two slight changes in the new logic intended to improve the
final result:

 * the old code looks for a subnode with any name except "port" or "ports",
   while the new code uses the node passed as a parameter

 * the old code looks for a subnode first and falls back to a graph link,
   while the new code uses the reverse order because graph links are the
   recommended device tree representation now

The first change makes the code more robust by avoiding the risk of using
an unrelated node which is not describing a panel and not names "port" or
"ports".

The second change is not expected to expose regressions because, in the
cases where both a subnode and a graph link are used to describe a panel,
the graph link should point to the subnode itself, such as in
arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts

As a further cleanup, use a temporary variable to assign dsi->out_bridge
only on success. This avoids the risk of leaving a non-NULL value in
dsi->out_bridge when samsung_dsim_host_attach() fails.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
 1 file changed, 9 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *remote;
-	struct drm_panel *panel;
+	struct drm_bridge *out_bridge;
 	int ret;
 
-	/*
-	 * Devices can also be child nodes when we also control that device
-	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
-	 *
-	 * Lookup for a child node of the given parent that isn't either port
-	 * or ports.
-	 */
-	for_each_available_child_of_node(np, remote) {
-		if (of_node_name_eq(remote, "port") ||
-		    of_node_name_eq(remote, "ports"))
-			continue;
+	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)
+		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
 
-		goto of_find_panel_or_bridge;
-	}
-
-	/*
-	 * of_graph_get_remote_node() produces a noisy error message if port
-	 * node isn't found and the absence of the port is a legit case here,
-	 * so at first we silently check whether graph presents in the
-	 * device-tree node.
-	 */
-	if (!of_graph_is_present(np))
-		return -ENODEV;
-
-	remote = of_graph_get_remote_node(np, 1, 0);
-
-of_find_panel_or_bridge:
-	if (!remote)
-		return -ENODEV;
-
-	panel = of_drm_find_panel(remote);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(remote);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
-
-	of_node_put(remote);
-
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
-		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-		return ret;
+	if (IS_ERR(out_bridge)) {
+		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
+		return PTR_ERR(out_bridge);
 	}
 
 	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
@@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
+	dsi->out_bridge = out_bridge;
+
 	return 0;
 }
 

-- 
2.34.1


