Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510C3CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TC6u5q8xVRsRnLa/8sZQPaRhlMPhPFt/S5wmg3xats=; b=Zzz6z3ozelx4eP3Z1EhFsB4ymq
	5U0EZpUPkNs3rqgexzpBpPPwrPgtBOJmBC9coQQmKrm+I06MkVtjvj0bdZSyKuS6YhkEJJFacJd0F
	RFy3f4OWJ/9eJk6Wfanpcb64hWDA1+ViNQCWV4o63Ko3vxsmkIDAnm7oWALqbY2Yv9jPnDVLWzfch
	ODhCcO9P9iy9LEct+UsJzJs1Y1MncFHrtv2zpxLVYad8eYh2+x/BAL+8dpHXzSDog0Ru8iKT5BqjP
	xh2B1iEyVTYYYp1viaxniK2I4gcOyXut5LJD8S30VmW7Lw+XiWR2NiKHemftzPlzTFo6ryLRlbToC
	N8Sfz8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKby-0000000Ar4W-2Drp;
	Mon, 24 Nov 2025 00:39:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbt-0000000Ar18-0WfN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C6D5407F2;
	Mon, 24 Nov 2025 00:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADC5C116D0;
	Mon, 24 Nov 2025 00:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944756;
	bh=s7gmAkXYo3rQVJ8An2wM329PekTsogFXN/YDoZN5CkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsp4l5pFGdb/D2rE2OGCTtQaBfl2Lker+yqU7k05DSOe8wJuIA4nblIhiGJcmP1MK
	 4OxJWOiugs9ITt1xm/xUBxX3JwS/DvFjTjFdrodWGO3gn5/9Hu9eeGZtTDWqeCZLtM
	 vPTG/owhUQ5C/aBe0Ell8AzSAvHB6SEq4ocur4Z5ahy+vJQC9+ktATJ85i5Khr2Hdo
	 TT7rDY3zwG/JVS/cCaFd4dYpu5xzwar5qQRTmoGuDyC3rhkPn9blfLKGNrzEyoNKSj
	 qWteCNTQRp/xx35OOutNoFN8wgk29z6eOWPLNwd5NuNNvDOz7VC0LkCKU/Tu5/bdXT
	 n0ZZX3piLTErQ==
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
Subject: [PATCH v5 04/14] gpio: pl061: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:55 +0800
Message-ID: <20251124002105.25429-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_163917_222847_352DB464 
X-CRM114-Status: GOOD (  14.28  )
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

The pl061_context_save_regs structure is always embedded into struct
pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
for !CONFIG_PM_SLEEP.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpio/gpio-pl061.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 02e4ffcf5a6f..919cf86fd590 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -37,7 +37,6 @@
 
 #define PL061_GPIO_NR	8
 
-#ifdef CONFIG_PM
 struct pl061_context_save_regs {
 	u8 gpio_data;
 	u8 gpio_dir;
@@ -46,7 +45,6 @@ struct pl061_context_save_regs {
 	u8 gpio_iev;
 	u8 gpio_ie;
 };
-#endif
 
 struct pl061 {
 	raw_spinlock_t		lock;
@@ -55,9 +53,7 @@ struct pl061 {
 	struct gpio_chip	gc;
 	int			parent_irq;
 
-#ifdef CONFIG_PM
 	struct pl061_context_save_regs csave_regs;
-#endif
 };
 
 static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
@@ -367,7 +363,6 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int pl061_suspend(struct device *dev)
 {
 	struct pl061 *pl061 = dev_get_drvdata(dev);
@@ -411,13 +406,7 @@ static int pl061_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops pl061_dev_pm_ops = {
-	.suspend = pl061_suspend,
-	.resume = pl061_resume,
-	.freeze = pl061_suspend,
-	.restore = pl061_resume,
-};
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(pl061_dev_pm_ops, pl061_suspend, pl061_resume);
 
 static const struct amba_id pl061_ids[] = {
 	{
@@ -431,9 +420,7 @@ MODULE_DEVICE_TABLE(amba, pl061_ids);
 static struct amba_driver pl061_gpio_driver = {
 	.drv = {
 		.name	= "pl061_gpio",
-#ifdef CONFIG_PM
-		.pm	= &pl061_dev_pm_ops,
-#endif
+		.pm	= pm_sleep_ptr(&pl061_dev_pm_ops),
 	},
 	.id_table	= pl061_ids,
 	.probe		= pl061_probe,
-- 
2.51.0


