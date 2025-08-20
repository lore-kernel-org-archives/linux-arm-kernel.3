Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C10CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQGlZyMtjt2hQanYDnkg+M8dWrqHnnuczk3tSQ8lubo=; b=JkVbvHej3UfsJL6vx83RsJhhfB
	cdZmjTyYtsx1hD2DP8eG2jR87WnSa3ILq24AEGAwsVJ7FBtH0fFqg+8q5FRe3OLThJMDU6zWlaXSs
	1F2ePgc5TF0NvqSOS8vABetp/N50PfgrP0v9blzdbI6B55XD5Tb5ZFTaVxJEZsMre5ScaXvOlANs2
	I/boZfv9HVOEeMGT+6oQszIv6rnrgwRbOiHrwyr0qwA0yuaALHwwU9UR9nzPb9OpzALLavf+Ud7FJ
	hWmOqWVg7STLJOQxZ6aW+zasdo+FMZuiDiY/LFochyZs8AqD0tieoNKC/M3t1XN4DoexIN8aqy70E
	mIWcavdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopki-0000000EsFk-33IX;
	Wed, 20 Aug 2025 20:49:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolE0-0000000EKIc-3Dzn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C4C3437FC;
	Wed, 20 Aug 2025 15:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6A1C4CEEB;
	Wed, 20 Aug 2025 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705584;
	bh=fUBvkDoKUMnEXdyxqRdGgiK6Oe8z9HAnOskAEd9VzaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FZfBAqZmnAwyBbNiE+SqetenHZ5sUFd97H2/FDMlumLzSMvbRqWlBnuL0CrSepOK5
	 6O1ytuAIBK9CRmm6QXXx+Y8gCd9RjymlHLkdxe5ZQHcKwxkQ87SGLJ3qu47fP85Xyg
	 MXuvZ1P+DngqxQSER5BC8Tt6VDl/iPZ/TjNoE5bxGQb6flAc6Xt6BHuQ4G2OoHByTP
	 kvfKPf7i0xIxk3wR26V3zTAhbBZ/WV+WVHJieJCZ27NJunAiD9WzAkHSsBSFsFON9J
	 I1IjlxobIGpgU8PV4fwN0lPy1nqS5Ydoo50mC3sn0NHsvn+T7N8AbL4gGf5xH6pHAD
	 Fruq0nsVVs6Zg==
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
Subject: [PATCH 13/16] gpio: uniphier: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:34 +0800
Message-ID: <20250820154037.22228-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085944_844426_033506B6 
X-CRM114-Status: GOOD (  14.03  )
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
2.50.1


