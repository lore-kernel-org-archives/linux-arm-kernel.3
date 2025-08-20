Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9DBCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut4oI0N7/0nUwZhee4YJz4lcotNsCMK5iGckhWtcKug=; b=vU0qkk8rfO+ybAC4ZITWfPVvU7
	cJJiSnMgDlB92jcaRq/+kd1E3tMeJ0r9V8vL5F/mlAWIb8AcSXm0WZXZMK9SJgM8NUXWbyzY5m4Ih
	kEUe5Z8kM4m5axenjy+daNVJypU9c6kZjmP0aTK8pzWQN+DG2DXo6HrlneSzq0gtub0ggKAUWF8Yu
	5D+EMXwjBmhZRj6bSAmLKReZjaZ5U7ydWtUJAWi4p9fmE2OqHm7XLAZLoxW6e5qQE5kEun8p4HtAN
	OTIum1KUtEKv5UXRmkJ1WtNZvTnOdvccisWpzsoMgxWVzdd+E4caat9OlETk4WFgGYfRSqX8ZNRin
	rMqU7rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkX-0000000Erxd-2SXK;
	Wed, 20 Aug 2025 20:49:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolCg-0000000EK5c-1uMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D995C5C694B;
	Wed, 20 Aug 2025 15:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE431C4CEE7;
	Wed, 20 Aug 2025 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705501;
	bh=aVoXTtsvhaosrLhSRxcZ+cIPb5uQPbIY1uKxiV2Spso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5dcz1UqdHbjUg+r49tsZneSmpjTus6c2ZMTVa6W0KwZVA5b79wV7LOJ75uiA169H
	 msIA1UfdWjOghB/pUnOWYZwlXT2mcW3kZkjfBfhfmMfcbfolYAPP7uLJQZsTWmnglh
	 Gs/nVyMG5uu+3FmwGulG9MRwKFh3OUZ90435U0exhAdH/XwG+3sOBzuEiHrWqk98iq
	 5vGvfHlI/2Cgo4W9zTkHE+wFbbC3ubVY549drBLDNvWIQimT/X01FQxT3o48souftF
	 jfMm36jradpBwtN3tCsXpj2UMh4XPZTrUpAoHQepieIewDZ2GAnSrAaV0R5jsHrjN/
	 HY0MNLBPLnGOw==
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
Subject: [PATCH 02/16] gpio: brcmstb: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:23 +0800
Message-ID: <20250820154037.22228-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085822_571120_B2E21B8C 
X-CRM114-Status: GOOD (  14.29  )
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
---
 drivers/gpio/gpio-brcmstb.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e29a9589b3cc..0ca3e0d8aa46 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -534,7 +534,6 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 	brcmstb_gpio_quiesce(&pdev->dev, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 				      struct brcmstb_gpio_bank *bank)
 {
@@ -573,14 +572,9 @@ static int brcmstb_gpio_resume(struct device *dev)
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
@@ -747,7 +741,7 @@ static struct platform_driver brcmstb_gpio_driver = {
 	.driver = {
 		.name = "brcmstb-gpio",
 		.of_match_table = brcmstb_gpio_of_match,
-		.pm = &brcmstb_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&brcmstb_gpio_pm_ops),
 	},
 	.probe = brcmstb_gpio_probe,
 	.remove = brcmstb_gpio_remove,
-- 
2.50.1


