Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B5C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndazw8iVlLF3DncKQTioWTpLoiIsd0ajB8SBQX3Fyiw=; b=LFzk2onsbU3XKKy5AoTb1YqKbJ
	UP32ibBE2shKxToGbs7wfkI69ANYrX1k9J/jP8fRevOBT+I+X8rivv3Gno2l4ar0iK9kaA60C22ym
	pL9Fq75f82EWG3Wz1f4ReaGC5xkq1Dsd6QIU/FmcC+360psdqAssY2T8/Ohygmw1G11/qKJUkTHLb
	2ePN5eXsPMhKnYQfBNaU8aPtO6S4o1/d0pUzVq4/c/6XVA8Ww8vuQQPXeTPNhNhKadhYP2mGbG9dk
	gA3yydp85DoPGzeqKAaWrNVsQBV0a3LAsVTn8KqvhqIhLoFirxsxQZt3iopOXakj3hTI9ERvH70hD
	wsCq2HgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUue-00000009Glb-3vG4;
	Wed, 26 Mar 2025 17:51:36 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUrB-00000009FwF-2hoE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:48:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27DA34443D;
	Wed, 26 Mar 2025 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743011278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndazw8iVlLF3DncKQTioWTpLoiIsd0ajB8SBQX3Fyiw=;
	b=ljjzP9gJSK1/q889Om1tXDUFjofNvYanCtJ8+RIc57y3y4lkdYcmLu82vzV1ie0TG/2P2K
	Yy4Qu4W/uypQTrkaOzbHzys2H/py6bsfa5zHWj8D7qdm1x63D1O+PpiXFDeTpWzru0otb7
	t5WKpTsFAQtBVNauH2txaBUX5nxmuczqzjXfFvi2Ghvm1iUK1yIlvhEulbUhhiUc+EGbL5
	NG39xUB6rXF5nn9vh4671++i8uXHtdz/I9xVII8wQ9g3yVISwHbeLaAawZ1X9gLHDvMo6N
	G9WHrInmiyIxt/bTth5T+CdhLCSnJ1AMhWWPlwmc7v+OGi/murpMKUO3RTC8Kw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 26 Mar 2025 18:47:35 +0100
Subject: [PATCH v9 1/5] drm/bridge: add devm_drm_bridge_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-drm-bridge-refcount-v9-1-5e0661fe1f84@bootlin.com>
References: <20250326-drm-bridge-refcount-v9-0-5e0661fe1f84@bootlin.com>
In-Reply-To: <20250326-drm-bridge-refcount-v9-0-5e0661fe1f84@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeiudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghrvgigseguvghngidruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtt
 hhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_104801_840059_1526C7D9 
X-CRM114-Status: GOOD (  14.49  )
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

Add a macro to allocate and initialize a DRM bridge embedded within a
private driver struct.

Compared to current practice, which is based on [devm_]kzalloc() allocation
followed by open-coded initialization of fields, this allows to have a
common and explicit API to allocate and initialize DRM bridges.

Besides being useful to consolidate bridge driver code, this is a
fundamental step in preparation for adding dynamic lifetime to bridges
based on refcount.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v9: none
Changes in v8: none

Changes in v7:
- in v6 this was part of "drm/bridge: add support for refcounted DRM
  bridges", now split to a separate patch
---
 drivers/gpu/drm/drm_bridge.c | 22 ++++++++++++++++++++++
 include/drm/drm_bridge.h     | 17 +++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ef98e21dc593f38a2d3c67b850032ece38bec5e8..84fa1a1330cbabd309526829fff70971cfed1dcd 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -199,6 +199,28 @@
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
+void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
+			      const struct drm_bridge_funcs *funcs)
+{
+	void *container;
+	struct drm_bridge *bridge;
+
+	if (!funcs) {
+		dev_warn(dev, "Missing funcs pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	bridge = container + offset;
+	bridge->funcs = funcs;
+
+	return container;
+}
+EXPORT_SYMBOL(__devm_drm_bridge_alloc);
+
 /**
  * drm_bridge_add - add the given bridge to the global bridge list
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cdad3b78a195aa39776c93e2371217d3d3fb6064..a59277674d5a2937e324d3ce48f934418788053f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -941,6 +941,23 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
+			      const struct drm_bridge_funcs *funcs);
+
+/**
+ * devm_drm_bridge_alloc - Allocate and initialize a bridge
+ * @dev: struct device of the bridge device
+ * @type: the type of the struct which contains struct &drm_bridge
+ * @member: the name of the &drm_bridge within @type
+ * @funcs: callbacks for this bridge
+ *
+ * Returns:
+ * Pointer to new bridge, or ERR_PTR on failure.
+ */
+#define devm_drm_bridge_alloc(dev, type, member, funcs) \
+	((type *)__devm_drm_bridge_alloc(dev, sizeof(type), \
+					 offsetof(type, member), funcs))
+
 void drm_bridge_add(struct drm_bridge *bridge);
 int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);

-- 
2.49.0


