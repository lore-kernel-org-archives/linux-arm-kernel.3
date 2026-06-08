Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CF7CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64UJfQ2QSCW26/FM2EwjLVEGz51jQfPQ49vALeyVjLU=; b=lHoAG+k+GkuNSoBVvdALo06riy
	XtbxJMksAF9Jphw0jz6xjHiOrS2CIwlaoGbQXU+lBkORI6ZJ90qDdUw0lVPsvsxovg86f1BYPvKSg
	cCiKY6/W30KKCBIvSYV6YzJsXCGmrrremIJ6kJTq8yOddp4syuQ2pI5eI0Vbu6eNcngs1NtxHnoou
	je+Ybci5pdw+O7tuOZz0rbxbb2HIR931GiXlCVWYBGWX1zeqZCLu0vP8egY5Wub7EfxrawUr/OEkI
	TD11sv/+jJR2Qi/rsDIbVRcenWcpv2waPKYeXLSYDj7mx57Fzp9X3lVMAwa2JlMiaa0/lqFqKLxbe
	DqqD3h7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb8i-00000003ndG-1Yxt;
	Mon, 08 Jun 2026 14:39:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb8h-00000003ncf-0qMc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:39:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FD27601D8;
	Mon,  8 Jun 2026 14:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83301F00893;
	Mon,  8 Jun 2026 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929582;
	bh=64UJfQ2QSCW26/FM2EwjLVEGz51jQfPQ49vALeyVjLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I5Ky/beKPpBmBWZi6Q7JdN6b3MjXJWiyTVNfV0Q5bCSQ7WaLrx4sRr6mkzxVNU7c/
	 2wVIdPkDHOkJu22CVa0i8dBh85pG0XXRmGWK/K20PIUBIgwalRBo6DGxyQ4RWGGzRi
	 +u2dVlKPPQWPUgyf4rjsr0ferSsN4pqGSxnJAZelO6YDI24GTCBoOlZ+nSKp5AR5cq
	 53YXon/ivTs7e+eJALRUWzkwLKZ90XgHxVcqHrT/YSAqCW/KDrYnIcMZSgISap0JFQ
	 DerjCb+CtlfpOjuDzFWVqAmaKFUPmYyd1HpCMIaWO7l0TUgkpxsYo6A1imD3XGmLhx
	 4O66X7MTxeyuQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:55 +0200
Subject: [PATCH v2 73/78] drm/xlnx: zynqmp_dp: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-73-0a91018bf886@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IH9PWtifm+BMyJqxfBp0AXO6boHBpVX3QAQphfjt5r4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql1N7SisL7kzZe01jzYMFme0PmJQ0rs+s794S2r9KR
 ZZxSuqvjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRbSqMDZvF6w8sSEl7GNnN
 eWul0PH3Yd+sGPIV75Y/PK0hIxf+L2npz6jtX8/dOLPNwbrRJPR2LmPDRq3nnytlp7FfWJXoP+v
 /2lMxwatEdl3dxfE8RES9YLqRWZfDy7DEy2+89NyyX0W2eC8EAA==
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 7fb11b0a44f0..b209582bc130 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2278,11 +2278,11 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.mode_valid = zynqmp_dp_bridge_mode_valid,
 	.atomic_enable = zynqmp_dp_bridge_atomic_enable,
 	.atomic_disable = zynqmp_dp_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_check = zynqmp_dp_bridge_atomic_check,
 	.detect = zynqmp_dp_bridge_detect,
 	.edid_read = zynqmp_dp_bridge_edid_read,
 	.atomic_get_input_bus_fmts = zynqmp_dp_bridge_get_input_bus_fmts,
 	.debugfs_init = zynqmp_dp_bridge_debugfs_init,

-- 
2.54.0


