Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CF3CF259F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HQHFh5MgIEfClebUd5cKmG36dA3dQMhEFdSG35hCyg=; b=s6oW2TLkAbUU4bZ7fET2UfG4FG
	qwTRyfTb+1xaKFrROwoAJfQCDGbjUx0BsVpVZtYs43fBmE1UdaOtqEIfXua5R2NYcJm5lQpLlLd8u
	z2CZR0wbgE5wX7MjHqM5+z3cAoCZCWtwxE5vis9rsNwHjY0qQSFsx2BSsDth+d1jV/VRfOD1gVFkB
	Ej1n678oWbkgq9zRNG/Q3s4UDChEJ2Qht2oEjX33DhWBNS/gw3f/K5updTE4DutWXmYOp5gY2qykN
	f910/IRgAHHkIKBMDpz2O6jbyj1y4G6bmURKjmhJyGiDFLp8Rsn3MzZlpA8ecOgQW/1NfoKkppOou
	edgHC4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjhn-00000003RBC-2av8;
	Wed, 19 Nov 2025 15:02:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjhl-00000003R8g-0s9K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D02D2437B5;
	Wed, 19 Nov 2025 15:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67090C113D0;
	Wed, 19 Nov 2025 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564564;
	bh=bQd3T1M8oxx00RR0Pdp7o13CYHrHsVDpYKo6mjJUh2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PmmbT9DKyKZR0i77bR6Qn9xkiceF+eTjQHBon2uNIrot/xX3Do9UWOGqwyaSUiJw3
	 h7Y3m42F4mIx9a0U/T6OdgUcK4gRcYOMzx+9z/iBrOJClFO+Ij3gv7L6sEEGdTrOV9
	 fMTj96g4+o6eQrMrfCE8Kto7A7oC6u7uE9VA7e9mEnXOun7QSWZwk3FtJl5OpdqsZh
	 OJsn6AHxksb0iVqOQhCUMfyar6fGf1pCaW19crdWHpP71nO1SOSB1SBw2llFJ8PrlE
	 hLPXGQAy7R4hMe/4jFyv/OWzYHA+NoYfQhb7Pmxj0ciOgEp/X63RR3e0lGkSVgi0VK
	 sbZJqTY+BFhrw==
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
Subject: [PATCH v3 11/15] gpio: tqmx86: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:23 +0800
Message-ID: <20251119144327.13345-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119144327.13345-1-jszhang@kernel.org>
References: <20251119144327.13345-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_070245_269007_9330CE25 
X-CRM114-Status: GOOD (  14.97  )
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
 drivers/gpio/gpio-tqmx86.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 27dd09273292..d79f515137a5 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -279,19 +279,18 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 }
 
 /* Minimal runtime PM is needed by the IRQ subsystem */
-static int __maybe_unused tqmx86_gpio_runtime_suspend(struct device *dev)
+static int tqmx86_gpio_runtime_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused tqmx86_gpio_runtime_resume(struct device *dev)
+static int tqmx86_gpio_runtime_resume(struct device *dev)
 {
 	return 0;
 }
 
 static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
-			   tqmx86_gpio_runtime_resume, NULL)
+	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
 };
 
 static void tqmx86_init_irq_valid_mask(struct gpio_chip *chip,
@@ -425,7 +424,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 static struct platform_driver tqmx86_gpio_driver = {
 	.driver = {
 		.name = "tqmx86-gpio",
-		.pm = &tqmx86_gpio_dev_pm_ops,
+		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),
 	},
 	.probe		= tqmx86_gpio_probe,
 };
-- 
2.51.0


