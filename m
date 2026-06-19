Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E851ECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5aR3cZCeJ/Rrvj8xsQt/INEFQdaZlNOMDKh5e9IApA=; b=aHAtbQ+xsdFMKZt8vhbaxY8G4j
	rw2z+Rw1Vm74/qqImqzMXsFvyQwQ/vpOVjH9QF08J40Ie6eCzMjvrhVS5edXJPjDDbL1m5pAsYm9F
	AnuXrG2PV+bcP0y478bX0BBMlcuec1RDAP78y/nwBrQq522RTqmRjnQzo8R6rVXOunFK2ZdFA6Oau
	0hfdDDA8TIMKgk6Y+zkd100qqF3/gKdwDJcqG+OAxupdJUtpMGFNCVk2p9fIz4GfmyC14PHu77sOR
	BE4Oh6XUqW1HLpOh9JPziG7CcaeJdXdGmYwmMYasDJPO+CIi4/SDBLCp2eCHaHyuFyoeA2m0Imlaz
	NGDu25FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJZ-00000002OhE-3GuB;
	Fri, 19 Jun 2026 12:27:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJS-00000002OZl-2zF2;
	Fri, 19 Jun 2026 12:27:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 292D4601F8;
	Fri, 19 Jun 2026 12:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6032C1F000E9;
	Fri, 19 Jun 2026 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872029;
	bh=K5aR3cZCeJ/Rrvj8xsQt/INEFQdaZlNOMDKh5e9IApA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z5me1jFllkjxRZW3vWP4FA2uSXgI7aVsM5+FU4gAKVLBiJEyGU6YRw37GBRhcGUaz
	 +gt+siGkZA8K9+5Vf9Uas8lMj0Qunx33QIXWIx6pqqfoE7wHk10yP2eC277Gg5vNRO
	 zXewXAOuugdqgWsO7vsc6lvnRXA1Wgugv7GdWSik969zPbJ27JCtL0bD+HKOJuGPGh
	 lkRiPj2mCliVrWctYYL4e89DzJ7X2j7sGVxI1Xk8iPVDs357f9MAM1af/mCThx9erF
	 9s/i1Rt2rY2a0oNkUEE48eFRq/JuA3fV0gf+tNaE0yiuOrW5TMoSfolsHkeElXX+gY
	 soYZ/Wm4vwMng==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:58 +0200
Subject: [PATCH v3 53/78] drm/mediatek: hdmi_v2: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-53-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4PVIOS1sJrVloIH98lQF6fdL/vLMtRIZ1HoV9fiP97Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpoxith9t7VRMWuzW70h4HDt9f1/hb74DJrvKwqu38
 V6dH/SiYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyEZzJjFdOKh1KqUo2fa5QK
 9p6cXWYxhTU55tmih0d61zdd3/113uSCovD9c/aEq8XN7+2d5za5h7G+fun7KTOazrqeKvRfwZs
 +LZFDak3VtvyvFxmronwk85j3W2zn22nZ8u7CuvUKmb8UVjsDAA==
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
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..d9316d30fd5f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1324,11 +1324,11 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.atomic_enable = mtk_hdmi_v2_bridge_enable,
 	.atomic_disable = mtk_hdmi_v2_bridge_disable,
 	.atomic_post_disable = mtk_hdmi_v2_bridge_post_disable,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.detect = mtk_hdmi_v2_bridge_detect,
 	.edid_read = mtk_hdmi_v2_bridge_edid_read,
 	.hpd_enable = mtk_hdmi_v2_hpd_enable,
 	.hpd_disable = mtk_hdmi_v2_hpd_disable,
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,

-- 
2.54.0


