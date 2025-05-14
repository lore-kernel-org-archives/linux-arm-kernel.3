Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E943C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JH55QdZJtAaACW1NAFT3cE1dsxbphEYIr1BTgO2aG4=; b=4jZT+6LCqhCK3g6XbRlY9YVSi5
	Hx/f+7X7V6o+KfP7F7nVkBoh+g3JBRioXmT1/MXSoKFLp3IiEwV2RySu09eebjDzvqD4Oy6J+TmqT
	AIedrXgC26G+SweddYdwWuEQLeQIWsbg7pHBigGmW1fba6Qez+3lYtWBHwcE3CAfZeu7XkP6BXX85
	lzF0d7gpxdB4SsoxeIuGKiD1q8PRcnfTSlYXEOVh5l42WmdJKVJ1GazYIdYFgLm8EzG/K276oO/1J
	R+Sb+w1z82OZKJtXZfJyAh5EhChAzK7z2loKSDW3NTsfFza+Ke7mowLNKrg8tCWprTKGW2lbq5BbJ
	5FX5WFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHqw-0000000GBQC-0oSh;
	Wed, 14 May 2025 19:33:18 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHd1-0000000G9Vw-0Xgu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so71299f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250334; x=1747855134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JH55QdZJtAaACW1NAFT3cE1dsxbphEYIr1BTgO2aG4=;
        b=TZy2VCx8GlUJI9WKU8bwMkhlhb5hEWgBvAEFOS3p4N2/HIxfHK59lmZDLvJkPw8DP8
         Joe3ECdWQBNYuSVPkRwJK2pTZqWjLcVR+q0qPeAe//8ZbZcL27Ln7Ua+/BsQiprOjJ6Q
         PIsP6IqVdIW8pApJ4Dwfw+V98HiaDiudvsxWkqs1iI4Pg3sxrXI3CfADpHHWs9RsoUvd
         +T8I/QhmmRX9wGDUQDWH74pBHMw0mTcgV+hQ0sbxpCoHNOGs9CV21xSNvtc0XBivPheK
         kjfBUwHyQuxifwoBi5F1nqv7ILiHXHkSzt0GZxcCMgvXH4SYnhXPPBwSSZCJTuF1KQYR
         7f4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250334; x=1747855134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JH55QdZJtAaACW1NAFT3cE1dsxbphEYIr1BTgO2aG4=;
        b=hPk8FydwuP770SAUnQ7ucOQW+8NYc+WRixJ82Zd8ZMikAoWXXGzt2TY0nu2p/Dq+Kw
         WGoUlP8nCgH+wFtokpanps6BUsTE0/wmu/CIGGUipeR3y5i5RMX7+Aj7RrrTAa148ZD+
         pEeXv1rU21xuMzLjfhdHTYSPgpu3kkhH/Bd8swym3pt7uHJPFlSrS7ZzGKOXoFDWTnUo
         NPpfVIyfosIfCI6dk8RkWQphnSBTQukBk1cwIWSkBmfxg01eOvk1TZhH8/4Aa5erigbJ
         iW5i8lAbMN0b+a9dxL71EMc4DhXKPtmte+ke44ZAeMBNdNL/yXlaW+N4cTuIqYBDaYfz
         babQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNfJ7/L6UNgoiXTwDzxW2/Nspoq6E7ogSR+qHTpbdI6a3oAiN6ZBdFrqZirN+AkblpSN3R8RRnEFQ7AuDJ0Ijq@lists.infradead.org
X-Gm-Message-State: AOJu0YzFlpfrABDo7mClSu8KfGb4G7emx1tKQedZTMUTxyCxtKz4tU6J
	f+SgvGVT2J7T7JVtXTtnd5DIIHq4T3CFLSTn4rCwr1QRPnoL5p2o
X-Gm-Gg: ASbGncv8GS8yCYMogUes2w4a5hQMeP+PFtRoKciNu2J0vUzEZpSwAf4W/049Qks8Acf
	vJajNdQnlUHOBy9D28mzqL2ukc2I/Bz7d1iQHdaokYjbzCk01goo99ykq4lynxlyseIAQR4Mp3d
	9qxCdl110KmgvUjNHBY6vLIFmKRVcudo+/PwD7am5I0fn/Q1GSKfLsQfELl0s2rWt9hVhd+9vg5
	xjiQaZrUcbXRMHaDINgl6E3VN1X4KO2iMTvKGXtnHCaXhhZHTbRlIEYFpZ06O5ORlZ6e5lsh4/i
	ma19FxUJi0/UgmPUP31X18YR53GvTvZSgbmY9cPbuBuXIdcKIQE9ptRVXR3INWf2HB8vSS3Hnts
	xyj9f
X-Google-Smtp-Source: AGHT+IHzNZaFCgyXoBk/vI3JWqPShaXSNalLho71Vx1hM7ORoJVxx3uDSV4erFJ5/o6LPZDyD2SVTA==
X-Received: by 2002:a05:6000:40dd:b0:39d:724f:a8f1 with SMTP id ffacd0b85a97d-3a34969487emr4027229f8f.10.1747250333647;
        Wed, 14 May 2025 12:18:53 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:53 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:37 +0200
Subject: [PATCH v2 6/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get_direction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-6-07e9ac1ab737@gmail.com>
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
X-CRM114-CacheID: sfid-20250514_121855_169345_1F650AD0 
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

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
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


