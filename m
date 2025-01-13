Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D18C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw2ISPLjNimM28R4wKMb5wcLoiSEVpqMnbgIf/NwU50=; b=1v/tDH8Sx1hqXHOwfkDaPLQEWu
	o301kkWlMLVSvfT6sk0haO+h2PsPup4Jf+siu1PL0G27OFG4CQt/F8EUqlzEprVWzmQYA2cPyyEqq
	ZZxdbZdUFQGxAlGaMsvLn2k0gJuf3zUyZNhUE7n6XvjgdFPAtFi09L2rgGFyRSXo0Q398HZdoGyZj
	Zt3kFLdFzDOYzo8jE2Xb33Zhep+hxT5pnyX3HmB12F1BPdzcFuM+a05zbPZzo5t7pVX5LZykWLbjo
	5pZiQUf/+o1gTaXB/QqKtS8vBRViXaI9FMACM/HatcG8XJt7XDloS5ep8qJyqSzY0aMVojZ4//FiH
	ZCTKr/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSq6-00000006o7T-35sv;
	Mon, 13 Jan 2025 22:23:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSmg-00000006nYj-0yhP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:19:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005ym-7s; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYi-2G;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2f;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 23:19:12 +0100
Subject: [PATCH 4/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-4-0a28731a5cf6@pengutronix.de>
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
X-CRM114-CacheID: sfid-20250113_141946_274186_2A156D27 
X-CRM114-Status: GOOD (  18.50  )
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

GPIO numbering has been deterministic since commit 7e6086d9e54a
("gpio/mxc: specify gpio base for device tree probe"), a year after
device tree support was first added back in 2011.

Reverting to dynamically allocated GPIO base now would break most
systems making use of the sysfs API. These systems will be eventually
broken by the removal of the sysfs API, but that would result in GPIO
scripts not working instead of essentially toggling at random according
to probe order, which would happen if we change the base to -1.

Yet, the warning is annoying and has resulted in many attempts
to remove it over the years[1][2][3].

Fix this by silencing the warning via the gpio_base_static_alloc
opt-out instead.

[1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@amarulasolutions.com/
[2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.com/
[3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu@leica-geosystems.com/

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
This triggers the newly added checkpatch.pl warning, but this is
intended.
---
 drivers/gpio/gpio-mxc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0..c25a50abb02389e75b5ca2924828f4a7fb32fe6c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -45,6 +45,11 @@ struct mxc_gpio_hwdata {
 	unsigned high_level;
 	unsigned rise_edge;
 	unsigned fall_edge;
+	/*
+	 * Static allocation of GPIO base is deprecated.
+	 * Set this to false for future SoCs.
+	 */
+	bool gpio_base_static_alloc;
 };
 
 struct mxc_gpio_reg_saved {
@@ -88,6 +93,7 @@ static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
 	.high_level	= 0x02,
 	.rise_edge	= 0x00,
 	.fall_edge	= 0x01,
+	.gpio_base_static_alloc = true,
 };
 
 static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
@@ -103,6 +109,7 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
 	.high_level	= 0x01,
 	.rise_edge	= 0x02,
 	.fall_edge	= 0x03,
+	.gpio_base_static_alloc = true,
 };
 
 static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
@@ -118,6 +125,7 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
 	.high_level	= 0x01,
 	.rise_edge	= 0x02,
 	.fall_edge	= 0x03,
+	.gpio_base_static_alloc = true,
 };
 
 #define GPIO_DR			(port->hwdata->dr_reg)
@@ -490,7 +498,19 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = mxc_gpio_request;
 	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	port->gc.base = -1;
+
+	if (port->hwdata->gpio_base_static_alloc) {
+		/*
+		 * GPIO indices have been fixed for the i.MX GPIO controllers
+		 * for many years and changing that now will induce a lot of
+		 * breakage at runtime. Setting this member buys users some time
+		 * until they are forced to migrate when sysfs GPIO support is
+		 * removed completely.
+		 */
+		port->gc.legacy_static_base = true;
+		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	}
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)

-- 
2.39.5


