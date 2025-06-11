Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C39C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiN17MsDmcOddfdWzv5/Ig0ypmiccMsoyOfR8oAdzAo=; b=E3USPYzRz9YLAN0/JdbKrFywoP
	fn+CRf7tahjOF4vczqLXyfkc95oH0QtlFPcxrawreD804BJc8XeIIaw6RPnEZxUwO24VXJUWvWFCb
	77LZqczBhmMHDMnOnanktDGqkgvmIOExCJKHNQYbmyhftFqvIRQiD6eBegBJEJBrxWTyGnktNz1rS
	cuPy5oPsGQY1XOLBvm9roS1wxfYaHx3K3Hb3MJhKrHwNFYfXTzGHbqkXFz7lfoCwcM/rpztakOFYc
	zM7AbvhzAWUv4V1q603EgNKtULkCcEQR5LIfe5BHIz6yKctgGmd8tW7d1DUTdPpCOrbABkHBII55s
	Hl/Z7xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnR-0000000ADoG-33ic;
	Wed, 11 Jun 2025 14:51:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIwF-00000009e24-3s9G;
	Wed, 11 Jun 2025 10:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZiN17MsDmcOddfdWzv5/Ig0ypmiccMsoyOfR8oAdzAo=; b=I6DlYTZFVLieeivq4a9z5XE2hD
	PvXYlrSExcYvnR1AjADCZYJXKka9KR24eFJ7cleBnNbrPhiu0UsADu/P+Ncj/fyPkAa3KnQhoU6gU
	ZS3fPJvANlNhNjken9xLEoS7Fvib9c796n+tsVafWe+cXIDljnGCR6jFRTcwj/qvFrGot4oh/sbn3
	p+vzMqh61S6rQ6MZc2P5EXyrrR0sZPo5xUIT7Lmp7x+wveBerhtZpPAMlQ/R5AWl/2/6JEWS2n1ge
	fvVBCmjBy9FOQur+5U1dllt4lyl/p6mODfRpwBC5rCnv0TNboRB8bbNgEDcMNHGAP3uhxOoUJnS88
	zYL+ClQg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIwC-00000002Hk6-3QpP;
	Wed, 11 Jun 2025 10:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD88B4A5F8;
	Wed, 11 Jun 2025 10:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27880C4CEF5;
	Wed, 11 Jun 2025 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638645;
	bh=tf+84qkD49mkgiTqaqohWtZ45kGhgnANEz56Oy08bFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=myxu4jh3MOSHqF23dezEr7MYgL/yz1DGpqFQHtAi319lLeFQHJ3EV0br9Iz81FvA/
	 9IlcvSxsosQFAFMWbkQu5gsTzgRRZs7SdayUMm3qEBIRYTgOQ4ABko6xCSsxNeFepg
	 hw0YSfJCnz7rGVI0JSUUKmcIkyw8tlZodZXJezw1iiXlxlIxN3PXnBjnt6RZxAXVzt
	 npmtX2X2BfrBtt/iO2uaF86b4mqR0F5Us4E7JdxDNDNOGyzW2BbYOGmyQrYMmH0I2E
	 QMq6BmluIml5+k12aaCxsaJpGfRrrcv8/ifZm//dLuujnXs0i+ItiPdat41yYd4cc8
	 GRkAElb271Cgw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] gpio: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:34 +0200
Message-ID: <20250611104348.192092-6-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_114409_341914_0678B073 
X-CRM114-Status: GOOD (  16.71  )
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>

---
Cc: Doug Berger <opendmb@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: "Uwe Kleine-König" <ukleinek@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-pwm@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpio/gpio-brcmstb.c   | 6 ++----
 drivers/gpio/gpio-davinci.c   | 2 +-
 drivers/gpio/gpio-em.c        | 3 +--
 drivers/gpio/gpio-grgpio.c    | 5 ++---
 drivers/gpio/gpio-lpc18xx.c   | 4 ++--
 drivers/gpio/gpio-mvebu.c     | 4 ++--
 drivers/gpio/gpio-mxc.c       | 4 ++--
 drivers/gpio/gpio-mxs.c       | 2 +-
 drivers/gpio/gpio-pxa.c       | 5 ++---
 drivers/gpio/gpio-rockchip.c  | 4 ++--
 drivers/gpio/gpio-sodaville.c | 4 ++--
 drivers/gpio/gpio-tb10x.c     | 5 ++---
 drivers/gpio/gpio-twl4030.c   | 2 +-
 13 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e7671bcd5c07..e29a9589b3cc 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -436,10 +436,8 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	struct device_node *np = dev->of_node;
 	int err;
 
-	priv->irq_domain =
-		irq_domain_create_linear(of_fwnode_handle(np), priv->num_gpios,
-				      &brcmstb_gpio_irq_domain_ops,
-				      priv);
+	priv->irq_domain = irq_domain_create_linear(dev_fwnode(dev), priv->num_gpios,
+						    &brcmstb_gpio_irq_domain_ops, priv);
 	if (!priv->irq_domain) {
 		dev_err(dev, "Couldn't allocate IRQ domain\n");
 		return -ENXIO;
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 80a82492171e..8f3a36d0191d 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -478,7 +478,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 			return irq;
 		}
 
