Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D79CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OQtj6GmzYlkx/0b3BvXv3tB5NzfHV4b9TYIL2YXWrM=; b=vRz5YG0Y+rZGEX4fcFpS2ZOkkX
	x20slsWoV8lQxCZRfBLe4o9WHXHAOsVBTMFAcOog3kFi0z3LGLDxgNk7I7DjZZaJVwl+RfCJbmkKx
	XnKXPCu7KmrmhxeHBgIO3t2QxTYi2Xc6V+4kZTJeiCi94udeqBOMWOJLWHoqmSO/JTGxemxXPB97K
	ChIs1yTzsVqirblq3S/SgYX/vPa1JJEZvsTvAyBFbTh69S+xP3/+B9KLo2apK/lQ49ZZSYGqd0Vua
	X8fB3XxqpwgXzRglqcarUQAKGv4qh0Ws8zDd88v5I0ZYp6QRY9ic8YVzqHgDeP80ZVho4YuuzGS9z
	cPkE6HeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6G-00000003m68-0g0t;
	Mon, 08 Jun 2026 14:37:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6E-00000003m5F-0CAS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:37:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB90B40DAC;
	Mon,  8 Jun 2026 14:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA661F00898;
	Mon,  8 Jun 2026 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929429;
	bh=4OQtj6GmzYlkx/0b3BvXv3tB5NzfHV4b9TYIL2YXWrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jRQD95xpU+OIWX8ZJTTgNO2DM+MvO+V6b5tsXgL6ApE71VbpafCeORiCfLlrf9ZDz
	 HE8qm5lN0I/FTQQ466R9KZaswUz9DItgIrixeJGmTugQVMdNPLBecU2i1oVaypcvDU
	 yRb6Sq8rnGmBDIjoulQ8Fhk6ieQ65XgTMiR8NaYxG8NAStwlJ8Fo6VuVXGxFBrNKuQ
	 WGdrWiL/IXZ6cG3ELo1Okf61FoesmU7EcfYqvsYZ7wCCkAlLhddfbSHB2PnkvpyfsT
	 Bagv5ZIsgO9jzAH74IlW92jxV4425NHSHiSJAcBNwsYPGZicVcxXYA8PVyAqIexOSr
	 ktA2APE54zIPw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:35:58 +0200
Subject: [PATCH v2 16/78] drm/bridge: imx8qxp-ldb: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-16-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Dz6jfLJf+Q8Hv76Ttb5GvtmLyyZA5IaDJrDb9DtkfvA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql32k0jn36NVknDUxia2QlZedzJUQK5Oa2r6q8d/Bi
 5uKtj7omMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNResPY0J436Q33VKeFdz0t
 bfhSqhgf7nlVxqV064J0a03SH/sj7l/ZPRXu3Zs78aCrR07cY4t0xvoaeXE3PcbJ8nPYCn9Mfuy
 dfuVPSOOuhm9iV//zNuVcXbz9ZNGla4F34wy+8DKqMem9FAMA
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
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index a7906314ade1..1c71697a2083 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -402,11 +402,11 @@ imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
 	.destroy		= imx8qxp_ldb_bridge_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qxp_ldb_bridge_mode_valid,
 	.attach			= ldb_bridge_attach_helper,
 	.atomic_check		= imx8qxp_ldb_bridge_atomic_check,
 	.mode_set		= imx8qxp_ldb_bridge_mode_set,
 	.atomic_pre_enable	= imx8qxp_ldb_bridge_atomic_pre_enable,

-- 
2.54.0


