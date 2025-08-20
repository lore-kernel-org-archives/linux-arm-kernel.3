Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE25FCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR8db+6twk3W6OljKcDbbKnbvCIJaMfUNGo86aYcr88=; b=epGIf4z29RJgYARgdufD/ufp2K
	O8scNp/DdIkH5DOdtjLJeCUZJMF2jS/s9xTbT2g8B8Jmd2AjXKI5EnfkjPp58jUp6nXkmK7GDcE8H
	oqUnr/dWYa26b6Raw7tzA5qZdvCoBiVVLxl73XPLKZX8QpS5LddTm93r6lGC+VBjJmCwcPTmjpXzm
	ROojiiT+WdmaT9SZfYFcnNgjBsipAyg34wRLQyqoJcK3QCr6eJEqy7mqWTFbyHuBwAbHmhztFbElv
	N6T8zYAnh+L2Va47uqnbFEqxJDf2g49GRasBnLOOfGDRiZJeZtjBckyZxfJGLR9gPqDbEYKKNLzya
	R01MaLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uor7V-0000000F4Rz-38Ov;
	Wed, 20 Aug 2025 22:17:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomnz-0000000EZz7-0Qo7;
	Wed, 20 Aug 2025 17:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755711657;
	bh=cv/HvJA3SdPGsRxB/T+jdV8EVtU5USfUusiJ3NtOEdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aIgO1PcRxnI+r/PXwGZoIO+Ltv8Ewi2WVfQvnJ7Kmvb1jtUBuGoWKhAt4OxKvtPgY
	 DG6qklDDtrFx5UcwFFTNlgFgj4kHYSG4Y/n0Y5f4yknyF3afD6Xg+quTnr9gsdcPy9
	 r1jFbwsxmt7dC6/+aQJlmnAd+kMwGQhg6WQSHt8BtRyttZ0EWcDxrPllhGuLavyRCw
	 JbLWYZyCz45Gd0zSeuaVdFzrCZitqiFCu1qJvFa5mxiVOZp76L4iAvOmOEpgrshCRu
	 S0tlq3vdNyMuF5mYZUJ5XrtJ/ZDQa6r1N3T3CZ9JRT9Gq+xZ33vzQO5feZEj5jja9V
	 qZ1kcY0CiUnKQ==
