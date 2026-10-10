Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FD1CA9ECB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=; b=FePuplVljefQ4aIkkTITLHmCzw
	hJhfIap9kZ8JAqWc3nVWiv1jexlefAr5cLm4nUSRin34FeBAk38kOU1MBeLLtGRJj8Cxnl3JKeZqL
	rjWXZAGqRWdP8YmN5LjPf+EqTvfGIyKaG7g6DNMzoA2IbyoeN0puUOv06BUN2/cN2odR/LjWi5NjE
	Rrd+7v8LqI/kdMZdyplHCI2IAgd/uKqBIxs979oIYzakwaX4C1bMC+E2xHEKe99ORlmdfVgBAGByR
	/8OcQUZgv2QM+FhJBk9MQWIhdu27hVp7TS/A9jvGRPBUVbGP07Xzx2DOfmwdtFLlvG1zQvgErVZ0E
	R+qqIQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh2-000000083RW-3mLF;
	Sat, 10 Oct 2026 13:00:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgq-000000083EW-2YET
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so5043845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637239; x=1792242039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=;
        b=sU84YkcuHkoi0C7cwch6knTbM5iiHAIZyy8AQFJpLCSe8a0DCkNkztgGJTq35qaUoz
         jXEQDdNWeZt5rCU9EFL53WhrAVumi81+XPHVXH6nNzQDzN8L9RcKoffMFd4rAtCYZmeB
         3SJ4qvcuopKUUutEqnZkhv9NyrjR7ZNl0n8PwHL8js4sMQGXAjDe+3YmU7Hzv13yUes7
         vMiJARNbQMdu+3vyMDQMQacLqVM72CemUQpD6tdGfhYAK6lah7yos/nXdtJLQlr6pQd1
         5vy076XNLp/Gv+pM5hai/4aEEHDYHWcm5XFk4ivPAGx2hy5cfNcRp44DwZnKHL2HH3R2
         EqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637239; x=1792242039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGFpiejSGpOIzstNVckwDDSyChSy7GVC4iVpGtXgDOE=;
        b=H639rBDjj4Oi40tZAfqYdN/WcW0bpv1UInHUofvGpbZIfSIYTZas0AsdbXETET/Gju
         iCRqj194op9NrK9x5USoEYjGqGX6Mej7MlwxwaLIuNjMQzUMDEPNHyS2FiKkdkl2dqZk
         llPB0Xn602CV1kgQUvhpIAl6IwAvO3lbxP6jEnmEgx/kCqnzLc+5pr/XtieCTjJ+Xv+0
         8OTCYkE4viqURpUU1yLDMQh4c4XMUc2rfOgUwBLo3+3d1vX9cmedZxPMdOdJEzQ8uo5v
         MYoCE+paJds2iTmtSKAXAqOeM1Rq09AOPXUnbyl9G4kgEyjyXE/LTqlCC6ZaYyceqayx
         9BWw==
X-Gm-Message-State: AFq9FYKw14ux24kGHf9lheoZLDy8VVb1ZHc2zQ2tPTfyHsPoQQlEXjaQ
	7CUBE5tDaOLvd8QaJRbJbxlAKnH1/bs/42i5eroPT/TmPCxtIcGHr8V7nNxGg7dKUfXk9w==
