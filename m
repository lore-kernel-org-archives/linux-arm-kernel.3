Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986C1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MW7x6+H+CPMoQ7un393dL3lH/3gZIL6wfaKY7GNjZhk=; b=FZud6bKt6A5QJidgr04oVDTD7c
	WD8+lO5JbfE4nguLNYcC7J7ng0tUfYHWy+eI34AQ+YmHzpS0bz9iWZua01LbkH1WzmyDY/fuYFkcb
	gAqZNWlsCguSVHk+Jge0THfxdk5UUsGMiaDEtU8EgRcVPdXE6Qv3yMHFctd3Al6Bmy/dw15yyYYSl
	6uRyfagr4JceV+zm5PKFBglLQvBUs8XJ/FEO3s2qIMFlZ0cXA5Pn1S1bFsY3wkBsbJ4ibShQaadTI
	SnpU8lpXV3vf5qjwPm2+uK+j7GWtPoVKqjnx8QpI1FlB0xlWN0ttHfuNjLG2W5fINsDBm6UrccYHZ
	lNkU3NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77i-00000007Huw-31zc;
	Thu, 06 Feb 2025 19:01:14 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6PE-0000000782D-1c2v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32A37442D8;
	Thu,  6 Feb 2025 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MW7x6+H+CPMoQ7un393dL3lH/3gZIL6wfaKY7GNjZhk=;
	b=MRH2pw9DDs9Q9h8FHUocP2hhZimNMsi2OdFxk28Esfb/X6jJ9JTVvKYBTmL8H4qInRFFp0
	dB9yWTmwQvkoc5DGUhMdqOEgD7t18pvKzWe9Q6e1OtGWS4+GqSZERffB1gWrCmQiEv9Gdm
	ec3Y4/nLI2rNDtSfdeO9NM9HfSRGzqSyLWkKSfIPsGn2UA6DAcJgadEa0IoWFVJTWno5QV
	RhxW0Y7D0pLILZLgBQLJ5upF++S1phSPuKG0ZS/wQci7hpZJzuefK1/j97ncHHyh1vRVEQ
	7kIwlxgYO0x+pX+KLgK3Ait08Wr229OkvY39pZxpMtT4pCL+Pe+LWMesjtU9JA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:29 +0100
Subject: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101516_729561_BE605A33 
X-CRM114-Status: GOOD (  28.94  )
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

DRM bridges are currently considered as a fixed element of a DRM card, and
thus their lifetime is assumed to extend for as long as the card
exists. New use cases, such as hot-pluggable hardware with video bridges,
require DRM bridges to be added and removed to a DRM card without tearing
the card down. This is possible for connectors already (used by DP MST), so
add this possibility to DRM bridges as well.

Implementation is based on drm_connector_init() as far as it makes sense,
and differs when it doesn't. A difference is that bridges are not exposed
to userspace, hence struct drm_bridge does not embed a struct
drm_mode_object which would provide the refcount. Instead we add to struct
drm_bridge a refcount field (we don't need other struct drm_mode_object
fields here) and instead of using the drm_mode_object_*() functions we
reimplement from those functions the few lines that drm_bridge needs for
refcounting.

Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v6:
 - use drm_warn, not WARN_ON (Jani Nikula)
 - Add devm_drm_bridge_alloc() to replace drm_bridge_init() (similar to
   drmm_encoder_alloc)
 - Remove .destroy func: deallocation is done via the struct offset
   computed by the devm_drm_bridge_alloc() macro
 - use fixed free callback, as the same callback is used in all cases
   anyway (remove free_cb, add bool is_refcounted)
 - add drm_bridge_get/put() to drm_bridge_attach/detach() (add the bridge
   to a list)
 - make some DRM_DEBUG() strings more informative

This patch was added in v5.
---
 drivers/gpu/drm/drm_bridge.c |  76 ++++++++++++++++++++++++++--
 include/drm/drm_bridge.h     | 117 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 1955a231378050abf1071d74a145831b425c47c5..f694b32ca59cb91c32846bc00b43360df41cc1ad 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -200,6 +200,57 @@
 DEFINE_MUTEX(bridge_lock);
 LIST_HEAD(bridge_list);
 
