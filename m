Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44047CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kx/NaHtDqW/DqxLCYs2+7QWMT+PtyYPSsJHTFDdyCUA=; b=2DdITQQYuaTmMuaR8lvocOfTMW
	cxfZQ0BhWV9lRzu/OAYRKSnZ981+txix5VLIISiCPVqqj1ThNU1KIkNfq2Y9tUM7Qtwj3PgrGpQ8b
	3RU2OgWcS1CGFYjWmnXi+Tvql0xn/eOclB/gC01QF8UZOlFJXB58R/1OmvBi9Ep6IMnqrVoEHS/np
	fm2x28BHmoItxnYU9Rtz6gMKN2+MgVmw563hPsNTmPOtZH6D4O91Ir1xd1jbkmkcKB/JKxHBV+aD5
	G1coycmLDpiKm8OYVEmq6fJmOmIhi9IQ8DbQXefgD32uo8idNlIMckThCcVS8TOnk33nlF88ZlSR+
	pN4nvyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc5C-0000000Cst6-16FP;
	Tue, 13 Oct 2026 12:58:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4o-0000000CskE-1F6m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:57:57 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2e36c3478aso380143766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896272; x=1792501072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx/NaHtDqW/DqxLCYs2+7QWMT+PtyYPSsJHTFDdyCUA=;
        b=FPw/XCZ1kZtnbIaOd06y+JueVJAzFuv1PlZ74pd7Ta/VFAEq5JM0MEFQzjEEyzrkz1
         0SKRdeJCY1iPQ4aj0AFin3yqVBuXlbN0EK4z0+fUYdnxDMfaffVcTuIgwjLBmtK6Bavh
         OH5YYoXPaNw5oqYB4K8fUQJfrlirqv0OuLxbQK6qntuXmt3g1T06wO70LPmiLftNUOcs
         vMqrFiwkQgiQ0EglE0CO5qdR6OiPbZ98lAvb0Sqp2UBsVNHDqBEx9QWbICtOOxOXKX/L
         UYquIexW682BkRLd4uI0tF/9N6K+QIsQH8Qm6xcHeqJ4NJazaFeSIFmGN/tmWJ2ZlbuQ
         80pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896272; x=1792501072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kx/NaHtDqW/DqxLCYs2+7QWMT+PtyYPSsJHTFDdyCUA=;
        b=pKjy+jPUf4jd9R8u1uHUy4dHVWNvQtMDOl22/QgA0CoDuO9nHy+oxxW17eLRH2A1+3
         UUE8zhN52YOyUSR5QW+FHFstS5TYwEM6PbyB41wUyviQH+oIni3SyAspfLWL/hjzyAWL
         e36itzUTWjr8QjQXiKye0fGKTPfF7X6k3p98qNyfItOpZ8k7c3nLgy3pc4a8RVQXK17s
         UmTjCI0AF0o9us5NenErkpwE4VXMVCop+p5XBMFce87Y133pTsChym6wElh5RWEJZKGi
         gQRprqcWlJkqMKqia+yqmxTTLKDsOLOkJdZDC4Eugfo5qZjUNUjhlI27A3cnL2Mso5ZD
         zxEw==
X-Forwarded-Encrypted: i=1; AKwUvBzlXCt05fQGtpPlFJsIRsbOq8ocNmMnBfK8EYZI1uJ9gjeCOTHsVsExJczZmwWvRrdMF84sxh2/1BPC8ws0g8dM@lists.infradead.org
X-Gm-Message-State: AFq9FYJP3WMvVDh5mr3+kYlheSgE/BQ906XofKstnKo8i6gvdhhhEWmC
	PvG9zL+U5nJlzXI5S6lT5EIuZ9TZmOB/mQSrLcf5jEpjgDzjQLc9Fo0niFkDFISC6C0=
