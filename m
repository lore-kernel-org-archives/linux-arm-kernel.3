Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B620CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTxsqV2nFsX5BfihPYr16LuZcRB4011r8fFfYlYi8j4=; b=m/s5SRJ1klzGlB3K4utl1WtTnt
	VVryTf7ualA7F+hGb8rtQOTccJfr8Iw2JGBTTi5+YCDrJud4IOLxkZH/vkQ26mMm8/RBpfK2NqOxk
	E1v0MTdqcjADv8hq92aYD1ZWoIaXgMdZyFuU4YwEpnPZZTNTjbYtvOa3j8c3tRlYBXwgl8KA15Vol
	Sx51OBUeFzC/+emLAX89YFLW/yeBm85cYETqlz873RpDd8f4zehqZUA2R53SttSIB8edzBa8cO/tN
	/56+kchZtJO+bFMYb6wZToSj9BksWIR+yaN7awnMsF3gJKOPUpGyXEltPbahDWaBuYKU/SXI8QXAV
	2n2iZorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTgU-0000000EF3l-2XhI;
	Mon, 11 May 2026 16:40:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTgP-0000000EF12-1nIV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:40:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A0F731A350B;
	Mon, 11 May 2026 16:40:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AAC660646;
	Mon, 11 May 2026 16:40:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3322811AF9EEB;
	Mon, 11 May 2026 18:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mTxsqV2nFsX5BfihPYr16LuZcRB4011r8fFfYlYi8j4=;
	b=fbqF2BDh7mxZ58QRkqZwr/JEF/aaCVSEBBNYEobn56aoSCHtoSQD0LL+dmOUxR0JtPi2/+
	bfaiBGk89F2zbfhar7QUkGklwElF63zaTcGvjixJ2xOI9kUpf2Ed6XV93O6/x8IAKn7mJe
	cA+PiPaGz2hISB998ZbbptgyPEcYRP7OBZ4qTMTUAj7gnbXJoiHUKD7hqA1EWQ2OAjbOgp
	M2QIemMkbMtrLJKdTLoaUQfkAtLp4UKBQ2G1gJUO/kK0YqUeOdFYA9JRs0f9evDHzRpp20
	H2wE9J+sPep5EvWs8YLTIr1bTeaoHC2bGtaYnW4Kpo6cWhENUGSCss4gQn5Smg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 May 2026 18:40:06 +0200
Subject: [PATCH v6 02/11] drm/bridge: add of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-2-f61c9e498b3f@bootlin.com>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_094041_606270_51D06DF8 
X-CRM114-Status: GOOD (  18.50  )
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

drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
into the @panel or the @bridge arguments, thus making a very partial usage
of this rather complex function.

Besides, the bridge returned in @bridge is not refcounted, thus making this
API unsafe when DRM bridge hotplug will be introduced.

Solve both issues for the cases of calls to drm_of_find_panel_or_bridge()
with a NULL @panel pointer by adding a new function that only looks for
bridges (and is thus much simpler) and increments the refcount of the
returned bridge.

The new function is identical to drm_of_find_panel_or_bridge() except it:

 - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead of
   of_drm_find_bridge() internally to return a refcounted bridge
 - is simpler to use: just takes no @panel parameter, returns the pointer
   in the return value instead of a double pointer argument
 - has a simpler implementation: it is equal to
   drm_of_find_panel_or_bridge() after removing the code that becomes dead
   when @panel == NULL

Also add this function to drm_bridge.c and not drm_of.c because it returns
bridges only.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v5:
- add missing ERR_PTR() in return statement for no-OF inline variant

Changes in v4:
- update function declaration in non-OF case
- fix grammar in comment

Changes in v2:
- return the bridge in the return value, not a double pointer
---
 drivers/gpu/drm/drm_bridge.c | 41 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  7 +++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b46c01db8d83..687b36eea0c7 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1582,6 +1582,47 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return bridge;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
+/**
+ * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
+ * @np: device tree node containing output ports
+ * @port: port in the device tree node, or -1 for the first port found
+ * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
+ *
+ * Given a DT node's port and endpoint number, find the connected node and
+ * return the associated drm_bridge device.
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * Returns a pointer to the connected drm_bridge, or a negative error on failure
+ */
+struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
+						 int port, int endpoint)
+{
+	struct drm_bridge *bridge;
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph is present in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return ERR_PTR(-ENODEV);
+
+	struct device_node *remote __free(device_node) =
+		of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return ERR_PTR(-ENODEV);
+
+	bridge = of_drm_find_and_get_bridge(remote);
+	if (!bridge)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return bridge;
+}
+EXPORT_SYMBOL_GPL(of_drm_get_bridge_by_endpoint);
 #endif
 
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index fdac9a526f38..4ba3a5deef9a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1327,6 +1327,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
+						 int port, int endpoint);
 #else
 static inline struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
 {
@@ -1336,6 +1338,11 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
+							       int port, int endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 static inline bool drm_bridge_is_last(struct drm_bridge *bridge)

-- 
2.54.0


