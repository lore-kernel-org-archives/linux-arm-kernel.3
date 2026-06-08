Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1BCCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCmzrMv2DL6StxzQwZhyovANP6a1QXl6r05elWG794g=; b=p43Umtc9ZZqNf1jNqnKILahimu
	Ec2yUHIqqy2qn8uBab3Bl5tz6yh68OGQelUp3yrUWx1rCtGa+ZHjM+MkfFpSVPj4w2GprW8KyD/R5
	yCuRcRCd6GKCnxyQvzLlsCyZGWBUtv0kd5vcs11mDVbuGNTR88ZVdW0f8zGLY/ISrDvnjnTep2vle
	Ctbu9z/6DS56HhoyS4gWxEaBwQS7tq5/MK392iVn18rHqRy+jrVW9WEPRKQWfDowjBTk32swaifyJ
	v4AFwfLpRVnz03RbvmEXqGWMeYIM0MILge1QtC2XPs4CHj+5vTQAv6rU8sYZXugPHdAoyGIk+BPtt
	8PKMTZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb8M-00000003nH2-1ryo;
	Mon, 08 Jun 2026 14:39:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb8L-00000003nG0-1W5O;
	Mon, 08 Jun 2026 14:39:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1156B433AD;
	Mon,  8 Jun 2026 14:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754D21F00893;
	Mon,  8 Jun 2026 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929560;
	bh=wCmzrMv2DL6StxzQwZhyovANP6a1QXl6r05elWG794g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Sw7OOedVYW2Mx3RD+pBw3u/OUTWz2/N0jS9XunFhwcKeHPQ17ktPFu5rdEqW6ntm7
	 FEBcb/YtiH5rZxQlaTnQbqcr+fqES1iWH5lGXOOuztzpXRiN2r7ED3p793OXcuvLZ5
	 1oGflZDtdHwkktR5Ohiy+/5eOTQSE2ZaRgqkXZi5wPYmklqRB2duUw42EPk3rul0xp
	 MWtZKRXfIUHZ90aTSbrp+Hl2FevDeVpIVsIyKWW76uz8fbAoOj/o4KT8gsWDevMACo
	 +Sf9JgFZhcEjwb16pcWtv1uWYzrYoJo+RjuPM7baPxnkyDGHx5aVBodadEtMLavKjD
	 LlW4Jo9IyYC4g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:47 +0200
Subject: [PATCH v2 65/78] drm/rockchip: rk3066_hdmi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-65-0a91018bf886@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T5DlskzpLagGD1zvo+B+5y16Ha2hhau7ZG5m8/6Erz8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlqlxNd1mbE5s0zsVe90VvjG/PS0tBG6p+6qkJXzn4Rp
 wJF6U8dU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCKaCYz12W/Wp1nl63w5HrNC
 oGKKp+XmsrcTxVU1FXsO9H4yreFe84nXY9d7+WWKuRPe7lLsPOvKWF/2/P2hqWXrbxwv7VK52r1
 xX9rdo2WXeIO+yd/9VLNmF2+Ie1zYops/z7Y53JKSNFymlw8A
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


