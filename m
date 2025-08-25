Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAEECA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnIvSpX6XaNR1KpnyS1XpJFUwit84iSFYji6KHBKLOk=; b=o8UA0O2jfPAKbt6shd7MtezxKH
	L+uD08yQ1NMZTD8df1xqN+vSX0QKqLyeOGj13/F0Gd82Pf8A+H78MJv8RdIZiJrmggzasx2HKN79C
	CyLpBvbFWqOhBJEndJAjDc6FGOYV9eFFgchB5uadA8EMiynx3O3QdqtAJodfXIV1XgvFlHR55lMG6
	kWuE2BmLFNQByb2xAT9T6XXFHEFSViHHRW3EF87Yr6slNbrAmV9Ps6C+ZUc4ZLbS0v3qtzufyfjW4
	v4OMJgObdT69XiKvuEHLGB/8dKvRdvh73lr+PYt9M7kwux9lJX49K/yodkfMYvEYFHKR5CJuYmc2Z
	08ysX0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaN-00000007nIm-2IRb;
	Mon, 25 Aug 2025 11:42:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTp4-00000007YLB-0J1L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c854b644c1so853423f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115345; x=1756720145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnIvSpX6XaNR1KpnyS1XpJFUwit84iSFYji6KHBKLOk=;
        b=lxh4LcH1581gnc4gPb5AJGtxLtq5sN/BGHNCh1qd869/EmTsikdXKtbNBmYAD0YQWh
         scUaQiA6I7Lgr8NyTE74B4NFn6BRPh9rAfIXfy5AUYXlJEqNmteRUZdpaavx4BN7bNlE
         XYedmhgD4hqqpNW/gTk8ovlG0pZITWulumcCsEs7EUIlWNyWWmTFFRYej3rO5jmSMtYk
         mkCrb5zPYs6SBX1V7+g0gVX0nhv04pZLXTG5hXqkQDDavD3mM5UThTKGU5ynyAoSTcvS
         OfGXASEoXzqczuD8CiTcxsNOpg3HJC928y6nEQyv8f0YlFcdfwSYwFbMwzvkwO3AeEHG
         aWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115345; x=1756720145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnIvSpX6XaNR1KpnyS1XpJFUwit84iSFYji6KHBKLOk=;
        b=sJpq3pCZszpyEuxNoUPrLqClXN21fzA/KCJahlq7X5tY0/sg0e6ifZCqwiREK9rB4J
         wDoc6HHp9OWnNFw22aqPcGUJjSsB4UuIDX8TnCiTxeIBcp42fCXrSnkiVF4wiMgSP4SQ
         eS5asQCsMn3Rx7XS/gcQcUWXhd9OSQQCzO/MMcnJK+6EFCVh+0KG8D3i/WjV0POtkT1e
         lWGVYm9LPMkV/Wbz7YzZbUk5xzxw2r90cJvcdpGxRVEJaf2uFTBBDs1pbfRuySzEeS/6
         wJUhLIBH/qfzfqZ9qbmDF/ltr9Z309oo0glLgttFP+Q/Otmx5A1TEBWP3rzr2V13AHZw
         4rVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1QnBL04bNj2jq2xWixS2HD59agV7v7h75EvvE/GnXFJq8SF3rE6YDMyXONB47couUuhBpwgxKif3by705ENOV@lists.infradead.org
X-Gm-Message-State: AOJu0YxuiCvrBGDabl3A96zmQX0DGqnnCoO1FwjCJd44kFTyRWm8jk0L
	RQj+puj9C+znqvbqa6cp0xsi9rE567DlUNxKH9qjwFn8qNWYL4QutXukf7llMqZxbUY=
X-Gm-Gg: ASbGnctw+7Day9tItwMCMtKhNGHU/hxcBz3oJ4W5U4ta4wdvwAbectvDlfAFLzmJrHM
	38Mun4g2ChXPw8H9P0RO4nf6OBy5vehNQNHfw01hy1Lir/rc73RBhSf90S45I0gHgT+DPJh2WOZ
	kK+8xzxfAJBlLj3DomNm8XIp0P+xDHEzboJpmlvg4LHNPf9qL2+rW/y41snuos1i+RROe29K8eq
	9sslnDAIsUKgf2Cm2qndtV7/YQ8BqffaDjQDyj9Q+Rs1vayzBfrFf/iOKlPPr24yIl+a8oVq39u
	ZdPwaL0kdcsq7wvEu6BuGOcHR7lt+iceQhktUmYLPMdC5SjdsD2aP0c/fLDeU3Qg73mzwbBd7i1
	EnwXlqnwf3FgnGzwLow==
X-Google-Smtp-Source: AGHT+IG16Vk1oAADcf2tKKMlQW20YxVITJDeKRUq+CWLvo6Qa5c/sMUP4UJmgZHpEofTALTKNOQBfA==
X-Received: by 2002:a05:6000:1881:b0:3c9:24f5:470c with SMTP id ffacd0b85a97d-3c924f54bfemr2819993f8f.42.1756115344648;
        Mon, 25 Aug 2025 02:49:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:54 +0200
