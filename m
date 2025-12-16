Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31221D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPqr5fYrnS8CLbVsYlAAOMPINrx1k7wIo/fj4ildkQw=; b=GKIWjivpjrf/pwsB/HGP3CSuqV
	4cjURNa3IhGXDRCd0QT5uc0Ew6EOpQa/+3XgB309HCMucR3f3dWkwwM5fe0mNvhkvL/qtKTNbUpx0
	My99ixvzZm58nFoIv7Jx5wfrQhTbMUxVbpOzVpAZ5iDKZg8a1ky3aJnxWzHKDjpkLlXaiGpNt2JFY
	pOF7hA6lKZ7M53LOASCCA5TGomOMJrNUgqYu96K3pOZ+lq4Rs0AdqswQ2OEx6CzxTKQFUJe3tDYT4
	z1n2vg3Ni8W7B+W8d1jE7NhBFEctV7a8JN2MjVj0IjB9jJUcFbvIIVzGzJIECanB7xkaZt5eJDRws
	Bgab3F2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKj-00000005dlP-2vRh;
	Tue, 16 Dec 2025 17:59:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKg-00000005dhq-1we3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:59:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 297781A2256;
	Tue, 16 Dec 2025 17:59:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECA186071C;
	Tue, 16 Dec 2025 17:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C03FD119A97D5;
	Tue, 16 Dec 2025 18:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NPqr5fYrnS8CLbVsYlAAOMPINrx1k7wIo/fj4ildkQw=;
	b=uYmhz63hDysFTP2ZdC5B7bg5N5SyGTrUKhFkZpvYpwMAj2KPZvqH7tPbMLpSBqlEph7Ra3
	t+StPoRWnNDnUtDKMk9XaatE/J3/+rP3sLJ9eKYNRCyGrRW+Ds1ssvVFyxHLDpO0ZUeqX+
	zuXWK/DQ7dmGRjlN1+Jvaq1whtQlK2IT0y9ef5cxY+lpapJQeZq3gWW8UWDgkbHafDTHsI
	jSej3zPzP9+WmEUnthexDvX5wwJdziYiZU6E1z/mkzdKn2+mUrguy7GwCJgrBWd0QrfsGv
	kY4WBP3U/lAdTSCwICo4P+clwcUJbyh85mSJsbhuC0hixYH7PC7jO31C3/B3jg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:35 +0100
Subject: [PATCH v3 02/22] drm/bridge: deprecate of_drm_find_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-2-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_095934_760752_D4C83EB3 
X-CRM114-Status: GOOD (  16.32  )
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

of_drm_find_bridge() does not increment the returned bridge
refcount. of_drm_find_and_get_bridge() is to be used as a replacement.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename

Changes in v2:
- expand comment to mention why this function is dangerous and what users
  should do about refcounting
---
 drivers/gpu/drm/drm_bridge.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0dbc8b59c3be..f612d486cad0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -361,7 +361,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  * @bridge: bridge control structure
  *
  * Add the given bridge to the global list of bridges, where they can be
- * found by users via of_drm_find_bridge().
+ * found by users via of_drm_find_and_get_bridge().
  *
  * The bridge to be added must have been allocated by
  * devm_drm_bridge_alloc().
@@ -422,9 +422,9 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  * @bridge: bridge control structure
  *
  * Remove the given bridge from the global list of registered bridges, so
- * it won't be found by users via of_drm_find_bridge(), and add it to the
- * lingering bridge list, to keep track of it until its allocated memory is
- * eventually freed.
+ * it won't be found by users via of_drm_find_and_get_bridge(), and add it
+ * to the lingering bridge list, to keep track of it until its allocated
+ * memory is eventually freed.
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
@@ -1510,6 +1510,20 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  *
  * @np: device node
  *
+ * This function is deprecated. Convert to of_drm_find_and_get_bridge()
+ * instead for proper refcounting.
+ *
+ * The bridge returned by this function is not refcounted. This is
+ * dangerous because the bridge might be deallocated even before the caller
+ * has a chance to use it. To use this function you have to do one of:
+ * - get a reference with drm_bridge_get() as soon as possible to
+ *   minimize the race window, and then drm_bridge_put() when no longer
+ *   using the pointer
+ * - not call drm_bridge_get() or drm_bridge_put() at all, which used to
+ *   be the correct practice before dynamic bridge lifetime was introduced
+ * - again, convert to of_drm_find_and_get_bridge(), which is the only safe
+ *   thing to do
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */

-- 
2.52.0


