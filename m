Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80E0CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejYuLC3YgIldB7/W/QtuK8IPfcFDE7A7qlLMr+VD/dw=; b=jSicZfTtdB5Cer3d3lAkv1kjd2
	2A1SEwKiTiUF1dIRGJmtIntZ9FiL9cCFDKfwCI+Z+uNjmIVk018aSvuLX4i0C487P/5/VEGC4en9r
	CSfBOAuVQ3LxyqzHs+/9yI6LCsXQMO9Gk49h7FUJpOz8orWx4H0TL9xHXcBCGrK65k2XxvQUig37j
	7F+Tmw5UFQ9MhlwZ5Xaeuy8rPRypMTF/TJeLnonc5uzSIwDC2btW5GsCWmVJ0HP9l44hCON3xEmoP
	xt8g4vg2YbAOemEKeLdcMHCWfadHm1YbwA+lM+UVi9qgMOz2k2/FO/vKcNLQbQ+7beLLrhJDTC3+Z
	x3V/rYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJD-00000002OQa-2QZd;
	Fri, 19 Jun 2026 12:26:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJC-00000002OQU-1Qt4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:26:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EF9C43236;
	Fri, 19 Jun 2026 12:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739FB1F000E9;
	Fri, 19 Jun 2026 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872013;
	bh=ejYuLC3YgIldB7/W/QtuK8IPfcFDE7A7qlLMr+VD/dw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H5sKHRMY7HNolLzQTQIWgAVlB/zmhkWfn8eFOYxqe5j7D+oRR1ixQgz5ptHY8HU1S
	 +GrCg6rVOHI0TuRRXA8bz5vTu+cgfmztiS+aR3lQHYY9gMn66uqfTBcdGoSXxMP3Wp
	 pJjxFD8Qx36OVuz5zBclPErojOcdqoUekw/hb1NfgkLw9egK6JrR73ZXLB+zjre1Ne
	 rwZGk97MNurWlCkinIK4FV04s0rn96GDQDmmqQbJlzlLly1eIB8bIXxq612l6u4cgX
	 pr/BzkiW4ifqJxgpgUaXb6qg+7TLHnTCEriezNyE2sRApusEBeClGsNb2u0038Udfs
	 ra3Sl5juIA8Tw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:52 +0200
Subject: [PATCH v3 47/78] drm/imx: parallel-display: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-47-ff399263111b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MfA+vFaXbqTAVMVSt1LE9XSkKBD3WIqzlMHPHCFR7F8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJv9ONR1+rpYxM9p0p2mEV5Bfz0t5Yad5aptjdQTuR
 RVMFO3qmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABN5/p6xYYav4YeL7+VuGbK/
 Fr21Ty8mR5r/pcjhKc4/ay/36VdMm3aponaNcQPv/GJHm5Wft9QuYGw4vm9zp1JfeMCVOs9jOq6
 PHweIScWLTQs+y6hy2X/q51mNvxm+K7Qu+3FzdqyzyvPgmREA
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
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 0f06db95f00f..eb75827394f8 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -178,11 +178,11 @@ static int imx_pd_bridge_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(encoder, imxpd->next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.attach = imx_pd_bridge_attach,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_check = imx_pd_bridge_atomic_check,
 	.atomic_get_input_bus_fmts = imx_pd_bridge_atomic_get_input_bus_fmts,
 	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,

-- 
2.54.0


