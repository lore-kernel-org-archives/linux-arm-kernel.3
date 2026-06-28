Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632C8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IBaHFX9Be7DBrJkATbubRf0Jx3rdSox++MCYVDd3d4=; b=RoRDvjdE8kPZCGSJxFwpxhHjiw
	7nrpwLeP8iA0ngaG4NQuAB3BEZDCOIOBF2qPmDyW8o6gtPKZUTyr1slBorNWIajSXh87U7ZoGaUyk
	nFNHQK2+csx/fafRUXRZQtNdxgmIxCE9sOvAcfJLgn4O213bRt4CON5uJAAEzLsWqCOYQTOgDSD25
	xh4sX2/OwpZVAssSPZGjf0AEWiOBPCx1+pvN584nU5x9pquBVuFr4wuECE2LWoVXZiq9xPiQIXAfD
	9Azx9eFcQobfQhZCYOQ4TiCycsGyrdA2GJgI1KvqvTVCyrxrMq/gCUWLv3njaG23pkTmBE8FdTYBo
	pXM0HbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvft-0000000DLSq-2YjZ;
	Sun, 28 Jun 2026 20:00:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfd-0000000DLBC-0VHf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:00:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493a5392c60so4313755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676799; x=1783281599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IBaHFX9Be7DBrJkATbubRf0Jx3rdSox++MCYVDd3d4=;
        b=Z01ix+FL6MDlBRmXgUoGIAnrQjJ8VOul7RNVqn6i7JJHrctG2cnK1UH2A+jC07P3HB
         LDfRlZ/nE9xE2fB+AOpXH004IzLOVGGZeOJMSMK8ImOd6IHXAZBrqvmMG6gN3nxsPGwE
         bXvMngAkO3SKiUETgTI8CuqYxpIp/AM3aiKxHsypPnR5W0TvDimn5667n/zS3e9KP74E
         IF8fJrPf7F6Ih6c6uBzHZVTFVKxc5uP1pZ6EyZg0v6h3AZNGThcQcYyPUi6TzXX5ssFw
         GV4EEgO3uYQsySkcx+ZjFKD2CNYnN83DlgYcae9c4OT5Y2IRjo/3IrWYkycebpCEUyij
         Vlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676799; x=1783281599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IBaHFX9Be7DBrJkATbubRf0Jx3rdSox++MCYVDd3d4=;
        b=e59SR8/lLcmRiWM9SHZtb3QE9m2HYIi2pWUAHebpK2Bql7dcQDCmQ875Fdj6CKhum2
         dtAYXSUn77wNowcx22EgpjplDQEKCJrcZ6LJai6Fhu7ESNcdaL1YiIL8SwA1tTiEpssg
         GD01Y219BToXsZIkvOpKmX2Pcl5J0AvzV3e3ZuQEggd60Fi/Z0zo6B6ix+wFHOQBrX/M
         t9YITcK/QPXLJodUt/mIEf68VZ5Rz0ti8UBfcr1PP6gfkLGMoQQkGRK8xbRFr8rHo2fC
         MYrPbG5rB/bBWctheqIejIn9lBtYFZ5uUCTrkEYMYUIdbFGjzLLLXTTCo+0uGjjOtS4P
         FcIg==
X-Forwarded-Encrypted: i=1; AFNElJ9ynI1f73QiXYQfn8BX8E33Z7mbMhGzwrgEJXdVSqePGTmhiY9Oeapae8J0tFaHH9ieeAg+mb9ikI5nsYMsE/Yj@lists.infradead.org
X-Gm-Message-State: AOJu0YwP3nxZFi3Aw4mmYMk1NfqMQbNal0VRyDgpHb9qiB6wIaA1mqgH
	Dh/UFy69JSDXt7wY/0kYJK9paRSA01B/h8tmrHqU0HhrJDA8HoxKaGU/
