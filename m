Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B807CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCgJ3NHOZt3UHps68lO82uOsBSf7zkUCI4MhAZxfCRY=; b=C5a5GIdQ/hEWYVGMhQvhyoSVA/
	HcC1ykHhbpERz+CmQRJf4B7xo8HegXeILYhWsC9HkBPCib/XDbyBmMvoYQkT9KZ0PIdKAkYIeEovG
	DKbNCcVRGHzZ5+DhFPDU62lZJx2JOZKKyyoEKwNgqslN9xsDDvOpt0TLu0+sT1q9lWX0iHPqSeD2J
	ItE628cWMUySaqAlLsbkpteVaz3iXkPyePisenkQjDbh4R7m2nsd4Na94UwmR41P+ihBWsSK6uoIN
	9UC9C5i/A7aMY8lDL6JTldiCDYLfB6SyJaaE9y0ql3dIF4TmSIHBf9n6G+GRUH2mCfKbj1iE1713A
	/O6b1maQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTTn-0000000BunI-0QyE;
	Tue, 13 Oct 2026 03:47:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTTi-0000000Bufx-32YL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61D6D60A52;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B56F8C2BD00;
	Tue, 13 Oct 2026 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791863220;
	bh=0IherSgUZp+qx8n/zoiTHO4dLFTG7gL2QizrFJvg3NE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ut01q3gwXY6hbUZCPxSaR7HfCVlTJgfIDuvGXeyDGVDOgYugJZvSjphfyrE5uqE9+
	 WlCyTI4v1FKkaflg+bCb+edIOLsV3mNCsSYZ5uxlFr3z9TUXQY/a3AO4Jl0Id1OhiD
	 WJHzfkWHUpSxrhLIuXN3bHLo8Gj5m0E8XZLh4vEHk8m3isAXk3YswNTdhRJytQQBGJ
	 D1v1N0IUGVRkbqyToZNyKVUt2n+9GCAebBi+NEIgAL4g5X8r7o72KN50++QtkAClN2
	 5hXcsfzFLl86fkczOj8hE+IjOGTJ4OzJZc9UzeiHjuzTQNNIfvop2sa4egGZlMXiGG
	 2DZFcGTlNUNYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A444FCA9ECF;
	Tue, 13 Oct 2026 03:47:00 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 06:47:00 +0300
Subject: [PATCH v2 02/11] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-s2-v2-2-94f8c0a90cda@gmail.com>
References: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791863218; l=5108;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=dVnYRSFKL+LSEcILFZg7klvO04qbeUQDgo8bY0Rcrxs=;
 b=WsPhL/x9ISCOzBwTM1hiTdq4KhqRMq0j7MqnfHzIXRI4TTCcyNACmb0xOJwHGcWU8jfaT7iyd
 aiT6xClFBHLCHUEyuvzNCX9FFe6wftaKwhK9etnNKFylyEd9SvQYt8V
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

The timers, GPIO banks, I2C, MDIO, SPI and a few other low speed
peripherals of the Cortina Systems CS75xx SoCs share a single GIC
interrupt. A status register shows the level of the 15 sources and an
enable register masks them; there is nothing to acknowledge, each source
is cleared in its peripheral.

Add a chained driver using a generic chip on a linear domain.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/irqchip/Kconfig      |  12 +++++
 drivers/irqchip/Makefile     |   1 +
 drivers/irqchip/irq-cs75xx.c | 103 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c423b..89afb4580 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -187,6 +187,18 @@ config BRCMSTB_L2_IRQ
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
+config CS75XX_INTC
+	bool "Cortina Systems CS75xx peripheral interrupt controller"
+	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST
+	default ARCH_CORTINA_ACCESS
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
+	help
+	  Support for the interrupt controller of the Cortina Systems
+	  CS75xx SoCs that combines the interrupts of the low speed
+	  peripherals (timers, GPIO banks, I2C, MDIO, SPI) into a single
+	  GIC interrupt. Say Y if you have a board with such an SoC.
+
 config DAVINCI_CP_INTC
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ab33cccd8..38c94bfb3 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -135,3 +135,4 @@ obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
+obj-$(CONFIG_CS75XX_INTC)		+= irq-cs75xx.o
diff --git a/drivers/irqchip/irq-cs75xx.c b/drivers/irqchip/irq-cs75xx.c
new file mode 100644
index 000000000..4d458039a
--- /dev/null
+++ b/drivers/irqchip/irq-cs75xx.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cortina Systems CS75xx peripheral interrupt controller
+ *
+ * The low speed peripherals on the register bus (timers, GPIO banks, I2C,
+ * MDIO, SPI, ...) share a single GIC interrupt. A status register shows
+ * the level of the 15 sources and an enable register masks them; there is
+ * nothing to acknowledge, the sources are cleared in the peripherals.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#define CS75XX_INTC_STATUS	0x00
+#define CS75XX_INTC_ENABLE	0x04
+
+#define CS75XX_INTC_NR_IRQS	15
+
+static void cs75xx_intc_handler(struct irq_desc *desc)
+{
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long pending;
+	unsigned int hwirq;
+
+	chained_irq_enter(chip, desc);
+
+	pending = readl(gc->reg_base + CS75XX_INTC_STATUS) & gc->mask_cache;
+	for_each_set_bit(hwirq, &pending, CS75XX_INTC_NR_IRQS)
+		generic_handle_domain_irq(domain, hwirq);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int __init cs75xx_intc_init(struct device_node *np,
+				   struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_domain *domain;
+	void __iomem *base;
+	int parent_irq;
+	int ret;
+
+	base = of_io_request_and_map(np, 0, of_node_full_name(np));
+	if (IS_ERR(base)) {
+		pr_err("%pOF: unable to map registers\n", np);
+		return PTR_ERR(base);
+	}
+
+	/* Mask everything before the chained handler is installed */
+	writel(0, base + CS75XX_INTC_ENABLE);
+
+	parent_irq = irq_of_parse_and_map(np, 0);
+	if (!parent_irq) {
+		pr_err("%pOF: unable to map parent interrupt\n", np);
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	domain = irq_domain_create_linear(of_fwnode_handle(np),
+					  CS75XX_INTC_NR_IRQS,
+					  &irq_generic_chip_ops, NULL);
+	if (!domain) {
+		ret = -ENOMEM;
+		goto err_dispose;
+	}
+
+	ret = irq_alloc_domain_generic_chips(domain, CS75XX_INTC_NR_IRQS, 1,
+					     "cs75xx-intc", handle_level_irq,
+					     IRQ_NOREQUEST | IRQ_NOPROBE, 0,
+					     IRQ_GC_INIT_MASK_CACHE);
+	if (ret)
+		goto err_domain;
+
+	gc = irq_get_domain_generic_chip(domain, 0);
+	gc->reg_base = base;
+	gc->chip_types[0].regs.mask = CS75XX_INTC_ENABLE;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
+
+	irq_set_chained_handler_and_data(parent_irq, cs75xx_intc_handler,
+					 domain);
+
+	return 0;
+
+err_domain:
+	irq_domain_remove(domain);
+err_dispose:
+	irq_dispose_mapping(parent_irq);
+err_unmap:
+	iounmap(base);
+	return ret;
+}
+
+IRQCHIP_DECLARE(cs7542_intc, "cortina,cs7542-intc", cs75xx_intc_init);

-- 
2.53.0



