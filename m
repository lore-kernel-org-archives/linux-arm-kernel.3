Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BACCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq0lRQ+8Sk6Egw0LQS10Zvw8ImiJhD6KCyyYOg/jK4s=; b=qQEZikgxPckI/PwQjlyt56dZEx
	028RmO18ppywFXou4KCXz+9TaRZNoEC9GVugTgG0NUHUONYeE8SXVYCyP3wx95DpdwW7q2z/HfxYp
	8R4E5fNbDV7nA6yhci+cavspPicS+yBDsSH8U/cs0IgJYrG6bFedNFNfWlLZYFF39SBQZ1/c7BD1m
	J1fcON0ZyVLRan2a/Fi5ocsA96zmGjtTRzG7DCeIyTeNLEZISqervNzAcGO7KedKe7AQRsF/zqa1t
	bG683QA3lyscND4TArmNS6SjY2I4WmnSI8Aljg2IquATdDza16jHGPoMVJrEb80cmPN+iIlIi8jsk
	Hd82Aesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEy-00000008mlp-0Esg;
	Sat, 30 May 2026 14:00:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEw-00000008mkd-3w7v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:00:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 631C760142;
	Sat, 30 May 2026 14:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5CD1F00898;
	Sat, 30 May 2026 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149638;
	bh=Oq0lRQ+8Sk6Egw0LQS10Zvw8ImiJhD6KCyyYOg/jK4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ANhSNCfbgYZFQFfM849jORfcC5SLKmOHlYjP4GcGPt29x6HEm/2kpMHx72LfJEdIY
	 ZYcRWT61i79lj8u+sonPBvOqv/Pzw22IkWUOcpWklU6w+iVySxfkn1e2tXTLiiWUIK
	 1kIMLwYsj9oLF4/rW3xoq1LW2LnScOUT8DSIeaSHkEx/nkuALfpowBczypWGaj89An
	 hiYgNDguhrOBJPafhtDjBSSdYoRowrMKzZEHNM6VckNDysuTd7vtXdHSklJJG1U6z9
	 BX0uq9ZsryCzY4dAs5eD3gvhIZJFPmthZMPiazVVXlKFVwCW9ankOTbYwPCM0/8Dnz
	 W/mX2BujEclrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:21 +0200
Subject: [PATCH 16/76] drm/bridge: imx8qxp-pixel-link: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-16-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IjRf0txpCYJIZmi9hcQ4pAYa8Snt6z9j3RlL/eHE/mk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb23iPk19wL7HrGr3yimX2f4d0LbPC+XZO6nife0Hp
 +0/V6YrdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJJLxjbDh92vDvo8LNH556
 Tz5+/MZbJulbj04ytVbkeHPIuSxZG/+oZoLboW33Czxbg8L2bRSdzsBYn6zEWWh0M81T2XfLhsW
 xqySfz3zkzvn2RFtTYn9TWPXWkKMznUXTegS/bSyymvJa5+1WAA==
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index ee6b6dbbe952..92b8b1ac35d0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -227,11 +227,11 @@ imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pixel_link_bridge_attach,
 	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
 	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
 	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0


