Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A1F327B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMBSJabN8FDbZhwftRSMScDETGjahqarsp16bMV3PT4=; b=hV8kh3NeIVLqHx2QEd2UnhKX+N
	cqKsziIi7ljsshP4kGBNuN8uN+6jhXjc/ekthVcEDd3ZXUwzcBbREpFduMU2uzJ5U6Q0h/mvU0gdN
	nNlSCG4ueACLLUC2ikbwovU0cwj/4d1oXGDVymN73dLTehPjV+S8cGVHr1HFiTj7Hky41KEhGjiY8
	qmZDP8w9fL9zTKVUGBsaeNPCmNBxIifaZaYhfN959IYhV/jSHVqqZm2vBQW4rFm+ePhkGk188gXQI
	VWXSGOeu75cx4Qgy69OHcPYV0cOAPEyTiZcy2fqYc7Ua2OmOcE7QmjZmo4JoQ1SeBKDO2zSbZhVRi
	Hh0C4DMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5PX-00000008ABy-3eYw;
	Tue, 21 Apr 2026 07:20:43 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5PM-00000008A2m-0sbR;
	Tue, 21 Apr 2026 07:20:34 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776756028;
	bh=+OPiaJJPEI4198UFVptwbMsLl2t7li0yawHDEA3XDzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BUiA4cyLV5JH+ZcTO4oMpVxRc//ZqQlaBE6oxfrBC6QrhqIgXGvZnB6kHYg4qFli9
	 yiNC6/ZNvwAwIhC7bH0Ks3ZoNqgmdkrqVk6fXxU2WuH1+Ee0S4OmCTKLqK3A+drHsA
	 +ILwwV/mKvS8iVeW+/hNtIhNRtFVw5tPQsb3k96I=
Date: Tue, 21 Apr 2026 09:19:46 +0200
Subject: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
In-Reply-To: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776756023; l=4382;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=+OPiaJJPEI4198UFVptwbMsLl2t7li0yawHDEA3XDzo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNoBMoSWvVWsCyLCd1eEWvZ1jgQJpmPRJy+mxKgaG9hWR67FeO2pV71cL+j8+JVS+T5l+dDXtU2
 2R84MvXh0cAA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_002032_571941_0E8F69B8 
X-CRM114-Status: GOOD (  18.17  )
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

Some SoCs (e.g. T7) expose thermal calibration data through the secure
monitor rather than a directly accessible eFuse register. Add a use_sm
flag to amlogic_thermal_data to select this path, and retrieve the
firmware handle and tsensor_id from the "amlogic,secure-monitor" DT
phandle with one fixed argument.

Also introduce the amlogic,t7-thermal compatible using this new path.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/thermal/amlogic_thermal.c | 58 +++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 5448d772db12a..11e3948cc0669 100644
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
@@ -138,6 +143,12 @@ static int amlogic_thermal_initialize(struct amlogic_thermal *pdata)
 	int ret = 0;
 	int ver;
 
+	if (pdata->data->use_sm) {
+		return meson_sm_get_thermal_calib(pdata->sm_fw,
+						  &pdata->trim_info,
+						  pdata->tsensor_id);
+	}
+
 	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
 		    &pdata->trim_info);
 
@@ -226,6 +237,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
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
@@ -239,6 +256,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
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
@@ -271,11 +292,38 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->clk))
 		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
 
-	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
-		(pdev->dev.of_node, "amlogic,ao-secure");
-	if (IS_ERR(pdata->sec_ao_map)) {
-		dev_err(dev, "syscon regmap lookup failed.\n");
-		return PTR_ERR(pdata->sec_ao_map);
+	if (pdata->data->use_sm) {
+		struct device_node *sm_np;
+		struct of_phandle_args ph_args;
+
+		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
+						       "amlogic,secure-monitor",
+						       1, 0, &ph_args);
+		if (ret)
+			return ret;
+
+		sm_np = ph_args.np;
+		if (!sm_np) {
+			dev_err(dev,
+				"Failed to parse secure monitor phandle\n");
+			return -ENODEV;
+		}
+
+		pdata->sm_fw = meson_sm_get(sm_np);
+		of_node_put(sm_np);
+		if (!pdata->sm_fw) {
+			dev_err(dev, "Failed to get secure monitor firmware\n");
+			return -EPROBE_DEFER;
+		}
+
+		pdata->tsensor_id = ph_args.args[0];
+	} else {
+		pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
+			(pdev->dev.of_node, "amlogic,ao-secure");
+		if (IS_ERR(pdata->sec_ao_map)) {
+			dev_err(dev, "syscon regmap lookup failed.\n");
+			return PTR_ERR(pdata->sec_ao_map);
+		}
 	}
 
 	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,

-- 
2.49.0


