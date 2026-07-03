Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9bPyS/0uNi6wXJqgrGX5cVcsYuuWD9wtysaxkT+Dt4=; b=r4qJOXpWNAcdOaH1li1nZFZHxT
	yNz4Kx0oY4ztXUW5MhwkATVr0i140xoodLoDDsCCBtfBFlgupdrcien17HVXSFvcy6SMrcQdgA13b
	KEoDLJOK79TPiWImo+N44j9W/yNJAGJ7dwZdHS2VYHXwjSC+TmeZQoipbRO+ZuD+9Fu8hn/kwJdgj
	/TOT+5UZ/Z9bS6Q4Yh6tnhhHFqcENn4JO+hN/6wWJlYzGkhl/y5Rjl33ABACgx7xAk5/ue8WzyjUO
	iDIFPneujFKMfCPLPLUMe+Z02d8FxnQ8JpOOOtZwVswcNiPmfYzIgfBTN3/ao5FvO0L5M9o2LSp2S
	KqlDuGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyu-0000000766K-0NBG;
	Fri, 03 Jul 2026 13:31:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyn-000000075wU-0uYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB95F1A0E2E;
	Fri,  3 Jul 2026 13:30:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C24660300;
	Fri,  3 Jul 2026 13:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 388B5104C95AC;
	Fri,  3 Jul 2026 15:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n9bPyS/0uNi6wXJqgrGX5cVcsYuuWD9wtysaxkT+Dt4=;
	b=QXaAzfOJIpi/uOaJ6u/UgTYwunCe5bV9Fm7RPLZs4LjoS8ZAO5GapEmJ1pDc5hjTTFtDDa
	5cTLLZbs2gsqgYBMzkGY2BaWUX7P0czD+wbLJD/U/5lTtF4MDwOunIknti8z/6IsFTWiWe
	otFTFFdXt3R0jU8l91bAzGqXpT+jnOdhHLbY0HZPQZR3BexF9pwGnp7IoKKmX9/66v2XTS
	cx3VBR/pvXj+w0K3umrGdIlSTUScE3CPltrvv0MXKGUPPi4cweL+zLNQ8Ad193+0EgMBc6
	Hmj1oeQpolqdXNAzThanud+z8Oqh14OBmSb/VqtyM5E6MdC0DOOJZLbwsfSA8g==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:20 +0200
Subject: [PATCH 12/12] soc: fsl: qe: Add support of IRQs in QE GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-12-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
In-Reply-To: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=2410;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=uU4iuMohvv17IiIgOuFnj9w2k+ZovOe5eFIHeMSDjt4=;
 b=hNx7S/9Lk8zefyWMtjb/HRlT/T9Bq5wS3kVedzZyJ1n5LRDAihpruvvGSJm5Li7vBBareHst+
 bqggNYIbt96CsUzNAiJy5UEsQIIQkuAgz6vMaGlCucqiEWHZcqkKCyJ
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063054_327019_A5A813E6 
X-CRM114-Status: GOOD (  16.06  )
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

Some QE GPIO pins have an associated interrupt line in the QE PIC to
signal state changes on the pin.

Because the GPIO controller does not perform any interrupt handling
itself, a nexus node (interrupt-map) is used to map each GPIO line
supporting IRQ to the parent QE PIC interrupt domain.

Add the to_irq() method in the corresponding GPIO controller driver,
that uses the nexus node to perform the translation.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/gpio.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 66828f2a3577..f8919642f40d 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/export.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
@@ -23,6 +24,7 @@
 #define PIN_MASK(gpio) (1UL << (QE_PIO_PINS - 1 - (gpio)))
 
 struct qe_gpio_chip {
+	struct device_node *np;
 	struct gpio_chip gc;
 	void __iomem *regs;
 	spinlock_t lock;
@@ -135,6 +137,29 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+	struct of_phandle_args oirq;
+	struct irq_domain *domain;
+	int ret;
+
+	oirq.np = qe_gc->np;
+	oirq.args_count = 2;
+	oirq.args[0] = gpio;
+	oirq.args[1] = 0;
+
+	ret = of_irq_parse_raw(NULL, &oirq);
+	if (ret)
+		return ret;
+
+	domain = irq_find_host(oirq.np);
+	if (!domain)
+		return -EPROBE_DEFER;
+
+	return irq_create_of_mapping(&oirq);
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -299,7 +324,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
 		return -ENOMEM;
-
+	qe_gc->np = np;
 	spin_lock_init(&qe_gc->lock);
 
 	gc = &qe_gc->gc;
@@ -311,6 +336,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 

-- 
2.55.0


