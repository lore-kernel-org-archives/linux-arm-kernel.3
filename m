Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB8BCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkw1R4D1ZBMVlPPEqlfP70vWAGn9oBbmIpkg5tL9xi4=; b=AnQqYAv46M0JwwaAFc9vhAKVSz
	NoRl5Vw0kfFD+247QUpOMiMNz1/DDLFt2V4RP+JUA6KPQcha2w4YMyiL7ZxDpOVSSbTU875yR3GAo
	sL5qk0eHQWZZCf8XaKmd1CFv0Ey5rIuh87eMhq2slueK5sImTxBlVEzirG+LCslAa/jnqAgm7RDwC
	LSgFOhNaWwV8euT/Dd5dShVB84s7KHiXiH9uuBfYf9CZqLTd1/AcsbffBPV/nsKsK1xReR96aE81B
	zpzKArKELMKHGpTLerRf6RBaPIQ/gto38Sy9tyHS9GmkAg+0+d+4ZTWdEueB0qI+CMOMDg1S2FcC2
	fGjtswiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGk-00000008nUp-3ZsM;
	Sat, 30 May 2026 14:02:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKGS-00000008nGI-3GKK;
	Sat, 30 May 2026 14:02:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5147940B42;
	Sat, 30 May 2026 14:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B841F00893;
	Sat, 30 May 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149732;
	bh=Tkw1R4D1ZBMVlPPEqlfP70vWAGn9oBbmIpkg5tL9xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PQsDUBNpsDp0u6xmItWWbP1KP3fDqH3duX6rRGgqTVOtNCZU6AiQ3gQbbbx/Q69ka
	 yMReFBxpzoyuj5EF7HLjMtx0NXNBrUd2v96We1WV0RP0rp4lWTGDuiI0r23doKNnRP
	 C6OYOLDNhONEqpD2+rtAa863Q69wnyZ8CoUM4voXBJe/eSAY2dUDcu3Ir5RNq/AAAp
	 elDUkvL55XilA4qCsTAxeYFt4aJAhMcNpvKx4uRhdFLqeMKNcRwEu4HjT0xgj1ORGK
	 mCv3kNewDPPJAuJ6FizrS44FZvX3WlsJQCGv3BosVE9VXsgnILVTWg0tEJtexyOZOU
	 WHmmcnjeZOC8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:56 +0200
Subject: [PATCH 51/76] drm/mediatek: hdmi_v2: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-51-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=mripard@kernel.org;
 h=from:subject:message-id; bh=omTzJeA2a6NAzuQw4e3nzF/y/IbzsYqDoZ2juGLhhcQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb737TY7peJ0/eIy9eN4bjdhVM2KLmopNCz3CT68Qr
 f6lLni4YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyk4Cpjw3nH0v8zCr6dPRUj
 61lfPWPBbzHO5JN8s75YWwToZLMEiogeOmb95N7mTc96l1zW2hG6kbE++fNyP6m0Sypppzet+bf
 YQOWj16avs/lvqDpO9V5WcH7vXSux0ugKNxuv5HWiu38u3aEEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070212_874921_EE5345F7 
X-CRM114-Status: GOOD (  11.19  )
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


