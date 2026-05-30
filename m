Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86646CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB1+RpmDuOVXPx0/xN0Fzr5pQ8zAM+wHKh1xmiCRGVQ=; b=KGPjfP5VE+QPYbVGSMWnV2njC5
	rAjugG9af41WL3xM9FSHjJYCAkPvOV6UtYdkG7jU6I+WKl3OExlYiFfIwC+Y+MMglUikCmxbFRu33
	xR/o+1owMuhGD21m/PuvoHjt2VaT8GSu0Ypejfr0NEA5zbYpfuHqrjTD6KsZD4lG+WtUfcShSfrNw
	vACO8uJ1bElSK/I2LofNBrtdTDA/Nx8d1I8cm5TAqQug8mmv3IwMP0/0AEPA37O0PB+OY1EkjO7ti
	gWUkNyUOJWPa2XirKTKpn8wBS59AWGyA42tfJtm2I/VUBRUAu//nLHoBE5ZyKHKr2Xlslulp0pb/s
	0+848Yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEx-00000008mkw-323A;
	Sat, 30 May 2026 14:00:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEp-00000008mhk-17qz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:00:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 576DB60122;
	Sat, 30 May 2026 14:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B611F00893;
	Sat, 30 May 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149630;
	bh=yB1+RpmDuOVXPx0/xN0Fzr5pQ8zAM+wHKh1xmiCRGVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aMpq0HMOkBuKXHI3O9aQQhp2Bfsu/B/mqmLQK5tcF3Kb5b1nWg+hcyLC+Y01MrH3x
	 0Uvxx+dJRP6vsxl+WxIOhLcXlpvagoNy6dyZGejkmfV6gym/mWiBA5lzYycrQyok0J
	 g0tGaIhqMk6Ng5omalj0L7s5f7JZ2D1L0HlMtR70+i2sCmq7y0gLYD9JF/Zg76UnYB
	 MWJXKWc37ArfluD407NFlFeOvi22v7ati9pBFfdmdLjxb2Okn+xukuYFY2Gw4wQi0Y
	 PHCnwLdTzYLtqp8BGOAFn/75J1U9kYf1Tc00xTRACxbQnEyq3DIZA/IOYgtJObcpMI
	 q02hVkZqIhDCg==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:18 +0200
Subject: [PATCH 13/76] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-13-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=mripard@kernel.org;
 h=from:subject:message-id; bh=d3rCqUKZT2IUZy7bzmRCNhqe3IeP3K8HIreIawQKmsU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb611LLbY7s8Rmf9sxYOVk3W2PV8Q/5slwq+ZYdbPj
 vwz4de/dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJCAQz1tlJLv/xcbLDnv++
 S65uvRYi+vvjtdrXfacWVC7Zf0Ph+OKUU1IPrbnez9JIYq46p18f1sNYK7gxXdC4k9WC7XxlxOG
 XXL1+M37+bji/7kyvQV/P04BzAb1VTHcr1a88c8o7fDm+3lcPAA==
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
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index a6ca4f5c6cc6..a654c27356a7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -387,11 +387,11 @@ imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
 	.attach			= ldb_bridge_attach_helper,
 	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
 	.mode_set		= imx8qm_ldb_bridge_mode_set,
 	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,

-- 
2.54.0