-		irq_domain = irq_domain_create_legacy(of_fwnode_handle(dev->of_node), ngpio, irq, 0,
+		irq_domain = irq_domain_create_legacy(dev_fwnode(dev), ngpio, irq, 0,
 						      &davinci_gpio_irq_ops, chips);
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index a5e6e446f39c..015f1ac32dd9 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -325,8 +325,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_release_resources = em_gio_irq_relres;
 	irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
 
-	p->irq_domain = irq_domain_create_simple(of_fwnode_handle(dev->of_node),
-						 ngpios, 0,
+	p->irq_domain = irq_domain_create_simple(dev_fwnode(dev), ngpios, 0,
 						 &em_gio_irq_domain_ops, p);
 	if (!p->irq_domain) {
 		dev_err(dev, "cannot initialize irq domain\n");
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index d38a2d9854ca..f3f8bab62f94 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -402,9 +402,8 @@ static int grgpio_probe(struct platform_device *ofdev)
 			return -EINVAL;
 		}
 
-		priv->domain = irq_domain_create_linear(of_fwnode_handle(np), gc->ngpio,
-						     &grgpio_irq_domain_ops,
-						     priv);
+		priv->domain = irq_domain_create_linear(dev_fwnode(&ofdev->dev), gc->ngpio,
+							&grgpio_irq_domain_ops, priv);
 		if (!priv->domain) {
 			dev_err(dev, "Could not add irq domain\n");
 			return -EINVAL;
diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index b0a8da5c058d..2dbfbf90176c 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -249,8 +249,8 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio_chip *gc)
 	raw_spin_lock_init(&ic->lock);
 
 	ic->domain = irq_domain_create_hierarchy(parent_domain, 0, NR_LPC18XX_GPIO_PIN_IC_IRQS,
-						 of_fwnode_handle(dev->of_node),
-						 &lpc18xx_gpio_pin_ic_domain_ops, ic);
+						 dev_fwnode(dev), &lpc18xx_gpio_pin_ic_domain_ops,
+						 ic);
 	if (!ic->domain) {
 		pr_err("unable to add irq domain\n");
 		ret = -ENODEV;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 57633a7b4270..24792b8eb083 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1236,8 +1236,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	if (!have_irqs)
 		return 0;
 
-	mvchip->domain =
-	    irq_domain_create_linear(of_fwnode_handle(np), ngpios, &irq_generic_chip_ops, NULL);
+	mvchip->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), ngpios,
+						  &irq_generic_chip_ops, NULL);
 	if (!mvchip->domain) {
 		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
 			mvchip->chip.label);
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index fae1a30f8ae6..4af5a2972d12 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -509,8 +509,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}
 
-	port->domain = irq_domain_create_legacy(of_fwnode_handle(np), 32, irq_base, 0,
-					     &irq_domain_simple_ops, NULL);
+	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
+						&irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err = -ENODEV;
 		goto out_bgio;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index b418fbccb26c..0ea46f3d04e1 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -303,7 +303,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	port->domain = irq_domain_create_legacy(of_fwnode_handle(np), 32, irq_base, 0,
+	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
 						&irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err = -ENODEV;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index aead35ea090e..131ab79ebce7 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -642,9 +642,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	if (!pxa_last_gpio)
 		return -EINVAL;
 
-	pchip->irqdomain = irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node),
-						    pxa_last_gpio + 1, irq_base, 0,
-						    &pxa_irq_domain_ops, pchip);
+	pchip->irqdomain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), pxa_last_gpio + 1,
+						    irq_base, 0, &pxa_irq_domain_ops, pchip);
 	if (!pchip->irqdomain)
 		return -ENOMEM;
 
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index c63352f2f1ec..64700a003f9a 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -521,8 +521,8 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_create_linear(of_fwnode_handle(bank->of_node), 32,
-					&irq_generic_chip_ops, NULL);
+	bank->domain = irq_domain_create_linear(dev_fwnode(bank->dev), 32, &irq_generic_chip_ops,
+						NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
 			 bank->name);
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 6a3c4c625138..abd13c79ace0 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -169,8 +169,8 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 			IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
 			IRQ_LEVEL | IRQ_NOPROBE);
 
-	sd->id = irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node), SDV_NUM_PUB_GPIOS,
-				sd->irq_base, 0, &irq_domain_sdv_ops, sd);
+	sd->id = irq_domain_create_legacy(dev_fwnode(&pdev->dev), SDV_NUM_PUB_GPIOS, sd->irq_base,
+					  0, &irq_domain_sdv_ops, sd);
 	if (!sd->id)
 		return -ENODEV;
 
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 8cf676fd0a0b..1869ee7f9423 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -183,9 +183,8 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret != 0)
 			return ret;
 
-		tb10x_gpio->domain = irq_domain_create_linear(of_fwnode_handle(np),
-						tb10x_gpio->gc.ngpio,
-						&irq_generic_chip_ops, NULL);
+		tb10x_gpio->domain = irq_domain_create_linear(dev_fwnode(dev), tb10x_gpio->gc.ngpio,
+							      &irq_generic_chip_ops, NULL);
 		if (!tb10x_gpio->domain) {
 			return -ENOMEM;
 		}
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 0d17985a5fdc..c5d7825f19c1 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -523,7 +523,7 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 		return irq_base;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node), TWL4030_GPIO_MAX, irq_base, 0,
+	irq_domain_create_legacy(dev_fwnode(&pdev->dev), TWL4030_GPIO_MAX, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	ret = twl4030_sih_setup(&pdev->dev, TWL4030_MODULE_GPIO, irq_base);
-- 
2.49.0


