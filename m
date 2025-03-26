Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C9EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhjBmXsf/LmBdhRk5NLGeDB408E/96bpBJOsIdR68d4=; b=1vjq/qWM+x8811cbk3K0b3C3jW
	FJKA4o91zCDafIVS8o36yMA2PVNH/a0Al5CFK+3cWy3Wea4qo9zLAeO8rWewhWkH6lVNHu1Y8QK3b
	j/eUl9dcCm4+64iO3rqQ5EHlvYZRhpbKxAke0ozmJEO6mqJp8yycfysbw+luteUlspzt0tpc7RcfY
	YpeI70HMnM3rlnqaG3p3qgi4RmFFQ41V6BAAs/ZCn3rGwT1Pp3aN1VtUd6RBA/vVKw1it/H5EGfKV
	+0hj1FRcWfp5QeJ/duDjeMNiE/WYSxI4NCOxfiU8QN4cw4lDb3hDWPMuhHM39RekovCXJ8A4ZsnIg
	SLzmpOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUwM-00000009H2o-2uPp;
	Wed, 26 Mar 2025 17:53:22 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUrC-00000009Fwd-10jU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:48:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DE634443C;
	Wed, 26 Mar 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743011280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhjBmXsf/LmBdhRk5NLGeDB408E/96bpBJOsIdR68d4=;
	b=GPP567yfHMyK57Rh6puGQTwdX5hnay2mru9whH1UGqvFQSR3QbIoxeoQ9FSoqN1cTKchlE
	kczeAYMHtW/ZkCsYO+7afCk9BYhYYnm/4PZcFx7EoxPjCUJORAvAtwSh5XiKFGkz/LuINO
	6YXAFHApPIj3r6vnrknaZkFeVUSmqsS6sVwEwfF0O+YMiRjwh3HZgYfi93FJvw7t9rjkzw
	HYi/xKcph7PP+YhHCYUZTCnOoaq702UMB3HlQ7TqMx7MZSiVfBpSUGu8QSFw0NgeutlKSL
	AYRp1kejqalRl+e+H2FBvpJqZo3CT03g76/Q2uEsy4xs2/qQg2a692g8dvU1qQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 26 Mar 2025 18:47:36 +0100
Subject: [PATCH v9 2/5] drm/bridge: add support for refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-drm-bridge-refcount-v9-2-5e0661fe1f84@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeiudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehjefgudegvddukeegvedtgfduudehtdfgteefvefgheekjeehvdeihfdtfffhkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehimhigsehli
 hhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_104802_431956_15C6B372 
X-CRM114-Status: GOOD (  24.38  )
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
require DRM bridges to be added to and removed from a DRM card without
tearing the card down. This is possible for connectors already (used by DP
MST), it is now needed for DRM bridges as well.

As a first preliminary step, make bridges reference-counted to allow a
struct drm_bridge (along with the private driver structure embedding it) to
stay allocated even after the driver has been removed, until the last
reference is put.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v9:
 - make drm_bridge_put() void as discussed in
   https://lore.kernel.org/lkml/20250326102304.49510630@booty/
 - slightly simplify code flow in drm_bridge_get/put()
 - removed Maxime's Reviewed-by due to the above changes

Changes in v8:
 - move back drm_bridge_get/put() to the .c file, make __drm_bridge_free
   private
 - move back drm_bridge_put_void() to .c, not used in this series outside
   of drm_bridge.c
 - remove drm_bridge_put_and_clear(), not used in this series
 - minor docs and coding style tweaks

Changes in v7:
 - export drm_bridge_put_void
 - struct drm_bridge: use container pointer instead of container_offset
 - remove drm_bridge_is_refcounted()
 - remove all DRM_DEBUG()s
 - drm_bridge_get/put: accept NULL pointer and return the bridge pointer to
   allow pass-through calls
 - extract to separate patches:
    - the addition of drm_bridge_alloc
    - the addition of drm_bridge_get/put() to drm_bridge_add/remove()
    - the addition of drm_bridge_get/put() to drm_bridge_attach/detach()
 - fix a typo, slightly improve kerneldoc

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
 drivers/gpu/drm/drm_bridge.c | 63 +++++++++++++++++++++++++++++++++++++++++++-
 include/drm/drm_bridge.h     | 19 +++++++++++++
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 84fa1a1330cbabd309526829fff70971cfed1dcd..22b459af112fd3cd2db00aa16668d270e028b307 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -199,23 +199,84 @@
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
+static void __drm_bridge_free(struct kref *kref)
+{
+	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
+
+	kfree(bridge->container);
+}
+
+/**
+ * drm_bridge_get - Acquire a bridge reference
+ * @bridge: DRM bridge
+ *
+ * This function increments the bridge's refcount.
+ *
+ * Returns:
+ * Pointer to @bridge.
+ */
+struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
+{
+	if (bridge)
+		kref_get(&bridge->refcount);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drm_bridge_get);
+
+/**
+ * drm_bridge_put - Release a bridge reference
+ * @bridge: DRM bridge
+ *
+ * This function decrements the bridge's reference count and frees the
+ * object if the reference count drops to zero.
+ */
+void drm_bridge_put(struct drm_bridge *bridge)
+{
+	if (bridge)
+		kref_put(&bridge->refcount, __drm_bridge_free);
+}
+EXPORT_SYMBOL(drm_bridge_put);
+
+/**
+ * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void pointer
+ *
+ * @data: pointer to @struct drm_bridge, cast to a void pointer
+ *
+ * Wrapper of drm_bridge_put() to be used when a function taking a void
+ * pointer is needed, for example as a devm action.
+ */
+static void drm_bridge_put_void(void *data)
+{
+	struct drm_bridge *bridge = (struct drm_bridge *)data;
+
+	drm_bridge_put(bridge);
+}
+
 void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 			      const struct drm_bridge_funcs *funcs)
 {
 	void *container;
 	struct drm_bridge *bridge;
+	int err;
 
 	if (!funcs) {
 		dev_warn(dev, "Missing funcs pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	container = kzalloc(size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	bridge->container = container;
 	bridge->funcs = funcs;
+	kref_init(&bridge->refcount);
+
+	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
+	if (err)
+		return ERR_PTR(err);
 
 	return container;
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a59277674d5a2937e324d3ce48f934418788053f..df9bbf6fd1fb522add28b76406b74cdb7391fc57 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -840,6 +840,18 @@ struct drm_bridge {
 	const struct drm_bridge_timings *timings;
 	/** @funcs: control functions */
 	const struct drm_bridge_funcs *funcs;
+
+	/**
+	 * @container: Pointer to the private driver struct embedding this
+	 * @struct drm_bridge.
+	 */
+	void *container;
+
+	/**
+	 * @refcount: reference count of users referencing this bridge.
+	 */
+	struct kref refcount;
+
 	/** @driver_private: pointer to the bridge driver's internal context */
 	void *driver_private;
 	/** @ops: bitmask of operations supported by the bridge */
@@ -941,6 +953,9 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge);
+void drm_bridge_put(struct drm_bridge *bridge);
+
 void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 			      const struct drm_bridge_funcs *funcs);
 
@@ -951,6 +966,10 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
  * @member: the name of the &drm_bridge within @type
  * @funcs: callbacks for this bridge
  *
+ * The reference count of the returned bridge is initialized to 1. This
+ * reference will be automatically dropped via devm (by calling
+ * drm_bridge_put()) when @dev is removed.
+ *
  * Returns:
  * Pointer to new bridge, or ERR_PTR on failure.
  */

-- 
2.49.0


