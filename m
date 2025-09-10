Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BF3CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=; b=IPijXHK/Fj4CYf7j1QzmNiCnAM
	TzjbAV5njdIHOcID6A0XPXH/6ockKuMcNutLcXLX3rEhlmHL+RCVFdEhmTPEAjmO8cu2sQOkUdkNj
	0HlF1XSxnd5LaZX55gZRpu78hGsmqSy49xhJOQuVfrYzdsm3DK+YoS9AFH+BQCpxrfzaVntmJhhZe
	sb7nlcd3WnztQ4ST86Q2oUdivyFYZ4h0rAzr15Fhon5RjdASbrA/qBXhkdKJDRvYTNvp3z11Em1YY
	hW9T0PSSXuG5LcnIZfO4k5zuLPwjHqD9sEBxcx5zhLQgAtAxEzXQQ2eRZPHKVBtdl4BGFye+dx6PK
	y0rwc/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1v-0000000CT3g-2A7x;
	Wed, 10 Sep 2025 07:14:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1E-0000000CRve-2Qk8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=; b=gj/ZCjSTp1D4pW8oX/oe30EMvP
	K9u3ftrGhzAVA4w5mGB94cmYhXe/Y1x5sP61DJO8oDNJ7qXB8Pi53zuxCLEtNe/now3K8G0YfUlSk
	5+hFoeM9oWHMvy8Pn1AxVXbxeq6c1JjFqHN/Nnt5e4cOq3MxzNWO0XvJnC6ocrUajurbGadPig1av
	iv8FRAFR4HBEgkpnwg//pkNl7v5f5dAMnHR2IPLeG+g/HlmFkbr0jEvg8E3lZRSp5dqs464ODipPr
	VEiyaTM7gMBbX8eLAfejUxelWrExudKU9ImhWohhLjS9wq903J5iyM+Q2Pu/KHTFm8nW4+H26jmwR
	fi5wEAXw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1A-00000005kK0-3afT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so39884995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488402; x=1758093202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=;
        b=M4mL0fMM5peE2AuraRwBMiXP44TS8zwUXNK4vy2V3usacoeiXrgcEp/SjsYrJu71L2
         59J8berMNoE3hV4zfgLskSIMOv3POSFr6rFo3YgD/7ceLfbF8rDFo8WVHDpxWIfod9Cd
         Kqu/o6pLXoTKVXzKpWvZdbl4zteUQ+rqdGUraky9xKw37tD4knCSzCkRM1f/cQGlyiWk
         /1cpoCN8rJ7Intzk/Qij5bAC8HnYFc8AQlEjm7fSKVjjyWoDNU5BIkiX3+R8XxX6Ubwl
         u4iDT0MU/fJGrO1GKDsDGcKGlc1hOicql28ZL0hUQx29H+R+KW/OMeYim8xzCEjhfrLx
         gUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488402; x=1758093202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=;
        b=fZvT2RDJBroGDByW8+1JrqD3qd9bJ/eDhEZeF38gXtPbAIo5aWAW+w4L6YPuFajqlu
         MyiYlSSWQNlECX6Czh4VlSGNF+pqeD0v/ww6+xzU+mmfwdv1cLFCObdAHVqtlzEJXvic
         z2jIcw2AttTDz45l9fVuZKnq49wvuJjVPSKK7iQfQwp8huBnHbzFwNOuLO0o1/8fWvfE
         M8nqKET5dA2aZQJbq3+YNO9iL2W6n0JmDLfEctvlQ9wWDHORKanoh+4kst6BdVE9gbm7
         j9+tI0SBBPGyIK/KhOuCMTgFVWGppnld+jtTny044iySA0gqjORKmUYskM2xAPHUMKBK
         oTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjN00iAI4hU0zmzZrOzD3rZMbgUeQpOW3znHjfS0JsOeLdXqejpBycgPnRnTALDABkYw7QcjzzDQberDFVXJbx@lists.infradead.org
X-Gm-Message-State: AOJu0YwtvIkamG9q+moiokDlQvEsdZZdPwTReOQp/SnQ61y6zQmTw9md
	22apNPs7YP2D2pObhaQzR3lYqqveocPYH5TUNXECY+xwFSQsVqXeSFBkaDQiNP1Jr+0=
