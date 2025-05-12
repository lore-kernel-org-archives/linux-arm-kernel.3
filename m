Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03871C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CStQ3me6L+6+JT5UQlE0AR5A7HHsIVocJn1DO4HPocA=; b=kMvrq40FXxL2cxPsy4NPXMhSPV
	Xyfv+pNBy7YGBLPz7bLaFwbUczxeuzJC05QLUym6hkYpnv+As4Fc1Zjt7jpGFGs+zM6X6ZdcsjFlT
	jMw/vCVgoh2vIs8VorvPxpTNkPwf6B7qcvz68tLBq4/IZ0aBAARrbyy7M6x+Zzyd5BHRHkdD1nWit
	palcHz4I4XIBOtU6luDg4yh7PfK/sE9ccfwF3hYCkJ0ubDCqOuj12A8kCxKeHIOts6PTBbY96Odci
	FO4bod7718jAqpnFw74aCKLMa3OEzxDF06bu1efqnqfXQjU4Eb3k0XVTjZV2+DP35UPFeng+Ndr++
	dCcXUqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUTD-00000009nIb-3WnR;
	Mon, 12 May 2025 14:49:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3l-00000009hou-0AJi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad216a5a59cso487665166b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059791; x=1747664591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CStQ3me6L+6+JT5UQlE0AR5A7HHsIVocJn1DO4HPocA=;
        b=d+6emIPsbWAyU7CyZku/IisMAxweuvgwXdmrUdti1teJV4Gxw2VU+xqtDKzIxNSXSr
         lgDuRKSmgRnkOoZ2l1bTzDLHVpxvTg/jLtLBaTyYzxcnfKLeUhd5550wczZ9lEPwqLju
         tSE8mZdeCa1Z+ZAG7Uou1LKj3N9bplV2z4Z1eDM5gg9zOsGhRcnToTJxGLFEErVA6F+I
         J7ZcLxqQAjHDLRYNvBPuevLDKWDXCNTSvlywVsS9PcwIL6X1/vvNCYFHVR7XgW4T3zw1
         lD8/93burfub2uWY1FBh1DfAUW71TcEcF5XyD9kMwvtvEjEJGGRUQNyIULgkxhmM1Mf9
         WbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059791; x=1747664591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CStQ3me6L+6+JT5UQlE0AR5A7HHsIVocJn1DO4HPocA=;
        b=bekzrRZOcIVE546FaZE2MqS2hPhaLUdYfR3iONvgSCxL1//9VqDrr6rR5+F5Cu0kXS
         Nt5TAi66fMdBVp+hOV3zw4iRqWYxe39ZaQorhx4I/6u9BwdzpHqVz/88toKp6mtC70FN
         LNj+aA1ObjTXgSFvME3/YYhvjhFCd9fH0E9niztPBvVfVUopaw+ONP3wZge9KU/vVzj6
         bnwca5Wdr/Mbqu3SJM8aNhi4n2nQtjUEu3vBO9SP5nYX33EXj4GnWYdmnlLrIyK27YHK
         u1eopvkf03TCEib7DtdtVbmvU4+xAfFUQ7tWy8Tg/BjMFb9Ug3xVz9j9OjetBFoxFwnN
         7TEQ==
X-Gm-Message-State: AOJu0YyAr2nQQE3uqfRixFUHLBRdhpaSDUVksMeM4hhB2GPx6wy+oZfz
	sCohRKe+zkc4LO/jeLjZyuOcamMpNamdexQfWJ2D5RkrLcTBvT9iYsQIrg==
X-Gm-Gg: ASbGncvVGNCp0QdrNe9iPUDXh+4wXVQW+4Fft1wVY7rK/bsMDtlvV9q7HALxdz61q3F
	8duqSvK2TiVN9f/BZkgKsUp5u72gLSxMTi3sgEihhBBi5DVZfV12YPDKRAab3CAW4cfn+pPq0LH
	1mXJJ6GMqLZDOFIgkztQwWL2ZClEzNLYgQia+E/WqLqmQnH5rE/J/+kf/ui/WO4pkqNxh1eGWFJ
	h4JtzJo6A6pmHXq3Ur03j9bX6XHlnncT8OzldTqmaHvMnwH3097W7i+tQ0Cz2sKhCvITgVh00c3
	IjVxjxYeFWd1jbSY9NHcY4SmB/8bJLII6+BWOw9bMwevV6pe8gHv9Qdr0dKTCyk5ekiBtXcR5Po
	ytz3w
X-Google-Smtp-Source: AGHT+IEJ8JuqYsFOPLuXdkL4qUNKbfTaZqb+fmyTLkZmdZyKkJWiwhPAs4Y4Rf4gMO6EJazhHRUlCA==
X-Received: by 2002:a17:907:1b1c:b0:aca:d6f0:af0c with SMTP id a640c23a62f3a-ad2192d4a49mr1292462066b.59.1747059791258;
        Mon, 12 May 2025 07:23:11 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:10 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:42 +0200
Subject: [PATCH 6/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get_direction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-6-d470fb1116a5@gmail.com>
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
X-CRM114-CacheID: sfid-20250512_072313_084062_C121A0FB 
X-CRM114-Status: GOOD (  14.22  )
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
index aed0069b085ced5867993e95e0244df7ccda556d..18c6c5026b26c294ee65e3deea02d2e852e10622 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -402,10 +402,13 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_EN;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	if (val & mask)
 		return GPIO_LINE_DIRECTION_OUT;

-- 
2.49.0