X-Gm-Gg: AYBFou2YfLuLo/gG2acigRFlgQ5uvH63n/wW0udb/ovbzPXCqRk4Nf0+BXqEnqLz/XH
	qUlOT0EX6bltAEquefP761GHjOVJc3YVTKuEnA2WmygLusRDyRO4ZOJzcUxHdZppWs9dI6jkPBM
	vm8AGNrEBvXA/ixKXem8UDVwb5Z3W0eG0d94YY9gb2eWgC60rN7WorQIgxgUu5fHa7XeMuILVBC
	W20QsmnqQMAQQRCuBGqDUYnmxhQC0kUVvVTH1r38XvzV1auZPQVBsm1cWjDX5g3tLUbHG93zffp
	C/N7q8O4JzVkhcY2VfXqA7XSdRuvSrMFfO7w47o4TYi/ne/9FgWV6lqhmNcL2A673zuozrbs0br
	b1mp4OgdfWYFuChD4vmmFinM81uiModLXiqvq0yJPl/p9XbnZWhj/VmoWhc1D2paVnE+HbQWPFA
	EA8l8yk50jOHNVMgEWgu34qQ9bjmO+bFcD1EytW4me04tLm++XjsAwpWuZeCtMgArYX9rypOIFt
	GMBbErvH3w05BnMy4D1HfpBEx7MhL2bLkJvSVDfkRco4U9EAbF26vlaHsBkQtBfU1OQAkiXkt7d
	iuqX/WRgs6hdjpC4EytGdC2VbkBswqfVdS+IMBUMWhnNt/Eq319JjkPNFBgg9A==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr88069255e9.16.1791637238622;
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:38 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sat, 10 Oct 2026 13:59:47 +0100
Message-ID: <20261010130024.177503-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060040_673551_70660F73 
X-CRM114-Status: GOOD (  22.94  )
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

Expose the six banks using the generic GPIO implementation and enable
the register clock before accessing the bank.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/gpio/Kconfig          | 12 ++++++
 drivers/gpio/Makefile         |  1 +
 drivers/gpio/gpio-zx279128s.c | 78 +++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 drivers/gpio/gpio-zx279128s.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8e..3ae51a3c10 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -902,6 +902,18 @@ config GPIO_ZEVIO
 	help
 	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
+config GPIO_ZX279128S
+	tristate "ZTE zx279128s GPIO support"
+	depends on ARCH_ZTE || COMPILE_TEST
+	select GPIO_GENERIC
+	help
+	  Say yes here to support the GPIO controller of the ZTE zx279128s
+	  SoC. It has several banks of 16 lines each, which boards such as
+	  the ZTE ZXHN H3600 use for LEDs, buttons and reset lines.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called gpio-zx279128s.
+
 config GPIO_ZYNQ
 	tristate "Xilinx Zynq GPIO support"
 	depends on ARCH_ZYNQ || ARCH_ZYNQMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b..a57ed7ec71 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -223,5 +223,6 @@ obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
 obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
+obj-$(CONFIG_GPIO_ZX279128S)		+= gpio-zx279128s.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
 obj-$(CONFIG_GPIO_ZYNQMP_MODEPIN)	+= gpio-zynqmp-modepin.o
diff --git a/drivers/gpio/gpio-zx279128s.c b/drivers/gpio/gpio-zx279128s.c
new file mode 100644
index 0000000000..8f37b908bb
--- /dev/null
+++ b/drivers/gpio/gpio-zx279128s.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s GPIO controller
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+/*
+ * Each bank has 16 lines, one bit per line in each register. The registers
+ * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not supported
+ * yet.
+ */
+#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
+#define ZX279128S_GPIO_DATA	0x14	/* line level */
+#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
+#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */
+
+static int zx279128s_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_generic_chip_config config = { };
+	struct device *dev = &pdev->dev;
+	struct gpio_generic_chip *chip;
+	void __iomem *base;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
+
+	config.dev = dev;
+	config.sz = 2;
+	config.dat = base + ZX279128S_GPIO_DATA;
+	config.set = base + ZX279128S_GPIO_SET;
+	config.clr = base + ZX279128S_GPIO_CLEAR;
+	config.dirout = base + ZX279128S_GPIO_DIR;
+
+	ret = gpio_generic_chip_init(chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
+
+	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
+}
+
+static const struct of_device_id zx279128s_gpio_of_match[] = {
+	{ .compatible = "zte,zx279128s-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, zx279128s_gpio_of_match);
+
+static struct platform_driver zx279128s_gpio_driver = {
+	.probe = zx279128s_gpio_probe,
+	.driver = {
+		.name = "zx279128s-gpio",
+		.of_match_table = zx279128s_gpio_of_match,
+	},
+};
+module_platform_driver(zx279128s_gpio_driver);
+
+MODULE_AUTHOR("Navid Ghahremani <ghahramani.navid@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx279128s GPIO controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