X-Gm-Gg: ASbGncuqi3xhBH5rgeDfig+dVA1PGu9ZxzIx5NOJRvo6W3W3r8QWylfZOMcfJLcOUrb
	f0bCPvG9TYrjOxR1f/dWBpGznjixIWXIZ0mIzI9G1TQVVT25TtdF8WMQHErFqBK4/uhYU4u6utZ
	0abbjcyZFRv+NLVb+Zy6/ltDpBiEIFHU3pzw+ms1QnMF3MiwblM1Ef2380aPbqwmv6hGnwJrL36
	t0WZtFAlut4bjJRbAQYfs8PopZVFDOHZHxiLcwjeE5nU5qAi84JN+bQRBlB3oHcyqRijuRxjcUb
	jqOEmUpnFZ2gBefL299qHpddCQhdFn8LsiiS0kXnp+EhtdU2Unjgl16Bt0w1GGn9CsBMUHh4shi
	ujp9fm6ewWwaaTK744nbkSj0D9qI=
X-Google-Smtp-Source: AGHT+IHoepCvPrqffYJQ5UIHKGGHBJc1+/54cYHurrsaTibZhp2uHZLzVTLLB5uNCtxFJZunElj+PQ==
X-Received: by 2002:a05:600c:3b83:b0:45d:e326:96fb with SMTP id 5b1f17b1804b1-45de3269948mr124468195e9.30.1757488401630;
        Wed, 10 Sep 2025 00:13:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:49 +0200
Subject: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7/h5cgPamRvVF+jLNZTPGYwaS32CB4zOrlr7VxAAzjc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTv0yIdz4ll8MitMXBu+6Mc5Otn99oRiDLNN
 Q5yVNcT/N+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cvWgD/4nU8cNVwDl8vk77Q2iyfBijC7A0S12Lla0fUkfGEnyo2aFOkDa7ATtYhvRNDLkgVycGJQ
 AMlaMmKhqg69nCQIHG2IWk40qU4Oof5Bul9lC2RZTsD1rfsccSrVwmUELFjq5ZskpBqtECS42jL
 yraGmhE2TWx5P/GUJxcWPh2owipXA58iir3CMe0xeUaHb4LnDJFCOzf1CAsm83Ay86MNZ5pdEOZ
 lZB3lP7Sv+MDBsn1PIOqFTqhbSUBRUsPSo1k4D13xXHxH+vGLn48ITJkRXUgxJc46q1QZpwIV4W
 x5AzzuRWYJbC+OojV9EKyzxSbTlSr6QemQs1JwukmYlRRv6qJDZ0tG1SoTzf6LsncxZH8ekwHu8
 UTttxkGTzZkQR4PQRWJfqJmDGA+1kJ5/CGDmv2Rm+mw5YTZiZcyvhe72yrVKPHGLAEuVKYgx3hY
 xkqhi3k+mbU5JcW9CB2+XAYfVfCckl0dDQBIXOiOIj6749sikgNH1PI25wigIkqo0Vlg4fVty5L
 hoZS5819zALkHM3NZdAfqgCCcrE3gDfevReAnBMTqeMlyy2Qk+wVmA4qaKXbqDs8n93hX0UgAW5
 4KlBoNsyGTJD9tc6nDzGA9kufi8QQ4TAZAX+u1yBdK2oB2/PCEME4LnoxufI6mKGjMdaqQVCH9c
 Mo4LZ6+Z65z3wag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_081325_239250_BE78807D 
X-CRM114-Status: GOOD (  16.14  )
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
 drivers/gpio/gpio-sodaville.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index abd13c79ace09db228e975f93c92e727d3864ef8..37c1338377295fa2995bac98f1ae2db892209602 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -39,7 +40,7 @@ struct sdv_gpio_chip_data {
 	void __iomem *gpio_pub_base;
 	struct irq_domain *id;
 	struct irq_chip_generic *gc;
-	struct gpio_chip chip;
+	struct gpio_generic_chip gen_gc;
 };
 
 static int sdv_gpio_pub_set_type(struct irq_data *d, unsigned int type)
@@ -180,6 +181,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 static int sdv_gpio_probe(struct pci_dev *pdev,
 					const struct pci_device_id *pci_id)
 {
+	struct gpio_generic_chip_config config;
 	struct sdv_gpio_chip_data *sd;
 	int ret;
 	u32 mux_val;
@@ -206,15 +208,21 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	if (!ret)
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
 
-	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
-			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+	config = (struct gpio_generic_chip_config) {
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = sd->gpio_pub_base + GPINR,
+		.set = sd->gpio_pub_base + GPOUTR,
+		.dirout = sd->gpio_pub_base + GPOER,
+	};
+
+	ret = gpio_generic_chip_init(&sd->gen_gc, &config);
 	if (ret)
 		return ret;
 
-	sd->chip.ngpio = SDV_NUM_PUB_GPIOS;
+	sd->gen_gc.gc.ngpio = SDV_NUM_PUB_GPIOS;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sd->chip, sd);
+	ret = devm_gpiochip_add_data(&pdev->dev, &sd->gen_gc.gc, sd);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "gpiochip_add() failed.\n");
 		return ret;

-- 
2.48.1


