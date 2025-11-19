Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358D7CF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIhFkLBunqM0Abn6/uU5TLGF1F5UyouubCSrjofOUZY=; b=ixxapuJPdY6UkuMlHOkf+9Hr0/
	lprUFCukRWfHUPxqKD6XwC7M7hWBg2IXjqBSuBdifyUe2OJry4d+5nnxh7PK2g+Fo77KMv7/1vIQK
	jkiX2CouhHK772GjPd7sDVcBfWOtrdicmeC2nOaiGKVQUwY4KtrUqRfiMVHecHsu3CJvL9Dx7Kovo
	G4K8sRY/9hbyBk6Co4HLzHBCdrmiHB3cMQny9mnQG8UOOTDtq8JYAlQnuxPg/epsc6xMOHXx4tGOF
	rAfFWKGoZluA6dd+83KsT4AeMSokq4EWUfalcCZu8fRougbqvDIi/ZhQz47ZOONKW/ILnnl3EwXFl
	GU4eNGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPF-00000003kK6-33nE;
	Wed, 19 Nov 2025 16:51:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPC-00000003kGS-46jv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A92A2406CE;
	Wed, 19 Nov 2025 16:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4660C4CEF5;
	Wed, 19 Nov 2025 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571102;
	bh=QwUEwA3W4uoGikamrTnsYO8wbCGZ57Q4s7Y5tcCZlBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXCBOHKpIz9x9NZxo4o0Uv4HVwPZB6sAi+6Ad0vjNHnOrwlKorqkZeMbrW6SksB/A
	 qN45Csi0xe1fbvpY5fgZl9A7yipQcX7GPcY2JSOVVZZX3oXjJyD/rEUfphh//x8bLX
	 TLpyWZa1trodf8Uw7C/bB6IOlP7IgKqawevF9qJIn+cNWhGxi+noUfKmyXR2Vt1ZVp
	 vVXMoNKlCHuBsI3ZUm0nshbn04bEpGPlAboZKhAey16v4vBWsUH8XpyPUEsuOaujTn
	 9LeZWDTE+GgWYrOswRdepUHasm0gmLmMhlJRRun7EoYcg7Cp8mxXU7oTuw87zaJn2Z
	 cIK1qMsAPOdmA==
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
Subject: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:17 +0800
Message-ID: <20251119163327.16306-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
References: <20251119163327.16306-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085143_048108_9169EF81 
X-CRM114-Status: GOOD (  13.64  )
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa22f3faa163..17350fea2113 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -67,12 +67,10 @@ struct pxa_gpio_bank {
 	unsigned long	irq_edge_rise;
 	unsigned long	irq_edge_fall;
 
-#ifdef CONFIG_PM
 	unsigned long	saved_gplr;
 	unsigned long	saved_gpdr;
 	unsigned long	saved_grer;
 	unsigned long	saved_gfer;
-#endif
 };
 
 struct pxa_gpio_chip {
@@ -746,7 +744,6 @@ static int __init pxa_gpio_dt_init(void)
 }
 device_initcall(pxa_gpio_dt_init);
 
-#ifdef CONFIG_PM
 static int pxa_gpio_suspend(void)
 {
 	struct pxa_gpio_chip *pchip = pxa_gpio_chip;
@@ -787,14 +784,10 @@ static void pxa_gpio_resume(void)
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
2.51.0


