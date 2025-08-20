Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24164CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCyPxTNIQDOE9Q9j38dReLSGK1AYDU2v18onUB5hl/M=; b=AnJVc3rNVfhY+Ma/Ot+lIiN1LA
	Xudc30D+BPqWB5ebJfYxDb1aNzYv1X6eiTqn2GBC8RfsgX+fYDALinTsXeEOgm1RKczZovjGowThB
	XbOprNXs/pVrU3IYbP7fbFRaNQGfsK51osGQk3107f16cheCqiS28EH9eqfDmVuwifzey0CEauiBp
	YUK1scPa5Qgr6yNzX4BKcTw5DGOEAQVcx3vhgCAptDNWwac5Bz2G48jkeBEHUrrfHo8q0eozpPJNu
	cCvH6nji6K96pJWZVryUSVrAum5jSwZjPJUc8i7XXpjVwOJDkWC3tyVn7rnhTzqZ0odtTzZQf6KyJ
	rwouYmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkf-0000000Es8k-27cP;
	Wed, 20 Aug 2025 20:49:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolDm-0000000EKGN-1ju5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:59:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAC645C6908;
	Wed, 20 Aug 2025 15:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13C7C4CEEB;
	Wed, 20 Aug 2025 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705569;
	bh=Y36HuswNodbrKyVb7di2itIAsIENlff5yeL0ohIKL+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dhnIqRFbolFKv669g/NhMWBFRHr/HWpQODcjF/txYp2sHqjmyPE+idjqIBAmjca28
	 g8JbQObc+iVBY4jupekGiywCUR6Jsa7Kr4b8rzbcsUWiMkuK8dHObBKor1ThgtfsZo
	 ZPbooLJ6ONssJHGvDUC1BJxKjvYjjVCZcvFeUFKaZ9JfgfJ82Iyg/dUO+DcoRuq526
	 62TCon+/GRMSRZWRGCCTmFi1bHBY+1soNPeSq9t/3aohhWz8+58o7ce9xumqlRUMm+
	 659LoLVxp+YgMM15sJbMO1BS7EIiJKHCKhFXSHa0LeLpBk3StrPq3kLScaHxkM10w7
	 c4pDUY86uymLg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
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
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 11/16] gpio: pch: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:32 +0800
Message-ID: <20250820154037.22228-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085930_532249_EADB851F 
X-CRM114-Status: GOOD (  13.65  )
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
---
 drivers/gpio/gpio-pch.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 9925687e05fb..4ffa0955a9e3 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -171,7 +171,7 @@ static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 /*
  * Save register configuration and disable interrupts.
  */
-static void __maybe_unused pch_gpio_save_reg_conf(struct pch_gpio *chip)
+static void pch_gpio_save_reg_conf(struct pch_gpio *chip)
 {
 	chip->pch_gpio_reg.ien_reg = ioread32(&chip->reg->ien);
 	chip->pch_gpio_reg.imask_reg = ioread32(&chip->reg->imask);
@@ -187,7 +187,7 @@ static void __maybe_unused pch_gpio_save_reg_conf(struct pch_gpio *chip)
 /*
  * This function restores the register configuration of the GPIO device.
  */
-static void __maybe_unused pch_gpio_restore_reg_conf(struct pch_gpio *chip)
+static void pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 {
 	iowrite32(chip->pch_gpio_reg.ien_reg, &chip->reg->ien);
 	iowrite32(chip->pch_gpio_reg.imask_reg, &chip->reg->imask);
@@ -402,7 +402,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	return pch_gpio_alloc_generic_chip(chip, irq_base, gpio_pins[chip->ioh]);
 }
 
-static int __maybe_unused pch_gpio_suspend(struct device *dev)
+static int pch_gpio_suspend(struct device *dev)
 {
 	struct pch_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -414,7 +414,7 @@ static int __maybe_unused pch_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pch_gpio_resume(struct device *dev)
+static int pch_gpio_resume(struct device *dev)
 {
 	struct pch_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -428,7 +428,7 @@ static int __maybe_unused pch_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pch_gpio_pm_ops, pch_gpio_suspend, pch_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pch_gpio_pm_ops, pch_gpio_suspend, pch_gpio_resume);
 
 static const struct pci_device_id pch_gpio_pcidev_id[] = {
 	{ PCI_DEVICE_DATA(INTEL, EG20T_PCH, INTEL_EG20T_PCH) },
@@ -444,7 +444,7 @@ static struct pci_driver pch_gpio_driver = {
 	.id_table = pch_gpio_pcidev_id,
 	.probe = pch_gpio_probe,
 	.driver = {
-		.pm = &pch_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&pch_gpio_pm_ops),
 	},
 };
 
-- 
2.50.1


