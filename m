Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB41CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=; b=sRHhsfKefmv7MYnfwKQ4zjqrEX
	8tYKNLLGl4hVJgNK0CfY6PRvgQx6VoMI/wLhQYQrqNLqW7vq/8dhwg2S0j4Lj18Hg64YTxCSPxqcw
	T5BGOHqK/8uYWzbVVTRyR1PKXl9KhSQ6vfUZHeofEdDHMyw3fT34InS7qt7OiQZGay0vlichRgu7U
	dUUF7RLEukCfCoyH3cmQNAemW6crjtzXc6r4NfN3QCY42CLk3TBZxMeVnXZcL4OMakHmxX9eddhp9
	3UH9jfRtS5v21oqYaG758oA8/nscstkaOzlCEdj/s6NRNvyiUgV4Ybcg9+p4L8wngD8NBgaYxfRjd
	nD0sONbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1b-0000000CSSP-4BZI;
	Wed, 10 Sep 2025 07:13:52 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0w-0000000CRSk-2VB5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:15 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so3647342f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488388; x=1758093188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=;
        b=EFb0TVh64r+zGtm/3nZWcL1lBbssR+2rHaD02GMpD+G8KsEwKK3SF1kN4PD2ONljZk
         IA47ue+AjwBh6lF4GZ0zyfLz8oMtJdES3dvYyz/wRiV12MAsRAE1QY8yMpsprpK9fHMP
         07lgTzVj81yA+NPP2YtyxTmnJMQ++EALqQPwy9gUF2COBhxEQ/9Xb5RHdplj4yxQwWrz
         HyMv4NzWk1oFuNfdJgd0UvHjLVW0Puy2JMXPtApDbp+MKkdnlLH5tqeOrUVCoaD3p139
         5+2+7D61fMrX0k4SwijS3MI1B2936inmuWfQVe9X9Mu08gxCnl8E85YfRl3JZ51Ujl6C
         fU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488388; x=1758093188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=;
        b=V8C2hIuKeT8NsPNG7PRFb8FirQRZ0lDv42pksVQDoO93njdRLJiRzFiQ8NF1uCmOuk
         zM5BloH0kIbedxbqoRnhWpm+rU4X448o1ifqXfR7uXLBcC73OWXGHorLuMknYRakp8k1
         mKjK/o8zExWOmQKAFpY3XQj1hJ7S71EUPROKTgiMmazrlNog95ZzK398bItWvYqS5CKJ
         ApP957l0a0BnRE+c8SUlGxKS7LI9bU51ckq0XBF8rFCVewBHgB2EbLSPk0IHLwBlXP+O
         e2AeR0wQk3k/KxauJgOLXMpfvzW207kw+FlShinVGW5P1kHPulxhdJLjt+VT8EWL/Ace
         MvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYtBTf0Y7IBoe9arVeQWoVAb/PP9hCjECKB9x5EINOqCQOXsgBpbT+EdBQzlo/VPCM+v60PytrG5klF4eesQ7L@lists.infradead.org
X-Gm-Message-State: AOJu0YznQ323hc2Hd3k73LLOXeCMsPGTsjjiD+L1M3dYkhMJL8V33iww
	Cy3BL885uKZ4ZZIkft7/oesbzsHsfXHqd++kMpY7EmQWVWCyDcbl2ZHbPo258GF3VOk=
X-Gm-Gg: ASbGncv1Xtx/GAG7F9nMwshf/4ahkNB06L8svi5+V+cRvS1RUCg1taJLSjiYt0f9580
	gLui0WzONixZuUFMMeeNvKQD5i+6OUYFwa6/yxqSIyA6LUMJY1GPUqa53gkYzzG0D4EvHxbbCg+
	nBlzUQftNOBtlMSt5M5HoeGF/oCUjtnyU/j+KsBKwU07lKMeHfQA/yrQk3DbYs00FNtb8763y1v
	s5KaBrXTiE0NRjocrrdRjbtbu8ecNeGL6fvsnGJjC9sQvqVUjeAPnIOxQEeEIku0xf+mGZ2JGuR
	4WWUIVUS6xi4EQyIVrB9qCwt0CMSSOrm3K6pmXHX2DqN9beGZeg87suRy0BT6hwn6g++KCK1Inc
	/CmlEycB3DFv9NoO4VsBqJ14hqi6oo70UQpCqeQ==
X-Google-Smtp-Source: AGHT+IHcvhZZzP4TZN8dDM2cz7gIErp9PBji/Vm3N8fCFTA9CGkIGjusChs87EXSmOouxgrha6RBMg==
X-Received: by 2002:a05:6000:3101:b0:3e3:59cc:65ba with SMTP id ffacd0b85a97d-3e64374208dmr5090711f8f.50.1757488387704;
        Wed, 10 Sep 2025 00:13:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:44 +0200
