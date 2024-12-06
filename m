Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205C4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXzBDmYmAYiTEiNeSDk23tSQ42obw3PMZqIoeDF1+Gw=; b=AhLuLaxA+ymYPFHl/j45Mi6pIM
	fY9TaD3gC+EGBcYi4Ww7xnkHfmKy1AJfmKtC2ulPkazw7pF5E5+GWFuFzNvSWMBqAcZuMZ8gxXAVO
	nv64g8kZUdRsqAopukjDnsj2DL3Sx+WC/HweIQKiZKJCJwsI8uZRBpkMali9tM4OE6AEhYXukruw2
	dDBDzF3KzBkXoaax0IwNIKsY0Z1w4fYP1kBBam6OrISNwnWd93TF1hatqwDMsgmAXIW8NyTiIXKgF
	8WiJjqxRt8Y9dHcwefyeZQr52apPRPnh64Jj7EbyhskmAyNLlcZJiI+85FTL0k+aBO0B3F1s+CBDV
	fMlTLkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUAB-0000000106x-2Zip;
	Fri, 06 Dec 2024 08:58:15 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJU7S-00000000zeU-3cq4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:55:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7fd10cd5b1aso1350366a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 00:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475326; x=1734080126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXzBDmYmAYiTEiNeSDk23tSQ42obw3PMZqIoeDF1+Gw=;
        b=fuuzo1KkoVEdIyHB6cy+AtbYJ10d3RKFKwWw7qhnIxdLD6bEd47zV3dak1aXYLUsES
         ADFwjOMSvWPA0GL5il6MBBwQTN/C2EqV6yqBAxcfUs/T4EXDESRhoUyA3HMfd0uXPFxt
         l5MdeheEjp5mdz0IgEAkiTG3i1DzZ41ok/nl/hMXuoalvVkVHpuJk64cClTBOfOqW40E
         Nz2cXKTB5q0bB27+E8WgwjKko5OCGABGuTVKkfu24SYVyR5MNgrrtxNkM638lubTV83e
         wvvO2SzT63458MqiDRJWcCAE7uMYCt8dH0ao/bWRLWv+gV3XZUNAL5CYjDMpUARelUL3
         Afnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475326; x=1734080126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXzBDmYmAYiTEiNeSDk23tSQ42obw3PMZqIoeDF1+Gw=;
        b=MQeCFXEsWueK27KwhtTqTK/EFj+v4nBpkDVOzi+dD4pM0JSQ+tzDcPMrHSW25zfO0k
         Xbp86g8DFRhlHvntpn5LM+u0X3XT5MtaKI+h09qj6ZDDZwaS6AeTUYH12TtYCymPrYlX
         AtyAyuB0cXpeAYzhVpC1mu3MGoTSs9BN4acK04eYc1nN0SIIIc2siTHdttULqVz5jY6y
         sYR+/TEqPyKmhRRWvYVHTOged767EuV5Ec+muntGmS/DTS29wO0khVSOiFr9CtWidpdr
         +Etr6CvXyLcChPFAzvFLy1YXaSgqXvaAKMLnXGfE8AQNDpEDAZoqyzR5s5xA2G2SETvi
         aPiA==
X-Gm-Message-State: AOJu0YxreWvX9ttBjyNTgZbbn6pwCmHqpXZ4yz4Y9mVOK7YzpvqIoq7M
	oTKkMgqMo8a6y1qtl1pH94nxiJYV/595W4poY57S3ohSM3gNGIqPhxy04A==
X-Gm-Gg: ASbGncsLe8TWjyApxF8Dq6WT0zZ6a9DxcVrhiS6Cg7ZNcb2/4xv0c7ltW8FqAZVJbzS
	55fyAlKm/SKGfwvlFfCr76qHJROfkerWT+iNOz79Zm4aPjwaMcqWJzspXklBZ/YwXuPMQzc8Use
	GKu7jj7SG14cKVh6MA+LTBlfi5+YUSvBlYqw6x4QvFcNRiHPf1+Fr7VcnXb7e0ikq0uj5KTqSjZ
	yvyyftnV8I5ez4j1jokhJFAUCpC9OVTN8xKJ8xx7aEWPPvOgl6ifl3yaf3ZvWZ8b2/wyQLpTt38
	HmOyQfCH64OzNRJR6GTxtN9nCpMBsemeE3B7EA==
X-Google-Smtp-Source: AGHT+IFt1vV18k4dYxA/UZ0/gooX1mzCL2kGcZVlW0cdLXLI3lYqX+tdAlh93E2m8aPP+pmfkxlYiQ==
X-Received: by 2002:a17:90b:5204:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-2ef6a6bdc2amr4041200a91.17.1733475325861;
        Fri, 06 Dec 2024 00:55:25 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270795d6sm4548157a91.42.2024.12.06.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:55:25 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH v3 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Fri,  6 Dec 2024 16:55:01 +0800
Message-Id: <20241206085501.2623772-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206085501.2623772-1-cwweng.linux@gmail.com>
References: <20241206085501.2623772-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_005526_900283_F206C185 
X-CRM114-Status: GOOD (  24.22  )
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

