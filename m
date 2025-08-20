Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE24CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/smMiKT1VkzaccdkIeZm8AlenlQpq7cbEs3sAqJdIkU=; b=kmvSCQAk7QriFo6/3wK4z1bTEi
	eYGs4hW9Iu/q6Q5slh7cKneLLFQYugAP9RH9h04oItShkiyWAJOe5CkoWlq+eIZtR84Smn/HnSOZv
	N3+egoVr3F6fiTwMIKtAo8gQPJhie0fecqlKaswZrXGx1XJ+O15YbCs+jvtogovzUQhyA2EhXvDuA
	gYiyiHcA3OighaAeCcLjMauoIB0UM75C4DzfXehIHjKMmSc42v5e90xWGQ/ECUkW4YQRDDJIJC6ET
	exfjQcRKFJyLMHcIrOydbfGAs9dSyckOB9CqxXMZloi5ioPJLw39lsN4qyI3EaHcdmVt5kGn1cE/A
	FNcYn4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopka-0000000Es1A-0mGM;
	Wed, 20 Aug 2025 20:49:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolDJ-0000000EKCi-0uw3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2456601F5;
	Wed, 20 Aug 2025 15:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C750C113CF;
	Wed, 20 Aug 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705540;
	bh=3yUWsIxkW8qzK5gi9AtNqttGslx05/6Cqkuua0jSepg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpYjeVFfuND3nz/WtpBTs8CSNdLRsPHIRLDTMSdozP6kGI7Gtj25iygIgYRBwNaOy
	 /eKLo8WA/gRRvPpPhXSW5HqgLCSjc0ps4UnjzhG3QfHczjUKspCgyEMwKnun6TvDry
	 DBRCmmREWc5H3yzP+h5pvCybcFMarNnofKhZN3hseLT8fXyUAY5b0NlEjRRiDR8Lot
	 zu90HmaZzx4aBrRKQvll0EAXNnLL87M9gS+x4iLJVT7TFdV96bdWxtdEC3DRdC4Ixl
	 oQFdP5ggs5YAQDagfjoKx5dlrlHvLITjd1QiuYBR9OQG63j44YXO4b0rlK1L/vT6yR
	 nsd6hJIUhxcCA==
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
Subject: [PATCH 07/16] gpio: ml-ioh: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:28 +0800
Message-ID: <20250820154037.22228-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
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
2.50.1