X-Gm-Gg: AYBFou3M27N/PZtgEnoPx2TCDhOVKCMjKynjvRKmstQuiihzGm4AzFhewpyenIwW67m
	5238O5xoYAwObaKxGJnzG6oJ8RZw/gE1RznnDhE4RcFDMhj0kjc03V2WJykcgVTWSprK2Q15k6J
	bC2GwD0SYVUGicnYxMizkuwFMs1LvGDTc8TXOxnUuMzNispXmkp96GZPIhvPWZR0ZsLB3Huj3Ft
	lBOeefdvR/DethoxbB/2ampr5TKtFA0oUxZli02pqDd4p6DCfbaAJ8FdglpisVIVI8mHU+uEpMf
	Qjq1tquf34K/Y6sFT53WflRI5ALfXKMwBIp5UkAuhMNoHCu1fLEN1FeW5yGBPJANEpkgQyrO+ow
	xpGms+deoyz/2FXW4JWSgHtOWRKFVnW2+TO7IuPkGpq/Qd2T4O3EtqqkRlhCwSDEoeHcgXrWgSl
	dCtADvdx7tgwhT/DWzf6qWmDU7CgvatmZ6UkuOqdi1683j9rpxl9U2aKZOvrvmAx2mVOqiVdNs+
	rlGElia8NM95EGxmQtJtx9MgknU+rcn4f+wEQF4TvKMli13wYiQLla1YtwHFtVagfBNBvpqd12G
	oN8IegNUIdX6kR+IffZxXknc7olUacSH7+N22Flt8w==
X-Received: by 2002:a17:907:c78b:b0:c37:c0dd:6642 with SMTP id a640c23a62f3a-c37c0dd6c88mr39677766b.37.1791896272427;
        Tue, 13 Oct 2026 05:57:52 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:51 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/6] hwmon: sparx5: add LAN969x PWM support
Date: Tue, 13 Oct 2026 14:56:28 +0200
Message-ID: <20261013125735.1542349-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055755_956530_64EE406D 
X-CRM114-Status: GOOD (  25.34  )
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

The LAN969x fan controller provides an 8-bit PWM output with a
programmable frequency and polarity.

Expose pwm1 and pwm1_freq, and serialize fan controller register access.
Parse the fan child node's standard PWM specifier and use its period and
polarity flags to configure the hardware.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/sparx5-temp.rst |   9 ++
 drivers/hwmon/Kconfig               |   2 +-
 drivers/hwmon/sparx5-temp.c         | 183 ++++++++++++++++++++++++++--
 3 files changed, 184 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index 1256d37e1c091..a1f8218e68794 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -34,8 +34,17 @@ The following attributes are supported.
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
 fan1_input              Fan speed in RPM (LAN969x only).
+pwm1                    PWM duty cycle, from 0 to 255 (LAN969x only).
+pwm1_freq               PWM frequency in Hz (LAN969x only).
 ======================= ========================================================
 
 The tachometer counts pulses over one-second intervals, independently of the
 PWM output. The fan child's pulses-per-revolution property specifies how many
 pulses represent one revolution; it defaults to two.
+
+On LAN969x, the fan child's pwms property selects the initial PWM period and
+polarity. The output is dedicated to this fan and is not available to external
+PWM consumers. The pwm1 value describes the logical duty cycle independently
+of the output polarity. Frequency requests are rounded to the nearest
+hardware divider value; requests outside the divider range are rejected.
+pwm1_freq reports the resulting frequency.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 01ac166380905..e0cd6195d5b45 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -653,7 +653,7 @@ config SENSORS_SPARX5
 	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  If you say yes here you get support for temperature monitoring on
-	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
+	  Microchip Sparx5 and LAN969x SoCs, as well as the fan controller on
 	  LAN969x SoCs.
 
 	  This driver can also be built as a module. If so, the module
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 922c3c33a049a..5130140e1b579 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -11,10 +11,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
+#include <dt-bindings/pwm/pwm.h>
+
 #define TEMP_CTRL		0
 #define TEMP_CFG		4
 #define  TEMP_CFG_CYCLES	GENMASK(24, 15)
@@ -24,14 +27,18 @@
 #define  TEMP_STAT_TEMP		GENMASK(11, 0)
 
 #define FAN_CFG			0
