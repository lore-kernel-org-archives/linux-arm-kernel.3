Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195D5C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=; b=bgRDcQFS2HWNxoPCfr5+kdWVRO
	PIZFtqYJIKVyFbEslYaxhjokxa31MJB1d+vBNRlmzJ3usIXdzJBH7WX/Lw06reE9fi72Mqzo63ZgB
	Mvo7XVYZrEFbbqZn82vliu+o/u1xuiYVM0hDJPR8GZgh5ypE+2LH2QIGQSuci5GcQIG88OC07zANw
	AFkmUnzR2+is0SY71DEQS4QFSvN5u+mr6B0nStrNuPnwa4Ue822TC+nJGPlPl4cNmSV80JF5Hx8l4
	luti63B6i1zIDq8MXF9wiVOdmAjWz4BMtJRUQTRbxujSg0sNAZW9Nlit9am2acZR/wMeXPBYqZbbA
	qNN69cPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX2Y-00000005r8R-0EPc;
	Tue, 04 Mar 2025 18:30:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi2-00000005Y8b-1JrQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-390e3b3d3bcso6933930f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107932; x=1741712732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=hC8DY/E0iJrbQ6B5sTX1MfLAaFia3ogm1eHufZbXq18YcJ9qsGdMLGPvP4CEqmkqXY
         rKme/EqkXuJhx7Cv4yx/2/Cn7a+JiJIPULm+7LpRXf5eipc2lmMvE+uTdVNiNj80RsSJ
         I2z44wv2KvYsDfSB3MPdpIySbPi90bmTkLlQnCMUCrnnmh0KHVbqB/l+KAmcsf8ZsF04
         IDWm4umDTBORk6jDIA44SsSdFIoY10YFpcpXiOnJMXAesJ3yJsyd35kcX3tfPjTisyt4
         zP4YCqJy042ThfWYAoMrRkZK/Co4vXGfKjPgfN3QQKuS6aruBTCq7vCn/Szjz/Xt0E0x
         EKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107932; x=1741712732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=vKT2vJQW2l1IyATF7uGof8f2VCi5y8htXAKnPO4Y9zEx8aOeZt9f/3mmuZ9r+53STm
         ERDvVUWLQ++UP3cJpL98RYM1JcjOJm2x8uCWP8Ul78YZsoH0GH11o8NN0bO8gXp2ff2W
         NBRfUBlei2cG+am8QAeiG+0naQ0Hy/79vD9jwj31Kjtrd2BtziDr8rH8Bu47EYrGK5KA
         rSHJJpLC4JIcBPng0we5Yb0+PDSIL4K4UApkmto+sfqAryhb+jjO2nvgsSNLnNx2IwB+
         7MW3Kjp+WIxrTIHxwHnVFuOgPp+twfQVQ3OrfSjfAY90BYTZnsq31thw+wr/7Uiv+LxW
         vZdw==
X-Forwarded-Encrypted: i=1; AJvYcCVkH+TElnHjzQ17aKDz9NbTG2UafwySYcZUYDL7jjd3z8xjvyjxXrlRPPj/HkUurRM2bzvDA8X8L9fRunKNPRA4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw3jmaagz8ClPEdYBrdeoEPk69QvnaukGSWG8cojOGICTykUiR
	Y5RuvbKmCHdp/KaKx2xaobcCDzHfJYn2zL2jAbo4sbrWky4aj+qcB02WB7TvaS0=
X-Gm-Gg: ASbGnctBTwxWbVXS2BHtlT2R6Z4DIiGWJhLJndUjNBpU+M/O8wB7q/P0mhc7gzjsiHp
	w7TuoqYsjoxbsvF2jNgYnOPbRyTF33uI21mpmhXHNKl1B80MUzUxNO8Xx3TzYCYvLdnQfGLEdF8
	cGKn2m4e7c3HaqkVO0+u9KuKVqHau7apnpZp/9Zfj9vvEJKZ+/xXCZrHE/1QxDkkisXYiU28E5e
	SSqQKpVQs7xI9ys9dB5gwy2ppSoU3tA+PXj9lyokmhGQD7w2B7wLEYYxhg9ZVqlA+Qs282JgX7a
	U3CLOP2oYTZwbiVupoYRZc7/GuDcbkmPrf2aiTuxRrQeuxz1BNyBDLaQVDlRw62Y2sSzjVsYf9b
	nwuilGf+kK64AOIJ6j07K+6101nvU
X-Google-Smtp-Source: AGHT+IHSc8pjwattEBJyeHF3OjOkT41+G9Y/Rh1pozPSubIjG3eC8i5kYIqu87xMZCHZm4ULB7j+yA==
X-Received: by 2002:a05:6000:1faf:b0:391:888:f534 with SMTP id ffacd0b85a97d-3910888f656mr7939190f8f.20.1741107931986;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:29 +0000
Subject: [PATCH v2 01/16] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-1-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090534_359716_4DA9CE28 
X-CRM114-Status: GOOD (  15.05  )
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

When this driver was converted to using the devres managed i2c device
in commit 59a7f24fceb3 ("rtc: max77686: convert to
devm_i2c_new_dummy_device()"), struct max77686_rtc_info::rtc became
essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7bb044d2ac25aeaaf2404b47b7e7bd485ae3d39e..6b0d02b44c8097453f704cbec9f02580fb869ca3 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -85,7 +85,6 @@ struct max77686_rtc_driver_data {
 
 struct max77686_rtc_info {
 	struct device		*dev;
-	struct i2c_client	*rtc;
 	struct rtc_device	*rtc_dev;
 	struct mutex		lock;
 
@@ -691,6 +690,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
 	struct i2c_client *parent_i2c = to_i2c_client(parent);
+	struct i2c_client *client;
 	int ret;
 
 	if (info->drv_data->rtc_irq_from_platform) {
@@ -714,14 +714,14 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	info->rtc = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					      info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(info->rtc)) {
+	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
+					   info->drv_data->rtc_i2c_addr);
+	if (IS_ERR(client)) {
 		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(info->rtc);
+		return PTR_ERR(client);
 	}
 
-	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
+	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);

-- 
2.48.1.711.g2feabab25a-goog


