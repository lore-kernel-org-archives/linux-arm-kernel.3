Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F84C83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlBByp9ti89jRGF9OoLKlYZnjR1rawwpMH2ftXRDETg=; b=BfyOScbjDv7wZ7B0gHkW0xAgv4
	O2yLkgfE/z+1cRDu7TA1I0tECkVEJDeJ9RaFOnfj8GzsHFCX6f9BkWt+jegplfw7u/6LpSN55Yncf
	goN9r4XuXtj9yGfhGgGFsTE9U0poDc4Wb3GVog7of0Mg6qOVyIqAKF6q9gqB3+mgrR5VkeGaZTBko
	Bbzw2oxk4pr/63Jqy3Wh/vPJJh5zoGTw36JbWNkRWemxlQ2dxRUwQ/oRDKhQjHvBWXqWwsaC28Zj8
	l0dmmXl2jFnBTuCs72EwM4JYoKabVxaukS2i6kEnV0YE8zadvvhBnrNuss1OI7PMuojZP+qhoZ4rd
	Brgxn2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoD-00000009xSP-10lD;
	Wed, 09 Jul 2025 21:58:33 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXyU-00000009LpD-1z2I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 16:48:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F05DF43B29;
	Wed,  9 Jul 2025 16:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752079729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlBByp9ti89jRGF9OoLKlYZnjR1rawwpMH2ftXRDETg=;
	b=fV0Tw45CmoH2FMF+8e2uW9Y7+dLKZv3owi6Iv3XklJgDA/vlAlNCZEDIRB0iYIBvzfpmo7
	mWxe5y+tS49OMCzJof3OYG1Vy1TvEh35xQRny55ZkFALtcTtn+P72RaK1HVPe1s+CCaaoz
	/MiG9LWYqaZXB9QwCSTU2GQpJz4PEMa/q0CbJw+WXQu03v0s39rcyTKZUND5jyK7AvpccN
	LoUsve8upOSeaz512WO0M2uSEgDR/U/87Tb/lgccnHtYEXviFNXC2Qzkequ5tf1SXuPzYX
	D8yE+cSLDjMOLoGoUQEW9KdB+bX6v0L9YxQweFwY3VNAuYv4qQ51uIbj9HrGgA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Jul 2025 18:48:02 +0200
Subject: [PATCH 3/9] drm/bridge: imx93-mipi-dsi: use
 drm_bridge_chain_get_last_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-3-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehvihgtthhorhdrlhhiuhesn
 higphdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_094850_657837_11401218 
X-CRM114-Status: GOOD (  11.12  )
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

Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
two invocations of drm_bridge_get_next_bridge() per iteration.

Besides being cleaner and more efficient, this change is necessary in
preparation for drm_bridge_get_next_bridge() to get a reference to the
returned bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index bea8346515b8c8ce150040f58d288ac564eeb563..8f7a0d46601a41e1bfc04587398b0f1536a6a16c 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -492,14 +492,12 @@ static int imx93_dsi_get_phy_configure_opts(struct imx93_dsi *dsi,
 static enum drm_mode_status
 imx93_dsi_validate_mode(struct imx93_dsi *dsi, const struct drm_display_mode *mode)
 {
-	struct drm_bridge *bridge = dw_mipi_dsi_get_bridge(dsi->dmd);
+	struct drm_bridge *dmd_bridge = dw_mipi_dsi_get_bridge(dsi->dmd);
+	struct drm_bridge *last_bridge __free(drm_bridge_put) =
+		drm_bridge_chain_get_last_bridge(dmd_bridge->encoder);
 
-	/* Get the last bridge */
-	while (drm_bridge_get_next_bridge(bridge))
-		bridge = drm_bridge_get_next_bridge(bridge);
-
-	if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
-	    (bridge->ops & DRM_BRIDGE_OP_EDID)) {
+	if ((last_bridge->ops & DRM_BRIDGE_OP_DETECT) &&
+	    (last_bridge->ops & DRM_BRIDGE_OP_EDID)) {
 		unsigned long pixel_clock_rate = mode->clock * 1000;
 		unsigned long rounded_rate;
 

-- 
2.50.0


