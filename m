Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B43CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww65fwl4jU6IdtSrgMz3SaeLEki6BMN7OT68LaIwd54=; b=bnT+QvfGat+DNQeeo7XE/8FcWI
	tpiw8p/6jVE26L8acKG4jFF3I3DecRNo0MnKdbcWTOx/j+Z5VtmfdAoJDTMtgR4q/PGnjSkz930qR
	iS3inAB9ta/x4D/LafW1p0AKNOvrt1XJw2fehu92BG6NzQk9a/LreMaVaal8gIzmFj3cvuG72Ydr2
	wXEn7Hd5Aby2StXvp2WdYlynrijVXm/I/Wf6XgXOM9PcR9TSM2pQwe9TcwmqmuPel0JF7WH9/3u7J
	re6lLbHf75wE8WQ1lyUj/yOC5Kgp9ZcJznQ/RXCzdVJ0cqPDYvVf+0FHv03JFmuX6inEDWE3bkDIB
	ckfxh/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkc-0000000Es4w-2UC0;
	Wed, 20 Aug 2025 20:49:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolDS-0000000EKEZ-1RGo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2AB75C5B4A;
	Wed, 20 Aug 2025 15:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3910C113CF;
	Wed, 20 Aug 2025 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705549;
	bh=Btlz6e0m5nsKlm/WiyEAFlAcvcNJrm4cKvgRCdFu898=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o+AdY+vSvwyhTwbI+H/jBNGpY/E2Hr5ZSVxwGBXnxBEFEuDsow2eYFvlsqpt9IH9g
	 zvyQ15X8ZGKGKYB7FscQFyKkuDtOjArVt4P0P6Gz6rX948+V6pcRpZuVhkhWHrgM1t
	 3JKzVMhpLw/vJElHd1AdUcQ8jJyyyR4qPNAvjt3tLpevr4hsB5HwY2OCBLCWMach9Z
	 pnnwsJiqM6t/jEqjjplonyMNDpkqHKQRRyGLFDBfUoZUoPQYcmhU5GIrM7woNaXJE8
	 RKS+D70JGCQhMMf3lK/yJZ44b9bih3xnrzO1rQqzaIyaIgUHxwXqFtdpbcU5Y6lWWK
	 s4eMWm/x63W7g==
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
Subject: [PATCH 08/16] gpio: mlxbf2: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:29 +0800
Message-ID: <20250820154037.22228-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085910_418275_EB625156 
X-CRM114-Status: GOOD (  13.43  )
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
 drivers/gpio/gpio-mlxbf2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 390f2e74a9d8..f3112d949195 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -431,7 +431,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mlxbf2_gpio_suspend(struct device *dev)
+static int mlxbf2_gpio_suspend(struct device *dev)
 {
 	struct mlxbf2_gpio_context *gs = dev_get_drvdata(dev);
 
@@ -443,7 +443,7 @@ static int __maybe_unused mlxbf2_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mlxbf2_gpio_resume(struct device *dev)
+static int mlxbf2_gpio_resume(struct device *dev)
 {
 	struct mlxbf2_gpio_context *gs = dev_get_drvdata(dev);
 
@@ -454,7 +454,7 @@ static int __maybe_unused mlxbf2_gpio_resume(struct device *dev)
 
 	return 0;
 }
-static SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
@@ -466,7 +466,7 @@ static struct platform_driver mlxbf2_gpio_driver = {
 	.driver = {
 		.name = "mlxbf2_gpio",
 		.acpi_match_table = mlxbf2_gpio_acpi_match,
-		.pm = &mlxbf2_pm_ops,
+		.pm = pm_sleep_ptr(&mlxbf2_pm_ops),
 	},
 	.probe    = mlxbf2_gpio_probe,
 };
-- 
2.50.1


