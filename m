Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF49C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=; b=tr3ZBYjY3GXdyL+6ZaaS0nKCDl
	9LVKvYthLmzyUzhSE+BH/Lc0wulRp7YmZ403295y6XnexFiqYQ5e0EhUkUXBKIunClljXqUGetHNR
	o0OWhD8bwkHL+0ry84a2N660jmNcgPPansRhhCvlZyecZ2htz6NFopovzfhIT7/n5wUp4bMLZfbEt
	uJ/b7A+plbNK4nMVfHp7qTgMWQ43g9v/jHXg+nw3maTCBiInqOIjCqE+mwEtM2CyYtro5944BAWrq
	ucD1OPPtfzDtBS161sR0HjmE2QZIFuZCJyXnwcQ1eLcOGfgZqKy+N53ZNCbdzSIZlKUwUidJTba0e
	k2XpTk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to17n-0000000BD1V-2LEK;
	Fri, 28 Feb 2025 14:13:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11R-0000000BB3z-38iT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:27 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so3678794a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751644; x=1741356444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=DIg1kgLt5Oep0o5v4ZjEl3Pao9VvKZWVV1m+kaGGsrYTSXSaODXr9+3PsbZ5X255RK
         EYbFZIXdL0DmN93CzpY7HYqYxJzBSPhCNJjwEs6nwmGXcpexH6WTiJIBWfxd0YHqsxID
         M9Z6PmJsWny0nkQU7S/Tf95w5n12qsqwZDsPokW9AaZz6OlrcQqY1G51T5wChPQZKLkz
         32TKsVSriRYEjPReQ7yYail1oxJ5l/wyMi3eZPEgKmiI0SUxD84Sc2PFUC99ukHJkfHd
         7JPrj+xazWkJQjrfPlzupoEdxlSk1lXBhdT3kpYHcHTvbB6zJwe7G+L9nO6vuUMdtcXK
         iRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751644; x=1741356444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=wit4JwOku588myBgr666tRGWTtkkHZS0pPvA/ljLPM5QDLVNIOWHa9O6EwM4M0plca
         ZiyggMn2KRuuXqoJrsHWwY1nDpxhL1+mk2WwspCIP7PcznlocvMahKOUWTypBrQq/OiK
         f8Dz2G8rfy3vjUqPmzqcE5yKX5Oq1NBcGaGqfzyC/VQWSHfImfxoXMoVx7wB7MinDF5P
         yI59Noj95isB2bBWN/wRNWHDbR7+xk4ucEyMcF1kz1J+VZc0agvks0ZSo17fqZqwi0GD
         UvDpd0Pro0UmE9Zg+M1MfD3YTSmDQ6eDnHjONlqmkAEipSutll9s7zeJhK1r/ZjT2fqq
         fNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkU+6PyuuLBe76H1a7LjH+qgmcEmgoKps7T/rVWo3iGk5aFTVdBP+EvKh0Sk/CEbcpQecGFopOGMQLaO/UQgvo@lists.infradead.org
X-Gm-Message-State: AOJu0YyUkXFKSozMAjNEOffNx1wWyAhRiQGzJY4UepnYNx69ggs1wAre
	m4Qyvi79R/0QQUB44qROy9w1b42pqGaZm8DKZO5vF4lLE8JWAW2VkhyXCkeMbVg=
X-Gm-Gg: ASbGnctllMUPzLyUoKunBspacm2Yds5xtQgFWweaGLX/En+o7V4t6qia41WVYs0lSRO
	uX1DvHAZqotD8UEF6fZdsq6wbyNQ0yN2faje3uYIAlOWlRZ/zVvDhCMMbjd3qqRtJQqU6nfk6g5
	c7fvG9f9xgShTcpsxKBoVGQXyD0Vhh1mlfxqe0EMgAyCkRYwVxIN8XRY1oZFssrPn4NKcHneGF3
	cr7EQHzT+CBiRUd+5o7QxPnSJBCmfN9FzhjYArYgiV7KSDv5Ocdlu1wQWsYeLdVEdI/bJcGI8/v
	97LjWSFAC7ecH9Kdc8U3xuj12pwLwGKe5N1x+qoX6BvQU7yYhI/TWYVfl9VaWqq4GDGMFOdWJUZ
	hF4SWkgKBEQ==
X-Google-Smtp-Source: AGHT+IESLHMD1ALp0fl5UNtQkvu55XFyzsWGAW2ARn4G0KwygGU8Ail6xNyHqVhAMNH9i4466iKXaA==
X-Received: by 2002:a05:6402:848:b0:5dc:d10a:1be8 with SMTP id 4fb4d7f45d1cf-5e4d6b0e6c9mr2959043a12.19.1740751643974;
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:16 +0000
Subject: [PATCH 03/18] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-3-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060725_820616_6261A593 
X-CRM114-Status: GOOD (  15.03  )
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

The memory pointed to by the ::rtc_dev member is managed via devres,
and no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-aspeed.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index 880b015eebaf796f68ed82c29998f345e1fd418b..0d0053b52f9b90a61725bf29435bfc8071977f9e 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -8,7 +8,6 @@
 #include <linux/io.h>
 
 struct aspeed_rtc {
-	struct rtc_device *rtc_dev;
 	void __iomem *base;
 };
 
@@ -85,6 +84,7 @@ static const struct rtc_class_ops aspeed_rtc_ops = {
 static int aspeed_rtc_probe(struct platform_device *pdev)
 {
 	struct aspeed_rtc *rtc;
+	struct rtc_device *rtc_dev;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -94,17 +94,17 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
-	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc->rtc_dev))
-		return PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
-	rtc->rtc_dev->ops = &aspeed_rtc_ops;
-	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
-	rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
+	rtc_dev->ops = &aspeed_rtc_ops;
+	rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 }
 
 static const struct of_device_id aspeed_rtc_match[] = {

-- 
2.48.1.711.g2feabab25a-goog


