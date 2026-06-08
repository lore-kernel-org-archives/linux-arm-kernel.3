Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4419CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EdzOp4pIWYmmlps9I5TLBhdc3zszR23pufjdo1cUu0=; b=H1cnyagnhNeP4bucEYaBjhvPwP
	MKjSUXjlfIdcFfNnmt+2G43bSIvMGV9BUH66zmwRGTUwPrVgD2w/GlX8CjYUQnCylxZTAusK42JVL
	2N2q8+Hc1FQ5JK2xDcQdxDdTn4zRUYrwfBTXlejDf34owoKCrbhfJ/yLzwh7/UhZahsd4Mwy9t379
	hkEgeborr+71aESLZ8ntX0ne9AHDBLF2ZCLWWe0fRVU01RhVrc/VCgVnUVysQjUr7uZQ/mEmz6Uig
	Z9OA0Yp/NL/5LDVwbR7BCWADz9Z9Ph+03rVIjYaS1rj3y15YHsQ0x3qiGJyuVSUaGa2XAkvAq7Yt4
	z4AaqOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6D-00000003m4i-0JxX;
	Mon, 08 Jun 2026 14:37:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6C-00000003m4D-0siN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:37:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 577A6601D8;
	Mon,  8 Jun 2026 14:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016021F0089B;
	Mon,  8 Jun 2026 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929427;
	bh=1EdzOp4pIWYmmlps9I5TLBhdc3zszR23pufjdo1cUu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ie7JAlGtnucLccBEWUrXMLRnrB4X9WB3qxGYkcU0J6mWcJ0MkSCTmUC4jBNTddy2r
	 UsGVvKmPFkm7Z5gvJzXHqildTaCLsLB3L4Mb7+anPcvgLX0E1LxIXkWKt25l1wD1vr
	 T6eV+rIRUBYhxZO9d+LcSzZDw1eelBfHzmCCRk0W3ekJ6mGu6eNbYJ4rAE0x14azE7
	 jxWxs+knY+808rWuhYsKG+BeZpfp/w8bSHpfqhwMCMv16SKs23GOTQcd5NhRRQhXue
	 mJ3lLQG7kkmDIbcUqVC/jo8hgXSLLhA/tb0rpPAuMkjSzNCttzC9wgrSrHqe3/4vbW
	 XcYLIEsK8i4RQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:35:57 +0200
Subject: [PATCH v2 15/78] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-15-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dS4Uudl9IPuT983xizy6T3b6lSD0WaxCYo1UQSG2A/E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql723lcbrZn9ZNmvNz+NbJwnmGzG/urIuZDufkkXnN
 o2JcmJNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi7R6MDcsqVNfMit4Vt1X+
 oJfwGn61X/e3T1t73mLR2U+Fl/xDKiVF14fvmNW5uWfHJNk8ufwQS8b6gBUp6WsvWzkFHFzDceZ
 4l5XC2QkPnrWnV5XPn7Ge/00pE+/Cae6ipQlGLHGPFgeXP0oEAA==
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


