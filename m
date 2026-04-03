Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37221E85373
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhZwuIVjB4J+X/P3h/NptU2O5Fjzj5PnlbmODE1JC1Q=; b=hteA4eg4syaGr9Q3dG1THB8yBS
	NNf6CaEhj9BgTk3+M0vJJOS3bwexgnBApEKkBe1GWUKPiK4jpUB2+TAZIQwD7/b1n0wnxZIxHx+4q
	llaMuxKo9nEYtqvORSSD3SKhFy1xDca3DkcH0CHBpn4buQ0Y/8HabiXl2PoKoS3IEXWXEmU9QQuse
	rgXSsihozULF06WWTTkFj+0zUPntR4mFmWOpRpWf9mJ8vAPltlU17fU4l2iF9+229X4uyzrhdOSAg
	UV3O92wI6qM1FygICbwWUColBKxTtXPUIjhUgRe29B89g6Sjr5ksEbA+enQ4+ybmBiWaVa0b5scy6
	pB3YAPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fWE-000000028qp-3LaA;
	Fri, 03 Apr 2026 14:29:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fW9-000000028na-1iro
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:29:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486b9675d36so17068875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775226540; x=1775831340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhZwuIVjB4J+X/P3h/NptU2O5Fjzj5PnlbmODE1JC1Q=;
        b=UjGERyzmBI5IICGLFow88Qv0VnVocuUn14DYfkdxltE5IIJEN+cl28Mcv17tIQoVBu
         rIAnIP7S66NsB6JclAKQMG9A2mkzzHcp8NCv08g6T+cqQb0m3dGn4Km8ngk3i7FQ5OpF
         xrORTlsoEzihptEiNCNapurXQZ+OWUKDyvZ1kxi8wgL25CWKifVwqIUUQSQEmVsXVC40
         D2w15LxXeW2o8KO7IkK/eaylVJvuOaaxo4HKXYnBLc4ULfdxax9vYHktfpfe2zd8BmAg
         IUXSgonCWwo8baSeQsSVVXizpyljqeiMmDA5X4Ryij1oiV1hdAw3seLFHj9UBvtapTcC
         iguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226540; x=1775831340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhZwuIVjB4J+X/P3h/NptU2O5Fjzj5PnlbmODE1JC1Q=;
        b=Q27+TJDZbmvxIR6j59cWoUNycGEhfjr/gy2iHMMKdp6SSmjT6mCkkSKYCweUyQyHQE
         Afax1PZ7NuUAaRnXQcH9UvGQmQ/zY4i/J2dkhe7E0Kgn+l0+Mf9d7pLBSF2/MxfzdLrj
         IbxlyJXcZ8rAl/7nC0HwiRBnCD9W2NrrCWKBE3gvHpMG94UxG6d1lvhyZdwAZcetjne4
         RdNYVXQOndbKvFzJpKRQ2NLKTqJ8VkeuZH7pAdxOXDmfKU2lJ8+3sEEETO1RQmHjmX7z
         4obqXBtJJEdGzcm5AIxYAjzRln/5G+7fHloj6aMwD+pDMLzmMWvUSibf4vQOSK95wnCo
         Y5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUW5IrIxjAzyslqr/VeSOnEIqZyOGytubJdLDsl3oOePpkCzNcV982LYiDRuBkDiTdEhFTYbwQVbgHZFJ1jrU1@lists.infradead.org
X-Gm-Message-State: AOJu0YyxxU3XnvCixlKyROhDYj5PHtJASbBhj84YUeoG5gc9EhZeJJ+r
	FWdjjBWajPcpEqnihxQYxd3l/D0dXpHzkoCfGXdBj1Sf0/6J2PukHsFYwlDURqWJTA8=
