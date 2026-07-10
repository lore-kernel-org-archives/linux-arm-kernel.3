Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CE4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcmF8Egqc5+nTxN0P5fzHkCVpU6of7QL5hLJubaQl5Y=; b=plZ6X8L5pixwo+oEm0uwRWeUib
	uLM4c1J/z9G1Q+aT54yBNUlV8xLNl2RpHZtkt7O86P/PDRYTL6asEo8wOaMjU/4hjkZhCetUbQaiH
	IXMlXBLqv/0hAxxv9YeSKNab+blQWijXh6ZVB3Fo4q8VZfO1AIPnQrnSGGna2ldkPa/mRhGO5qTFG
	ynWTSLZwcE71D4a/wPlCgsXR55SD6Ju35UFn3DmamnvlLatM/Kam3fBh2Cx+kA3XXBDFqJzkwhYLn
	VIbKutSfbIMRdGbZ7MjBhHL5xUQoDuGqSVSAfzlnMNV9JaoNVx9M3k7YDChERviBW3q7+lMc/8THO
	lmylyOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1KO-00000004085-1DYx;
	Fri, 10 Jul 2026 02:51:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1KN-0000000407j-29oZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A32B43DBC;
	Fri, 10 Jul 2026 02:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFD0BC2BCF4;
	Fri, 10 Jul 2026 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783651858;
	bh=TpGJ0HgZLVDPaYc57SOUoH7whSlNEtTx1wMSxT+hVHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oc3BafBbM1+2+7u1C9raEOim1a/RvQLKXsY/94Sj4UpwfxvMn+IuUCtt6mYLko9et
	 YuA41I/cgijjdOKzw7aObFO390t2nfvCKJcrn4FSN2Xa2JL+xjRvuid18BBX1YwyLC
	 dm+G7DfbQ3SvC1iemH+ar58RofQ+Bb9iJt1hXIm+CoKa6br5TYZ4wv8snpJNmAtIun
	 CV8xd+Z69ZPF6EtEdkSO9G6xbjVwu/aq3IzLpaB/PPDdqE2YQr4mQoG3LkB3YNbh9b
	 83JQWN6PVgStWjcTMFMmV9SVxhVXcWTgxnWwJ3agTNwIB/au8hRiWemlKW0PxWQQKD
	 h0t7GqRJP+5bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DD7C44506;
	Fri, 10 Jul 2026 02:50:58 +0000 (UTC)
From: HaoNing Cheng via B4 Relay <devnull+Haoning.CHENG.cn.bosch.com@kernel.org>
Date: Fri, 10 Jul 2026 10:50:41 +0800
Subject: [PATCH v3 2/2] thermal/drivers/imx: Add calibration offset support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-2-db9fc2947c55@cn.bosch.com>
References: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com>
In-Reply-To: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651853; l=2625;
 i=Haoning.CHENG@cn.bosch.com; s=20260709; h=from:subject:message-id;
 bh=MRMJXW3PasN1+vP3XrwOg3tSDMAKHZqZCG42ukJ5xEc=;
 b=M74uxJU0s38atttQdAJ0RxLeYA/l+9RZLMZC5PB4EX8tUKWiXQCTaLh0NUwF3l+lEmt7GteX6
 uSxBQnjYCUKAlINdAIaoFmDczFLseXi5M4UA51Rb8PaPQwekSs++xXa
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=ed25519;
 pk=glQGwad/fosRS5gZUJYbLDPPLGe7rFTrTV2VxY/ySdc=
X-Endpoint-Received: by B4 Relay for Haoning.CHENG@cn.bosch.com/20260709
 with auth_id=860
X-Original-From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
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

From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements.

Read the optional fsl,temp-calibration-offset-millicelsius property from
DT and apply it to the i.MX6/6SX/7D calibration formulas. When the
property is not present, the default offset remains 0, preserving the
current behaviour.

Signed-off-by: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
---
 drivers/thermal/imx_thermal.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb3..8062d34ffed8 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -207,6 +207,7 @@ struct imx_thermal_data {
 	struct regmap *tempmon;
 	u32 c1, c2; /* See formula in imx_init_calib() */
 	int temp_max;
+	s32 calibration_offset;
 	int alarm_temp;
 	int last_temp;
 	bool irq_enabled;
@@ -240,10 +241,13 @@ static void imx_set_alarm_temp(struct imx_thermal_data *data,
 
 	data->alarm_temp = alarm_temp;
 
-	if (data->socdata->version == TEMPMON_IMX7D)
-		alarm_value = alarm_temp / 1000 + data->c1 - 25;
-	else
+	if (data->socdata->version == TEMPMON_IMX7D) {
+		alarm_value = DIV_ROUND_UP(alarm_temp - data->calibration_offset,
+					   1000) + data->c1 - 25;
+		alarm_value = clamp(alarm_value, 0, 0x1ff);
+	} else {
 		alarm_value = (data->c2 - alarm_temp) / data->c1;
+	}
 
 	regmap_write(map, soc_data->high_alarm_ctrl + REG_CLR,
 		     soc_data->high_alarm_mask);
@@ -274,7 +278,7 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	/* See imx_init_calib() for formula derivation */
 	if (data->socdata->version == TEMPMON_IMX7D)
-		*temp = (n_meas - data->c1 + 25) * 1000;
+		*temp = (n_meas - data->c1 + 25) * 1000 + data->calibration_offset;
 	else
 		*temp = data->c2 - n_meas * data->c1;
 
@@ -413,7 +417,7 @@ static int imx_init_calib(struct platform_device *pdev, u32 ocotp_ana1)
 	temp64 *= 1000; /* to get result in °mC */
 	do_div(temp64, 15423 * n1 - 4148468);
 	data->c1 = temp64;
-	data->c2 = n1 * data->c1 + 28581;
+	data->c2 = n1 * data->c1 + 28581 + data->calibration_offset;
 
 	return 0;
 }
@@ -629,6 +633,10 @@ static int imx_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
+	of_property_read_s32(dev->of_node,
+			     "fsl,temp-calibration-offset-millicelsius",
+			     &data->calibration_offset);
+
 	if (of_property_present(dev->of_node, "nvmem-cells")) {
 		ret = imx_init_from_nvmem_cells(pdev);
 		if (ret)

-- 
2.43.0



