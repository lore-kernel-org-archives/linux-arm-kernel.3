Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbIl8VRXlSPGdrcFD2TJlQ5UkGK0/MPge1i4mB+YMlU=; b=FBOjUfAdooYqur/HYnUEIEIEri
	rLk7Inz+c2tdvYflytkSU7InVE298JJ+fzzFrQZlUxe4lbsHgJ1aXze5T3hDcPLkh2EEZzaDYz1Fc
	DiY65sfWiqSFZzFuDVGGmAH3RYM2E2unNCYb3G/WbARCimlZArckeRnaB8F7PhmnTtaE24StdvFiE
	HPezBahwH2ILyi2u07rejVmKZIhgld3yIWOqnMTO5HOHYyiCKi00ZvR4xQ9uFl3aXdueDT8qv38TZ
	4eFzr/OZZBqWKecHIHbNg3jwB4ZQrScjrSE1JMXF5ykCVxBemU0BfxTa6UvU6snr7eKG/55XdVq7S
	o56u1sJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO27-00000005S4o-3qHk;
	Thu, 02 Jul 2026 20:29:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO25-00000005RzT-0KUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:29:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493b27c7451so9969735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024151; x=1783628951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbIl8VRXlSPGdrcFD2TJlQ5UkGK0/MPge1i4mB+YMlU=;
        b=Xi2/onKOnZ9R/ttLb9YS2vJl8hH0c9+jp0U7C3nPC5qx9wlLzEV/ho8N+L8qKUChk3
         I8x5+D1BwbaxCHS9U3xNuqDMzR0+KzsPZN/rSUKcD9NHl/j/yoXRw3pzrEVaeJ0Jc4nR
         XGaQH9e7Tt4VAoOLFsgoQBzX1vhCBERDY8p3/qXK2FHu6F1OQyepfd8Ur55YgifjjbnL
         tJS3G7/veG7Sw2VRygcaUy+jQrUW3SGnQW8popqCk5ZTcM0JRbgotg+lYLlQb9qwh3h+
         bP5w1wmyVvgwiD+NtkptIVr6w8zxTdmN+IsvJ5JsrDDcTguFANO3pY7UNM5iv4iwbC34
         tamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024151; x=1783628951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AbIl8VRXlSPGdrcFD2TJlQ5UkGK0/MPge1i4mB+YMlU=;
        b=fQTd3ic8EUKfc6wUNxAgl7RZSZT6ncwAUCTHU15CzRmI2vQ7os4R3CcVPvNH1UMl59
         NlOQPJ8VfteN+VIlAV/7c/rzbRxSHYEh18zpZjBFm01SCeePChSxErjtM7v4ETcuFEYh
         xxWrnFfjhFQcxcnECWCpGK/mp9bhefdoyiT6yNjIGlgjsM301gaVffW1PkVdB0DbyaQc
         4NGyrQJOrjSBBMyQ9R6BkivDjLz40wXDqW/yZh/5YY+ul/jGlu+0GVVRaUBNufx/AoC/
         svlnfOW93DwwTwtSm5MATHp6agqSGkprTOc6wzQfMg4i5FaNMoG+MXCxjACjSOM4lKGJ
         n6GA==
X-Forwarded-Encrypted: i=1; AFNElJ85Dbmk1CxMcFo0JzrAfvVmrIH6oS/mQEox9qezs9bMjU0SiOBqzNrX7UKPfBVTNQN/nouFP+DcoMnnBctqA0P3@lists.infradead.org
X-Gm-Message-State: AOJu0YyzpTIGYDgyQe4ppT9Hpk73liPR83nE3b0xcIC6poOkjBTy+3K0
	ojOxGuZRMeflvcmhyfUqmyCR4PwPLq4N5yNb2p55CPPRWsPT4AxEVOSS
X-Gm-Gg: AfdE7cltAlWABXobqmt9aZ0ntkcLvhCiaf6uVZmjSm/mXqj+Jptus6XCF7V+K3z+wA0
	MWwo0C2TskNDUdYuvYB+nWs70j34Qj22YpZAA7NtO2trhGqmHzTUSGckZ1UnmoKjcympNoyPaXL
	Q1lzgbOtM4Dmx2oyV1DzQiWX9QBSzrkIUDLTHe3QVEHO+NonTsO3rLW/0pILTt7RpYni9jc0gGV
	5eAJerWIEd31E/8w8CgzlbFshO6xwrKcvWX1El4Qey1h0BcNv27jaqaVvOi5rpElw6RfgQvsXDr
	1iP3PjBFgVnRbPpK9E6fOWmPfT9GbQtrt3uSxMSFrcOnuekyakqbTW9VtYbTDgtHK0ywOcZhLxI
	eO47CkWyYhP1pjOrhHKzydnZ9qgHMgZQO7iPzqWDvcZIFsvGAR2ZXklSl1f3HkCc9X4RLejK54u
	lzqo7eNwWCNrZ+DQ/j8qxUHj0p8B+rHv141Q==
X-Received: by 2002:a05:600c:a011:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493c9b0d55dmr19197315e9.0.1783024151132;
        Thu, 02 Jul 2026 13:29:11 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:29:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:06 +0300
