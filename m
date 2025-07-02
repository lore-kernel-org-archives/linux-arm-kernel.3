Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA731C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=; b=PqiOIYnEoyWulptBMfd93cr+Zm
	+Xcb98rp9wDifDhaG22mqdjoA7C1KBl5kvWK1qer5EFXpXC2IcpytL5VIWrjp5AeBhxUkaarhWeix
	PIyY69fMqd818xfNhpJwBWD/uat9k/cr478ZvUrBIEwZX5c3BBfJ2cBwoYOLh4PyKIA3Y+2pSYcgZ
	lU7HS/r5zTec2TCg3szx3HtFPW87y71nnLZmSAPi4n52TBCoqZFtgg2EUq4gek9b5iC2NN90ei1AH
	ws1FSXZ/4ggDtm2u5n7BpNocdWyn1CBZdrn1yaJQA9km7B5h0jBVkt+IuCZOsnF+SJE45As5L3371
	DkZz3Gyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu9B-00000007r4M-2n65;
	Wed, 02 Jul 2025 09:52:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfa-00000007kdQ-2YRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451d7b50815so31081555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448140; x=1752052940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=;
        b=Ey5bviUGM/i+rbqHx/eIzU9cNEY2tvXen7+HyKKAAzBRESivSADi7lH+PR0mn6Etvr
         krq17fn0CeA8qL3FEZ5W3G7SfdLvAsN2SyDuWHKElmEPrqtX4kXBzDGDnNPPW+cBBRQQ
         RrpGPxzzHBeoY+BABU4zyscejbQdJk1j+TRkFQnof4fRgZT1EeOCkR5QQ3chZa5w34G/
         wKEXHryaV3KZNNVxrHRyUReg1oB4Ir7Klf3taEQhEdQhnozcRD6o+y6gF0XNYlE0dpTV
         TtI1AHAy5eu6nnfNEXmm87b+nKtSHrhU+pzhDEGNz3Vr/JBOa/73Jk2xuUqYWciiYgsu
         6Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448140; x=1752052940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eqgDwzB97RNtxOPadXoAPBhDLs6Dg7JTwhUz1GvgpY=;
        b=v9/4qMqPVPdRntTAbnUOvvynUX2zFfTLCcGLcZx3la5YihSKCQB//8TxHlo9S6AMI0
         Gz3X/oRehcmctjlvBzyqIMj3IGV7VRVqw+nAtI5lepL/AD2CmunKbTNWsOEYrCqFrmOZ
         Wn9QaQaAs0+aG29qBc3qXhWAIoVo7WHSAJ0zgUn7Sej5/ZnA19WMx4opdHVseW3XeqdP
         FKw6ZPKW2y71TMO770wpdgW//MrqJgHqszUMgOUJmP6Zn+m3JwybAtX00hi64F4CEyJH
         bbpe/AA8hk7glvNr9taOvKz5jOLRcx59YrcxYZLdLORGd/mdy8RzjS/ZlPlr4k9KD0TE
         GAlA==
X-Forwarded-Encrypted: i=1; AJvYcCX8o95Poe1gqRYzQJG28FsH8FtfJv/T5KXDyRvQI2BeIUY2ntLSFfkOs3zDY3L1AKs+6uBGfINzBQ27Gybm7mkT@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPlMsvwmXiEBZMVdMJmsSZoYZ9rUmIysdwgZ9kQu2cGaQ0C0o
	sifPnpJqIrCZlSGCW1jrpvbqFffNvILrSrrnfByaFGObD1vZ5nBnY7MA3WifIrWuZyE=
X-Gm-Gg: ASbGncsX6eMMB1GwXJP7SjDS6xP2ffv0908Hmzg5OoYVz4f7WEifUKPjG/d3itCCYH2
	S2awXFco1foklkkxxy5ChkepBiVi7IgGcBv6rQ6naEx2K7lFYw6CFTdSdzgV+04L8OSgndJ68ff
	Yo5pbwfLEZ8qSKc8SK43XLUyoXbf27dhplnksST3eq7vPSNYt/1gI6z3JZAnEEYq1CJPYyHcqNq
	XrLmvT3NN69b+e4GPlAcHld/qLDK8oBDaaIxu8V4/FzbnfKA2X2l2INRO1H3vAU6RaxWWvZvBIZ
	o5TNIuwCw2kW9XIj2mcNNWjgaJwB60aMfcY10yuJYo8Hcrg5xXTKtw==
