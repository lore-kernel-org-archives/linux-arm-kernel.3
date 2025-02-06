Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAFCC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGZLluwkDCjp1kHB/F87oV4x0FXPfwe2Z3Cbt+cBMY0=; b=d9jvCBdrDxkaXUjXbr/ppfq8FU
	tE4jHD8maUuJNLoyJ2llyxbeIMoakwPN1ms48SSWVyj46G3N/aFb6ADcBuodI9w4vXQ+pa5IhNkBJ
	rgTr0z0M0OXO4YT4PdqZliXXE8cyuNxFNjjYmay9QokWTI30bM+NqhJSPmzwsGiFnxLOwyM9fWMBx
	WTVbBn1S5t6bBfPPzextcMlxSVLz1zSZRsdod1R3c786DuVaxD9PW0DaeerEyuyt/7ZvQj9WhB9Ch
	3ZiVCAt79h9mJg2Z+hI+kuFfddoKjgQgH8nk4F1FzB8iXUT1Xj6JzMQGLeEE9xLs3WezZ3ujKaXr8
	AfcybYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77k-00000007Hwx-2DPq;
	Thu, 06 Feb 2025 19:01:16 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6PM-0000000786p-2rka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A325442D4;
	Thu,  6 Feb 2025 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGZLluwkDCjp1kHB/F87oV4x0FXPfwe2Z3Cbt+cBMY0=;
	b=dcwocTIPbXtLHpayEIyBz/uxIiTZQEiHi4KaM+Mz28d/scIiEZQyjWjQzRu+kIuOEhJn71
	wvsmE0NLkbQdkXP7O8e0ZEyLviqni70ms1O4TQdIRajiqg6SA/yjtWM58Kea4YGeiqUa7R
	owoU7X6AwiXhIk2zLrVLEozHTKUOXKXbpkdJV+NRNmRLvoW2WR36iTU2FAthzcO1z02Gz9
	GXaQs1qoQswQj2h8a7KjfDzv+ZjL/7vGHtqsH47s1/gHCth/jX0+kBLr0n4oG+MV4GOq3E
	LMP7xMdYbBRaJ/loMAzukV/i6J4Gorer6VYYwaDMTvuI70lmfY5xTfPL8+N3TA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:32 +0100
Subject: [PATCH v6 17/26] drm/bridge: add devm_drm_put_bridge() and
 devm_drm_put_and_clear_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-17-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101524_879846_20F60BE7 
X-CRM114-Status: GOOD (  13.10  )
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

Bridges obtained via devm_drm_of_get_bridge() will be put when the
requesting device is removed. However drivers which obtained them may need
to put the obtained reference way before being destroyed, especially in
case of hot-unplug of the bridge they hold a reference to.

Add devm_drm_put_bridge() to manually release a devm-obtained bridge.

Also add a macro to additionally clear the pointer in a safe way.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 36 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index fca860d582f86b35c9172b27be20060de086e38f..92ce40adfaa59a278a972ac862bebee06970ff83 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1548,6 +1548,42 @@ struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
 }
 EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
 
+/**
+ * devm_drm_put_bridge - Release a bridge reference obtained via devm
+ * @dev: device that got the bridge via devm
+ * @bridge: pointer to a struct drm_bridge obtained via devm
+ *
+ * Same as drm_bridge_put() for bridge pointers obtained via devm functions
+ * such as devm_drm_of_get_bridge().
+ *
+ * See also devm_drm_put_and_clear_bridge() which is more handy in many
+ * cases.
+ */
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge)
+{
+	devm_release_action(dev, devm_drm_bridge_put_void, bridge);
+}
+EXPORT_SYMBOL(devm_drm_put_bridge);
+
+/**
+ * devm_drm_put_and_clear_bridge - Given a bridge pointer obained via devm,
+ *                                 clear the pointer then put the bridge
+ *
+ * @dev: device that got the bridge via devm
+ * @bridge_pp: pointer to pointer to a struct drm_bridge obtained via devm
+ *
+ * Same as drm_bridge_put_and_clear() for bridge pointers obtained via devm
+ * functions such as devm_drm_of_get_bridge().
+ */
+void devm_drm_put_and_clear_bridge(struct device *dev, struct drm_bridge **bridge_pp)
+{
+	struct drm_bridge *bridge = *bridge_pp;
+
+	*bridge_pp = NULL;
+	devm_drm_put_bridge(dev, bridge);
+}
+EXPORT_SYMBOL(devm_drm_put_and_clear_bridge);
+
 static void drmm_bridge_put_void(struct drm_device *drm, void *ptr)
 {
 	struct drm_bridge *bridge = ptr;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 43cef0f6ccd36034f64ad2babfebea62db1d9e43..b6b76161a3c6bb2a4df4b3331bc152a560823fd7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1230,6 +1230,8 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node
 					  u32 port, u32 endpoint);
 struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
 						  struct device_node *bridge_node);
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
+void devm_drm_put_and_clear_bridge(struct device *dev, struct drm_bridge **bridge_pp);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
 #else
@@ -1247,6 +1249,10 @@ static inline struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *d
 	return ERR_PTR(-ENODEV);
 }
 
+static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
+static inline void devm_drm_put_and_clear_bridge(struct device *dev,
+						 struct drm_bridge **bridge_pp) {}
+
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,

-- 
2.34.1


