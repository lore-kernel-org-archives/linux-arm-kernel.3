Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED2CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=; b=t0ekcxPV41QIGmVwGtOwr/uemX
	RqnyFhy3unvUGd2wD+P1rFAysw+wOmKBB8Z8BJdloQ2MDdNshKlh+ior5HwRpFw407SHN8P218qVo
	0+LogJLC+OKZaAUWTy1LZM0ks7gCOQ9V5KvOh83PyjKh82mGSda1/GxDC1il2LOnbT00/gy4CcQDk
	iOkQSxatTRuf1Ro9Hldbv1qm4suwgjcs1usz/x7ugVJ402PMHZ57bsbwcnI5Xdq4hFu5dDGjVLJkg
	KW9IfNPIMIPBWWd0zcx9rnm1Q9Ib7rOaqyfeyRR+FP/OvQfPp8PYLniWCGlfrM5VAMi/rXEqTlQvJ
	zzIUSipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaM-00000007nGo-0PVW;
	Mon, 25 Aug 2025 11:42:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTp2-00000007YJy-3yZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so3046835f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115343; x=1756720143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=HtSTv5sScHZuiiMyJBcsNBZ++9BH8FbxA/PuWlDm/zxLJdZnsHgQFMMJMO/29XGEMh
         HMEUzX9qflbWMw7rZe5/wfn+9R7RcZd3XsggAUeqJEWq+tRnXXDeAhIPDBJ1HvjlRn3f
         tXqhP7qP/6IqRbg8vDDS0a19/cQnHcGlHiz8Gkn1c5ftcAZuy5DjkkMb3brwK456TxeC
         Fw3YlPgtM14H0kbIicG9f0zTxmtiGn7rx8tx4dwNgy2pqN0kOU9Y8/XsDmOYcD7YiwsP
         0AwAzsKNDrr5KSG0ANKHTmjM/my/TY8SQL6GFwmBRP7oqoQxlmdZvK5QgzXCeDBzpBbu
         Sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115343; x=1756720143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=fisphJAGH98gP5L5SN1Ehyu8RedDmc0cFIv61GfBb+e3WtKDUsCXVjrnOP4o2dfaxw
         N3SYmdmSv8JKDGnYk8Ti2tJt7cU7saO2VsXdqIU8db8b8ZSmcXlR5xwqJSP96/RO0945
         knItuBBXDCs/bXk/7MchKgpAyPXAyqOzc7r+31VcWcf4vU/1Vr2zlVytrMDftW4WOoJi
         wlgJsGj6m1VVmjsYFwsryG21IZ+9WMEAAmYmyHfcAu17I4+O02KsP/8dvOyuz04CefuV
         BgtsT+BdqXTT3gGL9QelifdGoHTo1xnZMB6Jz0Ky4prWj00U5H0L/iy/jTgl7VoclLNr
         BIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJl1HRAqM5uzK954I4p3vTO93JUimqyAH15Oqq3Ugpb0EQxsanlP50EP7t8cwWqf9Sww4tIUpeeJZqbmmjjyIx@lists.infradead.org
X-Gm-Message-State: AOJu0YwXZriJvXCMcO3h4qnbqonmmRZmMorwHyz3QqulgYpNJlv2ae33
	vMkrXrCciPLQXJHl8oJ9RI1zyuZSUbXjANmuHAnR1PiX1P/rQXhLnm1cq6PqgJZAg8A=
X-Gm-Gg: ASbGncsu/thcfAsp2w+3YuZTdyuWS8AHwrc/kmpkTVuJH8EZaAdz2AY0SKzpVYuOjnM
	F9f2YSN8TmoofTZhMeLEumkM6kvqgPmDwCNre5eL4WZr5L7CKGv0QxnHpNNheleGqhH2sVxO5rc
	Pz8lFs4rKeqd27uBFp723IzSVtfzUqaPgW4jHTGzM/V7HMH9CLkwrHLWpXLHouXX+zVgw1RGW8h
	JTpuMkVAOekbx4OB9QTKP/DpnyucgeJeFN6Zl8LeyJg8Yie0jx2pLZ+orCDHUGbvU/WLP8aXP6y
	BS7ZWlz2vsiZO0+5f9WKkcrlPBAwHR34FfwEvI/w0tZTR78uLfxH+uAx9xSU6O3O8LqCRO1ORBu
	dCXZmrF/nBdgguMKBdw==
X-Google-Smtp-Source: AGHT+IF+DGK7ah98d14Q5J3T1B+5aP3g73ZZMrERf7ASzZkA8tqeaNAu5LBRINhnoLPrv7wp1bRzuw==
X-Received: by 2002:a05:6000:24c3:b0:3b8:d901:fa33 with SMTP id ffacd0b85a97d-3c5dcc0777amr10149165f8f.42.1756115343472;
        Mon, 25 Aug 2025 02:49:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:53 +0200
