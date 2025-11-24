Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B14CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CScahu1qup1u5hvkOYF8CrEeWd5glFp2xSPBnUXIsWo=; b=adpBN22Le9KD7L2ToUzjXL3w2B
	0EQT0TlSgzaKuSq1g9uYGGNDaRvlgnhZDhu+SyYYHDGElaYieDbmz/YqIRMfCstSkaFlU4sj8MoUM
	bl9Pd1d2YzDBOU/QxNZIVoNLxvhMMPou1tJ66Gk4pQrj4bfh5/zgl8M9oaIBbbn8ltLy8PFr7BELF
	nucL5JcR76L6hMKi2oXA7WBfF6KeImrlCOWwcxFFe57Dcz5Srppx7F/hw0H5iVzGmUpSqEog0Xrl8
	Usrl9GcKYTj0wLbjcilyRb0MdHNld6BuxGOdsAUnSuoUMSZqkB85oybbKMy8X8yBHF1ZPXxd8wLCY
	fUR45AXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbu-0000000Ar1t-0wHU;
	Mon, 24 Nov 2025 00:39:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbo-0000000AqzG-2Izg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 386D64169C;
	Mon, 24 Nov 2025 00:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A8DC116D0;
	Mon, 24 Nov 2025 00:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944752;
	bh=UkCi6spCoGBukorZ8+mAQyPnpIaXJp83L7Ud7SQYBdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3GUd97s11C65b3B4qczTaFB/BDMk6u89hqkuACWfPDSZ3+08hQ2INkLoJHrLPy0t
	 wasnmNO3N1CwHmTIkXszdhHaE/81lep+7ox6CPjXOuk5Ou8IMZdu1IbVDvUKYgz8oG
	 HenuTddNMXOJ3La6mK0vOeSO94jPeuIZdOKsE+dFY0o8d9PX3E/EtkGm/fFqXtcDe2
	 4MWqyhZ1Da3wE+HF+gEP82L/BGOFd87sNyDBS7RHLx/gKDRsExDLYezWNfvsCgQKxp
	 mXvwTySfWeIxGcvWH5GGDHyxWixrI5rMgVKSuNlCtHU9uNHh0lKT5vLc/RSx8dTEZx
	 ORfGozdp9b4jQ==
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
Subject: [PATCH v5 03/14] gpio: htc-egpio: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:54 +0800
Message-ID: <20251124002105.25429-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_163912_627118_C74B3A96 
X-CRM114-Status: GOOD (  13.90  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 2eaed83214d8..72935d6dbebf 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -364,21 +364,20 @@ static int __init egpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int egpio_suspend(struct platform_device *pdev, pm_message_t state)
+static int egpio_suspend(struct device *dev)
 {
-	struct egpio_info *ei = platform_get_drvdata(pdev);
+	struct egpio_info *ei = dev_get_drvdata(dev);
 
-	if (ei->chained_irq && device_may_wakeup(&pdev->dev))
+	if (ei->chained_irq && device_may_wakeup(dev))
 		enable_irq_wake(ei->chained_irq);
 	return 0;
 }
 
-static int egpio_resume(struct platform_device *pdev)
+static int egpio_resume(struct device *dev)
 {
-	struct egpio_info *ei = platform_get_drvdata(pdev);
+	struct egpio_info *ei = dev_get_drvdata(dev);
 
-	if (ei->chained_irq && device_may_wakeup(&pdev->dev))
+	if (ei->chained_irq && device_may_wakeup(dev))
 		disable_irq_wake(ei->chained_irq);
 
 	/* Update registers from the cache, in case
@@ -386,19 +385,15 @@ static int egpio_resume(struct platform_device *pdev)
 	egpio_write_cache(ei);
 	return 0;
 }
-#else
-#define egpio_suspend NULL
-#define egpio_resume NULL
-#endif
 
+static DEFINE_SIMPLE_DEV_PM_OPS(egpio_pm_ops, egpio_suspend, egpio_resume);
 
 static struct platform_driver egpio_driver = {
 	.driver = {
 		.name = "htc-egpio",
 		.suppress_bind_attrs = true,
+		.pm = pm_sleep_ptr(&egpio_pm_ops),
 	},
-	.suspend      = egpio_suspend,
-	.resume       = egpio_resume,
 };
 
 static int __init egpio_init(void)
-- 
2.51.0