This commit adds a generic PWM framework driver for Nuvoton MA35D1 PWM controller.

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
---
 drivers/pwm/Kconfig      |   9 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-ma35d1.c | 179 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)
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
index 000000000000..380f17b20a3d
--- /dev/null
+++ b/drivers/pwm/pwm-ma35d1.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Nuvoton MA35D1 PWM controller
+ *
+ * Copyright (C) 2024 Nuvoton Corporation
+ *               Chi-Wen Weng <cwweng@nuvoton.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+
+/* The following are registers address offset for MA35D1 PWM controller */
+#define MA35D1_REG_PWM_CTL0            (0x00)
+#define MA35D1_REG_PWM_CNTEN           (0x20)
+#define MA35D1_REG_PWM_PERIOD0         (0x30)
+#define MA35D1_REG_PWM_CMPDAT0         (0x50)
+#define MA35D1_REG_PWM_WGCTL0          (0xB0)
+#define MA35D1_REG_PWM_POLCTL          (0xD4)
+#define MA35D1_REG_PWM_POEN            (0xD8)
+
+/* The following are register address of MA35D1 PWM controller */
+#define MA35D1_PWM_CH_REG_SIZE         4
+#define MA35D1_PWM_CMPDAT0_ADDR(base, ch)     ((base) + MA35D1_REG_PWM_CMPDAT0 + \
+					       ((ch) * MA35D1_PWM_CH_REG_SIZE))
+#define MA35D1_PWM_CNTEN_ADDR(base)           ((base) + MA35D1_REG_PWM_CNTEN)
+#define MA35D1_PWM_PERIOD0_ADDR(base, ch)     ((base) + MA35D1_REG_PWM_PERIOD0 + \
+					       ((ch) * MA35D1_PWM_CH_REG_SIZE))
+#define MA35D1_PWM_POEN_ADDR(base)            ((base) + MA35D1_REG_PWM_POEN)
+#define MA35D1_PWM_POLCTL_ADDR(base)          ((base) + MA35D1_REG_PWM_POLCTL)
+
+#define MA35D1_PWM_MAX_COUNT           0xFFFF
+#define MA35D1_PWM_TOTAL_CHANNELS      6
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
+	u32 ch = pwm->hwpwm;
+
+	nvtpwm = to_nuvoton_pwm(chip);
+	if (state->enabled) {
+		u64 duty_cycles, period_cycles;
+
+		/* Calculate the duty and period cycles */
+		duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+						  state->duty_cycle, NSEC_PER_SEC);
+		if (duty_cycles > MA35D1_PWM_MAX_COUNT)
+			duty_cycles = MA35D1_PWM_MAX_COUNT;
+
+		period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+						    state->period, NSEC_PER_SEC);
+		if (period_cycles > MA35D1_PWM_MAX_COUNT)
+			period_cycles = MA35D1_PWM_MAX_COUNT;
+
+		/* Write the duty and period cycles to registers */
+		writel(duty_cycles, MA35D1_PWM_CMPDAT0_ADDR(nvtpwm->base, ch));
+		writel(period_cycles, MA35D1_PWM_PERIOD0_ADDR(nvtpwm->base, ch));
+		/* Enable counter */
+		writel(readl(MA35D1_PWM_CNTEN_ADDR(nvtpwm->base)) | BIT(ch),
+		       MA35D1_PWM_CNTEN_ADDR(nvtpwm->base));
+		/* Enable output */
+		writel(readl(MA35D1_PWM_POEN_ADDR(nvtpwm->base)) | BIT(ch),
+		       MA35D1_PWM_POEN_ADDR(nvtpwm->base));
+	} else {
+		/* Disable counter */
+		writel(readl(MA35D1_PWM_CNTEN_ADDR(nvtpwm->base)) & ~BIT(ch),
+		       MA35D1_PWM_CNTEN_ADDR(nvtpwm->base));
+		/* Disable output */
+		writel(readl(MA35D1_PWM_POEN_ADDR(nvtpwm->base)) & ~BIT(ch),
+		       MA35D1_PWM_POEN_ADDR(nvtpwm->base));
+	}
+
+	/* Set polarity state to register */
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		writel(readl(MA35D1_PWM_POLCTL_ADDR(nvtpwm->base)) & ~BIT(ch),
+		       MA35D1_PWM_POLCTL_ADDR(nvtpwm->base));
+	else
+		writel(readl(MA35D1_PWM_POLCTL_ADDR(nvtpwm->base)) | BIT(ch),
+		       MA35D1_PWM_POLCTL_ADDR(nvtpwm->base));
+
+	return 0;
+}
+
+static int nuvoton_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm;
+	u32 duty_cycles, period_cycles, cnten, outen, polarity;
+	u32 ch = pwm->hwpwm;
+
+	nvtpwm = to_nuvoton_pwm(chip);
+
+	cnten = readl(MA35D1_PWM_CNTEN_ADDR(nvtpwm->base));
+	outen = readl(MA35D1_PWM_POEN_ADDR(nvtpwm->base));
+	duty_cycles = readl(MA35D1_PWM_CMPDAT0_ADDR(nvtpwm->base, ch));
+	period_cycles = readl(MA35D1_PWM_PERIOD0_ADDR(nvtpwm->base, ch));
+	polarity = readl(MA35D1_PWM_POLCTL_ADDR(nvtpwm->base)) & BIT(ch);
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
+	chip = devm_pwmchip_alloc(&pdev->dev, MA35D1_PWM_TOTAL_CHANNELS, sizeof(*nvtpwm));
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