+/* Internal function (for refcounted bridges) */
+void __drm_bridge_free(struct kref *kref)
+{
+	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
+	void *container = ((void *)bridge) - bridge->container_offset;
+
+	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);
+
+	kfree(container);
+}
+EXPORT_SYMBOL(__drm_bridge_free);
+
+static void drm_bridge_put_void(void *data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)data;
+
+	drm_bridge_put(bridge);
+}
+
+void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
+			      const struct drm_bridge_funcs *funcs)
+{
+	void *container;
+	struct drm_bridge *bridge;
+	int err;
+
+	if (!funcs) {
+		dev_warn(dev, "Missing funcs pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	container = kzalloc(size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	bridge = container + offset;
+	bridge->container_offset = offset;
+	bridge->funcs = funcs;
+	kref_init(&bridge->refcount);
+	bridge->is_refcounted = 1;
+
+	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
+	if (err)
+		return ERR_PTR(err);
+
+	DRM_DEBUG("bridge=%p, container=%p, funcs=%ps ALLOC\n", bridge, container, funcs);
+
+	return container;
+}
+EXPORT_SYMBOL(__devm_drm_bridge_alloc);
+
 /**
  * drm_bridge_add - add the given bridge to the global bridge list
  *
@@ -209,6 +260,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
 {
 	struct drm_bridge *br, *tmp;
 
+	DRM_DEBUG("bridge=%p ADD\n", bridge);
+
+	drm_bridge_get(bridge);
+
 	mutex_init(&bridge->hpd_mutex);
 
 	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
@@ -257,6 +312,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 {
 	struct drm_bridge *br, *tmp;
 
+	DRM_DEBUG("bridge=%p REMOVE\n", bridge);
+
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
@@ -266,6 +323,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
 
 	mutex_destroy(&bridge->hpd_mutex);
+
+	drm_bridge_put(bridge);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
@@ -326,11 +385,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
 
-	if (previous && (!previous->dev || previous->encoder != encoder))
-		return -EINVAL;
+	drm_bridge_get(bridge);
 
-	if (bridge->dev)
-		return -EBUSY;
+	if (previous && (!previous->dev || previous->encoder != encoder)) {
+		ret = -EINVAL;
+		goto err_put_bridge;
+	}
+
+	if (bridge->dev) {
+		ret = -EBUSY;
+		goto err_put_bridge;
+	}
 
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
@@ -379,6 +444,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 			      "failed to attach bridge %pOF to encoder %s\n",
 			      bridge->of_node, encoder->name);
 
+err_put_bridge:
+	drm_bridge_put(bridge);
 	return ret;
 }
 EXPORT_SYMBOL(drm_bridge_attach);
@@ -399,6 +466,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 
 	list_del(&bridge->chain_node);
 	bridge->dev = NULL;
+	drm_bridge_put(bridge);
 }
 
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -31,6 +31,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_print.h>
 
 struct device_node;
 
@@ -863,6 +864,22 @@ struct drm_bridge {
 	const struct drm_bridge_timings *timings;
 	/** @funcs: control functions */
 	const struct drm_bridge_funcs *funcs;
+
+	/**
+	 * @container_offset: Offset of this struct within the container
+	 * struct embedding it. Used for refcounted bridges to free the
+	 * embeddeing struct when the refcount drops to zero. Unused on
+	 * legacy bridges.
+	 */
+	size_t container_offset;
+	/**
+	 * @refcount: reference count for bridges with dynamic lifetime
+	 * (see drm_bridge_init)
+	 */
+	struct kref refcount;
+	/** @is_refcounted: this bridge has dynamic lifetime management */
+	bool is_refcounted;
+
 	/** @driver_private: pointer to the bridge driver's internal context */
 	void *driver_private;
 	/** @ops: bitmask of operations supported by the bridge */
@@ -964,6 +981,106 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+static inline bool drm_bridge_is_refcounted(struct drm_bridge *bridge)
+{
+	return bridge->is_refcounted;
+}
+
+void __drm_bridge_free(struct kref *kref);
+
+/**
+ * drm_bridge_get - Acquire a bridge reference
+ * @bridge: DRM bridge
+ *
+ * This function increments the bridge's refcount.
+ *
+ * It does nothing on non-refcounted bridges. See drm_bridge_init().
+ */
+static inline void drm_bridge_get(struct drm_bridge *bridge)
+{
+	if (!drm_bridge_is_refcounted(bridge))
+		return;
+
+	DRM_DEBUG("bridge=%p GET\n", bridge);
+
+	kref_get(&bridge->refcount);
+}
+
+/**
+ * drm_bridge_put - Release a bridge reference
+ * @bridge: DRM bridge
+ *
+ * This function decrements the bridge's reference count and frees the
+ * object if the reference count drops to zero.
+ *
+ * It does nothing on non-refcounted bridges. See drm_bridge_init().
+ *
+ * See also drm_bridge_put_and_clear() which is more handy in many cases.
+ */
+static inline void drm_bridge_put(struct drm_bridge *bridge)
+{
+	if (!drm_bridge_is_refcounted(bridge))
+		return;
+
+	DRM_DEBUG("bridge=%p PUT\n", bridge);
+
+	kref_put(&bridge->refcount, __drm_bridge_free);
+}
+
+/**
+ * drm_bridge_put_and_clear - Given a bridge pointer, clear the pointer
+ *                            then put the bridge
+ *
+ * @bridge_pp: pointer to pointer to a struct drm_bridge
+ *
+ * Helper to put a DRM bridge (whose pointer is passed), but only after
+ * setting its pointer to NULL. Useful for drivers having struct drm_bridge
+ * pointers they need to dispose of, without leaving a use-after-free
+ * window where the pointed bridge might have been freed while still
+ * holding a pointer to it.
+ *
+ * For example a driver having this private struct::
+ *
+ *     struct my_bridge {
+ *         struct drm_bridge *remote_bridge;
+ *         ...
+ *     };
+ *
+ * can dispose of remote_bridge using::
+ *
+ *     drm_bridge_put_and_clear(&my_bridge->remote_bridge);
+ */
+static inline void drm_bridge_put_and_clear(struct drm_bridge **bridge_pp)
+{
+	struct drm_bridge *bridge = *bridge_pp;
+
+	*bridge_pp = NULL;
+	drm_bridge_put(bridge);
+}
+
+void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
+			      const struct drm_bridge_funcs *funcs);
+
+/**
+ * devm_drm_bridge_alloc - Allocate and initialize an refcounted bridge
+ * @dev: struct device of the bridge device
+ * @type: the type of the struct which contains struct &drm_bridge
+ * @member: the name of the &drm_bridge within @type
+ * @funcs: callbacks for this bridge
+ *
+ * The bridge will have a dynamic lifetime (aka a refcounted bridge).
+ *
+ * The returned refcount is initialized to 1. This reference will be
+ * automatically dropped via devm (by calling drm_bridge_put()) when the
+ * device is removed.
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
2.34.1


