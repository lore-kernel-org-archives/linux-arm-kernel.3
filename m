Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E203CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G00YG7FNX3IZ3pyrtpioSmQlRthZHGJ4uJgy/p0MtDE=; b=bH/yiMO/0bYVwflxFNVMJIWlUu
	I654N4PgnVMAAREIGe38JpK/qRuaLR8S8GA+IFE9JI71J0AHFEip7R+9j9wDdwyNrNdlRBmy/HFWQ
	BmbR3OM+5Wf2VxYBZqny6urLbgJ0nIfHCZRQH5zzXrva7Z25m8xx/jnhDFt4F6/FtRnxpTjSgoRSk
	qg97vkbkTe8hf7ihr9d7bCbdvbAYEL76ERIxBys22EL3rHuffcZnFO2JbmtSR3DXMmtQ+rYr2Oex3
	rs6JodjXkhmWjoOKxOumnfW6aIq6YxaQpcburnxNvYzNq6bY46boolSbEoswnNJpi5opBXXZAvnn6
	HvhH8omA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc5C-0000000CssY-0B2v;
	Tue, 13 Oct 2026 12:58:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4n-0000000Csk7-0fWI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:57:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so3297027a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896271; x=1792501071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G00YG7FNX3IZ3pyrtpioSmQlRthZHGJ4uJgy/p0MtDE=;
        b=flRrpApWaIhdmGmw3XYA67r7V5Ljr7gdIZHPMZYbr2O18b/yW6t87DurKLS67D1dP3
         QHEgug1SWp2qP2Bu9Pk4iSA8fNmZE94nCgAd/qNsk4CLaGO0Kau2tgeAHVKYracABec8
         GFuNTBuRMZIzfV1ShnhIg0BPpCxgaUNQNZxTPTqSHwXusoW4pO91Cc3v2iJN+lwB2UU8
         11Vix4aQPR9qU2NFb8UG5wG4hx9A2EHcGUi4/LZbciU53qAdBvPslg1wc4XIT6jsX/Zl
         PPEiBopTKBFeIsEZsQJ0wzfgX/4/sECeqIsziz7S1XmAATL+c0z01yDg33z+djND6KjW
         v9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896271; x=1792501071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G00YG7FNX3IZ3pyrtpioSmQlRthZHGJ4uJgy/p0MtDE=;
        b=x3jJ340zBbZ+YeFpCv1M2dTk2ZRfEsktu6oMos1XAGpfqcb8WrY8QmT55EZljljQbZ
         TcegAyyRoe0zFW/eFXs09U/q7OSBeev1Fzd/eQiG6snt9SsOs6DWgKSDrazRFVg2o5x/
         C8Qma6piBFlpA0NJsG/r4hv4jbq9+Xig+Y8wUbuz20KlFTk0Z/d2bKDAAIqie8DxOwxE
         xU30nEfMuztlrPphwI/vW4gkOt1Y26O66XDF0hFvNnL5ne45ESxBXQxkzG7SaA1RMraH
         UxGoOOHJ+VDqjoFYyz5CUR1jySmbl51JD+bFbmghD3MtmkHPDB7XlaQIz+7KlB1mLj+W
         N7kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkVsEJtaH7QfD5QAf6JcL/slfl0tMN+7GFHNhG7lbkHslHoR4povv+KXxt8Njmg7RY/bXnL29P/jwnV0wliq2H@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6arXUCZOXKKOzuMVjeNXiCkXb2AXEBitJQ7l4wcb1ru8m3wH8
	4ttZEHVAl3kMIu3eSNoDobNJ4TpzR9S/oRxUrAjVdRfgaZt8jiF5mFrT7Pe3Uqbe8nU=
