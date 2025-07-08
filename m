Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDAAC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL11Zrc4Yf6HM8VTZZGd0xEL+GSH49wFuy5GLaIUGiw=; b=1335Ge7tPwLc4UbFvzCvNppi/Z
	Svjdcilj4LwtBEljwvp/fYlLtweXTxCXOY7iTiWKLRukY+d34lyAND6DwtdQ7DwYuOe+N8w8TJKid
	dkLE3+RieEWK43MkY1TgX1bYUPSj6PufSG4Ip8fBgEyYmaSNWB3LS56RFAb9V0FMpxpLIMujktwwD
	xkmQTMnVlNyHgb1j/+QkpcZIfBfGSRFPpQgEwHy9DyOfOvU486uRDN1vZO+6l/64howFfAopSLCly
	hfPq7LOmptgB/6NL3ZYtajt26YZFilvL/sswcb8b50DBi9lVwChyDdZolquO8jCJYeX0IE0DWUfkF
	/nHr9eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBAY-00000005yHV-0wQr;
	Tue, 08 Jul 2025 16:27:46 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAZ1-00000005s1Z-1RrO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:49:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65A7E443E4;
	Tue,  8 Jul 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751989737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JL11Zrc4Yf6HM8VTZZGd0xEL+GSH49wFuy5GLaIUGiw=;
	b=lNjA39nYHMR7S8FKlzwj5dK+AEu+NbZJ67iaBykOQRSWnqMFeAWg4cuX/bWB9eYi21uzGg
	OwKnBFPdh+zYi+3FKxLuzIiu1mxZDdmdg9e0/X/0Uby813JcgOjiFx191yYn2h23wJxJrq
	lVRFZwJBwSzx+0faNgCIT+kLCWbX4EJUW/yrCgSZpCb6oKmb3nzaq6lW+c82MEWesRah7W
	M+B1rN/7mNDCqEfyhnI2MGCjj5OruX5UZGUV+r2Xk1ybrss+D1zCMeQ/vivNWjL1AcNS87
	+afHDwr/tUxbd7XVdimxiw+84IiJAaHAu9tPvHJ0+hikEit/3hTdkn1ESGG+Lg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 08 Jul 2025 17:48:18 +0200
Subject: [PATCH v9 1/5] drm/bridge: add a cleanup action for scope-based
 drm_bridge_put() invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-1-db1ba3df7f58@bootlin.com>
References: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
In-Reply-To: <20250708-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v9-0-db1ba3df7f58@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtt
 hhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084859_518092_0C5AA582 
X-CRM114-Status: GOOD (  14.66  )
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

Many functions get a drm_bridge pointer, only use it in the function body
(or a smaller scope such as a loop body), and don't store it. In these
cases they always need to drm_bridge_put() it before returning (or exiting
the scope).

Some of those functions have complex code paths with multiple return points
or loop break/continue. This makes adding drm_bridge_put() in the right
places tricky, ugly and error prone in case of future code changes.

Others use the bridge pointer in the return statement and would need to
split the return line to fit the drm_bridge_put, which is a bit annoying:

  -return some_thing(bridge);
  +ret = some_thing(bridge);
  +drm_bridge_put(bridge);
  +return ret;

To make it easier for all of them to put the bridge reference correctly
without complicating code, define a scope-based cleanup action to be used
with __free().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

This patch was added in v7.
---
 include/drm/drm_bridge.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d2454ba83db36f8f0d475b0b37468c2ebe7e921d..88e7a41c39eb1163bd455003e9ca40468932d97a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_BRIDGE_H__
 #define __DRM_BRIDGE_H__
 
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -1227,6 +1228,9 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge);
 void drm_bridge_put(struct drm_bridge *bridge);
 
+/* Cleanup action for use with __free() */
+DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(_T))
+
 void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 			      const struct drm_bridge_funcs *funcs);
 

-- 
2.50.0


