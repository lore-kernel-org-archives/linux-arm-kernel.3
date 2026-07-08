Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22617C44511
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnGNgckrfMN5riJU0+EyO5bSrI5TeMB+APj46UlT0eQ=; b=lSXLsQhbVVKyVn4REpF6en3pMs
	fK5UWx9FMBqsPLTe881rvTL4+k9XF8y/AVQ5sYP0SVr4kintQyC5d4wm8dsld/tpW3n5chpZf+hv3
	UMJgY7HHh0UfTqeNYhTWhOd/HLgsQY2rOoaLNDCuNRKPEz7NAeNG1Apdae8sqEbUYQhQRbj64R4Eo
	PC26yUHe+mTwN/uivkDK1arRNylUl1gU4rgx2qpGDzxG6Ph3uIYF/RfiecDAxjrid9bEgf/rllgoZ
	U9lv24/6yw5Fiuzm0m92DtyKrBA2HmgMLS5vs6jMJxo4EBRE9qLmBKHXi6I8TZrjUO3hLbYoFcbYe
	oeJ5/Upw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaHJ-00000000UGY-2L6e;
	Wed, 08 Jul 2026 21:58:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaHC-00000000UA7-1B5p;
	Wed, 08 Jul 2026 21:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783547872;
	bh=eHslvtqPnc4NHsClcTr1gZEz4RVgZKR3riEDM+wtDyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DjZbWmKi1KKhTrO77wFkYRV7lYMym47TrFGMhdm2VK7/rpgwuuTt/6AgkABPWTT4w
	 gCWVNT6qq0kDCW21lfUKsgDXs1UxvwdZw/jHsGOrl+rtPkdO90pfnLTSt3QZDf7d0R
	 fg9OefiHvO4fKypolOdYb2/9EOEdPsScdzKaiNurpgESj8afVnrcHtRcBsN0JvCjPG
	 rAmVVfu1H2z8OC8+kyzuMqaLZ2UbM8SdTqqKWAySeHvUTvWtUpGKtm084lNPCeFDvQ
	 Lz0TGclkxh4SJAzYsUQq1C1vrfXFBbJRTBLTp+G2EP36tsPDpazc9dw9Bh+NdTKGGF
	 z6hT+jFYnLwRw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FFE117E0B79;
	Wed, 08 Jul 2026 23:57:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 09 Jul 2026 00:57:24 +0300
Subject: [PATCH v3 02/14] drm/rockchip: vop2: Fix resource leak on
 vop2_enable() error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dw-hdmi-qp-yuv-v3-2-a4a982a9f2e7@collabora.com>
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
In-Reply-To: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145754_470027_98969B90 
X-CRM114-Status: GOOD (  13.92  )
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

vop2_enable() returns void, so callers cannot tell whether powering up
the VOP2 succeeded.

Additionally, if rockchip_drm_dma_attach_device() fails, vop2_enable()
returns without disabling the core clocks or dropping the runtime PM
reference taken earlier, leaking both.

Make vop2_enable() return int and unwind all resources on every failure
path.  As disabling the core clocks is also needed in vop2_disable(),
factor it out into a local helper used by both.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260623202043.8BFE21F000E9@smtp.kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 39 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e336f5b..e11dc8c7f78b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -860,6 +860,13 @@ static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
 	return ret;
 }
 
+static void vop2_core_clks_disable_unprepare(struct vop2 *vop2)
+{
+	clk_disable_unprepare(vop2->pclk);
+	clk_disable_unprepare(vop2->aclk);
+	clk_disable_unprepare(vop2->hclk);
+}
+
 static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 {
 	u32 pd;
@@ -871,7 +878,7 @@ static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 	vop2_writel(vop2, RK3588_SYS_PD_CTRL, pd);
 }
 
-static void vop2_enable(struct vop2 *vop2)
+static int vop2_enable(struct vop2 *vop2)
 {
 	int ret;
 	u32 version;
@@ -879,25 +886,24 @@ static void vop2_enable(struct vop2 *vop2)
 	ret = pm_runtime_resume_and_get(vop2->dev);
 	if (ret < 0) {
 		drm_err(vop2->drm, "failed to get pm runtime: %d\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = vop2_core_clks_prepare_enable(vop2);
-	if (ret) {
-		pm_runtime_put_sync(vop2->dev);
-		return;
-	}
+	if (ret)
+		goto err_put_pm;
 
 	ret = rockchip_drm_dma_attach_device(vop2->drm, vop2->dev);
 	if (ret) {
-		drm_err(vop2->drm, "failed to attach dma mapping, %d\n", ret);
-		return;
+		drm_err(vop2->drm, "failed to attach dma mapping: %d\n", ret);
+		goto err_disable_clks;
 	}
 
 	version = vop2_readl(vop2, RK3568_VERSION_INFO);
 	if (version != vop2->version) {
 		drm_err(vop2->drm, "Hardware version(0x%08x) mismatch\n", version);
-		return;
+		ret = -EINVAL;
+		goto err_detach_dma;
 	}
 
 	/*
@@ -932,6 +938,17 @@ static void vop2_enable(struct vop2 *vop2)
 		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
 	vop2_writel(vop2, RK3568_SYS1_INT_EN,
 		    VOP2_INT_BUS_ERRPR << 16 | VOP2_INT_BUS_ERRPR);
+
+	return 0;
+
+err_detach_dma:
+	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
+err_disable_clks:
+	vop2_core_clks_disable_unprepare(vop2);
+err_put_pm:
+	pm_runtime_put_sync(vop2->dev);
+
+	return ret;
 }
 
 static void vop2_disable(struct vop2 *vop2)
@@ -942,9 +959,7 @@ static void vop2_disable(struct vop2 *vop2)
 
 	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
 
-	clk_disable_unprepare(vop2->pclk);
-	clk_disable_unprepare(vop2->aclk);
-	clk_disable_unprepare(vop2->hclk);
+	vop2_core_clks_disable_unprepare(vop2);
 }
 
 static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)

-- 
2.54.0


