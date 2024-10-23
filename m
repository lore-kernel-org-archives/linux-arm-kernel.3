Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8F4CDDE70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C8z0kUxphmO1mbzxm0HcdfPNxxCScQxUNHOYRipLFU=; b=m/aQQpudEcVhWVi1dEq+bDGGB1
	y+QdyFbslS1QkYeRpJc4MedFw+kDiPSe/MyD3Wm0LyMG2Vu/sveQkLjt0A095N6+jCmm4gAxocmk3
	ay2BmXlwUGIBzS1pRRNeWhkN9qkQbDJeI4JX8uflLEnt3In/Tbldqn3Um2NfMmxAgC6z0uMCRvb4W
	9Kk8/O8qk25tYXgk1jQPh6EGfPVxr8w04GCdKXlRRr08//+MPOfm8zTafKurZFzeQ/Sm4AvhoHcZr
	ElfrnYVuRisttJyXj4/Ybm0wWvGHUKZQwi9QTuOUxy18athOfXV1//UIF3zhOoA4wMyk6/gH2XLlj
	EbNQJCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zqd-0000000EDFk-0TJ8;
	Wed, 23 Oct 2024 11:48:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZOs-0000000E7DM-3rbj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:19:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso5258918a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729682378; x=1730287178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C8z0kUxphmO1mbzxm0HcdfPNxxCScQxUNHOYRipLFU=;
        b=BgJ5Dk/tSg7AcVJYL7Syo+ZhW+u+EtCd+MJ6igIwKSP1N9T/Wx2+DPiFiX0kYz8xlO
         B6knuhZqZpRoj6EwoSCkUfmjGV8YEC96ZWQtX3/6lEVj3lDciYOwBqapfvfsRjFEaEAV
         NyQHY7Dr5msDXRt5Yo3DRuxjmk14kIuPIsw+jGmFrAAbu0GHFOlP4Dh2DfSewtf1exY9
         zTDYLUdyfLcsY2uqeIgsVkZkM6xKdI9vn6zhgN/c7G/v7mGxk3xrnfG6QKpmF65/Embc
         u/JYmpenJpM7FilFpD0A951dxtHyPwYY3dTaejFXOy7Zk9jnOZYh5QpzHq+Zszk7YHN8
         P2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729682378; x=1730287178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/C8z0kUxphmO1mbzxm0HcdfPNxxCScQxUNHOYRipLFU=;
        b=M+Y4wTJvEH1XVUMq91opQrPG2psvvoKL9dcm//xHizEukGBQSVtwlYWu4I1nJRRwXJ
         k5RjeyPyhV6K6IHYAJ82R1Pdyyw161eZKrWEV5sspM1sKNlpA3U6lNSce3qatZYCRRYr
         NBWKxeOCwSoSfUFPL9JX5Xx8Y7yDaM/cSG/vUBT97TOsHF0wQ1Rk+x+g6vdlWdksk1j3
         Kup6q3KtTRHDvo6WkuXl5jSSB8LCn5RbOyEgvIooxt02pfa9q7zSGpQfGVyROy+eZMw0
         Sy7hAqL0pyLLSdD5KcbSUWFWI/q9fLQMPfNUfudq+el8IiuUP1RrY79COoXHK/ngYMBl
         xuKQ==
X-Gm-Message-State: AOJu0Yz1Kqi2EJBsGfhc18qvBERd6VI+Lf0yPmSl/TAbHAR+Wkdz+MoR
	M3Z+/MlbPkVOC5a1++Dh3IEQmJUvgSO5eHRy43DWU39XpkNxjZWrSUJgq7PN
X-Google-Smtp-Source: AGHT+IHWkAom48nElv+CrCSKEuuG6+PM4jEwaw8EHQL7k37pr08zJu42eBeE0vJrs4cmc4YKknGc+g==
X-Received: by 2002:a17:90a:9e3:b0:2e7:6a44:daff with SMTP id 98e67ed59e1d1-2e76b5dd9aamr2507301a91.10.1729682377872;
        Wed, 23 Oct 2024 04:19:37 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76dfbeca4sm1123022a91.32.2024.10.23.04.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:19:37 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sean Young <sean@mess.org>