X-Gm-Gg: AfdE7clqtQxaTq2wk+5hpQ2Wj+eUH3YkQgKyl8Rok/MbARUFAkudCvQ1+J2ZjnWYqSH
	3pCBVinKyOkXs0+cW1DN7FVSdXzU2C7VFrgJOPmBwsZ/2bNxPPTUUU1nTTGQnX5jCHFjKaqGk90
	Oepbb0kXfJD2AS++rLQgChc46/sVlcDDHso+1AxLvGaNV1TwwV11gN2JYPh0eaqNxNg5mfLPHn4
	UxTsVazICwqKIwrvimvA04L5L9Ha/lAgaLclUI169mNAwV6eDq9bYK4cuCe7E+XzYV19vdJIQeh
	uP671zwltTJpUrires96TUhWCKZSMf6VYgsCh6JEnt1gpjwS5xPDaK3nEfTOMdp1zszevZnGvTx
	FBbvrWRZeZxknlfdNtYVZxZTVEv8iW6KYt7LW28kXQSrwZK1uQ/NBqZcJ4b9Z9Q1GGnQwX7vxCc
	yh3t1vyBW4PY8+xhXiQwNwLUv1ZNLRRCIPyA==
X-Received: by 2002:a05:600c:4f8f:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-492668b7599mr224459325e9.35.1782676799009;
        Sun, 28 Jun 2026 12:59:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:06 +0300
Subject: [PATCH RFC v5 11/12] reset: zte: Add a zx297520v3 reset driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-11-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13545;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=/CQpTlotbzPYpIJ69qav2c2bpg2j/44eapr4r0tSHxs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UxSQI4x16IJpQHyP1555cgJ2jZJSaW4j0P
 trrg3MMuD+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIb3w/8CpbFTXZ21sv60yRIv6gXcovbCYFIfTe
 NovMx6ipbTm2Tm685BSufr0h/Am9rJZYztfLpyxuD0CQvy52yXW8PK4xOnydSfnC5GIKxPYXtm9
 L7IucXQPuCClWQ5lxndm3ovmbiSrVuFqS1cvnOHuiV3BsLo6OIR1Kqz+9lcGhEdHhc9H/lvw5Zy
 S2k0hjZ6E2Z7V/E2xEAw/NDuWLmbKW4dMFDtvnlHOt8JvIHNFkyQOeBDsDKJ/XdsxwMUWKSwb8J
 wdigVmEfICDh+pGRg9jQrMZ4icQHLga3R1StbLx6HEFjCk8PjnLhNbEil8I4N+QEPDpeYjSso4A
 eRYcOTnKu856+fLEd2/frZjFzM4WSARXHL+hXxjjLsXiJl0TIs9eqaQiY0o9KETPykgzore458X
 K2+eWMgs6TlGNbCR9Larw+A2ZmJV9J8MghLy+ZsANwRD5krdQ6MxIu1cDjvezsbxDkgPNFoUQb3
 HNEKjJxhGu3nR9cNXrjbWLjKc4Xf+ukcjMOJaOeqz47syelKTe2lWoiRzZZoACD/5kNQaaf/Vdp
 1GsjjWccj8zepEtV3l8K9p39prGLcBxK48rwEJeNvb+nDnSxvEKPOuWZJI44s2OWy/eCi2p37en
 AhA7Z6a/HKJfHMcF09wuYxNn1E4Tp8D72a3xAceuGjKshwilsJF0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_130001_318699_AC8F8A3B 
X-CRM114-Status: GOOD (  27.92  )
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

This drives the MFD child devices created by the zx297520v3-crm driver
as well as the aux device created by the zx297520v3-lspclk driver.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

v5:
Make top and matrix MFD children instead of aux devices
Split USB PHY reset into its own reset ID
Remove USB reset wait code - this will be handled via syscon from a
future minimal phy-zx29-usb driver
---
 MAINTAINERS                          |   1 +
 drivers/reset/Kconfig                |  11 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 274 +++++++++++++++++++++++++++++++++++
 4 files changed, 287 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 297c15a2c860..d96bfb51c90e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3872,6 +3872,7 @@ F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