X-Gm-Gg: AYBFou2kJKdewlCqvCFwjELAGmnXYxEkJe6RBVcy2s5wD6HN4KN9ajmnwb5PN4H0Y7j
	kvMECD3p0HvoNnejeENwTc9BB6XG1Y6u0aFJEqP+db7RGBAvyENvoPievEgD1qChY3Vh1zYGWqi
	2TJW2fjk/TS19QNeWV5P+mrbfNfq8CsPtCFvQDVsbOPBHZCA8OfI6vmkF7XshA+3oehcadAxV5C
	82oKvuyxs14q1u/0IQRb8QFvDbVgvP7okK+Rmbpnj2AKFUNbaizHxiqrjjhkWp+jsQXw0nCmtid
	xp40KT0qTNrDzUEk0nLsqRlWGKqoF8Pj/QZaPXo4zB1XrG5Ck123OE+A6938XBNV3+Ub2PGE/o7
	Azo/mkeaCc1yH38rXBXaCyA0YxUJ/Z3Digof62NvK+Ew49WFl1fLXVMVW4Q8v6zrlijZmbPvWeR
	XVMDnEATJRUzMHdRlz/B2bL6bo0FyPHGJAp86yRfQQLxtZNyl4Zxw1P3hjSvkrOe1qLNo8RhXWT
	dU9Os+KV1v1DIJbrQK87gIzBQ4e1AM6mRR39mqzG8N1EzyEXnvbmgZnY0flCDj50GVMaymiop9z
	mlNnco130+WLeicArnRzf2/MEmGv138=
X-Received: by 2002:a17:907:3eaa:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c31aa0d82b6mr1330656966b.40.1791896271123;
        Tue, 13 Oct 2026 05:57:51 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:50 -0700 (PDT)
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
Subject: [PATCH 3/6] hwmon: sparx5: add LAN969x fan monitoring support
Date: Tue, 13 Oct 2026 14:56:27 +0200
Message-ID: <20261013125735.1542349-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055755_959127_0E44622D 
X-CRM114-Status: GOOD (  25.02  )
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

LAN969x contains a tachometer input alongside its Sparx5-compatible
temperature sensor.

Use match data to map and initialize the additional fan controller
register region only for the LAN969x hardware-monitor compatible. Read
the optional pulses-per-revolution property from the fan child and expose
the measured speed through fan1_input.

Leave existing Sparx5 and LAN969x temperature-only device trees
unchanged.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/sparx5-temp.rst |   8 +++
 drivers/hwmon/Kconfig               |   7 +-
 drivers/hwmon/sparx5-temp.c         | 108 +++++++++++++++++++++++++---
 3 files changed, 110 insertions(+), 13 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index 0140809089542..1256d37e1c091 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -15,6 +15,9 @@ Supported chips:
 
 Author: Lars Povlsen <lars.povlsen@microchip.com>
 
+The driver also supports the Microchip LAN969x temperature sensor and fan
+tachometer through the microchip,lan9691-hwmon compatible.
+
 Description
 -----------
 
@@ -30,4 +33,9 @@ The following attributes are supported.
 
 ======================= ========================================================
 temp1_input		Die temperature (in millidegree Celsius.)
+fan1_input              Fan speed in RPM (LAN969x only).
 ======================= ========================================================
+
+The tachometer counts pulses over one-second intervals, independently of the
+PWM output. The fan child's pulses-per-revolution property specifies how many
+pulses represent one revolution; it defaults to two.
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a4756..01ac166380905 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -649,11 +649,12 @@ config SENSORS_I5K_AMB
 	  will be called i5k_amb.
 
 config SENSORS_SPARX5
-	tristate "Sparx5 SoC temperature sensor"
+	tristate "Sparx5 and LAN969x SoC hardware monitoring"
 	depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
 	help
-	  If you say yes here you get support for temperature monitoring
-	  with the Microchip Sparx5 SoC.
+	  If you say yes here you get support for temperature monitoring on
+	  Microchip Sparx5 and LAN969x SoCs, as well as fan monitoring on
+	  LAN969x SoCs.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called sparx5-temp.
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 0fd5c147f8167..922c3c33a049a 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -9,8 +9,11 @@
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define TEMP_CTRL		0
 #define TEMP_CFG		4
@@ -20,9 +23,26 @@
 #define  TEMP_STAT_VALID	BIT(12)
 #define  TEMP_STAT_TEMP		GENMASK(11, 0)
 
