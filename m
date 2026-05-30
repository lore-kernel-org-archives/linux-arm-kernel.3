Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8FBCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hrbgo04VDBqbgiItbHVdK4dfDlX9eQjt/wF7mnm2M8=; b=Rj//oYcqjr+PqsTkx6Faz6iwwr
	XIpR54VjSS/XqLgn2trx3EuJy/zN4QppzgqtL5VJBvgUHyn2iK70QbOlGWhgNr7/Q6vkbEpP9kDAW
	ZI7Sn/NtIkLd4eNT8Fmze5HSqlEfVwhdVPyjeVJsPmsxDCHgiXnX9fttHl/v90jRDEbrp+az1vmjF
	WaceLrPChQ0Vk6QYHZnNdYCeCMjp60LLQAHWjbKKnfoqKGK9fWemlihwgTYm8qwyUcX4s1kjL+Xbj
	7WY02FBmLP7QjIn64Yx8YI3OI4AjuJZaY9ZOCYFd6rFzRR72J8aW+mdJ9VhynwDB0JLCF0/B9HOC8
	xR6tciyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEx-00000008mlY-3rA5;
	Sat, 30 May 2026 14:00:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEt-00000008mjW-3iF5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:00:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87EE2432FE;
	Sat, 30 May 2026 14:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D141F00893;
	Sat, 30 May 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149635;
	bh=4hrbgo04VDBqbgiItbHVdK4dfDlX9eQjt/wF7mnm2M8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tw6PtnbPFjwVUNcSgLY0eG45zAT8lxS8r8jcVU5zOWIbt8fT8so9RGXiitWMHEne2
	 Y9ID2j34b2kEWehxdPBOIcFV4190qa0lIaws9hprjXVAZc6kDfCUqCrpqZJZB2USEN
	 PoNK9UWCPopUxQG9F0uiv16hRMLB52l7wXrEWr6MA3DKakkeKIUuYuGKPfQackJHnO
	 nUjZFCRZTFB+oCry0BgC+aNuybO33WVQI559b0OVuiDDEYWiqU6fEX/5s73adPMvtL
	 u0A20pF0lJyJ1LM8MwmVAnd1vSIGzK0ZrlrbrE54Y+4Dl6NxlNAx5+5SLkbf0+TXB+
	 /h+Wh9UDq4OGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:20 +0200
Subject: [PATCH 15/76] drm/bridge: imx8qxp-pixel-combiner: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-15-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NkqK709L4B/gvL2yMw/BFm9SnSO2hR7HcVAMXnkMgaE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb22cc2eId68XmHdaM+HcK9G/xrYx019Uatnx/2X96
 julySWoYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkQJ2xYWnkpm1e38IDsvw1
 1BjO+x7Yud7XNXz648n7dsuKTzWS+xE//+fSoBquKY/vhh9cKMOrztiwl3UvG+eTS65rztft9Ql
 kMVv/X3da4PTSqxfdlcTKpsRxSf43X3ym5f2+6qSIWAX1y40A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070036_182000_4F6E6D58 
X-CRM114-Status: GOOD (  10.92  )
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index e0ee51a9ca7f..941ce2f91e9e 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -249,11 +249,11 @@ imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
 	.attach			= imx8qxp_pc_bridge_attach,
 	.mode_set		= imx8qxp_pc_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0