+#define  FAN_CFG_DUTY_CYCLE	GENMASK(23, 16)
+#define  FAN_CFG_INV_POL	BIT(3)
 #define  FAN_CFG_GATE_ENA	BIT(2)
 #define  FAN_CFG_STAT_MODE	BIT(0)
 #define FAN_PWM_FREQ		4
 #define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define  FAN_PWM_FREQ_DIV	GENMASK(15, 0)
 #define FAN_CNT			8
 #define  FAN_CNT_DATA		GENMASK(15, 0)
 
 #define FAN_TACH_INTERVAL_HZ	100000
+#define FAN_PWM_FREQ_SCALE	256
 
 struct s5_match_data {
 	bool has_fan;
@@ -41,8 +48,11 @@ struct s5_hwmon {
 	void __iomem *base;
 	void __iomem *fan;
 	struct clk *clk;
+	struct mutex lock; /* protects fan controller state and registers */
 	unsigned long clk_rate;
 	u32 pulses_per_revolution;
+	u32 pwm_frequency;
+	bool pwm_inverted;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -71,7 +81,9 @@ static void s5_fan_enable(struct s5_hwmon *hwmon)
 
 	/* Count all tachometer pulses over one-second intervals. */
 	val = readl(hwmon->fan + FAN_CFG);
-	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA | FAN_CFG_INV_POL);
+	if (hwmon->pwm_inverted)
+		val |= FAN_CFG_INV_POL;
 	writel(val, hwmon->fan + FAN_CFG);
 }
 
@@ -111,6 +123,34 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static int s5_read_pwm(struct s5_hwmon *hwmon, long *val)
+{
+	u32 data;
+
+	mutex_lock(&hwmon->lock);
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	mutex_unlock(&hwmon->lock);
+	*val = FIELD_GET(FAN_CFG_DUTY_CYCLE, data);
+
+	return 0;
+}
+
+static int s5_read_pwm_freq(struct s5_hwmon *hwmon, long *val)
+{
+	unsigned long rate;
+	u32 divider;
+
+	divider = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
+	divider = FIELD_GET(FAN_PWM_FREQ_DIV, divider);
+	if (!divider)
+		return -ENODATA;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	*val = DIV_ROUND_CLOSEST(rate, divider);
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		   u32 attr, int channel, long *val)
 {
@@ -125,6 +165,18 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_fan_input && hwmon->fan)
 			return s5_read_fan(hwmon, val);
 		break;
+	case hwmon_pwm:
+		if (!hwmon->fan)
+			break;
+		switch (attr) {
+		case hwmon_pwm_input:
+			return s5_read_pwm(hwmon, val);
+		case hwmon_pwm_freq:
+			return s5_read_pwm_freq(hwmon, val);
+		default:
+			break;
+		}
+		break;
 	default:
 		break;
 	}
