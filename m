Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A7CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=; b=O/kHH53p+6jHsDdyhft6VQE/xJ
	RJWXm7zcU+yAkCdZMY6LWYGgoFRnLmjhLBsf+4iJBswOVO259B8a68N8nai6/mS8jcTvVIgzC3u27
	ko1UeUbJXmK8k9swiYDMh/ZeGrlj+CMB6G+nRl5DclziqRoZMAAGpDlsHSYkhdvJnhIh6R/nKGG/y
	+xXkDKMQgRHBQ9pw/WWEeowZ7nnAvLK9VpzqZWAV8vzmcYK7sj+UZO+Pz2/zs7VgwznlTCf4Ghsv4
	rdV4YA3b7lwxcHvBgztm991QsBNg9GDQQcazsak6+OaMn1hI/W73B4QGv6o+xfBVIvxHTHhRMaX7S
	o1oeXZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1IX-0000000BFjr-3klo;
	Fri, 28 Feb 2025 14:25:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11V-0000000BB8l-0pVl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:30 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so933687a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751648; x=1741356448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=;
        b=rSrf8/d8uc8mn1pQwKYXTj5/VzZDMToUwpAawpOtroUC5mgEaTidwjRN1vvSxF1Z9B
         /31zNJIB0jeRfO6MKmXWapI9P7YQPo2juPOQ4hx/mk4pFbFNuZsJ7cv8hYUGlr55krto
         85Tgc1zu4rSaEcwmR43brfrbTgqL21/taFaZjZZr0EyqfsvzhwjKLSKVWP+L+LZO/LFB
         /UcVXuKxiZ/rAwIi335Rk1n85DMjqlFczwbMCgtGUJjWtI7SZ3hFWjyLYBC9rl6NDIpq
         OkJ26yk6QrjBbbp/GbU82SQKT4RbRc3Fs8A1RnQVf/qJ3rub4eO3wTRIFvVSRVlUuRKu
         ChWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751648; x=1741356448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=;
        b=ub//9XoUgrBtnlh0pBVZU4G82PAL86+8LLhCWEXhhJjP3RaFtCbf8MxDnb6+EXiVrm
         WQnkHLAerDKI3avpmwOJAOLm0LlvOV9XDPK6qYTWrHKEnJIfnFIA8cfO5aSdWuGU7Pj6
         BKVn8HSl9zVCtq732TYO2wAKYC1hDFKoal4xHi5EqrkXM3tVB3xIuSAVs7S5OKPhwuf3
         jeyZc2/I7e1dz4/lKyTFTSOZERufOrys8Lfq5j1kF6BZvblf+lOnA4+ogoNZEixFqfn3
         5Tl54GIGXSO6xwbDWGgTcXnJUokIBVgQgawMshy13XPm4AmCO2LpE0uL+XZYVY6/Sm6g
         9qmw==
X-Forwarded-Encrypted: i=1; AJvYcCXsZ42q0imRpm1KBrd44SHxAF9uKVJ3Ogy1KeMJMo2gLbGiu5+ddu2PdVWs/wFofik1gZOEOqpusw2IlYnMB6RW@lists.infradead.org
X-Gm-Message-State: AOJu0YxrCmLRrfJTb2CVl4Xj3M0evjkZEy/Rw64cU+KUQbCXEFPPVMSE
	FV4nAwqLVXD1NcxEkSy3XT0S+nVGPB5pt/hWr/Pr6dhB+0rXstDpMnRMSfWLwRk=
X-Gm-Gg: ASbGncvzXs6yCxORnUpqPU5U5RmYlNS8iNuNZ8T4sYsfk+uTcmXlm7724Endf0eBhD7
	Z756+sPCV9tpPJjW4wX98QjbChAzjeuSTmNWkrm5h96haVHQnvMl9LLIlWvyfrE4YfUtgwRyNbl
	l0S4XbfoQrKmvNPY5K3oqyhb7tA+/Lu1Ljp6FtZGEZsppHDaJvWre0E4fgYJU91tQe+nZgxMqaZ
	XL40W1oaR955eaCXn72tBdeFJ+dEpkgFv2mBAkiVsCGGqlOZxotW6bzC82OaXnst5pDYa0H/zoo
	WfosezXGog4zQt7twdz+GgFL5klA92o+WDH4S5WROTe7wN7ToaA51mMJP4AIpcCt/OfnY41HYdO
	x5ruFzz2FXQ==
X-Google-Smtp-Source: AGHT+IFd5qkPHWKs7u0kGQaxuAKFWYEyb+eqqsQgE6/A1ZcU9oZLI/LHqjeh9PQlI3f0EWIivI7Brw==
X-Received: by 2002:a05:6402:26c2:b0:5db:f423:19c5 with SMTP id 4fb4d7f45d1cf-5e4d6ac4066mr2619097a12.5.1740751647799;
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:23 +0000
Subject: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060729_278938_C87051A3 
X-CRM114-Status: GOOD (  12.98  )
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
 drivers/rtc/rtc-pl030.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 39038c0754ee55a952e5986afe711cffff35840b..e7c81740061bb60c4d8447d6522819685bea9180 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -21,7 +21,6 @@
 #define RTC_CR_MIE	(1 << 0)
 
 struct pl030_rtc {
-	struct rtc_device	*rtc;
 	void __iomem		*base;
 };
 
@@ -86,6 +85,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 {
 	struct pl030_rtc *rtc;
 	int ret;
+	struct rtc_device *rtc_dev;
 
 	ret = amba_request_regions(dev, NULL);
 	if (ret)
@@ -97,14 +97,14 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 		goto err_rtc;
 	}
 
-	rtc->rtc = devm_rtc_allocate_device(&dev->dev);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(&dev->dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_rtc;
 	}
 
-	rtc->rtc->ops = &pl030_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &pl030_ops;
+	rtc_dev->range_max = U32_MAX;
 	rtc->base = ioremap(dev->res.start, resource_size(&dev->res));
 	if (!rtc->base) {
 		ret = -ENOMEM;
@@ -121,7 +121,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 	if (ret)
 		goto err_irq;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto err_reg;
 

-- 
2.48.1.711.g2feabab25a-goog


