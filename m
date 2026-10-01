Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5801CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XTtfuZMf/px2Gzgaw2H+GrIyxEhvdX74xCMTddevdQ=; b=1g/TkPQJpAUfXCIQdDCw+Kuor9
	fKsB3vlvkNPnyHWdXXYY6u4XW7GWIKu/Cm88U26kcUiDVd/UyllDDKU8EnQVouzgxYT+83DpI2vMM
	jwVGh2sGCBkCECYyrdcVXXJvWsU9dt2spyeJDQ841sApx557lfqlKOKxULxeY1buFaYctQsrBojRg
	ZlmpHLRRF3JNsfKwI+yXGXrQdu4OYqn981uZCRM1zyObrMc3Zos27Ecc3kdVDl2I2N8L2KCRAE8gs
	fxKt4FePuKkDiL9otV+yPhG/QEqjX4Ql0nZ7kuqLWZo++jKKQ1xFdDGVaeCRFfY4FOho5KCTpdjdC
	gjE3umWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8b-000000096hT-0VXD;
	Thu, 01 Oct 2026 12:43:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCG8W-000000096cl-2G67
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:43:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 02A8A4E416CC;
	Thu,  1 Oct 2026 12:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C986960341;
	Thu,  1 Oct 2026 12:43:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E9A110328112;
	Thu,  1 Oct 2026 14:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0XTtfuZMf/px2Gzgaw2H+GrIyxEhvdX74xCMTddevdQ=;
	b=iZmIuRuwWoly8Yq/YGcvocO2Sh1+h8k4Kp25aR/WIyDgzyn118jJvJMXd+W2no6kLX+nGg
	S79Pn337JFilco5no50DOGFSjMvUdw4Qg/JVibC1IL2PF0szWnYwzq8m0u3APfkQl9oJ9w
	Q7dCzE5LHmaQGxwbycpDwqyl3q9zMaFw4gyJ5FVmGIu8e6hzNn/OAQUzV8k8Vgs+qf7I7h
	7VQpKzSr55brH1B7jjHzJ9ERpceVnv5DEW9bvSWWKPleozJlzu3bRD7RdF5NE2cSy3h2bv
	xZFFcqHZsBnMgdqDxz9i2qjQmuufDWP5bs6dQNhsg3cXZc6ROStjOwJn7qWkAQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:32 +0200
Subject: [PATCH RFC v2 10/24] drm/encoder: add drm_encoder_cleanup_from()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-10-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_054344_950662_9C2BE213 
X-CRM114-Status: GOOD (  17.30  )
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

Supporting hardware whose final part of the DRM pipeline can be physically
removed requires the ability to detach all bridges from a given point to
the end of the pipeline.

Introduce a variant of drm_encoder_cleanup() for this.

Take particular care to not try to detach non-attached bridges. This is
needed because when 2 or more bridges are removed not in the backwards
order, drm_encoder_cleanup_from() is called more than once for bridges
closer to the panel.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: in theory drm_encoder_cleanup() is now a superset of
drm_encoder_cleanup_from() and may be simplified to jut call
drm_encoder_cleanup_from() and then do the extra actions. However the
common code is subtly different in terms of locking and checks, so this
would complicate the code in this patch and has thus been kept separate for
the time being. Reimplementing drm_encoder_cleanup() by using
drm_encoder_cleanup_from() is still an option, either in a new iteration of
this patch or as a future patch.

A much simpler and now obsolete version of this patch (missing locking and
checks) previously appeared in
https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com/
---
 drivers/gpu/drm/drm_encoder.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_encoder.h     |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 0d5dbed06db4..40ece477b302 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -179,6 +179,44 @@ int drm_encoder_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_encoder_init);
 
+/**
+ * drm_encoder_cleanup_from - remove a given bridge and all the following
+ * @encoder: encoder whole list of bridges shall be pruned
+ * @bridge: first bridge to remove
+ *
+ * Removes from an encoder all the bridges starting with a given bridge
+ * and until the end of the chain.
+ *
+ * Does nothing if the bridge is not attached to an encoder chain.
+ *
+ * This should not be used in "normal" DRM pipelines. It is only useful for
+ * devices whose final part of the DRM chain can be physically removed and
+ * later reconnected (possibly with different hardware).
+ */
+void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
+{
+	struct drm_bridge *next;
+	LIST_HEAD(tmplist);
+
+	/*
+	 * We need the bridge_chain_mutex to modify the chain, but
+	 * drm_bridge_detach() will call DRM_MODESET_LOCK_ALL_BEGIN() (in
+	 * drm_modeset_lock_fini()), resulting in a possible ABBA circular
+	 * deadlock. Avoid it by first moving all the bridges to a
+	 * temporary list holding the lock, and then calling
+	 * drm_bridge_detach() without the lock.
+	 */
+	mutex_lock(&encoder->bridge_chain_mutex);
+	if (!list_empty(&bridge->chain_node))
+		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
+			list_move_tail(&bridge->chain_node, &tmplist);
+	mutex_unlock(&encoder->bridge_chain_mutex);
+
+	while (!list_empty(&tmplist))
+		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_node));
+}
+EXPORT_SYMBOL(drm_encoder_cleanup_from);
+
 /**
  * drm_encoder_cleanup - cleans up an initialised encoder
  * @encoder: encoder to cleanup
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index eded7c34481a..d2a59f95692f 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -324,6 +324,7 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
 }
 
 void drm_encoder_cleanup(struct drm_encoder *encoder);
+void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge);
 
 /**
  * drm_for_each_encoder_mask - iterate over encoders specified by bitmask

-- 
2.55.0


