Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245C4C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPNeg7LLw+wPjDBNhjdS5KhhZROy/LV2IQ+NsavxOkc=; b=vBkY7qnbb9IqsVvNPh9Sr9wnU/
	+VsCMG+31XYMU3AKk0hOEbrlTJ7+brXY9CRV5xMgeFt6CNQMIfs7AeI2eKMmh2oeUoOKcoLoQEA7U
	II+f+pny72xxr3Wr2YIgNronIJPylUXoHuE5W+At8h7mUNB+6zWxAcfRMGPc8M6DnAAlsPZ0FHRXI
	HGtIJh5zVk9zlsP9Tli2qLP6wp7JHLgZAzL9WKxgBGLBUAbiYvTXK5Bj92D96+SgaHwx8rjhYUgVG
	WP7MeF7X64sT9o4a7ZF1tI1UiIYe3jHM14fz7E9KAwFVUUB+Li1x/DVEFQxdwgtg12n/x+M8OwV7T
	Q0kx0O1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHkx-0000000GAxo-0DIO;
	Wed, 14 May 2025 19:27:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHcx-0000000G9V9-2rVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so1720415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250330; x=1747855130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPNeg7LLw+wPjDBNhjdS5KhhZROy/LV2IQ+NsavxOkc=;
        b=cBdeTKW6lWiuQ4rDg5DIqxu901aMqIVzae79cqJvQd+U6s4VdF1hRKdX4N4Fc72sNt
         3aCPiRqqqT2l75W59s9tkobBspg8MYjf+0ilbFKgwlq2Kl+c5qlE5C1PF4vNToQh7gdG
         eR17/+neMDCSeMHAnONZ48JDPWyMND1R/DV1R0Okz5T4iWd9yyML7WYIneu0yr1mmwju
         wHcO5dGwDbXb4+4P/yb7S1BuYZIikKC7xqnt9G/fQZrXGwpcqdejQC1+t5rMV47IVsq5
         nqwMIBZR1V1HcveMiksoH/jsDcF1R5Q9kHUoQCqH7EI4mrEm9HazAkRTLSqwXC/dCkqN
         hHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250330; x=1747855130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPNeg7LLw+wPjDBNhjdS5KhhZROy/LV2IQ+NsavxOkc=;
        b=Vmp1HJ9DjML4mIQHKarxtfkrwZEOMa3hrknaHGPDKJUPpc9MVOa1Tat1PN0TFb5G+G
         mcdcatxFa0MmNwOcXh57yl8T9Ot+vy77VWY72kUIvBUoc4W9Jw6/4yWrgSnqdg6v3GSZ
         FsarTOefB2ly4HimqCQQjoWHIHJ4ZiTJS/JBfndri2W2XXdtNJDF5zXON0HdxzCiI2AC
         mjf6f6ztSY1fuNMXYMIBuhwWFQzZg3oazAqisqBqbYlV+nrPwbF0fqJMKoWk1VphTlgT
         S8XdphXxepMWE+ebQOdHgA1vuDCNm+DkGbHfYyMuaz+KHasRVLgq/x31Vmftehv1EK9I
         XNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi+L9FIpCqZfZnrEwsjSZqAPOsiLJOCqGPxbP3lsZ9Wx4SR8Jh4/swmbYaCe2phiY67jn6uzG1r57oXixSC3dK@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRSBtQtaRqj5pzfVhmvGWmG9BJdO5WpTwyy5diMv1wvI+PAWD
	IV1IvdwcwQ85/MZOMYwGzsodPFXvYyMbOSFZCui2rEnXWbo5HFvp
X-Gm-Gg: ASbGncteChywbpnpxgBpAnWroirfU8fEQOEjUTUo3dBzNctHQwdXPGvh2KTuwbgxX/r
	AtQZqSjRpNw+uvVbycf7dXXT7tvOKx+J4qsyzL6vukud/Du3NiiGLC3f+8xr6oANnXh8rEs8Wy3
	xis1BDmwW+mNBTtZh11twZjjDn77LaAOQXC9Us4swlmUPDf2fSx3wiX/wuNx4NeGvzxpRfb0n5/
	JldrV83ElNqowhXPCXFG/a0zub8/zNS+DsSYDHkgraPLHxxHa0DI9P/TdJtt3cqOY4+4GWmdS/1
	aaPB6Jf6+1tv1nFOSAB3y+4By4aXocMx0ZrmMSOWYozd22UOhRT81ZsbNweBSN0mKJFGdCsElhl
	XQ8a0
X-Google-Smtp-Source: AGHT+IH0E2mXP8h4czOWxmxTLcdTr5dOwlDwwjHlT7wewaTCIuF6I9tuk+ZWHV0gFhyASv2QPYJl2Q==
X-Received: by 2002:a05:600c:b88:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-442f2168c5amr42844645e9.21.1747250329820;
        Wed, 14 May 2025 12:18:49 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:49 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:34 +0200
Subject: [PATCH v2 3/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_direction_output()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-3-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_121851_726647_881B8AE6 
X-CRM114-Status: GOOD (  12.78  )
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

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - swap with patch 2 from v1
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 79f9c08e5039c31acb170d4f38b516b1454fd9ea..8d93d36af63ab9496376219454214c05db30971f 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -432,9 +432,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	reg = OUTPUT_EN;
 	armada_37xx_update_reg(&reg, &en_offset);
 
-	regmap_update_bits(info->regmap, reg, mask, mask);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, mask);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)

-- 
2.49.0


