Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1484CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Auptu0K+asnu6CU+7KJoQdTihUUvVzhdRIPr56LBhZc=; b=Vr/G5BJqqKL/PAiuZQJsD6/wjC
	to1/U8XpAs54Vy43/9BH5BtgWeNCoaDMQY96F+dDztOq1deQrzDPHHhCny5Ngbi1PCFt/NBxvCshk
	8TI9sc9sHhIAIkBGI/PTpGISB4g0HNc1Ye3dbrnCRhFcmBBxicRut3q9+fKV0CvfVF3y/hNcNR7n+
	XJtsEBsbCWXKANcgRx42TNBOEz2NibiFrsB5uZUeTR8mcZH/sEAvSXl+L5fbsGQKC+4gbXS/75luM
	yqGV99lU0+7PBSCXt2gxEYt9iUFMhmgytmE9X3rmC1T32OTW2p1YSBBePfaZm8xgyF0nJaeF92FJx
	+cm4o45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpN-00000005UUC-2wwq;
	Wed, 20 May 2026 18:39:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlop-00000005TGB-3bj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:39:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EF6C40BC5;
	Wed, 20 May 2026 18:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C5D1F00897;
	Wed, 20 May 2026 18:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302339;
	bh=Auptu0K+asnu6CU+7KJoQdTihUUvVzhdRIPr56LBhZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gu3hqgNXSSBWSAzl/z5ypBW6SYI9CfaDgDSK+ol9/yh3aXlQqypeyxw5U0WBnSPdp
	 2iiS8Xhxq8S9lt0lcYHEfu5LP5ONnku5RNmA56DjbtuA9NEblnYvnKQPP+9ev+vn9p
	 bUcoLs3Gx0/qfFzNGjiaz+szHCox6BJoGmac9lWtkK6jpILryIfbPFBRU7BS4PBCLg
	 J81yFkxfiWCP+HCQaY1nrR9iqiguW6REipqVDMOOyry/Gt0/VcQ6teqSz7EfN4HIp1
	 1n6VbeTwTsDVVJBTKewkiBwr7cG7zNyX2VwF7BF/+UJ/DnJbOQh46qHApQCUufqTrt
	 51N8Flosokb+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
Date: Wed, 20 May 2026 20:38:07 +0200
Message-Id: <20260520183815.2510387-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113859_949900_FEC064C8 
X-CRM114-Status: GOOD (  22.21  )
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

From: Arnd Bergmann <arnd@arndb.de>

Most users of gpio-keys and gpio-keys-polled use modern gpiolib
interfaces, but there are still number of ancient sh, arm32 and x86
machines that have never been converted.

Add an #ifdef block for the parts of the driver that are only used on
those legacy machines.

The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
passing an IRQ number instead. In order to keep this working both with
and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
the gpio number if an IRQ is passed.

Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v3: resend
v2: skip the fake GPIO number passing from mfd

The removal of the arm platforms using this is not yet going to happen
for 7.2, and Dmitry's changes for the Rohm drivers have not yet
made it into linux-next as of 2026-05-20, so for the moment I
would still like to see this patch get merged, even if we are
closing in on completely removing the legacy gpio support in
the gpio_keys driver, so we can make CONFIG_GPIOLIB_LEGACY
default-disabled sooner.
---
 drivers/input/keyboard/gpio_keys.c        | 7 ++++---
 drivers/input/keyboard/gpio_keys_polled.c | 2 ++
 drivers/mfd/rohm-bd71828.c                | 1 -
 drivers/mfd/rohm-bd718x7.c                | 1 -
 include/linux/gpio_keys.h                 | 2 ++
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index e19617485679..d748a54dc51c 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -528,7 +528,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			 */
 			bdata->gpiod = NULL;
 		}
-	} else if (gpio_is_valid(button->gpio)) {
+#ifdef CONFIG_GPIOLIB_LEGACY
+	} else if (!button->irq && gpio_is_valid(button->gpio)) {
 		/*
 		 * Legacy GPIO number, so request the GPIO here and
 		 * convert it to descriptor.
@@ -546,6 +547,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
 			gpiod_toggle_active_low(bdata->gpiod);
+#endif
 	}
 
 	if (bdata->gpiod) {
@@ -583,8 +585,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			if (irq < 0) {
 				error = irq;
 				dev_err_probe(dev, error,
-					      "Unable to get irq number for GPIO %d\n",
-					      button->gpio);
+					      "Unable to get irq number for GPIO\n");
 				return error;
 			}
 			bdata->irq = irq;
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index e6707d72210e..0ae0e53910ea 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -301,6 +301,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
 						     "failed to get gpio\n");
 			}
+#ifdef CONFIG_GPIOLIB_LEGACY
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
 			 * Legacy GPIO number so request the GPIO here and
@@ -323,6 +324,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 
 			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
 				gpiod_toggle_active_low(bdata->gpiod);
+#endif
 		}
 
 		bdata->last_state = -1;
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index a79f354bf5cb..df6dad762ec9 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -39,7 +39,6 @@
 
 static struct gpio_keys_button button = {
 	.code = KEY_POWER,
-	.gpio = -1,
 	.type = EV_KEY,
 	.wakeup = 1,
 };
diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index ff714fd4f54d..dd774aa8828b 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -20,7 +20,6 @@
 
 static struct gpio_keys_button button = {
 	.code = KEY_POWER,
-	.gpio = -1,
 	.type = EV_KEY,
 };
 
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
index 80fa930b04c6..e8d6dc290efb 100644
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -25,7 +25,9 @@ struct device;
  */
 struct gpio_keys_button {
 	unsigned int code;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	int gpio;
+#endif
 	int active_low;
 	const char *desc;
 	unsigned int type;
-- 
2.39.5


