Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4EBCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4nbS8xa1t6p9SSd83lfSkSZbudRp6Hwue1GxL/GjKY=; b=0ZTv/2hXSmOyZBeiqhR8PwcQiP
	jBJEvMZ9hWuOnq8ulZu7aWOUTZ/0mgSwCmx8QraQEp9vXOb7P1sWWu6ui1pTDAx6EXmb7E7Y3AiY3
	SiLR3BhKAu9tu0AKciTRNDKUjoxKdO35LAfTfiU0z8lfwrXO6rCGsmV0ZSZqf4wzqupaBQexqcZvH
	lnI0Z5k3G1E8rObu+CPOmWzrjMKTNMdiZQjORxwn0rRRHInJyncMZvwljLWuqjBC5hx5yQhfEEn8f
	5ffY6fbiOod3co4/iHxsDR2iM/OZ/8EMy5zBiCW/PplRPSGmR0C5uLnjtPcJF1wfy3/g1bEX1hnjc
	inr4gzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKHY-00000008oHg-3j0r;
	Sat, 30 May 2026 14:03:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKHK-00000008o4g-2QY2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:03:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CD9060122;
	Sat, 30 May 2026 14:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420481F00898;
	Sat, 30 May 2026 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149785;
	bh=r4nbS8xa1t6p9SSd83lfSkSZbudRp6Hwue1GxL/GjKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VXsRofvTlCT+f9SOep2P3TzeES/n0PxqbaWYu2qUVSauLYc8l7nFZfYyQFsWpvcRU
	 q5foFNJToypw69zncc3efl1nWPQZvn77U8h40IEEBhs9G3OLfA5pBAk36cKlIz+otC
	 sews696a9U0e3nVo4CR5jTIBZ6vVUMVhTB5eki5TmNHRjpGyviW95Fh8beXhtE2QRo
	 YMCVFrGDtWXH/sz5B1Cxk3bwCkM2gdFp8J3ZXq5Qq6waGUPu9P5rTfuEDPg85nkJng
	 oRZr2vxTZ8DPF29uB7HnNwrWoE7kDIElF127SAtp+xVJbarRisXfMv+Zddf6A8/EwP
	 rD792GFxJNodg==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 16:00:16 +0200
Subject: [PATCH 71/76] drm/xlnx: zynqmp_dp: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-71-875d828d31bc@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uVDQrnlYf7QLxjWeJ5PXbsoBfWA33z0UzTd61/u5pp0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb0MmzPjI6Mu+0+WTdF+PDusKu1UyYnuXhRwznsyj+
 ur+hxtNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi+94yNszdP+Wb51uxUx2t
 Cy/Z1PavzDja/Pdi6p+dT6TLtj03m3v53Y91RjeFGl3OJscwFDPc4WNs6DhXxsXdk3FTdLaTt9Q
 kk/3V5o2znbXiDF4fiSzycmP99Tvn8Au/o8Fi173C9nN/8+wBAA==
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


