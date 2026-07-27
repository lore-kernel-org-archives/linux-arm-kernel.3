Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA81C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLf4jEdNQ3a8U1r9I6rVIwBuhXSWDd0BCBTUaYYL+EY=; b=KgExu+pQ3DnLQr/SvtwZyjtKpq
	hz187f3y84Lk5daKFHfDq31idml0IrYOLHxe1UjgyUTNmP8Getq8TibAUMizoAWgMtXRpjPPz7z/S
	OawXo0FgXFDhVqbCXVoVKuSTJVJp8YPGun0VROEMjLtKy8h7311SDv+SRbD4S/iEPOj0OO9INF9Xq
	ghd927LG+UzUdLcIqss1vtKfDxwRhj/X7EQaz+5PmoeN3RQQ2C/aNZvX8KLzdJWejcIcnIaYQWurn
	0z4JSmJ6d67CYeVv5rqg3hc0dsPvUNlL70WozKor5n4feoGTvt84vKiXn2PysFOs5j/sy6z4hmkeQ
	IbiKUi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ28-00000003eYM-0yUK;
	Mon, 27 Jul 2026 18:26:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ1w-00000003eLr-07Xc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:26:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495437bb891so1570765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176782; x=1785781582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLf4jEdNQ3a8U1r9I6rVIwBuhXSWDd0BCBTUaYYL+EY=;
        b=jvxwY7ecuzQvxbuZ9B1DcoFNvFmjWshamfoRGRkMSNMRiPaQNVWusdjptgj+zBuEcK
         QILhqxR5EUouFzngqrIItta/ckSzteG4VI4td5ONeGS3zdyaCBMejRGFqcdTHHqKeAS5
         8I9357kzC0YIH/AuBEwcH+ia9s/m/mDjHUPCw1KSp7otyocBuhTRc2qY4zvlku3SloWK
         etXrFO3i6112mzcvIIAMr4vU72TXLykpntnC5izR4V9lPMAIylaUpW8nABrzWxiHDghg
         JrEKzTiIQ8Gz/onzPHxjKhUKxNSM84Sj1eTcjnrJivGWiKQE2kot2ZwBd1XT4USClqof
         rilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176782; x=1785781582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLf4jEdNQ3a8U1r9I6rVIwBuhXSWDd0BCBTUaYYL+EY=;
        b=ibSWNQ08Z40Yvq5I7MH4BiQaNbQAjMCd8fD9Tn1oAmmynMcxk9c2EjfhtslPF+8sW4
         SW7U0oYryrqv/DdoUT5K75yIQj0K2n6K7KUNdVT6JTl1V5yDqWtKwzicBq8Sbgu11h8I
         zzd3b7BrJDk5KaHZOimNLTezFaCoF6hvI0ChkvyTC1vU387fS/S5MROeL1VQwzVkM4Gu
         b6lUktyORtDuzdM1NL4jpTydtCQFNYKzk/ZMP7+YMMuxPJf87blwPdD54/NBMvce4PYt
         xf/O3y1m9cg0GgyGTsB0+caprYCySznbtNEU/O+1k2H+JsIAx+WTDA3J/SLH/RvjzQk0
         4fYg==
X-Forwarded-Encrypted: i=1; AHgh+RrV1/w8DGW8LmjbbbF6GEJAiAS72zGZswYRLSTRTELpGjUirzMHJmyAdlilOMKuHctEq7hHtIGNwuToA/IW2UOb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj+1cetBcM57jBmblXNFMx+FDfBvxagqCTsObtrPLxftDg3Ph3
	Bx1X+1D5JOlko5e6+U9gZReFi6W+JF49wpMLfM5hJNTNPiXJGD6Juy3H
X-Gm-Gg: AR+sD126uVKRAVbooydi7VoLLyX6z6NJZhBq+xSTiDnOgDd1u0QaK2TJN0p8uwD4tWa
	FfY8WNSTaImWOMQpoi1foDUrOEHTNCk0EgJkXTiRUrPLC48W2BVhMaxchinvI0frsxr4Kfw5eqk
	86A/Ye6ovcyYpV9u6/Vg6QwIrRzl8FjusoXk7KOi5zaTVJMaKKt5f/awV+mD2D+lzWzMHzSa916
	MV5HRWdhOc11qVErx2m/ITHhVQ4t7zMJk04LTnzkBmhnA27vGMjDer+hm3inU/qr8blgMQ+YgfT
	yFEyMyT6mHqP5LqpnrcZYOXBiFkk1UROHLmK0BXKrvGaabNix+X1RIdIVTO7FkXx4D4tgZPSPRO
	Tqb45YICNHR2QZWKZndcYQ8ND8Zfa+9dfLs7vetQmByefdHQG1xm4EExsbkij/rdn8IZ3NqIR8W
	rw4SJl7IidsxBj
X-Received: by 2002:a05:600c:6090:b0:494:1f7:8057 with SMTP id 5b1f17b1804b1-496c46395e8mr9197315e9.1.1785176781689;
        Mon, 27 Jul 2026 11:26:21 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:26:21 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:26 +0300
