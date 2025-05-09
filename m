Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EB8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+Yzp90os1B1+K7TxmcOkUZ2pL98oF+RE1fH12ahofw=; b=ecc5FODX8iv4iU++/WknNwJ5ck
	ViT9gWrfWymfzH/7RMn1U4eUFlZ5sATzau1nnZWLoWYMqr3+952Cg97dXORvFgNUC8L8d/QAByZcu
	aTkcxxVhOXtG07qRvewQLPS9B/0/PHsVjM9nEpbH4v7OOYthJD3DQuYd0INaOGUHFV5GKkmJdLOX/
	TKzgTmDcSnpToum7RWbcYPzjO0kT3Za9HXXwf3is95RrUR4DmaXpipuJ9++bwop7bVt0q8lu8QQua
	M8syc8+Um6/fgF48UfGU0j2ATMwNlLdYtdAigiHG45Ebru4IPv61JULUS7Hh+bT8P84xOcKNMcOyp
	DOwY9xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQ1b-00000004AR1-2aLJ;
	Fri, 09 May 2025 15:52:35 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDODq-00000003rVJ-0FDQ;
	Fri, 09 May 2025 13:57:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CC9D43B5C;
	Fri,  9 May 2025 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+Yzp90os1B1+K7TxmcOkUZ2pL98oF+RE1fH12ahofw=;
	b=GLTkiwfPIyff8yrwQGlb1NRxSNw7C7DYt4+dVEl+10LGfIFOSW4hzkE7/gWMkTxQ954TjV
	Zy50N1Q0HCG98t7SwoIGYqOgxr17LjkP3B4u5btGDg/d+4jzYA/nT63dZhjImayXOo1jXb
	AXTL6wUEEgofInXQVkkOsB/VWpKD/qo+Fz6AoVU8NBY3+bHfIjvrNtnZnk+AZ76OpturfV
	ZU92eRlnMuZvGwryaaRk7RAx51veKDbfnRaTeiLutsdVLtq1n1qhzcfAxt4T5q/o9ckVhD
	Wc5ycGU1BCVpb07X0Ur03Vt1zmzT6mzM2XyA4GfFVRcEEAHSueZauA5I8WTxlQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:42 +0200
Subject: [PATCH v3 16/22] drm/sti: dvo: convert to devm_drm_bridge_alloc()
 API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlrghinhdrvhholhhmrghtsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_065706_231704_7682F14C 
X-CRM114-Status: GOOD (  17.17  )
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

This driver allocates the DRM bridge separately from the main driver
private struct, which prevents using the new devm_drm_bridge_alloc()
API. Simplify the code by replacing the struct drm_bridge pointer with an
embedded struct drm_bridge inside the private struct, to make use of the
new API with the same code flow.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>

Changed in v2:
- fix typos in commit message
---
 drivers/gpu/drm/sti/sti_dvo.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 74a1eef4674eeabc445b53b380e325f785242024..7484d3c3f4ed5fac7eab408e30cbe2f6b87f27e5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -97,7 +97,7 @@ struct sti_dvo {
 	struct dvo_config *config;
 	bool enabled;
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge bridge;
 };
 
 struct sti_dvo_connector {
@@ -439,7 +439,6 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder;
 	struct sti_dvo_connector *connector;
 	struct drm_connector *drm_connector;
-	struct drm_bridge *bridge;
 	int err;
 
 	/* Set the drm device handle */
@@ -455,20 +454,14 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 
 	connector->dvo = dvo;
 
-	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -ENOMEM;
-
-	bridge->driver_private = dvo;
-	bridge->funcs = &sti_dvo_bridge_funcs;
-	bridge->of_node = dvo->dev.of_node;
-	drm_bridge_add(bridge);
+	dvo->bridge.driver_private = dvo;
+	dvo->bridge.of_node = dvo->dev.of_node;
+	drm_bridge_add(&dvo->bridge);
 
-	err = drm_bridge_attach(encoder, bridge, NULL, 0);
+	err = drm_bridge_attach(encoder, &dvo->bridge, NULL, 0);
 	if (err)
 		return err;
 
-	dvo->bridge = bridge;
 	connector->encoder = encoder;
 	dvo->encoder = encoder;
 
@@ -490,7 +483,7 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_sysfs:
-	drm_bridge_remove(bridge);
+	drm_bridge_remove(&dvo->bridge);
 	return -EINVAL;
 }
 
@@ -499,7 +492,7 @@ static void sti_dvo_unbind(struct device *dev,
 {
 	struct sti_dvo *dvo = dev_get_drvdata(dev);
 
-	drm_bridge_remove(dvo->bridge);
+	drm_bridge_remove(&dvo->bridge);
 }
 
 static const struct component_ops sti_dvo_ops = {
@@ -515,10 +508,10 @@ static int sti_dvo_probe(struct platform_device *pdev)
 
 	DRM_INFO("%s\n", __func__);
 
-	dvo = devm_kzalloc(dev, sizeof(*dvo), GFP_KERNEL);
-	if (!dvo) {
-		DRM_ERROR("Failed to allocate memory for DVO\n");
-		return -ENOMEM;
+	dvo = devm_drm_bridge_alloc(dev, struct sti_dvo, bridge, &sti_dvo_bridge_funcs);
+	if (IS_ERR(dvo)) {
+		DRM_ERROR("Failed to allocate DVO\n");
+		return PTR_ERR(dvo);
 	}
 
 	dvo->dev = pdev->dev;

-- 
2.49.0


