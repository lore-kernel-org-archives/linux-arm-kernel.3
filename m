Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E1ECA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiKoz+YouufYqOh6BIG65LAEG3PR5n5zIMeouy0/+00=; b=Z3vNZsA7AMM8TxQC7TYXuVsRm+
	Rq68h96aCuYYL0EVsh9gjrgRWaAhtVF8OjYIiO0jwOA1PFBl3UJiJPU3xewp5BpGHQn4Tt0PZTj6I
	ERo5AQoY/HY0aGH05mkhIf93pa/ez7JCXWLtmu1NLZ//UoG2VUYl5gaHuHmpoLDpdirt0JTaum+kF
	JaKnduJ9zpfJmBK5cs2oroYXXltq1W8iCWhd290DXTrmkmma8t3uIWZd0cdsacCs8KGSCvpZ/I4f1
	bhfYLAvuBnzA3jM7uLHHkISbYqrI13UJVH04kJU8WrW49NeZfOOvFBdZzr8Uo5O8hmMUJVwlaMPHP
	0KFXUhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopka-0000000Es1x-3X1g;
	Wed, 20 Aug 2025 20:49:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolDO-0000000EKDc-0YDR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:59:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FFB75C5B4A;
	Wed, 20 Aug 2025 15:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5B3C4CEE7;
	Wed, 20 Aug 2025 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705534;
	bh=oPqtKgFreHnLsUNC2EY7WHHjaSeINUT8RuOawyyZA5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkZkH2wBzqw6wGRB5skSUnmXedvk5OgGjsCW4k/UVKgQeWK0RTDu9YWTYizL1nPYJ
	 9p8wx1jNTci75I8/TYE8CTalbUKTpEjcCd2XrPATbUF6Kb/UKgAWjI1yHjxQcwR4Fk
	 rX7DSnyqpSpZK4wgXRuNQsF3ovroyfQAlvVZBbQlJbTVZmEINAktLdEu67Fm64/qri
	 hA6fxX60L/MyI5tf+uiZd6T+mpUFLHUuoyIM1ZGvCAAYGmRrd2JoLS9sb5KOriWcUC
	 OPTc2NxJcQz33eQkssFTNCFZabFQphaTjjO36jRIcLoqD1Abgvi7dMw0JEAC10xN2R
	 2HWvFsB4wrA9A==
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
Subject: [PATCH 06/16] gpio: pxa: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:27 +0800
Message-ID: <20250820154037.22228-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085906_208319_EB9822ED 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/gpio/gpio-pxa.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa22f3faa163..288c72f9c015 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -66,13 +66,10 @@ struct pxa_gpio_bank {
 	unsigned long	irq_mask;
 	unsigned long	irq_edge_rise;
 	unsigned long	irq_edge_fall;
-
-#ifdef CONFIG_PM
 	unsigned long	saved_gplr;
 	unsigned long	saved_gpdr;
 	unsigned long	saved_grer;
 	unsigned long	saved_gfer;
-#endif
 };
 
 struct pxa_gpio_chip {
@@ -746,7 +743,6 @@ static int __init pxa_gpio_dt_init(void)
 }
 device_initcall(pxa_gpio_dt_init);
 
-#ifdef CONFIG_PM
 static int pxa_gpio_suspend(void)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
@@ -787,14 +783,10 @@ static void pxa_gpio_resume(void)
 		writel_relaxed(c->saved_gpdr, c->regbase + GPDR_OFFSET);
 	}
 }
-#else
-#define pxa_gpio_suspend	NULL
-#define pxa_gpio_resume		NULL
-#endif
 
 static struct syscore_ops pxa_gpio_syscore_ops = {
-	.suspend	= pxa_gpio_suspend,
-	.resume		= pxa_gpio_resume,
+	.suspend	= pm_ptr(pxa_gpio_suspend),
+	.resume		= pm_ptr(pxa_gpio_resume),
 };
 
 static int __init pxa_gpio_sysinit(void)
-- 
2.50.1


