Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3CFF34C49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uVyC++V1UmVV258SySNjnH/QWEzHB3vGKW3rS3VhpE=; b=xhL+hJS4ZqfWQmtwlD4AJMx5WB
	+neYCAUAWOGYTAc+j4TnDsIAU3FEoYGImOXFEcyMepRaLCuy78ObEdaKK1HTTvip0Awu29932w0HX
	uG42AuCNtzUmpeHVswQ+Js4HKi5oA+r1re/WpYdNcm5QJebPFBStaI6ZWgXY9x0e4JJrgApNSkw9x
	TkkvGHLU2n9Bd1P4H7wWM4YIK6nwtoo2oCbeVBL19sUb5pXgkao5KsoWJrEQRxoa1goZ2pGKGkkSa
	udx525/KBh6PJIFTmOowfT0ZhFtRLwMUCYHJ80U8a5CU25QI3fjWDqGnvdogCx1lXe/zqmj8Rp2vt
	F85nru0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHoX-0000000FngG-37pk;
	Mon, 13 Apr 2026 13:58:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHoU-0000000Fnea-3QtE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:58:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06EB94E429EA;
	Mon, 13 Apr 2026 13:58:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4FA75FFB9;
	Mon, 13 Apr 2026 13:58:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8366410450084;
	Mon, 13 Apr 2026 15:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6uVyC++V1UmVV258SySNjnH/QWEzHB3vGKW3rS3VhpE=;
	b=z/IAyX3cr6ydhmF+62EMz8NfkSsjebBn7/omwngWBm8Nn4uyX7nYklonTQ5fXdLL5QiOYy
	+1THmm5QjgiJqYt3Gx6EHZqO1sYrGB5+soslEjRulOl7J0x7FLcZRIV7rOcXvFvfvjQPS3
	WpTDOcLtHwMq4fovz2LnVZRTWM3zCfi+WcZwtPZkqWq6hglUMRpXS6gA+3cjLhRjk/EjWx
	+ENFvJi4VWk66EXtK3T72MsaL/pERdNNZTfe8S9pK84OG09lOVXS/NVr5a8rhwY120mzk2
	gWIkuNkFFsjLlXjxZerjx1HbvuXqJ8hxOjxcp8YXLCaId3XpvSlQWExCz5zH5A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:33 +0200
Subject: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_065855_125845_A375FB8F 
X-CRM114-Status: GOOD (  17.79  )
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
 - is slightly simpler to use: just takes no @panel parameter
 - has a simpler implementation: it is equal to
   drm_of_find_panel_or_bridge() after removing the code that becomes dead
   when @panel == NULL

Also add this function to drm_bridge.c and not drm_of.c because it returns
bridges only.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  9 +++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ba80bebb5685..e51990b74417 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 	return bridge;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
+
+/**
+ * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
+ * @np: device tree node containing output ports
+ * @port: port in the device tree node, or -1 for the first port found
+ * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
+ * @bridge: pointer to hold returned drm_bridge, must not be NULL
+ *
+ * Given a DT node's port and endpoint number, find the connected node and
+ * return the associated drm_bridge device.
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * Returns zero (and sets *bridge to a valid bridge pointer) if successful,
+ * or one of the standard error codes (and the value in *bridge is
+ * unspecified) if it fails.
+ */
+int of_drm_get_bridge_by_endpoint(const struct device_node *np,
+				  int port, int endpoint,
+				  struct drm_bridge **bridge)
+{
+	if (!bridge)
+		return -EINVAL;
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	struct device_node *remote __free(device_node) =
+		of_graph_get_remote_node(np, port, endpoint);
+	if (!remote)
+		return -ENODEV;
+
+	*bridge = of_drm_find_and_get_bridge(remote);
+	if (*bridge)
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+EXPORT_SYMBOL_GPL(of_drm_get_bridge_by_endpoint);
 #endif
 
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index a8d67bd9ee50..ad93597cd622 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1327,6 +1327,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
+int of_drm_get_bridge_by_endpoint(const struct device_node *np,
+				  int port, int endpoint,
+				  struct drm_bridge **bridge);
 #else
 static inline struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
 {
@@ -1336,6 +1339,12 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline int of_drm_get_bridge_by_endpoint(const struct device_node *np,
+						int port, int endpoint,
+						struct drm_bridge **bridge)
+{
+	return -ENODEV;
+}
 #endif
 
 static inline bool drm_bridge_is_last(struct drm_bridge *bridge)

-- 
2.53.0


