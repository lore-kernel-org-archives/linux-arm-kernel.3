Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B2CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCmzrMv2DL6StxzQwZhyovANP6a1QXl6r05elWG794g=; b=cui6OSSWMKC3z3bowHaA/KZg45
	r6B4awpU6wvt1ggmR2NyLq3zSJ/3O74dqOrM6pF9VyRYL1P4WH6HL3a81E5bPxobZBKtTrbT3uoAQ
	7ZwTiAZERoWBAVU5ENNKqcbrNu1DocoN3gjCHwYUreNMDKlHy+oMPpyXHOp8U6d60uq5ZKp8vkb7u
	YVlOPoYEdKfx4Tkcghds1jG7hJcKjx+5d5xpq37GJQglEJc1Bx9GeScJ4FxbZeg7ZsZAuOn5h5hnV
	YWi3pYg8G6fHRQw/flnyc7+5pvbf84wsCYA3SvBBbua3O2Gyo9AtgstWs6tTHp1WFOPpjZu81WB51
	/Tu7/+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYK2-00000002PBz-42OX;
	Fri, 19 Jun 2026 12:27:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYJy-00000002P7F-1YcP;
	Fri, 19 Jun 2026 12:27:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 218B141B43;
	Fri, 19 Jun 2026 12:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8649C1F000E9;
	Fri, 19 Jun 2026 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872062;
	bh=wCmzrMv2DL6StxzQwZhyovANP6a1QXl6r05elWG794g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EsuIjJqxbH7kw+2w10unk++vJfJp5vumQcI54MGZbFQTmWZ/TbCLA4kpu0tb7OHTA
	 lvS9384YYv5NlyRy5zW3zLWM4L/Kh7WHIsmO6dO/Tb9HdB+HqS8AoVn4t9k7a1OVFT
	 E6GGQvGdxX8cwTJY7rfwTNCE1uljmAMKfbNWpQ/WcwqvXDGH+r8P946ZY7lOwDr5mD
	 LkvBepdpEevStAEOYhXinSaS8d8xeyiY/L64wVuWwzkUPdC5bZHARNeVJSUB+I1cbc
	 TVCu0P/yOuiEJCBfbqr8Qo3PEYOe0P5UlmQ94S8RB9Yy9FzciWcLX+j17ebv0SiN58
	 U/LrIpI/8uv2A==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:10 +0200
Subject: [PATCH v3 65/78] drm/rockchip: rk3066_hdmi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-65-ff399263111b@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T5DlskzpLagGD1zvo+B+5y16Ha2hhau7ZG5m8/6Erz8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpmxV7R91lQMWPV6tGh8tvSJA+92jhqZp/pOEufIez
 j8o1vmuYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkgoexYdZtkchjs0yZrgaw
 FcWJXlVKMHp+ULjm3fbeXfFuy2IPlr3S4iydoHrUdHkS14kK3hxrxjqVJN2f+22jbr/IyN3xSjt
 JNC6OJfTCxaJU7TsWOv993HiKJHNXrI6cdPvaBjm+lMWPFgAA
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Sandy Huang <hjc@rock-chips.com>
To: "Heiko Stübner" <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1996f8656612..9b8981fa19ae 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -495,11 +495,11 @@ rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_enable = rk3066_hdmi_bridge_atomic_enable,
 	.atomic_disable = rk3066_hdmi_bridge_atomic_disable,
 	.detect = rk3066_hdmi_bridge_detect,
 	.edid_read = rk3066_hdmi_bridge_edid_read,
 	.hdmi_clear_avi_infoframe = rk3066_hdmi_bridge_clear_avi_infoframe,

-- 
2.54.0


