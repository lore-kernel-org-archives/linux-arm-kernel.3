Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93290C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+rSfwK2IdMno7cgyqb3eYYWrYZbiRnVldmhW9L6vWA=; b=g1PHWYh922rVeDYqyaMowV3Faz
	OHO+/hCSWy5mDMy2oo2OQtqseP+mAQK1vBhZ1fz1Qyuqm7qDEbA1ZSNRHwj0gXZ00gafLb925NA1F
	IAljsT2Xx7Y9yOJ8vyu+4s6syc9Z+REjXf2ypKdnToyIVKI8MTWSCf9/8EKT5Re4WsHNnsmjRVU25
	oOwJgLBQRbTkXKaJGtcYIS4tmu6WTEEL3CqjIWOiBHIe+E4qE3nVXSi+rP5Y9cOHJnf4vRmih8SHo
	WyWNH8v4pVDkbqmVKoEWozNxsrHhY9b5BFYfuuahll/a/QlCLKc6ual3+t9g1CU5YLwOgGczydPUd
	wjjeFVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Z5-0000000CADt-22q0;
	Fri, 11 Apr 2025 00:48:15 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32RB-0000000C9HJ-3sPD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:40:07 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3061513d353so15198711fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332004; x=1744936804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+rSfwK2IdMno7cgyqb3eYYWrYZbiRnVldmhW9L6vWA=;
        b=hA++DAUUw6U3dKRrnXwQrnQLV6Mlg2M57HjsuRpZb8jlHIK7/iLr2ZM7Th1tXql3gr
         cwM3GlyhZI9xlD8OSDL8CLlY7/RipLF8PdkZc1FOtK9SnSBJ/gCOvIkXfVEun8afXLxc
         xjnIJoVawVjSon2VWv9rUJJ0FPNVAsRWXcpHYrntErXN73mPCNXgPp2272bv5TtMdiOn
         3rzbNtR/rum3yPWyPJ1E6fczOzyGU7pfMFkvvksoJclmkzR25LlSWUnsk8ljXAuWErZX
         1KYOK5JRRZdl3vAW9Evq53UB9m1rbKYKreKx1NwSiC+I4F5zVoaPsRYn2xt31JTJGJ+1
         vypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332004; x=1744936804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+rSfwK2IdMno7cgyqb3eYYWrYZbiRnVldmhW9L6vWA=;
        b=b94kp18Cvw9AqVDRZlj4PPo2ozX7M8gvus4HblZbW9Jqp0i5ELyPzDGCZlpPvP7bcj
         UtEbR9G/naFSPjPWy7s9/O9szlLdmPQadu0WLGHtAkifqO7UgiC04nssXm890SAJ1sZh
         Q3xjzRl+6qNMlaYiiXc6lYah5gqCZL+qlrwZphJQWKVlkm4k8T5RYBeDOBIiiLYHwlws
         KZLprSO3Cg/fNHNgOAD07CcljoXo5PhRBgE/47C7uRlYASBj4SVyEUIGBhYEXLpfeu1E
         hKtLF8VUkZt2ZRkbKvl5jznHIuZa7HJ6V9yCgEYylxcgJc00SIeSAphmCF24dcWEC3IJ
         Ghyg==
X-Forwarded-Encrypted: i=1; AJvYcCVjFsn/KlIOXzUvVlZnEmHS/EQaWT9ASduuTycFmz/SMepX9MBVF60WCnpg+ty84HVuN5WOmMjYGxTs361Xw7Jf@lists.infradead.org
X-Gm-Message-State: AOJu0YyVK5TKSD2Sd2G/7Px8fTpO6L/fzQ69FXiGpA7W6VLpk3BWzWet
	MyYKMgkxAud7O5EP7WxsNQeLLHGrG2ed+P5Whr9J7KjvfGfQlPUh
X-Gm-Gg: ASbGncvZzkSgi4ja96c4mfxWOQspbi8V6+5J+GDriDUFf8ZSy2uIqoKCUnhGarZGzvB
	p1JXB5xAN0QW1Arsyvea50Rplfh5MqpIYhE5dXNWQEhfsr21Vgot0togfek4NT3PJZxy6y/A9bo
	VBZyXhOdyiJcHfhd/Ph+9aS7dEPLCeipWgGIFWjbWjlYiO4evvDkhVMSJjk3BaVJsZ4f+rpzz0z
	AdNJUMHIRwpkVXz7iyo9OTuEWv1wI5Bdc+UwvmF3ztPx3XB9jFiPbAngkGTNmmTZIIKuLyTQ4Ol
	EPBJHk+GqOZobXVKSJ4vkwkBCHnFZa5QFot1AOpTcHjZmZf9Ng==
