Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048FDC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w5xa3ncgd49kFJyT9bhO/chzYmHK3SV50+YzkQ82VU=; b=gz/uITP2y5495wwZpxUOf2tyF7
	whDTM2mai7Pgnpq5Om0jpWRi+yaSkLYPPN1vbKdS+rWD7WWGKCipRKVMMNcNqinlDlA+DBGzSxj0M
	U7OMQ7593nVjWW8phv2HFWEEt7WdPjP8+4YokS3xdwesK3S2xUlw4HHkbU9C9K+De72aPI5CptAtj
	sJuv4woq2qJQhCHicO4wkNql4CMc2jRL92uIW0Z/9ywW6dJcbqtjHT8qxDhKv8Ws+RyZgeLWjlyEl
	eKYoximBXhPWSswKuWiDIVX6WoULJwMm9SUvvC9m5qIYK0PlCUKbgNIc9Fi++YEwNSEBe470ZC4IJ
	u5ISbmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHmw-0000000GB6U-39c6;
	Wed, 14 May 2025 19:29:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHcy-0000000G9VI-3C8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso94966f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250331; x=1747855131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/w5xa3ncgd49kFJyT9bhO/chzYmHK3SV50+YzkQ82VU=;
        b=a1O5+vCHYxd+teIxNzwdh178hULF9Zui5JNzy2qdQveAkb9SwTX3Mo6a8sXDdC8r2t
         Kke0wzQNm5C+fMf08qjQ3+WQpAt4lE4OG3g1ByxtdOY1vv9i1/Puf2ff5UIMg6wfllYk
         jHkjQao8UWXqIca0xHGA9HFZJU4Dp4KjDkL5zuEGtZ854gLsUAaMc/+4Rjtgby9l6QIf
         egKe5dnOoKipjIwE2x61gKA77AZ7t0ybbcop+LUnPDhofLIHFv+SK+PC+O4yghne/bX1
         fymoN78H8r6E1Fq8ddthGQfdlAhSQaAuIleMIRChthAOxFnePXFPwSntBplnvzxZAIS/
         uazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250331; x=1747855131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w5xa3ncgd49kFJyT9bhO/chzYmHK3SV50+YzkQ82VU=;
        b=BMM/uD4Nm9UokQVrT3ZpCKg6C2+zGcVodeUDPhDA5U6KjsWi7K7t1NcRVTsdmvw/pW
         jQPhT3W6E1JmbEdvCvFO22dNzTWu2hNv50SlXk4O1i742lGWOlxYu4MM6aOpNJSvp1Sd
         njbBSLt43Ub15Tzbyi+rlMOLi1ooF19A+bltOJkg8CAasfJJNI0+Wt5P/WuLEUE81kZ7
         g5FggHro/d0WfX10kQfvVVw2TTzwHL1H0U7eJ1znWM206Ze2HbWvJxl+ohh4z8nQel/9
         GsmmKldCPZu8LFLaMDuYJpesPFuEI/tB5grkcqsg6LplAlRU13Q04zjPnxwf/6twDzfx
         jtQg==
X-Forwarded-Encrypted: i=1; AJvYcCXn0/2fA0jrDA4+5icLSdeptYclaqe4QKyDyAOybvB2nmP4UNMxJHlibI3HLzu5EJr7zD6WtxcAqi6rN0Z8ZK+7@lists.infradead.org
X-Gm-Message-State: AOJu0YxEkcTLkFv45r7UGIFHo53BLuo6b2VjV9f92mbcjD95rPbHAqeL
	wF9xGCVSlyAoMP5bkKE0SvFNiIkdtSkawHkpC8KcUfUIoufIgRia
X-Gm-Gg: ASbGncvl6xXml6VjeM0lIGgGf6GjWYVgT9gQZ5PVZX+/DtNcNzrhsS+jTWSWwlbRXLr
	IKe17LcGt/GsvQe+F8/F+UhEyQiiNiNirUAaKkSLDG5SIVXEe5qTbLhTxX6sfvPRHvXU3ltKFHJ
	yoyEM+rsprNu0aTmzbIHpdXKGOqZRZurKd7XjOU/2L1vJ56UGTdbMFvEDExZ4nvJd/XHgK6F4dD
	XVqKpRZcRZ2fVSdc+J2h9XA1k29R4RUNT+KaeouBRzA4Jldc7V8PVkoBJFp9YvFol15odKr5Fip
	N5fLwmABvb4iTCRhpUlLG1d4l9Es1mzdy9RNl1wWOXJhQgZg2EzARpteUM3kWXk4Afh4eT6udFm
	rU0q3
X-Google-Smtp-Source: AGHT+IEgJuTYC7ocCZO4XzaB8x9Uw4o8jNbva79UgC8DZ96g+uMc/4dsrtA/ArSqnVslHqk6qc2TAg==
X-Received: by 2002:a05:6000:4382:b0:39e:f9e8:d07d with SMTP id ffacd0b85a97d-3a3496a497emr4133973f8f.20.1747250331033;
        Wed, 14 May 2025 12:18:51 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:50 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:35 +0200
Subject: [PATCH v2 4/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-4-07e9ac1ab737@gmail.com>
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
X-CRM114-CacheID: sfid-20250514_121852_805399_08848A07 
X-CRM114-Status: GOOD (  14.87  )
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


