Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AABE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQf3nhh93/EySaBGGW4N0a7UfMAqWcdUUejnlkL8z1E=; b=xS3CudH71TT2iMl3aO3pGOF1K+
	WLhlexzFc5YXj3zehG3vy/g6/VAYA44PmPd0NrvuCr61i1/J6yovm7lFNtOjdtLKGlw/orsPoBsg8
	e7DWSmt6dVvcLKUcGE+2GL67TwwuicH8SV1urXSQm/4ykuGAw7af+kS/nGuwnkAzXfsU8b5bkh1jL
	mAl5hH0YcurVDQM0YVXXbfJBop7norvubNXHKGvE69YS8Aeqh+dMEOg7jLFfsG2HQxy4lbZayNFGQ
	7gN88sFJoCE2ZthOj5KopB3KuzpNHanJbN3I6nC09tyFrZvalmbGPcX4RQ1Wej5Zj7CryBt2MVOan
	MPpp+Kyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2HL-0000000BHqi-46MB;
	Thu, 19 Feb 2026 11:33:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2HJ-0000000BHpI-2j44
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:33:06 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt2HH-0003qW-FA; Thu, 19 Feb 2026 12:33:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 19 Feb 2026 12:32:57 +0100
Subject: [PATCH v2 1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-drm-imx-underlay-plane-v2-1-26ef829c5483@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260219_033305_714605_CC42F5C5 
X-CRM114-Status: GOOD (  11.21  )
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

The overlay plane may be placed over or under the primary plane. Using
zpos to determine, if the plane is the primary or overlay plane is not
valid anymore.

Use the plane type for determining the name of the plane in the error
message.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- none
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index db50eccea0ca..dfd036f3195e 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -915,7 +915,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 					       type, NULL);
 	if (IS_ERR(ipu_plane)) {
 		DRM_ERROR("failed to allocate and initialize %s plane\n",
-			  zpos ? "overlay" : "primary");
+			  (type == DRM_PLANE_TYPE_PRIMARY) ? "primary" : "overlay");
 		return ipu_plane;
 	}
 
@@ -949,7 +949,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ret = ipu_plane_get_resources(dev, ipu_plane);
 	if (ret) {
 		DRM_ERROR("failed to get %s plane resources: %pe\n",
-			  zpos ? "overlay" : "primary", &ret);
+			  (type == DRM_PLANE_TYPE_PRIMARY) ? "primary" : "overlay", &ret);
 		return ERR_PTR(ret);
 	}
 

-- 
2.47.3