X-Gm-Gg: ATEYQzwbTuXmKiX3ITjft54YZQRhrbLdUmgSdv6mxuZe6iby5o1nbj3DjmFq5q2Bemw
	Q08KLN6brwm19R4xRxCj/ZTsqKb1FrHVswU7IlCSd46U7HXbMlBJQZAaa0a+9sKeNS5UqfcnBGK
	fYbD+mWFpSX4iJGzgQCchQpJDcS59LndgkbEmYGYlC1r7hswKlf+Z78grl8LKadmUogzcipUkw4
	w/80LpSPY/VF/NiDQV+041cH98YC/8VWaP9jCP32izePOLSXjpINHyUe+LhPgXEdVlz7koolnVd
	x73yL4/lC5xktVpQT09kIOv/aIrBKf8jkYomjCZ6oYrb9yZTHsk1nb85am2J1OTzJYgHYz7MlDL
	vRiQ+9Sf2CsI9TZ5kp5NxvD//bKP/1Lcb+jqGPVmIhoeHsaZf/lVTEepkf7VXx0l7zaV9qm3Ryp
	KqCweD2NieZDQ/rI4Ru0ZHB4IMv54HegTBPQhyu6Jft7ZvP0yujkdVL3bTv6BVt5Icih36+0loc
	n8di/k=
X-Received: by 2002:a05:600c:4e86:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-488997c9b69mr47679745e9.29.1775226539544;
        Fri, 03 Apr 2026 07:28:59 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm141359835e9.5.2026.04.03.07.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:28:59 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Date: Fri,  3 Apr 2026 16:31:55 +0200
Message-ID: <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775223441.git.andrea.porta@suse.com>
References: <cover.1775223441.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_072901_502701_2C003A43 
X-CRM114-Status: GOOD (  25.95  )
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

From: Naushir Patuck <naush@raspberrypi.com>

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

Add the supporting driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/Kconfig   |  10 ++
 drivers/pwm/Makefile  |   1 +
 drivers/pwm/pwm-rp1.c | 244 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/pwm/pwm-rp1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 6f3147518376a..22e4fc6385da2 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -625,6 +625,16 @@ config PWM_ROCKCHIP
 	  Generic PWM framework driver for the PWM controller found on
 	  Rockchip SoCs.
 
+config PWM_RP1
+	tristate "RP1 PWM support"
+	depends on MISC_RP1 || COMPILE_TEST
+	depends on HWMON
+	help
+	  PWM framework driver for Raspberry Pi RP1 controller
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-rp1.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 0dc0d2b69025d..895a7c42fe9c0 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
 obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
