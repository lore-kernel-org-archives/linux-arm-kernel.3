Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A86FDEE22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUd2sBaGwwDKj12OH/lxoYgfGnPIbSCmBFJDWCQYDMg=; b=G8bH40B7DMKApOQTdryAELWGA1
	L1TxphlLaEAYRqVNYmNyM21dOAi/WjhfDeOX/y/QGQLfrO9UoFlYggyskICH9rovOIWA70/cpKAH/
	n4CYxdkgy+L0OXyQPmIZ16mOb38AMEvfn8FCvZdiny0qEND/pLZD0sZZywzQR/WuQK/3dtsvPARLo
	FS9ZwBHZvLGHIH2rzoG5q5n4HfWDMURTfgRB4I4QU9Oa3eWC84P00HCevlbkPwQhsDZUiRndzWA52
	iK7p/UpKJorl1624wiPM7CVPrwvpF35Z6lDFkYFwMlMf+CUbhaSVyMJpYOw8rOPf/nFakYSiaEUfR
	v9GoVIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwbM-0000000BvjW-3XaP;
	Thu, 23 Apr 2026 16:08:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwb6-0000000BvUY-3Kzj;
	Thu, 23 Apr 2026 16:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FAFF446AF;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1228FC2BCC7;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776960491;
	bh=Jnu26GqpRqta4b0VDzfrrRbzqQcMNeNztp6nUK+SEd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uhsizbp4E6opDbgCHWJ0iO04aDpIrZyLKdmrzI/vftt19r+V6vXeVFnavDdGC5I3N
	 VIgOmn0TZURLA+Zt2WNckJ6rBM7oZRjTSFdsVJOgs40oo28d7Nx54msPbuy2FHPMbm
	 gLju7UB9VUgwL05Yw6uVS3T/tyUi2RLtjrzgJpGqmo1uD3CBL4R52AcHKlvIzOo1za
	 503JQ+HA3TgdltmSRo63RZ/6QwIck3qRBkRwqfCs5CHVcm1Vo39K+OmZw/2y7ijUbj
	 dVz/uHGoDaO1pPfTgjdckJCLuLFJ5W0UCDFl4z+BcFBWFzy1XWmr585jKrlNAkmwu9
	 Hv01XdOCfui0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D8DFC037F;
	Thu, 23 Apr 2026 16:08:11 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 23 Apr 2026 18:07:19 +0200
