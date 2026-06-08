Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81388CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y5pfHkHYHNkzZdXbKGQKPZAveqXlxcW9jJOAe4EpQw=; b=cxBHDPUn6e5fmWNtnPEQZUGDtS
	sQ/b+RM+hJ5iHJ63r9CmweRlWBYG7U8qXEA4qdIViP+gt5lD+C5K6KFcP5R0VyQGAg+ppvUyeEG2z
	lsrNlTBlNGd5X/UbNVtIQjCtGLo1vLTclyeAmdeDq99QtjEWQ7rvhktmjaDA7dIThzTJIu4XYlGdW
	GPu1NgUEPzI7zdVIiKan5KeCdjVE7rt0ji0SLtqft++hTkkrda/Srq/39i+7SJ72QJEOsDv9FqeJh
	H7wfUefPhWaUYkS0UckhFrEQOEBqGDIfNINN59tlY2hyFa7S2J/87ddxVvNW0V2FpMdk9XzwGNcfe
	zq4mVEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7h-00000003mcZ-0VnS;
	Mon, 08 Jun 2026 14:38:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7f-00000003mc3-0ZfX;
	Mon, 08 Jun 2026 14:38:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9516C601D8;
	Mon,  8 Jun 2026 14:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7C11F00893;
	Mon,  8 Jun 2026 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929518;
	bh=/Y5pfHkHYHNkzZdXbKGQKPZAveqXlxcW9jJOAe4EpQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NXFzPgtrtzFjvAgc1+5pPMwg0p+0rJp17mpP3QS6HSaqWKtyDPPtEO2WvZ2bQ4nTO
	 Kvu+dvsplTzSrgtZumGpE3TF0GgVcFOUFTze8xSy4k3EigTQd9L981/K6oU3Xp4/8y
	 JtJKpFlHc4yVCol/j88PMMq+nXIb+toDB+1BLEdnUOptH2CJJhVT9fGt1WnSNMV+rS
	 pNBPR7XurJcvXceXIQBt/noQniWsH67ukSatfBwY+Q2LdT5C0b5n4iqtM+dO8pLkE1
	 MglBfs7Hfrfwboz5BtsGKMEocLjsZj6F7k3zaZtIoHWjVsMSBrpr7yYEV0cRtCfNtL
	 OUlW4OXbFmClQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:31 +0200
Subject: [PATCH v2 49/78] drm/mediatek: dp: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-49-0a91018bf886@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zA2cWmx9bFvYJ1tK8/FNIRLL/T0wjMDewbi+oJHIa7Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql6M6fxmcXbE4RHvb1xJlNpFLl4w+/9FjX31on+F53
 Vfsel/XdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJKCgz1ocf3h16+Ufol4ZN
 pbNnO+fUTVvruu7RB4spC11UtnlM9YtWzbALuRWdwhdleiNqVTuXDmPDxZVfnIPWbt/6QOXAv6x
 HRx1NxASV3ng5sF6JyWdcp7mt4qvog8c/M7USu2oe7c7RT/wMAA==
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
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index eefbc7e0f9c8..f656b85b8421 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2576,11 +2576,11 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_check = mtk_dp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_output_bus_fmts = mtk_dp_bridge_atomic_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = mtk_dp_bridge_atomic_get_input_bus_fmts,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.attach = mtk_dp_bridge_attach,
 	.detach = mtk_dp_bridge_detach,
 	.atomic_enable = mtk_dp_bridge_atomic_enable,
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,

-- 
2.54.0