Subject: [PATCH RESEND 12/14] gpio: grgpio: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-12-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7995;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AGhvI8vG5SGj9cxXM06eRQt9v1ofBIcmVl22/TTQOT4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDGA9kgZKs4xdDRJcuUH/c6fDnvRy2++EFeeH
 BLsDoydZRSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxgAAKCRARpy6gFHHX
 cl0wEACkbnVrJ7x5Ll/WAAt1ahr6Mj8tuq5YzD7ax3FC6HC4CvaZ6WH/SO/ryTLaakUgwKh3j7N
 fO6l5uFW/wcVU6prgm1r2D2E1oqitoecvCXLhZC0VAfh4ObP+4w1Fhxdb9A9I7LbFoG4C664OJV
 cyCTS+m0GQJBdbplb5e6OYlaXR8sR+2avVJUCud8fyGapgpX4V/aCMEg5zZGS4W1l7F0HSD3dYz
 T15xIr4wwVOlPY0nJea7yuf+Z1iV0Wa3gc1KwcYr9jsZzxCl8pLeHK3WV8zZ+EQvLMjzxcX1MLU
 Nvu0n5R7PgGbDoGLaA61I/ZMO/+CU1HCFOin34RQRAByZ4hlEJt0W2d8WIAqU7oBbixLJnj+wwV
 k2CiHst9w3fOMQ5itLFjIbXQn4cSKshlOY7N5MmkqN+PVSuouHdeZlOenr7aUBlGxTUbd765l5a
 IEfCnuVl2zEqwji8aeb2IUIe89qR5amnHDCgcYcIA1Xs2lZInlSgI14GOBT9PouQsvcmrAGM/rG
 ctVqqUrYD3L+Els1XqQiXtdYGmnZkjPN94CjBQosv449aDZxGgVSrjb7+Y1yTZeIxhV4R7Nu8OD
 puAoBZX9YhLg8JhZRoR2ubcndD5V8tlFRtHjHYfi/NjnTF3GKI46+u4zFCBkdfw/aJgfY9lrMxA
 EkZE+UGaqA8mVBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024905_011522_B9914028 
X-CRM114-Status: GOOD (  23.90  )
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
 drivers/gpio/gpio-grgpio.c | 87 +++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index f3f8bab62f94cefb69d31d76b961ab2d346df49e..3b77fad00749cd5218268b267b5848515c6a26fc 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -59,7 +60,7 @@ struct grgpio_lirq {
 };
 
 struct grgpio_priv {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
 	struct device *dev;
 
@@ -91,13 +92,12 @@ struct grgpio_priv {
 static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
 			     int val)
 {
-	struct gpio_chip *gc = &priv->gc;
-
 	if (val)
 		priv->imask |= BIT(offset);
 	else
 		priv->imask &= ~BIT(offset);
-	gc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);
+
+	gpio_generic_write_reg(&priv->chip, priv->regs + GRGPIO_IMASK, priv->imask);
 }
 
 static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -118,7 +118,6 @@ static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
 static int grgpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
-	unsigned long flags;
 	u32 mask = BIT(d->hwirq);
 	u32 ipol;
 	u32 iedge;
@@ -146,15 +145,13 @@ static int grgpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&priv->chip);
 
-	ipol = priv->gc.read_reg(priv->regs + GRGPIO_IPOL) & ~mask;
-	iedge = priv->gc.read_reg(priv->regs + GRGPIO_IEDGE) & ~mask;
+	ipol = gpio_generic_read_reg(&priv->chip, priv->regs + GRGPIO_IPOL) & ~mask;
+	iedge = gpio_generic_read_reg(&priv->chip, priv->regs + GRGPIO_IEDGE) & ~mask;
 
-	priv->gc.write_reg(priv->regs + GRGPIO_IPOL, ipol | pol);
-	priv->gc.write_reg(priv->regs + GRGPIO_IEDGE, iedge | edge);
-
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	gpio_generic_write_reg(&priv->chip, priv->regs + GRGPIO_IPOL, ipol | pol);
+	gpio_generic_write_reg(&priv->chip, priv->regs + GRGPIO_IEDGE, iedge | edge);
 
 	return 0;
 }
@@ -163,29 +160,23 @@ static void grgpio_irq_mask(struct irq_data *d)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
 	int offset = d->hwirq;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &priv->chip)
+		grgpio_set_imask(priv, offset, 0);
 
