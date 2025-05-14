Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556D4C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1VHW2HJExWmBNfaPof6yV4PNzfV43beUESvCPBIVuk=; b=1qdnjECdXtNqS0Rn5plsGHSlsm
	RpAmeL6aiOA2qBKHQ540Vomg/rQ8tHUoDtanSQyuERVlQYUOJVqew+yyEww+9+1McN0bJXvIhs8k5
	bkW0i0qm5ph8X0GoyYzvClGcAE/z4Y4Kn4LUffri/f6D3ojz5+tfFnOsVvWaAGZLLR2K5TdgR9btX
	aGXR2vEm7aMdC68CsWqvENP3TiPiXYsTazwwbkdsBFK7lxw//IrQSCXZovftuVIK4TVpbirdfkm5k
	Q19Np79DgHkiado7Vt0WWog1MVWQvY/Jr5kPsEqmYSbOA5WNNXZl915voXGRqzyKY1ax5o0YSVn3p
	reAEdBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHix-0000000GAiO-1DW0;
	Wed, 14 May 2025 19:25:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHcw-0000000G9Ul-1Yxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so1357475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250329; x=1747855129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1VHW2HJExWmBNfaPof6yV4PNzfV43beUESvCPBIVuk=;
        b=lWjZuBMiocyqUPd+b1JOkv3fEkK4USI9iSUneS0l93cUge+reKdtKTrqUf39xrMcOB
         RjzJbYpgwPswBt5Rzx/Q83r4o28+xpei7Uk6ePYFp6cL4nXqkDUG0vPtBTcU1S+bdrpk
         02GScT+dplP739mJ5IXcG0+lj5Lhj+ejEHN1enTYSauwQb/xxgG82SZLWJBX8ilV76qX
         oB+WYPtvxZtJdlr0LiA9EdYudnI6cbZt4aBZowgh9U7ln+XoIJ3jP12PNb5tiQP3dcMf
         sW8s/mw1+DDgSjv7tahpXNsbyaTzsluxsTQe4ZJ7HE6wwE4PM0ys84z08UiUGogvqL5N
         vYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250329; x=1747855129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1VHW2HJExWmBNfaPof6yV4PNzfV43beUESvCPBIVuk=;
        b=nsZ8pukqH8GCgQya/Gx1XatoNQqCmMw75ZNUkeV0ob6zYgTMp7YPyoRypwuXhWIxLL
         ClcX7WBtj4FZSmMy9mSe7FBbFGDrhoBMHB8gm8WTlmksPtlHbRoaytRFidlklsEfWfYU
         XXqX66x+01eN/EYfmeLtnwpW8bRYPuC2UPghQwYzzRSJ1esJzx2pe/oUdrCdY3aiIPaF
         ARSRSFxS/iA86jv9RIf/p/Kq4M2i/jJA2Y43pkED+syB76KUqvIPxIAJ63VWu3YrJOEV
         cZRrPQ785qD3Hv/nQTtF0f7U4XXf1gmLBaSnHPKa9ht+M5BnziQdjONnBq9eSZ7AfYuq
         wQQA==
X-Forwarded-Encrypted: i=1; AJvYcCX8b3qgeDwF1JUUHHU7oTq7pplb3UVQC7G4BwIS47vtSN4Hvb6CpkFTsfHt6L9hJARN9sNfAQD5EZ5lsjecb834@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5dz8z4Dn8IKz4P3g/ZS0jkJy3g4KFf0bEU+G3UVPQiUX0jKfl
	FdVAVtqnOodnZZLQvLAQOEe+8jE1ZMttLE2Q7L12Ib+zIKNkB4Ll
X-Gm-Gg: ASbGncsgovkXHMzHTkq4hKnfrtKIG6RTevEykb5O/sqzZ4JfRw7vlMBcfLbLLCVhuzq
	NOx2O3VkvKJsAX7rrcPQ1pWlnZ4+X3p4X8eFBZsqioYJpoOLbxbAUooyTqbtzjr9ZlaphSEccqk
	kJf5cc07QkcNs5c4Yy3vjPUz3k6DXqkVXno71raU6gQn95e+kwX60XKBcgFsyobMSULm+RahY6Y
	M0E2Bcnv743nQGWOOvpCxEeooZoTqiemOtjLRtsni5PIlShdI2mm/mmV4Ck2jjL2DL2j6Cz2SXf
	t2/bgAlRtrb3DigwJIbvBcqcDzyIb6djW11MlzMPJyNZjqQsRD/i7BNXBcUyHcN5Ekv2IRzglv7
	KDfoh
X-Google-Smtp-Source: AGHT+IFVv7oza45Q2QfziPl/5KRvPAxx5elH3SF3XZpjCrkHu0ZxgVl+w6k+ib6M2XHCdlmCCVtmpQ==
X-Received: by 2002:a05:600c:4686:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-442f20e9013mr43795755e9.13.1747250328632;
        Wed, 14 May 2025 12:18:48 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:47 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:33 +0200
Subject: [PATCH v2 2/7] pinctrl: armada-37xx: set GPIO output value before
 setting direction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-2-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_121850_415621_DDDB93A1 
X-CRM114-Status: GOOD (  15.77  )
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
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - swap with patch 3 from v1
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 43034d29292687e875136aafa530b62479dc55ec..79f9c08e5039c31acb170d4f38b516b1454fd9ea 100644
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
-	regmap_update_bits(info->regmap, reg, mask, val);
+	regmap_update_bits(info->regmap, reg, mask, mask);
 
 	return 0;
 }

-- 
2.49.0


