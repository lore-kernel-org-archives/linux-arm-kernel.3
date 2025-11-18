Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F9CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIwlobU5qaQosfPCeEzKdUoDXDclRRcMzd/1Ell80Rs=; b=0Q2k024U4K2ZIY5yawNz9IYFV1
	+ulQfg2rlI+shumm092zLAZedhbTrK659XdiGDjEBvdev4+j91gznFogK72Z3zqxR/UdGv9X6Onzs
	mNkRz3memPCc8ipkd17ln7kJqH/jyl9Kl9qRnnLaDo+wZjhqaUItzC5GcOkmI+YPxcE26+s5BG6T5
	gWoITtayZVn2AjI2euDbPZBLPdagRSrQrFWTnVa745wrd0DZpxPdUa1s1L+cYluGAUTXvuCWeVDDm
	ZXqnmmQ44qamuj49ZmC1h9LtBGF9+anfydSdotYGZL7HYKm/f/Qw6DDrhoe4i/VKxWZNZFtD7M79p
	1pDv7H9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9w3-0000000H4C9-1VKM;
	Tue, 18 Nov 2025 00:51:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9vz-0000000H47R-1Fsc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADD3E605D4;
	Tue, 18 Nov 2025 00:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649D3C2BC9E;
	Tue, 18 Nov 2025 00:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427062;
	bh=b0QGRj1zJhMlxhEi1e8gZ427wDLzbANpOOdNU7pTMXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSDvLOqLC6Su6v05duZuemZY4oFxhzfCkSUp18lFu+pkS3nzWACmUmuG61vVm46E+
	 Oxj7dL4O7TY1TNB1HOAll1vshHZMlKEyGcuZ4zAdyFJsvpWVzztxrMGJEMA0Xro+8C
	 amStortbZve34SZt3k8gOMWsh7B2VrqpEkr6MdW/nlmlfVMP9Ktp3lAM+lYYvCLD0a
	 URhwg6Aeo0oeKaOEomqfNT+AUu8qWeocdfovofDVX1naySGvI6y0F6H6b2hHHcX/SA
	 c7xKz4N0flAjDYyKPz6Zsip1ugXyBwx2ZcR6XwCxjISEnrnW7PwXSXSQJsisAGRQkS
	 sKgCnk+NkFkAg==
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
Subject: [PATCH v2 07/15] gpio: mlxbf2: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:21 +0800
Message-ID: <20251118003229.26636-8-jszhang@kernel.org>
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
 drivers/gpio/gpio-mlxbf2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index abffce3894fc..6668686a28ff 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -424,7 +424,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mlxbf2_gpio_suspend(struct device *dev)
+static int mlxbf2_gpio_suspend(struct device *dev)
 {
 	struct mlxbf2_gpio_context *gs = dev_get_drvdata(dev);
 
@@ -436,7 +436,7 @@ static int __maybe_unused mlxbf2_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mlxbf2_gpio_resume(struct device *dev)
+static int mlxbf2_gpio_resume(struct device *dev)
 {
 	struct mlxbf2_gpio_context *gs = dev_get_drvdata(dev);
 
@@ -447,7 +447,7 @@ static int __maybe_unused mlxbf2_gpio_resume(struct device *dev)
 
 	return 0;
 }
-static SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
@@ -459,7 +459,7 @@ static struct platform_driver mlxbf2_gpio_driver = {
 	.driver = {
 		.name = "mlxbf2_gpio",
 		.acpi_match_table = mlxbf2_gpio_acpi_match,
-		.pm = &mlxbf2_pm_ops,
+		.pm = pm_sleep_ptr(&mlxbf2_pm_ops),
 	},
 	.probe    = mlxbf2_gpio_probe,
 };
-- 
2.51.0