Subject: [PATCH v4 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-add-thermal-t7-vim4-v4-4-d4c1528d5044@aliel.fr>
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6338;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=qeq7CmoCVHNHWCj/bIX1HdhJMGDCbtiJ3F/tbHGtGxA=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ+Yr58fCL61b5Y//D5Q+U7nD0+y/3PkrtUfzur/klB7Nj
 G5nevqqo5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZjI7weMDL1Ne058ip09K8Rg
 5rtFfSsu6W7m7TqxLrtu0bt7RtkrTnEzMvydrHy981h08kfxpEkZqzfqyQrpr2JsEWNbo3HjZ8Y
 RT24A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_090812_894686_0E08B941 
X-CRM114-Status: GOOD (  19.98  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Some SoCs (e.g. T7) expose thermal calibration data through the secure
monitor rather than a directly accessible eFuse register. Add a use_sm
flag to amlogic_thermal_data to select this path, and retrieve the
firmware handle and tsensor_id from the "amlogic,secure-monitor" DT
phandle with one fixed argument.

Also introduce the amlogic,t7-thermal compatible using this new path.

While refactoring, fix a pre-existing bug where
amlogic_thermal_initialize() was called after
devm_thermal_of_zone_register(), causing the thermal framework to
read an uninitialized trim_info on zone registration.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/thermal/amlogic_thermal.c | 115 ++++++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 30 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 5448d772db12a..0d0c01e57b85e 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
+#include <linux/firmware/meson/meson_sm.h>
 
 #include "thermal_hwmon.h"
 
@@ -84,12 +85,14 @@ struct amlogic_thermal_soc_calib_data {
  * @u_efuse_off: register offset to read fused calibration value
  * @calibration_parameters: calibration parameters structure pointer
  * @regmap_config: regmap config for the device
+ * @use_sm: read data from secure monitor instead of efuse
  * This structure is required for configuration of amlogic thermal driver.
  */
 struct amlogic_thermal_data {
 	int u_efuse_off;
 	const struct amlogic_thermal_soc_calib_data *calibration_parameters;
 	const struct regmap_config *regmap_config;
+	bool use_sm;
 };
 
 struct amlogic_thermal {
@@ -100,6 +103,8 @@ struct amlogic_thermal {
 	struct clk *clk;
 	struct thermal_zone_device *tzd;
 	u32 trim_info;
+	struct meson_sm_firmware *sm_fw;
+	u32 tsensor_id;
 };
 
 /*
@@ -133,26 +138,6 @@ static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
 	return temp;
 }
 
-static int amlogic_thermal_initialize(struct amlogic_thermal *pdata)
-{
-	int ret = 0;
-	int ver;
-
-	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
-		    &pdata->trim_info);
-
-	ver = TSENSOR_TRIM_VERSION(pdata->trim_info);
-
-	if ((ver & TSENSOR_TRIM_CALIB_VALID_MASK) == 0) {
-		ret = -EINVAL;
-		dev_err(&pdata->pdev->dev,
-			"tsensor thermal calibration not supported: 0x%x!\n",
-			ver);
-	}
-
-	return ret;
-}
-
 static int amlogic_thermal_enable(struct amlogic_thermal *data)
 {
 	int ret;
@@ -190,6 +175,70 @@ static int amlogic_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
+static int amlogic_thermal_probe_sm(struct platform_device *pdev,
+				    struct amlogic_thermal *pdata)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *sm_np;
+	struct of_phandle_args ph_args;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+					       "amlogic,secure-monitor",
+					       1, 0, &ph_args);
+	if (ret)
+		return ret;
+
+	sm_np = ph_args.np;
+	if (!sm_np) {
+		dev_err(dev,
+			"Failed to parse secure monitor phandle\n");
+		return -ENODEV;
+	}
+
+	pdata->sm_fw = meson_sm_get(sm_np);
+	of_node_put(sm_np);
+	if (!pdata->sm_fw) {
+		dev_err(dev, "Failed to get secure monitor firmware\n");
+		return -EPROBE_DEFER;
+	}
+
+	pdata->tsensor_id = ph_args.args[0];
+
+	return meson_sm_get_thermal_calib(pdata->sm_fw,
+					  &pdata->trim_info,
+					  pdata->tsensor_id);
+}
+
+static int amlogic_thermal_probe_syscon(struct platform_device *pdev,
+					struct amlogic_thermal *pdata)
+{
+	struct device *dev = &pdev->dev;
+	int ret = 0;
+	int ver;
+
+	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
+		(pdev->dev.of_node, "amlogic,ao-secure");
+	if (IS_ERR(pdata->sec_ao_map)) {
+		dev_err(dev, "syscon regmap lookup failed.\n");
+		return PTR_ERR(pdata->sec_ao_map);
+	}
+
+	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
+		    &pdata->trim_info);
+
+	ver = TSENSOR_TRIM_VERSION(pdata->trim_info);
+
+	if ((ver & TSENSOR_TRIM_CALIB_VALID_MASK) == 0) {
+		ret = -EINVAL;
+		dev_err(&pdata->pdev->dev,
+			"tsensor thermal calibration not supported: 0x%x!\n",
+			ver);
+	}
+
+	return ret;
+}
+
 static const struct thermal_zone_device_ops amlogic_thermal_ops = {
 	.get_temp	= amlogic_thermal_get_temp,
 };
@@ -226,6 +275,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
 	.regmap_config = &amlogic_thermal_regmap_config_g12a,
 };
 
+static const struct amlogic_thermal_data amlogic_thermal_t7_param = {
+	.use_sm			= true,
+	.calibration_parameters	= &amlogic_thermal_g12a,
+	.regmap_config		= &amlogic_thermal_regmap_config_g12a,
+};
+
 static const struct of_device_id of_amlogic_thermal_match[] = {
 	{
 		.compatible = "amlogic,g12a-ddr-thermal",
@@ -239,6 +294,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
 		.compatible = "amlogic,a1-cpu-thermal",
 		.data = &amlogic_thermal_a1_cpu_param,
 	},
+	{
+		.compatible = "amlogic,t7-thermal",
+		.data = &amlogic_thermal_t7_param,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
@@ -271,12 +330,12 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->clk))
 		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
 
-	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
-		(pdev->dev.of_node, "amlogic,ao-secure");
-	if (IS_ERR(pdata->sec_ao_map)) {
-		dev_err(dev, "syscon regmap lookup failed.\n");
-		return PTR_ERR(pdata->sec_ao_map);
-	}
+	if (pdata->data->use_sm)
+		ret = amlogic_thermal_probe_sm(pdev, pdata);
+	else
+		ret = amlogic_thermal_probe_syscon(pdev, pdata);
+	if (ret)
+		return ret;
 
 	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,
 						   0,
@@ -290,10 +349,6 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 
 	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
 
-	ret = amlogic_thermal_initialize(pdata);
-	if (ret)
-		return ret;
-
 	ret = amlogic_thermal_enable(pdata);
 
 	return ret;

-- 
2.49.0



