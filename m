Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4011CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=; b=zIOuln+vyfhG3GlHx/vVwIr7C8
	NBn9KrffyN7qJ+hDlJK8ulW8qFFI+a2jv/e8YwcCZjyPjcu4LPyW6yWHFfQF+Damqdpfz9B9TvhHG
	ukI4MDvjVKB0lwf+k5vHSPZ11UAepac7X0/8fhO4HZFhWiXeYT15L93UAThqRH14zTBQP4oEiKn+p
	3LqBX4Sj+s/CX+xIi4uE27T4xfJBIGa9NW2jHIQwwQCvNRqT+UEBY6WgT1IhRurFP4WSTByyhJ3TQ
	XzDjQt71BaY3Gl7h+NOzu9affql+JF+YZ+Ktr0qoRQ8YSqkCS2Dg/QEA+gQ4D8U0W5iCntcSOnRGe
	N3PnKPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlR-0000000BMcP-2F4A;
	Tue, 12 Aug 2025 16:22:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsI-0000000Af5b-2qoG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-459ebb6bbdfso33816955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000785; x=1755605585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=aP9EZVCE7xIVPytDxMe7EWlECLkkfqZLTiou6tIRP7hXM6ZLKIY4o2G/z8Cgj1DgbX
         /k2TiuinI+tZ8zSvhMSognlQ14x728ijnvCFcrt7UQw/3GNccUEyDoMT6i/qIVcluuVJ
         0pfBoQzxZZUN48beiqgEUih2ZgC/VLSVPTZ4wtDScfrW4mVs1JEGt9XHayCvw8mh9FMZ
         qQDXpYDdgItmdQjANobWPC/KTYspDpmvfaESS3q7Y4N4VodAFXrtISEnKNN+V5G8qR4p
         7LfB0EvE8101JgIdW10+NRdywadsQhvKu5sX2tUUYNMkPqSif9li2vKJRNmAlpFvwy98
         p47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000785; x=1755605585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Pd+f1W3JQ+RXDpdyFAaWwHwzHpzCLOKtOb/pgFbgs=;
        b=f9JNv2ANuTNw8fUX0snc5HnaVeelTXkWqdEzuVga1HaxPPMN0LYx2sgEYww9AWZTuq
         lD5jMbsrEmCzVNqNDjFDIj02RoM69uYou83aqB45a4RVaqV8/oN+9ycObScaAKCcO38t
         V3dbBks1Way+2Os4nCNQQ1H78t7nrRLOUWySuccSV2k1H/Q4DTzyuaz1ArWOKlRYmP3u
         +2hg+wNFi0/qXNKlpcqsGuu1PkxcpSA35bFK2QChFNWfjHiz6U+8hg0hDyDKok56XbCT
         0iNrzoP5q0eF7aYGCEZHF6LvwnjMJSoCL+zNPqxLZRX5uIml5hWgBxcCCvUF8BplqJSt
         eNxw==
X-Forwarded-Encrypted: i=1; AJvYcCU4zpkEyHCniwkPmRLQUxWqZUUOLgjyBM3BItvx4NqxFt4Dqa+mkzQ+TfC/nTm8WgNW384PoprH6MlV6WtZjCJZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6MSg4JjkyrCZPCsDTfm/hQbMxzY+2HvushEGlEGgdwIxSh/CY
	B07PIxDeq0EBYuxx3F5YO7MjKrt2/65un46X2gmBDSwM7QsjZ5BaDXp34S/hrZoJEaAUoBZGhfM
	0hugK
X-Gm-Gg: ASbGnctQWspz7z0lsbFrt90t5UzxlUEe3f7lGWP4sxK8hZWdSqiV0j0F4mwg3ctCqeO
	hzbRUO09hw5cfmZf5iAOr38oPRJI2/+r+rnzN0hBs0rbd11rRyP7Fyoav7tAFRXgYT99dlWqxJu
	i6rQKwtZWpl6EQPdMpkaMNXbhxbpefWAKoWhchr1djBvwt3eNJtPWPiuMlCvX6HZQ7ICh9v2r7Z
	wm0SKt8FZq/8LFv4xLQUvP71/QqLlnNWb3uDBU7QzsZc6XYSwNa+PaFSjmXMEIxKdwmQKCduLAO
	hkGfsg4kCj/UECc9UtBh1MtzrWUSxSjICV6vqVyDHU9eqh5evjb5I7wxI8z4jvLQ8B0OJmb0Cnc
	9CMXIDsVc5nNxENk=
X-Google-Smtp-Source: AGHT+IG1WS2cU9iAdxyNt0tdEubOZVkzJVBf0n8UFq8TU+Dupa4pxhDLiX/e/pVHSxsONcnfbUvwXg==
X-Received: by 2002:a5d:660f:0:b0:3b9:132a:a554 with SMTP id ffacd0b85a97d-3b9132aa8c4mr1615617f8f.51.1755000785150;
        Tue, 12 Aug 2025 05:13:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:54 +0200
Subject: [PATCH RESEND 12/14] gpio: grgpio: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-12-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/B2uC99j03LG6YqrSjYI1DM3Eo3y3JKfFEx
 QfAdkwocqqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwQAKCRARpy6gFHHX
 chomD/99PF5ZgALZBSBXLGEmNVP7fTB67ncQva5kxfSiNoteRRRSkHkgyCVNYJysG2jPmja7155
 ulYjRWLmnmVbYErcjNj5Nvg0VL/vAOSPQX1cl1f0c84S2aDWvq3ZFVZSEDm7gh5EpQRX4TRzmGg
 onz7NzmDK4Y+0azft8KtDcvi/d9fHs8KIS+x18FgiCaNK+CajZXvfFtrYfARotRnPjIFOcs7srb
 fYZwT9K4zO4GEwdxNJRugc5TARAcIcB03ts+P9hfmfgO/joVcjAcziRcj/gUQcCBydm3esCULXJ
 1D2GxsOZ2QUbFZMuKyawmi8yKzIL4XRx/ba/B9i5Lyav5+vVBna0IrbhlpYiLIb6JQRh5h3MJUg
 PdgU8SBqGgxxUUeS0UESQpmBkgdJ7aHfKg84ILJOpsUYuV0BO+43Njn2T+9bpQqa4l3vBWLZqI6
 JDzhxB8Z8a4HwaSJcLb5eUCLZNA0s9BQfWwdlOcXhFpT5KwfiYmXF5Jz5KcOVoZYJmtAgS2OgYR
 0cQWDr34AuW+XtCcXmTe6uliwoo+vUA0oqxTIppfpBzHfV0nw8Jp0+09ZCBbFjProMX0JoP/d6J
 wVO/DYB19bf8sSMEZIN1kQplBcUH9QbtQoug0Hsr+NbStzWLjoSMFWcuqre6llR2E4IjU1sIiIz
 Ph/5uDayKWYxl8A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051306_742636_848B602C 
X-CRM114-Status: GOOD (  24.40  )
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


