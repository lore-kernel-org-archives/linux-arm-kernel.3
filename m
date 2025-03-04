Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=; b=Y/JOHP/DPQXIY4dH1NoOg4z+ba
	rrqhFSiJ8jpREDKYH5Y9b+rVnD6Fu1KsoxmJ5plwn8VomEqL8KMJ0m7xCnowHWK6yRE+X8C1GOaMC
	8I2Gix/yh1aEFAnHOvH90Z+Qu/wiPfJf0ervKN9/rYVzLwZJHrvWdtaqBlSVdCVYFpuG99BsaElwb
	/r0ExlvI7SsTaDEmsT3kYAn5uRRtrIuyNqZ2B9t2IdAnRv7LMhxJogW6BKPI4ctwUmbKC1rhsYVB0
	nN2bGHOtwd6foPPSzSiso0+NYhSpCvIJyWmRvR5jtkMzZeKQqJ6RDZRU8GutCgD8EeMk7OmUbO6G4
	pd5NMFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXAI-00000005scC-1LEq;
	Tue, 04 Mar 2025 18:38:50 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi9-00000005YDQ-2ecI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf5358984bso537639466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107940; x=1741712740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=n6wbLd0c8dLsKU2yPCDre0PPGnFUIbj5o/OMuFvBxxQIbQpP5dAlqCKmUoJFatmEul
         /7L1zj7Kyn9bs+YtgN9usgaVfaBlAua495QOE8ZZjWe999FOfJKC4Blma65r7cEbGUGV
         7YW36FUt3S5cK2wZrMtilVDmmlT+XdTBlEdGBxmv7eOuEvqfiAeGhnol7nGO5QQ5vs96
         6ZfaJZJrXn9ZAL0VsOHLoQjCdGRPOzqErqI8WWrcczagkdXciCxB+qR5hwKcqAv8Qr+s
         DLNsmACwmdlfNC/6y6CrAaD65eSvInAabFJBxjD4ZYE1Ot+eQSYMaN7pzOUJAYysBkjK
         fXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107940; x=1741712740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=i5+zm6LidfNUjkcbzymmyQlJTx8XWVdx7ruDHSaPErCDZ2yEX618pbbyrKI/Rz4V4q
         LmEqaz073LXfB3SF0n/jk13nQP4sis3cYyJSJYbJFhzujekVFES0z1CdQ9l2MV3gJPYj
         GY55Arskqzun17Tvro8xSV2JoKqf/PEWoTkh4epD2tBIOEIqQgek4V/VecBvfnmASbGg
         85EHTqFpt30+4wGxYmekj9ucZwTNXQZn25BWt/n9ym71anbzj7STOVBQNrDbPQYhwrUw
         utEON4aW4yNXBNkTSQyPxagrUyWr0EWlEfImF47jVqn7N/jdQ2ByVoWUB8ah4v+K8InM
         1j8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5w5jUke8c2WQTia9M0Qg2qCi/zcAAF7wtfgXe8SP/juvI0XazkBalhmxqgVG5psjGywrh/3OYVn3nI+drVub+@lists.infradead.org
X-Gm-Message-State: AOJu0YzQYd+TPs/XhCBgrQ0nKR1wgFNT7OgiarDvknrNdtOZ/qSztWat
	10fIvnAczN1TK/USwp+40cVJjWwKxLweksFjewKMIl8bUv4MSN+vp6D67c36VpU=
X-Gm-Gg: ASbGnctApH+WiiqKdy0nAwXWcKxz+WD89+K0VFrJ5VXKrQQKdCd7IHNWxuIxgrca13s
	13FjLlBC+R0J0ewfcERfQgBFaBSwhKVGw/e55si5zG0uI2mn14lPA4ZwUih4MqUSg+XJlE5829m
	yiLKSTMpxMpWNN97KMm2vr67xF1ayAT1qN2JrLMBqovOcZz1nfwsNXj1CDTrJhv7VKuOiEtWgHx
	QobkHOQY3mScLx/wqLdXQZW3i97ESvO1sUEZq8rCpOqbbdT5f8It3+5CW1q3ZS7yup3gn5N1uLQ
	/ykw7KuxN+pRTv3NLzn3VY3sM2XyBPaYE6nhkwBvu0D9Di8OZfA4nEH7HUl+4d6hveQsYaNhqmL
	HCgsOMiNCmBGwzHU2aqzNHu0PrhOS
X-Google-Smtp-Source: AGHT+IFl6TTi8U8Sph/F6W/xnjfer4H7R9+DXzK4OCCEVcy7pkMVR63rOrht0Su/bmOb+eKFGQTbhQ==
X-Received: by 2002:a17:907:1c8b:b0:abf:38a:6498 with SMTP id a640c23a62f3a-ac20db16fb1mr2300366b.55.1741107940186;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:41 +0000
Subject: [PATCH v2 13/16] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-13-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090541_699865_E46160C4 
X-CRM114-Status: GOOD (  15.13  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Tested-by: Tóth János <gomba007@gmail.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd2405al.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
index d2568c3e387659dfea598cd2ef6bddc5c076cbb9..00c3033e8079b5f10aaabcc7a1d3f19771263a02 100644
--- a/drivers/rtc/rtc-sd2405al.c
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -42,7 +42,6 @@
 
 struct sd2405al {
 	struct device		*dev;
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static const struct regmap_config sd2405al_regmap_conf = {
 static int sd2405al_probe(struct i2c_client *client)
 {
 	struct sd2405al *sd2405al;
+	struct rtc_device *rtc;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -182,17 +182,17 @@ static int sd2405al_probe(struct i2c_client *client)
 	if (IS_ERR(sd2405al->regmap))
 		return PTR_ERR(sd2405al->regmap);
 
-	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd2405al->rtc))
-		return PTR_ERR(sd2405al->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd2405al->rtc->ops = &sd2405al_rtc_ops;
-	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd2405al_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	dev_set_drvdata(&client->dev, sd2405al);
 
-	ret = devm_rtc_register_device(sd2405al->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret < 0)
 		return ret;
 

-- 
2.48.1.711.g2feabab25a-goog


