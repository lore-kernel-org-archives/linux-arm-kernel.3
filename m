Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED88AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grEu5x2XMnZOnzvU+xjw/95w7pqKj4psrSM7UqTClCU=; b=bWAe+MWZpzPSQNMLh0WeYLinq5
	nNUrbz8lBl7cI79trkWZuf9VxU674Y/10rchJK6kIR8pIHxRDn+U/4xy/fQRlelTpc/QvaxXUwqnO
	tU9WXGQbxtU9eBYJ7tOmRsYdlQLeBx/co0HeNIz7qqD4BQvQC1M6EjoqEt12wAbWEvK/0X16KZ5It
	L8OjCw3+nrxhp4pfRi94YqYxzJ03d3WCWU9cQkxZhMkUIRF+HdO8xxKwNDLfTZF0elEo77oPeTOzc
	7v396ZNL/XAvryfYCXGxx2WZOOcEdrFaQ5sYPzoeTpMc0vTHv2ktO4bTxN6p0lvkllIYvXPsKSwGK
	BE0GJxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLJk-0000000Cahh-40ms;
	Fri, 07 Mar 2025 00:11:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqL74-0000000CYNo-10pl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:58:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E6D1BC0;
	Thu,  6 Mar 2025 15:59:02 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFF1B3F673;
	Thu,  6 Mar 2025 15:58:47 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/8] pinctrl: sunxi: Add support for the Allwinner A523
Date: Thu,  6 Mar 2025 23:58:26 +0000
Message-ID: <20250306235827.4895-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_155850_407374_B063D889 
X-CRM114-Status: GOOD (  16.73  )
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

The Allwinner A523 contains pins in 10 out of the 11 possible pin banks;
it just skips port A.
Use the newly introduced DT based pinctrl driver to describe just the
generic pinctrl properties, so advertise the number of pins per bank
and the interrupt capabilities. The actual function/mux assignment is
taken from the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig               |  5 ++
 drivers/pinctrl/sunxi/Makefile              |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 54 +++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index a78fdbbdfc0c7..0cbe466683650 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -131,4 +131,9 @@ config PINCTRL_SUN50I_H616_R
 	default ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN55I_A523
+	bool "Support for the Allwinner A523 PIO"
+	default ARM64 && ARCH_SUNXI
+	select PINCTRL_SUNXI
+
 endif
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index f5bad7a529519..4e55508ff7f76 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -27,5 +27,6 @@ obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
 obj-$(CONFIG_PINCTRL_SUN50I_H616_R)	+= pinctrl-sun50i-h616-r.o
+obj-$(CONFIG_PINCTRL_SUN55I_A523)	+= pinctrl-sun55i-a523.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
 obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
new file mode 100644
index 0000000000000..7d2308c37d29e
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A523 SoC pinctrl driver.
+ *
+ * Copyright (C) 2023 Arm Ltd.
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
+static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
+
+static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+
+static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
+	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
+
+static struct sunxi_pinctrl_desc a523_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
+	.irq_bank_map = a523_irq_bank_map,
+	.irq_read_needs_mux = true,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int a523_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
+					   a523_irq_bank_muxes,
+					   &a523_pinctrl_data,
+					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_ELEVEN_BANKS);
+}
+
+static const struct of_device_id a523_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-pinctrl", },
+	{}
+};
+
+static struct platform_driver a523_pinctrl_driver = {
+	.probe	= a523_pinctrl_probe,
+	.driver	= {
+		.name		= "sun55i-a523-pinctrl",
+		.of_match_table	= a523_pinctrl_match,
+	},
+};
+builtin_platform_driver(a523_pinctrl_driver);
-- 
2.46.3


