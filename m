Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127EECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuG+7ddv2bL4LaMU7+R6qlwd6c6LjYsiesaXY66yS/U=; b=P3PqRlYfjldKhZnBSHKgXQhJNW
	h/XBr/dJXpPjXTgw7JwUaCWxZi2dzuruQazaalD/PQjkIf2dkN1gA2CYe0SmbE90PetNO+rH+5Mkn
	uyoRJ3imQww7f+4R0MBtUSgQI4X4/+6QwOj5Bj6mb/kAv4EUzyu3ncUlQG0c4HPYSPCWT7uly7QiG
	OCFhY75V9BzI3J86dVdmao0DsFncIChh1GthbfEeGFAN/Z9segk/n3BbQrUv4gFxki6E9fezfUrpQ
	OT6DJTfkUOuQ9+Fkmg5zMpbRcdUEceVphbAbUn1EGGtf4ZXXj3RmHZT4VlA0CqIUAQDIDTrrUZA1o
	b2e1r1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow81-0000000FeH0-3X1y;
	Thu, 21 Aug 2025 03:38:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotRL-0000000FKaI-3Ppq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:46:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E59FE12FC;
	Wed, 20 Aug 2025 17:45:52 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 310E43F63F;
	Wed, 20 Aug 2025 17:45:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 9/9] pinctrl: sunxi: Add support for the Allwinner A733
Date: Thu, 21 Aug 2025 01:42:32 +0100
Message-ID: <20250821004232.8134-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174603_981477_DAA441A4 
X-CRM114-Status: GOOD (  20.24  )
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

The Allwinner A733 changes the layout of the pinctrl MMIO register
frame, but stays otherwise rather close to the previous IP.
The main PIO looks similar to the one in the A523, with ports B-K being
implemented, each also with the same number of pins per port as on the
A523.

Use the DT based pinctrl driver to describe just the generic pinctrl
properties, so advertise the number of pins per bank, interrupt
capabilities and the new quirks. The actual function/mux assignment will
be taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig               |  5 ++
 drivers/pinctrl/sunxi/Makefile              |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 51 +++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348e..831bb1dc93738 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -141,4 +141,9 @@ config PINCTRL_SUN55I_A523_R
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN60I_A733
+	bool "Support for the Allwinner A733 PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f1..3658c9d06b498 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -29,5 +29,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523)	+= pinctrl-sun55i-a523.o
 obj-$(CONFIG_PINCTRL_SUN55I_A523_R)	+= pinctrl-sun55i-a523-r.o
+obj-$(CONFIG_PINCTRL_SUN60I_A733)	+= pinctrl-sun60i-a733.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
new file mode 100644
index 0000000000000..1eafbf2ab3c97
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A733 SoC pinctrl driver.
+ *
+ * Copyright (C) 2025 Arm Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 a733_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 11, 17, 24, 16,  7, 15, 20, 17, 28, 26 };
+
+static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
+
+static struct sunxi_pinctrl_desc a733_pinctrl_data = {
+	.irq_banks = 10,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int a733_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, a733_nr_bank_pins,
+					   a733_irq_bank_muxes,
+					   &a733_pinctrl_data,
+					   SUNXI_PINCTRL_NCAT3_REG_LAYOUT |
+					   SUNXI_PINCTRL_HAS_SET_CLEAR_REGS);
+}
+
+static const struct of_device_id a733_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun60i-a733-pinctrl", },
+	{}
+};
+
+static struct platform_driver a733_pinctrl_driver = {
+	.probe	= a733_pinctrl_probe,
+	.driver	= {
+		.name		= "sun60i-a733-pinctrl",
+		.of_match_table	= a733_pinctrl_match,
+	},
+};
+builtin_platform_driver(a733_pinctrl_driver);
-- 
2.46.3


