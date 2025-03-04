Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E81DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=; b=x7XUHtgUzASA1FelmBZNEeOv3j
	vCOlRpHxDh97kltR+0DPgcxJ3bhASb+GVUWHbFz4OxvbgCIcegH1TfBihNZ7NfhOJdmLR+5PEorjN
	sojNgxVj7qnG5roK/OZfUelqrw8Ei2So2F70vkAW+RJoxRLLze2Lp/jpjK/xFhNb5lHi3pHEcTB9R
	5pxbopsqv5Uwk1KpDyGxRjccE27vfY4Ru20BgXG+2vJDmZ2h4ZZhSJgGKh0D6AOu71javWbPnbnsZ
	J9C5vYsAbjdfz32vrZiObDOim5OLnN8CALwtf2d82HpOMdsEl6eZrMOBVkHghqbvgpx0Xh5CFPY/6
	2mCQI1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXEu-00000005t6L-18Pe;
	Tue, 04 Mar 2025 18:43:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViD-00000005YGF-43v2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=; b=bQQszX39yxgp3p66hYi440F0zx
	cZzrOlsldi3Q0JskZa0xOJo4o5uxiZoKleaoJPOicRAxnqotXibsK/0kOZQUWZseLqZ2lL3lztkkr
	Mfh++TpNeFLGMcR6TIQtmfEmO2RIerJGyUwi2EUjgFGSYLlGbcTVQuBRDRKevaM/DvUsC9NXmi8cU
	P0oTnXON/WSRHvL7Cca7Cc9vYaxZDYTg8aKIT9l3zIgi7MskaVc8Bh1LkzN1H8iDXQlqtSY9sfs+4
	rcnO6TYy7SeU+jI2NA5LZOEHU9ahr4EmsK4hNIdIo7IcaWZMb5Y7UwZVcpkMUImuUh8abvKcZqClH
	GlXtvQyQ==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi4-00000002CxN-2cgg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso10982786a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=kuAd1/dKo/4AHvwOMLmrfBaSb4+a05OJVDllMApD/dEdL+qY5LNLHXnRf4FOjXnVUE
         cZhUm/IDYhzVIioNL66Qv5rl3GVA3qpzDD3cSyXrnsIuIITtv5hOO16wjdCyLUQJSUrV
         uWMDrONpTjN83pe5ylwRKKpHMYVF0FKCMwGVGdpAbWaXCrbfR9Kmc7mFIxN0ZImLSr07
         HR6k27foVimjCSvhrSPO3+L3+9kbhQI3sQZ+dMtRpRTt7izhp4Qpvly/6mGcyyUh7DFK
         2/fX1GfmWJawjSu5KB6BsCzCCtwjDyl91NfXbA+A8ZTVOYpWa3ZDJxmxnazveCiCvghb
         rj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=P79rhSyJ7wDdW76A5/5m1U0unx3vvIZEFaCSfQ/juL5zSTGIES84DOXmfLGTLnykF1
         n8+o8l5PoRO/n5FzrTuM7fOi6Q7bkghDAU1DHidYTkq+Hn7VZVR7Na0vLo4l+oNmyFnV
         PnYLtFpkCHbtwSSU1x4bLwSIkylG+Z1pbcgvau3Uf8YJd7areSQyXS6oZg8Fg7kOQfxp
         Rd+Gha++aKn9lvH//Oklocb1mp5AXmxaD+SAsG4IdG7jg4umI/9AESSz3HH6/Yl9FVZB
         YPlENrDkb5MnPN0uIxV+isv6giLdA84GJzBYOG70VMSBdh23LxTc2g8C+kDgy+Yes3m9
         i1qA==
X-Forwarded-Encrypted: i=1; AJvYcCXjpV5M7nT4JlGMjIF3Ku0m07YYxB0bvRSkQM+u7SwSh2LOLux+tBdk1LyEQipVg8hy4qem+qjQ3q9ZtRPgSfx7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2pz9fazhze2hc1Q+KHIF3vf8ObNgh3Dcfpfrs4thLcYbx4U5C
	r2HVnCJoDmbs91Dai9vXgxQDho2KrZbrsZzWjaQj/3zOMG/V7AGdtvOU0dClvbA=
X-Gm-Gg: ASbGncviPiZ6yOHzNcpqm1VkOKEPNcf+f8H4jLMUfYggYhpN2G2TbyCGIaNf4z/KrN0
	x5QRt1Ln8xURrV9rzwUlvs6cNJSPns1dzwp/OOoLpEHvcEVxjAebV1awN2KSrWPLNR4OWN2j3iJ
	yokKHSVYAMoyZvyJri5E9JmVYyGurb6Wl/YHAha6gWF7o935N03bwq5NP+cqL4UjJUmCJCP7999
	tCRwqgwh58xEZCqEiCCisSy866+cg/egff0Mg+b7HlplfWRRV5nt27ZrGbU3I5bLqIc+Ii7Q/jh
	HO+BWzL6vkfQcacA/6nDMqssHwrB0quz+lVWWf0NMsDTZLPk9oC3JsyZRiVn7U4ozAWCWsnS+Sj
	zxrVIlePwlop6gM6kMR2//kEEw68L
X-Google-Smtp-Source: AGHT+IH7IWkH6sGgCqXOqo1X+qUMKDFtMNOejwKoQaGxlKvxwXw1Icl3WBZaF1ebexseFdyLVEv5Qg==
X-Received: by 2002:a05:6402:847:b0:5e4:cd5c:50f6 with SMTP id 4fb4d7f45d1cf-5e4d6afaf1dmr21403911a12.18.1741107933866;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:32 +0000
Subject: [PATCH v2 04/16] rtc: ds2404: drop needless struct ds2404::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-4-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170536_937720_FAE09868 
X-CRM114-Status: GOOD (  13.54  )
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


