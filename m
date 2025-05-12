Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F69AC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5MMTe/1pPBKil8h8G6mXnsqfuKZKWfjys0Hze7M4Ac=; b=ke8Bf0VbZm2eGz0/HwrVmeAQwr
	QhTK8BhLsD6C3FdBV6dZ4pExt2hNmLblpSLKoHqU5jVVvuKG8QMkKxJSo0P4zS6ZXpjrhP0E8sP2T
	a9OzeRWux04+GWUwEaQ1vuOuNS2JxAKAdm3nDMZNGgEC+Kp7P6Fs6ImWTX1TB07lN6tMojPQraE+Y
	a+tvJ4LzVenf6z0TMBCNBzbyNaPBBZDp5eEYqRWkKVTpZfFOMbfxp1HM7spFjWVIALnnq7PEnbD4j
	lhH5n3rvciZHwLtaQ+yheYGtdbxbE8898EClbIK0IYB1ywR6oUjbbYZXjePSbDtRGjBTWCfviP0Kg
	K5geEWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUMv-00000009lgu-1zLi;
	Mon, 12 May 2025 14:43:01 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3f-00000009hnU-2bxx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:08 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad2414a412dso285922366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059786; x=1747664586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5MMTe/1pPBKil8h8G6mXnsqfuKZKWfjys0Hze7M4Ac=;
        b=O8bA2dWGVeOYZLs+z5Vipwo/xdEeWnr+PdySUMRgSuBbF+Fotks0Xwfou6IJEl5p1H
         t3wAAQUrP3fvpOd4PqdM7Hcr8i1MqGmJZ4hIlz+tu26E8mSpcnzLMqJSnLWCZrszevIL
         vi6WSSES65uehsdSKtHTx4dtnULmEkgNCNT5qjsq0hduBNTgpPZjoA6onSW590UMO9Qf
         OBK+JwgDPdQeac+KkEl38hrXzdgI4rktUyCVC4eQai+aL8M+g1XK8WgMx4frIzgZqC00
         LBqGE52oqHrjxnr02jWC6xRYqt1cOZCxC/UIpS/SPpYtpQqncu0/NPUeqqHLy4L0Q3kj
         Z35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059786; x=1747664586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5MMTe/1pPBKil8h8G6mXnsqfuKZKWfjys0Hze7M4Ac=;
        b=EuZE4ZoaGc8tqqkWRDiyexgoISU6mHp3KJBrCEF335Nlmn2qbQgd4IImrsJWXXt2IP
         o0+r/NSFwtnumbQ+A4KuhsvjqVandgW5Los9yx6Vo52b0PzXQGeTkVvB2NlwAn56FQIM
         QTPXyvY2hAh97g2zCxzfn3JzNzv0+laY4y6i6a8tSu+qEmsVsTmUhUPNk0+1sHi07+SN
         3R4j79FJAf+UrErleutsffEoWGmt4UwH+K6bT5zwZG/9d00PATDP7uLhc1NvL0KMVxgx
         tHaNyfmEzveUNd5xFC8OdWANhSlYLPf+LeT2hLwDz4B119LMMv397h+qNZWQBZOCAvsV
         cSBg==
X-Gm-Message-State: AOJu0YxkpynJ+7UvA7cYlhrsDYIizdSr8fNtKm+pF1sqJKurZTAZM9Fa
	eddB3BaXnQmaKu2XLBa5NZHSOn9H4efuWecZbrA9IVgGtX5BuoySXC72wA==
X-Gm-Gg: ASbGncuZu7nuhTmPYEPfAjiRtUyFivnJdOM6wIC9PHCm5seeDxS6n/3wboMBcZpkMmv
	cvSC/wMhr08Oe+s0929QhU61P6uPe2WBKrTW6iPZlRId9DfpqzFNyjoFOebXWC28JvGaR7nbliT
	ORI1WVe3gEn3mnZqo14QUaeI8kgLtipgI7YE3ehLppAfQaaolhCShemleNfRCaDBZwzFoKtTvcb
	D6bd0MRo1vAEdt0QnxCXtja8wykqOFUwhHg8aYp56ejxw5xO2iGL9B/De/PzAu/kEsv5NBBuziK
	/918ipBbD92G3T7d/dY2lQjA9RkDoRdbZ7/OGBzeKMgOM5SQy6EPnZfuyMiFtX3JcXzRYquyEIi
	B/zS5
X-Google-Smtp-Source: AGHT+IGg6yqgLrxnODYvbZrrlO4v+1zcDtFnVhd7UYNsTtLAVcdwUEoxhvw/4dDgWMUG+hMWyi7rDQ==
X-Received: by 2002:a17:906:1692:b0:ad2:1b0e:bfe5 with SMTP id a640c23a62f3a-ad21b0ec1bemr878356966b.7.1747059785804;
        Mon, 12 May 2025 07:23:05 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:05 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:38 +0200
Subject: [PATCH 2/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_direction_output()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-2-d470fb1116a5@gmail.com>
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
X-CRM114-CacheID: sfid-20250512_072307_667582_97B2702D 
X-CRM114-Status: GOOD (  12.36  )
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

Cc: stable@vger.kernel.org
Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 43034d29292687e875136aafa530b62479dc55ec..e0c8eebf40588a1b49b80e2a1ddcc2a35fa7c07b 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -433,9 +433,7 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	armada_37xx_update_reg(&reg, &val_offset);
 
 	val = value ? mask : 0;
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)

-- 
2.49.0


