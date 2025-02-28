Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52494C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=; b=eMujRjjap0RefPmyojJeFb7cR2
	qBQ/dEPwxPFWIGDVGpfoDgANPNWy+iOiJ6NbilGWmUtOdqmxVHZvHfg62q1JDWFM2WfSbRhECPOa8
	QEWaCFtCyIKaulbvvTHmZg6s9NZwwwZDRFpy7EourdyVyRmXgBxYnzgFCHdQEDH3arEf7jGTeW785
	8JtP1DQANcnlONsuyCELitfuV8NBg2ZT7VgRYusdWrCwQ/uJtERjvwc22uPIG1otM1mdduww251zR
	3mms6SwR1RH/soh99VwI2fZvAwhvoGiM2V7X/P+6O8T+zGq8R9Wl0VB3MviB+wcWKJN4T3ZZ40v4j
	GgvnRWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to14j-0000000BCDl-1vY7;
	Fri, 28 Feb 2025 14:10:49 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Q-0000000BB3D-2UTQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:26 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so2706000a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=GNwV7WePBwGhEVUrY8wkOq3dzITnF6bXyqJEur34Z1CIW6s4R9vz3QrmoEhjsA04eg
         7kbBYDcHmMpkZ3JLtdArC03chuByeVy/vLIRGi7eZfpNV70nu6O3sdU6h5YDnemgokMK
         dT0q24KtC5t2eUsgOPzFWhSPAjNpkjhXEYvoT+g8bNDBoRzfm592WkRpnWNNAxVTPD2d
         D+5n/qz/PdRNzu6HlbjGIVW08hDsvXXfv2MHhEBVKhDMZSnlGGtlYYnydpY0jp41vELK
         eEvnZrF7mM8WY5uj2u8cSCmlVzD4DrV2uK+5bWMpLfnz0L4q0zFdGInPZZtEY429l41d
         HZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=LUl/lQRNGhjctEOCShaHIdwol0I5YP6qkGGtxUZV4G2pKwfIiP+MHxSSw9uwufMCxX
         iLhRkI1LyD4tdx5reRPXDmiZ2FVeNpgJMtxJIdwnxdHEfQhQNrLtNUoDc1Gys83ZmLh6
         vBcF7SVMJbqV0GxnKtJw+1+DfZX/AvFDWq/6/RLdGfQJkd2vto8+1RGz7vpESKx2J1Sq
         J1L7/hEHir046vkIcqe9DmGxhknsZfth8+hJ14WosAlvSt0myQw3HEH31Xg5v4NptA7w
         bR4lpgWHDfiyA1LSpUcVOndV2Gwp3U5fHHZoFpCPoDPk1cudKnuAnwriKsSXrmmiBwNU
         8hRA==
X-Forwarded-Encrypted: i=1; AJvYcCVC3Hpa6BcYldIm8p7MxjCxlexaxD/josZEV0bs1dtglBZjbs52f5w9iS7IOKTlGBo/WmiRnwNX9IJBqjE5acFq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+dcCd06HtYCrh0j8pnpVlq+TzZXrg8l1wSKcdoUGcMeYrwv0n
	3V3fxDRyra0XrP8L7NN1qK46YLmj/esV9xrThq6LBeBgpBWE5KaZv3mFSLFyIbg=
X-Gm-Gg: ASbGncuqUfHScTXpZIgKKyFgOwjXsEg10+m8/8aC4l9yjK6iT5kaAXWO0wGiFAi8Rgw
	XTx74Kd+3ZRKRdEdBI+mFJuEXwHO4tB2kkn2V47wxWxvGzZU5cD8VaLRV4a3b8Hn8tgvA0Ih4iz
	WTaOLTKSxhpIhW/M14nZ2+VjQtyjp06tVSlc1WjUpcANH0QEs5Fu3cRJkgSFe+yaikZVwRkS3GL
	dY8llNYhH7ytTd6FTvdG/wyAvtSjJNHRJ/cf9qM2TO3eObShkH0C9p9koon561aTUHDHWT9hHY8
	3NgJcPXTTA9b2/1Lxa2yFDWt4OePkhkdPWRUawrdw+IGqrs/mHmZ46ydvhCXXUFt5kYWsYeqA6/
	J901KmCnGDg==
X-Google-Smtp-Source: AGHT+IFUL7DUuq/VqTU9dmynPShF+8aK2RXF+k+UR0pl4bWqZxWvS8VoSsjq66EWlcydyD7uTG7tww==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr7325207a12.16.1740751642551;
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:14 +0000
Subject: [PATCH 01/18] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-1-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060724_631832_5C967ACB 
X-CRM114-Status: GOOD (  14.52  )
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


