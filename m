Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BE2CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BE8zRbI0pTRe5lF9IhYcmr7R1vJTHskOpR2nzwJadrE=; b=o96Wu9CWqOrvXtTvUCae5gPGZA
	qCaJv6eFuz5QG8LtzLFVAf0DFy0Z/G7DarG8zC1o5j1N+XOavBB5xIA9uPqJUpYZaQFOoA/rq2k3u
	0qSxymIIfdpkGi/Rjq/Nho7TFGY9oohs40q2KEjb9YCRREgjync0kJtwfKIncMej0HwkhHcu3DHPK
	bkuV/S1j6lvQ0de6EEEXhwO20nYXXpwr3+D07UolOZUEa5dsrvR/MzfrXoHJxj4JN49kvEbUW3ega
	NG5dK38wbq7mI2bfxG9VZl4trUVdRY0ltTU7MybYwxFEWeyiWZVCXwsULBQ4dwc2HhrKreYgnQs3g
	A0S/L3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEp-00000008mhv-0iFE;
	Sat, 30 May 2026 14:00:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEm-00000008mhE-0nDm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76FF5419E5;
	Sat, 30 May 2026 14:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27461F00893;
	Sat, 30 May 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149627;
	bh=BE8zRbI0pTRe5lF9IhYcmr7R1vJTHskOpR2nzwJadrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KC5gWxud0qkZGzfFFGYuZYe+RYLbG1RTS2v+GEN1Gr8t/wNPQOpeYHLNMNPaL9gUw
	 sPGlT31KOG3FL807mCmd3GcMPmcyjWi5HKsJ97Zi9o4KV3j0ELgm2CSuUwtBYbxgbQ
	 0nxGnDIec30ZvwZaLXG9RGcWHyBah/ixuipZY4sZDdkord7dbHYnah/zcXYGUIlug1
	 5T2gk2sJNT4IrRfsbVJRwFeLj0u86rI0OMooVpN72QTeuvI2AaHkgLWDmjhlbcbYJQ
	 krF/stylv76VzTfKaWjxnpIlX2HofTUggtkdTEoEAQX5Ewdy1R1JVTWKxWeqNgwf5E
	 5NUMrUw0rVnNw==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:17 +0200
Subject: [PATCH 12/76] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-12-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=mripard@kernel.org;
 h=from:subject:message-id; bh=oDMDj3wxo+MCGUjOEVoyrYhr2GqkKwUCrzOnme4mbN8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb61aj60LkPqovcfw9ibGoPc3lzDYCTQI/drwOW7rg
 rfcngXTO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEdgcxNuzZ8rRoeX7r0TWF
 DmzuV0JrVnlcnvFfknNlP7MQQ+0WE4vVv1d80VS/pJOa5eK+u4rhJ2PDxQBRm1VLDTjP8ZbJrWZ
 +OPvzFcn1R9dOW9jeFDgppqHt/dPzH2ezJKaevVnEeLr35MfjAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070028_293031_F4674D8D 
X-CRM114-Status: GOOD (  11.95  )
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
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 7d5fda7173e5..a31d4fc76f35 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -129,11 +129,11 @@ static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
 	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
 	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
 	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 {
 	struct device_node *remote;

-- 
2.54.0