Subject: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12642;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=1pncOoOg5ewdqPfNJ6bVuvBmpK2pIqGI1AcsPbjCoq4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnqjdkjSu5KKNh2ratJnHLat10SwJMWhf6TO
 7W5GXNQZeyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIZVQ/+IBE2sQn6TLZGR5KrqP8c3mdS9tu3O/z
 PuPtc6MFbo3IgWju3a6Cxtq59zbhqQBC/O9XFRnNkL/Px6Iw0ATh+Ei01yA5SysCRWWrBek7e80
 LvKVUdTEWmuYNkcqvMlorZUpHtVYvcHYceuGmarp73WGeetEfMQdoDqnCsVqWlfQJfQKg5A2PJi
 vPMpIlpOfQiTgHhNCgGJhJxJeKUAnalMxxHVzsT6odBV2eTCjq28dAwJnvJpD4bxJ+EN462XrAF
 lYgS/Mfq+/6Gy7xX8ZTN4wqChodMYae5QmSvxtpUR1aSd0UCOlj3CgNKBq5dc6W3OsiKdIKi2io
 VpaUw10TmGAETMr/oZrjhsli9FqdB2aO7w0LkVsYRWe6G1TeqKn/4hC9uRjvp/O1CW2VYQvOX3J
 hc1iIyvhzERhaUd9PFLOzRCGmDBz9k4OA26xTbF7cINS3oCbQGsheUuCOyAb+cAHa8ht4/4gyaG
 T9wll/u5sXxZYahHPh1PJOZU7TcQ+93hvOMOdZSFJzVpA0VvP9IEVsppGT/huEiCsjBVM2hE5gp
 d+OXwFzOPIBY2eVodtMiQ+YpJhmpblOds/YUKfbPzZLPppGL1ytMR5bMu1dmVjPxy6GwwLIeQb/
 YZ69FqOWY/m34GF1Yliho9Q5+kk84RWb6CBWGzG4MXDLm+lDCMNU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132913_209207_3587D8EC 
X-CRM114-Status: GOOD (  28.53  )
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

v6:
Add a comment wrt checking all bits in .status() (Philipp)
include cleanup (Philipp, Sashiko)

v5:
Make top and matrix MFD children instead of aux devices
Split USB PHY reset into its own reset ID
Remove USB reset wait code - this will be handled via syscon from a
future minimal phy-zx29-usb driver
---
 MAINTAINERS                          |   1 +
 drivers/reset/Kconfig                |  10 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 234 +++++++++++++++++++++++++++++++++++
 4 files changed, 246 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f2e436cb42b..084d30fec1cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
+F:	drivers/reset/reset-zte-zx297520v3.c
 F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..4dca1f89d22b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -404,6 +404,16 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on ZTE_ZX297520V3_CRM || COMPILE_TEST
+	default SOC_ZX297520V3
+	help
+	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
+	  controllers are part of the clock and reset management controllers on
+	  this board, so you will also need ZTE_ZX297520V3_CRM. Enable this if
+	  you are building a kernel for a ZTE x297520v3 based board.
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
index 000000000000..75a9e6e93cda
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+
+/* Most devices on the zx297520v3 SoC have one reset bit per clock line. As a rule of thumb, the
+ * lower bit disconnects the device from the bus, similarly to turning off PCLK - registers read 0
+ * or hang indefinitely. Unlike PCLK, this reset may have a lingering effect after deasserting.
+ * E.g. timers will be disabled, but retain their counter value.
+ *
+ * The other bit resets the actual device registers.
+ *
+ * For some devices, e.g. GMAC, both reset bits behave in the same way: They disconnect the device
+ * and registers will have their default state after deasserting. For devices that have two reset
+ * bits, both need to be deasserted for the device to function.
+ */
+struct zte_reset_reg {
+	u32 mask;
+	u16 reg;
+};
+
+struct zte_reset_data {
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
+	/* Devices with two reset bits need both deasserted to work. So only report them as
+	 * deasserted if both bits are set.
+	 *
+	 * assert()/deassert() will always clear/set both. The only reason a device might be in a
+	 * hybrid state is an unexpected handover state from the bootloader.
+	 */
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
+static const struct zte_reset_data zx297520v3_topreset_data = {
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
+static const struct zte_reset_data zx297520v3_matrixreset_data = {
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
+static const struct zte_reset_data zx297520v3_lspreset_data = {
+	.resets = zx297520v3_lsp_resets,
+	.num = ARRAY_SIZE(zx297520v3_lsp_resets),
+};
+
+static int reset_zx297520v3_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = dev->parent->of_node;
+	const struct zte_reset_data *data;
+	struct zte_reset *rst;
+
+	if (!id)
+		return -ENODEV;
+	data = (const struct zte_reset_data *)id->driver_data;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->resets = data->resets;
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.nr_resets = data->num;
+	rst->rcdev.ops = &zx29_rst_ops;
+	rst->rcdev.of_node = of_node;
+	rst->rcdev.dev = dev;
+
+	rst->map = device_node_to_regmap(of_node);
+	if (IS_ERR(rst->map))
+		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get parent syscon regmap\n");
+
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct platform_device_id reset_zx297520v3_ids[] = {
+	{
+		.name = "zx297520v3-topreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_topreset_data,
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixreset_data,
+	},
+	{
+		.name = "zx297520v3-lspreset",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lspreset_data,
+	},
+	{ }
+};
+
+static struct platform_driver reset_zx297520v3 = {
+	.probe = reset_zx297520v3_probe,
+	.driver = {
+		.name = "reset-zx297520v3",
+	},
+	.id_table = reset_zx297520v3_ids,
+};
+module_platform_driver(reset_zx297520v3);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0