-	grgpio_set_imask(priv, offset, 0);
-
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
-	gpiochip_disable_irq(&priv->gc, d->hwirq);
+	gpiochip_disable_irq(&priv->chip.gc, d->hwirq);
 }
 
 static void grgpio_irq_unmask(struct irq_data *d)
 {
 	struct grgpio_priv *priv = irq_data_get_irq_chip_data(d);
 	int offset = d->hwirq;
-	unsigned long flags;
 
-	gpiochip_enable_irq(&priv->gc, d->hwirq);
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	gpiochip_enable_irq(&priv->chip.gc, d->hwirq);
+
+	guard(gpio_generic_lock_irqsave)(&priv->chip);
 
 	grgpio_set_imask(priv, offset, 1);
-
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 }
 
 static const struct irq_chip grgpio_irq_chip = {
@@ -200,12 +191,11 @@ static const struct irq_chip grgpio_irq_chip = {
 static irqreturn_t grgpio_irq_handler(int irq, void *dev)
 {
 	struct grgpio_priv *priv = dev;
-	int ngpio = priv->gc.ngpio;
-	unsigned long flags;
+	int ngpio = priv->chip.gc.ngpio;
 	int i;
 	int match = 0;
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&priv->chip);
 
 	/*
 	 * For each gpio line, call its interrupt handler if it its underlying
@@ -221,8 +211,6 @@ static irqreturn_t grgpio_irq_handler(int irq, void *dev)
 		}
 	}
 
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
 	if (!match)
 		dev_warn(priv->dev, "No gpio line matched irq %d\n", irq);
 
@@ -253,13 +241,18 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 	dev_dbg(priv->dev, "Mapping irq %d for gpio line %d\n",
 		irq, offset);
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 
 	/* Request underlying irq if not already requested */
 	lirq->irq = irq;
 	uirq = &priv->uirqs[lirq->index];
 	if (uirq->refcnt == 0) {
-		raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+		/*
+		 * FIXME: This is not how locking works at all, you can't just
+		 * release the lock for a moment to do something that can't
+		 * sleep...
+		 */
+		gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 		ret = request_irq(uirq->uirq, grgpio_irq_handler, 0,
 				  dev_name(priv->dev), priv);
 		if (ret) {
@@ -268,11 +261,11 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 				uirq->uirq);
 			return ret;
 		}
-		raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+		gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 	}
 	uirq->refcnt++;
 
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 
 	/* Setup irq  */
 	irq_set_chip_data(irq, priv);
@@ -290,13 +283,13 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 	struct grgpio_lirq *lirq;
 	struct grgpio_uirq *uirq;
 	unsigned long flags;
-	int ngpio = priv->gc.ngpio;
+	int ngpio = priv->chip.gc.ngpio;
 	int i;
 
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
 
-	raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_lock_irqsave(&priv->chip, flags);
 
 	/* Free underlying irq if last user unmapped */
 	index = -1;
@@ -315,13 +308,13 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 		uirq = &priv->uirqs[lirq->index];
 		uirq->refcnt--;
 		if (uirq->refcnt == 0) {
-			raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+			gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 			free_irq(uirq->uirq, priv);
 			return;
 		}
 	}
 
-	raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
+	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
 }
 
 static void grgpio_irq_domain_remove(void *data)
@@ -341,6 +334,7 @@ static const struct irq_domain_ops grgpio_irq_domain_ops = {
 static int grgpio_probe(struct platform_device *ofdev)
 {
 	struct device_node *np = ofdev->dev.of_node;
+	struct gpio_generic_chip_config config;
 	struct device *dev = &ofdev->dev;
 	void  __iomem *regs;
 	struct gpio_chip *gc;
@@ -359,17 +353,24 @@ static int grgpio_probe(struct platform_device *ofdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	gc = &priv->gc;
-	err = bgpio_init(gc, dev, 4, regs + GRGPIO_DATA,
-			 regs + GRGPIO_OUTPUT, NULL, regs + GRGPIO_DIR, NULL,
-			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = regs + GRGPIO_DATA,
+		.set = regs + GRGPIO_OUTPUT,
+		.dirout = regs + GRGPIO_DIR,
+		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	gc = &priv->chip.gc;
+	err = gpio_generic_chip_init(&priv->chip, &config);
 	if (err) {
-		dev_err(dev, "bgpio_init() failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return err;
 	}
 
 	priv->regs = regs;
-	priv->imask = gc->read_reg(regs + GRGPIO_IMASK);
+	priv->imask = gpio_generic_read_reg(&priv->chip, regs + GRGPIO_IMASK);
 	priv->dev = dev;
 
 	gc->owner = THIS_MODULE;

-- 
2.48.1


