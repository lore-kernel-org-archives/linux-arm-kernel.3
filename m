Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ACDCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=; b=eJpgap7W0ww3kU28NHP463NZVz
	tdzeVBfO5TvoI0D+naz8KP9dz4r8yJwwWvYOuul5KsrMyu5PntQeQmtkKLDqooc4roHWfyAdW7hyJ
	Q5Wj0Din491Rah5RbT6Y1EZ0doP/mdGj4fUPDlugs9SJq8h0yvjFLs5g5c7WegoEOUbzsoUwnKKer
	XN6ucuhK36+6bY6qVqKtJBV9an7uT2ct90S/QcRk6RA3QP2WeGUb+JNRUuwn+VY+IHY6mRSQ569GL
	z7u0xuwgE3RtEMXI5SaWA+5BB8Y8Umlc6q5L7XxxdaXQ75ai2BE2ZZIpJoRJFhWe1M3zj3gIFJ6El
	jjnQlqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwiN-00000006o43-34DY;
	Tue, 09 Sep 2025 11:40:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuSN-00000005sqn-1nri
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:16:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3db9641b725so5389464f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409366; x=1758014166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=;
        b=AROWdIGyEOimiFrUMp8K7GipzU8jCqiu5tYlb087EAa3BO7FZ3+wZO2qFbIJEaCpMw
         NmPwwjyPv9KGv3GI6HZVDhhYAuA2fNM0oAqKyoObFFv7Ui9RAGmPvXpnlBFaN3w1ELX9
         cuX66Oeffj09WjMt9pEk88hYlkqTOWMISo7IOOwICwLmvaIKMMkwPePAoYTh0NG6eoWZ
         5rh8TEKahHc2gTT6XaomOB5g8muOmNuaZn1aX0tiWI2LDahF/eeKRbRi7l8ZVYehS1wJ
         PdI+A+kXC4zZ/TiWhE8Gv9clW9fetCDeCMTZpMbIsOK+w/jrZk2fN8iLbz+BxrCztSeX
         nwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409366; x=1758014166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=;
        b=M2Q21HVnCZUCQ9PCJSKdyR/V5VivNup8rD3IU7K6MCS3XXutoh2/QDHfTjrsAC57tY
         hIQEnGBCixPpkAIKhA66BWyHoeCYNmMYLAgTwt1PAYvqKvpeZnr+b3Zyr4KlhCGtic2u
         A3oNWxvC7zLHLiwL38nzRMoCxbcOz/3m1DuFgHlvszHjFzlTOJeDuhDc0tUH9KTgOW5m
         nHNVTUxM96/6it8eoWdZciJv/vYwYaJeMEuvf/lVg/3kwYjFOl65miPEaLXutMN5csX0
         A3Q0B/26Yns4gKQttttgnNLIfHvBIodPwpJeQU3jtys8KUh0nYMVOc5VCDU0PqJ9QAVK
         Q6YA==
X-Forwarded-Encrypted: i=1; AJvYcCUpN893qsEEzKBUANDiZV6akzsRBJkkuOEE6iNJGQz7xm4wpg1KXyovf58n46SU8C/e3CtQtEWYgeQY3CcLBXaw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr4r6wNuwC2Fr4sq5o5tDt7MKGosag0MQpHgJl2apySEmLRGBG
	dL2PKFphRw2xN8aRVr7abWZdEpf+IEU5ICiU4d5dU3q8sm2QoeF6WScKIx0Ocu8E8lo=
X-Gm-Gg: ASbGncuZH1Bq2JY/mWbHnGckwYvR8Hm5LzrAUmDFniUqSfFiOFytezi36PlCsXtvyS4
	d8FdIpXfSDbCi+k8PLpOiAXqNs50VdDevOIjWdxUE09UYk7YKpBEcQYWq0JJeNFkwbYYs+75vMm
	sgfz5UVhAU1fsU4e+qGMmvBdhMOWZL9rzD71lkp0B2TyoDSr04BRVtvITN1O+Eh3avsudGYBME7
	DYsjaB4V7DAJ9JNpxw018kKloCHq1XXP+OqW3QY16cQ5iqzHSyM67qCIMfrJCKmsM/vvl1ogAr8
	VPX5/yJ5yXAEEuIZHMtucQ0z96hn8sLfDTp51Z3mYOm6d5pSHBK09J9SCs4O4LdkXW0ByJAqlt9
	u5B6wHx76LxXFxcF9Jg==