@@ -132,6 +184,69 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
+	u32 data;
+
+	if (val < 0 || val > 255)
+		return -EINVAL;
+
+	mutex_lock(&hwmon->lock);
+
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
+	writel_relaxed(data, hwmon->fan + FAN_CFG);
+
+	mutex_unlock(&hwmon->lock);
+
+	return 0;
+}
+
+static int s5_write_pwm_freq(struct s5_hwmon *hwmon, long val)
+{
+	unsigned long rate, divider;
+	u32 data;
+
+	if (val <= 0)
+		return -EINVAL;
+
+	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
+	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
+	    val > rate)
+		return -ERANGE;
+
+	divider = DIV_ROUND_CLOSEST(rate, val);
+	divider = min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
+
+	mutex_lock(&hwmon->lock);
+	data = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
+	data &= ~FAN_PWM_FREQ_DIV;
+	data |= FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
+	writel_relaxed(data, hwmon->fan + FAN_PWM_FREQ);
+	mutex_unlock(&hwmon->lock);
+
+	return 0;
+}
+
+static int s5_write(struct device *dev, enum hwmon_sensor_types type,
+		    u32 attr, int channel, long val)
+{
+	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
+
+	if (type != hwmon_pwm || !hwmon->fan)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return s5_write_pwm(hwmon, val);
+	case hwmon_pwm_freq:
+		return s5_write_pwm_freq(hwmon, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 			     u32 attr, int channel)
 {
@@ -144,6 +259,12 @@ static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 		if (hwmon->fan && attr == hwmon_fan_input)
 			return 0444;
 		return 0;
+	case hwmon_pwm:
+		if (!hwmon->fan)
+			return 0;
+		if (attr == hwmon_pwm_input || attr == hwmon_pwm_freq)
+			return 0644;
+		return 0;
 	default:
 		return 0;
 	}
@@ -153,12 +274,14 @@ static const struct hwmon_channel_info * const s5_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_FREQ),
 	NULL
 };
 
 static const struct hwmon_ops s5_hwmon_ops = {
 	.is_visible = s5_is_visible,
 	.read = s5_read,
+	.write = s5_write,
 };
 
 static const struct hwmon_chip_info s5_chip_info = {
@@ -166,6 +289,40 @@ static const struct hwmon_chip_info s5_chip_info = {
 	.info = s5_info,
 };
 
+static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
+			   struct s5_hwmon *hwmon)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0,
+					 &args);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse fan PWM\n");
+
+	if (args.np != dev->of_node || args.args_count != 2 || !args.args[0] ||
+	    args.args[1] & ~PWM_POLARITY_INVERTED) {
+		of_node_put(args.np);
+		return dev_err_probe(dev, -EINVAL, "invalid fan PWM specifier\n");
+	}
+
+	hwmon->pwm_frequency = DIV_ROUND_CLOSEST(NSEC_PER_SEC, args.args[0]);
+	hwmon->pwm_inverted = args.args[1] & PWM_POLARITY_INVERTED;
+	of_node_put(args.np);
+
+	if (!hwmon->pwm_frequency)
+		return dev_err_probe(dev, -EINVAL, "fan PWM period is too long\n");
+
+	of_property_read_u32(fan_np, "pulses-per-revolution",
+			     &hwmon->pulses_per_revolution);
+	if (!hwmon->pulses_per_revolution ||
+	    hwmon->pulses_per_revolution > 4)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid pulses-per-revolution\n");
+
+	return 0;
+}
+
 static int s5_temp_probe(struct platform_device *pdev)
 {
 	const struct s5_match_data *match_data;
@@ -173,12 +330,14 @@ static int s5_temp_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
 	struct device_node *fan_np __free(device_node) = NULL;
+	int ret;
 
 	match_data = device_get_match_data(dev);
 
 	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
+	mutex_init(&hwmon->lock);
 
 	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hwmon->base))
@@ -191,13 +350,11 @@ static int s5_temp_probe(struct platform_device *pdev)
 
 		hwmon->pulses_per_revolution = 2;
 		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
-		if (fan_np)
-			of_property_read_u32(fan_np, "pulses-per-revolution",
-					     &hwmon->pulses_per_revolution);
-		if (!hwmon->pulses_per_revolution ||
-		    hwmon->pulses_per_revolution > 4)
-			return dev_err_probe(dev, -EINVAL,
-					     "invalid pulses-per-revolution\n");
+		if (fan_np) {
+			ret = s5_get_fan_data(dev, fan_np, hwmon);
+			if (ret)
+				return ret;
+		}
 	}
 
 	hwmon->clk = devm_clk_get_enabled(dev, NULL);
@@ -206,9 +363,17 @@ static int s5_temp_probe(struct platform_device *pdev)
 	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
 	s5_temp_enable(hwmon);
-	if (hwmon->fan)
+	if (hwmon->fan) {
 		s5_fan_enable(hwmon);
 
+		if (hwmon->pwm_frequency) {
+			ret = s5_write_pwm_freq(hwmon, hwmon->pwm_frequency);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "invalid fan PWM period\n");
+		}
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "s5_temp",
 							 hwmon,
 							 &s5_chip_info,
-- 
2.56.0


