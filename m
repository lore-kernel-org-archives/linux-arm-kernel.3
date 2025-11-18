Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEA4CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/2VOjYQIjdDGsO4qnWrH1AZLUu4w8FqllCplYe7FEk=; b=spPbFKF0e2BmtZJBrrLfwc5Wrp
	La1tV2g8odBSTamZUaULLW2hRQk0tY8t+6VExxcYvI3RsHy5JAX2cxOcgapI22DenX1Jh5eC5LDCb
	khE7ZE72qTdnhpAimuttTdiMcLvUlywmr8vMh817MsTw3quNyrWNiepvh4bGSWx4CvqvqfPsGjL4L
	fIsbP8Cq42JieNCdTL3WYzoowXfAmuuBc7OoOvWbd+bxNKXCLHXeW3ZIOIolmnAxUeLY4tR+gB4xS
	jLmZiXDcS1zka4Efm6Tp3ewiKfPSTLKCkCED4U4GeQ5nWYUWzsJCP5RjtDBCgikZIhZkJRnCYuevs
	4AZU+gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wK-0000000H4Sy-3554;
	Tue, 18 Nov 2025 00:51:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wE-0000000H4NU-42p2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 811CC42A40;
	Tue, 18 Nov 2025 00:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FBC19425;
	Tue, 18 Nov 2025 00:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427078;
	bh=P97Bc+5RHWfAXBOfJCvb7Bdf9SK6HWDJUVbNNGzAwjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qnDjfK3VJgSksrVPwA3G60tXWU7vRHNLrPuIz6+ab+8OuDBDfJ6nmwV6c9cjMVdLD
	 LZCw/N888rLqP8G1mavAtBcqLxldk+9jXWFFN8IzXf1ripj1rx3ciNvWh8bVaPpM6F
	 OJV6iV4crVEK3lItw9ugkMEVLiIbcj0pS4KFjcVJwYKSljvM+0ooQd0sqHIzJ5I7OR
	 ELMicc+f+d9wnSLUl/FCUm/cORCeousRgJ0tH1vg+IOylls+Arw0KX0s92ow/wob/T
	 Gz6iG1y44yugepSVldMI1OLWM1CE0jttz8GLpe0sfyJ3SwkRMnCdUWQlKouapuU4bk
	 RX4JzBqSY1tHQ==
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
Subject: [PATCH v2 10/15] gpio: pch: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:24 +0800
Message-ID: <20251118003229.26636-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165119_088410_1117DE2C 
X-CRM114-Status: GOOD (  13.93  )
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
2.51.0


