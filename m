Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74734C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=; b=FuHK9j8Cte8yh5qMvYV0N35zbd
	GGDYz5lojCLblTRp1P5ricLJ3Ane/HyJur94Qdq1M2t9ZWOW3DLo2LQ29jaMjU+mFXOJA6UhdpBaZ
	98MrbNugyrTgjOLc9CPCFCKt6pJo0OM9Xye7JQ+w9FDB8mxaC4G9HFwzezHsxfQgeKEht0pJUQ1c6
	lVifuRNu3pRAtbc7AUYSBbayGaxtbW7ddNH2FEI+A3bcXwttfmKr7+32RhtS4tJfQSDsWX+AsnKon
	91uKVjvK9PocgZ20v60hqHTX0ovNYRT/fBhDfy1fs5V4B9I0AxScUhxtHIMsHjgv+PYpAspmmXOey
	oDGZ7m7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU44C-00000005miC-1THh;
	Tue, 24 Jun 2025 13:52:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3gg-00000005i6s-3bCK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-453608ed113so47085715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771665; x=1751376465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=gCiLr59olCnb1G28T0sPE5c2d9ex+2rJJPVRbvFf2CYG/bcN+NDkC7747E8RULSq2t
         5qbMbkgkLMhY6NbD2FnyB76dnmNsBFbmjhoTA8qvgMUjFu6HgtE5grZ5fw4TcLuAqGRC
         0MVfq9dwMuao5nAPK6aoMKQMwTbYest5wOjw0JWKmHZDf2nTssKKqfyiPdt1iawPn9Db
         N73mAfol5f6WuKn9oOG2OYr6Ff6fWJD+n+HHW9r4teN9+KjiWv7+4sJgy3JxTZNXke3Q
         FYxQa0n4aUlAvpz5FCHqLgFYQvh547UIIxcbvlRyo6Gp7f7TRXaeO5YEKUtS2aJY3ebu
         M3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771665; x=1751376465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=MuZW9a0rLHgR9rS43kW1cr6HF3yySj+EY+NXnfR560ZODRN46fIYrlbuDBCymwZEA0
         2/Nl7Tsz7iYvLt2l+1sRNFIQS8v0m5HlsPuRnXy7cd21Mwnl7a6qUY2nUtPyJzj2pDYl
         Rap+7sDTZJd9MPBbjoVTYWmm+ayTSbWsOpPSpwMAMRjNZQ9x0CwjuqCv0FsL8vBlS9CA
         OH6oRK4n5LPQFhx0RWJzs7PKlaY9ADCiGty36k/DWMtRBvLEZRyUxXj6JHYekN0gwsv9
         pCo+LpWRVJS3nCA26JOSxoTDG7VgfwyYBtk9X+Co/UFN278Xl8Xxo16M0UiIYutxRo9Y
         J8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX9YtHDRL4d6qHWj/dQtkKZGZDeNQ71NRYmd8X5H4ziLjMCbh7o+rSGJ+CiRGC1fEa5W7B1eitT8FXLZElRgo6N@lists.infradead.org
X-Gm-Message-State: AOJu0YymyUGm977ASccGtjMadqN+/02zQhiOus44n/WLWq/vK9K8rMe8
	XUi0YWyNOd40iMGj57+2X42MHucu2rUNXfeA27+bIYPTGeOLoeLaTZeYN6DE/r5S1P8=
X-Gm-Gg: ASbGncvFBGmP1kftEKn3f95I0GRYZGDTODvf8Zk7woEiO4T2Pn+XUnWdWIjFeGTto9e
	5p5QoE2d4yuMMEu244ifNtVEwOJ6+IyvIjPcoE5MuigxvMXxqAc1VENanBZPu8eqZGUf8ZVZdvG
	2Qu0eqymgB0xnnMpoB6QtcWiPSUueiC49VI2aezEgMSDS9VFb6yO5UNH7x2IQErfqzw7bfBIi90
	x9qkVLw6J+RdiKWSiw2HBoOL3iuQ67BVjRPzbGc2N5XEi+mu7nWCn3q3/jFi48G8yephFM1CDzt
	adiPThAQ72rEKaGzAkj89KuKIA8I86shTOZgbJCl7llFwXjF0basW3I=
X-Google-Smtp-Source: AGHT+IG5KWF0KCkThs6nJ6gal57FkJx7NIEiZyyWqT8Kac/vBWN9gXYyILceeK2lSrSaeIISymjmOg==
X-Received: by 2002:a05:6000:2709:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a6d130710emr9619060f8f.31.1750771665372;
        Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:34 +0200
Subject: [PATCH 2/8] gpio: mxc: use lock guards for the generic GPIO chip
 lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-2-aea12209d258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L9QElStGogw0fz3XtB/b3BDhicIIjajUB8CqB/jaGV4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMkiIjVTe0tH1WLgnWonfVy8AhQhRKYcJ31
 wTEBATW7SCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cldLD/40hHr9EmEoxhdje0Mr2R2lm8PEsqdf2M4DnyDRT6tAwlnsdqL9jxCd9LnltXjUv8YaQVZ
 XIrsv3kkjxA4P3TYFdyjv+So7dj53stDO4C5FpFtRRdZ3JObzEBRw8oROkRXVpWhupxOgEp3AiZ
 cEf2ROA83kJYU92OvfD6hVf0XmbiHxj8BBKBT6ad/d3S2PFKeR04f3Tafzx78NlSjT4nnpfQGCV
 cqMA/sOeaghF3Y6O0rgEk2gBZxicTADRpyAVp1kaWdFt+w91EcKCFgdREm8N2hAqKoEbuTlgaiN
 1TVhOv9ZDQoF1sssO0rRuAtXymrdk946TUI6VxZ/YKub3fyB3Ve24n927i/pMf6ON3HOXPElNUg
 QdKP8i9nZce8YeDffxblqGqU13hpLoxrBl9JT+XqzYJ5cFUx8ykf0eDd5UHHCmrNbJS6nBgswZG
 PQAdXxTFkOUkda25LTKJpq5zT+u34gTyBUGG+CyxGiy/nwF0H/ZfVnlisyJvfA+GhNe7zpYOlrU
 ptM+8UVlNhzz4mNdJK3vUAVa2Bfg2P5I3Y2HYKOyNgVrMtwoBm5Z/xrkkbOCUWl1VmjYp8AtnAB
 IBck4wL8fYgyCFaqfuhau5035FFG0WZ9xSwqAZQHFZV65uPj/pUKu1wWuklwJcboLvAsMUKMJ3B
 Cdq+ee1OlBEp3nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062747_300521_F268404C 
X-CRM114-Status: GOOD (  14.95  )
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


