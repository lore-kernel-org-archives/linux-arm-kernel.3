Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1525CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90+EzLz7lbG1IjirrqJ1bl7oK9Z2g38gbhiMH8E6IYs=; b=dmNbh/EZKzbzRDxDAGERF3VhHg
	0Yg0WOfdj367S2qoixCfmK1O1x6/Fie7PobMh+A/vBT0+6YP0F9oJQZcUK6uCylglgwEQ//SZH/uO
	Kjar4TTvSur2OPgW8a1wHPNyiGq0d4pxZvzQMCwDyUNqTv6lBQ2afbQI+q9gWWdadAuXnYFmdQ04x
	GdVGgHuMaloaZ6EwVsJeb0pSF87LnVjkfzU6PfiddTPotwlXsklba12m5sJCySOgbwgbHp14Zni5E
	m2xfIof77Z2OhEsNMslx7fXk1S6uI2/Qnfi5eisxtYr88n4TSlgV55FDf6OskJ7gEF86T+u11GjuU
	TpmZ2Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbj-0000000Aqy2-0Le7;
	Mon, 24 Nov 2025 00:39:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbg-0000000AqxK-2rXj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03D4760051;
	Mon, 24 Nov 2025 00:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26AEC19421;
	Mon, 24 Nov 2025 00:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944743;
	bh=LwiAHc4RwoQe++kQcc8PBK9cT4Y5Hk4joSlyVBAPSm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GaFZ0Jv3OhNzCf02ZN/BsrMtFHL9tyaoKn+po0F7OBSdecaQfGxsEZkvM87aKZLIS
	 6BD7gUC7AhasdQaQKmxH+pZsQel2f+7WwWviGGvifw65CujchUhN4//IeP4ylv0Q/w
	 qsKQ9nmFwG3mw23Gb50vUJ/0eT7xjgpQI5sfkke66MT65JzoNntr8uEleMq0lQ9qBn
	 dkf3yGsGOP8Dg+lOeTWFdD7A4BdB3c9c01f0T8pPMrKS4SlaSMNZJWTmqefFrS7U47
	 zVxH5G4xoDWevlC8QHustDaoMLHa3rQlXamBcwYuXK1kCuEY9Gl2m8fMbOQIdimf5G
	 X/OK2FFH6rL6Q==
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
	linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 01/14] gpio: dwapb: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:52 +0800
Message-ID: <20251124002105.25429-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpio/gpio-dwapb.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index b42ff46d292b..4986c465c9a8 100644
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
 	struct dwapb_context	*ctx;
-#endif
 	unsigned int		idx;
 };
 
@@ -363,7 +359,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
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
@@ -759,7 +751,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_gpio_suspend(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
@@ -844,15 +835,14 @@ static int dwapb_gpio_resume(struct device *dev)
 
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


