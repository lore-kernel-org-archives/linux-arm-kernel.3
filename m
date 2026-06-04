Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D262CCD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rRDPEW9sbPRXAPtuKH5War+e9LS+bqZ/3dB+HlmzKJU=; b=aQBYyJUzGTAhKE488d+Ekp80mB
	5guyQOpmxqB9Ix4yTZvHQGZPjmr6ln8g+NzPh19pwkwgPSONR1ztjJiw4MZ+548LxfLovfd6fllaA
	sT35c16tH6G1HB4GURX4Wg0NfNHM5xqC9huLqV7NBW07Ywg9xxqp6s6gzhLIHcV2DDSuFWaBT+RQ1
	0FHlXwVP3xaTNVCOQMmlCCnyKDpcfKfzQJv7p3wl4pVsE4vRyoGR9o5nGtBQP7krjv/B+SkvxbPiK
	Ti9DMYL1+2UTt2S50OMW/ex8tgTcton76oFISg4ethKyF4rirEn6oRI+hyyVtuxu/Qo2XAhRuJW2q
	rp8RfMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7Ha-0000000Gj5a-2OR5;
	Thu, 04 Jun 2026 12:34:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7HX-0000000Gj4d-0Qvk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:34:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b7866869so8145275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780576481; x=1781181281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRDPEW9sbPRXAPtuKH5War+e9LS+bqZ/3dB+HlmzKJU=;
        b=GlpiNOfySueuVZckozEURsRql6p+R3YL7YpMjgfw2L9Upa2aCiWxRyQprf8y0hj9VE
         8gEvKBRjLJtnYUoBlfYP8P8a0yscMoXWZl90II2YGDu5IpV+aRF8Qx9PUhFGOnyy4Lml
         XQF38Ai5fq0LhP09Cccu6Qn7Ldr+3M+LcX5uKlW3GhulVstKqtucha7uBz8ANHoXsi9m
         ClTPsltCO6drTKEH6KNM5DXS/iPjpd8lUq6ACHLTLa5HpqHcnF3NTPDUEQDO/Z6zXrsZ
         NwT8Ez2zV9jvjb0PcEOO51o3KafOzSElCTPeLznugWZ5wdAlD+ZHwoniqeLj9wQHMe//
         dpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576481; x=1781181281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRDPEW9sbPRXAPtuKH5War+e9LS+bqZ/3dB+HlmzKJU=;
        b=OhcmMEWW5qdq50B/e74eNWoxiA8aXTlQYAhdebi5t21J+C5UHoNcLDBdYzfOdFwPtP
         oJXnX6lTiIwGPM0BS9RQhfwTf+/zgPGIBWYhH1GED0BRPwLhKc90KPpKrPhPgLqhauGt
         cQoxi76L5XD8YgsmyBDpvsp1QKe5Xpc1mCCnBuRZXHGepPLAkMDy49Km/wHwjNAt0MXC
         ksQJQnq+X33M6FRTH9jmSMfDZubMIxAqPe9sL1wCRkZ9ypfbgnOLOcNsMDJgVIrVFAzP
         HVwmB07XL8ytEEpeuRfMQORPWfe0vjBkB/68FDDJ7CqlcMASoG/YPNhX01xFPXC0aOst
         yq6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+moVgk7BPMhn/n6R34GS2LtKIUNXdEtLC0hZzlgf4DJ1w7dvmAtjXki2EQ0PkQQv7p9aR2elZ9CBJTcixueYmA@lists.infradead.org
X-Gm-Message-State: AOJu0YwfCoIP1CjFihlKHbL2Kx94C7shVrkGQjY43hvpBzMM3t7rDsmh
	To9VRcNNC9IsDcphHmaw+bzLERmnubFEnJtsaYIQFh0EHBX5L/CXQxFa31qdS+qS
X-Gm-Gg: Acq92OFfuGzTV7L1tZNjJutT9V+RhlXVeNHv6sz9ljzRItBPSgbRAShuHbyEGzV67gX
	5lGs2Fl5V+0FyMBXb3QWYs2/ZrY0vWVGJgodQfI/0CqFL2uFUCSHuSwEML6KINWMg6X9N5tmFqf
	4uU1JzLJSwMsgHwSTKtx6ThZpsnBfcrz70FX+JlSr5PCnFgSDBw/ZFUBO+O1yaPxco2TSq62c1N
	64UnL55Hz5Qutw9+vxTB6FaB52cVcgYNruTURhlCHutSDm/L+TcahaVVPI8037ju8F2tEoXv7ga
	JgbEOpC9RowFojeS1hl/91HSHF4s2X2PXOOwA5YKux8zz8+jGswsdQ84s12mzW2P1tvfGDtn1E/
	lHvhHoRkQBp1IpTzygBCiRZNIJdeaVsYD8IK7FsOD4hn98v4FCoedN//jV8uDACe9srnkIOQIme
	mk8IFrxANTiggrVA/fr/EdcY/UsgDQCaJzYaieK9GBtd60e4rgz+gnCffGfGs8zKc=
X-Received: by 2002:a05:600c:8519:b0:490:bccf:2bd6 with SMTP id 5b1f17b1804b1-490bda66048mr47084715e9.15.1780576480229;
        Thu, 04 Jun 2026 05:34:40 -0700 (PDT)
Received: from tiolaptop.tail72d7bd.ts.net ([194.35.121.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm70036085e9.15.2026.06.04.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:34:39 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
Date: Thu,  4 Jun 2026 14:32:25 +0200
Message-ID: <20260604123224.192543-2-diogompaissilva@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_053443_165535_CCE2E208 
X-CRM114-Status: GOOD (  11.63  )
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

Remove the dependency on drm_simple_kms_helper by open-coding the
drm_simple_encoder_init call.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3547d91b25d3..a09b382d208e 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -25,7 +25,6 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -825,6 +824,10 @@ static void dw_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
 	clk_disable_unprepare(dsi->grf_clk);
 }
 
+static const struct drm_encoder_funcs dw_mipi_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs
 dw_mipi_dsi_encoder_helper_funcs = {
 	.atomic_check = dw_mipi_dsi_encoder_atomic_check,
@@ -840,7 +843,9 @@ static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *dsi,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dsi->dev->of_node);
 
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder,
+				&dw_mipi_dsi_encoder_funcs,
+				DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder with drm\n");
 		return ret;
-- 
2.51.2