Subject: [PATCH v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Wed, 23 Oct 2024 19:18:41 +0800
Message-Id: <20241023111841.158049-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241023111841.158049-1-cwweng.linux@gmail.com>
References: <20241023111841.158049-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_041938_989806_2BD4F938 
X-CRM114-Status: GOOD (  25.24  )
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

This commit adds a generic PWM framework driver for Nuvoton MA35D1
PWM controller.

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Sean Young <sean@mess.org>
Reviewed-by: "Uwe Kleine-Konig" <ukleinek@kernel.org>
---
 drivers/pwm/Kconfig      |   9 +++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-ma35d1.c | 169 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 drivers/pwm/pwm-ma35d1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 0915c1e7df16..97b9e83af020 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -411,6 +411,15 @@ config PWM_LPSS_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-lpss-platform.
 
+config PWM_MA35D1
+	tristate "Nuvoton MA35D1 PWM support"
+	depends on ARCH_MA35 || COMPILE_TEST
+	help
+	  Generic PWM framework driver for Nuvoton MA35D1.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ma35d1.
+
 config PWM_MESON
 	tristate "Amlogic Meson PWM driver"
 	depends on ARCH_MESON || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 9081e0c0e9e0..c1d3a1d8add0 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_PWM_LPC32XX)	+= pwm-lpc32xx.o
 obj-$(CONFIG_PWM_LPSS)		+= pwm-lpss.o
 obj-$(CONFIG_PWM_LPSS_PCI)	+= pwm-lpss-pci.o
 obj-$(CONFIG_PWM_LPSS_PLATFORM)	+= pwm-lpss-platform.o
+obj-$(CONFIG_PWM_MA35D1)	+= pwm-ma35d1.o
 obj-$(CONFIG_PWM_MESON)		+= pwm-meson.o
 obj-$(CONFIG_PWM_MEDIATEK)	+= pwm-mediatek.o
 obj-$(CONFIG_PWM_MICROCHIP_CORE)	+= pwm-microchip-core.o
diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
new file mode 100644
index 000000000000..0c4eec4a0b07
--- /dev/null
+++ b/drivers/pwm/pwm-ma35d1.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Nuvoton MA35D1 PWM controller
+ *
+ * Copyright (C) 2024 Nuvoton Corporation
+ *               Chi-Wen Weng <cwweng@nuvoton.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/math64.h>
+
+/* The following are registers for PWM controller */
+#define REG_PWM_CTL0            (0x00)
+#define REG_PWM_CNTEN           (0x20)
+#define REG_PWM_PERIOD0         (0x30)
+#define REG_PWM_CMPDAT0         (0x50)
+#define REG_PWM_WGCTL0          (0xB0)
+#define REG_PWM_POLCTL          (0xD4)
+#define REG_PWM_POEN            (0xD8)
+
+#define PWM_TOTAL_CHANNELS      6
+#define PWM_CH_REG_SIZE         4
+
+struct nuvoton_pwm {
+	void __iomem *base;
+	u64 clkrate;
+};
+
+static inline struct nuvoton_pwm *to_nuvoton_pwm(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm;
+	unsigned int ch = pwm->hwpwm;
+
+	nvtpwm = to_nuvoton_pwm(chip);
+	if (state->enabled) {
+		u64 duty_cycles, period_cycles;
+
+		/* Calculate the duty and period cycles */
+		duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+						  state->duty_cycle, NSEC_PER_SEC);
+		if (duty_cycles > 0xFFFF)
+			duty_cycles = 0xFFFF;
+
+		period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+						    state->period, NSEC_PER_SEC);
+		if (period_cycles > 0xFFFF)
+			period_cycles = 0xFFFF;
+
+		/* Write the duty and period cycles to registers */
+		writel(duty_cycles, nvtpwm->base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE));
+		writel(period_cycles, nvtpwm->base + REG_PWM_PERIOD0 + (ch * PWM_CH_REG_SIZE));
+		/* Enable counter */
+		writel(readl(nvtpwm->base + REG_PWM_CNTEN) | BIT(ch),
+		       nvtpwm->base + REG_PWM_CNTEN);
+		/* Enable output */
+		writel(readl(nvtpwm->base + REG_PWM_POEN) | BIT(ch),
+		       nvtpwm->base + REG_PWM_POEN);
+	} else {
+		/* Disable counter */
+		writel(readl(nvtpwm->base + REG_PWM_CNTEN) & ~BIT(ch),
+		       nvtpwm->base + REG_PWM_CNTEN);
+		/* Disable output */
+		writel(readl(nvtpwm->base + REG_PWM_POEN) & ~BIT(ch),
+		       nvtpwm->base + REG_PWM_POEN);
+	}
+
+	/* Set polarity state to register */
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		writel(readl(nvtpwm->base + REG_PWM_POLCTL) & ~BIT(ch),
+		       nvtpwm->base + REG_PWM_POLCTL);
+	else
+		writel(readl(nvtpwm->base + REG_PWM_POLCTL) | BIT(ch),
+		       nvtpwm->base + REG_PWM_POLCTL);
+
+	return 0;
+}
+
+static int nuvoton_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm;
+	unsigned int duty_cycles, period_cycles, cnten, outen, polarity;
+	unsigned int ch = pwm->hwpwm;
+
+	nvtpwm = to_nuvoton_pwm(chip);
+
+	cnten = readl(nvtpwm->base + REG_PWM_CNTEN);
+	outen = readl(nvtpwm->base + REG_PWM_POEN);
+	duty_cycles = readl(nvtpwm->base + REG_PWM_CMPDAT0 + (ch * PWM_CH_REG_SIZE));
+	period_cycles = readl(nvtpwm->base + REG_PWM_PERIOD0 + (ch * PWM_CH_REG_SIZE));
+	polarity = readl(nvtpwm->base + REG_PWM_POLCTL) & BIT(ch);
+
+	state->enabled = (cnten & BIT(ch)) && (outen & BIT(ch));
+	state->polarity = polarity ? PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+	state->duty_cycle = DIV64_U64_ROUND_UP((u64)duty_cycles * NSEC_PER_SEC, nvtpwm->clkrate);
+	state->period = DIV64_U64_ROUND_UP((u64)period_cycles * NSEC_PER_SEC, nvtpwm->clkrate);
+
+	return 0;
+}
+
+static const struct pwm_ops nuvoton_pwm_ops = {
+	.apply = nuvoton_pwm_apply,
+	.get_state = nuvoton_pwm_get_state,
+};
+
+static int nuvoton_pwm_probe(struct platform_device *pdev)
+{
+	struct pwm_chip *chip;
+	struct nuvoton_pwm *nvtpwm;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_pwmchip_alloc(&pdev->dev, PWM_TOTAL_CHANNELS, sizeof(*nvtpwm));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	nvtpwm = to_nuvoton_pwm(chip);
+
+	nvtpwm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nvtpwm->base))
+		return PTR_ERR(nvtpwm->base);
+
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "unable to get the clock");
+
+	nvtpwm->clkrate = clk_get_rate(clk);
+	if (nvtpwm->clkrate > NSEC_PER_SEC)
+		return dev_err_probe(&pdev->dev, -EINVAL, "pwm clock out of range");
+
+	chip->ops = &nuvoton_pwm_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(&pdev->dev, chip);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "unable to add pwm chip");
+
+	return 0;
+}
+
+static const struct of_device_id nuvoton_pwm_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-pwm" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nuvoton_pwm_of_match);
+
+static struct platform_driver nuvoton_pwm_driver = {
+	.probe = nuvoton_pwm_probe,
+	.driver = {
+		.name = "nuvoton-pwm",
+		.of_match_table = nuvoton_pwm_of_match,
+	},
+};
+module_platform_driver(nuvoton_pwm_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


