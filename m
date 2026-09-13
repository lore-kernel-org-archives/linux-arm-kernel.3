Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F3C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFmILcFARM3nbjJrUrOfoTXP5jUQVkRuUWrnpYTCEmM=; b=XkSIgiFJ9nEWXRJXBYgU2K5imH
	FyNnw+vbeA+KRHAsh4s2RIugmDlULWxLzbybcFpCZyIueMPi+FGVHeJN8FJM/Q1wE47+a6KQXnq00
	rHSAKwybjTS6HkxMIfwzDydiHB2wIKnFH4T/ubqb5NGd0vFua4EGlwGVCrTYip3iZsAuG+zFfjfHb
	N6WxWLxA8qlOcHb+ntgcYthh9mER+JoOZlMVj2qBtLmB83MnTGBdNo772auZZaQphu8q2WxM2LbFE
	smeqjt37q8lKXEuocvTEMzmA5/zf9cdryZXgDYMuTiXnCzkMWostZWMNX6bHYFodEk2qC19oNtGhS
	THh7DfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ldW-00000001jyW-3wzb;
	Sun, 13 Sep 2026 14:56:54 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ldU-00000001jxS-0swr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:56:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d6d28aa26cso17838505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311411; x=1789916211; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFmILcFARM3nbjJrUrOfoTXP5jUQVkRuUWrnpYTCEmM=;
        b=Ayx6Vko+/hLDV5MdJxo6/Dx/bS2Z/tm26LXw2yZGWzIMWkDsR/Iqny1uxdeai83dcR
         EaoZILU1B/r4cenlHpchktCO6MYIEcGcS5Tc33KsiKEMLfDwdJbQstcJIX7ZeIO9RmcF
         /GU7HvJ1sG+hzWqTH70vtOKQ50tb2UuXAXTX0NcAsIsotXiX/3psQRzcatHE7c5fW5Ms
         en4TEZn3pSaVM5N5qT0k9UN08THhCcJBeRJ5nB/bXh385Uhi4Yfvcx10MY9h3WZsAX+g
         1tPL5jtbkK+13dA54I5zTh0atHHwJSgae3oVT49Bc+UyPy5EnDWIYd7d0lW2j88G6PK9
         SXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311411; x=1789916211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFmILcFARM3nbjJrUrOfoTXP5jUQVkRuUWrnpYTCEmM=;
        b=Qha6JHxN7hEvCBpcS45UgSQ1ebAC4jZe+GCCzLZocl9g9JAnGoh4dfWwQwCfa2G1oD
         B6L0zyYt0xHkx0S6tgPnsx8ZfYCVdr2KyfKWb3JG5g5mNXC5rRtEP2aQCf+JKaEqnheM
         4/hoegPik6tRV9u6L5piKFIKFfctc2Jf23Busg4DAbfkTsROjRwcVISnfzAjv4AzF7G9
         epXrXSkJk5G24TRPCs04h4gzqVZAfJW7C5mFBu/LFGI1qjHeVvJmV8us0IM31tpXf3oq
         3vpZtmU/hjaTtHCqFSWySTXkJYyjCt/+UfS2MNSgsXjP1sczhIhX7yMB6ZZFvTcR1Wcf
         j8eA==
X-Forwarded-Encrypted: i=1; AKwUvByGNz1MgHq6o5YZxeydaMFwtbwLU5LHDEK7zGdQ1ryHvwRR1So3DQ3GuJNbJtip0in2Y6U2U2Xuxx0tDo5y/bfP@lists.infradead.org
X-Gm-Message-State: AFuF++n9raEHDkOcEEOTOpqt8fEViJMMygKwZyNDo03QoKD0slKEBBLs
	tZTjO6twBCZJs8OzSW961sidHinU6aoUePaL+BsQB4uyluDNz9oIne4S
