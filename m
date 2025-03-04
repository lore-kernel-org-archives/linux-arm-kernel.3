Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333ADC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=; b=tChB1WjsNvXCH4Sf/wdw1fwkEk
	GopnoSfImqpd7+k7VftwTyQ4Wd6KvWpdxW+8wQ7U0ulNsN1YhRxHpK/YUBxrthP0TJsrQmRQEojDw
	xToS4/8YF709XGwFf/LhhZbOPRwA3u98Q1OKOi3KSGnLiyT9jt4/pKsXRf9p8GTjAqejYs9/w9Ppm
	3ogKwZPD4ypCZ+frMCd+L5Y5AZFidA7spBlbArgb2s1udZ6P/uDj41OMF9vgtP5U/76uE4xFnAaYo
	zL2d6KAnTXlvnZNI1jgMoI8I+ml7ef6ZlZvrxgnMCET4cs0ej8KzL00VRblpxvRWnhbnWc+YqkXX/
	VBzoP0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXL5-00000005u5Y-0flR;
	Tue, 04 Mar 2025 18:49:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViJ-00000005YHC-0fvn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=; b=napQinlwywe07Gm4w2oBDTqrI5
	XH122OPFtcrNb8PftOna3SjhELtto854hZtn/uQH/HQp2Hobl5qsLdZr7dQXSlhWCVgqrJ2FTAsAP
	bVTqNHBqGtbP+oC5Bw2y3o17h+yPfqVKG+chEIenYOQ0JexnHmqKXDnlIG3OyRuCxpNnSJDlxYee+
	LxbRlcMsnNBYt/DER8AWqw9ur3RpPHvtu9kU8C3xQJzagN+9ySx/OgOgourlcp7s6HIvs+6GeIMZ7
	8Y86JguVvxcFRGyfY2Sd+VOQIA7m+9CZuBxyhtAamh7d08Nrqzt+o4mXv+iXO9RqEbrBadEq/41wp
	qZ2RhIZg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi8-00000002D0N-0S8l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bbb440520so28438915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=l0sLJdaNaUCZBYSodhVO0/bzhRM6hrtSECo6RonPz+NKsMR3D8JAunIWrid5sle7Eu
         vsscEsMjIYtr/R1QBFNDkI+iNjaRWCPYbqkmoytXvM8vm/h33uKoSI8uF7AHzXXIllmV
         9wSclqqMvq2258JIUzYcJNcifiaC+y7+f3gPzqtr4J4b8maGTTHM3MO5q4fhG+RApX7h
         IIuvrbZwFIjGhlY+jA0JC+E/RaK7F/cA4KtyMth+p8qpwsyRuRsQreuhhkLOltFwYG5u
         DnminasEHfIC+9ENen1X2yW1NPh3INPlEhLc4A8Kwk1rbwgwGzErYGKZfI/DYiIDGovU
         mW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=EDgGlEAl7WUWnRfoI4IOvXR5U1UzAz366vlT9pzoiVcdNlxk08R2vwjUxschqn+GTv
         KsuWkpQaI0WTyX4NB7acgAvTOTlnUY4wOlv6hlyiJNPMP10BPf/UjXgE4XR5o+gdWuzM
         ipdrhaeBfuJFPT3Z+DokQDyGjxfGvtxEUSXzzmkwuT903BbhlwgtG44hTpTa0crNUTiB
         Xqpa2a4ZtMyXvifC3Yx+pLLIP+Phj7P1t3r/jb+MJnWbU/mJqnMPnWmNw4NE5P16s88i
         IBa6GMIYK6wLHyQkv3+AOEca/PJDDlGhCx31v2fufCM65M9jAC3+Uf1t8Mqd2UUkjDsj
         4Ocw==
X-Forwarded-Encrypted: i=1; AJvYcCW6O3UP8wVt0h9CG63DP7s3+Y1P+m3IF8EqpxBwCTpaK0aPcilpSq+updpR3e39jr9G0L9SZ2qtD/xcLDWER0W9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/2gMDhru0IpVL7D9qUQtGb6t3GTA9wTnhpcS/DXpXmSnaWD36
	/O6wZ1VQ2WQG/31n7xWDTJxw/zxHfRyv37rXlcsG7438PM8BWzhtvfh9H/6ByTU=
X-Gm-Gg: ASbGnct4m7pxX5lXufNR0N89YKcPZH/ME9igwJ0R5paoQiD4zsTaQkXLHJ4XuTgKZzm
	9uI8CbGiqXHA3GnukdpkKAwsOwRh8UUdG/yar3OD14Nh/m2aH/i0buImDnazEJgrjfeWOm5unfO
	qCOYGs6j9NqkaRJZLXXGMWHzpLUCWeoZXmSoCi2HkTwNKn+9FvT705Dwp3sGxxy8PySI3dH4heL
	pkiIJvezUOkcNKhfMRx24wOmhG/1miGfnVu7U7H/8OrlLs+jTBphQ+3rbas/idoyTwy/ofQ4jnx
	vU/se+ycBCS9JsJhv9ou91EgymOqAiTt4ezc+2bP8uNIR62nhIrVf+i9K4IdJjULliMTCs3uRvE
	zvTxrDGOpH7xsv/J+PraI3gP1nFnR
X-Google-Smtp-Source: AGHT+IHZdsv7jYfFsjyY3TIB4euke/dHgzMkeAeSorD4HntlJXvk76kkhxE/lHiggYkJdsJqp3nEfg==
X-Received: by 2002:a05:6000:10c1:b0:38d:df29:e14f with SMTP id ffacd0b85a97d-390eca069a5mr17165829f8f.43.1741107937298;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:37 +0000
Subject: [PATCH v2 09/16] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-9-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170541_273239_CA16BC16 
X-CRM114-Status: GOOD (  14.16  )
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
 drivers/rtc/rtc-meson-vrtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 5849729f7d01d7ec7868ff3bbdc5ed599aaa8238..7d38258cbe376e5a1b2af6250cb6d04c313175fb 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -13,7 +13,6 @@
 
 struct meson_vrtc_data {
 	void __iomem *io_alarm;
-	struct rtc_device *rtc;
 	unsigned long alarm_time;
 	bool enabled;
 };
@@ -65,6 +64,7 @@ static const struct rtc_class_ops meson_vrtc_ops = {
 static int meson_vrtc_probe(struct platform_device *pdev)
 {
 	struct meson_vrtc_data *vrtc;
+	struct rtc_device *rtc;
 
 	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
 	if (!vrtc)
@@ -78,12 +78,12 @@ static int meson_vrtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vrtc);
 
-	vrtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(vrtc->rtc))
-		return PTR_ERR(vrtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	vrtc->rtc->ops = &meson_vrtc_ops;
-	return devm_rtc_register_device(vrtc->rtc);
+	rtc->ops = &meson_vrtc_ops;
+	return devm_rtc_register_device(rtc);
 }
 
 static int __maybe_unused meson_vrtc_suspend(struct device *dev)

-- 
2.48.1.711.g2feabab25a-goog


