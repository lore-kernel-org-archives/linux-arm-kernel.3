Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A634CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7ad9YS8GKFX6PUFbYIYBW6JWmL7J5wY6hoTgHoU3QQ=; b=eybb2Mwqj+TSQRPQE+L90YnlJN
	/RczIKEFUMI+OTpPONR3X4IGg6f3iZUgpEoU/a5PFAnh7b5nIQG8RUhZb1NmthvLHPWCeKZPvJTch
	s1Dfp6t+H+cTJvJ9uhaRshqYjqyTP1Wao3s6s5SH80oqVuYwK8VqyQRRg2x7A4759VmTWzux0f2j3
	UFMZe4mP4T6jxqGvoGv+Sh0tzu68OcdVg9o/o7nA7TceN2dkGB6oQ6FA7VMNk2SaQQbTcVY3vqlBk
	d7nuB06L/qqttSQgd9cQp1oH/0fyqXoZmviFSSQbJp48MEhBuOMN176ucYArnaf22s6fi4PcCGlIC
	d6VgyOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpm-00000005VAx-0cbP;
	Wed, 20 May 2026 18:39:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpO-00000005UU1-0plc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:39:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6578860222;
	Wed, 20 May 2026 18:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103C51F00896;
	Wed, 20 May 2026 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302373;
	bh=y7ad9YS8GKFX6PUFbYIYBW6JWmL7J5wY6hoTgHoU3QQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M/QzPQdcsRJdC6Ljg5UpTwgWtuxhkJstW01aGvTw4RUpEjn4DFc4JGJpClJWMiTyX
	 Uax1ukCuzqo2DkHStJzSrNzBoOhBtgAf3d6pbUgvxDAaC5mAvLB0WWupx2hCr+raMW
	 0bT1SX3UQeTWwOp/CHqXdJ30GDCmBaZ6F8y2ndgaKy3NoIGD7FTS7rWNHDqHaZu016
	 ldOM8cp2fpMe0/Kbnxdc4R5EzBeQ99FWzB9/fhSXFDKlN7MNCjxGtX9jtGpn3Lnew3
	 uTm16eyJm403jVRTftzcSx//sTI5vPNcxIfQg5Kw1FqrlqBH74zoUjxqbeeJqhRyHp
	 8DIOJqZ2M2Aqg==
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
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 06/10] [v4] leds: gpio: make legacy gpiolib interface optional
Date: Wed, 20 May 2026 20:38:11 +0200
Message-Id: <20260520183815.2510387-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

There are still a handful of ancient mips/armv5/sh boards that use the
gpio_led:gpio member to pass an old-style gpio number, but all modern
users have been converted to gpio descriptors.

While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
and related helpers is currently turned on in all kernel builds,
the plan is to only enable it on the few platforms that actually
pass gpio numbers in any platform_data.

Split out the legacy portion of the platform_data handling into a custom
helper function that is guarded with in #ifdef block, to allow the
the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
gets turned off. Once the last user is converted, this function can
be removed.

Link: https://lore.kernel.org/all/e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com/
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v4: whitespace changes only
v3: simplify gpio_led_get_gpiod
v2: rework a little bit to keep the legacy code path more separate,
    extend changelog description

Related to this, we may also want to remove support for passing
a gpio descriptor in the ->gpiod flag. The only user doing this
at the moment was introduced in commit 1892e87a3e91 ("powerpc/warp:
switch to using gpiod API").
---
 drivers/leds/leds-gpio.c | 51 ++++++++++++++++++++++++++--------------
 include/linux/leds.h     |  2 ++
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index a3428b22de3a..d6a0369eeb92 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 					    const struct gpio_led *template)
 {
 	struct gpio_desc *gpiod;
-	int ret;
 
 	/*
 	 * This means the LED does not come from the device tree
@@ -221,18 +220,30 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	 * the GPIO from there.
 	 */
 	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod))
-		return gpiod;
-	if (gpiod) {
+	if (!IS_ERR(gpiod))
 		gpiod_set_consumer_name(gpiod, template->name);
-		return gpiod;
-	}
 
-	/*
-	 * This is the legacy code path for platform code that
-	 * still uses GPIO numbers. Ultimately we would like to get
-	 * rid of this block completely.
-	 */
+	return gpiod;
+}
+
+#ifdef CONFIG_GPIOLIB_LEGACY
+/*
+ * This is the legacy code path for platform code that still uses
+ * GPIO numbers, mainly MIPS and SuperH board files.
+ * Ultimately we would like to get rid of this block completely.
+ *
+ * ppc44x-warp sets the template->gpiod directly instead of
+ * adding a lookup table or device properties. This is not
+ * much better.
+ */
+static struct gpio_desc *gpio_led_get_legacy_gpiod(struct device *dev, int idx,
+						   const struct gpio_led *template)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	if (template->gpiod)
+		return template->gpiod;
 
 	/* skip leds that aren't available */
 	if (!gpio_is_valid(template->gpio))
@@ -252,6 +263,13 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 
 	return gpiod;
 }
+#else
+static struct gpio_desc *gpio_led_get_legacy_gpiod(struct device *dev, int idx,
+						   const struct gpio_led *template)
+{
+	return template->gpiod ?: ERR_PTR(-ENOENT);
+}
+#endif
 
 static int gpio_led_probe(struct platform_device *pdev)
 {
@@ -270,14 +288,13 @@ static int gpio_led_probe(struct platform_device *pdev)
 			const struct gpio_led *template = &pdata->leds[i];
 			struct gpio_led_data *led_dat = &priv->leds[i];
 
-			if (template->gpiod)
-				led_dat->gpiod = template->gpiod;
-			else
+			led_dat->gpiod = gpio_led_get_gpiod(dev, i, template);
+			if (!led_dat->gpiod)
 				led_dat->gpiod =
-					gpio_led_get_gpiod(dev, i, template);
+					 gpio_led_get_legacy_gpiod(dev, i, template);
 			if (IS_ERR(led_dat->gpiod)) {
-				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
-					 template->gpio, template->name);
+				dev_info(dev, "Skipping unavailable LED gpio %s\n",
+					 template->name);
 				continue;
 			}
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..e646bffcd8e7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -676,8 +676,10 @@ typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 struct gpio_led {
 	const char *name;
 	const char *default_trigger;
+#ifdef CONFIG_GPIOLIB_LEGACY
 	unsigned 	gpio;
 	unsigned	active_low : 1;
+#endif
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
 	unsigned	default_state : 2;
-- 
2.39.5