+obj-$(CONFIG_PWM_RP1)		+= pwm-rp1.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
new file mode 100644
index 0000000000000..0a1c1c1dd27e9
--- /dev/null
+++ b/drivers/pwm/pwm-rp1.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pwm-rp1.c
+ *
+ * Raspberry Pi RP1 PWM.
+ *
+ * Copyright © 2026 Raspberry Pi Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ * Based on the pwm-bcm2835 driver by:
+ * Bart Tanghe <bart.tanghe@thomasmore.be>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+
+#define PWM_GLOBAL_CTRL		0x000
+#define PWM_CHANNEL_CTRL(x)	(0x014 + ((x) * 0x10))
+#define PWM_RANGE(x)		(0x018 + ((x) * 0x10))
+#define PWM_PHASE(x)		(0x01C + ((x) * 0x10))
+#define PWM_DUTY(x)		(0x020 + ((x) * 0x10))
+
+/* 8:FIFO_POP_MASK + 0:Trailing edge M/S modulation */
+#define PWM_CHANNEL_DEFAULT	(BIT(8) + BIT(0))
+#define PWM_CHANNEL_ENABLE(x)	BIT(x)
+#define PWM_POLARITY		BIT(3)
+#define SET_UPDATE		BIT(31)
+#define PWM_MODE_MASK		GENMASK(1, 0)
+
+#define NUM_PWMS		4
+
+struct rp1_pwm {
+	void __iomem	*base;
+	struct clk	*clk;
+};
+
+static const struct hwmon_channel_info * const rp1_fan_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	NULL
+};
+
+static umode_t rp1_fan_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	umode_t mode = 0;
+
+	if (type == hwmon_fan && attr == hwmon_fan_input)
+		mode = 0444;
+
+	return mode;
+}
+
+static int rp1_fan_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
+
+	if (type != hwmon_fan || attr != hwmon_fan_input)
+		return -EOPNOTSUPP;
+
+	*val = readl(rp1->base + PWM_PHASE(2));
+
+	return 0;
+}
+
+static const struct hwmon_ops rp1_fan_hwmon_ops = {
+	.is_visible = rp1_fan_hwmon_is_visible,
+	.read = rp1_fan_hwmon_read,
+};
+
+static const struct hwmon_chip_info rp1_fan_hwmon_chip_info = {
+	.ops = &rp1_fan_hwmon_ops,
+	.info = rp1_fan_hwmon_info,
+};
+
+static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value;
+
+	value = readl(rp1->base + PWM_GLOBAL_CTRL);
+	value |= SET_UPDATE;
+	writel(value, rp1->base + PWM_GLOBAL_CTRL);
+}
+
+static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	writel(PWM_CHANNEL_DEFAULT, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
+	return 0;
+}
+
+static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value;
+
+	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
+	value &= ~PWM_MODE_MASK;
+	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
+
+	rp1_pwm_apply_config(chip, pwm);
+}
+
+static int rp1_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			 const struct pwm_state *state)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	unsigned long clk_rate = clk_get_rate(rp1->clk);
+	unsigned long clk_period;
+	u32 value;
+
+	if (!clk_rate) {
+		dev_err(&chip->dev, "failed to get clock rate\n");
+		return -EINVAL;
+	}
+
+	/* set period and duty cycle */
+	clk_period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, clk_rate);
+
+	writel(DIV_ROUND_CLOSEST(state->duty_cycle, clk_period),
+	       rp1->base + PWM_DUTY(pwm->hwpwm));
+
+	writel(DIV_ROUND_CLOSEST(state->period, clk_period),
+	       rp1->base + PWM_RANGE(pwm->hwpwm));
+
+	/* set polarity */
+	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		value &= ~PWM_POLARITY;
+	else
+		value |= PWM_POLARITY;
+	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
+
+	/* enable/disable */
+	value = readl(rp1->base + PWM_GLOBAL_CTRL);
+	if (state->enabled)
+		value |= PWM_CHANNEL_ENABLE(pwm->hwpwm);
+	else
+		value &= ~PWM_CHANNEL_ENABLE(pwm->hwpwm);
+	writel(value, rp1->base + PWM_GLOBAL_CTRL);
+
+	rp1_pwm_apply_config(chip, pwm);
+
+	return 0;
+}
+
+static const struct pwm_ops rp1_pwm_ops = {
+	.request = rp1_pwm_request,
+	.free = rp1_pwm_free,
+	.apply = rp1_pwm_apply,
+};
+
+static int rp1_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *hwmon_dev;
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, NUM_PWMS, sizeof(*rp1));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	rp1 = pwmchip_get_drvdata(chip);
+
+	rp1->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rp1->base))
+		return PTR_ERR(rp1->base);
+
+	rp1->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(rp1->clk))
+		return dev_err_probe(dev, PTR_ERR(rp1->clk), "clock not found\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "fail to get exclusive rate\n");
+
+	chip->ops = &rp1_pwm_ops;
+
+	platform_set_drvdata(pdev, chip);
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "rp1_fan_tach", rp1,
+							 &rp1_fan_hwmon_chip_info,
+							 NULL);
+
+	if (IS_ERR(hwmon_dev))
+		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
+				     "failed to register hwmon fan device\n");
+
+	return 0;
+}
+
+static int rp1_pwm_suspend(struct device *dev)
+{
+	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(rp1->clk);
+
+	return 0;
+}
+
+static int rp1_pwm_resume(struct device *dev)
+{
+	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(rp1->clk);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
+
+static const struct of_device_id rp1_pwm_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-pwm" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
+
+static struct platform_driver rp1_pwm_driver = {
+	.probe = rp1_pwm_probe,
+	.driver = {
+		.name = "rp1-pwm",
+		.of_match_table = rp1_pwm_of_match,
+		.pm = pm_ptr(&rp1_pwm_pm_ops),
+	},
+};
+module_platform_driver(rp1_pwm_driver);
+
+MODULE_DESCRIPTION("RP1 PWM driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.3


