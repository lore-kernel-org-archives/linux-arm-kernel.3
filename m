Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C032CCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9/kqdJdxWIzIpzlajuvcdUTzcyLVthHgSoaB5kX8CM=; b=P74WzdLMCJmoALLaw6HGBZSBXN
	NHEaPPtXce57g88onrn0dpp5TbaghMQ6/g9Lm3Wm0Ll7dUvBtqZOiwblD/aZZmpWw438f6ry2KGhO
	cS22XZ6ZoUT9TUJg1+CWtrvuzGWQsDG+At96xfYJhZ5qyv0mnd2ZN3RKCcMW5CspJ6LTulhSrseu8
	XDG6d8/Geb/YUCIn7cd7Brs5ruOAAvXCiZBLgfNJQ1MU6f+5fmZ39lKS7G7hwNxlR5ODnIPSxKNpm
	EnQdPR8kmN8QiTDAvj9/tAPPnoPAilmLL8bh9jJCJmuC7nF8pdUen3nZdNCH4GptUa6nVnmIfuXUd
	lE2tw6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqWf-0000000BXnf-3rIA;
	Tue, 26 Aug 2025 10:03:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5M-0000000BR5M-3HQ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3c7aa4ce85dso1521301f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200923; x=1756805723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9/kqdJdxWIzIpzlajuvcdUTzcyLVthHgSoaB5kX8CM=;
        b=EZ0M4p+Qcj3YZvtVbu7BKURJuiKoxuk18wK5oFSwYSRHeQ38mirU8DwR/I+sDeLVKw
         qaTm7aAXmKzjyKvbT8T+TOJLxT7juVrRRMyfXDvVSoAS59pgGTkQkOdNnldgAyE2g4BD
         tpDdVyoBS/fuVG10re7p4QlyMMv2YXgmJa6i7pJAqW1CqNOl0lLgweTCO1WzUjp4/Xf1
         ithaw2RXLXIWoO+/xVsrYPLuyaq3Dhol3gHGsaG01QQ+PSSQzGSgRt1RU0r+zr2f4/6t
         Fa7i1RDD9TbAdfTjtvTmc3I6JPznZqeIZoYDPFMHg+6tvwQGH084pmFF8Wvtfizd/oCE
         wUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200923; x=1756805723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9/kqdJdxWIzIpzlajuvcdUTzcyLVthHgSoaB5kX8CM=;
        b=CVYrus5gLjMZxTyEeXun6QwQcgw042HIUS5Unw2+RaRv0TlgSA8ZpA3o0Q7n/gMCZh
         rEa3ZP95+RKjvWf+mSmnrX9aQ2snIsFdYgE5oDbzFAnIldlxQHo4H0Xc++RCSKjzrAOQ
         DtcUOZnNXfQoDAHqpF0OOstv0LundPeH5WZzxjESyJxcKyd+3fmbjl6C4/vAiQWCvP6D
         r/jtLEgMucH0vAmLC51MTs93KqqUVrgb8L5+OhtwaEef8ZEHtR7jNMjnKvFIIHWEfPFo
         Sqyk9q6NYNGJRJz6mYQR2FWsUqdBHzMnoxsQa9KFq34/9wSxAb47SpSv5Bng3yhh8oPk
         lMpg==
X-Forwarded-Encrypted: i=1; AJvYcCWJHbZigr6PvPn7tI8roate+ovgPjZuqQn2j7VOTKPGpsWLiJQpOwFwKkoFTUVVBZUWLR3N/8GcV3yV3lYhdKGF@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ32q8esANiPc+TNvQSXdf+HEYowHMFenjcE46aNlaKxg2J7RO
	6lidgnzZo6pUgGESp55t8l2QHlPXu6rUKRihi2bmFwdHFbPVsfvyeIirz4xymkcx9E3WiDxeOOk
	BkWFiVMA=
X-Gm-Gg: ASbGnctlhATn6Onpc4ybiy9yMhODdeMq9Hv8LMai1Qk0Fregj2sZoICX43PpoJRYgBI
	uVaAKyn21/vQWzz3wooc/hP0LE1Myfog6rq03aVfoCsKbqSnLJDAhJlrqld+UHnY7hz1VqagN5A
	eIO2SomC+SGTrPfNXlHpV4PAElDCVwmyZWU0qL4dVljZoXPsSaTJ0WqjhLGItQQ6rTiPEk7otdp
	3yT0MJw/aC+hYMYaFWqs6y2/MoHAd2AKK1fkCBdDg2/KanaCedu3FE1jSvj5ffkdo/HN75ZV0Dy
	tHhPqy8HxTC87mhy7sRBtlGME5fHXE+5Aq7D3AJ254ZYuTTnRhu7b2V1Dg32gY3PNCTgfJR1e/F
	Ka7XXRhBrqiBqGK1Bvhkq1s+0Jlw=
X-Google-Smtp-Source: AGHT+IHhqCZTTh38nJ9OEB6j03N/ymjt8499IA6NoJIW3vQyaWoOGjFqqoGaQBY7r9K6SnO7/9Dt/A==
X-Received: by 2002:a05:6000:1ac8:b0:3ca:99ad:5191 with SMTP id ffacd0b85a97d-3ca99ad5743mr2771250f8f.8.1756200923181;
        Tue, 26 Aug 2025 02:35:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:11 +0200
