Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046F6CF259F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6DtsJPNdYd+q+MDD0aCexXapJaLCf4y+p9rfjHtnLA=; b=FoNReIDn/rTXAEQZIvrq6uPboF
	bNjNTSX7cydNnDB+b9LRg9G2kNdYEp62DN3QcMnZFqnkGmu0IA3YTxk4oBUG0MS9Rhyk872gk3v1M
	2Cs3xwT9LGSSQ+VSoVV2O45kckSHdSYj3aOjFEwZ1bUc6aVBkeAQsQICRFlLf3RdSdUORC74sc3rc
	zMPsYxL+YKgXxlA0dfgprpn59kQatGiKoYv2UY9E5/QCmLfCELvMe+KAetibHVHld306ZLSZHde+W
	2Fj5bwwJJf4h2JqIHr7FcwTGJ5u6LfvuXB3cbQJLeljFGcffPAXMSDCsEhKJfFDGv08FwNMClMZPv
	IXHjJ2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjgb-00000003QZV-0F9X;
	Wed, 19 Nov 2025 15:01:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjgZ-00000003QZA-0d8O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3799A60203;
	Wed, 19 Nov 2025 15:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8759C113D0;
	Wed, 19 Nov 2025 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564489;
	bh=v9W8D36bTqpg+f65pHNpmPN8TfSCoWh/X0xcXoN9wTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbmFVijy9Gho98tZFFCzSIywVPOUXae5n0xMw7s4R/dPFOMhyBpN0gCw1Rlcnt/VL
	 nH8UX9Tig5hkKSQssrFQmpuyeC4+E21+CikqJVyijFasF3TTJcbMlRjj2+vwf43uuX
	 q76p++y9aGy/Fr5ObtkTdJ53w1ZXmPFM1/I6umOljaQWWeFzNQRTRA+39VRk2A0fiG
	 M0apB+w4udhKu9joXIuaJbZla3XfwMDHAxRi7mJFlT+M5LBJIC9oJGZ5xDOOhj9Zir
	 FzOZqyfzLGqiI38XmT+oXAYaGL4VdIwWkD2QPZtCj2++1d/6N1tw0B57syQkXezgJf
	 mLM/WDnELFmZQ==
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
Subject: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:13 +0800
Message-ID: <20251119144327.13345-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119144327.13345-1-jszhang@kernel.org>
References: <20251119144327.13345-1-jszhang@kernel.org>
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


