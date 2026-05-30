Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5739ECD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnKD/w07q7/FuelzSyzsrcceqEBFm33zV5REFZi66A4=; b=lWBktqLEEr3wfX7icMpRdszV3q
	RLIsv6GIxNtNa820oXgt1Hw+5dxBUB//9GULLqyPm0qAb1khhN8MsqrBuCO6+m+gkXPO27NNmUsLw
	GYbJotGfZ816+WMGLJpwmrLIwkaIdziCL/8GiZ6N84dCVuXa6DZmdBxLJOepLc2wq5HrHrToaouK4
	FyWst5AJz4/qzo7WtDS1UluDqAUedndALV2FDC8U1UHWh7YwddYbgiqyMMDzC+3WK4hFAHyuJcGiG
	uyQ+sVXJpmJK41rDImJqXuXu5WKfx8f9SdI92NmhOMCohk1LsftRywTLbgB67Lwds+kdkIIOHuQZf
	L9zCaIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGS-00000008nG3-10iO;
	Sat, 30 May 2026 14:02:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGQ-00000008nE7-1bjE;
	Sat, 30 May 2026 14:02:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEAA2600CB;
	Sat, 30 May 2026 14:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0881F00893;
	Sat, 30 May 2026 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149729;
	bh=VnKD/w07q7/FuelzSyzsrcceqEBFm33zV5REFZi66A4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=g6Eam8b0UgrdYjI9yoqskyYnlOuLLezNDB/yMvPKTjxXTTCXPf8jEU+/KJhV40vSs
	 AljIedGfr9gLykJ7v1OQWCRkiaL1sNtc1KG9EyPfVcZhw0pVdSMtJn90eikkxwxShE
	 8dBSd2PClgakvtYe5IJdQrh2U6hMRtwjH/RhxXci/eenS2FocYj5kP8Bf5zqvYm0ys
	 5htCm2H3upl4f1UPOqmlBbKesbtScF6QQsCb2TxpUSuHOqjclWRxt9aJoAwTPDAp9T
	 1E1GYFzc1tn5XG+2vEwgRhaEBR1jBqFPiZfRefAmHIokZgq7jilnvQ0QsLGrnMTmp1
	 LSZRWXahsHaFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:55 +0200
Subject: [PATCH 50/76] drm/mediatek: hdmi: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-50-875d828d31bc@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QJaSY/Jq8+HoFA+FF8IRn4og5v875ZSlZRIo48oEJxM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb739C/mWvjn94/2xCyfSd0zjvPbYd3+u763+lbf/y
 rsYNMu0d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlNUwNrziUWzIDIgTd3p5
 TU1DMTjZKF3zhTHX2obZKrse7Zyw3+hYcVPY4r0OoVU8f9kq9ylbM9a7PP9zqmPDj1fFcpOtr6a
 t4fv2/GD+w1/qK4xrTO6e/LtQcPndbtP7j67WbnHX+nK0SuUcAA==
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
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 38a7c7953874..738090a47176 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1070,11 +1070,11 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.mode_valid = mtk_hdmi_bridge_mode_valid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.attach = mtk_hdmi_bridge_attach,
 	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
 	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
 	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
 	.mode_set = mtk_hdmi_bridge_mode_set,

-- 
2.54.0


