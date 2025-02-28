Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AC0C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=; b=rBbauxEUktinNMtz67ABIP2F8N
	u6jJg5be0AXv2oGlswNn1JI8PMz3W+kqDza5tKnVa3vZyO28VF+VoxdymdDflTk37HeJZDG7FQWW4
	FRbmcYBDN3ZZnGS3grP/MTWviW4R+KHiHf/Pqppsb/ho1jpuUPNhj3DFBau3dgI6y4TbZZ/YgJckV
	Zhiw8aRH88yYijrtvk5HqNYRqJnCjRCqjoOsqInvEPeJdI7TFvoyMpt3SVJV2zsbB2oxsX6ZSHBm7
	AFKJUhbXTTiaq1u9wRkS0paL6JaKU47QKQeDWIJSbX8rn2x22ztMlDR4YKNb8r3rgycfST6Li2YIs
	oe6QTErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1N8-0000000BGdU-43pS;
	Fri, 28 Feb 2025 14:29:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11W-0000000BBBM-44PY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:32 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so2082526a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=xvns22eqJsqG2Gl+DOBly4VUdih7jhlWc5oKSQYKcXdP+1AirS7tkIXy7iIijS1mJr
         qDpDnqAX9snAsF1OwQOI0OKUQzCTDFU78FNd5KBYO6vXB5bdIsg0XXEyamhZtst+yUVU
         EsKspYjRA9nii9d99C774PlUzMbHKMxtrlPEfyk3cI0jUir+zfsq1ucnKhnARK3NgBwZ
         KzK2RT5ruU9tCDN6Eh8o5SFjp89pZVyJqDn1EvbV7EATSsEfLLzN1ebczVaClz6rnGKD
         5g5I8wCWUu7mZ+mLPaJQ5GR2jKkuJImzq2L6NjizXMuMmAQw999wkmWtb2YbP6OdsZ/b
         oIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=a2ESxrQDarPextVpE5iF/QD/ELrQH5jZNcLxxJqBBikLX3er/ticrjlhX4vV6hR4I9
         FliO4NVJ/KtYkXowkWk2YJikccYs2E1jLSEr6u/UH3fE4CFKx8WeVNL4viX74DMztBzW
         C2y03a+oUP9sOaY6n7LyJxdcR/Sh4oZGKvVwTGMwNYO8kq3+eXOxp2hzF7ViP7Fdq7VP
         ejus+QgH+CvAGGPhVHNfnCibzgCm1zfqmZLt8o3knyQiUsV9P80/BDOkTnUirfdtUtL7
         bHl4eAQpjYy2jk9yf4YvlrmZDhZ9wHNiAa46i9kqNj3ZvggfT1S8pf7lClg427oWvtM3
         p+ww==
X-Forwarded-Encrypted: i=1; AJvYcCUXqbXqfWXLpZ9dzU5K/3vKRPLXO6DUIjfm+LecmfgzIbNuUeIs2n4m1+bMPiuHmKUEGMQfJ39UrfWWxYkBOvdj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz0WGCV5PDtag5IZx5EV+nYHWPHfFjdHH/wMD3iWOiAeR5QNl3
	h8DRTD1otBZ+xsu9PqUwG2akRpvuf+X772m6V89LvGvA2hpG9dKLFNy6AbPfWnY=
X-Gm-Gg: ASbGncsk0uemqW4I8S3xtH5UtVFDjBQZEPIBcX9O/CDOqul7eK5IlX34VddmvDg6REV
	wl5erkocZ9BfXNw4nfUcAdY/e3fY59J/51znLZ1KYv8ddVnDuK9CoPWyX4ZjfpL6+3xlR0sxZAx
	baQAKiRW3c+CTN798Uq9i0lrDmQf21PCV8Jo9+6n62G0/Gh1dMsBNftyJsTDdNAKjTaqgaEsmHd
	YgoAP5eHT4mkXyg2/PSlJBY/+sEzAYV3wADNxDmKExsnr+fOk0UcoCvgIil5qbHiLGEVTYDzLWf
	ZU5uxWLZswPgPda5ry9q4qPQUyJHqjqlstvsj/9uDhe3lRobWI/Qd5jHcmGrTDbBY0olwrPWYYV
	anzThzFZhXg==
X-Google-Smtp-Source: AGHT+IHq59q43U3ESaHrkdTJX61FFZSQWYbph+vbGLJu0Eb0VqRkvBLNVX+MfvKgdS008nj52Al/2Q==
X-Received: by 2002:a05:6402:5188:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5e4d6b83d0emr2632501a12.27.1740751649255;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:26 +0000
Subject: [PATCH 13/18] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-13-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060731_002666_B7D89251 
X-CRM114-Status: GOOD (  14.46  )
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


