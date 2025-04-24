Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E1AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09PG+fxuKesOM/kP22ajuEbhOQfehjAeduUbezP82Mg=; b=Hg8kO4W3bvZ8b45kgYs00SG7/g
	QttcyF0y6VmEJbDHbA+Go168FVZYKbND5bRECMEfEd5nthKfkQWCrmoncPa8jc2nPO6n4o0On4kKT
	sIATRvB2f3NXf06S3eO0l1nqdyLLHmkncbPJies52whHwmvj8c1pqhP+iisYmnz2G+tiS5weVQfUV
	dFIQKtiCbh2OSQChIdpjJUT4O4mf3Es5zAK3nc9/cFSY0ejV74mRUTEV1Z43akPykPC3SwZUyxhUb
	N37UjzWdji5iy1rxC+MO8wZV+3F6oOHi93zcJqz3KlMNnVgldbs1x/TXaZOtI2J7PLfWG9/DZu27l
	WMNYGI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u830B-0000000FJ6q-1YKW;
	Thu, 24 Apr 2025 20:16:55 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82v3-0000000FIH6-0QNd;
	Thu, 24 Apr 2025 20:11:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F2A043A53;
	Thu, 24 Apr 2025 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745525494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09PG+fxuKesOM/kP22ajuEbhOQfehjAeduUbezP82Mg=;
	b=MDQiMXwM5Q6Bw/oa/uvytc0mvtbv7DY7eO7AgzCRzcWizRHKKKcSnyc0iJLbNVTw3Wsr6J
	lTOqEIBpBUTVqeWYByUkK9Vr4B1fufwPqZl7YxYRoWAyaBP1xMe1FKuin1fkR2amiI8dF0
	g4m6ihEA5Sz5uKfTe90sT+P+hHpzDS0N1w8Eup2LzDQrQMZHVyRc/xdFInUSbca9eev8lk
	S91hJDIYFe8zBrsqAHK0miPfASgOMYTye6Z7W6eIE6MEXvKIMHHApCEBVFDrzlDwCSVoJ3
	qsOh05OZ4XanGRLXUXv1Kzadf2o8Wr2tXbrVszd0YlKh6k3OKd9EvxoaBkoDbQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 34/34] drm/bridge: panel: convert to devm_drm_bridge_alloc() API
Date: Thu, 24 Apr 2025 22:05:49 +0200
Message-ID: <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdru
 ggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_131137_310368_B537CFFB 
X-CRM114-Status: GOOD (  13.60  )
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

This is the new API for allocating DRM bridges.

The devm lifetime management of this driver is peculiar. The underlying
device for the panel_bridge is the panel, and the devm lifetime is tied the
panel device (panel->dev). However the panel_bridge allocation is not
performed by the panel driver, but rather by a separate entity (typically
the previous bridge in the encoder chain).

Thus when that separate entoty is destroyed, the panel_bridge is not
removed automatically by devm, so it is rather done explicitly by calling
drm_panel_bridge_remove(). This is the function that does devm_kfree() the
panel_bridge in current code, so update it as well to put the bridge
reference instead.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/panel.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 79b009ab9396048eac57ad47631a902e949d77c6..ddd1e91970d09b93aa64f50cd9155939a12a2c6f 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -287,15 +287,14 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	if (!panel)
 		return ERR_PTR(-EINVAL);
 
-	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
-				    GFP_KERNEL);
-	if (!panel_bridge)
-		return ERR_PTR(-ENOMEM);
+	panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
+					     &panel_bridge_bridge_funcs);
+	if (IS_ERR(panel_bridge))
+		return (void *)panel_bridge;
 
 	panel_bridge->connector_type = connector_type;
 	panel_bridge->panel = panel;
 
-	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
@@ -327,7 +326,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 	panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
 	drm_bridge_remove(bridge);
-	devm_kfree(panel_bridge->panel->dev, bridge);
+	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 

-- 
2.49.0