Received: from jupiter.universe (dyndsl-091-248-213-114.ewe-ip-backbone.de [91.248.213.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E33D417E0237;
	Wed, 20 Aug 2025 19:40:56 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A5141480048; Wed, 20 Aug 2025 19:40:56 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 20 Aug 2025 19:40:48 +0200
Subject: [PATCH v2 2/3] thermal: rockchip: shut up GRF warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5959; i=sre@kernel.org;
 h=from:subject:message-id; bh=cv/HvJA3SdPGsRxB/T+jdV8EVtU5USfUusiJ3NtOEdA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGimCKhZB2Qy/66UnTyJwTNkprOFtM351AXBX
 MeqRJwywrIjnokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJopgioAAoJENju1/PI
 O/qapPMQAJ4AIB5czKPJT5zpXcir8OrTbNePX5Pa6EvaYMwXm1kTybwSx0Rsq/TpIqj7Sq8UV0Y
 ycI8O4/2RMNoyIlL0qsQBq+MXhKW8lVrtnIhO2JIPBGc+HlO7zDym7YgatR8lQWvn9ScFfqr/zc
 PROvFlNKInk7oeK8tfJdhTkJoNTxI7Uo3RLGct8VKwjvRxa+z0Cj7cpYMj8haB5Af6cVsIidq8T
 JxYS+RSJorssph5nphREzyz3IxKhC44lLV2WeZ7qWzr8w2WLS2y0aEnF/xrN+RKeJ+aLvO2i7fb
 3+DRyoayJEzM7AlUpsWnFw4Njk81AOLHXz1erb0AMA57h8qRftRN5pmnRwI8ed7kOZ5nkB5Wm0n
 qMz13GLorkTSKIA+0KfGTfvo8E9t9Rtd3PpZ3V7WaJucKOcq5BaRdnWiIBcHSkaU2I7LtFm6a7T
 EQDMRHWcOeLC8tMMZPxJDoel2LD8Z41S7BrgwO078mi95pDGAKg4xNvbMlKFzxgSEkY22gJqDX3
 I6Y0Mds5ZaFxzylFWohNWC2RRMrxHNXlCBQpueP1No2RpyG62y3J1G3+PgN7D9MbpRTDXx5lyPM
 ztVQOp2+QLlNCwDtncwEXuAP3g5OYqj1QTreyV+TkDBAp9/Nfyvn2Zt0hnX+sBSYHM982/YSFXq
 WSO4F0EOqBEIRDr3gp7Msaw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_104059_510743_E7CAA8EF 
X-CRM114-Status: GOOD (  14.86  )
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

Most of the recent Rockchip devices do not have a GRF associated
with the tsadc IP. Let's avoid printing a warning on those devices.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/thermal/rockchip_thermal.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 7b18a705dfade6fa7318b28c2b57544a4446c1cc..c49ddf70f86e7beaf0190b1b3e93f5e6b2f72b2c 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -74,6 +74,7 @@ struct chip_tsadc_table {
  * @tshut_temp: the hardware-controlled shutdown temperature value, with no trim
  * @tshut_mode: the hardware-controlled shutdown mode (0:CRU 1:GPIO)
  * @tshut_polarity: the hardware-controlled active polarity (0:LOW 1:HIGH)
+ * @grf_required: true, if a GRF is required for proper functionality
  * @initialize: SoC special initialize tsadc controller method
  * @irq_ack: clear the interrupt
  * @control: enable/disable method for the tsadc controller
@@ -97,6 +98,9 @@ struct rockchip_tsadc_chip {
 	enum tshut_mode tshut_mode;
 	enum tshut_polarity tshut_polarity;
 
+	/* GRF availability */
+	bool grf_required;
+
 	/* Chip-wide methods */
 	void (*initialize)(struct regmap *grf,
 			   void __iomem *reg, enum tshut_polarity p);
@@ -1098,6 +1102,7 @@ static const struct rockchip_tsadc_chip px30_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* 2 channels for tsadc */
+	.grf_required = true,
 	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
 	.tshut_temp = 95000,
 	.initialize = rk_tsadcv4_initialize,
@@ -1119,6 +1124,7 @@ static const struct rockchip_tsadc_chip rv1108_tsadc_data = {
 	/* cpu */
 	.chn_offset = 0,
 	.chn_num = 1, /* one channel for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1141,6 +1147,7 @@ static const struct rockchip_tsadc_chip rk3228_tsadc_data = {
 	/* cpu */
 	.chn_offset = 0,
 	.chn_num = 1, /* one channel for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1163,6 +1170,7 @@ static const struct rockchip_tsadc_chip rk3288_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 1,
 	.chn_num = 2, /* two channels for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1185,6 +1193,7 @@ static const struct rockchip_tsadc_chip rk3328_tsadc_data = {
 	/* cpu */
 	.chn_offset = 0,
 	.chn_num = 1, /* one channels for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
 	.tshut_temp = 95000,
 	.initialize = rk_tsadcv2_initialize,
@@ -1206,6 +1215,7 @@ static const struct rockchip_tsadc_chip rk3366_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
+	.grf_required = true,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1228,6 +1238,7 @@ static const struct rockchip_tsadc_chip rk3368_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1250,6 +1261,7 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
+	.grf_required = true,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1272,6 +1284,7 @@ static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
+	.grf_required = true,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1294,6 +1307,7 @@ static const struct rockchip_tsadc_chip rk3576_tsadc_data = {
 	/* top, big_core, little_core, ddr, npu, gpu */
 	.chn_offset = 0,
 	.chn_num = 6, /* six channels for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1318,6 +1332,7 @@ static const struct rockchip_tsadc_chip rk3588_tsadc_data = {
 	/* top, big_core0, big_core1, little_core, center, gpu, npu */
 	.chn_offset = 0,
 	.chn_num = 7, /* seven channels for tsadc */
+	.grf_required = false,
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
@@ -1594,12 +1609,10 @@ static int rockchip_configure_from_dt(struct device *dev,
 		return -EINVAL;
 	}
 
-	/* The tsadc wont to handle the error in here since some SoCs didn't
-	 * need this property.
-	 */
 	thermal->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-	if (IS_ERR(thermal->grf))
-		dev_warn(dev, "Missing rockchip,grf property\n");
+	if (IS_ERR(thermal->grf) && thermal->chip->grf_required)
+		return dev_err_probe(dev, PTR_ERR(thermal->grf),
+				     "Missing rockchip,grf property\n");
 
 	rockchip_get_trim_configuration(dev, np, thermal);
 

-- 
2.50.1


