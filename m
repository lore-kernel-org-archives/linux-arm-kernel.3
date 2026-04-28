Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D47FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eo/paXSzW8BfmZpRrcP3BLHcobk12GzzlOo9kVEISI=; b=H7cjHoQjXXDSKoYXEJoljt22HX
	jjFRrKuoPkj6L9+xFsGtPcp2yTlPxNxi+3X0ovbzXBhlmZFtZMsn6IAKl9cIiTibFVX8lkXf+6B1u
	4rtd5BVPy9P/8Gx1VvcN7a9oPwhrKnrQ8a4REZOUkDTxvoKvv2IEyMgmEMp1ZFvBXgoF0g/nONyuY
	Kp1eYiIHd73kv7p0uV0NMZx4wn14/vS9dv6rFWWPry2R0IfchuO6iNsU2pgbd3g+3jwnuE/cQsB9M
	gR5flxWw87ITYIsqhUP4cl+BIeor8cjdHs2dkCaikewUcfFiOd9K2uOAUwo12v9s9vVrNL1MJrRPM
	pc0Y3fHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeYG-000000013am-3Rkq;
	Tue, 28 Apr 2026 09:16:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeYD-000000013YV-3T8P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:16:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 505641A346B;
	Tue, 28 Apr 2026 09:16:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C9D3601D0;
	Tue, 28 Apr 2026 09:16:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E8C610728631;
	Tue, 28 Apr 2026 11:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777367772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9eo/paXSzW8BfmZpRrcP3BLHcobk12GzzlOo9kVEISI=;
	b=gZtWpc3ZSRRnd4uPBXmVObuxc8b70mdizyNzto8rtZS1uImrEoGxPYW2eTiuMOOfzCqDjp
	Gw8wYAtxuRZInF9j7CBINLwawUlx+8x6aem3/QfVJSj+bmiTPXWXg0kTLu3vZUieVtk2wM
	n6ut4ZYM14a13BLpseFPBxKlMdcLVd88zkxJCzwIRgDx3f/fxoRgL02agg+PJ56wJPxsf1
	vuXmJAoFzrhpr9gWE4FcL7Df2HczNsU97jnIx+AXD3Uw89/vzRdru5i8q3lVsrAgd5vMQn
	0qdgr8ZQW+Fq2cevjahutli9RnM0D2qEv45DR87Eo1ZksS86gKaeuFbz1KsukA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Apr 2026 11:15:47 +0200
Subject: [PATCH v2 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-1-4300744a1c47@bootlin.com>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_021618_017747_E7E6A47B 
X-CRM114-Status: GOOD (  11.61  )
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

Most functions returning a struct drm_bridge pointer currently return a
valid pointer or NULL, but this restricts their ability to return an error
code describing the error kind.

In preparation to have new APIs that can return a struct drm_bridge pointer
holding an ERR_PTR (and for those which already do) make drm_bridge_get()
and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
pointers.

This will avoid annoying error checking in many places and the risk of
missing error checks.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/all/20260318152533.GA633439@killaraus.ideasonboard.com/
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/all/omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Patch added in v2
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 986e4c79a4e0..cea5babbe99e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -282,7 +282,7 @@ static void __drm_bridge_free(struct kref *kref)
 
 /**
  * drm_bridge_get - Acquire a bridge reference
- * @bridge: DRM bridge; if NULL this function does nothing
+ * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
  *
  * This function increments the bridge's refcount.
  *
@@ -291,7 +291,7 @@ static void __drm_bridge_free(struct kref *kref)
  */
 struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
 {
-	if (bridge)
+	if (!IS_ERR_OR_NULL(bridge))
 		kref_get(&bridge->refcount);
 
 	return bridge;
@@ -300,7 +300,7 @@ EXPORT_SYMBOL(drm_bridge_get);
 
 /**
  * drm_bridge_put - Release a bridge reference
- * @bridge: DRM bridge; if NULL this function does nothing
+ * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
  *
  * This function decrements the bridge's reference count and frees the
  * object if the reference count drops to zero.
@@ -310,7 +310,7 @@ EXPORT_SYMBOL(drm_bridge_get);
  */
 void drm_bridge_put(struct drm_bridge *bridge)
 {
-	if (bridge)
+	if (!IS_ERR_OR_NULL(bridge))
 		kref_put(&bridge->refcount, __drm_bridge_free);
 }
 EXPORT_SYMBOL(drm_bridge_put);
@@ -319,8 +319,8 @@ EXPORT_SYMBOL(drm_bridge_put);
  * drm_bridge_clear_and_put - Given a bridge pointer, clear the pointer
  *                            then put the bridge
  * @bridge_pp: pointer to pointer to a struct drm_bridge; ``bridge_pp``
- *             must be non-NULL; if ``*bridge_pp`` is NULL this function
- *             does nothing
+ *             must be non-NULL; if ``*bridge_pp`` is NULL or an ERR_PTR
+ *             this function does nothing
  *
  * Helper to put a DRM bridge, but only after setting its pointer to
  * NULL. Useful when a struct drm_bridge reference must be dropped without

-- 
2.53.0


