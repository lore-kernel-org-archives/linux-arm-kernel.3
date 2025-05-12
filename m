Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01092C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/guz4pLuDNTxVy8lJnDBDsZGEukuirfrZgqdNdAPX1o=; b=Inc3yxqVdMCL0WCaM44+nbU9RA
	NhrwyNjGbYUYBW2MkTMtBYu47ah++BUojNYzDk7XWqza6Tt3zQ2mqEEhA6ihZ5mtX+OrhvggezQcE
	dbWwZ1VhuvCtZZYL6D1RgJdelZWhTRxsprtK5v01ZOKXpWV6vVAPx1tyZRRE0y3iKxo0dGZX4TdUX
	S93XV/2kBRiHOwz7fUDi6RmLg3CEIUSmMEk63YyJ96tL9aQfSAvhnVDxI5WtsFTQWvmWuBy2K0jX6
	G6uqI/7DFE3VCFJ3eXN5ihx57Q9iRLN5T6AITF6AXcaO6QrvZO3ZUxyoLhkX9XoVCnuhIkhLMly/T
	1kKjYueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUR7-00000009mn4-0Hpa;
	Mon, 12 May 2025 14:47:21 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3i-00000009hoN-0bvM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad4ce8cc3c1so45583166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059789; x=1747664589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/guz4pLuDNTxVy8lJnDBDsZGEukuirfrZgqdNdAPX1o=;
        b=PrD0YmhP4W0UYHKNQxUkZ/yo/VVA+NXGVVVXo2C1Acr02xrA8lARvfY5iUNC8EJNBu
         hIxXlxh1NQcioNkPasG5yBeqhP5yZskeMjShuWTfa6dcbJGo/jtmJVBM4e9pdtFRgyc/
         YnthnbzKGjgVj5MIiikbNZ7aKrcjvdxqekL8VxnTQ1w+JUqoVXsrA2EhWkuc+I1XY/IG
         AcY0SC5cfas86/4kqSwDY/oQSAqjrt18SWFBR9MuYzDEr669cCukklC8CfJBLoT8gd/R
         ZQiMLL7dONcmYqBDBAQrdTv9vuQxVMHUfci/IK1v5HVCUWorXZHQ3kTXggXh0UozqZJZ
         GKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059789; x=1747664589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/guz4pLuDNTxVy8lJnDBDsZGEukuirfrZgqdNdAPX1o=;
        b=JgOvpO28qTS9IiGKP1w8L3P6vk0yxNhZKS5/DQQkeDAaiPSwhJ7mSAT4/u9qOfMm/K
         yWj2gqvo2+6awJZWQzzFKtKfOgVABZUQH4oC9ioFb0XOS7Rj4HTuwxGx8X7uFQ7o7FeY
         42WkeUuAsTanZ4FlvUuM44lLRAwLU4/yatYeyRnTIq++2ctmDp7mtFuqozv3y6KF7Ax6
         qfUJOmkZ3cbSmIW1TbAemTyoXeMn4jGeb4luqlxWfvAWV9FYl3h/acXqAm3mLLOTeIvs
         cN5U8212EGV+KyijvJqHPLlDrz6Fq1Os1sUBDSwl+/xBV3yt4cC3tirk8/FZE6RbH0LX
         5sUA==
X-Gm-Message-State: AOJu0YzauSsqy0e/8m0rG4Jp3cGWGh8iQQIfB+LqlDUhPAcBaQbvsNSa
	RpOAIpmgK965B13LqDV8FIbASnM4oVBDERJJ7Zd1qHIRAQvB+PObaTBAjQ==
X-Gm-Gg: ASbGncsopGuQGJg6e4l/3qP/V0YGekcRqukQhCfhkmbTv3bXXsfEDKduZxhlfYEsfUJ
	OWEHr2ope+Ig3Wu+Xja73vEn3Iv0ZoraBMq/kqYAUQq5ui35bmKwEaEtavltrdgzPF0Vp1JZmx/
	AyiCmoJjoe7Kc1Y/g+70TSF8ywPvLfQgQjXV8hlGA9+kgh3qiA87+NpUxhq76jjrLUiHy/L/C5t
	CZeUMyyln766hcwyxO6BTtbi3ra5hKlomtV4ZbP4eYaN5kZQbpJIbh8jHPLJquyVk3SKSp1wA6R
	6J/mSxpc5hycn03V9fI88vePUZVpcBUaAGld/BqUajMttrOHXlqWGAXMq35e0LprwezbfrAECc1
	M2kUe
X-Google-Smtp-Source: AGHT+IH+FO5w31tHr6oUFBIoGn7EGEzlO+Kpe05iZvKG+L2hkO2L/WD3SeYo/NmL/boWglxIzee18Q==
X-Received: by 2002:a17:906:d201:b0:ad2:1d1c:1c8e with SMTP id a640c23a62f3a-ad21d1c1f24mr934769966b.49.1747059788576;
        Mon, 12 May 2025 07:23:08 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:08 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:40 +0200
Subject: [PATCH 4/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-4-d470fb1116a5@gmail.com>
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
X-CRM114-CacheID: sfid-20250512_072310_201890_7F3E821C 
X-CRM114-Status: GOOD (  14.05  )
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

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Cc: stable@vger.kernel.org
Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 8d93d36af63ab9496376219454214c05db30971f..2e88a0399d1a205064b58890db6477e2202bf311 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -440,11 +440,14 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
 
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	return (val & mask) != 0;
 }

-- 
2.49.0


