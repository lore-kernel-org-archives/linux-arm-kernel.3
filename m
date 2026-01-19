Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A683AD29C2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOybWp73u5ZxaZhyDKdve8Ni40VxSFIHPgXjKjrpB54=; b=HZt7NnoenYfMlCqjdJW17Bcqvi
	ut8r/ZPnpq5w3Mx9tI48nrHKKzlDIpltCKa4ujOCW3jl2nlJY7aRLr1o3vqNUguhzVFuiuBpRM9As
	tLhx1+Z8QpM1siTR4SHLPhQ9xTMLI7qwxqMmTocv007BFcOrymG98+OeYasAm5Ue1DlWEiXsaeNz7
	CYfoEiab1qSicmnMwRf+8IMUWu0KYGWD/XWIPUbG/kz1H3QsQav1WpJNieJFBF5l1sUL9047XDV5+
	YULvjEmcc4a1UjIRnaqud5LmLaLqbRi3oW18XdL5uVWyvrcxQkWVvnTpaBnkp9OoHN/Xg1sEqwn6Y
	VH8KlDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGk-000000029yV-1rWW;
	Mon, 19 Jan 2026 13:26:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGe-000000029x3-1X5V;
	Mon, 19 Jan 2026 13:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768829160;
	bh=mpk7tWmk4toJ0PjTIc4YmZfgndoSJj/00S1bpumobzQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d9U3WBoSCLe0HkqxXPdTP5x3HwHP39ycLeOf+HNWNZ09e8pysrTn20YwU9YtH7Shy
	 DDJYPeJwcK6uqNdQP4qzAi05jNUhZ00147cQwQchAdhJl6XyHUawG3l/qcsAOyDoOk
	 JA2Ys6KE6BOra2Ar6f+aD1R0zfdrYmYpb/hgUgwuwHWVeYogg3z1bbv/EZT6t4Rm3k
	 aEvQms07O3lTrvQy8qzvKDzXcmYp3oskS1nJBLmBmDUyFA7T848ow27F6c8he8jQ8B
	 fQHCA3He0eOANkuwpbvWG1LG91YQl2akRBfKqODb3UL5MFFVeUjntR07nxlyAZB0Xi
	 xS/dFgFnI37Og==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B33717E07FA;
	Mon, 19 Jan 2026 14:26:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 19 Jan 2026 15:25:57 +0200
Subject: [PATCH v3 1/4] drm/bridge: Add ->detect_ctx hook and
 drm_bridge_detect_ctx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-dw-hdmi-qp-scramb-v3-1-bd8611730fc1@collabora.com>
References: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
In-Reply-To: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_052604_572618_EC715B40 
X-CRM114-Status: GOOD (  18.61  )
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

Add an atomic variant of the ->detect callback and a new helper to call
the hook while passing an optional drm_modeset_acquire_ctx reference.

When both ->detect_ctx and ->detect are defined, the latter is ignored.
If acquire_ctx is unset, the function takes care of the locking,
while also handling EDEADLK.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 30 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6dcf8f6d3ecf..0ef12bf98011 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1344,6 +1344,64 @@ drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 }
 EXPORT_SYMBOL_GPL(drm_bridge_detect);
 
+/**
+ * drm_bridge_detect_ctx - check if anything is attached to the bridge output
+ * @bridge: bridge control structure
+ * @connector: attached connector
+ * @ctx: acquire_ctx, or NULL to let this function handle locking
+ *
+ * If the bridge supports output detection, as reported by the
+ * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect_ctx
+ * or &drm_bridge_funcs.detect for the bridge and return the connection status.
+ * Otherwise return connector_status_unknown.
+ *
+ * When both @ctx and &drm_bridge_funcs.detect_ctx are not set, this helper
+ * function is equivalent to drm_bridge_detect() above.
+ *
+ * RETURNS:
+ * The detection status on success, or connector_status_unknown if the bridge
+ * doesn't support output detection.
+ * If @ctx is set, it might also return -EDEADLK.
+ */
+int drm_bridge_detect_ctx(struct drm_bridge *bridge,
+			  struct drm_connector *connector,
+			  struct drm_modeset_acquire_ctx *ctx)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
+		return connector_status_unknown;
+
+	if (bridge->funcs->detect_ctx) {
+		struct drm_modeset_acquire_ctx br_ctx;
+		int ret;
+
+		if (ctx)
+			return bridge->funcs->detect_ctx(bridge, connector, ctx);
+
+		drm_modeset_acquire_init(&br_ctx, 0);
+retry:
+		ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex,
+				       &br_ctx);
+		if (!ret)
+			ret = bridge->funcs->detect_ctx(bridge, connector, &br_ctx);
+
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(&br_ctx);
+			goto retry;
+		}
+
+		if (ret < 0)
+			ret = connector_status_unknown;
+
+		drm_modeset_drop_locks(&br_ctx);
+		drm_modeset_acquire_fini(&br_ctx);
+
+		return ret;
+	}
+
+	return bridge->funcs->detect(bridge, connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_detect_ctx);
+
 /**
  * drm_bridge_get_modes - fill all modes currently valid for the sink into the
  * @connector
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 73c23fece792..5f99ffe555e9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -664,6 +664,33 @@ struct drm_bridge_funcs {
 	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 
+	/**
+	 * @detect_ctx:
+	 *
+	 * Check if anything is attached to the bridge output.
+	 *
+	 * This callback is optional, if not implemented the bridge will be
+	 * considered as always having a component attached to its output.
+	 * Bridges that implement this callback shall set the
+	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
+	 *
+	 * This is the atomic version of &drm_bridge_funcs.detect.
+	 *
+	 * To avoid races against concurrent connector state updates, the
+	 * helper libraries always call this with ctx set to a valid context,
+	 * and &drm_mode_config.connection_mutex will always be locked with
+	 * the ctx parameter set to this ctx. This allows taking additional
+	 * locks as required.
+	 *
+	 * RETURNS:
+	 *
+	 * &drm_connector_status indicating the bridge output status,
+	 * or the error code returned by drm_modeset_lock(), -EDEADLK.
+	 */
+	int (*detect_ctx)(struct drm_bridge *bridge,
+			  struct drm_connector *connector,
+			  struct drm_modeset_acquire_ctx *ctx);
+
 	/**
 	 * @get_modes:
 	 *
@@ -1659,6 +1686,9 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 
 enum drm_connector_status
 drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector);
+int drm_bridge_detect_ctx(struct drm_bridge *bridge,
+			  struct drm_connector *connector,
+			  struct drm_modeset_acquire_ctx *ctx);
 int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
 const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,

-- 
2.52.0


