Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DB9D41D55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 05:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+4mxPJ+g18SR9b4gggRSBkZ7SdunBZ7o+EK85L2ooA=; b=tzQLvhwzGMK6QeQq0up6GApJ58
	Tf3ebCE+NACQex8RsW1klqfeMMLYxUiEyPvrPjRpc2eJNSKbRkyCBOW7TmhfJLxMnW8ND99qG4U/7
	Qu5c3bR3Uo29x7uV3yP4ja97erDB7PRcqJ+xcGIpU6S4ksviCR3aZugx/E1Qm0+yb5gsf/4xTJ/G8
	6RxZA7FwzPy1VLABq0tMNOhfhmVm1f3886m6sK9fc2idQ3iccQ0HKNkTo7QYFX0KJoA2ir4hCKZeL
	bW/g/ti3ZspADRhjsR6Kr4DeOWkl7i4CS0zjdTAdchebgB+uIQpoRnnaAnjkBIPRKvTaqfC3gFaFg
	zMOgxNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjaC-00000002Geo-3c1f;
	Tue, 12 Nov 2024 05:36:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjVU-00000002G9X-2iZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 05:32:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20cceb8d8b4so33864275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 21:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731389524; x=1731994324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+4mxPJ+g18SR9b4gggRSBkZ7SdunBZ7o+EK85L2ooA=;
        b=WsleYMFlc7w9OfQ0AFk46kTu2XHgREZpWepXFcdrY66ZDYUjlphaw/d9hjKg0DpV6s
         tu2XLLOgAozVk18Bz/XqScGAAxhT3Mga1UPwABiGAu+0Dhb+b+6kDepZ1D1tA2/+Oq41
         nkfHONAkjvGoBgUYaNI22nBfRA30nECm0Ow0m/JQzSraQfCKhUf1d6WMnok2L/6ERk++
         z98b5HCgHLpDzwWzG2QBm7eg8XtCLCUGpNys95fFQjt3d5hBuXZb8yeR2rzZ5ai1bqF2
         Pu8jxYv7qoW0V+eQu/ngMoBGXbm94lMiWMuRvUmHgLdqWpoXZwSHuJE+7Nxcy/4QOYIh
         zQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389524; x=1731994324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+4mxPJ+g18SR9b4gggRSBkZ7SdunBZ7o+EK85L2ooA=;
        b=GxyzZ8ZgHWr247rrnngbdxjiTCHm6+hNgzJcFjs1G0HcMFqizYW7q4XsihexqPDe/W
         I++5416fgKqZa/hs1Gr6oZG/ZGgqR0bb0zzRX++nHsO6w3GM3MdwvCRHAnc3y3Xw7SFZ
         6gz4a2WM0eti+yXeJTxhKQnTFTQsB/wt3ubEH88XX7RAreUI8BJCa0AJ+0O2ncas+gcN
         c9CbrH1Rd6faEBK3uqVadZm5MRZEa2VRb2TldAVzD8xXqALtkSDTwTy1OZMMDNKHGorv
         yyIZBrCwiYgJszxqb0gk+k8SmYwMho24PImeDvX8EOJt0EQGY5AjKG6AJyJIxamSOGva
         04xg==
X-Forwarded-Encrypted: i=1; AJvYcCXVbUOGK8O9iWwrJRKOQ8Kyui+/zL1bkaV6LOnNKgYix2Q5hlUmiEl04UcBsukCyBHm1/B07kw7qytiEcyl7a2g@lists.infradead.org
X-Gm-Message-State: AOJu0YzuYQBkAlCot8HKgZ6VCs4PzyuQihE56N9ySzimJgt+SH1FgCMv
	fk6M8KJomD7BKFgrQhqqKn+AVB8P9Lvhq3w20WCVFPsG9mo+2tJk
X-Google-Smtp-Source: AGHT+IE7ZB+JygivYN7DRDyTz5bRORwOqOffxgQGMsQc3P7jip8WElNPqo+qzrpjqX0jczvjGYhLbQ==
X-Received: by 2002:a17:902:d50d:b0:20c:62af:a0f0 with SMTP id d9443c01a7336-2118217c5afmr220351525ad.7.1731389523447;
        Mon, 11 Nov 2024 21:32:03 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf19esm85815505ad.92.2024.11.11.21.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 21:32:03 -0800 (PST)
From: mjchen <mjchen0829@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sudeep.holla@arm.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	mjchen0829@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Date: Tue, 12 Nov 2024 05:30:59 +0000
Message-Id: <20241112053059.3361-3-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112053059.3361-1-mjchen0829@gmail.com>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_213204_720886_ACD6B0EA 
X-CRM114-Status: GOOD (  27.35  )
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

