Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35ADC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BZNYZ4uzmMTmFUY45XO1zgtp9A/k49xGz2UfsvZ/gw=; b=psluTycZIp1eb7WIreeuYXby+e
	+5JzldybNEb48EjFiPQWtSjlrqTvszIojQq3yJhER0dvXV2mAtES5OOyYGKmo9VyLKljfj2Yc9tsL
	80thD0HXk8d/vy3X+LbR4fwrLoP6NFK1lu6BifM5zy9FMqzbMQtGy3FG6xkW57qmW+k82h22+t81V
	3TQ4LEDrgtaTITbdsjU7BMx0BwFzaXsatOYVmQWS1+vKx2wtInjEspuqiPWmGs0utHnMN0M0Bw7Lj
	0GT06FE81sTkkLHR9yFx0tgdMn9CXPCKRLdatrR9lNjGoE/nKzKAEiiZtR8gs4++P4pcqBJO9IhOj
	Wk3/HmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Bv-00000005oj8-2oj5;
	Tue, 24 Jun 2025 14:00:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gk-00000005i7w-1oYa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453066fad06so3607495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771669; x=1751376469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BZNYZ4uzmMTmFUY45XO1zgtp9A/k49xGz2UfsvZ/gw=;
        b=uKE68nrhaTilsAisV5bZS46JtULZSGcl3qCxiH9Uk5/RuC7XElcUFqA4z5Er71gOAJ
         Fln+ZhIiodN87WGgyrsH8GLYFshRxjKJr223vv62FmnuvnFlfB83N7WicWbkDcrHAL1J
         njb5ekyxDFQXV+RMQ6j9vB4LchwGfs+4Y5IkBSbY8Z3UkmsWt9tabwXeIaaHwCZlxDBq
         3P1fFbXhzxah4pNh7MrNGXt01ip8vyvu8VBIEryaSxbq1vkmRl5nT7FQ+KOWK2F7Yp3U
         dzi0AKGp3c22X8Iq7JiBFyNUKWRlSofcqZ7ESdId41fEaR6yBrtsLv3WBXH4MWvL028x
         u5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771669; x=1751376469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BZNYZ4uzmMTmFUY45XO1zgtp9A/k49xGz2UfsvZ/gw=;
        b=crKl4yMJCP5FTTXSlQYeULNlJpeF4GEPMnFdzhW3kBSxUdjFknJBijSvklsDwbjZPa
         F6TdYcJvTzq6cWX8pPsMVWVf/WBl/aSU2nZMzaltE5WxZeZ/dhvdRqoKoVeP/jLsn022
         PGxDKiqmLm+HzjHkdmqD4MydoeVzQe6wL9yb4bNDYlr51H1JSzi5HxodpYNSfUeJl1Kd
         WvTymGtREM7MBpcRIz1HwejVfQOYTODwCgDt0jGKEWwPWL2udNdbADAyCAnmVB2fEtKu
         IAU2Z6PCVGudO8nS3PX0qSSxyiEQ/jOrCdCjULaO19aJTmuPumYzHy49/fXN67lbcioT
         ingQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjqkrkkH6Zwq8GfTuA/I6cFK0NMAsaTqyUm2n6lgbx28sHbGuXsPosTsl/5RCL9ncaOhaHUbJGfQuP27EvXBrA@lists.infradead.org
X-Gm-Message-State: AOJu0YwlkHHIjQS4sJ+NxyCSSHv5F9+GIatJH3pioZxqHK0D2w9E/cSu
	ggWJOotaNiXu0+1VGoT7oewhLJLYe8E5LY66zYwkESmwIX7N64fuIuiGcw1d5CPVo4RsJdMjUcp
	csLCEDfk=
X-Gm-Gg: ASbGncss8tVXskG8MCh0vjCbHK5sPGKhMqBK2wVsKx2nX1x2u7yBGJYgHNginFZ8z63
	3Timxmj2DjinjGb9BztXiLuk84kvDYifLttsbd1PwWxBEox25H6CeDa37prhHr7sUtPRPHYMw/W
	Ct/VUIQEhtRonX10Ep7tBGzJz/v9GZaJQx3oo8X9nz/LGy4tz332RKj4UUGmFFN/39Bn9YAtnmB
	L4yhDWHyO9muWao4um1qcQoITkWU+BRghoCFm80GYG/UbKPdLFslee/ZIE2EgH0o9bNGgOr7fpR
	Vqrsa4ugTjrZAZJskU0dThp402Crdec3N2iOHIJoq9rDOtZs7jUF3gw=
X-Google-Smtp-Source: AGHT+IEUbPKcWbn9NN2y6f1Hc3c97b8DvrWEquHy3uhBBn6lW/jObv1Sw1EXdMfJS/xPuPKek3QNuQ==
X-Received: by 2002:a05:600c:840f:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4536539c48cmr145546035e9.13.1750771668863;
        Tue, 24 Jun 2025 06:27:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:37 +0200
Subject: [PATCH 5/8] gpio: cadence: use lock guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-5-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2927;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=untPBAM91123AoBXnC7kV8/BRVDDOFFauDcUW0X87cQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfM13Dq0oK+m+cELMPgv/E6/IQGi1X/lJOCc
 a2U5/8yD9CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 ct7uD/sGNCGk7mdxy9ZfPSIWzM1QufC2JrgdiT1Y4C0v/JOJlMDMByILNEMjNuLqPvYwu4UsuXi
 YaTQmzyJRfcrSaMpBo3MLw6yTsNjpbfEj3f0tc6JXKuN63anO0yf/GAHqr8QwbT0pwtHlqQ2+8+
 dao1qn7AP5NrxRlsb4M0FZBu3aTN32jv/7T/s7PL/ccIhaXy9QCmZ2rPYvIw5s9tl3ufYMQewpi
 wfwRzY+d5/hTin8rVg6a2EHUhzg6lSdwlgmXHUk800A9HoObSpf0bu7te+fsVPL8H4LQJkhgf+w
 8dJhcLVkwQGUbJ4lQf3l22eqiC6H6ypmYV3/kdetNm5+hUzZjw/eeqHr2ZxboZW3S2DJPPQJUVX
 nZw4HQTJ+ifS7tPp8XKWk2bn5l8zQWL6E3S/XmPvhLc1SYXKoz9I4V3U8XB4NVhZYme2ZQQ91HC
 LkgmBLKRb8LTDwmM7TVxVpqxrFl93lY0E9JPkuKOirXbPyWFM4zp+ru9JOa4Ldd7YwFcYaL2CXy
 3CIQUTblBcFwqb94o+y4qAAWyBzUzjD4QEhX81FS2YtbI2QHT0Iy2hRWsqsVgirNrDi0zoQined
 bpUiuzHCs3kz55dzOzWQLeCyWnEQqPosBKqSmfTwwzXF+BB0ITuGzOHKFwOOCj1n3valTMFGx8x
 i/798StF+aw8Erg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062750_480171_97A6CC80 
X-CRM114-Status: GOOD (  14.06  )
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


