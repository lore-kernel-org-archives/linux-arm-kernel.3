Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6ACCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arv2T62AxgfG4gijW1tFgEnP4hrETgGm85LuZpWWv64=; b=RZ2UVBH0A7kWH5kW0/EHCQgLCi
	bQuoL7Pb61DHOYJjEfdx4WMGcEEgPFDRHszZLh4nX2T1Knw9nR29VxViTneS4EvE5kVE9rdIzKZAO
	sbrZ6rjcL+NBLbpKvXGqkNKrbNSv2Mw92CgqgHj+ZXyp9BoZtWmTRyotuJH5R7my1BDxVElg9daMR
	itZnHUqbJvtWUY9MyuaMbtIYw9yLcWZLBQsuwbE3Jo6DFgeIKdvHollCzOJoAgIcj8GtzjrSElIWq
	2zhaNKIW/3Q/abnjmBPfWuoZv2XD2hJSBLvRlxa3GbFcQTgRg0hrbcnyn7cci8ap9/RM0bQhZ+I0E
	Q7/nZ/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJR-00000002OXW-1TvO;
	Fri, 19 Jun 2026 12:27:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJN-00000002OUN-0eT3;
	Fri, 19 Jun 2026 12:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5E4043AD5;
	Fri, 19 Jun 2026 12:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1779B1F000E9;
	Fri, 19 Jun 2026 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872024;
	bh=arv2T62AxgfG4gijW1tFgEnP4hrETgGm85LuZpWWv64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FgezfHbwQ0X9IrQeY0l6xV4hfkwBIJLUU0sj6/0DrmIvMYcDnx3OQTh+XtFFVLKxb
	 dQtJSYRK/f6mS+wwSxSI+v1z8OfgJg75ad/BiqZL06curOjvKWge2kS7rV7mzbyST5
	 9iqwQPoT+vH+N/swZCl8zkvR/uUhoyoEQTe4XR8IIWQ+fFt3D1K06cuMFqTZJQeaFd
	 KY25Aap9wZYG4EHxSmY8Jrd5yVI/PPsaFM9bdHbONaVaGEKWOlAaX3xp4DXunSmCJi
	 JhosP7JeXMUORS0qLCnUjz0ND7explbV0+G7eUfNk1+Wd1Jy4TBWxsOMBYWO7OS2FQ
	 CT0gm98/SCuGg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:56 +0200
Subject: [PATCH v3 51/78] drm/mediatek: dsi: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-51-ff399263111b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=mripard@kernel.org;
 h=from:subject:message-id; bh=A/V4r1jC1I3Xmm9CQE/hrJNouiy2Aa/X/crDFujeVdU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpgz6+6Nm74rZZx9z4/NJ9vsxH9Z0LPqe7/Cr8f3T7
 KgL+3o8OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEKlIZGw58zTnx2nTdiZUs
 k7fXBnZrmJyrU85Yllq9q94k/eVSu1erGzezHTE/tVJ/bbXvTrNLkxkbFsk4CaZq/270aPHcPDN
 0aeGtA2YHViaePPPlhFbECz6xz2/0lI4Gh67s5HtqtrPl5OFsAA==
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index eb325e68aa59..3f3f56eed3f9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -892,11 +892,11 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.atomic_disable = mtk_dsi_bridge_atomic_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_enable = mtk_dsi_bridge_atomic_enable,
 	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
 	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.mode_valid = mtk_dsi_bridge_mode_valid,
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
 void mtk_dsi_ddp_start(struct device *dev)

-- 
2.54.0


