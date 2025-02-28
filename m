Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B9CC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=; b=tHWQqMFEnVvoCiCK0O0iGi9wnQ
	o0Eh4JU9YilNTpMkeF4khe63K53qIb1KWrrTMX43mGz5NBdQmrzPg8t0VqaxQCoOyJb2kTDWRrB29
	aVw6T33CCM3wxuxY/LuTVqFt7LkW15oULkAvPYrI93Q1l6UslkywMkdwyPJW0II2S8Tu4ebDE7vug
	lcvP5VaR2DwVcl7fSHdmjXp9/KgnAOuC8zpzhCWpBFmv2Ug1kiwv6+6n13/4vhDd/uly4/yIOVOKm
	kl/8/FcQ7pN7T0R9x9v48kuG3/Jn49250o+Ch4VHiGkpvjSWiGmq2y+DaekBb20rfgfBv1vNSMrTH
	OBWSGGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to19L-0000000BDWQ-2dbp;
	Fri, 28 Feb 2025 14:15:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11S-0000000BB4k-2Dyt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abb90f68f8cso416850266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=G4PPb6eSOqQsfGd5jw8KZtBIDlaZ46OUx8WEWGYE7MpGMr2pdIAXJto70kQmyhvaka
         JutkpevsT0A/Grz9sf3a+6xhtTMiKdIF9OQNKxZKIR81IAGOopAh0oSkIA74wlMoJcC+
         jixqNRFWE4Y7AKLZyEaCsClYmR+D73eHprAbmcXaE9wb5TtkDaRAmlgrloYZk1aFQEs1
         Kx+hVJZIfoHXakIEdS1385F4XGH7yECRxrQm0JeVRb/9h1akck80j2vrCQ6C0F8Bpdva
         1Ku6vhqnK00EznVTbKZK2T+SwFXIg+9m9/NLobkL5bYPzdHCvQZb8ErvodJ5vBT2Wlmm
         2CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=UcR2wC5KDkK38C5RWHS4FM8JcZEsmZHnSzgovup/SnXIpCugKXTSD6N8ZCyVIUgRyS
         29OiYbVa058pewsmRa5d3fHWm3lx1RA/i+0dlZ0+54Cn4lxRXRXyrQq0IaKOhZGM53jO
         5hHr0aT+mmdtzL2dLQQLwEhILU+OmpET9R+Euta9LjU+1hE7930tyCi6pJDlR+i9qZdU
         nNaFVNco77PnKbsSe36bqeBiBAx/QJjiHfMq++aoh6UHAqfjORXWjPR4HwpdAhhP2FcC
         G8zke3UXGfFSkM5p5adW8bAiTj1joiGFOy9owCAh4rAOl0v4ZAINYMx8amAhqjnIFaco
         LGPA==
X-Forwarded-Encrypted: i=1; AJvYcCURZPD+/EeIaNExzSPvpAWSqi9JGoUvQ70jnit+6KUBTJWMQdEtjiONpCi/bU2Qzum/Ghveklk0PzCumTjDXW0o@lists.infradead.org
X-Gm-Message-State: AOJu0YzLD5DUWMe0YA+w7JKR3pTYKMTutQTucPVwAw2LB+tnm+MkKADJ
	gkcfglHCUPg4YMrfh9tJLQShwAZGPnurrU3KA8yv2Men8HfVQrBEhf3HB9sOHaY=
X-Gm-Gg: ASbGncsPfF9EjrBf/yqp1oqb0BPZyrw49vGbL3wbSiHx6UthucqMemvVrhV4OTcdJMO
	QwqSDSS1VO4LmAp7RWBP01y7lUcJ6acXqW0TUJaFNjmGFnthSn5MWsFho+zHaLTyvrqGnXmb9/X
	HZL9U0iuYtfu1oVcREShBpYkAtAs+3vdz5wPvOUJPcSElF1jtURYual+YEtYcr6sNt6skHh6I/N
	uzI8IUzhOowZdtlf8PPHkRs9oQ2rNl1s/JTodsTdLcvkdENktnY+SKzQtJZ5i33pwE3LrdYSjLN
	kR2UR/HUVWEGavmSCEYvVrMljAzerYyVg/Xw9HKaHnyVoDIBVXD6CmkcR83/tnhULj4bSheOcYW
	EJSjEA7wQ3w==
X-Google-Smtp-Source: AGHT+IFpdib5eLXvAKlYp3fUyW87rQ1IfZ8GEMoJsXuLGkDw56XS2aTZMwaUmenZ5apuVJAYF/Nggw==
X-Received: by 2002:a17:907:c018:b0:ab7:fc9a:28e2 with SMTP id a640c23a62f3a-abf2681f8f2mr377695266b.47.1740751644708;
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:17 +0000
Subject: [PATCH 04/18] rtc: ds2404: drop needless struct ds2404::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-4-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060726_571422_AE3D04F1 
X-CRM114-Status: GOOD (  14.24  )
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
 drivers/rtc/rtc-ds2404.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
index 3231fd9f61da49bdaf00e46486fc34836094ee78..217694eca36c3432a8db3b874374e347eeb802d9 100644
--- a/drivers/rtc/rtc-ds2404.c
+++ b/drivers/rtc/rtc-ds2404.c
@@ -31,7 +31,6 @@ struct ds2404 {
 	struct gpio_desc *rst_gpiod;
 	struct gpio_desc *clk_gpiod;
 	struct gpio_desc *dq_gpiod;
-	struct rtc_device *rtc;
 };
 
 static int ds2404_gpio_map(struct ds2404 *chip, struct platform_device *pdev)
@@ -182,6 +181,7 @@ static const struct rtc_class_ops ds2404_rtc_ops = {
 static int rtc_probe(struct platform_device *pdev)
 {
 	struct ds2404 *chip;
+	struct rtc_device *rtc;
 	int retval = -EBUSY;
 
 	chip = devm_kzalloc(&pdev->dev, sizeof(struct ds2404), GFP_KERNEL);
@@ -190,9 +190,9 @@ static int rtc_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(chip->rtc))
-		return PTR_ERR(chip->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	retval = ds2404_gpio_map(chip, pdev);
 	if (retval)
@@ -200,10 +200,10 @@ static int rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	chip->rtc->ops = &ds2404_rtc_ops;
-	chip->rtc->range_max = U32_MAX;
+	rtc->ops = &ds2404_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	retval = devm_rtc_register_device(chip->rtc);
+	retval = devm_rtc_register_device(rtc);
 	if (retval)
 		return retval;
 

-- 
2.48.1.711.g2feabab25a-goog


