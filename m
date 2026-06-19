Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFB5CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+e14BDat+MUjEfuuLwU2YmrZXyOKxN5Zuv/P5Bg+9k=; b=D/cZNkuicgO/R8vryLdY0O9ovw
	7bGeKLvixZQLW936Avu89zXpcypX3srSytIOw3D5dYUM+VYGMm+MOqcpy2YW6EcExrWdjvOaKiggQ
	A4yRUTZCb3lXTZJ3f/lln69ja8CFdk875Yqy1TDScXMLIOet2XoaNftCCFxNdtUhBMqEWZ2Tpa790
	EXAC54l2WJh06RJxb9KQnzLkPrD49P77UjDuN7R9VJuo5hiOZes4EtwcXQw8BQHeIJBfkmHqwqFfq
	OEDYiJiDdgVdOsAofqCPY9l5cFjaCdbMGOsp3Ic2QKZ82+eZuirwdIMxr1tANoQcgxynn7Fh3QQou
	4za36WeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYK3-00000002PCO-0vZI;
	Fri, 19 Jun 2026 12:27:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYK1-00000002P9m-01gK;
	Fri, 19 Jun 2026 12:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB3F4429D8;
	Fri, 19 Jun 2026 12:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5581F000E9;
	Fri, 19 Jun 2026 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872064;
	bh=m+e14BDat+MUjEfuuLwU2YmrZXyOKxN5Zuv/P5Bg+9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dQ2sgFPjly5ZAdEzfLlTbCYYKUoOg15F9gauMkAwKtDlbdDt4ukq7xsrF2odUpCP6
	 T+9ZZwUYxZJ57hPCm4kDDvIUiKCWQ/p5Jl1j19FAaTtQJo8nK7F9Sn0KfP6Iyfh4Hp
	 9YWurYSfszrfcXO41XRY8e35POM0en6q5Sz5JMPzjo/bIudXZdl2XXggaQ0eO9r6Ur
	 O3xUt1J/J4lJeObn1FpwB3C1mDg7+4c1HUp1P1if+0e3FNuUbDs3sdPML5DqMumSHJ
	 Acpdq7KawuvljxWXO6pfnPPZyJiU7cuw/NUYNnrrqbPaJh+99T0z6n33u5YjfUeED5
	 UKjcaRRcWywIQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:25:11 +0200
Subject: [PATCH v3 66/78] drm/rockchip: lvds: Switch to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-66-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TdGEn/Nph6zclvRJJyS70UnRjDHuOTWgKeHyi9X/fKE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmpuzvo+IT5yysXrHLck58acUqndlSSYl747Rfrmj34
 zkXVybaMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaSuo6xzlh50u6sWOmvmVP4
 BH5OqlfTjpJf2/n08aZkDrZZLiXlx527ry9iq/1dfyG82Lrxz4zVjA0//Pdv+5Qsp8u+9s4qtoc
 FX4Kan0/bv0M+Reve0gLl1Y8fHeA6l7vuWXzoZJddJ02dFrwFAA==
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
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 7a0c4fa29f2f..31dc206bedeb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -117,11 +117,11 @@ rockchip_lvds_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 
 static const
 struct drm_bridge_funcs rockchip_lvds_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.get_modes = rockchip_lvds_bridge_get_modes,
 };
 
 static int
 rockchip_lvds_encoder_atomic_check(struct drm_encoder *encoder,

-- 
2.54.0