+F:	drivers/reset/reset-zte-zx297520v3.c
 F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..116dd23f1b8e 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -404,6 +404,17 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on (ARCH_ZTE || COMPILE_TEST)
+	default CLK_ZTE_ZX297520V3
+	select AUXILIARY_BUS
+	help
+	  This enables the reset controller for ZTE zx297520v3 SoCs. The reset
+	  controller is part of the clock controller on this SoC. This driver
+	  operates on an auxiliary device exposed by the clock driver. Enable
+	  this driver if you plan to boot the kernel on a zx297520v3 based SoC.
+
 config RESET_ZYNQ
 	bool "ZYNQ Reset Driver" if COMPILE_TEST
 	default ARCH_ZYNQ
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..9a8a48d44dc4 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -50,5 +50,6 @@ obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
 obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o
 obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
+obj-$(CONFIG_RESET_ZTE_ZX297520V3) += reset-zte-zx297520v3.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-zte-zx297520v3.c
new file mode 100644
index 000000000000..8ef434904230
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/iopoll.h>
+
+/* Most devices on the zx297520v3 SoC have one reset bit per clock line. As a rule of thumb, the
+ * lower bit disconnects the device from the bus, similarly to turning off PCLK - registers read 0
+ * or hang indefinitely. Unlike PCLK, this reset may have a lingering effect after deasserting.
+ * E.g. timers will be disabled, but retain their counter value.
+ *
+ * The other bit resets the actual device registers.
+ *
+ * For some devices, e.g. GMAC, the reset bits behave in the same way: They disconnect the device
+ * and registers will have their default state after deasserting. For devices that have both reset
+ * bits, both need to be deasserted for the device to function.
+ */
+struct zte_reset_reg {
+	u32 mask;
+	u16 reg;
+};
+
+struct zte_reset_info {
+	const struct zte_reset_reg *resets;
+	unsigned int num;
+};
+
+struct zte_reset {
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+	const struct zte_reset_reg *resets;
+};
+
+static inline struct zte_reset *to_zte_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct zte_reset, rcdev);
+}
+
+static int zx29_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_clear_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+
+	return regmap_set_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+}
+
+static int zx29_rst_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zte_reset *rst = to_zte_reset(rcdev);
+	int res;
+
+	res = regmap_test_bits(rst->map, rst->resets[id].reg, rst->resets[id].mask);
+	if (res < 0)
+		return res;
+
+	return !res;
+}
+
+static const struct reset_control_ops zx29_rst_ops = {
+	.assert		= zx29_rst_assert,
+	.deassert	= zx29_rst_deassert,
+	.status		= zx29_rst_status,
+};
+
+static const struct zte_reset_reg zx297520v3_top_resets[] = {
+	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for the LTE DSP
+	 * coprocessor. Clocks for it are in matrixcrm.
+	 */
+	[ZX297520V3_ZSP_RESET]       = { .reg = 0x13c, .mask = BIT(0)            },
+
+	[ZX297520V3_UART0_RESET]     = { .reg =  0x78, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_I2C0_RESET]      = { .reg =  0x74, .mask = BIT(8)  | BIT(9)  },
+	/* Only one reset. Bit 5 is settable but does not do anything observable */
+	[ZX297520V3_RTC_RESET]       = { .reg =  0x74, .mask = BIT(4)            },
+	[ZX297520V3_TIMER_T08_RESET] = { .reg =  0x78, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T09_RESET] = { .reg =  0x78, .mask = BIT(2)  | BIT(3)  },
+	/* Only one reset. Bit 0 is settable but does not do anything observable */
+	[ZX297520V3_PMM_RESET]       = { .reg =  0x74, .mask = BIT(1)            },
+
+	/* I haven't found any clocks for GPIO. It probably wouldn't make much
+	 * sense anyway. Only one reset bit per controller.
+	 */
+	[ZX297520V3_GPIO_RESET]      = { .reg =  0x74, .mask = BIT(3)            },
+	[ZX297520V3_GPIO8_RESET]     = { .reg =  0x74, .mask = BIT(2)            },
+
+	[ZX297520V3_TIMER_T12_RESET] = { .reg =  0x74, .mask = BIT(6)  | BIT(7)  },
+	[ZX297520V3_TIMER_T13_RESET] = { .reg =  0x7c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_TIMER_T14_RESET] = { .reg =  0x7c, .mask = BIT(2)  | BIT(3)  },
+	[ZX297520V3_TIMER_T15_RESET] = { .reg =  0x74, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_TIMER_T16_RESET] = { .reg =  0x7c, .mask = BIT(4)  | BIT(5)  },
+	[ZX297520V3_TIMER_T17_RESET] = { .reg = 0x12c, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_WDT_T18_RESET]   = { .reg =  0x74, .mask = BIT(12) | BIT(13) },
+	[ZX297520V3_USIM1_RESET]     = { .reg =  0x74, .mask = BIT(14) | BIT(15) },
+	[ZX297520V3_AHB_RESET]       = { .reg =  0x70, .mask = BIT(0)  | BIT(1)  },
+
+	/* USB reset. 0x84 returns the USB device status (0x1 for HSIC up, 0x2 for USB up, but
+	 * all 3 bits (PCLK, WCLK, PHY) need to be deasserted for the device to report ready.
+	 * Thus polling the status is the responsibility of the USB PHY driver.
+	 */
+	[ZX297520V3_USB_PHY_RESET]   = { .reg =  0x80, .mask = BIT(3)            },
+	[ZX297520V3_USB_RESET]       = { .reg =  0x80, .mask = BIT(4) | BIT(5)   },
+	[ZX297520V3_HSIC_PHY_RESET]  = { .reg =  0x80, .mask = BIT(0)            },
+	[ZX297520V3_HSIC_RESET]      = { .reg =  0x80, .mask = BIT(1) | BIT(2)   },
+};
+
+static const struct zte_reset_info zx297520v3_top_info = {
+	.resets = zx297520v3_top_resets,
+	.num = ARRAY_SIZE(zx297520v3_top_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_matrix_resets[] = {
+	[ZX297520V3_CPU_RESET]       = { .reg =  0x28, .mask = BIT(1)            },
+	[ZX297520V3_EDCP_RESET]      = { .reg =  0x68, .mask = BIT(0)            },
+	[ZX297520V3_SD0_RESET]       = { .reg =  0x58, .mask = BIT(1)            },
+	[ZX297520V3_SD1_RESET]       = { .reg =  0x58, .mask = BIT(0)            },
+	[ZX297520V3_NAND_RESET]      = { .reg =  0x58, .mask = BIT(4)            },
+	[ZX297520V3_PDCFG_RESET]     = { .reg =  0x94, .mask = BIT(20)           },
+	[ZX297520V3_SSC_RESET]       = { .reg =  0x94, .mask = BIT(24)           },
+	[ZX297520V3_GMAC_RESET]      = { .reg = 0x114, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_VOU_RESET]       = { .reg = 0x16c, .mask = BIT(0)            },
+};
+
+static const struct zte_reset_info zx297520v3_matrix_info = {
+	.resets = zx297520v3_matrix_resets,
+	.num = ARRAY_SIZE(zx297520v3_matrix_resets),
+};
+
+static const struct zte_reset_reg zx297520v3_lsp_resets[] = {
+	[ZX297520V3_TIMER_L1_RESET]  = { .reg = 0x04,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L2_RESET]    = { .reg = 0x08,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_L3_RESET]    = { .reg = 0x0c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_PWM_RESET]       = { .reg = 0x10,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2S0_RESET]      = { .reg = 0x14,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x18: Not writeable */
+	[ZX297520V3_I2S1_RESET]      = { .reg = 0x1c,  .mask = BIT(8)  | BIT(9)  },
+	/* 0x20: Not writeable */
+	[ZX297520V3_QSPI_RESET]      = { .reg = 0x24,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART1_RESET]     = { .reg = 0x28,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_I2C1_RESET]      = { .reg = 0x2c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI0_RESET]      = { .reg = 0x30,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LB_RESET]  = { .reg = 0x34,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LC_RESET]  = { .reg = 0x38,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_UART2_RESET]     = { .reg = 0x3c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_WDT_LE_RESET]    = { .reg = 0x40,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_LF_RESET]  = { .reg = 0x44,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_SPI1_RESET]      = { .reg = 0x48,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TIMER_L11_RESET] = { .reg = 0x4c,  .mask = BIT(8)  | BIT(9)  },
+	[ZX297520V3_TDM_RESET]       = { .reg = 0x50,  .mask = BIT(8)  | BIT(9)  },
+};
+
+static const struct zte_reset_info zx297520v3_lsp_info = {
+	.resets = zx297520v3_lsp_resets,
+	.num = ARRAY_SIZE(zx297520v3_lsp_resets),
+};
+
+static int reset_zx297520v3_common_probe(struct device *dev,
+					 struct device_node *of_node,
+					 const struct zte_reset_info *drv_info)
+{
+	struct zte_reset *rst;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->resets = drv_info->resets;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = drv_info->num;
+	rst->rcdev.ops = &zx29_rst_ops;
+	rst->rcdev.of_node = of_node;
+	rst->rcdev.dev = dev;
+
+	rst->map = device_node_to_regmap(of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon regmap\n");
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+
+}
+
+static int reset_zx297520v3_aux_probe(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	return reset_zx297520v3_common_probe(&adev->dev, adev->dev.of_node,
+					     (const struct zte_reset_info *)id->driver_data);
+}
+
+static int reset_zx297520v3_top_probe(struct platform_device *pdev)
+{
+	return reset_zx297520v3_common_probe(&pdev->dev, pdev->dev.parent->of_node,
+					     &zx297520v3_top_info);
+}
+
+static struct platform_driver reset_zx297520v3_top = {
+	.probe = reset_zx297520v3_top_probe,
+	.driver = {
+		.name = "zx297520v3-toprst",
+	},
+};
+
+static int reset_zx297520v3_matrix_probe(struct platform_device *pdev)
+{
+	return reset_zx297520v3_common_probe(&pdev->dev, pdev->dev.parent->of_node,
+					     &zx297520v3_matrix_info);
+}
+
+static struct platform_driver reset_zx297520v3_matrix = {
+	.probe = reset_zx297520v3_matrix_probe,
+	.driver = {
+		.name = "zx297520v3-matrixrst",
+	},
+};
+
+static const struct auxiliary_device_id reset_zx297520v3_ids[] = {
+	{
+		.name = "clk_zte.zx297520v3_lsprst",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lsp_info,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, reset_zx297520v3_ids);
+
+static struct auxiliary_driver reset_zx297520v3_auxdrv = {
+	.name = "zx297520v3_lsp_reset",
+	.id_table = reset_zx297520v3_ids,
+	.probe = reset_zx297520v3_aux_probe,
+};
+
+static struct platform_driver * const reset_zx297520v3_mfddrv[] = {
+	&reset_zx297520v3_top,
+	&reset_zx297520v3_matrix,
+};
+
+static int __init reset_zx297520v3_init(void)
+{
+	int res;
+
+	res = auxiliary_driver_register(&reset_zx297520v3_auxdrv);
+	if (res)
+		return res;
+
+	res = platform_register_drivers(reset_zx297520v3_mfddrv,
+					ARRAY_SIZE(reset_zx297520v3_mfddrv));
+	if (res)
+		auxiliary_driver_unregister(&reset_zx297520v3_auxdrv);
+
+	return res;
+}
+
+static void __exit reset_zx297520v3_exit(void)
+{
+	platform_unregister_drivers(reset_zx297520v3_mfddrv,
+				    ARRAY_SIZE(reset_zx297520v3_mfddrv));
+	auxiliary_driver_unregister(&reset_zx297520v3_auxdrv);
+}
+
+module_init(reset_zx297520v3_init);
+module_exit(reset_zx297520v3_exit);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0


