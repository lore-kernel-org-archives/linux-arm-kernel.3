Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4591ACD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWFWjJHgZiy/GLN2e6ewnZP2ttGIyfRahDWZJrnWXfY=; b=L+eJkkZPHRgrk3jgySq7yLdl3f
	kOs5sLBxQCmkink7VSUqx/i/eRS/BunZNrRdT+s08gZkj+9S11lrqdl+27uvd12bNA33NpUR+LJEE
	tsMG/MvPl1JwYe0nYFVGqhy51/g49ZL3hbGdyYkGUsaXTyG1FyE8oHXJG/pUYpcI+usqDzJOWQtrV
	PbZ6n9biZxEeUmhtdok0WinS2o+IB9Jfk4tipvD+zDhWvB/3XP3v0pXbdR9lcRBrLl9v2J/syyUJC
	nXFNQO80MfhBNnpKwghVLNQ1FA35Igd245UzNclibaDuQil40ckkJU+u/J89T2g0PuqLwzXSaeUnA
	qEvJBK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb68-00000003m3f-4A2N;
	Mon, 08 Jun 2026 14:37:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb68-00000003m3T-1BU4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:37:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB865437F3;
	Mon,  8 Jun 2026 14:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186691F00893;
	Mon,  8 Jun 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929423;
	bh=gWFWjJHgZiy/GLN2e6ewnZP2ttGIyfRahDWZJrnWXfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EBqKxcsSlkaprRmAbhUyDpltht1p7+kiEXNT/mT7clPqtO40oODZgiMH7cKlhvtsz
	 uJtCJ1n+oMaPTG4Ys9yUlNjEYzFnt49qgbibw8K6hq4kLrpVWqKB3CancY7f/5HTfD
	 2Pnt+eM3IOpa7z5PuMxbA8EzMiZAhLs6wj+yLkQDtvJIR3rMGl2loScY6os0eMBUSK
	 DozuV8CGM95iArTqKUweKRlQ4uDAp5zgj9XkqYRERGJkmBRtjG34LegOQBpv1W/Cl+
	 /oNWrmKamP6UmSDs1CLY9w4NRNu42JyoUsUUHKAuMJXWIVKAYR1nVN3nxWp1ysMjuD
	 e9uRlnUeH6iWA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:35:56 +0200
Subject: [PATCH v2 14/78] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-14-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NEPayvVmX3q7Wj0iTg7FEvUzK//M1H9vGJB08M5p7Hc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql70vly32//oqaccaw6hv02dnzrTSPeEqVd9ul3qLn
 7H191+BjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARxSWMDStWJTCWTClskpke
 mG794XnBtae7ri65ebj5trvlKo9eNlW3JeIuu09qXFx//Mvf2avL1zPWhwdE3mMMrlqmybAu82/
 oiff3NLr+/bQPeyZ7LuemoG/OQtX+JsVu0xmNGrZHK806A9cAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 7d5fda7173e5..a31d4fc76f35 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -129,11 +129,11 @@ static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
 	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
 	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
 	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 {
 	struct device_node *remote;

-- 
2.54.0


