Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8690ACF3961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhMn2TXxd1l//2DMffwczkjBWZJW5oQdA6S7mU1YRiA=; b=wWuzK0PNCqO2iy/6anvjiRcMnr
	VXTxmN+6v/sQxUqOYjhqdpSAljdPX1RxxNBzGS7bZkMc0iJr7r2OwzbTaiEv8lIJ2ykO5ZMfSfotl
	AbaPOcp9AjRfRZJ557ZDj07zYfYgTIFMfzkoAX0fg4j2qXAfVvmPQ61QaxZJ+0IRiT1khQYW4a0iM
	XnICYgxBWjbTYyW7oXO/E6yI8R979bh/YaZjZf8p5WpsJPMkGmy/RiPkPL3airP2LBLrEkmyvMrjp
	4BO2wvDO9IFEk1TwgQJf8EyzkvIZN2w9aykmztvOUgD8vTTg8FnYoKPPIBivvzPgT/+KBavP727oX
	GFmNr1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPO-00000003kUb-25qs;
	Wed, 19 Nov 2025 16:51:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPL-00000003kQv-1yfr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2686F406CE;
	Wed, 19 Nov 2025 16:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343E8C16AAE;
	Wed, 19 Nov 2025 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571111;
	bh=O5fL211jY64gu41HAFIXUFvgC/PevKGGEhVmfu+o420=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKJI00eYxEG5Ab5cjpMf2CrISnmWOu7mUgGXZohhlsPd3jN7tuPS3jvVK0oXN8CYX
	 xfPV0WeRWIEfM4b4ZB4XlyxI7ZXKU77Jhmb68jm08LecRVVqyiStiXMdNY2pn85XsK
	 WLSOHySjYauCpJlOV9MrFtHrPGFcZLB9kI0qZlUo0s5WTXt4j8953yeCQhvLdiIXkT
	 /xACrZb0Sw+tXsQFuoAEhmOpDWgEh0ukxsf3+y+nFd0aViidrpilACxYOSkJrFlxd0
	 m5rmAzkY2J/VHlnbqejWEX6doX0G85sVhEKBFSUNueDuwMkrxEJpVN0mvKS6IYMAqa
	 lWpXaGnW1ji7Q==
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
Subject: [PATCH v4 07/15] gpio: mlxbf2: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:19 +0800
Message-ID: <20251119163327.16306-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
References: <20251119163327.16306-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085151_573873_598CF031 
X-CRM114-Status: GOOD (  14.07  )
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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