Adds a new keypad driver for the MA35D1 platform.
The driver supports key scanning and interrupt handling.

Signed-off-by: mjchen <mjchen0829@gmail.com>
---
 drivers/input/keyboard/Kconfig         |  10 +
 drivers/input/keyboard/Makefile        |   1 +
 drivers/input/keyboard/ma35d1_keypad.c | 308 +++++++++++++++++++++++++
 3 files changed, 319 insertions(+)
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 721ab69e84ac..d7c0d0f4a88d 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
 	  To compile this driver as a module, choose M here: the
 	  module will be called cypress-sf.
 
+config KEYBOARD_MA35D1
+	tristate "Nuvoton MA35D1 keypad driver"
+	depends on ARCH_MA35 || COMPILE_TEST
+	select INPUT_MATRIXKMAP
+	help
+	  Say Y here if you want to use Nuvoton MA35D1 keypad.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ma35d1-keypad.
+
 endif
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 1e0721c30709..9b858cdd1b6b 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -70,3 +70,4 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
 obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
 obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
 obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
+obj-$(CONFIG_KEYBOARD_MA35D1)		+= ma35d1_keypad.o
diff --git a/drivers/input/keyboard/ma35d1_keypad.c b/drivers/input/keyboard/ma35d1_keypad.c
new file mode 100644
index 000000000000..be7ff4f49e8c
--- /dev/null
+++ b/drivers/input/keyboard/ma35d1_keypad.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  MA35D1 keypad driver
+ *  Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/bitops.h>
+#include <linux/pm_wakeirq.h>
+
+/* Keypad Interface Registers */
+#define KPI_CONF		0x00
+#define KPI_3KCONF		0x04
+#define KPI_STATUS		0x08
+#define KPI_RSTC		0x0C
+#define KPI_KEST		0x10
+#define KPI_KPE0		0x18
+#define KPI_KPE1		0x1C
+#define KPI_KRE0		0x20
+#define KPI_KRE1		0x24
+#define KPI_PRESCALDIV		0x28
+
+/* KPI_CONF - Keypad Configuration Register */
+#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
+#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
+#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
+#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
+#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
+#define INTEN		BIT(3) /* Key Interrupt Enable Control */
+#define RKINTEN	BIT(2) /* Release Key Interrupt Enable */
+#define PKINTEN	BIT(1) /* Press Key Interrupt Enable Control */
+#define ENKP		BIT(0) /* Keypad Scan Enable */
+
+/* KPI_STATUS - Keypad Status Register */
+#define PKEY_INT	BIT(4) /* Press key interrupt */
+#define RKEY_INT	BIT(3) /* Release key interrupt */
+#define KEY_INT	BIT(2) /* Key Interrupt */
+#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
+#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
+
+#define KEY_EVENT_BITS 64
+
+struct ma35d1_keypad {
+	struct clk *clk;
+	struct input_dev *input_dev;
+	void __iomem *mmio_base;
+	int irq;
+	unsigned int kpi_row;
+	unsigned int kpi_col;
+	unsigned int debounce_val;
+	unsigned int pre_scale;
+	unsigned int pre_scale_divider;
+};
+
+static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
+{
+	struct input_dev *input_dev = keypad->input_dev;
+	unsigned int code;
+	unsigned int key;
+	unsigned long pressed_keys = 0, released_keys = 0;
+	unsigned int row_shift = get_count_order(keypad->kpi_col);
+	unsigned short *keymap = input_dev->keycode;
+	unsigned long key_event[4];
+	unsigned int index;
+
+	/* Read key event status */
+	key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
+	key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
+	key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
+	key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
+
+	/* Clear key event status */
+	writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
+	writel(key_event[1], (keypad->mmio_base + KPI_KPE1));
+	writel(key_event[2], (keypad->mmio_base + KPI_KRE0));
+	writel(key_event[3], (keypad->mmio_base + KPI_KRE1));
+
+	pressed_keys  = key_event[0] | key_event[1] << 32;
+	released_keys = key_event[2] | key_event[3] << 32;
+
+	/* Process pressed keys */
+	for_each_set_bit(index, &pressed_keys, KEY_EVENT_BITS) {
+		code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
+		key = keymap[code];
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, key, 1);
+	}
+
+	/* Process released keys */
+	for_each_set_bit(index, &released_keys, KEY_EVENT_BITS) {
+		code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
+		key = keymap[code];
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, key, 0);
+	}
+
+	input_sync(input_dev);
+}
+
+static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
+{
+	struct ma35d1_keypad *keypad = dev_id;
+	unsigned int  kstatus;
+
+	kstatus = readl(keypad->mmio_base + KPI_STATUS);
+
+	if (kstatus & (PKEY_INT | RKEY_INT)) {
+		ma35d1_keypad_scan_matrix(keypad, kstatus);
+	} else {
+		if (kstatus & PDWAKE)
+			writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_keypad_open(struct input_dev *dev)
+{
+	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
+	unsigned int val, config;
+
+	val = RKINTEN | PKINTEN | INTEN | ENKP;
+	val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
+
+	if (keypad->debounce_val > 0)
+		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
+			 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
+	else
+		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
+
+	val |= config;
+
+	writel(val, keypad->mmio_base + KPI_CONF);
+	writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
+
+	return 0;
+}
+
+static void ma35d1_keypad_close(struct input_dev *dev)
+{
+	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
+	unsigned int val;
+
+	val = readl(keypad->mmio_base + KPI_KPE0) & ~ENKP;
+	writel(val, keypad->mmio_base + KPI_CONF);
+}
+
+static int ma35d1_keypad_probe(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad;
+	struct input_dev *input_dev;
+	struct resource *res;
+	int error = 0;
+
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(keypad->mmio_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->mmio_base),
+					"failed to remap I/O memor\n");
+
+	keypad->irq = platform_get_irq(pdev, 0);
+	if (keypad->irq < 0) {
+		dev_err(&pdev->dev, "failed to get IRQ\n");
+		return keypad->irq;
+	}
+
+	keypad->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(keypad->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->clk), "failed to get core clk\n");
+
+	error = matrix_keypad_parse_properties(&pdev->dev, &keypad->kpi_row, &keypad->kpi_col);
+	if (error) {
+		dev_err(&pdev->dev, "failed to parse keypad params\n");
+		return error;
+	}
+
+	error = matrix_keypad_build_keymap(NULL, NULL, keypad->kpi_row, keypad->kpi_col,
+					   NULL, input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to build keymap\n");
+		return error;
+	}
+
+	keypad->input_dev = input_dev;
+	input_dev->name = pdev->name;
+	input_dev->id.bustype = BUS_HOST;
+	input_dev->open = ma35d1_keypad_open;
+	input_dev->close = ma35d1_keypad_close;
+	input_dev->dev.parent = &pdev->dev;
+
+	error = device_property_read_u32(&pdev->dev, "debounce-period", &keypad->debounce_val);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'debounce-period'\n");
+		return error;
+	}
+
+	keypad->debounce_val = __builtin_ctz(keypad->debounce_val);
+
+	error = device_property_read_u32(&pdev->dev, "key-scan-time", &keypad->pre_scale);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'key-scan-time'\n");
+		return error;
+	}
+
+	device_property_read_u32(&pdev->dev, "key-scan-time-div", &keypad->pre_scale_divider);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'key-scan-time-div'\n");
+		return error;
+	}
+
+	__set_bit(EV_REP, input_dev->evbit);
+	input_set_drvdata(input_dev, keypad);
+	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+
+	error = devm_request_irq(&pdev->dev, keypad->irq, ma35d1_keypad_interrupt,
+				 IRQF_NO_SUSPEND, pdev->name, keypad);
+	if (error) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		return error;
+	}
+
+	platform_set_drvdata(pdev, keypad);
+	device_init_wakeup(&pdev->dev, 1);
+
+	error = dev_pm_set_wake_irq(&pdev->dev, keypad->irq);
+	if (error) {
+		dev_err(&pdev->dev, "failed to enable irq wake\n");
+		return error;
+	}
+
+	error = input_register_device(input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		return error;
+	}
+
+	return 0;
+}
+
+static void ma35d1_keypad_remove(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
+
+	input_unregister_device(keypad->input_dev);
+}
+
+static int ma35d1_keypad_suspend(struct device *dev)
+{
+	struct ma35d1_keypad *keypad = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
+
+	return 0;
+}
+
+static int ma35d1_keypad_resume(struct device *dev)
+{
+	struct ma35d1_keypad *keypad = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
+		       keypad->mmio_base + KPI_CONF);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_pm_ops, ma35d1_keypad_suspend, ma35d1_keypad_resume);
+
+static const struct of_device_id ma35d1_kpi_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-kpi"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ma35d1_kpi_of_match);
+
+static struct platform_driver ma35d1_keypad_driver = {
+	.probe		= ma35d1_keypad_probe,
+	.remove		= ma35d1_keypad_remove,
+	.driver		= {
+		.name	= "ma35d1-kpi",
+		.pm	= pm_sleep_ptr(&ma35d1_pm_ops),
+		.of_match_table = ma35d1_kpi_of_match,
+	},
+};
+module_platform_driver(ma35d1_keypad_driver);
+
+MODULE_AUTHOR("Ming-Jen Chen");
+MODULE_DESCRIPTION("MA35D1 Keypad Driver");
+MODULE_LICENSE("GPL");
+
-- 
2.25.1


