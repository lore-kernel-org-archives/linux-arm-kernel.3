Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746C2CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSHYTCxNGQXoIfDiS1eh7juHdjxY5jSddRLoKCl8XoQ=; b=EtW6KEZ/uED+qlfCb55nbocX6S
	vpwNw7Zw4CQlz2ZgE3y5/HSFryZtIT9bje7jjuruzox9tHZCPvHqtN+7FChJF53m3ABe6gip4O9Xt
	IhXM9zwelVWDmAKTF3GGwI1Qvz1WRqnHFg22go2K1C473KosUTfhxwzoeMybnRdo0uLoF64+h4Q1D
	HULy5oucPgU/XOYnFX8VHUN8WUUWLa26uz1K5DOAbRHExVDP7Jz+jKLbglQGKlfrq5/ZaLqcDZgxt
	koMWLhbv4LclwiIhP7XprDS81G48odsxqEhTknwPJWqoFM8Qs45KWm425SoSoZcD2ukmPXspAAVHN
	H254GdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7t-00000003mr9-27JF;
	Mon, 08 Jun 2026 14:38:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb7s-00000003mov-027I;
	Mon, 08 Jun 2026 14:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3D8043B4F;
	Mon,  8 Jun 2026 14:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A721F00893;
	Mon,  8 Jun 2026 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929531;
	bh=gSHYTCxNGQXoIfDiS1eh7juHdjxY5jSddRLoKCl8XoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hWApMa2GJwTSQVP6ovp+xhkEoEc31m/XiubmWMejdwmnOBqYsJuhVdb9R+MLxUzgt
	 d9p2bv8mFwLy0MviI3pwkQ8sF9xTqe1GjWSqjTw6RsKx0HjQtSrJj52iBJc3XQeliQ
	 OGaRgUz/HDAwvlKZQYf9GJEj+YMRrjIDr5XreHN5mf+js4eo4uUuJrr17WwjBM3QiV
	 nXF0fSv4/uX1rVWK+x4iP0FryKbDnrhIBbZMQcZgXGMlnILeCRZYfqj5s0y4ScvQox
	 YA8WIzU6MOWRvz+ys0e2nEtpFAU4m2PFkt7yWQr/BNgt8Fh1p40rEm1zlMvKSyJHfp
	 Qb4IUeY4SeacQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:36 +0200
Subject: [PATCH v2 54/78] drm/meson: encoder_cvbs: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-54-0a91018bf886@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DCoZa+Vvybc1lvdBT65sYK+38dJUcwAPmYuROujwyq0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql2OmrvgpOHOxk4wC4wpbTo2fivMm/q9LOqCtfmrP1
 /WF3ptOd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJqEcx1udkLlS99NFYpHCd
 j/427byLS4StZ9i4tq3dffxkr9ojEdNta84anV98/sSa36vOucr62zM2/HZcmS355/qbKFm+Fbk
 byxaGeR7YcWmp6YIFb8/92xejcIxlR4ES468nK05M7+7Q77I0BAA=
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
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 8b26a0031cde..22cacb1660c4 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -213,11 +213,11 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_enable = meson_encoder_cvbs_atomic_enable,
 	.atomic_disable = meson_encoder_cvbs_atomic_disable,
 	.atomic_check = meson_encoder_cvbs_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;

-- 
2.54.0