X-Google-Smtp-Source: AGHT+IFJrU/ikcBRx1Xx3y3CO3Xl5EZm1K/9rmg09Re30z7P2KS1UPvPZTAXYcN+r1p0EvB1jatrfQ==
X-Received: by 2002:a05:600c:1d1a:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-454a372e257mr20008535e9.25.1751448140059;
        Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:12 +0200
Subject: [PATCH v2 5/8] gpio: cadence: use lock guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-5-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bk+ifnf5IeXV0G/nLqnGxGzgGzg1ByJ+7XwxWcaWlmY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEg9KNgCFhZ5UtYv9wjTJ3eMXjUODBpO+wb
 PCt7nnTMAeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 csNAEACkpQv7m/AU3g7yjr1wp65de2B0s4Lm1cV5TrvXTlGYDwOuPfXVk5DxB/Em3KcTEwtlE/4
 RWA9JpR93rPV1btwtVrx/82hueypt+EsY+xMyxJrCmuoxwa6syx8ULjU0GJ+iptb9w9RkweOQEh
 fDTaCS8WmmKhKNC1m65+eg3G0+c3jaRQ1FXE/C6wqeYILGRNS9SWb6ZGiadv3AFB4WaBdiTsjn9
 JfTcVepzX9vT7aSsgY2Kz3ZRAnXZshGxm+tP0+rq025yE0SoxO9+yALIGcTY61qunZePr7fHjuR
 bzCoJjJ58D4g0DDy+KLy8nqkbogviMcEpQvfJHQm79Z3ApgVzOwk4A9Mh+4BvG+7ojJo5fvk3Dn
 KCbIH0AXYQhMnQ1rjNHJCPC3fLWE1E9BMT3xwfJWDSzqd3OGwPECW/+Nh+/ziLuY4ya6lN48/+/
 Re7tql7R9ONudhsB1UuOri15XRayJJm+MynOps/0P9d5VyafpYN6hfOyHpbrAbfn1eys7aTuHLc
 yuHH4CLFwXbCmclamn2uCj0lASs9cN3LBr1yIzKCI5BEPfG8ghfAu7VnGD3NL9cBcT8TS6WZumA
 h1GKK9cFtnaVYyg5ZwvNGesJn4tci8QKpBqcg/6JfNq8c2x8P7krZL27a2E4GOvLJ86c7NI/bWy
 BzYw07XnOr3jksg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022223_057593_60377E83 
X-CRM114-Status: GOOD (  15.32  )
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

Simplify the code by using lock guards for the bgpio_lock. While at it:
move the gpio/driver.h include into its correct place alphabetically.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e9dd2564c54f879cf1d49442dfa3db0004473d35..e6ec341d55e9047b2fa8718799ba72d54624388e 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -8,8 +8,9 @@
  *  Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
-#include <linux/gpio/driver.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -38,29 +39,24 @@ struct cdns_gpio_chip {
 static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
 
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 	return 0;
 }
 
 static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
-
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 }
 
 static void cdns_gpio_irq_mask(struct irq_data *d)
@@ -85,13 +81,12 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	unsigned long flags;
 	u32 int_value;
 	u32 int_type;
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
+	guard(raw_spinlock)(&chip->bgpio_lock);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -108,15 +103,12 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	} else if (type == IRQ_TYPE_LEVEL_LOW) {
 		int_type |= mask;
 	} else {
-		ret = -EINVAL;
-		goto err_irq_type;
+		return -EINVAL;
 	}
 
 	iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
 	iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
 
-err_irq_type:
-	raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
 	return ret;
 }
 

-- 
2.48.1