+#define FAN_CFG			0
+#define  FAN_CFG_GATE_ENA	BIT(2)
+#define  FAN_CFG_STAT_MODE	BIT(0)
+#define FAN_PWM_FREQ		4
+#define  FAN_PWM_FREQ_CYCLES	GENMASK(27, 16)
+#define FAN_CNT			8
+#define  FAN_CNT_DATA		GENMASK(15, 0)
+
+#define FAN_TACH_INTERVAL_HZ	100000
+
+struct s5_match_data {
+	bool has_fan;
+};
+
 struct s5_hwmon {
 	void __iomem *base;
+	void __iomem *fan;
 	struct clk *clk;
+	unsigned long clk_rate;
+	u32 pulses_per_revolution;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -37,6 +57,24 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static void s5_fan_enable(struct s5_hwmon *hwmon)
+{
+	u32 cycles, val;
+
+	cycles = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_TACH_INTERVAL_HZ);
+	cycles = clamp_val(cycles, 1, FIELD_MAX(FAN_PWM_FREQ_CYCLES));
+
+	val = readl(hwmon->fan + FAN_PWM_FREQ);
+	val &= ~FAN_PWM_FREQ_CYCLES;
+	val |= FIELD_PREP(FAN_PWM_FREQ_CYCLES, cycles);
+	writel(val, hwmon->fan + FAN_PWM_FREQ);
+
+	/* Count all tachometer pulses over one-second intervals. */
+	val = readl(hwmon->fan + FAN_CFG);
+	val &= ~(FAN_CFG_STAT_MODE | FAN_CFG_GATE_ENA);
+	writel(val, hwmon->fan + FAN_CFG);
+}
+
 static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
 {
 	int value;
@@ -62,6 +100,17 @@ static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
 	return 0;
 }
 
+static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
+{
+	u32 count;
+
+	count = readl_relaxed(hwmon->fan + FAN_CNT);
+	count = FIELD_GET(FAN_CNT_DATA, count);
+	*val = count * 60 / hwmon->pulses_per_revolution;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		   u32 attr, int channel, long *val)
 {
@@ -72,6 +121,10 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 		if (attr == hwmon_temp_input)
 			return s5_read_temp(hwmon, val);
 		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_input && hwmon->fan)
+			return s5_read_fan(hwmon, val);
+		break;
 	default:
 		break;
 	}
@@ -82,12 +135,15 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 			     u32 attr, int channel)
 {
-	if (type != hwmon_temp)
-		return 0;
+	const struct s5_hwmon *hwmon = _data;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		return 0444;
+	switch (type) {
+	case hwmon_temp:
+		return attr == hwmon_temp_input ? 0444 : 0;
+	case hwmon_fan:
+		if (hwmon->fan && attr == hwmon_fan_input)
+			return 0444;
+		return 0;
 	default:
 		return 0;
 	}
@@ -96,6 +152,7 @@ static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
 static const struct hwmon_channel_info * const s5_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
 	NULL
 };
 
@@ -111,10 +168,15 @@ static const struct hwmon_chip_info s5_chip_info = {
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
+	const struct s5_match_data *match_data;
+	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
+	struct device_node *fan_np __free(device_node) = NULL;
 
-	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
+	match_data = device_get_match_data(dev);
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return -ENOMEM;
 
@@ -122,14 +184,32 @@ static int s5_temp_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon->base))
 		return PTR_ERR(hwmon->base);
 
-	hwmon->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (match_data && match_data->has_fan) {
+		hwmon->fan = devm_platform_ioremap_resource_byname(pdev, "fan");
+		if (IS_ERR(hwmon->fan))
+			return PTR_ERR(hwmon->fan);
+
+		hwmon->pulses_per_revolution = 2;
+		fan_np = of_get_available_child_by_name(dev->of_node, "fan");
+		if (fan_np)
+			of_property_read_u32(fan_np, "pulses-per-revolution",
+					     &hwmon->pulses_per_revolution);
+		if (!hwmon->pulses_per_revolution ||
+		    hwmon->pulses_per_revolution > 4)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid pulses-per-revolution\n");
+	}
+
+	hwmon->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(hwmon->clk))
 		return PTR_ERR(hwmon->clk);
+	hwmon->clk_rate = clk_get_rate(hwmon->clk);
 
 	s5_temp_enable(hwmon);
+	if (hwmon->fan)
+		s5_fan_enable(hwmon);
 
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "s5_temp",
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "s5_temp",
 							 hwmon,
 							 &s5_chip_info,
 							 NULL);
@@ -137,7 +217,15 @@ static int s5_temp_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static const struct s5_match_data lan969x_match_data = {
+	.has_fan = true,
+};
+
 static const struct of_device_id s5_temp_match[] = {
+	{
+		.compatible = "microchip,lan9691-hwmon",
+		.data = &lan969x_match_data,
+	},
 	{ .compatible = "microchip,sparx5-temp" },
 	{},
 };
@@ -154,5 +242,5 @@ static struct platform_driver s5_temp_driver = {
 module_platform_driver(s5_temp_driver);
 
 MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
-MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
+MODULE_DESCRIPTION("Sparx5 SoC hardware monitoring driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0


