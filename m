Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D0CC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=; b=lkafD4HEL4/b5/XGNYPu5py7LC
	OXNGrn6edLVo/J0gOZM9udM0D47w2xmqTnUCfZMclKUZ7E+AymPk0x2uo6x4wHBp9kWhS6EhIZ4ix
	0AipFMkQVhnaFpfhtZuSZMJy1S/r6454qAN8kKOb2exvPesQKh8zRsMZF3y/1tzTfpJ9PniIhgNil
	Tntvmuulvu0Lag4+UcuSgSIIRPt5LicH+SNFgTN9K5nIisBNqDEYbR6s8W7fKvWbbAM3xNUanVr76
	Yk5I8WHB9a0Lv+q8PMSD807vkhbKyGCS1omo9ElDhMfMMs16KznR9u+8PLGfLuA7aPZpywZ3svv48
	795AqZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Oh-0000000BGyk-0Y46;
	Fri, 28 Feb 2025 14:31:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11X-0000000BBBc-2oXG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso3602129a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751650; x=1741356450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=Tbt1ZyYbw0fhZvWj/Jp6/ghf3SHPTn23gLzNSV4wEwbD4MLfoCMmkkjoOMhnXsetx+
         p4WxGnqMOt9LaAsXXzXbhW/r7TKvzMiZlxhnOe3cQ0U4/LUH8ulUHahrMp5tNuRunADt
         u1pclU0GQJ0X/T0tLk/8vlhl/E1j91woQDuRjb6x4r8i7fxsFtogFncr/FA5W6WTY3Ai
         0nJOTx2ta57oFenNKDSD++kiyyRT1AVE5YuYs2j1JpsqAK6a9TPDdi2I7jFj9IQU/F4C
         PC+OnA92/AYvqX3TYmE0rWpPieJiWp/5N8lW/Tx7NXLclt8NHCDMP0Buolk2Zx4DPkys
         be9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=q9me72gONbIzuFkXEE2pfwWOYGIDdH8tHhsxcn5NPqQ0dPx9E4qnx/xuR0ExwXAr2L
         7HIYaMEKsKrrqzV42e/myIi2Wl21prGqbegprItxl3KzPihAUaqJsjzF12AMTqQGFMGr
         WQXZ3pacX/qKb7wVWoe6hkX5+YixMOxpC1uBrmphNqTitT/laiTew4AHRz2Roebyz0z8
         DHRD5IXkwzKcZK2nEuOXsLcj/u8AV9GQtiTS1fzypfBao/sMUOcXxVFcCWoAqzj0Hw9Z
         zhz9T43dRHCyKXrnStnuNDJuh8U5HhempWENNdmQQpJQHzj9k+8Snw0gpV0V/+jfun6h
         RFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXABN661a/mqVn0NpkiSn32WseZSX/wEPqqKrR1YRkfZ0sqZxuz9+A5LI8RTUt5KTr/5j8mtro8KK1axUcWuOpg@lists.infradead.org
X-Gm-Message-State: AOJu0YzcbqsLE0FHHKtIDcYG2a3XuqKQmynwwHAWP3HzAzddG6VcC7su
	c3SDdbMu9xvw+Ic1m+kvlfTWXW0kZKIwKyfn5Vj/15bKia6mfvx1NDORwcNQ+Ks=
X-Gm-Gg: ASbGnct+usPmRtyaRn2LQV5InSpEfCf127LxdW8sqvZgoG8qZ288xb0+XTDgguVf5vt
	N0UrUyFzP9Imyh22o4+S5XJas5LlaJ1tmTS5uljYW2WMWqsi6na0pBcsxjsLSj01b7mGQtauLqM
	D6VLit2b4rJ8sLDEtIh1y0k+7m5XBPxYKBOi7l9gKhb3zoOoOztQvvsYYz28zCyYJu/w1c06Shm
	nJZ55vpRDQCr2jtS10xC0QpkLVulXOqU7U3gzjrbsu2iG4hagbr/R3aDrTYOOp2dDLlOhpnVK9v
	6V/2I0ka/obxLsRy7vCttsxa3lZviMlwTCF1mdImYPCXMqVDg/rCFPDOt3bypnF8rUtu6YpFGxa
	BapKJgq2RMg==
X-Google-Smtp-Source: AGHT+IHCyDQzEJ6kBhW3v4N+pYx5F1W3SqfuZOszPC9Ixk4jqjoqtVWckx72H2jiEWEF9nyPWj82Qw==
X-Received: by 2002:a05:6402:254d:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5e4d6afa314mr2938285a12.17.1740751649850;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:27 +0000
Subject: [PATCH 14/18] rtc: sd3078: drop needless struct sd3078::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-14-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060731_703832_E158DCBD 
X-CRM114-Status: GOOD (  13.58  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd3078.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index fe27b54beaad1c06b70bf7f22e44c3f6da087267..ebb4d45ce2409982880affbc7a85d5e7410c8f42 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -37,7 +37,6 @@
 #define WRITE_PROTECT_EN	0
 
 struct sd3078 {
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
 	struct sd3078 *sd3078;
+	struct rtc_device *rtc;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -183,15 +183,15 @@ static int sd3078_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, sd3078);
 
-	sd3078->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd3078->rtc))
-		return PTR_ERR(sd3078->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd3078->rtc->ops = &sd3078_rtc_ops;
-	sd3078->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd3078->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd3078_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	ret = devm_rtc_register_device(sd3078->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret)
 		return ret;
 

-- 
2.48.1.711.g2feabab25a-goog


