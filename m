Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431A2C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=; b=HDect0ZP6A1wAbBPuC9g5AUqsm
	ITtPHr4960bxzzwMogBIxgaPCUAwjnkZFCZlv6PoqDBlWWEXu4Ya96IYJZdOmiPPV1erfJgCJdUZV
	x3kg0GPeTPo2HW6KuYR/GKi1PDOzeTUC7UbCgkSgrUEEswMJwsPKUYxVvBAqcs9/5Q+Q0YO0VcBIA
	o9K+RXHtKalJX97G+/NpNXqKOZvohPPvxP4wrl0ffYNNr7vhzq1RfRbHb6KQgl5cRoDp9zpcEaTBr
	aAx5NVXe/UFn/9fqQ0E/Fam2vVNxV5XxliqPXXNYRCE701j7A2xG4oHtrNIHWGvNrPiKmoYfKiSmP
	OgNbxSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtzu-00000007ody-0BUP;
	Wed, 02 Jul 2025 09:43:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfW-00000007kak-1PXf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-453066fad06so44461695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448137; x=1752052937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=wRrH6sC1oSr8E9p9SkGTjFULMjFUzAGSjVCD36vWDU20VtZhPLtG5SLQpJ2RcM2mQz
         O2aljo9VpSUrI1Xmu9ygVOuHMgH3Z+DIsteIkgHWeUztEh+WifDWpf1LFPuOWKHRJ3DN
         QK1D7rdLPKDbj8xVLQyYRlkSImt8O5GXZcyCBDVnkax879vRJF3uA8QpRyUtGQ13i3ss
         LkfA0RtGnEksljZeiDUwEGoNJS/6G8bcURTStVRX/x46YjmWA5XBspa8gAZM+QmUwcVQ
         eqJimT7GJ6B7hX+VhheoDR78nYKeHfqW4E47ZFkM9E/ze69erBR/1G0pSgubLKHJ7PcF
         b+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448137; x=1752052937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4u+FthQDNPLWdi1PhhMWVGkiqdk0HXsbN17pTQh9z8=;
        b=th8PA8W4ep4aYTFPN26lvOEl3T5U7CVNA5Y5yX92wTMucNWvY9SSemexR4NP/xIlH5
         62f/Bh5BWyU3KURnFWaMyN8dykHNPYbIUqQ1qcgBrVaZuVHnsJt0zjfVO/SRCrzVvgha
         B088EcqADYOXsLqBmNrj60+O1po+wTDL8t/WzO/g4bx0UjdrmWu/s89uizXoEh6x377U
         r/O+3r/fGbrEr2S2k1xWYXRNDG3tyj7DNPSzH4pZEZd+1s5xh/z8xPmqch6gMxss1jKj
         iFoGhnuE0UfDHDXJmBr7GksIPov8E7v5DSixntcaVYwfbSqyJM2Rd2d2P1qwv2MiBbcO
         hCQA==
X-Forwarded-Encrypted: i=1; AJvYcCXnGZpa0qLj1mthTaPcJpW7qBcYZdpEo6bZzmfQNLyMfRCLNOqpB/YpNdqKDceohXCWm7xiUeTh3eGkH4vL5WRH@lists.infradead.org
X-Gm-Message-State: AOJu0YyZrfly50AYsvNMXJpEYYj/83CpvD5i4i/E3zGsEVi9o+jVYxqd
	CZtDPuEwAMIwcslX1WEyJi7+paBhxTQbs38mi9HqMXQ6imLW9YRJoRDMUNbFOuQ/w+A=
X-Gm-Gg: ASbGncsmb/WNRQB8km5URZw+HDzGx1lKlgvzUu3bRuSqGCzj0pHxRTasJlHSq9tKLaX
	2wz5ay3LVj5oTQwwB2Y3SEgv90fyuMDAtUwmYHR9l37aPoX/o+HhXPp/0YXnCdj2AUAZtFRxSYU
	xr8bWanTdJEk9TMgpm2BWviJJV8xveNNjgLo2plu3+Kpc9zwlHiB2biLDT+PTzaui13hBZSM7TU
	I1HMSatlcCTvppQmF5GUa1JoIm5/tvr1ZgNJHf6xbxPD2hPhIzNyMDzuQJY4GUnk/dEQKSo/m6B
	VpAL8FpaXiHFY7JHo6Nb2aYVG/fPq+6w2pAFlbEpDXkfKJRlVsJ8TQ8Gri4FbEhV