Subject: [PATCH v2 08/15] gpio: mt7621: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-8-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sm2OibAFBIz+8HL11qXL3Wby/ipKKdaG0xSU+4Tx1Ws=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuMKok5DESPFbhymqYsolQEfeTgC5P2l4ck
 1ZZifwJvnSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 ckp4EACxMivANhAd7XZ3l9scDS+B5YYyLmSQ3Ny+BN657qboxkz35tdtCqo9RM2p4vwJoj4F58n
 rjt9YIZ8WE8dMVbEfz3YWyz2izu1kYq5xHXgyIZll+ttlgAkxUJMWsuOBlNE/mEv8eqfcVyE9kB
 fhGVUoTUQXe2kClwurlIT/uqlyREzW7/hE/AmyHfiJlKDOqTSymNVLaciZ1m628rEw3f3mkY6x3
 1VN/jTKqn0fwwlzZos29x0Jjyfc1cnUDSugp+Uc15e9NHBZ8057+Tqkyj5rulMP7p/pBDGXQfKr
 E3xP1G5ACUTJrVHiWsG60aO8/ouvgevz7upK4Sjv5n2qXzPBDaUUUVY9ntkMfsDBb5aTP1KXKev
 SE8ZtNSNtnUncL/Fo/N//pBIkDpXL/pSZJZvi4YAeO8SaOwCBnOdJlP53HJ7L83zzuNpBUjEW/i
 ksoRPc05p8Mymr1HGMs4h4dnZg6ZPQ7HCxgcHCK6ciFupdOexJxm49Lf73Pum5dSOOYzlkP3gM8
 5gUvz/9RvDf5rIDYx7tCSpJC+y7e48f8iuJnObLNJPVt9uQtnS8fDEF0Ol7dfs/dvCRKjERzjOZ
 SK7mIZEGfXac9o9DC5lg3H2DAUewgoXaHy9WqzS6wO39syN8uA85mWEaWEZGA2YQP+7a9pIumwe
 1hvajsW11qzliiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001310_918860_A57C17A4 
X-CRM114-Status: GOOD (  20.01  )
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
 drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 93facbebb80efadbdd3fb4500e0db14936287f1a..e56812a1721151c8f3b32b5093aee5c74bb798bc 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -6,6 +6,7 @@
 
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -30,7 +31,7 @@
 
 struct mtk_gc {
 	struct irq_chip irq_chip;
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	spinlock_t lock;
 	int bank;
 	u32 rising;
@@ -59,27 +60,29 @@ struct mtk {
 static inline struct mtk_gc *
 to_mediatek_gpio(struct gpio_chip *chip)
 {
-	return container_of(chip, struct mtk_gc, chip);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(chip);
+
+	return container_of(gen_gc, struct mtk_gc, chip);
 }
 
 static inline void
 mtk_gpio_w32(struct mtk_gc *rg, u32 offset, u32 val)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	gc->write_reg(mtk->base + offset, val);
+	gpio_generic_write_reg(&rg->chip, mtk->base + offset, val);
 }
 
 static inline u32
 mtk_gpio_r32(struct mtk_gc *rg, u32 offset)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	return gc->read_reg(mtk->base + offset);
+	return gpio_generic_read_reg(&rg->chip, mtk->base + offset);
 }
 
 static irqreturn_t
@@ -220,6 +223,7 @@ static const struct irq_chip mt7621_irq_chip = {
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
+	struct gpio_generic_chip_config config;
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
 	void __iomem *dat, *set, *ctrl, *diro;
@@ -236,21 +240,30 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
 	diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
 
-	ret = bgpio_init(&rg->chip, dev, 4, dat, set, ctrl, diro, NULL,
-			 BGPIOF_NO_SET_ON_INPUT);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = ctrl,
+		.dirout = diro,
+		.flags = BGPIOF_NO_SET_ON_INPUT,
+	};
+
+	ret = gpio_generic_chip_init(&rg->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init() failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return ret;
 	}
 
-	rg->chip.of_gpio_n_cells = 2;
-	rg->chip.of_xlate = mediatek_gpio_xlate;
-	rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
+	rg->chip.gc.of_gpio_n_cells = 2;
+	rg->chip.gc.of_xlate = mediatek_gpio_xlate;
+	rg->chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
 					dev_name(dev), bank);
-	if (!rg->chip.label)
+	if (!rg->chip.gc.label)
 		return -ENOMEM;
 
-	rg->chip.offset = bank * MTK_BANK_WIDTH;
+	rg->chip.gc.offset = bank * MTK_BANK_WIDTH;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -261,7 +274,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		 */
 		ret = devm_request_irq(dev, mtk->gpio_irq,
 				       mediatek_gpio_irq_handler, IRQF_SHARED,
-				       rg->chip.label, &rg->chip);
+				       rg->chip.gc.label, &rg->chip.gc);
 
 		if (ret) {
 			dev_err(dev, "Error requesting IRQ %d: %d\n",
@@ -269,7 +282,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 			return ret;
 		}
 
-		girq = &rg->chip.irq;
+		girq = &rg->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
@@ -279,17 +292,17 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		girq->handler = handle_simple_irq;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
+	ret = devm_gpiochip_add_data(dev, &rg->chip.gc, mtk);
 	if (ret < 0) {
 		dev_err(dev, "Could not register gpio %d, ret=%d\n",
-			rg->chip.ngpio, ret);
+			rg->chip.gc.ngpio, ret);
 		return ret;
 	}
 
 	/* set polarity to low for all gpios */
 	mtk_gpio_w32(rg, GPIO_REG_POL, 0);
 
-	dev_info(dev, "registering %d gpios\n", rg->chip.ngpio);
+	dev_info(dev, "registering %d gpios\n", rg->chip.gc.ngpio);
 
 	return 0;
 }

-- 
2.48.1


