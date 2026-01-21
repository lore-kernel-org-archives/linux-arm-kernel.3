Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E8AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myZj2s9sKZSBACOxD4WjfRlty/Ygw6vJDPmcoScV2+A=; b=fhEmDfA7l2+ICkm2lXczFSlk3G
	HNvCbepFL2kRyK8EWTLe5cdZfD1VkE1GpiZt8QzDV4RGuaSJwt5S4EROdFqNBXbOx0LG6B5XHdykp
	gtx0uMVDtkG6hDZEipo7tiKBoURM47tlTxxpc9zTjShbe9H63QqFNS2TNC33gpjdFcCSATpuPIElg
	B/OjVbrZHpd2S4wKEzq4ukAd5ZFHxTOhHH1XLI+61Tj1rtnwj6C0p/B4tO2xhjqibShS9nRt7j3AK
	fGV+2xBry/MNIFBFTW3raNGvmdD35vwgp9t0uz8gGBcjRuvyPq8unqduLHIYtoNdNXCq3S62xbhVf
	f4KanE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSd-000000069dS-3vcd;
	Wed, 21 Jan 2026 23:18:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihSb-000000069bp-0r42;
	Wed, 21 Jan 2026 23:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769037478;
	bh=dpoYWqd1QmnsLx6bOVdrexg1n+TySTa7C5ZjTOClS1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WmkOCjlmRtLu+l8Km1N1C2KS7UYRCQ5tK4kqWH1VIyahTF1slmQOsO24HtsXeZjhi
	 2x3mzkXhN01byqHSVVJI2y79y63qxIpiYPJc8+FKpUyvXsoYp9Ch1zeXl+6HkVYf4g
	 Rp6hzYcueD758rI/cx4HSOviiQNVRsKvZe7d0grpqRacx6UlktRHD7l4pIbN9n/x/p
	 Gs8fG579QoHbKHwlmLtWNBz1MJut0imOSvho0jpvOmZtSR666WH+QIK3/VAHV+oUCA
	 Kr6ElGZWWOh3bQIJS8oZ7UMmOcPmqOS+SgeiS5VMATX3+23VusB0fQWeMuuBxzNidk
	 qySt14u09YTLg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 442B117E1389;
	Thu, 22 Jan 2026 00:17:58 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 22 Jan 2026 01:17:34 +0200
Subject: [PATCH 1/6] drm/rockchip: inno-hdmi: Switch to drmm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-drm-rk-fixes-v1-1-3942f185750e@collabora.com>
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
In-Reply-To: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_151801_423701_989AAD3B 
X-CRM114-Status: GOOD (  13.21  )
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

Driver makes use of drmm_encoder_init() to initialize the encoder and
automatically handle the cleanup by registering drm_encoder_cleanup()
with drmm_add_action().

However, the internal structure containing the encoder part gets
allocated with devm_kzalloc(), which happens while component_bind_all()
is being called from Rockchip DRM driver.  The component framework
further ensures it is deallocated as part of releasing all the resources
claimed during bind, which is triggered from component_unbind_all().

When the reference to the DRM device gets eventually dropped via
drm_dev_put() in rockchip_drm_unbind(), drmm_encoder_alloc_release()
attempts to access the now released encoder structure, leading to
use-after-free.

Ensure driver's internal structure is still reachable on encoder cleanup
by switching from a device-managed allocation to a drm-managed one.

Fixes: 969325a2597e ("drm/rockchip: inno-hdmi: Convert to drm bridge")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
index 97c20500f790..28e6fb09aae7 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
@@ -14,6 +14,7 @@
 
 #include <drm/bridge/inno_hdmi.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 
 #include "rockchip_drm_drv.h"
@@ -90,7 +91,7 @@ static int inno_hdmi_rockchip_bind(struct device *dev, struct device *master, vo
 	const struct inno_hdmi_plat_data *plat_data;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 

-- 
2.52.0