X-Google-Smtp-Source: AGHT+IHbZgnhQJE6hWX8QzU1x6mPMLzGFrm4P9DO+m2Xac8J6ESQfWF51nMTQk2usCHmJA4Ncp1IXw==
X-Received: by 2002:a05:600c:a406:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-454a3a71785mr17378425e9.29.1751448136731;
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:09 +0200
Subject: [PATCH v2 2/8] gpio: mxc: use lock guards for the generic GPIO
 chip lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-2-6b77aab684d8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Nhj40fNUX1gi865SKkLYi1vu0OSypgr5Gc9r4LLn2tA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpEIGYyx51RBbJ7CzXYFDk/AnkSqzP89dgF6
 L+qchczKKqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RAAKCRARpy6gFHHX
 ctL5EADLxOrAEbJSR2Mh80T7Iol3UM1Tdb2AzV5BYhIuzDVEVU7rCgP67SqvrsxLrxDqmIuiL2X
 k22Frcv6RN+XT3rCdfvh8Hkx+TqVkbaAKstzQEkhjFfRe0Z9VJb+R+ql5yd3P3LMQ8hULvdLQHk
 GeQAmaVdeErjT6xzypPJCvsFUS45oUUDQAHlpb4f0EpdVZ6n5r0MtKOJimTPlLSht2YpsODgw4+
 2juaSesJUw5aQXC2Q4fDcjsJarDAZ94aV0QXwJ+x/YFFrQ5/l9ydKgIpBG5iOjFQwqJgqwfJfoG
 M9Pcem2Sz2oTsqCd2qw1eu1kwqZS7EMa+PI6/IHT8dCViyKfTeTU0CAogktbHEc7PK4CNvlJTEf
 IwoJfpM93dcMzElNW57kvB/gJ3NySccCpQEuCrLcrIlP9J1/9n26ugjx97o/Jkr0/iK2p0346Z0
 vMOegy+lHXFjXBrWr9roJpgS6ZAdGmLIfW18LppeFkXAv/lFw1TolYE1FduuKS0YASPNUqn6xRX
 aV0SxpQotRROjkTa34UzpE+zisA06RWWD/Cpf20Sa5kzSUPv0fL3FEf5OOMYvUlPHPd/gKIMyZ7
 7DhDoTCSUfmTf2NlEXl8z1fU4VzSMMAGjfGf6wAiPiwF4waMfPjdZ8E+DrIX7boD38Gwqyit8AL
 /h1jeFyl1o/LiyQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022218_385359_23D157F7 
X-CRM114-Status: GOOD (  16.02  )
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

Simplify the code by using lock guards for the bgpio_lock.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4af5a2972d12f68909dd87d9396921c80445f87c..1c37168c8d0a657d7f93067d9ac95cfbd821f757 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -161,7 +162,6 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -200,41 +200,38 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+		if (GPIO_EDGE_SEL >= 0) {
+			val = readl(port->base + GPIO_EDGE_SEL);
+			if (edge == GPIO_INT_BOTH_EDGES)
+				writel(val | (1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+			else
+				writel(val & ~(1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+		}
 
-	if (GPIO_EDGE_SEL >= 0) {
-		val = readl(port->base + GPIO_EDGE_SEL);
-		if (edge == GPIO_INT_BOTH_EDGES)
-			writel(val | (1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
-		else
-			writel(val & ~(1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
+		if (edge != GPIO_INT_BOTH_EDGES) {
+			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
+			bit = gpio_idx & 0xf;
+			val = readl(reg) & ~(0x3 << (bit << 1));
+			writel(val | (edge << (bit << 1)), reg);
+		}
+
+		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		port->pad_type[gpio_idx] = type;
 	}
 
-	if (edge != GPIO_INT_BOTH_EDGES) {
-		reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-		bit = gpio_idx & 0xf;
-		val = readl(reg) & ~(0x3 << (bit << 1));
-		writel(val | (edge << (bit << 1)), reg);
-	}
-
-	writel(1 << gpio_idx, port->base + GPIO_ISR);
-	port->pad_type[gpio_idx] = type;
-
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
-
 	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -250,12 +247,9 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		goto unlock;
+		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
-
-unlock:
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.48.1


