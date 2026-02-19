Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8650E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pNIi4I5TUEv9OrUFO8TgfWm/JLXvdDGc4m/8H/tykc=; b=xsD/JsdJzpLQxAWw1lCziiTjjD
	tM2+/uJzNnYZWnJsm+xVyz/ufjv+lvRnnq8ZVSccsAWSy8W1M1m+dZtcXk7btlzeovm8TE+69CVy4
	HRajoUTP3MJCm68O1Dt8DZKpVLN2QqZSPY0GdDGcaeadKtIsWtjkbdi+QfQK9Fsht/kzCtLUueEz+
	ZuSesMcMQBZvF6z4nZOPARdCqwlsbBSStWJruJqjr2MjgyVzsAuO0YkjdTCQVUmc2NjEZ2d8ptSla
	jR+yShitHzLTfxGwWvBb6sfmBovpGTJ3HUHjhYS6qrzZORQLeS0FuU2+pzzS9PAmlXW6EftSgZC2v
	a2BD2T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2HO-0000000BHrR-2L1a;
	Thu, 19 Feb 2026 11:33:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2HJ-0000000BHpM-2j2f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:33:07 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt2HH-0003qW-HA; Thu, 19 Feb 2026 12:33:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 19 Feb 2026 12:32:58 +0100
Subject: [PATCH v2 2/2] drm/imx: ipuv3-plane: support underlay plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-drm-imx-underlay-plane-v2-2-26ef829c5483@pengutronix.de>
References: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
In-Reply-To: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_033305_714717_82C7FFBE 
X-CRM114-Status: GOOD (  12.19  )
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

The IPUv3 overlay plane may be placed over or under the primary plane.

Set the zpos of the primary to an immutable position of 1 to have the
possibility to place the other plane underneath it.

Set the zpos of other planes (the overlay plane) to a mutable value
between 0 (the lowest possible value of a zpos) and directly above the
primary plane with the latter being the default.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Simplify and remove duplicate check for primary plane
- Rephrase commit message
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index dfd036f3195e..f078235ed07b 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -890,7 +890,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 {
 	struct ipu_plane *ipu_plane;
 	const uint64_t *modifiers = ipu_format_modifiers;
-	unsigned int zpos = (type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
+	unsigned int primary_zpos = 1;
 	unsigned int format_count;
 	const uint32_t *formats;
 	int ret;
@@ -923,17 +923,16 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ipu_plane->dma = dma;
 	ipu_plane->dp_flow = dp;
 
-	if (type == DRM_PLANE_TYPE_PRIMARY)
+	if (type == DRM_PLANE_TYPE_PRIMARY) {
 		drm_plane_helper_add(&ipu_plane->base, &ipu_primary_plane_helper_funcs);
-	else
-		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
-
-	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
-						     1);
-	else
 		ret = drm_plane_create_zpos_immutable_property(&ipu_plane->base,
-							       0);
+							       primary_zpos);
+	} else {
+		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
+		ret = drm_plane_create_zpos_property(&ipu_plane->base,
+						     primary_zpos + 1, 0,
+						     primary_zpos + 1);
+	}
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.47.3


