Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A20C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVB7kCIhX3W/Erqbp2nM9uyGnxMP7+gXaSWn+KWkvDI=; b=mSLf+PeKBpC3Gj2wXu/NYqOVNA
	vlE7ElU1oA9bhDHJ2ryE/G+7aWE7ckGCsw/K2t44NguvqGVd5xFxmie4RS+VmdwlXAJThDlPgHY8W
	djd/jrKxb1QGNFrr5u3G5DXt9HR+p1g8X9Kb5xEdwcQPtak7CRNYwgq7O9EjPQ/6M7ryQ5BSz3/4f
	bd89EXvJApzl7/8LsLbuCT4G57fAmwLthrvMN2Sm427r5NWXDqQxmgjtBWdAGzgwM0iamu4streGe
	tXmp5g4oG9zha0uvqv56YOS3/B07ExofwL/puT61hdSu58ckkRN9UAZ5jQ2ZZKwvkTJ95NV129RPC
	heO8k2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm93-00000004hFY-2eoX;
	Thu, 06 Aug 2026 00:39:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm8p-00000004giI-0Q7Q;
	Thu, 06 Aug 2026 00:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785976751;
	bh=oRTwAEvsdtAdQ3xeWlEgRs01pA0QwvbbaxWZXaVnR4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mti+hVE4xihzZGsOpdyWAc35hBFpGC4GNche6SQCNQB9MQ37SQtrVJNsGa9Vbnkb/
	 sgs3t16YWfj7fwk1YbUg0RAsUcuIcLFA/c8/65F2aqEYPUwC7yLEpKvG1wxjo0z0SS
	 koGxpQy9ibKA50PN9J/cIbs1DXY4493eGYt4WXVSoi8Fu2tRNwdecGEOKEcvdTBqIy
	 Y4Qx8mdXYNdIbEihoEsLf91JUefddCSS4NcRoDGLhRg6aMQEuuPHDPc3BZFDCoaHyc
	 PqLy/0HB1KIgZc+ydBboiVrXLl0zwObaIguqMDoFVNyLou/5doYJ6LnQaOfc4WaMqp
	 wkKceqO2/rUcg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 819AE17E082A;
	Thu, 06 Aug 2026 02:39:11 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9CA7E480055; Thu, 06 Aug 2026 02:39:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 02:39:21 +0200
Subject: [PATCH v10 15/21] drm/rockchip: dw_dp: Add runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-synopsys-dw-dp-improvements-v10-15-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=oRTwAEvsdtAdQ3xeWlEgRs01pA0QwvbbaxWZXaVnR4M=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpz166DLPUJ2TM/Iv6OumBgfJmR621XrspIw
 4iJod88cNEXEIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqc9euAAoJENju1/PI
 O/qabGQP/0JgDru7s3ZwEPfU7kp3JeBjFVITtlI54T1bYYYYEpMLoV0NDwsH0Zzat9/4mFqwoKY
 HO4ZvHRJxKTanRujoieloXrcZvx3MVgnwbioXtmtJQh0QWfiiYC6im0N2zEhnI4ewPpRkVOxQvW
 7FiMl/rcY36p+MS9oIOKBSZtRQIEpTGrp7PbumbUEerLWBsGB6vxb90JwhSSXxsY4peCAvgFcVc
 DKLASIS+gnfYhR4gQ64ZhmK11zQm4cr/EmvrBfN3qPmycx5CMjwlW8ULMo6+VlaM1TirFBsILeq
 BkBF7m6hzoFPwb4RxceoQqhm6M67sCHS3OJ3HWi1IoUEIrqWI1ssIbopR2IGcUWKk5ubBMn3cmc
 N+B77EP7h98QW12diuKjqhyoKyc/7+ohHiacEp+eeIbbff8MuSolwtTPea5Bc6AovvfDDKCOYj+
 tf+RNMSbAf3629q1J4cjbb99nXgaVQ4wvPbRMCHgfUE7hhLU9swms65o+5QkAOrrewg8dSPcHSz
 1JqOGotMiI1CvP+1bSmG/dDoVtLPgf6giUKFEZDZICWMbhheEery09b//Yi12CJxKFzUywm1UT3
 nKkpPMOOcp6p83AdMB1SLslmvLCnsD4sF5Sko6/xV/BVDt9AW0ITlg+0Z46lM0QHMqHkjOX4ASM
 GPFgQ9CMWvva39xDf+04l/Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_173923_337085_D199DD63 
X-CRM114-Status: GOOD (  13.33  )
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

Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index ffcfb887d0d2..770ab042a187 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -231,6 +232,7 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->vo_grf))
 		return PTR_ERR(dp->vo_grf);
 
+	plat_data->autosuspend_delay = 500;
 	plat_data->max_link_rate = plat_data_const->max_link_rate;
 	plat_data->pixel_mode = plat_data_const->pixel_mode;
 	plat_data->hpd_sw_sel = dw_dp_rockchip_hpd_sw_sel;
@@ -253,6 +255,24 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
+static int dw_dp_rockchip_runtime_suspend(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	return dw_dp_runtime_suspend(dp->base);
+}
+
+static int dw_dp_rockchip_runtime_resume(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	return dw_dp_runtime_resume(dp->base);
+}
+
+static const struct dev_pm_ops dw_dp_pm_ops = {
+	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+};
+
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
 	.num_ctrls = 2,
 	.ctrl_ids = {0xfde50000, 0xfde60000},
@@ -287,5 +307,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0


