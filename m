Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785E5CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+c2r7dNM15im2LD04088f8JMWsRhU9zCkqjjBX8x294=; b=ks8e7QoeM8jnAtaK2Qomza3rVq
	9Tm3xSMGFAsQweSMlcY7/2axGZwDdHa8+Lt4dCm7nlYD27VNKBjfDVgOUesJC//CDDCjqWeXt1EHF
	MO8DceTg/T6tB/+yKZBkkWSHxhyWLZyjJa77lVxN+O553t3dqp0Z/BdhSCA5brWic8JJ/X/+VTEkr
	PBWoT4wYgRNhzLG9X5OfMt9NNGGTuYOzGtm1s4MmpSOxl3kQpAaLJtSyKAC4+qIhDh5gvtbAe2HKU
	Hdfu8P8hhUWAIUJbH2eQp2dHLRzKpTCTmZiT0PjgFB0bryFuAnXNGw/a0TK9wt4tHcX24tgXOwtc3
	rp3xCQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHs-00000002NxJ-3CYl;
	Fri, 19 Jun 2026 12:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHp-00000002Nvn-1U6Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:25:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E80BD601E1;
	Fri, 19 Jun 2026 12:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C99E1F00A3A;
	Fri, 19 Jun 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871927;
	bh=+c2r7dNM15im2LD04088f8JMWsRhU9zCkqjjBX8x294=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BPd4lKs5DslOzX6WcvSvArPw37XlUdozCOdZ/Z2jzc+hOVVKokBuTVcuu5s57hx1k
	 1TKlPjg3JDYuqrGJ04tMLZh/3NgqmShb2tg/EBAekkPcN88Lpo7Bi9Lgs4Lgw011SL
	 9lMVjlMklyXcLJcrKjb54Cb+35Rxm55khCuAQb/DuqnRT8Q7Zr84IvN2IP6rEqhdAU
	 Wu8Mx8yBGMzLud7TX21WtO/jiZN5jwt5lU47OwOfESOmXIS6uD4c7NKmXsTly+wR68
	 6PU+MORSbYbOKhQhGbYAN0iluhuGNtWYuypW0c2WpER6H1jYA9ryPYoo/O4oF2E1FZ
	 yNQ3oEKp5CQFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:20 +0200
Subject: [PATCH v3 15/78] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-15-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wjlYAMQ0816CmqxLnh1/cBbgnPBxXYFILb5tBzVM0mA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh/8U7Q5N3UsWGNxV6BuR3lRg3KhrYldOvOkLVXa0
 e95ry/vmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNR/cnYsO6gpMBzEZuwq0of
 k9knPlfbXPp1m8uCGX65VjkTXwRlRbBGp/JP3v7cKl1WkDOu8e4BxoYP3yf46S7hllvzJ/1P+Sz
 JYyslJU3nL/o3h/2xcYWLR+wqx66rbVm9y1YasfsaGFXPPg8A
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

Reviewed-by: Liu Ying <victor.liu@nxp.com>
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
index a6ca4f5c6cc6..5884af991547 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -387,11 +387,11 @@ imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
 	.attach			= ldb_bridge_attach_helper,
 	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
 	.mode_set		= imx8qm_ldb_bridge_mode_set,
 	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,

-- 
2.54.0


