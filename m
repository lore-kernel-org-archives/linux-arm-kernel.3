Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC074D609D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5biOjWznSotMSX3PBR3P8jtLjxKY2ayNXnssZ5+ra3o=; b=Ugkv664gbt7UVG8NE4tSfxcDem
	qTfzgSN2S5pA1frwGg2gRFlkL6y0SHCI4Cz+iXEpOKGORzrtx0KMzex4oTvjOcP3YN8OpJ+ZVk6EM
	wmS0lZPFE9tXcZz8KTNPurD7ZREA1zPZDwjE/71b4Z0beZJalTBZtPaj555rw/uToJHaYfMamQGlZ
	oF3goKe4T+j5j19XA4uTDsJN7SF+3sBqYgBHNbzwzD1nD5J14zGPvf9t0uS39NxnjER5Ge0exSQ75
	Ihtqi/MGnyWjLcWDJiuyFOXt4UkO+ix7rYuV0GtoKIoeaU/8TDtgsy4aJOOiDclYI5CZc1H+UnUWX
	KuWnu6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKr-00000005dsO-3XP1;
	Tue, 16 Dec 2025 17:59:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZKn-00000005dnW-1s5B;
	Tue, 16 Dec 2025 17:59:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2C35CC1A582;
	Tue, 16 Dec 2025 17:59:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A04C66071C;
	Tue, 16 Dec 2025 17:59:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 205B7119A97E7;
	Tue, 16 Dec 2025 18:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5biOjWznSotMSX3PBR3P8jtLjxKY2ayNXnssZ5+ra3o=;
	b=smKGPw0dbCycuh0QpfQ/JZGiEHYRjtmgUHE6JH9usTO4AKoa3t2Qcy0/SYQOsfkw7tcw7H
	aaGd33KUYT9spKY69+UAZpDmCSQ75wjkqExc3+Oxs2fP3cku2VPBL4lqSVzan6Jh9PkGtp
	cFzzB2viEnKcHtOuZvzTgzD2Tscx1WCxSfxfdOJEexgyPxItMTS+t7+kKJnC8B/jU8F/jO
	ZThf5bSqsGOblAI5dsArem9fAW9sv1XfAuZddW+jrUIGeNTildibYUtqfwA6blof6ptaZK
	Rn90Fn6hbcgm2sBQeyXxSqWKCmXKWaK9a6ymCCBlezo8VymMZldylcdlhEQQag==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:37 +0100
Subject: [PATCH v3 04/22] drm/bridge: make of_drm_find_bridge() a wrapper
 of of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_095942_735965_16D3FD1D 
X-CRM114-Status: GOOD (  13.76  )
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

of_drm_find_bridge() is identical to of_drm_find_and_get_bridge() except it
does not increment the refcount. Rewrite it as a wrapper and put the bridge
being returned so the behaviour is still the same.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename
- fixed kerneldoc syntax for non-kerneldoc comment

Changes in v2:
- Added comment to document why we put the reference
---
 drivers/gpu/drm/drm_bridge.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f612d486cad0..64aa69dcf46f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1529,19 +1529,17 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  */
 struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
-	struct drm_bridge *bridge;
-
-	mutex_lock(&bridge_lock);
+	struct drm_bridge *bridge = of_drm_find_and_get_bridge(np);
 
-	list_for_each_entry(bridge, &bridge_list, list) {
-		if (bridge->of_node == np) {
-			mutex_unlock(&bridge_lock);
-			return bridge;
-		}
-	}
+	/*
+	 * We need to emulate the original semantics of
+	 * of_drm_find_bridge(), which was not getting any bridge
+	 * reference. Being now based on of_drm_find_and_get_bridge() which
+	 * gets a reference, put it before returning.
+	 */
+	drm_bridge_put(bridge);
 
-	mutex_unlock(&bridge_lock);
-	return NULL;
+	return bridge;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif

-- 
2.52.0


