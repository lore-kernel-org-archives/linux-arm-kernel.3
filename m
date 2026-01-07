Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A1CFD626
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcPTDN7TfpXL+5tbxQ2V14FG9zJXkIPfnt9CMkeJHG4=; b=T8qWsU9d7MQ/1lMk7LDyS25I80
	h+tDBwNFqQCqj6UsAGFBjG7CtK8MAe/I0shpxO9WXm4fFV4SaXnt2bF3PkvJr+9uLvw8BznH3xZ1+
	+XUoRXgL2oFer8Ky5hzx2FIereEx/hwOpHfhMP0W9uO7kVaHEipQXikQjD1rgxv/xqgC/z57tLGGD
	me2SbRarzhNofNstkPkPdZ4eKgH4v7KCHYd5fhQFg8c8QtGDHyCsHKmFZGLdcXvE88ye9UgIzyfgG
	WQ1uUrr8y+iweDKrsLFtv/jlmV4h/lQDIjSnckXH7ntlGqrmhKgMok7WJevHGzgxzW8Jl1lzaA3Ki
	abSCKqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMD-0000000EyIQ-0lea;
	Wed, 07 Jan 2026 13:13:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMA-0000000EyGC-2jdH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:13:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0150CC1EC8B;
	Wed,  7 Jan 2026 13:13:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C945606F8;
	Wed,  7 Jan 2026 13:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F64A103C8741;
	Wed,  7 Jan 2026 14:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kcPTDN7TfpXL+5tbxQ2V14FG9zJXkIPfnt9CMkeJHG4=;
	b=dfq0fNtOTSUa9Ae1iTqDZCcgA0P+8l1KsU+tx56jFXhdxp3NbglAEKOkeS+qqhJCjOM05w
	B1sJJ40Emdj3FCPgFIpcYEvxDqoMPFwIA9l1LFbzxql6wtkOJKfn7Rl0gqi2IP3pXf42Qt
	fqkSi6AlE5KOW7Rlwm3Ksz6ABMZFaL7Z7/35mTrvHrRFrPu3KDMnBMKU1sHsJ0PZ8FBQsK
	bIiHH0XXyEDvSJULVP+F8pmizTaMxUpDdQufVzWFLf71pMZZ8HqpidQsqm3UZ2lkhg1/Mk
	KP1mcGlA+a0f4/wDR45L2cVEBghP1XBBFAb8VkvcOmJz0zKlkiDWFFp1QfByiw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:55 +0100
Subject: [PATCH 04/12] drm/bridge: thc63lvd1024: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-4-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_051346_845678_75C72FA8 
X-CRM114-Status: GOOD (  11.56  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 2cb7cd0c0608..c804222846c3 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -32,7 +32,6 @@ struct thc63_dev {
 	struct gpio_desc *oe;
 
 	struct drm_bridge bridge;
-	struct drm_bridge *next;
 
 	struct drm_bridge_timings timings;
 };
@@ -48,7 +47,7 @@ static int thc63_attach(struct drm_bridge *bridge,
 {
 	struct thc63_dev *thc63 = to_thc63(bridge);
 
-	return drm_bridge_attach(encoder, thc63->next, bridge, flags);
+	return drm_bridge_attach(encoder, thc63->bridge.next_bridge, bridge, flags);
 }
 
 static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
@@ -132,9 +131,9 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 		return -ENODEV;
 	}
 
-	thc63->next = of_drm_find_bridge(remote);
+	thc63->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
-	if (!thc63->next)
+	if (!thc63->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,

-- 
2.52.0


