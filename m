Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6888FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=; b=JwiETq3ucemoq/7WKS27MynBih
	75Onr3CM5bd9A2NJmQ+jgTMZErx+IGyIQGdxMsahdtgjyVrnylLHKWfmDDQFy3Yo55nK9QlAUUDQD
	g475NW2XWUi0F+DXd2s5jTb+MvHqJVrkZZZKEsa8A3uaaIuWWZlF2aUq/WVrbPzoiix0fYLMcwbqg
	02OJBRR7cIkxk8Qv6VKckivQGdyGyBK+8KbXmiJk+OrbL5jggqwRSqAQESQtkCEnil98qS1hPpeBz
	meMhGvg9iBfTP1UXfG/mVInhn5qRhLIELWql33Zc2RnurX/LfIUM6t+tk08rzJG9zauYx4SuTGaWB
	O7kCehqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to16H-0000000BCZV-0jkq;
	Fri, 28 Feb 2025 14:12:25 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11R-0000000BB3e-0fFh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:26 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so2923101a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=;
        b=cRR+sLzvYmRpnUm8TutgPqD8mFWYqWuH2uzh48t0dexjeT9733sszbXz/8Y0v99P60
         EILafaEk2Geen28LLpCTLlcV1vaZ4itBLoy8SH6Hd7VtOFdKKOXHpd4S/xQ/IOzTh/S8
         j9+P9hKUXVI69aJdlXjjBJpn+6NW5A/6PPDX8i1IxDwFl9kzXuoaU+7R5Wop44zgcKha
         ZVspKwFr0SXsQQO/qVdC7KkgPv+PE5yDi1zOf5qHs/rRrXhvMo4sEkN0ztRBaLpW9977
         43bXPqCOoG5cg4kMBgFum2/vg6TWSu44VShcYLdD5Q7U/taTUpWThtoz5oj5KWo9ReiE
         gdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=;
        b=o3NFwyhSfvrDCWMcpTEk44PKsUO0bdnlQdXEbeHi1/lJPGSqtsWtlDr6A0UL5kFszU
         jyovkodERIRyp5mTNd/Q4RFB0pkWpByWzvnPo29S5x+DDPfgqunxS78APGY5FNnZ+/Zi
         g6jqArzjihP+RMyqlvkui2Z2bT8I6WBvhqGdUpyRPbZY5IBXHJllWBrV3FjqQX7jP3U2
         fHwPArOVPygfm28DRT1btR/VaDpSTuW5/hVflMGQ07qgrrPwkDVVX+hSbSpDQRTtzQwA
         BLZY/J3wul3DxqibCybJe5txtb1IDGM0Ofepee+Kj2hWUNEDpMUdJuzy40h9nEQVXHz3
         MWnA==
X-Forwarded-Encrypted: i=1; AJvYcCUaKMz/S1u8NC5etnWLdXwd2fFFA55NOPpaw1OJ8y3xMyRkjfvSc11jhf86KCw3wPG3YJh7tKgbOjH999JypDIi@lists.infradead.org
X-Gm-Message-State: AOJu0YyFAodc9fFo/IlMnjnq25MxpRo6K9iy0Pyy+BViPcOHYy/i2fi6
	GMDRYDjLbbr9zZlQn9Cft53Ae1edpatuieYkrrfac1GAdIy4QQqqopPiPBEBc6g=
X-Gm-Gg: ASbGncvnqSS3tzHe3O10cHmPMOaoAHnhakVyVDoimaBzEI01sVHTMsvIMct/0ydg2c5
	g+Synu3VKeGy30bmwomoYITxVSwTzLsx3/YwZsj8Gga7TcS1CF3LLCb6v2Nwb9O/BiKeJhUWZG+
	fqZRW8QxNp+YQohL7hTeOUIgmZUqt+dQSG2mR1jPJgqdgIyoysPj2FMCgHudYszosGoNgoVaBG+
	RT1ndR/oZKw2v8BiD/yppnPnF9Mymj0tDoT3pQMGqBRDv8xmJuDSd7E7HstjnZBzbbQtkw4JPht
	dlE7+jHTbtQ4nTpSlnLeAqKK9bC8oWrWH0z5PUzDtaEVJaJ5X1LdtgRrKUP81Aq4bmG1nJndqtt
	0P+QT2mm3JQ==
X-Google-Smtp-Source: AGHT+IHzPJx5i3RI7O2yaVdHtPJ0az692A2jfkouiK94jhHcaAYqi/2J0zpg5aMdk74cXIZT8BcCug==
X-Received: by 2002:a05:6402:42cb:b0:5d9:a54:f8b4 with SMTP id 4fb4d7f45d1cf-5e4d6af0565mr2697422a12.11.1740751643440;
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:15 +0000
Subject: [PATCH 02/18] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-2-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
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
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060725_218100_054EBEF8 
X-CRM114-Status: GOOD (  14.80  )
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
in commit 7db7ad0817fe ("rtc: s5m: use devm_i2c_new_dummy_device()"),
struct s5m_rtc_info::i2c became essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 36acca5b2639e272dd9baed06ea5582f635702b0..77dd61c30681b8f0a2f23063ad5f7eb52f5b7158 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -146,7 +146,6 @@ static const struct s5m_rtc_reg_config s2mps15_rtc_regs = {
 
 struct s5m_rtc_info {
 	struct device *dev;
-	struct i2c_client *i2c;
 	struct sec_pmic_dev *s5m87xx;
 	struct regmap *regmap;
 	struct rtc_device *rtc_dev;
@@ -640,6 +639,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
 	struct s5m_rtc_info *info;
+	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
@@ -675,14 +675,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					      RTC_I2C_ADDR);
-	if (IS_ERR(info->i2c)) {
+	i2c = devm_i2c_new_dummy_device(&pdev->dev, i2c->adapter,
+					RTC_I2C_ADDR);
+	if (IS_ERR(i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(info->i2c);
+		return PTR_ERR(i2c);
 	}
 
-	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
+	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",

-- 
2.48.1.711.g2feabab25a-goog