Subject: [PATCH v8 11/12] reset: zte: Add a zx297520v3 reset driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-11-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13103;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=a6YLkKuSs4kJPaLRasXH9nzSp+z52nGcqRGH62P/fZ4=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J7Fuv2tLvcZeKsC/LkvyqmN6TPp/37diL+k
 +/HV3lrOIOJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiexsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLOjw//Vi+RMdP+BC8l8ucqzUIqbQs8YMYcFh7
 rteAqZFo5LJbWP0cNhZBJ7zgAfQnMYq1Lfjrq80ko+0BHtVUVtU1uVpHRha8J1dU+itV7xw+Zxd
 x0LfMEfVF7aXiErUXkZxWz2hZ/U96mXqP/sZk6VCaMGv0hDVQXw7AtA6WoNwl+X7UhqHp68HDGc
 CQedqGDxMjvdHKaknyyTisH1hLtv8w72SXoiOL4mXDOFHnqOrJxo+6jphPXL8v3XMTVDEfLSda8
 fGhTMetVdqzwnO/ClS392xxDzNrpdRPu6v/lzJH3tXHrE81VCGSzFL+ljWb34njB5rgYQuIicOd
 h/N2InBlz/O3E6EbZkBzSZtBlI8doDHvCWc3wPjyfLhiRy7Fdk4VkQkjAVSVUboWgxvO++bsJeI
 Wrhgw1kytmXiq0MXCXRRMTG+5RSsHqkNL73ehwaHLGlV5nVMNtQ7lkly5jtQ8pGI360dxUP7BvZ
 u+qqTXOzs4cW7tuR7UMlXNKj8V37GcO15jegUoouK9gB1ByIhTaXx8NYwUQMJFfy0Pb9x8YgXk5
 OApNuTPLRGw/BJP76+tGdQdLSKLjQJgcWF8iwJX+sUtrxUuZRWKkKCOMN2p71QtzkkK7uI3qrtA
 QQoYD3LuHv84xE1fEgVygerrsoZ7QxJNNlSLrajMV6MWAHRyEUdE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112624_128884_1EC97D98 
X-CRM114-Status: GOOD (  28.55  )
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

This drives the MFD child devices created by the zte-zx297520v3-crm
driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v8: Select MFD_SYSCON for COMPILE_TESTing this driver without the MFD
parent driver.

v7:
Add MODULE_DEVICE_TABLE (Philipp)
Add DDR control and LSP resets

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
 drivers/reset/Kconfig                |  12 ++
 drivers/reset/Makefile               |   1 +
 drivers/reset/reset-zte-zx297520v3.c | 237 +++++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 692f005cb2c4..2db95644cf98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3885,6 +3885,7 @@ F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
+F:	drivers/reset/reset-zte-zx297520v3.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..97f41574d81d 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -404,6 +404,18 @@ config RESET_UNIPHIER_GLUE
 	  on UniPhier SoCs. Say Y if you want to control reset signals
 	  provided by the glue layer.
 
+config RESET_ZTE_ZX297520V3
+	tristate "ZTE zx297520v3 Reset Driver"
+	depends on MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST
+	default SOC_ZX297520V3
+	select MFD_SYSCON
+	help
+	  This enables the reset controllers for ZTE zx297520v3 SoCs. The reset
+	  controllers are required for booting this board and are part of the
+	  clock and reset management controllers on this board, so you will also
+	  need MFD_ZTE_ZX297520V3_CRM. Enable this if you are building a kernel
+	  for a ZTE zx297520v3 based board.
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
index 000000000000..9636530e37bd
--- /dev/null
+++ b/drivers/reset/reset-zte-zx297520v3.c
@@ -0,0 +1,237 @@
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
+	[ZX297520V3_DDR_CTRL_RESET]  = { .reg = 0x100, .mask = BIT(10) | BIT(11) },
+	[ZX297520V3_EDCP_RESET]      = { .reg =  0x68, .mask = BIT(0)            },
+	[ZX297520V3_SD0_RESET]       = { .reg =  0x58, .mask = BIT(1)            },
+	[ZX297520V3_SD1_RESET]       = { .reg =  0x58, .mask = BIT(0)            },
+	[ZX297520V3_NAND_RESET]      = { .reg =  0x58, .mask = BIT(4)            },
+	[ZX297520V3_PDCFG_RESET]     = { .reg =  0x94, .mask = BIT(20)           },
+	[ZX297520V3_SSC_RESET]       = { .reg =  0x94, .mask = BIT(24)           },
+	[ZX297520V3_GMAC_RESET]      = { .reg = 0x114, .mask = BIT(0)  | BIT(1)  },
+	[ZX297520V3_VOU_RESET]       = { .reg = 0x16c, .mask = BIT(0)            },
+	[ZX297520V3_LSP_RESET]       = { .reg =  0x80, .mask = BIT(0)            },
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
+MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);
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


