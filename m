Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B849CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc6rMr/mRe0Cq15gb2LDfgQs9mI69Rn7UIOf3ughC5Y=; b=hOnm7SJD89bI+iMneVFv9GC2wr
	wmpufAFmSCzAbdMnAIHlnNkiOfe0bRB497DqBS8jBPsb9Np9P60bKkDcFG2iSaiC9nCWHhIZ6GNrk
	ohQsGcoDEe+06mKqyI/9kGwi9BU+cicaL7QVyD9G3C0KPFj0AQpnXFGTrqIn5E97zcBxGrFz8fv/7
	bpyJcB3RyhNc6f+EM4eF9UgcEy5ZAjH7MVrZ3VE2FE2emcE/sx1BrYCRMbHOSjYCf7KntYYxf9de9
	hdor73GQ8sZ0C44WZnn8kgtPmknG3ecZWtdwSWzJnm/mDc3CghTmQFo0TU8+8RY+4ggI9yuNTIs+3
	6ERVH1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wR-0000000H4a9-2SQw;
	Tue, 18 Nov 2025 00:51:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9wQ-0000000H4Xk-0HXg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 565586025B;
	Tue, 18 Nov 2025 00:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09793C2BCC7;
	Tue, 18 Nov 2025 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427088;
	bh=VPRuMvDGj7ds9h4LXc+zNbk2IceZVhyaJoduENnSGiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fSDicQY2z7Tn6m96WCY5+zbuY2fv5IxP19yHIjp5HSGY7UT+ztJiObDpY/da70mTo
	 FcoP+CDp1deilWwXcGLrKXUZal1ZWAKf/95OXLDZvxwsC/kFsjMH3wNk91ijSaYY+d
	 lxUzR3DmDN+scmGAr1ipC6oBCDOc6T8f5pd/i3MQejXsf9oTPTkTL8WRfcE96RIKhE
	 NUZVoGLKwHB4MwGUx0+Go9Kv0oAcpapWHKyqBSl9Ax/5Bg5DFlTP/j/GmUyZ1yj6dX
	 O76V4Fv+UALyEkwOcQttDHugvYiKE5IU75ykb0SYstiWwpHEBRnHCQVLan76StYWR6
	 YGn9hKcG4Cf4w==
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
Subject: [PATCH v2 12/15] gpio: uniphier: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:26 +0800
Message-ID: <20251118003229.26636-13-jszhang@kernel.org>
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
 drivers/gpio/gpio-uniphier.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 197bb1d22b3c..0574dde5b5bb 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -426,7 +426,7 @@ static void uniphier_gpio_remove(struct platform_device *pdev)
 	irq_domain_remove(priv->domain);
 }
 
-static int __maybe_unused uniphier_gpio_suspend(struct device *dev)
+static int uniphier_gpio_suspend(struct device *dev)
 {
 	struct uniphier_gpio_priv *priv = dev_get_drvdata(dev);
 	unsigned int nbanks = uniphier_gpio_get_nbanks(priv->chip.ngpio);
@@ -448,7 +448,7 @@ static int __maybe_unused uniphier_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused uniphier_gpio_resume(struct device *dev)
+static int uniphier_gpio_resume(struct device *dev)
 {
 	struct uniphier_gpio_priv *priv = dev_get_drvdata(dev);
 	unsigned int nbanks = uniphier_gpio_get_nbanks(priv->chip.ngpio);
@@ -473,8 +473,7 @@ static int __maybe_unused uniphier_gpio_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops uniphier_gpio_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(uniphier_gpio_suspend,
-				     uniphier_gpio_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(uniphier_gpio_suspend, uniphier_gpio_resume)
 };
 
 static const struct of_device_id uniphier_gpio_match[] = {
@@ -489,7 +488,7 @@ static struct platform_driver uniphier_gpio_driver = {
 	.driver = {
 		.name = "uniphier-gpio",
 		.of_match_table = uniphier_gpio_match,
-		.pm = &uniphier_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&uniphier_gpio_pm_ops),
 	},
 };
 module_platform_driver(uniphier_gpio_driver);
-- 
2.51.0


