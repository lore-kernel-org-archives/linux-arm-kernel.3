Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF8C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P8iYkBiquMQ9xhGmNnETo5g+10FLtrI2QpuPoS6jnU=; b=yVR9WqstDXbRFja83SlhFqmKFK
	6oAil8/s0kpM2Xx6XMqKPni/80OWS4B3NdpboEJXC2qD7mRVjCmzN3YOmiSHt7f+YMy+iXIMKQW/1
	zQ4Ixu+GiZZexpGr4Ye9vqzJNcdoGZsEMv83nhcseVgKNOfOAGNjGFpn6nJhsaBCeZGkKsGMLCcdm
	PHTXPw2/WLTzD6f9Av+NHj7O8prWTQl15uyy4xzX+2gguFNrPfrHTlXuJ26jGHT5tFoclHH8tVY0h
	d3fIpXQjo5Q5z16UeDcyBNJAwjH5Det8M46S99Y3xapbh2R9Rt08SGnUOEMgKOS1QYIF4FgeI/hDh
	n5+gs9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tbb-0000000D4iE-0SCb;
	Tue, 01 Sep 2026 18:53:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZa-0000000D11M-2xIN;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288664;
	bh=BCFJ3gchupj/9avFxr4weEfiesajDGa7RfU7qo/IoNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aO7gjjj6twE0Kl/4SOBOapcQBhg1gHxsfUFmqolGMK1acUYb4KVYHZ2XBG/nsu+zN
	 tmX2e4Cz+00l4yJ5ZaVXbnLJMpcryvxCUfT/KpUe8NkY965pog7y5Mw8/9Ngk57NLW
	 b7stdpZXVJUMBzFAH4U3mjqwgcsHkTdxFfxPUJXyEF7CxsyQLcbDrCJG9k3wI4pNSZ
	 GGzD8XwFoiPEJD3t9ImrDIIF1B7FBKeRxQoMC8CX9iHPy0m3YFDg2pnXUMjWP8VUbx
	 YSuUTzUr650hCr/+0JJIkDXo4zJ//YB0VXu/iOhD9os1FPjHca26z0pSq8AFRB9OU8
	 3rJBGyYi1PT+Q==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B05AF17E3B2D;
	Tue, 01 Sep 2026 20:51:04 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:56 +0300
Subject: [PATCH v11 32/74] drm/rockchip: dw_hdmi_qp: Cancel pending HPD
 work on suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-32-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_115107_038821_FE12C587 
X-CRM114-Status: GOOD (  13.30  )
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

The HPD threaded handler debounces hotplug events by delaying
hdmi->hpd_work for 150 ms.  Nothing discards that work when the system
goes to sleep: drm_kms_helper_poll_disable() only disables the HPD IRQ
line via the bridge .hpd_disable() op, and disable_irq() merely waits
for the threaded handler, which has already returned after arming the
timer.

If the debounce expires during suspend, its non-freezable work may probe
the connector and read the EDID over DDC.  Since genpd powers off the
HDMI controller's power domain in ->suspend_noirq(), this access may
hit unpowered hardware and hang the system.

Cancel the work in the suspend callback.  The DRM device is registered
as a consumer of the HDMI device, so it always suspends first and the
HPD IRQ is already disabled by that point, meaning nothing can re-arm
the work behind our back.  No counterpart is needed on resume, as the
work gets scheduled again on the next hotplug interrupt.

Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260723015909.7F79A1F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 646a4cb96830..42f2627e1a05 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -728,8 +728,12 @@ static int __maybe_unused dw_hdmi_qp_rockchip_suspend(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
-	if (hdmi)
-		dw_hdmi_qp_suspend(dev, hdmi->hdmi);
+	if (!hdmi)
+		return 0;
+
+	cancel_delayed_work_sync(&hdmi->hpd_work);
+
+	dw_hdmi_qp_suspend(dev, hdmi->hdmi);
 
 	return 0;
 }

-- 
2.55.0