X-Google-Smtp-Source: AGHT+IE94R1Oy4E8DYu1vi5/MQwSSBtXsOK388TX3Bsmqin3tuFYremvz9spe63crlhiuLWMz4c6HA==
X-Received: by 2002:a05:6000:dc7:b0:3d8:9bf9:7c0b with SMTP id ffacd0b85a97d-3e643555f94mr8126974f8f.47.1757409366047;
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:39 +0200
Subject: [PATCH 12/15] gpio: spacemit-k1: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gNo32+ptzHzNQ0FF1qmlz+3Zqph7O2GD4/GEGfsM86c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6nAxdBHOjeyAM5pmmPsB62m3XhnRxXkrE2
 U8RABVAM8mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cme7D/93u69p4SavcMfdgj06qig7Tkoa0eMfEjm9IPYT1ykfvFQhNDSGoOj5iutXRMOLR9LLr99
 IlHQqBPMKer9ht2ThaRDHXbsDDAEPSS+jANLAOWaKygPteu4Suqo4pbDL7cxkdJcgjbdbHAH9Zk
 zl6xAUgDU6jfmPvcO2VhJr75owb7CGZp5a1Dnag35fFfRISG+pgOiAwhAMivHpcgpGn3EwmeaTP
 LfGkDAj4ulgpkjsaxwo20vLHJ2wSq0mfKheltSCFdiS0+aok/Rbl3mhu1McHriCqmlvKAyx8IAv
 7lC5qZsAWcBUG1VqNe5aycf3coJ/g6KMy0i8g//fr/txxRCIjdHyTcfJ6t13JKQGqQdCTM4chQz
 /+XMHuKfpZ/Q4YDs5n2SOREbvZSSNuT6QTeWHDX+6wXH/ATSEYsVIsLd9L+c1wI7a6PsyV63P/I
 tvIzyK39lt2Z2dBxc+oAlhSwj0mAIQdG9XCVXavR4vOS8AdP0gT0xlExujH+Omuw0g5KWNawhRJ
 T/ikz1yOTq3wDGN3oZ1XYESu56a3iGgC7de9FThTX64Nyag3JpJ+NL7w3pWFdIppgGkim4hUCGR
 HCm9ppak+GXo8YQgBBZ5fHJDeF/Pj24TnRZOWwbCoJlmgMzRCVZPV/2mEWll6esXcxeseLt41r5
 XEg1x+7SuLj8WOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021607_502276_58A43E05 
X-CRM114-Status: GOOD (  18.41  )
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
 drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..9e57f43d3d13ad28fcd3327ecdc3f359691a44c9 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -38,7 +39,7 @@
 struct spacemit_gpio;
 
 struct spacemit_gpio_bank {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct spacemit_gpio *sg;
 	void __iomem *base;
 	u32 irq_mask;
@@ -72,7 +73,7 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(n, &pending, BITS_PER_LONG)
-		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
+		handle_nested_irq(irq_find_mapping(gb->chip.gc.irq.domain, n));
 
 	return IRQ_HANDLED;
 }
@@ -143,7 +144,7 @@ static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
+	seq_printf(p, "%s-%d", dev_name(gb->chip.gc.parent), spacemit_gpio_bank_index(gb));
 }
 
 static struct irq_chip spacemit_gpio_chip = {
@@ -165,7 +166,7 @@ static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i
 	if (i >= SPACEMIT_NR_BANKS)
 		return false;
 
-	return (gc == &sg->sgb[i].gc);
+	return (gc == &sg->sgb[i].chip.gc);
 }
 
 static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
@@ -173,7 +174,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 				  int index, int irq)
 {
 	struct spacemit_gpio_bank *gb = &sg->sgb[index];
-	struct gpio_chip *gc = &gb->gc;
+	struct gpio_generic_chip_config config;
+	struct gpio_chip *gc = &gb->chip.gc;
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
@@ -187,9 +189,19 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	dirin	= gb->base + SPACEMIT_GCDR;
 	dirout	= gb->base + SPACEMIT_GSDR;
 
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
+	};
+
 	/* This registers 32 GPIO lines per bank */
-	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
-			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
+	ret = gpio_generic_chip_init(&gb->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
 
@@ -221,7 +233,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
 					IRQF_ONESHOT | IRQF_SHARED,
-					gb->gc.label, gb);
+					gb->chip.gc.label, gb);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to register IRQ\n");
 

-- 
2.48.1