X-Gm-Gg: AYBFou17br0rrQO1f37US7Rc65GJMxsrlRDa54JsD43ERhqxo+dbOczRsrJ5PUbr4g0
	2TtkRsUZAL109LrUNFT2VmEkO4bGib9yg8xLpa/srRW+EoElM2PwZo7ZjsCmRNqax86wUjjjX1u
	BZ9jLbBEa3z+7AIqHEfX9AnpCYBbK7nF2XuDNr4jjnFmqV5WRkB0FVbBMekgutEO5LrJFTGMfbr
	q2Al2wtJLML1/IBYbeMD5Yu1GA545mkUbHyECXeacMOJJDuOsEYcvWnf6GKLV7V98LL6rx+0Tmr
	I6E18h1mzFZBbfdyUD6ihSeNYGRDkB5zSHDAJehZflsC20Vt5JO2KQksQ4rDX3uhLFk5XNoTNug
	VnC4LbiZHtsp9IhRENMBDwJYe97X9P2j745G6q5+dlUAm9bQx2MyA2dh0EmNPQ8h3AeYgjI8hPz
	kJ6CddslmmEeKelKAi/tGjHDgRemGLudPQCjvzvpM58AsXfTlnkZoVoVxLI9151enf
X-Received: by 2002:a17:90b:51c8:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39d9bbc802bmr22552630a91.3.1789311411298;
        Sun, 13 Sep 2026 07:56:51 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:50 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:26 +0800
Message-ID: <20260913145527.18148-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075652_277860_19AF453A 
X-CRM114-Status: GOOD (  28.38  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM
controller. THS1 does have 4 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu
ths1_3 - npu

The user manual for the T527 processor describes 4 sensors, whereas
the one for the A523 describes only 3. As additional information, the BSP
driver was used, in which the value SUN55IW3_CAL_COM(5000) is used as
the calibration value in the formula; in the mainline driver it is
treated as the ft_deviation value. Also, in the BSP driver the NPU sensor
is used for both the GPU and the NPU — its actual purpose is unclear;
both sensors are functional and show temperature changes depending on
load.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 147 ++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 360654880..4a81486f8 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -59,6 +59,12 @@
 #define SUN50I_H6_THS_PC_TEMP_PERIOD(x)		((GENMASK(19, 0) & (x)) << 12)
 #define SUN50I_H6_THS_DATA_IRQ_STS(x)		BIT(x)
 
+#define SUN55I_A523_DELIMITER			0x7c8
+#define SUN55I_A523_OFFSET_BELOW		2736
+#define SUN55I_A523_OFFSET_ABOVE		2825
+#define SUN55I_A523_SCALE_BELOW			74
+#define SUN55I_A523_SCALE_ABOVE			65
+
 struct tsensor {
 	struct ths_device		*tmdev;
 	struct thermal_zone_device	*tzd;
@@ -114,6 +120,21 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
 		return -1590 * reg / 10 + 276000;
 }
 
+/*
+ * The constant names were chosen in accordance with the BSP driver;
+ * they indicate whether the value corresponds to a high or low
+ * temperature (relative to a value of ~55 °C), rather than the reg value
+ * that was read.
+ */
+static int sun55i_a523_calc_temp(struct ths_device *tmdev,
+				 int id, int reg)
+{
+	if (reg >= SUN55I_A523_DELIMITER)
+		return SUN55I_A523_SCALE_BELOW * (SUN55I_A523_OFFSET_BELOW - reg);
+	else
+		return SUN55I_A523_SCALE_ABOVE * (SUN55I_A523_OFFSET_ABOVE - reg);
+}
+
 static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct tsensor *s = thermal_zone_device_priv(tz);
@@ -298,6 +319,105 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 	return 0;
 }
 
