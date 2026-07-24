Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1988CC53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPezvGQ/7+Jf7QtJsAPB2NrbA5fWTbxAOlTS5XmBzXw=; b=xRk96DH10hNsNMjspuQ7PsKoIH
	bmpUBDhe7h6/OIevv+ATT9OhJBwCLffPkmSjH2HQ4wK/lwMZtZOq+umrR5v/vuM8vA0EwuzQ2TbpG
	UXRTG+9y9K8pur2on7PhHks/m/fYIfA8bBnAdGQIV+l6CJUJu0/z7tZI3/siAn/hshrglUzZfQq30
	8ONyvUvqLcGCAPvjifFw/lU4lGpEwm9uO5ZN5bc6Es1Z+J4NXUAJZ3UjaZjMum5ILbYkHWm56fc/d
	2+JfD//plzG+8p8PINTreTZqbuIkcNPJqFuTNNj2z/5rlYn874pyaXmqkjUPHB4/dP6/AmtKLV6Re
	4lPYMjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFZ-0000000H0Ti-3lnz;
	Fri, 24 Jul 2026 18:03:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFE-0000000H0Dh-49Bv;
	Fri, 24 Jul 2026 18:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916210;
	bh=BTkiiTT3H7A8IiisrlGjYUH27Xlfl//27fsie/co2/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oA9E8HOyFJ0u92XTuPBepCEqWSyroOa/sJN6H0v5AHnOqV513/KUMqRadmtXa2iOY
	 /ag29TMF9DLuwS4JV19dST2v6QEf45a6cPyC4QpaN6qG9TQRQILCC2VOnMzLv1HUCl
	 FDCOWkDGNRISvXvXJ+jPpZL6euXBxuCHT73o1RVonPWnNp1d8Vy0U8KyuSrfCEz4xA
	 Z72YzGxl8GiizUf0r5bAWSR1YSh/ZYpe3OqUHNJhImr3q5jXM3AuLrFTcc2WD9xNpT
	 c3ZedlVEVUXDYz+0Ig0OfOGjWqVwQYLULxsWXV0dQN1eeibKt0FSHza+1LysxOKMJU
	 CT/h6mbLIQAmg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1C6817E02FC;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EDAAF48004C; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:34 +0200
Subject: [PATCH v6 12/16] drm/rockchip: dw_dp: Add runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-12-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
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
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3624;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BTkiiTT3H7A8IiisrlGjYUH27Xlfl//27fsie/co2/I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPCkvutij4clmUCVvOYu52BFVB7m3XR0w
 Q4rbxaOZnv6sIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qa5+oQAJ1zlYrSGx5xMhAvoGR3Q4har84EgAc8N1fK7D91R7GYCVLP3eCiA9ZHPeD8dnhXdQz
 4/uk4Z1y7QfInf7MOhMPXsR1F5PlMQkyNScVRhKIkMSG9/cUJf0uHZ8w8+KIXV8+R9lEfQxdHRe
 k6VIcTb3sILYIEgnWf9WcjyZNdt8KblmtDxEsz/LWXMlRjWNQOM2Ho1jfYb2YapcTdal2FUuHO2
 kozUTe7bv/ol+34tI2Vtvsu9a/Ud3rF5PMynpfrgyJRIAiB7/1O2BX1bImUy6kEsfxbtldQ75E9
 IPzvLMRnZAK37jPDHYYIXQc1Fe+aTaJE8tV5YAjWoSRDh4bD40WqJA1eqhxL73eeoROAKtvtUlW
 Ocoq7kOrUbLTqZF8FWBQ/EWdYnaIUHIfo4lHAkVx9kJGwQb7GGfnXJyTA4H9zVx2W2GP49v/kBd
 uS2Jf4kwOEvs5eQeWcd/sf70JM/e5yiptd8xP8WXGRR0uN0BHURO91Ur5jJvX68Us1OlW7Opg/0
 Glhcf5QE+Qm5Io0Cko4qxkFUVIU00/GUL64U6G7hwABTqtEDJ12R99nyD2xxJZz53S6W/GjLJYA
 ELDXFv950Dsh/SBghTk7WWCQi6eVJNU6BFccBdSJipdnkrb6qr5qlUPREA62C/3n19FQ2nWpZ30
 z2aCOfpKsqdXxqmRa8yAzpg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110337_196910_71C6CF1F 
X-CRM114-Status: GOOD (  16.04  )
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
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 50 ++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index ee0bd696064e..b8138e796c4d 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -54,9 +55,15 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
 {
 	struct rockchip_dw_dp *dp = data;
 	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
 
 	dp->hpd_sel = force_hpd_from_sw;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel));
 }
@@ -65,11 +72,17 @@ static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
 {
 	struct rockchip_dw_dp *dp = data;
 	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
 
 	dev_dbg(dp->dev, "Force HPD connected=%s\n", str_yes_no(hpd));
 
 	dp->hpd_cfg = hpd;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
 }
@@ -200,7 +213,7 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_dw_dp *dp;
 	struct resource *res;
-	int id;
+	int id, ret;
 
 	plat_data_const = device_get_match_data(dev);
 	if (!plat_data_const)
@@ -247,6 +260,12 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->base))
 		return PTR_ERR(dp->base);
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
@@ -255,6 +274,34 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
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
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel) |
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
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
@@ -289,5 +336,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0


