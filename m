Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD15CC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=; b=N/emsRT2Zqhro0u2cQ8et/9213
	3ZuJgIae48fIoPRjY+dafTtW6vVyicSw1eRT/sNbU+1tY1Gxv2NZAKR19X+5WiV2yW2p3+ci7cp9F
	IsXsbK882G8zwc96JhBuuoesvDyd8zaRtqJvVE0L9+Rr9PhSvqRBV0s2HlV7AmJyx6lg/gorbE2C2
	brxatMKqFZPw0VA9aecj48+fj7Nzdl5lur1KOWFjgMBfXZFrbIs+x83OMrotGfh1hJUS8ylK6kPPj
	r0xN8QbbytHZZ2XO69E8+DH4eZdfOK4iphSWZOe5/ZgLr78x4FsixYFH5K+5ybvGDp2tpZ52BJAQF
	2675dKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1CQ-0000000BEJe-1gw3;
	Fri, 28 Feb 2025 14:18:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11T-0000000BB5k-1Biu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:28 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso2990135a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=;
        b=Tete8FJrRmJOVMYDzdfO7FOg3YK6B8VAh+fDA3yTBC6G623oCWjYNz4cNn6uxg9GeS
         Y7kq2HgqXo7qFWMXM7O2RaY35+/Zz0tqKDWBQYBrUwJ3AUVmzjlqXk8uCZgskXhzyjII
         m0ssSIwhTxK3EW6e7seGS6Y+2NuQIznXJ7CWX2DPDnB3Cc+VrYgMwfBUsG/zNJby6CDC
         Rr7PsmHPYGZuL9//Z+2Jd0edzBWRA0pf7UiZZKK0o7tV+iB8lFLGsfXRhtYWhjkPEHUL
         kLD4vMhKR8OGzxGk6C+FG8zLcDTmgyM0w0cpDxBL/NOmZvaeNpyFkIucf6R3jVjdSmb3
         TarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=;
        b=wmx5Y1mvd82GwFot7wFL9fqSa1P4aB1VMZ2RiOcgYkNczs8d1/RtPaFwaCXp21STH6
         ACE5MPNxRkAQebCRLdMifv8YBhjV4+Ql0uQKuGpRmAXgJOOnPL5C7Xmygle4YT63TJYo
         ebwVtlgzhyPDV30ePggskOf6wHPtgAhq2yBZnyXEWYbyAWZ1zE0y0oI+oKqHKMOsUrFM
         l44crONyTzOdwElMHZGsufuT73WfWXmqqJnuubmG7HIgXjaq9y1VjTh38KigkbDMn4OB
         AMbD36hnM1yeiQrSzsvgXys+aE4fr+/zbinx+zlEI4iBhNlnuIz9Y30VBwj8QYuCYcRB
         tZfg==
X-Forwarded-Encrypted: i=1; AJvYcCXXbQqDjsgbYDsdyOQxB770IUqsksez6Gb2sgKRDq3MVzyCFb0kwftIt7BNmJLvrozoTaTZ1TGmHd5J9/mtATV/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj/nvuh+Y0vWq03Gth5FUCrhsaLi/WG31nFqCv0VPYglEmKiUi
	C6eaUCm9UU3qNOYkfffTcfQejdjZirMASbl/tk/qNJa2oBYSoaI61qIBXFh5rwc=
X-Gm-Gg: ASbGncviPUL2/ZMzs4B+cf61nYm2OsXgh+Uee7lTSlAieWrDq1OW2PUebaI0zB3emzy
	ODZhQISbSdVF55Lnv0rFtQNLIzHIE87dB3l433HtUnewvyC1P+yKQDMXP3M8/8v+lfsC56xDhCg
	tCO6hgrmdjBVtXKdrWkn8haF4b6vaUCBnjdL6iZiU9toiE9ukatsSVFlHpA7TF7Nqycaisi9281
	LvNdy4i6nTtobZ5qcOi5gNpDnUQTUKfyyGi1Km5NjxAtD6a/L154iLolOYJUcb93+sA+AI2ivX0
	DqVEYocYbZgD9ytX9kaYmVtRIijeTpzRQMdf8sBCU8Y00z3JplJLClFuogdFuEgytjgmzxBCPwF
	1boBMAlZKCw==
X-Google-Smtp-Source: AGHT+IFbzXWayjdSMfWjy9cwjYueSFy4YBp7IQ8OjzR2IKI5f4QLOeDnV9cvNi5W4D61UevFMTrZwA==
X-Received: by 2002:a05:6402:239a:b0:5e5:552:32a8 with SMTP id 4fb4d7f45d1cf-5e5055238efmr931950a12.8.1740751645786;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:19 +0000
Subject: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060727_318473_8283F34D 
X-CRM114-Status: GOOD (  14.12  )
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
 drivers/rtc/rtc-ftrtc010.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index cb4a5d101f537e20a685bb022e6f6516b0df8271..02608d3784958e69ec0ecbdb9fcc8b333b19e7cc 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -28,7 +28,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
 
 struct ftrtc010_rtc {
-	struct rtc_device	*rtc_dev;
 	void __iomem		*rtc_base;
 	int			rtc_irq;
 	struct clk		*pclk;
@@ -113,6 +112,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	struct ftrtc010_rtc *rtc;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct rtc_device *rtc_dev;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -160,29 +160,28 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev->ops = &ftrtc010_rtc_ops;
+	rtc_dev->ops = &ftrtc010_rtc_ops;
 
 	sec  = readl(rtc->rtc_base + FTRTC010_RTC_SECOND);
 	min  = readl(rtc->rtc_base + FTRTC010_RTC_MINUTE);
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	rtc->rtc_dev->range_min = (u64)days * 86400 + hour * 3600 +
-				  min * 60 + sec;
-	rtc->rtc_dev->range_max = U32_MAX + rtc->rtc_dev->range_min;
+	rtc_dev->range_min = (u64)days * 86400 + hour * 3600 + min * 60 + sec;
+	rtc_dev->range_max = U32_MAX + rtc_dev->range_min;
 
 	ret = devm_request_irq(dev, rtc->rtc_irq, ftrtc010_rtc_interrupt,
 			       IRQF_SHARED, pdev->name, dev);
 	if (unlikely(ret))
 		goto err_disable_extclk;
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 
 err_disable_extclk:
 	clk_disable_unprepare(rtc->extclk);

-- 
2.48.1.711.g2feabab25a-goog


