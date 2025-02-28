Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D972C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=; b=THZFPXMEy2XstZlaT4rpJNy7sZ
	MX3F8dIohmm7QzGv29BgSYPt+9374uMB4OqVoM8IzUS/Q3f/rAbt69JtrFTgUrJiJnQJ2vHgmZR1G
	OerKoNbDfyzdfKyjDG/zp62O0/IJu78L5yuACW3Whsw9y1qIUwxAS6ivdJktP//Jt0JQyRMmG2Z8t
	LMVDW9KBZ8JI4Fj3bpcSQiTvxDZBDDGuJiQsrARZBZB6I/OabhBRtbLkbh6NOI7ogk2kyoe6wxq64
	FK0bCUpLnXH9dtZPe8rmRt5uvh6ZXgePeiRc5J2NA5qPNGlgFO84ULKaqMe0D9RVYyAErIl4+1VGY
	P7y/Q0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1K5-0000000BG5u-3qrO;
	Fri, 28 Feb 2025 14:26:41 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11V-0000000BB9O-3Gn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so4075424a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751648; x=1741356448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=;
        b=Gf4Kp7HassYmg1Bt0wmPC5X8yp8JsSeJuFeavsXBwKns8Dt33e/hV7STgjF+RhUxAG
         UUJtDJepClki3qSKqnzPonVliB3Q2dZRJmPWiMTNp8wh3C2zZ+toklLQmHZ2aDs+nOWc
         gkJZ3vLHXSYt+YKTK7RmeOjPiKXFG+KWT/bKHuj3he7mvrYSLde3C2+nj5xgMF18xsQU
         GnExY6EWhdna/LYH0vlpzpBF5cTqEeODZgaCBYUcNS1lFrd8mE8Qd6YgJ2xs9ndQKgw/
         7mYTLzwiDM2KJoioygrXw38GuInbmPej6hovLu7PpEAZ90mYONIVI+odTHofvzKrLOxF
         uEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751648; x=1741356448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=;
        b=w9IfEo1p0ldtRLv8wyG0PUen3xnuJQhyh7FKNnRnfdbNR27vwXj0mzEz0CwDo1bmSw
         o2KX/R71qQN6KK1QsIjA59A3QXGihc3uPqSc6FjRx+KxiQOsT3uMjgIKi3trhvh6biT9
         tiA6+QMxk9vCqwZJ0jP97qoYVnX4oBbp8JD4+rRVPmrSZbTgzZFu2lZCMsoYK9vdEuiP
         cyk69w7TQG5//7OQb8EvYQDaCH4SEbgy3aO4ma9sQspaPpMXy/zwE0rulYFlre1WqLhk
         84I5PJOxAGkJGh7WwSGmJoggHyHk1G8DGp2X2gSUPdK2ZcBN2PDr5JtEE8fVZEAKnUdy
         Dk5g==
X-Forwarded-Encrypted: i=1; AJvYcCUH18fQd2oX1jcYdplhcoBwULi71EvskWvfULxcPXrmrqN5kL1QDmuQW8mpUuIbGS7NyeGRAG6L2jnsCwowTlDZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJJKHJcTziz3zVkAxAfHeBNuc6FFLsr7efRLBqJv/8va3sWTG9
	mthcr3lYDH63F4SzTIWG3sn619RnHW4TM6WQWHzy83fmBj+RPn88IfPEB0gML88=
X-Gm-Gg: ASbGncth3NgOQGAONXQ/RaDF3GWHP5bneysEROxt3L2B+sBmIdjesarlyxMYHCuYo7Z
	kjgXenlrO24DU/IArxAz8nk5qq39VOOhOhcy/LpHzIxFwSKCzpbK8saBoUighlNP2M2BNw/MnjD
	HtIO20EaF0IkfTBz+OteZkVwTXiFqMHZMDH698IXMGvOOuV2stv7vWPvjd/R+t2SkQj/vHkOWbZ
	lyZW3EG1AE4E91X+jNYN4WUPNZNY6GazWBj3Gp+Ma+1MF4DGmPQovPEDrD+p3DXD2vr4GN7CJgg
	m0aJlWjxrmGQ7TthBNOMhZR4fj8Rhr5AuhZIXcwHPSFLExZj95fAyg0PRxU/FtgUjBXfs9L9fqf
	JzuBFj+ejZw==
X-Google-Smtp-Source: AGHT+IGquByOTAI+pOBsMihZmYnZaIy5p2XitRnKkTWDJg07k5RO868wRYsHEejBUavy8mEmWjqo9Q==
X-Received: by 2002:a05:6402:13d4:b0:5e0:8a27:cd36 with SMTP id 4fb4d7f45d1cf-5e4bfacb0a8mr8959084a12.8.1740751648271;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:24 +0000
Subject: [PATCH 11/18] rtc: rx8581: drop needless struct rx8581::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-11-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060729_811293_9A9C114E 
X-CRM114-Status: GOOD (  16.20  )
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
 drivers/rtc/rtc-rx8581.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
index b18c12887bdc3705ea4cee9b8d75086a05b24e71..785ebaca07ac971eee34559f8d1e0a8a872cbba9 100644
--- a/drivers/rtc/rtc-rx8581.c
+++ b/drivers/rtc/rtc-rx8581.c
@@ -54,7 +54,6 @@
 
 struct rx8581 {
 	struct regmap		*regmap;
-	struct rtc_device	*rtc;
 };
 
 struct rx85x1_config {
@@ -252,6 +251,7 @@ static int rx8581_probe(struct i2c_client *client)
 	struct rx8581 *rx8581;
 	const struct rx85x1_config *config = &rx8581_config;
 	const void *data = of_device_get_match_data(&client->dev);
+	struct rtc_device *rtc;
 	static struct nvmem_config nvmem_cfg[] = {
 		{
 			.name = "rx85x1-",
@@ -286,21 +286,21 @@ static int rx8581_probe(struct i2c_client *client)
 	if (IS_ERR(rx8581->regmap))
 		return PTR_ERR(rx8581->regmap);
 
-	rx8581->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(rx8581->rtc))
-		return PTR_ERR(rx8581->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	rx8581->rtc->ops = &rx8581_rtc_ops;
-	rx8581->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	rx8581->rtc->range_max = RTC_TIMESTAMP_END_2099;
-	rx8581->rtc->start_secs = 0;
-	rx8581->rtc->set_start_time = true;
+	rtc->ops = &rx8581_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->start_secs = 0;
+	rtc->set_start_time = true;
 
-	ret = devm_rtc_register_device(rx8581->rtc);
+	ret = devm_rtc_register_device(rtc);
 
 	for (i = 0; i < config->num_nvram; i++) {
 		nvmem_cfg[i].priv = rx8581;
-		devm_rtc_nvmem_register(rx8581->rtc, &nvmem_cfg[i]);
+		devm_rtc_nvmem_register(rtc, &nvmem_cfg[i]);
 	}
 
 	return ret;

-- 
2.48.1.711.g2feabab25a-goog


