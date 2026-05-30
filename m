Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1BACD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E//UWfyU6MGhKaC1hBQH0KYtQ8sNEvwGPvQuEq3V9SM=; b=DLWePby80XY5oB1g/8XE+zvB1p
	U6U5R0u8+Z1aT7B/STEHr5aaVGIkfHo7P9v4iin5Nq3P+yEsXi0k2EdZfyxC4vYAacU+Qu4LL40/U
	cijiGRulXUFsEmQSRj4EAKVlOFKoCpBUG7FXg258gCmaVvscG17GaZMPPNNLqqCPLp9zieO/6wPzN
	Gol/bZMIepvj0/t1BDOcYxaIZT6+UgLb7Ebqqg4mDXgFsSf6CTRgcYpLispfyySdAR5zt/An/kPjR
	kmENnto+Wp9QcbnLDat4e23SnZJ9Qhm/XczvMRgLa2UAaiLAzOIPJGXpJpdgXgwLh4sd3k+U6vuR7
	neeD1f6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGG-00000008n9x-1xPU;
	Sat, 30 May 2026 14:02:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGC-00000008n98-2sa4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:01:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FFFE40710;
	Sat, 30 May 2026 14:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863BC1F00893;
	Sat, 30 May 2026 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149716;
	bh=E//UWfyU6MGhKaC1hBQH0KYtQ8sNEvwGPvQuEq3V9SM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N9t6sN0tF3NXMCdzP4xqoI259iuS+y47S6VqQP3A6L7qBAF/2p1wjmT8YlC4pcePu
	 +TtUYB/NCtu4a0x8kFKuDRUQgP3+q+1HkJF1cyrCEOcTG98/u9OKrRSAC5iI9GL9QY
	 VAtvrj6YpXpXWd9pHL9XVZCWFBePyfXqnaF+J0BVWyFrM9UQsmIx4o7yHuMXhy0iRC
	 I82YRNcvB6ShGtosfJIAIc+pmSCieMxlBbS8FWQ5foYNVR7rTXYcPEL3dFW1aX+es9
	 HCAXXihkcWo3Qm9hV00OCf4Z9SYKUXEjr3SVxq5XXWRPNRuVg9R+TzwVyiE0PjHzTB
	 OhVTbAoR10DtQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:50 +0200
Subject: [PATCH 45/76] drm/imx: parallel-display: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-45-875d828d31bc@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678; i=mripard@kernel.org;
 h=from:subject:message-id; bh=w+4/gZ5eZl1voVGoufBQrlVUuTZA//x+hgNxgwDIyZ0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSbz1XzKzjkDHiL31rJXpB6Kmo+q6/r0zu6mg9sZo+y
 /TTxjfXO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEVFQZ62z6Hsx82Fdfs3Sy
 UvQJK+VtE58VMkaqba8TOylb/8xx0sWH3W+4Pm+/Zhheb5v/9eyGTMaGt/cfZPDtObL3/uv+jLe
 nD4ek/vzLz6f6VVNwRwSr4V2u4+eW2FfWveAz4dvw+t20wAMSAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070156_764174_3FB78135 
X-CRM114-Status: GOOD (  11.41  )
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


