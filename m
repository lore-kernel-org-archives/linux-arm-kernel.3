Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53951CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kMg+VAvJYbWrlFbwgOjXF47h84s1aNcKOZEo+xRdNek=; b=DIGS3nVgTS1J3aQ5m7rb0vC3XQ
	9iAMFTtaUc8zYXFfltqhRxhmfwGwOLaS4SIkH2UZLPwxNGivPi1hBU1etT4X8WrV4++Gy74JaCbgn
	ophap8PjRJAZI/rEbphW0O/NgnmcZhKwmWYA2yyhfGl+0L551FJXJGFAi4cZKMYxNCrITrF1rx5w4
	0dWQ4nwy8emRcLy5kKJqwQm8YNOfzcDtDiwaBLryDam9HozM4UI26lB0ssdevPJcEHrYl7ba5AKlp
	2/86sccixBcaTJ0/Y8lWnY3TmZ0o3RfZOX+c/5gbtuXTpVHtgHXCFLiPVLoY6TXpqte10acQjHeeW
	W9Lf97KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfVr-00000001ZWa-2P2Z;
	Wed, 06 May 2026 16:54:19 +0000
Received: from forward102d.mail.yandex.net ([2a02:6b8:c41:1300:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfVp-00000001ZV5-23fz;
	Wed, 06 May 2026 16:54:18 +0000
Received: from mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2646:0:640:add0:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 9F697C0120;
	Wed, 06 May 2026 19:54:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (smtp) with ESMTPSA id 2skcjWGSoW20-P2IKQ00u;
	Wed, 06 May 2026 19:54:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=2005.tr; s=mail;
	t=1778086446; bh=kMg+VAvJYbWrlFbwgOjXF47h84s1aNcKOZEo+xRdNek=;
	h=Message-ID:Date:Subject:To:From;
	b=EMUn+NNK9frgcpxDgm6YNPziOkFgflwHuE1bs4IAuNT5R6GufHyROF74YrVCR6i2R
	 0DZOIenBeJBGlVtbAcdC3eg/OcItVNYRKZxQ9fPN9btOeXv7e0OVzjc2bXHn2oGfko
	 lu1R108jAr/J+pY70L/fhuwudxQg0+ka7UYUgLXI=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net; dkim=pass header.i=@2005.tr
From: x@2005.tr
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: Open-code drm_simple_encoder_init()
Date: Wed,  6 May 2026 19:53:45 +0300
Message-ID: <20260506165346.19819-1-x@2005.tr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_095417_711867_F3C63E1D 
X-CRM114-Status: GOOD (  10.01  )
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

From: Favilances Noir <favilances@proton.me>

drm_simple_encoder_init() wraps drm_encoder_init().

It uses drm_encoder_cleanup() as the encoder destroy callback.

Add driver-local drm_encoder_funcs and call drm_encoder_init() directly.

This is a TODO cleanup towards removing drm_simple_encoder_init().

No functional change intended.

Signed-off-by: Favilances Noir <favilances@proton.me>
---
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 5c0c6e2cc28d..fd93ffedad64 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -13,11 +13,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_rgb.h"
@@ -70,6 +70,10 @@ struct drm_encoder_helper_funcs rockchip_rgb_encoder_helper_funcs = {
 	.atomic_check = rockchip_rgb_encoder_atomic_check,
 };
 
+static const struct drm_encoder_funcs rockchip_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 				       struct drm_crtc *crtc,
 				       struct drm_device *drm_dev,
@@ -127,7 +131,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	encoder = &rgb->encoder.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm_dev, encoder, &rockchip_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to initialize encoder: %d\n", ret);
-- 
2.54.0


