Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F98CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 01:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YYo+8ACObyiLemRGEG+Y2ykw8dJyFunKp+Oej0AsZE=; b=c/NnOooKYw9pUwr+D2PIYxVTxy
	Iv5vLj/k/PsxyRgJ1Mcrti+G4E11ba5P0y4qBLD+tFNAFXytEkI0YariD3qolydEP3eIsHPJxztjh
	zQPWBYJDBfc/TbAmJ6J1Lij3C8sG8zAKveFjLsmyxMxKdxz46GhLWEgMRDJXvnOUKsSasMm5VKb5e
	CLlmpNvxU32J8HaPieM7fhrhG18ufs5E5wK3/8gC4WHvuMTb47m1kucxQU7YTfEnZYKqLVTeUbEGd
	CQQUK5eBF7NMwLC4l9aX1fq5YQxvBI1WivjfkjP+WRLpL8/+M6UosZuCP3JflVZI/EHAcuT0NdpxA
	3BuyQc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5OR-00000007YDf-0Fge;
	Thu, 01 Oct 2026 01:15:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5O8-00000007Y46-2Ejk;
	Thu, 01 Oct 2026 01:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817302;
	bh=/25mUQVhbWdrJiq1vpQHSF057oLy+euJM19YMqCX+Fs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qy0IfcYwYMkPi7M6MjB0Job0164tgQdM2YlGW9gSTT3RHOMAFYpQ52kGNwvXehXCJ
	 JC3fGzF7HAIh5txk3TClUKVwovHTkNkmSmFGKw+md3YR8wGOr8TcajisSekUgegtvw
	 9AY/Mcbs+OWgL8WhHvYtIQ9mUmVuk6DeDLAohV9n/ujoGg7DgrTH+yAL9EAY45RE53
	 y+L3XmHCE/vbnq4oYpWys6r1PIPUeuAFzXBZX/9EaD7gQMKWXWY0XqCa/3dA1TFWzn
	 yrvwkLo8/PZRlWuPwWFDJXyKSsJxBm2Qzy/3bs4s9h/0TWsRD3mTM5K6K6LhRDBxZV
	 hI2v/m1irEJCA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9D3217E1047;
	Thu, 01 Oct 2026 03:15:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:38 +0300
Subject: [PATCH 7/8] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-7-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_181508_775403_093C2554 
X-CRM114-Status: GOOD (  11.48  )
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

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

The RK3066 HDMI TX supports HDMI 1.4a, as described in commit
f84d3d37b7fb ("drm: rockchip: introduce rk3066 hdmi").  However, the
driver does not currently enforce a maximum TMDS character rate, it only
filters non-CEA modes and excludes VIC 1 (640x480) via the .mode_valid
callback.

Advertise HDMI 1.4 support for now so that modes exceeding the 340 MHz
TMDS limit are rejected by the core.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f28d6a883e09..f748700b0ba6 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include <linux/clk.h>
+#include <linux/hdmi.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.55.0