Subject: [PATCH RESEND 13/14] gpio: mpc8xxx: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-13-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10008;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8xlnAhAzfwO4+HhxnfhDkoiDZ7pkFtIamWGlMtDqlhM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDGAf7tPAAs+l1JeaG+mB0PRgBMQttnEOo/AN
 +lu29h0TJOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxgAAKCRARpy6gFHHX
 ckhAD/93TqSAaRskVVoK3MfNfb4UbXffJdI73/IvgWbXLS9h972jdGVx8f8sOYaaD7OFy6blc8L
 3yPGdSKtokC922c3mzsplBLSI5NNKk+2lCGubHU39muVBKmW3Pm8udEnebzAYzYFpapzqZpm83z
 z2xt6Jz42VGiOQ3cxrWg6TWDLqmLvn+lxU6ZRYFfJyunaj1+bkWaBR1ZDWBuIyhTiQ2wa7JwcQe
 OWjB1ncUqBUzuMYrczGWYKoS6Hd+VI+MgpLV5gLbtqL5MS4QKkAjXgwTrLtFZUdnYNgMNxoIk6i
 vydOKmmioVLskgqJ/FBZJMC+qxdR5O0YnA7AcuyvPLCZcQW2us3SQepQJyu7++ILB+qQEWBOZG8
 2WfeaOIPMCFYeDpYNzhAu2dTGJo96ncuCel47uatnXeidoBUvRwcSidwL1l0gki7k0Q/MSUHokR
 GiMa7MPimmzMkJcE0weWAoCggKxxKELqDfWO7PPQEkrpoHcamAaAJTH+hc3WfmwA9xeW5R8j32N
 bv4tXZs2zExOmA7R7dV9kvHxtThR9hc8qdy2bUNlHkT1/0byYPoVNGm+sr9Joc42CCEPNPlp1lo
 FBb3JcJiindPn79p0V39AjyxN8dP5/Tcic1VqguAqACaBfqVFz11mBmntFVBXOsCs5GDGcsbGJG
 dJPotEspK3Pn6ow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024906_257246_06EFD090 
X-CRM114-Status: GOOD (  21.41  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 102 +++++++++++++++++++++++++++-----------------
 1 file changed, 62 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 121efdd71e451d4f992fa195b0d56d7146a6f3dd..38643fb813c562957076aab48d804f8048cee5e4 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -34,7 +35,7 @@
 #define GPIO_IBE		0x18
 
 struct mpc8xxx_gpio_chip {
-	struct gpio_chip	gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
 	raw_spinlock_t lock;
 
@@ -66,8 +67,10 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
 	u32 out_mask, out_shadow;
 
-	out_mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
-	val = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
+	out_mask = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+					 mpc8xxx_gc->regs + GPIO_DIR);
+	val = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				    mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
 	out_shadow = gc->bgpio_data & out_mask;
 
 	return !!((val | out_shadow) & mpc_pin2mask(gpio));
@@ -108,12 +111,13 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = data;
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long mask;
 	int i;
 
-	mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
-		& gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
+	mask = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				     mpc8xxx_gc->regs + GPIO_IER) &
+	       gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				     mpc8xxx_gc->regs + GPIO_IMR);
 	for_each_set_bit(i, &mask, 32)
 		generic_handle_domain_irq(mpc8xxx_gc->irq, 31 - i);
 
@@ -124,15 +128,17 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
+	struct gpio_chip *gc = &mpc8xxx_gc->chip.gc;
 	unsigned long flags;
 
 	gpiochip_enable_irq(gc, hwirq);
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
-		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
+	gpio_generic_write_reg(&mpc8xxx_gc->chip,
+			       mpc8xxx_gc->regs + GPIO_IMR,
+		gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				      mpc8xxx_gc->regs + GPIO_IMR)
 		| mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
