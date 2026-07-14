Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC6CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1UCi282A4xcVqlCBSEhfmTknzD1fV6u3mCNBfpixb0=; b=1mUxXcSBIRYRhzkT3gpLFIcwLS
	vJmvndWU1khIX2GrGkZzSYBOmiPCfskMNfzZQ/DfJHIr+twjn3h2hbkPWafI4VToFbcKNLYeUKjJx
	Ly06KD2Tj5rRqv7BGi8v3au01XCCVy+ScN3Ig014K0sPLxB0asGtxq9o/agtPdlaG7oKU0U9+DZnX
	ZU37Xk26EEcTpAZb5CDl4Ie7fbzG9nDTw3smP4LLb8BVp10TexuzUvio+v8gfxeT1Fah9u9e/E7ln
	FazWCruTh8fqA4srBNCa8y9IDnQOl1ok9BMH6Ho3xQZO+pToEcJqPb7TnM39bl0XrSb/KiOSSUY2V
	jzZZ4lXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaNg-0000000BZX7-1j6x;
	Tue, 14 Jul 2026 10:28:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaNb-0000000BZVs-1xaC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0524F43D9A;
	Tue, 14 Jul 2026 10:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAD5EC2BD00;
	Tue, 14 Jul 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784024926;
	bh=iVgLZlJQ+vMNolXxqzGao5tv1EtYdzquxCIotgcJLJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t35gmi7uKtBrLA+I1udsLGXZpkRUxo7suahFfAGRqAJA8sLMFqJgUtkJ2egOTVi7i
	 0DVjTwK2cGvlxNYpRGn6+XlMLl/6z3NVE2gyTj8UIq6ZIqPK+WUuSnN78TMOcisYOA
	 e2lUyvyRE5GLSuMPiM5RIu+BpflpdRGFAoWXDew75QYuAaCzJdmeeArc0HQEX+M6ID
	 LAc/tQKmQXNt0NGdEa1VgBpFAR8aREJts7gHgobU7q94BrE3Sn68x17E+A8NFn3EJL
	 wXmXM3Ak1t2aRw3kk5z9W/Sx1GCtzQpWlg+1bg2RDLFDJa7YTgPrZIj1YuJctpF9F/
	 Oxr5e6ku5TPUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8759C44507;
	Tue, 14 Jul 2026 10:28:46 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Tue, 14 Jul 2026 18:28:43 +0800
Subject: [PATCH v8 3/3] thermal/drivers/imx: Add calibration offset support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-3-d54d8690e16e@cn.bosch.com>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
In-Reply-To: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Haoning CHENG <Haoning.CHENG@cn.bosch.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784024921; l=4200;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=fVZ8/nh0Wo4y9uiBm2vp04dsfqXgZZNI2dShzcEryTw=;
 b=/WnMq2zuNxvlbasuk2ft8ic81S5ZQT/nP29GZ+kVVgzJyYNVKsh42yxesFUiCuu0l94a4R6EH
 jNpzUSgxAk+AinG6HBgTnVpMp+wV9sQvEhQDlQAGyMwUq6U5P8ZiuYB
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=ed25519;
 pk=glQGwad/fosRS5gZUJYbLDPPLGe7rFTrTV2VxY/ySdc=
X-Endpoint-Received: by B4 Relay for Haoning.CHENG@cn.bosch.com/20260709
 with auth_id=860
X-Original-From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
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
Reply-To: Haoning.CHENG@cn.bosch.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>

Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements. Read the optional
fsl,temp-calibration-offset-millicelsius property from DT and apply it
uniformly to the i.MX6/6SX/7D calibration formulas.

The offset is applied symmetrically at two points to ensure the thermal
framework sees calibrated temperatures while hardware thresholds remain
correctly positioned:

1. In imx_set_alarm_temp() and imx_set_panic_temp(): the temperature
   threshold is *subtracted* by the offset before being converted to a
   hardware register value. This shifts the hardware IRQ trigger to the
   physical temperature that corresponds to the intended threshold.

2. In imx_get_temp(): after computing physical temperature from the
   hardware register, the offset is *added* back. The thermal framework
   always sees the calibrated temperature.

For example, if DT sets offset = +3000 m°C (board reads 3°C too low)
and the passive trip is 95°C:

  imx_set_alarm_temp(95000):
    alarm_temp = 95000 - 3000 = 92000
    → hardware register programmed for 92°C physical

  Hardware IRQ fires at 92°C physical

  imx_get_temp():
    reads hardware, computes 92°C physical
    *temp = 92000 + 3000 = 95000
    → thermal framework sees 95°C → correct trip

When the property is not present, the offset defaults to 0, preserving
the current behavior.

Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
---
 drivers/thermal/imx_thermal.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 7f7d1116b9d6..d471acc16bce 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -85,6 +85,10 @@ enum imx_thermal_trip {
 #define TEMPMON_IMX6SX			2
 #define TEMPMON_IMX7D			3
 
+/* Calibration offset limits (±20 °C in millicelsius) */
+#define IMX_TEMP_CALIB_OFFSET_MIN	(-20000)
+#define IMX_TEMP_CALIB_OFFSET_MAX	20000
+
 struct thermal_soc_data {
 	u32 version;
 
@@ -207,6 +211,7 @@ struct imx_thermal_data {
 	struct regmap *tempmon;
 	u32 c1, c2; /* See formula in imx_init_calib() */
 	int temp_max;
+	s32 calibration_offset;
 	int alarm_temp;
 	int last_temp;
 	bool irq_enabled;
@@ -223,6 +228,7 @@ static void imx_set_panic_temp(struct imx_thermal_data *data,
 	struct regmap *map = data->tempmon;
 	int critical_value;
 
+	panic_temp -= data->calibration_offset;
 	critical_value = (data->c2 - panic_temp) / data->c1;
 
 	regmap_write(map, soc_data->panic_alarm_ctrl + REG_CLR,
@@ -239,6 +245,7 @@ static void imx_set_alarm_temp(struct imx_thermal_data *data,
 	int alarm_value;
 
 	data->alarm_temp = alarm_temp;
+	alarm_temp -= data->calibration_offset;
 
 	if (data->socdata->version == TEMPMON_IMX7D) {
 		if (alarm_temp >= 0)
@@ -283,6 +290,7 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 		*temp = (n_meas - data->c1 + 25) * 1000;
 	else
 		*temp = data->c2 - n_meas * data->c1;
+	*temp += data->calibration_offset;
 
 	/* Update alarm value to next higher trip point for TEMPMON_IMX6Q */
 	if (data->socdata->version == TEMPMON_IMX6Q) {
@@ -635,6 +643,25 @@ static int imx_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
+	if (of_property_present(dev->of_node,
+				"fsl,temp-calibration-offset-millicelsius")) {
+		ret = of_property_read_s32(dev->of_node,
+					   "fsl,temp-calibration-offset-millicelsius",
+					   &data->calibration_offset);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read calibration offset\n");
+
+		if (data->calibration_offset < IMX_TEMP_CALIB_OFFSET_MIN ||
+		    data->calibration_offset > IMX_TEMP_CALIB_OFFSET_MAX)
+			return dev_err_probe(dev, -EINVAL,
+					     "calibration offset %d millicelsius out of range\n",
+					     data->calibration_offset);
+
+		dev_dbg(dev, "calibration offset: %d millicelsius\n",
+			data->calibration_offset);
+	}
+
 	if (of_property_present(dev->of_node, "nvmem-cells")) {
 		ret = imx_init_from_nvmem_cells(pdev);
 		if (ret)

-- 
2.43.0



