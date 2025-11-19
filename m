Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8743BCF259F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggrpKoOJDYW1dgaQrga1G14rp+gExMndXNkJ3hlK3Qo=; b=zMPzz7sAqzStzzMcjnpPR1wjLi
	tnqVpK9jty/aF0Z8fx7NLPhKyuGHYvlmBYp07XBfdt3t2sOxOimiUjSSgyH7Eu906K/RlpgE+EMvL
	rPwnFH8FjA8ZiUhkdJ6vgN+cYUJp8ClqI9bvFY5TMvMiJxHVx/4+RZECrBh+qFt6Ldnwl8p1s3qYd
	0q5pX/P5dBfNwaepkBeRejQbL3VXj3UoR2+TzG1IN9gvr/08FxPcLDTKFJa2ZjcViZs3/nraOMr26
	LALAqJvPfAVwNbzLLHPsUWkDBMpluywMDCTBqA8dSbOFtFbSPaMWrwr2EJQs2V25Q/R02fDJ8YAFF
	myD/LCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjiM-00000003Re6-2Rbc;
	Wed, 19 Nov 2025 15:03:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjiL-00000003Rcv-09Z2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6529960218;
	Wed, 19 Nov 2025 15:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307F3C16AAE;
	Wed, 19 Nov 2025 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564600;
	bh=V41I1DdaKjoguYvIVU3vcsbbLpnEiJ795VwgA1QsjOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cItYrC/7Gv/oF1ZuZmijwPyTgCtpcQjJvd2KcgR5JnuDtTxgP8bA/oAj9ZoNirK3L
	 91GW/fdqyignkGUcxE9AsI0gAoCki+qIz0QE9d2oKemH7hl8tgSy5tvyJrPY19KahZ
	 Jivm4LCJd3A7+qHtZKNj37tVGWVjuo5VQR9IQ4Hrd1aaheQtMrhYLgPaiRepz6qkQh
	 2DxnxKfQvZTXz3enyhyLLzcaCgJ08+6JpEwL5phWRl8IzbW/Yg5IzVTp+bOw9lbuXf
	 IZ6h66KwznJvN6mcZbuWb2fAZxHjjAXCHQi7dynKhEBGJ2Oq4+2f9ofOUf/CWCsJlh
	 7J0gTDaTK6NHg==
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
Subject: [PATCH v3 15/15] gpio: zynq: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:27 +0800
Message-ID: <20251119144327.13345-16-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 0ffd76e8951f..97780c57ab56 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -735,7 +735,7 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 	}
 }
 
-static int __maybe_unused zynq_gpio_suspend(struct device *dev)
+static int zynq_gpio_suspend(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -756,7 +756,7 @@ static int __maybe_unused zynq_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_resume(struct device *dev)
+static int zynq_gpio_resume(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -779,7 +779,7 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
+static int zynq_gpio_runtime_suspend(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
@@ -788,7 +788,7 @@ static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_runtime_resume(struct device *dev)
+static int zynq_gpio_runtime_resume(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
@@ -814,9 +814,8 @@ static void zynq_gpio_free(struct gpio_chip *chip, unsigned int offset)
 }
 
 static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
-	SET_RUNTIME_PM_OPS(zynq_gpio_runtime_suspend,
-			   zynq_gpio_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
+	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
 static const struct zynq_platform_data versal_gpio_def = {
@@ -1022,7 +1021,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 static struct platform_driver zynq_gpio_driver = {
 	.driver	= {
 		.name = DRIVER_NAME,
-		.pm = &zynq_gpio_dev_pm_ops,
+		.pm = pm_ptr(&zynq_gpio_dev_pm_ops),
 		.of_match_table = zynq_gpio_of_match,
 	},
 	.probe = zynq_gpio_probe,
-- 
2.51.0


