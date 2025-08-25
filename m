Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F567CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhENlcfkNwyDufaRiGgcBZWw5IjhSNkLtITka6qKf/g=; b=LpPRbAkOh06rHnrho2FENM1+l4
	91s75lu9eeASDCROTqurHS6mHXVxVklqMR0H0B2f1VRo0/KzSCGrfXPEYHZVgQs9/z8wwdIR6CAe0
	JJVt5itcfAky2aR9ErrJL3ROJb1MmHzLnrNe1epHaFgcoPQJ0/opartSiNw0TljRHxM3VQ7kmqdl7
	e6UlEgbexv/E1fktbQnXX4zLJqJkp1AeAjqprxHny9rlV15rG53qCMIvJJmUqfB9A/pgEUno6wQ9v
	07SsWGvaS6S97wmZ0iLFdRfgquSQeAnVmBCwC7RBZjesMqC854vtZ9iiijvEb0mhVWR+BGJP7jU/l
	Oydwz1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSHR-00000007GDB-3vtI;
	Mon, 25 Aug 2025 08:10:17 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRVg-000000079Vd-1mSn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 07:20:57 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M2D4bxpz9sSd;
	Mon, 25 Aug 2025 08:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4916ElkUcXer; Mon, 25 Aug 2025 08:53:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M292RWPz9sSV;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EDC08B769;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4Ub9RjFzb6BR; Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C4968B765;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/6] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon, 25 Aug 2025 08:53:19 +0200
Message-ID: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756104334.git.christophe.leroy@csgroup.eu>
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=2710; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=73IQ37tskzYmvonToad8R3pHY7nT1ylYyENPfX+baes=; b=1Mw+uBZnRMBUW5TPgXymjz8dvEQOBdUgMzXytx0Smi78Dl04GaGVcXxpPem3A54R13AakQw75 tgt//oO2kqfDJlJRyyRuRIbhnogLScEB/ixa/LUl6Zzem4yDI49rlNw
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002056_628187_8958FD36 
X-CRM114-Status: GOOD (  14.84  )
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

In the QE, a few GPIOs are IRQ capable. Similarly to
commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
GPIO"), add IRQ support to QE GPIO.

Add property 'fsl,qe-gpio-irq-mask' similar to
'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Here is an exemple for port B of mpc8323 which has IRQs for
GPIOs PB7, PB9, PB25 and PB27.

	qe_pio_b: gpio-controller@1418 {
		compatible = "fsl,mpc8323-qe-pario-bank";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		interrupt-parent = <&qepic>;
		gpio-controller;
		#gpio-cells = <2>;
		fsl,qe-gpio-irq-mask = <0x01400050>;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index a338469cebe4..91d469403126 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -32,6 +33,8 @@ struct qe_gpio_chip {
 
 	/* saved_regs used to restore dedicated functions */
 	struct qe_pio_regs saved_regs;
+
+	int irq[32];
 };
 
 static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
@@ -135,6 +138,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+
+	return qe_gc->irq[gpio] ? : -ENXIO;
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -295,6 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct device_node *np = dev->of_node;
 	struct qe_gpio_chip *qe_gc;
 	struct gpio_chip *gc;
+	u32 mask;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
@@ -302,6 +313,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {
+		int i, j;
+
+		for (i = 0, j = 0; i < ARRAY_SIZE(qe_gc->irq); i++)
+			if (mask & (1 << (31 - i)))
+				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
+	}
+
 	gc = &qe_gc->gc;
 
 	gc->base = -1;
@@ -311,6 +330,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
-- 
2.49.0


