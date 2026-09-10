Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543A6C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqPQ0gAZO9RtY4q/OqDYWx4gLOFaEGtZBifNIWYaLCw=; b=y6s6CkJ0mzbXtTadUftlY6u9Pr
	IV7VD0MycAhHL5fKp3W9xTNjb1ZNEit9srbRxNxWrHvUf+8m/NqW5v34HmjISsekaphCs+wxA87df
	+NN3BLPp3jtI8ulfqEQ7A+mpDwiti5Y6w/4ClDXAZFducTqWG4xdI97ruqGhqrN/3xDwi2hw0iGHQ
	TGmRcTV+ZQGYcyAxvgf6NPiTi//t+Yf+y3PlXsMfBXnsTPW+la4nbAQbWS5Ka9jW4as2G/iaAVUQK
	pDG14s3I6WWYci4W9f9iQOxquff/WRav7LG1LHxNXI2TmNkcaQOgf9cEB60BwuG/tq400vxEwsvOV
	ef4fEBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eww-0000000EVIs-0kzZ;
	Thu, 10 Sep 2026 13:36:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewR-0000000EUcW-3FXd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AqPQ0gAZO9RtY4q/OqDYWx4gLOFaEGtZBifNIWYaLCw=; b=Xh9eZG0Fv9gjj6F4Q1dI+4Ek7I
	lGBr3rj3z/e3IhHK5fvl6/gxphokH2rSoua2NTnsd2kqIYnVvzeQHU56+VNnlNPKmCsNEHOFnC8OI
	Fc0qh7lKpFU8AjuyHrNY/ZAJdxlzDykMLTu4FA79ZOgIfltrCWuppYMw4zBepInQHpOUENfgNXCmi
	X73kbwdW5MGpXVMFmC9Gf0zDpSLeaWbNdYiNsjiFLTXoVYQTJlOvVlCPJwDxYPHqiDhb8/FBJGXuS
	YNGooNon7vP+RW9KmehPjcVKR/RGQOfi8/cCBY1Cs4msfwHfvr4Nl72a4z0xKQgGJE/VoSDbPJbRy
	34E1FVGg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ewO-00000002XhU-3Zlp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5978922D7;
	Thu, 10 Sep 2026 06:35:42 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE663F528;
	Thu, 10 Sep 2026 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047346; bh=afNw4mfmWPusnYCWAuWnIcZqwy8vQndi0BEvd7sUpx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UfTRtROJp3o3h+kxey19i79i5p4qm5F7glE6bRJQrgIYbYioCZeEY5yrFrRBP1oFX
	 Wge3Vj4qNIzetJJqDKqGYvcETFwerYkqYBLrSrmevjQS6lhgc77Hxa3AwQ+DgaBSbA
	 K9PGVLIAGmHvsbT/PtW7vjT5XljEHaKEEa6SqU6U=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Thu, 10 Sep 2026 15:35:18 +0200
Message-ID: <20260910133519.459011-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143549_229937_A7F9A7B3 
X-CRM114-Status: GOOD (  20.03  )
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
 drivers/pinctrl/sunxi/Kconfig               |  5 +++
 drivers/pinctrl/sunxi/Makefile              |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 50 +++++++++++++++++++++
 3 files changed, 56 insertions(+)
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
index 0000000000000..ca82f08a3a65b
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -0,0 +1,50 @@
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
+					   SUNXI_PINCTRL_NCAT3_REG_LAYOUT);
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
2.47.3