@@ -142,13 +148,14 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
+	struct gpio_chip *gc = &mpc8xxx_gc->chip.gc;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
-		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
+	gpio_generic_write_reg(&mpc8xxx_gc->chip, mpc8xxx_gc->regs + GPIO_IMR,
+		gpio_generic_read_reg(&mpc8xxx_gc->chip,
+				      mpc8xxx_gc->regs + GPIO_IMR)
 		& ~mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
@@ -159,32 +166,34 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 static void mpc8xxx_irq_ack(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
+	gpio_generic_write_reg(&mpc8xxx_gc->chip, mpc8xxx_gc->regs + GPIO_IER,
 		      mpc_pin2mask(irqd_to_hwirq(d)));
 }
 
 static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long flags;
 
 	switch (flow_type) {
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
-			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
+		gpio_generic_write_reg(&mpc8xxx_gc->chip,
+				       mpc8xxx_gc->regs + GPIO_ICR,
+			gpio_generic_read_reg(&mpc8xxx_gc->chip,
+					      mpc8xxx_gc->regs + GPIO_ICR)
 			| mpc_pin2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
-			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
+		gpio_generic_write_reg(&mpc8xxx_gc->chip,
+				       mpc8xxx_gc->regs + GPIO_ICR,
+			gpio_generic_read_reg(&mpc8xxx_gc->chip,
+					      mpc8xxx_gc->regs + GPIO_ICR)
 			& ~mpc_pin2mask(irqd_to_hwirq(d)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
@@ -199,7 +208,6 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
 static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
-	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long gpio = irqd_to_hwirq(d);
 	void __iomem *reg;
 	unsigned int shift;
@@ -217,7 +225,9 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift))
+		gpio_generic_write_reg(&mpc8xxx_gc->chip, reg,
+				       (gpio_generic_read_reg(&mpc8xxx_gc->chip,
+							      reg) & ~(3 << shift))
 			| (2 << shift));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
@@ -225,14 +235,18 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_LEVEL_HIGH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift))
+		gpio_generic_write_reg(&mpc8xxx_gc->chip, reg,
+				       (gpio_generic_read_reg(&mpc8xxx_gc->chip,
+							      reg) & ~(3 << shift))
 			| (1 << shift));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
-		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift)));
+		gpio_generic_write_reg(&mpc8xxx_gc->chip, reg,
+				       (gpio_generic_read_reg(&mpc8xxx_gc->chip,
+							      reg) & ~(3 << shift)));
 		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
 		break;
 
@@ -309,6 +323,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
 	const struct mpc8xxx_gpio_devtype *devtype = NULL;
+	struct gpio_generic_chip_config config;
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
 	struct device *dev = &pdev->dev;
 	struct fwnode_handle *fwnode;
@@ -327,26 +342,28 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (IS_ERR(mpc8xxx_gc->regs))
 		return PTR_ERR(mpc8xxx_gc->regs);
 
-	gc = &mpc8xxx_gc->gc;
+	gc = &mpc8xxx_gc->chip.gc;
 	gc->parent = dev;
 
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = mpc8xxx_gc->regs + GPIO_DAT,
+		.dirout = mpc8xxx_gc->regs + GPIO_DIR,
+		.flags = BGPIOF_BIG_ENDIAN
+	};
+
 	if (device_property_read_bool(dev, "little-endian")) {
-		ret = bgpio_init(gc, dev, 4, mpc8xxx_gc->regs + GPIO_DAT,
-				 NULL, NULL, mpc8xxx_gc->regs + GPIO_DIR,
-				 NULL, BGPIOF_BIG_ENDIAN);
-		if (ret)
-			return ret;
 		dev_dbg(dev, "GPIO registers are LITTLE endian\n");
 	} else {
-		ret = bgpio_init(gc, dev, 4, mpc8xxx_gc->regs + GPIO_DAT,
-				 NULL, NULL, mpc8xxx_gc->regs + GPIO_DIR,
-				 NULL, BGPIOF_BIG_ENDIAN
-				 | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
-		if (ret)
-			return ret;
+		config.flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 		dev_dbg(dev, "GPIO registers are BIG endian\n");
 	}
 
+	ret = gpio_generic_chip_init(&mpc8xxx_gc->chip, &config);
+	if (ret)
+		return ret;
+
 	mpc8xxx_gc->direction_output = gc->direction_output;
 
 	devtype = device_get_match_data(dev);
@@ -379,10 +396,13 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	    device_is_compatible(dev, "fsl,ls1028a-gpio") ||
 	    device_is_compatible(dev, "fsl,ls1088a-gpio") ||
 	    is_acpi_node(fwnode)) {
-		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+		gpio_generic_write_reg(&mpc8xxx_gc->chip,
+				       mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 		/* Also, latch state of GPIOs configured as output by bootloader. */
-		gc->bgpio_data = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) &
-			gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
+		gc->bgpio_data = gpio_generic_read_reg(&mpc8xxx_gc->chip,
+						       mpc8xxx_gc->regs + GPIO_DAT) &
+				 gpio_generic_read_reg(&mpc8xxx_gc->chip,
+						       mpc8xxx_gc->regs + GPIO_DIR);
 	}
 
 	ret = devm_gpiochip_add_data(dev, gc, mpc8xxx_gc);
@@ -405,8 +425,10 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		return 0;
 
 	/* ack and mask all irqs */
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
-	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
+	gpio_generic_write_reg(&mpc8xxx_gc->chip,
+			       mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
+	gpio_generic_write_reg(&mpc8xxx_gc->chip,
+			       mpc8xxx_gc->regs + GPIO_IMR, 0);
 
 	ret = devm_request_irq(dev, mpc8xxx_gc->irqn,
 			       mpc8xxx_gpio_irq_cascade,

-- 
2.48.1


