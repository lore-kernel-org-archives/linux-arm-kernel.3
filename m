Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A13C282DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=; b=Fp9DSNrLDs0RzjERffIUKWnLuY
	oOWm03pRriY0GsuXUXN+H4KQ0GKZl7DynONvfmy3KY8Be57gGkJp0+0OZ8sKcxepU40kAxjhTPXiq
	ZjhpijTCfl++nzqIm5kkRDdz/6GUlpRnlOVZTje1nQjkGKqcy+gjxHKPSxL8QG1p6/YpB7sNv5/12
	1KPet25U7QDj+7/2v5sod5p0KkQ7fwD7FlxUsO2AiJ2wiQyQViypbL1A3HJopF/rlpx2ft2DOo/G9
	LOtTi7X63jAmELUjWniq0gqjb9g7vlAERTApQq1bM2jAeBWUckqD8U9iumRfi7Iqua6+o6VJCdFhb
	horElySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYC6-000000064mo-070R;
	Tue, 04 Mar 2025 19:44:46 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViB-00000005YEr-3KjA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:45 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390ec449556so4764855f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=LU1OU3IkdWNWsUt/aewhUUtEn25SNdRZ7BOkoZwYtNsRO5HvLPGDu53YbqBeBoGAIy
         s7zOskvE1NFqsk6mLZsBeFW/OK+2B8AMN50c2ITZH1UxsWAdZRLnA8B1rElC3jETrswO
         rFdIhDOhNKMoAKhdS4rKAbC0Ft4gUMjRX9+CXzEyDCdlomCH1Oa6MvX0qHq0xxZ/92W/
         RXdqio9G/wDbo3GHnsFabNQXLBIDODdX8vpE4vdvvEOjJn/E0P/AuGfKswljqz3GXGRi
         AeBtaSoZ7qxgLQTcAW+LtkPmX0TgTLcTjCYkLqc1jLpIYzwauiABuAZd3A9TbKyo+p9a
         ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=uoxUrL5uNEPb1UIzG//87uGo39o0NW8sWIIQcot3CMB1xFq8gHUt2uWdrv+rmNGAR8
         6os8Qlvq8G8JWjq/DkByHWFO/YzS12+6erhED05F8h/UsnEtoBjRYH7BndbpxPa5DCqr
         ykYPug5dLNJOlJBT7REHfn0wRj3H0MKuJL1I+9tiVCmdZRuCftBZYFbMCtf6hYzFXxVP
         M4YziFzK+39OF+i7aA13xXFlTuqdAA2svtxVYjihBkQa4WmTSF5E6fm4q5OXLXT8y6oA
         yY3BJzwvwrrbRGts0F4Xm8HDVvGOimQx7zAOo4ngm1mDhd4MUv7A1wPZwOc4P0FG3/nX
         8grg==
X-Forwarded-Encrypted: i=1; AJvYcCVl5OfaQkh+GSUsOVe6OFAyFJbj33teOddqMs9c/6Kd78lj7UWlViGfrB0G42HZaezqKpihA40YyM0j2MAWE0zk@lists.infradead.org
X-Gm-Message-State: AOJu0YxcNqKR19LjoXNbcnLkCxJbk62S93fMDkmVgoMWD5AW2s6AgkpO
	Ri5nBY7BiI/in0aJYYDQJyDv8fJfoBMU4/CeeWtYQwq1Ps2MkU94tIM09Chu+Q8=
X-Gm-Gg: ASbGncuZeGv0xBs9Cqa1m5Di+9SAbCxx2TXSiprkSsmvYPAvuwk/3ZiCBF7OJNtV01g
	ITVVPiGZMgToUkzaxuFPEFMQmKmgkuQ3x4jElqjM/KGtSYmcEl3hqdjUhaQ2Tn8/kNCNs+boTJF
	t3fJnDcJSSq+jAZ3XM5bcq03joBxM2Fzn3wPec+tXsXr9o/LbgCLRbAXSAuJijPkbFQnBIcQtVC
	lzforM+QjIEopeAFsmwarFMvooc+e+SJ6lrGVI9thMT8M2jPDSv/UYH3R7m7Wheq780JkkmVsNL
	ipAhxc0teTjWOcjgZdrLX8VxpRpg+oqvEjjUtFIpKJ4BYfR8nI9XATliI/d3AIXnRfbjYsVTRHP
	8cA+73eijd+4TAKIZ8YW0enJ1xRw6
X-Google-Smtp-Source: AGHT+IFBi6JjsYJDnSEwMCPY80NtpnY/0pWo317IbLvcMp22I1j/lVgkodnN+FQ/p9Zn6V6GISOI9g==
X-Received: by 2002:a05:6000:178c:b0:390:debd:70c3 with SMTP id ffacd0b85a97d-390eca25fbdmr19248281f8f.54.1741107941433;
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:43 +0000
Subject: [PATCH v2 15/16] rtc: max77686: use dev_err_probe() where
 appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-15-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090543_837033_0C9AD46E 
X-CRM114-Status: GOOD (  13.50  )
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 6b0d02b44c8097453f704cbec9f02580fb869ca3..69ea3ce75b5a5426d4a56b979773be71c4ee7562 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -704,10 +704,9 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->regmap = dev_get_regmap(parent, NULL);
-	if (!info->regmap) {
-		dev_err(info->dev, "Failed to get rtc regmap\n");
-		return -ENODEV;
-	}
+	if (!info->regmap)
+		return dev_err_probe(info->dev, -ENODEV,
+				     "Failed to get rtc regmap\n");
 
 	if (info->drv_data->rtc_i2c_addr == MAX77686_INVALID_I2C_ADDR) {
 		info->rtc_regmap = info->regmap;
@@ -716,28 +715,24 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
 					   info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(client)) {
-		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(client);
-	}
+	if (IS_ERR(client))
+		return dev_err_probe(info->dev, PTR_ERR(client),
+				     "Failed to allocate I2C device for RTC\n");
 
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
-	if (IS_ERR(info->rtc_regmap)) {
-		ret = PTR_ERR(info->rtc_regmap);
-		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(info->rtc_regmap))
+		return dev_err_probe(info->dev, PTR_ERR(info->rtc_regmap),
+				     "Failed to allocate RTC regmap\n");
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
 				  IRQF_ONESHOT | IRQF_SHARED,
 				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
-	if (ret < 0) {
-		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "Failed to add RTC irq chip\n");
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog


