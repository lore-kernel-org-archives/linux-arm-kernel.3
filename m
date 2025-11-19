Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A737CF34C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcEoGqoyw8QQRW0cvEw+qrVp5/GCJykCAzAwGqnzN3I=; b=er+IFO8TQysv7jIzko4gOsRhgN
	3OiW0lTdneQ3LqBbX/AYyW9GkFYWh6KNmwrEXef9fG1ZOLyCOr1D7Sm0HzeWbGOoQbSneezZfZ5CN
	mCNdulYgS2Ob1ZwcHfTTsNuACjCaJtc870IlZ7X1xqesdbo8bn7jCGcdwYTDwFni46FdHzXtELM55
	COvQL+Q9qDg2ZegUPxrTOypBWsJGmgQu+UfwyYiWPZp6KwNgTIZHsx+tekNnGqoFnpJ/JQsfv8FVp
	V+ah2R4IqXF349mtFekyFg0ubrvmZp7SaYVkgnJciBJi7ISmEHqtCO7NFZMj9ApwVJKyt2rQkfS60
	NF21QYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjgg-00000003Qaz-1qvp;
	Wed, 19 Nov 2025 15:01:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjgf-00000003Qad-2og5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A86A60177;
	Wed, 19 Nov 2025 15:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ACDC4AF17;
	Wed, 19 Nov 2025 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564496;
	bh=2hkE4qrZTMJx3LKrzCmdn4jDcilUVOmMo1JI2JFIt9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jF1kZyVUcRZuYZ6D0znFY/qYj9SeF/E7/XGwlp+woe10GUz1Xi1+OK1cGPwkA/eMz
	 8VKfUaVGgtOrQikqsbWNtU9XdV9vS4MzgfuWBEWcrMWB+zLF3gY3I73Vkq/CFSo3Bf
	 +S0xu66GRHkYqy3YHdQtLtBapNkZBbk3rdk9ZP02kuYcAk+4VbVoK9ncM7/SR6Tqol
	 3Zh1+9+Ffgkhv2XoixT2grSF0IvCoFK8nnq910CsPRqec1tR+RDINHJNN4gqcGoRPa
	 t1McDzBxqTTWz4jqwhSqJyEseT2MZVT4vkcwoK8S7XBBzTfSPNauZZu/JE0l2746aC
	 rPFdJNWOWwPQg==
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
Subject: [PATCH v3 02/15] gpio: brcmstb: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:14 +0800
Message-ID: <20251119144327.13345-3-jszhang@kernel.org>
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
Acked-by: Doug Berger <opendmb@gmail.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-brcmstb.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index f40c9472588b..af9287ff5dc4 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -533,7 +533,6 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 	brcmstb_gpio_quiesce(&pdev->dev, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 				      struct brcmstb_gpio_bank *bank)
 {
@@ -572,14 +571,9 @@ static int brcmstb_gpio_resume(struct device *dev)
 	return 0;
 }
 
-#else
-#define brcmstb_gpio_suspend	NULL
-#define brcmstb_gpio_resume	NULL
-#endif /* CONFIG_PM_SLEEP */
-
 static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
-	.suspend_noirq	= brcmstb_gpio_suspend,
-	.resume_noirq = brcmstb_gpio_resume,
+	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
+	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
 };
 
 static int brcmstb_gpio_probe(struct platform_device *pdev)
@@ -755,7 +749,7 @@ static struct platform_driver brcmstb_gpio_driver = {
 	.driver = {
 		.name = "brcmstb-gpio",
 		.of_match_table = brcmstb_gpio_of_match,
-		.pm = &brcmstb_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
 	},
 	.probe = brcmstb_gpio_probe,
 	.remove = brcmstb_gpio_remove,
-- 
2.51.0


