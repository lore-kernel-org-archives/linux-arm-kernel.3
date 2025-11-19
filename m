Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBEACF3961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29K0dFAcsscjHD5STsKDAi3ntwRyoaRwVQFxzDpH3AQ=; b=bygNzUlFUKjPDOj3edG5qQ9vwO
	g2UZ5X8tmjHCc++wvBrtCtpwpSiWVxwCgQ5R6pkTR0bLSmtrOL7dm9Q11sDk8eUaepsPRMU/4lGzg
	TrLeyTBJyeIxwNXleJgfu+SAWDGBSOGxufv5D3x8avgsBTAc9CBZDHIaTD/UZ9V9jZYI/HA7bNbun
	fk21W9bfClJmQxE/7RgIlhh21nl70RQWIr9nHPrerr0SzHEMnfuE002pSEJea2sLgttUa4UnlJg6e
	Irm7BHxafGpsm4b9CR6G/ljr2WIGpolAE0oX8wPRdH/tb6NxNQfKtvohIqQqqPclnp4Z4vgKx21Up
	03FguLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPU-00000003kcr-1OjF;
	Wed, 19 Nov 2025 16:52:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlPP-00000003kVm-2unf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EDB2406CE;
	Wed, 19 Nov 2025 16:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE50C4CEF5;
	Wed, 19 Nov 2025 16:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571115;
	bh=3m03+o1uul0EMqM9dDxOK/eGbWfiEkDRYFrWiLilPvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a8cLEvHynyCIHxSr9bCntp1znvd1VnzvutbMsC2Z5TrWvNGgJo7qe5wrFPyvnZFey
	 U4iT9bY6G8k+nQRzIXnWEE/oJPhvsI43EK0Ojr2KZfp6DO6xixyHlmWva0Mjhsc+BG
	 x6SOIL8LYz9Pof/iqSENv2LzlpvtknOnTyWi2fE4NU8Z0sBYlXZLsJqHzh5CZaw7bj
	 AIm+knCk/k3Xg6w05kUMz87NdRhy5hn2/copp1IyiV9PixTiqW/YeLaDFJA0yf/EwZ
	 7LPik6l0jKUIm2YJnAHpKLP9kNR2RWSUEph1aT/KvlGoybCRSBmfaQ2f+Eb0kxo/8K
	 0cKXXy0M6u5oQ==
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
Subject: [PATCH v4 08/15] gpio: msc313: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:20 +0800
Message-ID: <20251119163327.16306-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
References: <20251119163327.16306-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_085155_785067_1ABC7D06 
X-CRM114-Status: GOOD (  14.91  )
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


