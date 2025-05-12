Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69975C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNbP7UQ6QBCtzJmBLQElQ/Oiqog6oGM/rgRC50EdCKI=; b=20kaeyf32abwk4quEV/lrsEzyJ
	AxI6DXfTQ11nMLSgOpM0KbXptbdB0jdFKmhbej4GDFptzH5CKISBoVNieOdf5KfHOr1b7ieVQsLEt
	FelK34Fp2qO2txceittcWRmkK+roeFvksv9m3YRPKC5jN+bf/5jY7g/EyXT2KnG4TaCNRBT8ks5GO
	X9+vdqgJTjR2dkjis+6268krkGAR3BQWEZZSpOJMP8QCDeh5fVde2v/dFQJ/YK7qosuLAlTIZadpM
	A3JxzqnPK7dyNOzypgmDXstGARyuqY0gCtZNH+g0xQYW+xSdzEXAIt9JhhBizpRBwDhtKM/TW7AHc
	CSdYFtqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUP1-00000009m8C-0w6w;
	Mon, 12 May 2025 14:45:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3h-00000009ho1-1Lz4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:10 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad241baf856so344215266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059788; x=1747664588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNbP7UQ6QBCtzJmBLQElQ/Oiqog6oGM/rgRC50EdCKI=;
        b=LBxdlNtZXaQacxU/PKTLJ3sjCGKLTsE96b73/gM2e9Q3hIHAYByU5vfrtSwIKcXRmo
         GfwxVJJYvLFVQIeNEJIXB6hnsaGpZ6f46cuMqvQWSrHsD5tGQ+lqBJ1wU9EZ3pe4s3gN
         zJjnPo4HR3X6iIM6lgrbdyJ8ZpY6uwVZY3dYeyiBJh6902iqCMqoQ80ceODTNUnnI26n
         vlYjZ+nkv8PWy1PPs4mudeZXACoeEHkA2iSIHhVo1NMTJsYeIGU7MayC4SXsAX4BR6+S
         GdCzd+qcd4Go77u1RSOAF+8IXcJ8+RKkuL7bbPIwYDRvFKTUf7seRO9OPsnGkxtTcMY1
         C+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059788; x=1747664588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNbP7UQ6QBCtzJmBLQElQ/Oiqog6oGM/rgRC50EdCKI=;
        b=BSWRE1EYyc7bDf1M9Fv2ZLt4PoW5HC0fou9GZYsTpSx1/cOR2cCzoRBUYp9B8q7z8e
         TYFxFrC/6pMg61RYadM6cBvbQyhpiJfQ+4nsmDoC5jyfsHhQHSaeRlvJWXjIqkITX93c
         0xYAIkZCYfMLAetQgb4cSY3cv0ofE9V8NpcHqVuKJWSzGPXePwkE/NixF6/n6LMNhEN+
         K/wFp3sWHAO9biSUO5rhPgWFGwsiN++xXra1L7L768hjGOkO3UIoi31OzUeoqhnrg8Bo
         dj0jDNxFddN8SkcgzTeUALmtHZbuzt7KZwHIpWSu+HD+SwmrbDtouE6h5CygmhfOV1z/
         YD6Q==
X-Gm-Message-State: AOJu0YwKSl8OjBwBOeK7k48xPwXzR7gkVztyMx/bKVrL83g8vnka3aVV
	AsbvM//M1jYDspdbC+8qsCDYp+nbOitD7PLfp/15aiEI8DwrcQIqoc3NlA==
X-Gm-Gg: ASbGnctU4iwhzayousJD7BVwm0weGvMbq/qaM8YQXwD2w5ZPq6/RjMQ6mSYus+scEe9
	bIqwi28hXU7m+qSMID9Aj0wcCMIOUFoi9zTcX/SeZsQTK9WK9Ia0K4zsgyj6ac4ObbhSAbOIPWr
	Yuu1suUJLj+eVWPsL7aOA8Jw5uvM2cTXw55VOeCCJB71MqeKP+i8YHcjtzIvo7t8+rbKCNyF0Q2
	2ngMCIaL8jxEq+6PLpKQL9SubaUq0PymC5f8HxWnFtN/MwjQ1c4jWHnapEGbmY4Xn1uCbanC0o2
	x1zXVOURxzqmBLkiqJ0SmvBdc2EIAGwTTDc1tsxca6AQvUnxrkD2sva51QovOHWLt91v5c+DPXc
	nRuvh0h9mfh2VsHY=
X-Google-Smtp-Source: AGHT+IEAuWJVxQMEM1VpSI0jRTrCZ9DF6TOGQv6I7s6vfSy+SBEpvant7r1anHxZTeAjxxIQEyYQ9A==
X-Received: by 2002:a17:907:a089:b0:ad2:27e6:7e62 with SMTP id a640c23a62f3a-ad227e6801cmr917487466b.27.1747059787151;
        Mon, 12 May 2025 07:23:07 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:06 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:39 +0200
Subject: [PATCH 3/7] pinctrl: armada-37xx: set GPIO output value before
 setting direction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-3-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072309_368006_B82C568A 
X-CRM114-Status: GOOD (  14.79  )
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

Changing the direction before updating the output value in the
OUTPUT_VAL register may result in a glitch on the output line
if the previous value in the OUTPUT_VAL register is different
from the one we want to set.

In order to avoid that, update the output value before changing
the direction.

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index e0c8eebf40588a1b49b80e2a1ddcc2a35fa7c07b..8d93d36af63ab9496376219454214c05db30971f 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -417,23 +417,22 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 					     unsigned int offset, int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
-	unsigned int val_offset = offset;
-	unsigned int reg = OUTPUT_EN;
+	unsigned int en_offset = offset;
+	unsigned int reg = OUTPUT_VAL;
 	unsigned int mask, val, ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
+	val = value ? mask : 0;
 
-	ret = regmap_update_bits(info->regmap, reg, mask, mask);
-
+	ret = regmap_update_bits(info->regmap, reg, mask, val);
 	if (ret)
 		return ret;
 
-	reg = OUTPUT_VAL;
-	armada_37xx_update_reg(&reg, &val_offset);
+	reg = OUTPUT_EN;
+	armada_37xx_update_reg(&reg, &en_offset);
 
-	val = value ? mask : 0;
-	return regmap_update_bits(info->regmap, reg, mask, val);
+	return regmap_update_bits(info->regmap, reg, mask, mask);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)

-- 
2.49.0


