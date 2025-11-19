Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA478CF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVhmGhnThdzboffWAhON//P1dd+o9MkGvkUVva4qEzE=; b=wvG9ik37dDn0q2PF8/b0xEqUDZ
	bN6QBOpx4pLxdh6zo3MU09Cy+9NzJw8MVGVP67TevFu8JwWf52KQOTH1VOBntgBNMVSS5LTIKD7ru
	ThBHB2cqCb5mIhz34x7wt9agthPl4vO/XsCziYQ5pdKhYTdSLUDhMY/JAGnkY0Y9bjliD7XyvqSMC
	0fAN6bEdXNBkqn8fYJBQt9mTpuf2FjyadqOzYcewjw6YIi0Kh4sOC2X17A506Uvnyp6+O39RwAjDB
	3+Ckwp/1ISkJYEPuwpu0gNz4AWc7+AseXxAJFSv2d2IFom9xjiufuoBlLBRIevzmTZIFq6zfJzLWh
	05RW3jFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPK-00000003kNg-0EEy;
	Wed, 19 Nov 2025 16:51:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPH-00000003kL4-122m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1AE740A00;
	Wed, 19 Nov 2025 16:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC0AC116C6;
	Wed, 19 Nov 2025 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571106;
	bh=YeIVTEsOaOeIbWf+hqNeMNj80Z42ha9QYrhd689CXAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDevqylKPkPCm1qdectUEP5VyqefJian6EOENpuptK58dy6mxPk7HTsazoyGXOTfN
	 FxYKKkom94v3/UbWMdt2TDNQ0oIaiLvbZBmaN+X94IJWdOjzPCZdaY9aa12oyYqj8W
	 V4V3PZqnx+800KBonsaNRwjtJIGBFsLDPwIBAg8pNsGAqi90ldXhFoy7HJeLL1sYdh
	 +0Zj2CK/6CXfxV4cRm1fy1gR8NpD4yiDZxZlY/DDw3lbigzyAgnyolT5GGFjmHDaON
	 E0yTGiZKwCL/VzxoT6Fq5RuMXPKNw+3hyx3lMF6dvGZ6oNaw/Hjf5n3o7mo0D7sXhm
	 DgbV82JISYSVQ==
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
Subject: [PATCH v4 06/15] gpio: ml-ioh: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:18 +0800
Message-ID: <20251119163327.16306-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
References: <20251119163327.16306-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085147_654496_0232FD1E 
X-CRM114-Status: GOOD (  14.15  )
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
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ml-ioh.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index f6af81bf2b13..6576e5dcb0ee 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -160,7 +160,7 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 /*
  * Save register configuration and disable interrupts.
  */
-static void __maybe_unused ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
+static void ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -186,7 +186,7 @@ static void __maybe_unused ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 /*
  * This function restores the register configuration of the GPIO device.
  */
-static void __maybe_unused ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
+static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -479,7 +479,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 	return 0;
 }
 
-static int __maybe_unused ioh_gpio_suspend(struct device *dev)
+static int ioh_gpio_suspend(struct device *dev)
 {
 	struct ioh_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -491,7 +491,7 @@ static int __maybe_unused ioh_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ioh_gpio_resume(struct device *dev)
+static int ioh_gpio_resume(struct device *dev)
 {
 	struct ioh_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -505,7 +505,7 @@ static int __maybe_unused ioh_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resume);
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
@@ -518,7 +518,7 @@ static struct pci_driver ioh_gpio_driver = {
 	.id_table = ioh_gpio_pcidev_id,
 	.probe = ioh_gpio_probe,
 	.driver = {
-		.pm = &ioh_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&ioh_gpio_pm_ops),
 	},
 };
 
-- 
2.51.0


