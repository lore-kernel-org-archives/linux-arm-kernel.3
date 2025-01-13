Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D90C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O8BceVaL2rjNyb2dz0noQpxrsT3ePs/ZHQ+AQPNyYI=; b=llZFQpJa/vq/a2YKRy9vWyMXyH
	kTMv32Mui54wmogVtF62HVnvk6kjB12qKxqn6RdwxQOhLChNl10Qz1QhS9UxQgxqm4Rf2T2CW46Dp
	qVTR1K20pkoaHY3ppSP1PZk/YO3RvCrGq0PHbAwHuBjX3c0lcT2r+WAaif8+Udu4myXO/OvqV1uc1
	10xomglwXwFLtlF8F4/+KLvx0aeWPylQ8VmILEpT1ALWsfoZKYlsBmIWOTetL8Nsz164jGZMMLCQV
	WKj+MZsUO8Xp0w91TzuZpc8/67mHzeMPh9lW19NY1tNhUUdwSXOsgKTxJjAqAl6IMSXHesegrxe1U
	d/VPTzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSsW-00000006oZv-1Fhu;
	Mon, 13 Jan 2025 22:25:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSmw-00000006nbc-2eB7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:20:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005yj-7t; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYf-29;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2c;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:19:09 +0100
Subject: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_142002_676979_D992F27A 
X-CRM114-Status: GOOD (  16.15  )
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

Some drivers have had deterministic GPIO numbering for most of
their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
("gpio/mxc: specify gpio base for device tree probe"), more than
12 years ago.

Reverting this to dynamically numbered will break existing setups in
the worst manner possible: The build will succeed, the kernel will not
print warnings, but users will find their devices essentially toggling
GPIOs at random with the potential of permanent damage.

As these concerns won't go away until the sysfs interface is removed,
let's add a new struct gpio_chip::legacy_static_base member that can be
used by existing drivers that have been grandfathered in to suppress
the warning currently being printed:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/gpio/gpiolib.c      | 2 +-
 include/linux/gpio/driver.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb143c4b3357106de1570e8d38441372..bedeb8f28badfb7287c4929f9ad0825e050a79c9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1011,7 +1011,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			 * drop this and assign a poison instead.
 			 */
 			gc->base = base;
-		} else {
+		} else if (!gc->legacy_static_base) {
 			dev_warn(&gdev->dev,
 				 "Static allocation of GPIO base is deprecated, use dynamic allocation.\n");
 		}
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..6e820d79d03e61123f89aaf884d35d4a1a5918a7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -382,6 +382,10 @@ struct gpio_irq_chip {
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
  *	as the chip access may sleep when e.g. reading out the IRQ status
  *	registers.
+ * @legacy_static_base: set for some existing drivers, where @base is non-negative
+ *	and changing that would induce so much breakage that they were
+ *	grandfathered in until GPIO sysfs support is removed altogether.
+ *	Do not set this for any new drivers.
  * @read_reg: reader function for generic GPIO
  * @write_reg: writer function for generic GPIO
  * @be_bits: if the generic GPIO has big endian bit order (bit 31 is representing
@@ -467,6 +471,7 @@ struct gpio_chip {
 	u16			offset;
 	const char		*const *names;
 	bool			can_sleep;
+	bool			legacy_static_base;
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 	unsigned long (*read_reg)(void __iomem *reg);

-- 
2.39.5


