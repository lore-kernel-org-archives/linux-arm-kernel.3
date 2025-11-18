Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71017CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qK8qa5tlhBTpH31uhswSU57w2gCH6Ok98JkdASZ6sU=; b=3d5VbVRr8OlEl4vDtB+a3ppEnx
	C3zpo1cgBDXEcQ9MpXoFRdCOAhibkhU6m1L470SITPADOyoAI0nFMKq1OEwcCbmNNhsCGJ8E5wiF8
	zxwYMSZJbstHmuuq5OrhUjsI2Pi3JGSRXVhGxuvltyT5TyafglJVDGNZundjlejr2z8kh2rKZsA12
	BgVcPTc5MFbtJzfetOHZS18qNFtvTadjX+mTfhULqzTspW8OW1hniLniea07BMcsdn84JZYutKsOz
	obfjsc2VB9ubKFigc6+tQ41/yXBWVrCy9IVTW2MWTjxdLlvV8oTcAxgOr9UOO2uuCdRxxxOV8O+A9
	z28qaFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vW-0000000H3qN-1lgK;
	Tue, 18 Nov 2025 00:50:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vU-0000000H3pN-0Oj3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F14943CB3;
	Tue, 18 Nov 2025 00:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D63C2BCB1;
	Tue, 18 Nov 2025 00:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427029;
	bh=s62CC9yA6KsObKdsvKU0akXJBf9cG4hbHq+2JH56Xmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aBjJ/TF+LqtQIiSOfFSGwXXyr1M+MXLvN16gWHBRk3JjNJ5oxtm0lKdTha5LzubUz
	 Mvo0EXbaH9+K2EFwPLiWuC4HdkOOSlWlOeMNj+LM095+MqtYqWuGRJRhznG1t2ms/L
	 OdI3mtQcWNNApvikzHI0HHatU3xUj6TZhmOMO4ydxJ2O4rzGnVHgB1g3cbLwvpK4PO
	 6VOvylqhPfmAnPGvWLjK06VSpIu8twQAs7tY1GhdC+zXXT298E5ni5MWn6SjIMQABl
	 e3cXVX31G/ys0LwMcXzVy+qj23meIKdiftxLgh92xthGovefcC3sun+yiuNnXHK12k
	 OFzgMHszsw9qw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:15 +0800
Message-ID: <20251118003229.26636-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165032_174687_33DCC914 
X-CRM114-Status: GOOD (  19.17  )
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

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The dwapb_context structure is always embedded into struct
dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv
dts dir, the max port number is 6, the berlin2q soc families, so this
means current we have wasted 216 bytes memory which is trivial
compared to the system memory.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/gpio/gpio-dwapb.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index b42ff46d292b..a431bea959ed 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -79,7 +79,6 @@ struct dwapb_platform_data {
 	unsigned int nports;
 };
 
-#ifdef CONFIG_PM_SLEEP
 /* Store GPIO context across system-wide suspend/resume transitions */
 struct dwapb_context {
 	u32 data;
@@ -92,7 +91,6 @@ struct dwapb_context {
 	u32 int_deb;
 	u32 wake_en;
 };
-#endif
 
 struct dwapb_gpio_port_irqchip {
 	unsigned int		nr_irqs;
@@ -103,9 +101,7 @@ struct dwapb_gpio_port {
 	struct gpio_generic_chip chip;
 	struct dwapb_gpio_port_irqchip *pirq;
 	struct dwapb_gpio	*gpio;
-#ifdef CONFIG_PM_SLEEP
-	struct dwapb_context	*ctx;
-#endif
+	struct dwapb_context	ctx;
 	unsigned int		idx;
 };
 
@@ -363,12 +359,11 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
-	struct dwapb_context *ctx = gpio->ports[0].ctx;
+	struct dwapb_context *ctx = &gpio->ports[0].ctx;
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 
 	if (enable)
@@ -378,9 +373,6 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return 0;
 }
-#else
-#define dwapb_irq_set_wake	NULL
-#endif
 
 static const struct irq_chip dwapb_irq_chip = {
 	.name		= DWAPB_DRIVER_NAME,
@@ -390,7 +382,7 @@ static const struct irq_chip dwapb_irq_chip = {
 	.irq_set_type	= dwapb_irq_set_type,
 	.irq_enable	= dwapb_irq_enable,
 	.irq_disable	= dwapb_irq_disable,
-	.irq_set_wake	= dwapb_irq_set_wake,
+	.irq_set_wake	= pm_sleep_ptr(dwapb_irq_set_wake),
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -515,12 +507,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	port->gpio = gpio;
 	port->idx = pp->idx;
 
-#ifdef CONFIG_PM_SLEEP
-	port->ctx = devm_kzalloc(gpio->dev, sizeof(*port->ctx), GFP_KERNEL);
-	if (!port->ctx)
-		return -ENOMEM;
-#endif
-
 	dat = gpio->regs + GPIO_EXT_PORTA + pp->idx * GPIO_EXT_PORT_STRIDE;
 	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
 	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
@@ -759,7 +745,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_gpio_suspend(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
@@ -770,7 +755,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 		for (i = 0; i < gpio->nr_ports; i++) {
 			unsigned int offset;
 			unsigned int idx = gpio->ports[i].idx;
-			struct dwapb_context *ctx = gpio->ports[i].ctx;
+			struct dwapb_context *ctx = &gpio->ports[i].ctx;
 
 			offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 			ctx->dir = dwapb_read(gpio, offset);
@@ -818,7 +803,7 @@ static int dwapb_gpio_resume(struct device *dev)
 	for (i = 0; i < gpio->nr_ports; i++) {
 		unsigned int offset;
 		unsigned int idx = gpio->ports[i].idx;
-		struct dwapb_context *ctx = gpio->ports[i].ctx;
+		struct dwapb_context *ctx = &gpio->ports[i].ctx;
 
 		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		dwapb_write(gpio, offset, ctx->data);
@@ -844,15 +829,14 @@ static int dwapb_gpio_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
-			 dwapb_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops,
+				dwapb_gpio_suspend, dwapb_gpio_resume);
 
 static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {
 		.name	= DWAPB_DRIVER_NAME,
-		.pm	= &dwapb_gpio_pm_ops,
+		.pm	= pm_sleep_ptr(&dwapb_gpio_pm_ops),
 		.of_match_table = dwapb_of_match,
 		.acpi_match_table = dwapb_acpi_match,
 	},
-- 
2.51.0


