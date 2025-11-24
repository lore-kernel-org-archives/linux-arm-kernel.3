Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81201CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcEoGqoyw8QQRW0cvEw+qrVp5/GCJykCAzAwGqnzN3I=; b=S31GKVcKh6LA+LgdaHJ1Wx7MlS
	xJHKPDDEvhTl0EoFOY1D2K08VmXdtXkCA5Tf/doibde1MFa4+28MIz315+2NnmUUf7FPaxgsvZUva
	s9k/KQd2H5QdHoZjIj3RPhOu1MfndUiWyc3DYXFkUCBgcxUvHzGZUdgX8TLt46YtHFH/lwb/reWmx
	tB6xNHDO7lAKt2JoXICLLwPiy7Tg2JFaVURvqSx7mD2EPog7XbsAFctI29/nYehX+MFy4dkoRkf4d
	2jFdEGAIx6p2rvk3bfxzurFoIyYdN0P0yEx9WJOtsRjjQTQmNUNr2TLjtzdvQPM5fXEC8oW/mrEuZ
	eYvnhmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbp-0000000Aqzi-1fl3;
	Mon, 24 Nov 2025 00:39:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKbm-0000000Aqyf-3huZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6C2444341;
	Mon, 24 Nov 2025 00:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140B3C113D0;
	Mon, 24 Nov 2025 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944747;
	bh=2hkE4qrZTMJx3LKrzCmdn4jDcilUVOmMo1JI2JFIt9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gX9BEm0V2hbEZTdzOHE3SV6ph03SBheYsYdTyWZVuM9MXFg37dRlmXHQcmpCF4vxk
	 7MqVh6kXbftGVrkDxJrAQ9p8DyuANgbAK37avBppEk9PSlQ2LY7tIfHij8+iAwKsIQ
	 hQoYr6stQ555kinDrJsYeRLWDQcGtetXfeeQRrlaEe6YLdE23B0Xiq5nnroMJdxjDU
	 eRyjqM2NATSTVyRe1c+h63m8ruq19P+wwAazNsXVBgHgDni71DSq+KVmEnH7mHuzE+
	 Lg848RwYoH4Vf32LlSxkle4Y1EuOJ8ka+GD9F6pJkYKl0dq76roByayYbFsFKL6daN
	 GjBvn7k6Onesw==
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
Subject: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:53 +0800
Message-ID: <20251124002105.25429-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_163910_959944_BA9617D5 
X-CRM114-Status: GOOD (  14.49  )
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


