Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BBCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 00:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Pr0PVukGbNkeP8G2dGCfDRq3OTOzwAX5xxg92vT4vo=; b=fazEh2F11tQ//tAojNKFQmrYhC
	ExhPvFVp+GWPvRJLOO1sYGRTYseyIZsytN0T2IRtGdOqRPjBwpEebAMnfKPRleHpQ3Evg0WLg/GoB
	qv7cSJdmGXkh7hTue83TZ8jUzu+62KVygeWPP2SruMceHCtlFUM0onrD5Vq4DH+0FXI7IyiSjFrR9
	BOr0mZBaFjvH7aCqe9bIMRVnrScUoLAMX+6CZFWHUBvNTioBq0nTpL15j7ntY+3Z4iE+Znj5lEPhf
	e8hk23jJFc5x4L8olIWQpxkKD3PN4m2B2/oyWp3jgWsB2BLwZ5xRaPXehHgYI6aBLQG0EriDRef4t
	MhTOTQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKc7-0000000ArAj-1y65;
	Mon, 24 Nov 2025 00:39:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNKc6-0000000Ar9T-2Iu1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 00:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 905F660051;
	Mon, 24 Nov 2025 00:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB34C113D0;
	Mon, 24 Nov 2025 00:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944769;
	bh=WC2+M04mYIr7o/NCr0cavY7IkNFLvwHDNt3oNg9JZgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=injHsrPyUjQPVCB/XUK9TR/rVyA96b5LN3X2gMrlqfvQ4jgwmo8a59bmZDQ0z2qqY
	 ZONmeNhAyvEp8+tgEoyXatj19NpSmsrZguNCw9Wzl3KxtyuETNxXdC1iXGcZLWv7rY
	 yb5/IhB0CjUlq0GIaqcEm51vbJOoxxBIx+QffQHC0JRLYn5YpHyyqV7fqFd+nasIBg
	 NNESW2mVLwHrD9jzIpyLvvw9/DXcVrV0ycqurE/HIurN+gM1UUnc/RyXziMlBtiPiZ
	 kLfliUxCLghzNfs1jG2z87gJpfNyFWAQaEsPkhJfHLoxMqhCXwQJd/VGF2p4WS/l5t
	 T59JfPRgEPMrQ==
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
	linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 07/14] gpio: msc313: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:58 +0800
Message-ID: <20251124002105.25429-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpio/gpio-msc313.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index b0cccd856840..7345afdc78de 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -694,7 +694,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
  * SoC goes into suspend to memory mode so we need to save some
  * of the register bits before suspending and put it back when resuming
  */
-static int __maybe_unused msc313_gpio_suspend(struct device *dev)
+static int msc313_gpio_suspend(struct device *dev)
 {
 	struct msc313_gpio *gpio = dev_get_drvdata(dev);
 	int i;
@@ -705,7 +705,7 @@ static int __maybe_unused msc313_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused msc313_gpio_resume(struct device *dev)
+static int msc313_gpio_resume(struct device *dev)
 {
 	struct msc313_gpio *gpio = dev_get_drvdata(dev);
 	int i;
@@ -716,13 +716,13 @@ static int __maybe_unused msc313_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(msc313_gpio_ops, msc313_gpio_suspend, msc313_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(msc313_gpio_ops, msc313_gpio_suspend, msc313_gpio_resume);
 
 static struct platform_driver msc313_gpio_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = msc313_gpio_of_match,
-		.pm = &msc313_gpio_ops,
+		.pm = pm_sleep_ptr(&msc313_gpio_ops),
 	},
 	.probe = msc313_gpio_probe,
 };
-- 
2.51.0


