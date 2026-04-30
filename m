Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63733CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbz21Nz44lGBZdPU1E/EIp2GSwdc8W0fWuL0QqnQsRg=; b=3YnfysLkoi6FidPXOja0/2e4aP
	0m+9vyuwZCneALomMecC9Dh0CX1yBPRXL/xoPsamoazauAC2zmz6kGfXd9WMSf06yGV/GRMgqwmb6
	0YUxR3Z0w3gjS7q+WC8tFS0tT2fV+Zw+k5iaMn4iOJR4ub7Ft1MgTxUo18OTKTDxhxLuCVjsc9Al7
	+rbg7QQRE89UnDEAfD1kQoLNb7SZHM8IbBO3zYY5pg82mHccFVHh0oC3w5d33+gqKpd2d1tQ1a/YR
	l14WnFH2XsKlZJaT8a6+Ah7qZ5JT/hxagEiKUIJALNk4gg2Xz06bg9yrj/Uovmg8+h7k1NVYxtPpu
	joPzh0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkk-000000062Jd-3d0m;
	Thu, 30 Apr 2026 22:21:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkT-0000000622J-457j;
	Thu, 30 Apr 2026 22:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587638;
	bh=KyEBP+kk/lyiVl3ntsIO5pL+OJQ3jTSjF+KktcrQhPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C9Qa+FScllmx4u3vDE/OI2MhSI96ZMy0rOCAAH8Jq6USV+/PjkpGnQviSx1hgJTiY
	 /YhKj4GQw1HH+8Llwr/FMVj9baPR77vxKLH+U4e8ER0C0hXYlK5Oe73vxRNRbrx+qZ
	 6yg3VMPMiE1Z2/u/Gn+d8lFCc/uXmvLHjerbr4QWoVQsUHvACG55oll/gt6v9VLb0x
	 IRjFkdF9/viiXF6QrqOqmyMFk/2U3CeL2VRzquiTtX5IdK3HLRrlHnn2ooH75SJadt
	 bVvgfYxAPYXZGaosBym08d7D9ChqAnO4yztERqh4XITOX00abc3xGhnCjynTD7ReCt
	 c/PY3pgnekfzg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDD9017E15A5;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1D62648004E; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:37 +0200
Subject: [PATCH v2 10/12] drm/rockchip: dw_dp: Add runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-10-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KyEBP+kk/lyiVl3ntsIO5pL+OJQ3jTSjF+KktcrQhPY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bQmGZUmmuaHVFXAPTGWTE7qcJDZ+640X
 nMmqgNtE37l+YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaOXQP/jSakJDMAmUBr1ylCpE3O1yAzbu6uf9pGA4DvmM/J88q7BO7SpGS0YxCJH9tg4SpKHO
 SLZzmPsgW4EpG0tJfCKk64o2jbuVdXUeZvfhDgmCJ6kAEtMdb8YkB0d88K9Y4aDAmzRn8MWC6Pe
 60a0Y58PPryOoORid8YZWl0E6VTM7/30aY7v+BwnRB0B4+XbAhhAxidNpW2AoSheW1EUWDAU+v7
 BvCoBpQ21ygQva/tWBTVq5EWF27KAiNxLROBFyR0XPPljT5j2Ef+QJn7ruXHG3vrzeaXUisvGui
 jrITyHCbEhiELGbaPmlubfZOJJ9mUkJJB7KU6h6ljqCzrvhbh+eWAr0ykL2Y0Ut4qA+g3AB9UwN
 GgFl8XeWQcbMwJ/pPcIdocx4pcHnRyLk3zYXoZEPTP/SagvmVp2A5oQ1ZFmBfkyB1rudf2UpFI/
 fjPpx88/h6Ltmz5/YbEw/Ss8xZbKAPcX5v2o4tgS72x93ufdWhSYAik9neYeGolHgKeqnLCpgqN
 2u7Blr/1O4zPkafwiF/Iwb6jWnYWKbu4R6u8CD3FZKFgUQU9CbNfBz2NTw2QvH/5Wg4cs2Vhh41
 Lfx+EWM4BNebr7lfjTGR6pumJkPOBDTUnIskXUVe+D6zpSqgyjNFmZD5jvrQUl17jWu4cCY0xfB
 Ufj6aBo4hvZIqLJblZ/YusA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152046_324979_DE1C1341 
X-CRM114-Status: GOOD (  14.52  )
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
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 5750cf887981..015d39d48648 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/videodev2.h>
 #include <linux/regmap.h>
 
@@ -58,6 +59,8 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
 
 	dp->hpd_sel = force_hpd_from_sw;
 
+	ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16_CONST(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel));
 }
@@ -71,6 +74,8 @@ static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
 
 	dp->hpd_cfg = hpd;
 
+	ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16_CONST(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
 }
@@ -213,6 +218,12 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 	if (IS_ERR(dp->base))
 		return PTR_ERR(dp->base);
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
+
 	connector = drm_bridge_connector_init(drm_dev, encoder);
 	if (IS_ERR(connector)) {
 		dw_dp_unbind(dp->base);
@@ -246,6 +257,34 @@ static void dw_dp_remove(struct platform_device *pdev)
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
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
+
+	ret = dw_dp_runtime_resume(dp->base);
+	if (ret)
+		return ret;
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16_CONST(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel) |
+		     FIELD_PREP_WM16_CONST(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
+
+	return 0;
+}
+
+static const struct dev_pm_ops dw_dp_pm_ops = {
+	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+};
+
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
 	.num_ctrls = 2,
 	.ctrl_ids = {0xfde50000, 0xfde60000},
@@ -280,5 +319,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0


