Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78E1CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pGbuhM4bK1nzx8/KQJOMrqGkDCt/rhGN2Bb+/oVkck=; b=TDfCmLUwyvjqQxao/qYC6yxxB7
	xUD2RrMvSjVn82uIlNS8v7zmXwjea3FiJVpAsBLuw3DeXj8Uk3BZ8Ao6938RrGJvW3T6tUTX4LLWy
	XxocTcOeY+qt0oiFo4aOc/p6GRaec22TDiXJq9qJUchNSBSlk9/SFkeDlzy02SRPdoQJbFymZnUaM
	7M+yIyS/mh20nYPoKXIJZ3Zg1EhC+mwygMdNF6IDsBtokDUCAOHdN1m1GpWNc6smZeb0gvYEFQeMR
	Tbji9UvrU8JP3QvS4dTDmxC9D68RjDMixU1PHY4q7MCd4YzdPT13Xunj16Gu6RwkzmmKskeW5aeII
	u5UUav6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKX-0000000EjPr-0fWX;
	Wed, 14 Oct 2026 07:23:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKH-0000000EjDj-0l7c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c4649b35bso88970f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962579; x=1792567379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pGbuhM4bK1nzx8/KQJOMrqGkDCt/rhGN2Bb+/oVkck=;
        b=X77MJmRwsb0HdZdwauk53aVfpWn3q74TThePJh4oLXqXwpBkjwxEV6IoL22ZDIRjuB
         2jsXOx6ZiwFJZe4tL/WNZSSu3HydmShTpcMTaO+V/4hMH4FIAuVLhyPObs8cfsyHx2wu
         ONmESV/Fc/RBwyIIZmgMC3fEy+0DJLvIFbmeMGgIIczg9oCLwnmPCjQ/yozKBUbJowig
         JiWkktaWOXYc6iu/tRh8SleR/cs/yFlXnAJpurAF5fKGKBaXZPpnN2/nHUWJn8C9Zppa
         oHwCc/0uVcihCWDsudeJ5GHBpP52MKORVUyJWfVJDoF9VS4VZuFAz1SVXybmdwcOdP8m
         Y/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962579; x=1792567379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pGbuhM4bK1nzx8/KQJOMrqGkDCt/rhGN2Bb+/oVkck=;
        b=GB9PtPYS9dfXwBu3MmlTpMSemk/egbJdpk/u2iFS+//YU9TK4ll9gDljeDC+uqu/W/
         L4owXLSKn0MMWKliivtbo/nww8mdiOsXDiD6c5aFLu5ownJ38lxY7OXuke7BiL6thXcL
         U6/PnhiM9LkVzObqzgS2ja0dsFXEtBT4bXx9Mgd2tvjEoe7Hlfds8jbSjbzIWvPCktxM
         ujACXKAdOKu478mPju2W0V/ykJtNQHCEhE/5KoTRxGPNhwLbzE0xSfgtUkXJNGbRVTkk
         6mL3Y7QqxE4pxtaVL71ZX5LYwkIZToQB0A0280o7Ln1ifuAHiiESdZDtj+NkQJPcusU9
         B8mQ==
X-Gm-Message-State: AFq9FYL06ldntsY5ydPPUh419VI/XOP9iwJ2NZIFuQJNgDNmQzRmbi89
	T6IQm09f+QSR43bpaCYPqs0pRdI5os7TTIwzkuc7hWm9hRqsiPZUBeDVylFZ9z+6PJ+B0w==
X-Gm-Gg: AYBFou1CkebwxIipfEg0nWJIlr1eBS4+N4LC81Iy4NZtyBoOTEhyA8NUvj2d5fLulRo
	fXL2JG3aTUstalD93IkGDNVcVtpFRFWk0Sby1TyKsh5GzZ1GLpVglQRHa0OsHIM+aiHeublRvZU
	o4ddNFlnPWW7Ka4+cTm7A4rmujUKIKa2jDf4XDA7VVhCshwaY66YsJWLurvspE2nbcpoM5ydXzi
	Stt2PoDN6wsdKeiTvqjC5jKK3T4429a3k4yYXCl9iL9IzRWmF4C13XgzIPOJWJ9G00Oh9mZ1AHq
	i2xmzB8etWyIinibaOd4nMR62dhKv8DdTIJOAgry5u/FaWiyJ1TgMRX8HBR6+Uk9J41xAnkLFMi
	28h/9FtgMHxzwKyyzqLD49N7FwobKghpX9qD1vN3jBas3voUP429J07IUPbjqmTrvc8fiP7P8Tq
	WrUmwXWkmD4nIOx/ohtvwv/2iwuZFZyO/SzQwEOpEsRKWmn2IcHt9b7hc14/kg/xjaEdFzQ8zVq
	Oq2OkSKT7kFda2CKjwtWj3b5P9CwveBSVW+H9tr/9d5NKeVx+Np8QqeyeQokDfKQakSQY162hQE
	xkrzD3Vr1UivOwXLUojsGvuQD7E3Gk3DeT7dNGZVN7+nQcAxpNpBQaBEVbt3qA==
X-Received: by 2002:a05:6000:4b0b:b0:48a:fdde:5241 with SMTP id ffacd0b85a97d-48dbaaef91emr28940606f8f.31.1791962579326;
        Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:58 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 08:20:48 +0100
Message-ID: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002302_081071_94819C33 
X-CRM114-Status: GOOD (  22.90  )
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

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/gpio/Kconfig          | 12 ++++++
 drivers/gpio/Makefile         |  1 +
 drivers/gpio/gpio-zx279128s.c | 79 +++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
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
index 0000000000..71eb6b5d82
--- /dev/null
+++ b/drivers/gpio/gpio-zx279128s.c
@@ -0,0 +1,79 @@
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
+	config.sz = 4;
+	config.dat = base + ZX279128S_GPIO_DATA;
+	config.set = base + ZX279128S_GPIO_SET;
+	config.clr = base + ZX279128S_GPIO_CLEAR;
+	config.dirout = base + ZX279128S_GPIO_DIR;
+
+	ret = gpio_generic_chip_init(chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set up the GPIO chip\n");
+
+	chip->gc.ngpio = 16;
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


