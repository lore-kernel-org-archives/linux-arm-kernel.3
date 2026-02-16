Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D6E7BDB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IQ7Py+53LfcZBiHc1LO3OPVh4Jz9n8uVR7kPYW/YFw=; b=y/dRNNK4XZ25XGmut/yojhM/0V
	p9NgemrBG11svwT7MeqjgXOOS0HLGLvz0Trz9NPB3lAsaVW+6hWo7BRuhJr2SiDa+K5EiwEKwBIfe
	bHZWF+6JjG5R35NwenccOPCLzZkfRDo1+4W7BqLUUUHr5XAikGvcrhgODYC3rPHcphNrsz12jwDwH
	kdMNmJuIxr0BLgx63FFsDJylOaj+7hEUjKlre0d/nr1kKAR8XFzQg97XkDK1jRY2rCKgBvp4bHQv0
	37c+TqSapHHYLFIfumI4Llt9vKf76zFKUDH8r3D3mw4te+5tpNyK9EdFbWmpGlprtkyyApBScUasA
	JYQzgCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxy5-00000006Xij-1lMe;
	Mon, 16 Feb 2026 12:44:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxy2-00000006Xhb-2CwR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:44:48 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vrxxo-0002kM-ME; Mon, 16 Feb 2026 13:44:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 16 Feb 2026 13:44:30 +0100
Subject: [PATCH 1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-drm-imx-underlay-plane-v1-1-2dcbd1fd4ef5@pengutronix.de>
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
X-CRM114-CacheID: sfid-20260216_044446_563875_DF7E89E1 
X-CRM114-Status: GOOD (  10.29  )
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

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
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


