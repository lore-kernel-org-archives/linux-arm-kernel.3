Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90B5CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0/eEI9Q18VFlOzwpS5qbYiPGa+4ErpH7QecjmyXjBY=; b=k5BSlmVEU5BqHchx9WGH11UUWu
	rSQrMZB8fI46aiKdRRJzaoVwfNdDdojNFLP3HQufVxQyFTElaiq1NRrCE8O2GXRCtDC1EkWOKLRKX
	O3nuF4ykJEiYacTHNpBNs8Jpp3oM1lbhL95ugkzyPXlqgqtyMfnsvIxpQw+wQmAAE/GsjLx2RK+MG
	KlbkSQhldT3dHh1GilcBZuy71gcToFtzllifbcJwQZ9Bam3tVMsl6XGPmLiGWoKPtA/QetpjQji6r
	XuxbK7zdroVfdArnrYNVTCAXTt9b3nC0C8O4gfp+uY1JDQAU3Y8R1H82ORmyOGXKqos5hzgmf9SIM
	zc9KZRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wf-0000000H4n2-3B9M;
	Tue, 18 Nov 2025 00:51:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wa-0000000H4ih-38UR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:51:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14170602DA;
	Tue, 18 Nov 2025 00:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC583C2BCC9;
	Tue, 18 Nov 2025 00:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427099;
	bh=sgcrLnGm3+Bbp+1Awn9kwG362Rqp8d/CDhH6WRqtT+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsWzXRyCK9isjIMpLbbmO/Hhm+emJSuG0Hxpvdr2a2shuyiUk4fuGzYDAmY3no8mL
	 TF0A2V/cJTgHCyafPL25WX7NYstNN2xMxyF98tN9U7oUkTgqqCROSFsCvyxW1KxwlE
	 14+MwomUh0aLK6/A6OtAZOcpM96yMt+Msa0HYrOaDjuV+jlvezjD6Ey7YzXp/UkvRM
	 r7VTcA1EzYQaRSLvMB/EoUCm4Y7vLyVaxqvLjup6m10NzHWWGWx4b3n0GNX29Y2qZ9
	 CYW8FTWzLTI4UpEKejX1hBcdDAH0bJ9aX6pnefslUTO6Z1/K3YQfyRe3zFuGgUYyKv
	 GAi5IApyFLJEw==
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
Subject: [PATCH v2 14/15] gpio: xilinx: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:28 +0800
Message-ID: <20251118003229.26636-15-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
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
 drivers/gpio/gpio-xilinx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 83675ac81077..be4b4d730547 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -286,7 +286,7 @@ static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
 	pm_runtime_put(chip->parent);
 }
 
-static int __maybe_unused xgpio_suspend(struct device *dev)
+static int xgpio_suspend(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -327,7 +327,7 @@ static void xgpio_irq_ack(struct irq_data *irq_data)
 {
 }
 
-static int __maybe_unused xgpio_resume(struct device *dev)
+static int xgpio_resume(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -343,7 +343,7 @@ static int __maybe_unused xgpio_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
+static int xgpio_runtime_suspend(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 
@@ -352,7 +352,7 @@ static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xgpio_runtime_resume(struct device *dev)
+static int xgpio_runtime_resume(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 
@@ -360,9 +360,8 @@ static int __maybe_unused xgpio_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops xgpio_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
-	SET_RUNTIME_PM_OPS(xgpio_runtime_suspend,
-			   xgpio_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
+	RUNTIME_PM_OPS(xgpio_runtime_suspend, xgpio_runtime_resume, NULL)
 };
 
 /**
@@ -682,7 +681,7 @@ static struct platform_driver xgpio_plat_driver = {
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
-			.pm = &xgpio_dev_pm_ops,
+			.pm = pm_ptr(&xgpio_dev_pm_ops),
 	},
 };
 
-- 
2.51.0