Subject: [PATCH 10/12] gpio: hisi: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-10-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4915;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6Mqj30ZaBzEYO/i4p5Yuij8imY9alsKREk3LJC3mQCk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/OZLkAi3tbz0g8kZe2iQka9yX236eZwcXpm
 zN2K0t6BSaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 cjfBEACYtgt9Zss04cf7kKQJ93aA8/2Cm03zXtnSWIt0g9bpYwn5i2vaR1XPPEqvm0ANtUgonUD
 QkebsSs384De1FePWsu6S2QSAF/500qGclluBNfJZmKvUVCAFNVGzNtWXSZi2li3R59ArLWGT7G
 80w1Bk2KszNtKFRglzYv9VWn7hljzpxcwLzcv4WqcITYT0lG0G53JDhQh+8GSzh0FyQw+q/e8w/
 dip4YjPllUjQoQAOQvNovjWRbXNDukdmIq8k5z8vvS27EUd5ZTlR61mrYh2FV3MaVhThCEiQapm
 CfYZe5EW/LtyRlRrnun0qGjTF43hTNTX5sKc8n6VKcRwthxMwvcT/dvIeQFnKrGjUPelo9s4aLu
 OcXio2M5QpnRTK/g1PsIPc54TB/VGmh45AAc2YvH2R7fk1bJl42hc8bAAn3LitQIFXyRUH4fXTc
 Nh6immFsHmAZbCv7dqFPUf0L/dqiTGaZfu0FJ7b1NWeMIU/hH9pUvVl4MyyXzCmzMbpOLhTCjjy
 SuueZkprVyEnwcKoWcq2Td8MNjueS4+rSci1rDm7+ciVhafAYVeWCqkvA0tjYUR0SujBnjsT3Dp
 GeU2U7ViG44dNjlsE7f2TsdLL9OndQnibEDdm09J1XhED7CO47HaVIYhGMQlWAxwYHP2/jMHJRb
 54f5EVCVEzM9flQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023524_840982_59704D37 
X-CRM114-Status: GOOD (  17.97  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 6016e6f0ed0fb80ea670ebb575452d9ec23976fa..01a99ac613d94e933d30f782520776693f048d1c 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2020 HiSilicon Limited. */
+
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
@@ -33,7 +35,7 @@
 #define HISI_GPIO_DRIVER_NAME	"gpio-hisi"
 
 struct hisi_gpio {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	struct device		*dev;
 	void __iomem		*reg_base;
 	unsigned int		line_num;
@@ -43,8 +45,8 @@ struct hisi_gpio {
 static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
 				     unsigned int off)
 {
-	struct hisi_gpio *hisi_gpio =
-			container_of(chip, struct hisi_gpio, chip);
+	struct hisi_gpio *hisi_gpio = container_of(to_gpio_generic_chip(chip),
+						   struct hisi_gpio, chip);
 	void __iomem *reg = hisi_gpio->reg_base + off;
 
 	return readl(reg);
@@ -53,8 +55,8 @@ static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
 static inline void hisi_gpio_write_reg(struct gpio_chip *chip,
 				       unsigned int off, u32 val)
 {
-	struct hisi_gpio *hisi_gpio =
-			container_of(chip, struct hisi_gpio, chip);
+	struct hisi_gpio *hisi_gpio = container_of(to_gpio_generic_chip(chip),
+						   struct hisi_gpio, chip);
 	void __iomem *reg = hisi_gpio->reg_base + off;
 
 	writel(val, reg);
@@ -180,14 +182,14 @@ static void hisi_gpio_irq_disable(struct irq_data *d)
 static void hisi_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct hisi_gpio *hisi_gpio = irq_desc_get_handler_data(desc);
-	unsigned long irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip,
+	unsigned long irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip.gc,
 						   HISI_GPIO_INTSTATUS_WX);
 	struct irq_chip *irq_c = irq_desc_get_chip(desc);
 	int hwirq;
 
 	chained_irq_enter(irq_c, desc);
 	for_each_set_bit(hwirq, &irq_msk, HISI_GPIO_LINE_NUM_MAX)
-		generic_handle_domain_irq(hisi_gpio->chip.irq.domain,
+		generic_handle_domain_irq(hisi_gpio->chip.gc.irq.domain,
 					  hwirq);
 	chained_irq_exit(irq_c, desc);
 }
@@ -206,7 +208,7 @@ static const struct irq_chip hisi_gpio_irq_chip = {
 
 static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 {
-	struct gpio_chip *chip = &hisi_gpio->chip;
+	struct gpio_chip *chip = &hisi_gpio->chip.gc;
 	struct gpio_irq_chip *girq_chip = &chip->irq;
 
 	gpio_irq_chip_set_chip(girq_chip, &hisi_gpio_irq_chip);
@@ -264,6 +266,7 @@ static void hisi_gpio_get_pdata(struct device *dev,
 
 static int hisi_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct hisi_gpio *hisi_gpio;
 	int port_num;
@@ -289,26 +292,31 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->dev = dev;
 
-	ret = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, 0x4,
-			 hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
-			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
+	config = (typeof(config)){
+		.dev = hisi_gpio->dev,
+		.sz = 4,
+		.dat = hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX,
+		.set = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX,
+		.clr = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
+		.dirout = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
+		.dirin = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
+		.flags = BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&hisi_gpio->chip, &config);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
 	}
 
-	hisi_gpio->chip.set_config = hisi_gpio_set_config;
-	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.base = -1;
+	hisi_gpio->chip.gc.set_config = hisi_gpio_set_config;
+	hisi_gpio->chip.gc.ngpio = hisi_gpio->line_num;
+	hisi_gpio->chip.gc.base = -1;
 
 	if (hisi_gpio->irq > 0)
 		hisi_gpio_init_irq(hisi_gpio);
 
-	ret = devm_gpiochip_add_data(dev, &hisi_gpio->chip, hisi_gpio);
+	ret = devm_gpiochip_add_data(dev, &hisi_gpio->chip.gc, hisi_gpio);
 	if (ret) {
 		dev_err(dev, "failed to register gpiochip, ret = %d\n", ret);
 		return ret;

-- 
2.48.1