+/*
+ * The A523 calibration data is stored in the eFuse, split across two
+ * nvmem cells. THS1 has four sensors, including ths1_3 which is used
+ * for the NPU, each with its own calibration value. The fields are
+ * packed as shown in the layouts below.
+ *
+ * efuse layout 0x38-0x3F (caldata[0..3]):
+ *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
+ * 0               16      24      32  36          48          60 64
+ * +---------------+---------------+---------------+---------------+
+ * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
+ * +---------------+---------------+---------------+---------------+
+ *
+ * efuse layout 0x44-0x4B (caldata[4..7]):
+ *     caldata[4]      caldata[5]      caldata[6]      caldata[7]
+ * 0           12  16      24      32  36          48             64
+ * +---------------+---------------+---------------+---------------+
+ * |  ths1_2   |  ths1_3   |    ths0   |           |               +
+ * +---------------+---------------+---------------+---------------+
+ */
+static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
+				     u16 *caldata, int callen)
+{
+	struct device *dev = tmdev->dev;
+	int i, ft_temp;
+
+	if (!caldata[1])
+		return -EINVAL;
+
+	ft_temp = (((caldata[2] << 8) | (caldata[1] >> 8)) & FT_TEMP_MASK) * 100;
+
+	for (i = 0; i < tmdev->chip->sensor_num; i++) {
+		int sensor_reg, sensor_temp, cdata, offset;
+		/*
+		 * Chips ths0 and ths1 have common parameters for value
+		 * calibration. To separate them we can use the number of
+		 * temperature sensors on each chip.
+		 * For ths0 this value is 1.
+		 */
+		if (tmdev->chip->sensor_num == 1) {
+			sensor_reg = ((caldata[5] >> 8) |
+				      (caldata[6] << 8)) & TEMP_CALIB_MASK;
+		} else {
+			switch (i) {
+			case 0:
+				sensor_reg = (caldata[2] >> 4) & TEMP_CALIB_MASK;
+				break;
+			case 1:
+				sensor_reg = caldata[3] & TEMP_CALIB_MASK;
+				break;
+			case 2:
+				sensor_reg = caldata[4] & TEMP_CALIB_MASK;
+				break;
+			case 3:
+				sensor_reg = ((caldata[4] >> 12) |
+					      (caldata[5] << 4)) & TEMP_CALIB_MASK;
+				break;
+			default:
+				sensor_reg = 0;
+				break;
+			}
+		}
+
+		sensor_temp = tmdev->chip->calc_temp(tmdev, i, sensor_reg);
+
+		/*
+		 * Calibration data is CALIBRATE_DEFAULT - (calculated
+		 * temperature from sensor reading at factory temperature
+		 * minus actual factory temperature) * X (scale from
+		 * temperature to register values).
+		 *
+		 * The BSP's SUN55IW3_CAL_COM(5000) is applied as ft_deviation
+		 * in sun8i_ths_get_temp(), after calc_temp(), and therefore
+		 * intentionally not repeated here.
+		 */
+		cdata = CALIBRATE_DEFAULT -
+			((sensor_temp - ft_temp) / SUN55I_A523_SCALE_BELOW);
+
+		if (cdata & ~TEMP_CALIB_MASK) {
+			/*
+			 * Calibration value more than 12-bit, but calibration
+			 * register is 12-bit. In this case, ths hardware can
+			 * still work without calibration, although the data
+			 * won't be so accurate.
+			 */
+			dev_warn(dev, "sensor%d is not calibrated.\n", i);
+			continue;
+		}
+
+		offset = (i % 2) * 16;
+		regmap_update_bits(tmdev->regmap,
+				   SUN50I_H6_THS_TEMP_CALIB + (i / 2 * 4),
+				   TEMP_CALIB_MASK << offset,
+				   cdata << offset);
+	}
+
+	return 0;
+}
+
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
 	struct nvmem_cell *calcell = NULL;
@@ -719,6 +839,31 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+/* The A523 has a shared reset line for both chips */
+static const struct ths_thermal_chip sun55i_a523_ths0 = {
+	.sensor_num = 1,
+	.has_bus_clk_reset = true,
+	.has_mod_clk = true,
+	.ft_deviation = 5000,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun55i_a523_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun55i_a523_calc_temp,
+};
+
+static const struct ths_thermal_chip sun55i_a523_ths1 = {
+	.sensor_num = 4,
+	.has_bus_clk_reset = true,
+	.has_mod_clk = true,
+	.ft_deviation = 5000,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun55i_a523_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun55i_a523_calc_temp,
+};
+
 static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
@@ -729,6 +874,8 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
+	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
+	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.55.0


