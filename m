Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC29C0219C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BUqEtfCEh3q+AMxh9LslActlP7bwrUqRLfwXX1jD/I=; b=PwM/axHyR45AwNeSY4hlz8qkMz
	ZRalYik+G88YeFItpl+sB5gp1gETJcSP/DpDkTVu/rTrUGHO6Y35PeorET0FHI6/24xXssYGc//Pd
	OIFoJ8ZEWH3gjmKJDJpxjfXst3nd2G9pEJ9N92dALyydnsGDm1RqwPth8BjezRLKZIwFZKbFDwEpy
	cogtBX+a/ylNjuDZwfBe70eb02aT+00+IFPUsDDaWrHqTI/GExhJ5KVuK6dylytMVbEau7WSYizcB
	/KvTBP7tYbv/IKlZnrCUG1GER5uB96LG/ODOeoS1E+EpxuAq+NVNUrkEPy1Yh03k0xK1+t1OFBH6q
	MbToa+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77g-00000007HsO-1Bab;
	Thu, 06 Feb 2025 19:01:12 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6P3-000000077ws-2goj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A883743297;
	Thu,  6 Feb 2025 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3BUqEtfCEh3q+AMxh9LslActlP7bwrUqRLfwXX1jD/I=;
	b=VZfRnZJNdlAHyGR7Y5JUB+4Zs1FeePP7fAQWkoeWfCu2x/H34TMAIfz0AMwTC9ykMNM7mR
	9kMl0ajWjarJu7PMb1NamwCsLBAlIOouA5yd39/YtPfgRuzWmR7XtD31N+TsazT3qrjGZy
	qMjwBWMd/uiKO0Wh91+kHdpMy+1alr4FDE8RaL+UXBrbNygoFfZaOv9+IX+tw5B30mFcB6
	ehGRkPZM960fD3+h2eKCGmtZs25jLDLj/DAu1Kw5/jbF4RwDLzK0m+Tivuu2zYk9112bXC
	2Eil9YKnOK1v4GxWgRr/AA40F3GH2G6f3kJVmvWBY/uC1LAcoYkqlQE0hhDYWw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:25 +0100
Subject: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeekpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101505_834785_AC0D61E8 
X-CRM114-Status: GOOD (  16.96  )
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

devm_drm_of_get_bridge(), which is based on graph links, is the recommended
function to get a pointer to the following bridge.

This is valid even for panels, for which the recommended device tree
description is via graph links and not (or not only) panel subnodes of a
panel controller (e.g. "dsi@1234" controller node with a "panel@0"
subnode).

However there are drivers supporting the panel subnode description in
addition to the graph links. For those drivers add a _by_node variant that
takes the node of the target node.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 2aa17fbe538b86066c4e68f0d0e8046e9ca9b965..b0834b8644284e5f7751cec81724af849b4180e7 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1407,6 +1407,36 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge);
 
+/**
+ * devm_drm_of_get_bridge_by_node - Return bridge for a given OF node
+ * @dev: device to tie the bridge lifetime to
+ * @bridge_node: device node of the remote bridge
+ *
+ * Given a bridge DT node, returns the associated bridge if any. This
+ * should be used in addition to devm_drm_of_get_bridge() when the regular
+ * graph link search is not enough, e.g. for drivers that need to support
+ * panels described only as subnodes.
+ *
+ * RETURNS:
+ * A pointer to the bridge if successful, or an error pointer otherwise.
+ */
+struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
+						  struct device_node *bridge_node)
+{
+	struct drm_bridge *bridge;
+	int ret;
+
+	if (!bridge_node)
+		return ERR_PTR(-EINVAL);
+
+	bridge = of_drm_find_bridge(bridge_node);
+	if (!bridge)
+		return ERR_PTR(-ENODEV);
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
+
 /**
  * drmm_of_get_bridge - Return next bridge in the chain
  * @drm: device to tie the bridge lifetime to
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..1561347c4991dac6022319774510f9560c9283c3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1088,6 +1088,8 @@ static inline int drm_panel_bridge_set_orientation(struct drm_connector *connect
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
 struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
+						  struct device_node *bridge_node);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
 #else
@@ -1099,6 +1101,12 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
+								struct device_node *bridge_node)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,

-- 
2.34.1


