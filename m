Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75649CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=US4DDrhBomgwBLFnUsNAaSsLTF5BBaLuoqq78N+F9bs=; b=1vezoagEvAtyWBtKpV0fxvEq/I
	xSdDzeraioSbtAOTiFoqwA2QaF9qFc5AEARGvZuzjxGgsbMSR2pUe6d8mzvajMPC1sRY2LNc2y75r
	iZY4gW1XFCQqcvJngYzmLEaz2Vjrbz0Wryg3xQkF6n+UBYmLnn0l0yFu0LnSCV79lcW5ozTN0SwNp
	a2O731m4LfhTc+0vzde/ZKqXhTWTgfxWBSPa06zm4swQ6/z3Q/yorixYnCck0oT2D62t9CL+ps+MW
	fGWgy/ixHofMNyGnPrTQdZaPEGaccb81HzgWcIEh/RuARq0Z9glmqb9qQ9UsErkAoD8Zv0mg8yaSY
	AERhSVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcbB-00000002Fdl-2JRW;
	Fri, 16 Oct 2026 07:43:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcb7-00000002FcS-0ri6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6CC2447D0;
	Fri, 16 Oct 2026 07:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CF49C2BCFF;
	Fri, 16 Oct 2026 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792136602;
	bh=ITBBTNbrJy4rjiCqecHeGN6oMKu87IH6xqyjgbYmK7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GycjR6PhMfa1dtf2D08ZPjIboG1+NCe+hCjUXunfj/SJ5/UOPc1NrW21BdvMpBC7q
	 DayEQbAHsW8vgv102np8NdV0JFlG4xwns6wMtCjDF+qKln9G2SZ/TYmCqi845fW0oL
	 RZz/t9WsRIDyONWvHlM2HXLGxsdMJe5YuCvGcDRerod8UKfNijCrV6ylJogFwn6N4e
	 55yuaZYxVuI3A19Fhq4rLyou93yNFOSrh6f1KVV0F+tMbKUlXvUMwdDiwjI7vym0+K
	 mh0TBdtfSnJ51ie2pr1Uz/MyJ2/xnhzALb3iVKB2sEuwvDUUxGNTTE/5OggAjrr+zy
	 G6nS08e7qIB4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE4ECCA462;
	Fri, 16 Oct 2026 07:43:22 +0000 (UTC)
From: Haoning CHENG via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Fri, 16 Oct 2026 15:43:20 +0800
Subject: [PATCH RESEND v11 3/3] thermal/drivers/imx: Add calibration offset
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-b4-symana21-11221-imx-thermal-support-upstream-6-18-v11-3-b80952ad27d6@cn.bosch.com>
References: <20261016-b4-symana21-11221-imx-thermal-support-upstream-6-18-v11-0-b80952ad27d6@cn.bosch.com>
In-Reply-To: <20261016-b4-symana21-11221-imx-thermal-support-upstream-6-18-v11-0-b80952ad27d6@cn.bosch.com>
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
 linux-kernel@vger.kernel.org, Haoning CHENG <Haoning.CHENG@cn.bosch.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792136598; l=4319;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=iGtMCQeZJKH4z5VifCeuyUN93+QX4fy7skn49vUYhis=;
 b=p3ecGX8rpMDwbdviSKFKrfkLVuy9mrWu/aACj07WnLTHEA8l+T/z2d/QNwruJVC6K89YMMICL
 9IOqPLoEvlADbJxL3v6WXYaXoOBXzmdWGnpfGu4B4uHg5dS+5tFs/Fc
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

The TEMPMON sensor reading may deviate from the theoretical SoC
junction temperature. Hardware characterization shows a measurable
offset between the sensor output and the calculated junction
temperature.

Read the optional fsl,temp-calibration-offset-millicelsius property
from DT and apply it uniformly to the i.MX6/6SX/7D formulas.

The offset is applied symmetrically at two points to keep trip point
semantics consistent:

1. In imx_set_alarm_temp() and imx_set_panic_temp(): the temperature
   threshold is *subtracted* by the offset before being converted to a
   hardware register value. This keeps the hardware IRQ trigger aligned
   with the physical sensor reading that corresponds to the intended
   temperature threshold.

2. In imx_get_temp(): after computing the temperature from the hardware
   register, the offset is *added* to produce the calibrated value.
   The thermal framework always sees the corrected temperature.

For example, if DT sets offset = +3000 m°C and the passive trip is 95°C:

  imx_set_alarm_temp(95000):
    alarm_temp = 95000 - 3000 = 92000
    → hardware register programmed for 92°C sensor reading

  Hardware IRQ fires when sensor reads 92°C

  imx_get_temp():
    reads hardware, computes 92°C
    *temp = 92000 + 3000 = 95000
    → thermal framework sees 95°C → correct trip

When the property is not present, the offset defaults to 0, preserving
the current behavior.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
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



