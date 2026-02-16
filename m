Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15611E7BDB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8Kf5NmCc2y1lITh05YkJyOPfX06AmYgweb0excBe98=; b=i2TFpBOqXp2KhJFIIFJC9PjIiL
	hVnblbm3D9lj4UbBPY1l1+W7tKeKeHROsR6HCqsmBZBsjcrsKQFCVfRFNh4f1j8wZSkR0T76cx5DC
	5Z+Qkn9u5D2x/bp1Vt3FSE5m9Dx7N6EPInvqJP7OvYZwrCJRkwOIJlkfPX6fIwXa2b8ng2C70EUuE
	1jXY2AZL0T15qOm8abkCC5iB6U3tRV+HbAQEOzfKBfwJICc8aqT5DP4IYDfLA9mPsAw4JGzpnEmae
	9FZx/U8gygDLS3Ue5zNtPAJHrdJL72lnk6gbPGdtiBToEv/Vm1vvzEHuONOPeDH9tS+sjsGMCW22r
	SIwJlKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxy7-00000006XjN-0zZu;
	Mon, 16 Feb 2026 12:44:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxy2-00000006XhZ-297X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:44:48 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vrxxo-0002kM-Nu; Mon, 16 Feb 2026 13:44:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 16 Feb 2026 13:44:31 +0100
Subject: [PATCH 2/2] drm/imx: ipuv3-plane: support underlay plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
References: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
In-Reply-To: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260216_044446_552402_F8D9EC6C 
X-CRM114-Status: GOOD (  12.04  )
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
Use an immutable position of 1 for the primary plane and a mutable
position including 0 and 2 for the overlay plane, to allow placing the
overlay plane over and under the primary plane.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index dfd036f3195e..ddad5ea92aad 100644
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
@@ -928,12 +928,14 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	else
 		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
 
-	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
-						     1);
+	if ((dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG) &&
+	    type != DRM_PLANE_TYPE_PRIMARY)
+		ret = drm_plane_create_zpos_property(&ipu_plane->base,
+						     primary_zpos + 1, 0,
+						     primary_zpos + 1);
 	else
 		ret = drm_plane_create_zpos_immutable_property(&ipu_plane->base,
-							       0);
+							       primary_zpos);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.47.3