X-Google-Smtp-Source: AGHT+IEHx3pLyyA7RUjJFQMZKlcC6nirFWEfuuk3UQ55sdEchAVrUtO52D2wnKHHqYnoHtifKxO3Bg==
X-Received: by 2002:a2e:ab18:0:b0:30c:7a7:e87c with SMTP id 38308e7fff4ca-31049a9a9f5mr2279391fa.35.1744332003965;
        Thu, 10 Apr 2025 17:40:03 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:40:03 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 3/6] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Fri, 11 Apr 2025 08:38:23 +0800
Message-ID: <20250411003827.782544-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_174005_973723_86E9F1F4 
X-CRM114-Status: GOOD (  26.42  )
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
THS0 has only one temperature sensor, which is located in the DRAM.

THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

The datasheet mentions a fourth sensor in the NPU, but lacks any registers
for operation other than calibration registers. The vendor code reads the
value from ths1_2, but uses separate calibration data, so we get two
different values from real one.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 134 ++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index dc4055c9c..919b05a96 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -116,6 +116,15 @@ static int sun50i_h5_calc_temp(struct ths_device *tmdev,
 		return -1590 * reg / 10 + 276000;
 }
 
+static int sun55i_a523_calc_temp(struct ths_device *tmdev,
+					int id, int reg)
+{
+	if (reg >= 0x7c8)
+		return tmdev->chip->scale * (tmdev->chip->offset - reg);
+	else
+		return 65 * (2825 - reg);
+}
+
 static int sun8i_ths_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct tsensor *s = thermal_zone_device_priv(tz);
@@ -208,6 +217,100 @@ static irqreturn_t sun8i_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+
+/*
+ * The A523 nvmem calibration values. The ths1_3 is not used as it
+ * doesn't have its own sensor and doesn't have any internal switch.
+ * Instead, the value from the ths1_2 sensor is used, which gives the
+ * illusion of an independent sensor for NPU and GPU when using
+ * different calibration values.
+ *
+ * efuse layout 0x38-0x3F (caldata[0..3]):
+ *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
+ * 0               16      24      32  36          48          60 64
+ * +---------------+---------------+---------------+---------------+
+ * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
+ * +---------------+---------------+---------------+---------------+
+ *
+ * efuse layout 0x40-0x43 (caldata[4..5]) - not in use
+ *
+ * efuse layout 0x44-0x4B (caldata[6..9]):
+ *     caldata[6]      caldata[7]      caldata[8]      caldata[9]
+ * 0           12  16      24      32  36          48             64
+ * +---------------+---------------+---------------+---------------+
+ * |  ths1_2   |  ths1_3   |  ths0_0   |           |               +
+ * +---------------+---------------+---------------+---------------+
+ */
+static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
+				   u16 *caldata, int callen)
+{
+	struct device *dev = tmdev->dev;
+	int i, ft_temp;
+
+	if (!caldata[0])
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
+			sensor_reg = ((caldata[7] >> 8) | (caldata[8] << 8)) & TEMP_CALIB_MASK;
+		} else {
+			switch (i) {
+			case 0:
+				sensor_reg = (caldata[2] >> 4) & TEMP_CALIB_MASK;
+				break;
+			case 1:
+				sensor_reg = caldata[3] & TEMP_CALIB_MASK;
+				break;
+			case 2:
+				sensor_reg = caldata[6] & TEMP_CALIB_MASK;
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
+		 * temperature to register values)
+		 */
+		cdata = CALIBRATE_DEFAULT -
+			((sensor_temp - ft_temp) / tmdev->chip->scale);
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
 static int sun8i_h3_ths_calibrate(struct ths_device *tmdev,
 				  u16 *caldata, int callen)
 {
@@ -721,6 +824,35 @@ static const struct ths_thermal_chip sun50i_h616_ths = {
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+/* The A523 has a shared reset line for both chips */
+static const struct ths_thermal_chip sun55i_a523_ths0 = {
+	.sensor_num = 1,
+	.has_bus_clk_reset = true,
+	.has_gpadc_clk = true,
+	.ft_deviation = 5000,
+	.offset = 2736,
+	.scale = 74,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun55i_a523_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun55i_a523_calc_temp,
+};
+
+static const struct ths_thermal_chip sun55i_a523_ths1 = {
+	.sensor_num = 3,
+	.has_bus_clk_reset = true,
+	.has_gpadc_clk = true,
+	.ft_deviation = 5000,
+	.offset = 2736,
+	.scale = 74,
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
@@ -731,6 +863,8 @@ static const struct of_device_id of_ths_match[] = {
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ .compatible = "allwinner,sun20i-d1-ths", .data = &sun20i_d1_ths },
 	{ .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
+	{ .compatible = "allwinner,sun55i-a523-ths0", .data = &sun55i_a523_ths0 },
+	{ .compatible = "allwinner,sun55i-a523-ths1", .data = &sun55i_a523_ths1 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, of_ths_match);
-- 
2.49.0


