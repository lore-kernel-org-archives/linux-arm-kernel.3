Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AE1CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klEnOYxwmyhP43dH3LhaM6WGup/8KCXunSlgbkKjiG0=; b=XlXHw4m9f7wW7cDQv11T8I9n+4
	XTHHaix35P9fv4M3mFkwix9OFU7c1Wswc3POcvbsIIIpaDb8k1ubLedvWjGSSmxe5tMyaIgI+uulf
	RaiRao61y9D5t8Sv0ZY2qesRRAEq4lIZlAOks1DevYHRVyO4fpmF7DVMTjwKE7DzA9wKnPePbeFWt
	uqxryj6PcGsj8SIunMKThlnXF5khOyMJhtjGcPn38LXpTXyaWtEgYjs77Fo1Cp/q5UC1vmhRxUTrF
	IV1Xp0fEKiZEDHx/3rd67mS0nalD3jKFy4BEffIiCFoWxnk24rXJf8OHr+HzV2zySwNrVFiSFUV4M
	kUEXgvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqno-0000000CxYH-0KxL;
	Mon, 04 May 2026 10:45:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqnl-0000000CxXb-1lHh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:45:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0312E4E42BBD;
	Mon,  4 May 2026 10:45:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7CA75FD5F;
	Mon,  4 May 2026 10:45:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 302A211AD268B;
	Mon,  4 May 2026 12:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777891522; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=klEnOYxwmyhP43dH3LhaM6WGup/8KCXunSlgbkKjiG0=;
	b=J1bP7p5jLRAg4yL8WnncjKCDTZOj3ZAmRZEkdaNKTsHWgSFlmnGYxSRH6NnxbcF3+mjzwB
	zTOaH9kSr/PP6nhe86m8Epojv57ra2ZTCBZVSldj38oAYD5+frkyg3NkGc5usfJBqZBMaD
	90oULpBA4oX8S68g8mOgEXoJMf45WM9AUMFFdKconV/NE2c8D4RvI0eY4xEp4FWJl7dzx3
	7sQmaW8+VZRLUf16TgKsoU83BaJf46ctk123nu78CwoUzTIwP1GxWMTWPADT2y85ramMjx
	LetAO3dfS8Ycrmi8Bj2QA2G5kyTA0QEtoPVIL7dTDmebjm/aEg285JChhzLaAw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 04 May 2026 12:45:04 +0200
Subject: [PATCH v4 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_034525_881709_B4DA1AD7 
X-CRM114-Status: GOOD (  10.86  )
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v4:
- removed incorrect change to drm_bridge_clear_and_put() kdoc

Patch added in v2
---
 drivers/gpu/drm/drm_bridge.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d4b3478258ec..6fb71de6d22a 100644
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

-- 
2.53.0


