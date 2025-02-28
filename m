Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90020C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=; b=FcQzl3grsXOiVc1RdoGMCeyXrT
	JycWBIh+7ZI0+8WklQMLSG9HFGXaHAo+PjHhmhme0p/rJG5kqeE3/r7PPp5+mxBS8VNre9rxZj2s4
	f6iu7XACAiBq+HuQ6AKrq/VBJVCFB/+Z3J7nFwxEWLjlW6e+uK0gYW0/3xEOlkAQf36fHPIkt8w33
	RPRdA420vMqJKM1EgCtkayIP3cWurBk5hNlQA6Fxm18RgIi5zwmIIU6FLJk35rkUVCioPSk2YsHZ0
	H80Ad/nKcWkk+etQb7xKjVV5Occ+i+OY5FPA+XKvbwdueDidOFajL8zxnjInZoLiy0uJLg3z3igPG
	CmTNo+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1FT-0000000BF56-3FQl;
	Fri, 28 Feb 2025 14:21:55 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11U-0000000BB7I-1bNn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:29 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso3239658a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751647; x=1741356447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=aVcetOIQHsUcyIeSUA7ovu5xYQAymhLIBjvDdHoVM4DkeqHws9LSRYQFQLjDA2RxDI
         0lAMT0wfcc0y8jYudqXaZUGp3QIGN7gEkoKxUgA1F+wJik1kNXEiklFkzzD0h6MgZeLN
         13mGxVQ0JEMOBsdjCuews3QsPBzwWyzo06O013+An7I5FMoaAzc4gUhPd/UYJnhFLy1c
         Ef30Q6cQzE+nrLNB5sSrhNateSfrbGOFsmuEI4FbofAhbx8Avk1jWarjAOrHGIW2EjTd
         /Lob8Uviw9gas12/0pCMA9MJFNfxWcIgjBGk1ECjHR/C8MNVp0u/aexZpBaZUPalOMvM
         74/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751647; x=1741356447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=m5nhDVjEvyWBvNeY6boaWZXOXJx1F5MIn7/x6qYguPM9hpzSQcLMh4f4t6wy6p+pr/
         D59Sq2y7JcmDlrw9R40GDFzEj7ToQ9eWEiOFwu4H8jIZpZtAnUeg9YOQUM5WsES8SEpC
         75t0alup+cuPq2QIlmU3HJgsF1XK/h2ZaOXS1tVjas6I4FB4ZJt3umbIlnCGhRyLrkKs
         ItOYEySR9JMCG9TiNl5+u8fwLkZ25kG9ecfasG2f5yD4r4BQ0rpjzHcJoAivoiiSF+XS
         +dRkAm+rvxfLS+zHQNhHUF2Ah9LW5t/nWLOjZFeakmJRBLg6ZR6ynC4jwnz8rk3AE6lY
         GTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELQ6euQZLh/guq28hxMuOhMdRI+HixdmkwmIQUic5Q2oD2cAYhr5z6CTJA+bKIw1kmKh1FF0Y146XbIi9K/1N@lists.infradead.org
X-Gm-Message-State: AOJu0YyjR54cx3+3vdbq+77bpnR768jgZbuvAQFT3OqQyDcBBPOQzQFj
	v1FAkZGiaRm+Xb0y815eJa1zUaiw+OxuN3mPjsZIbFnvVK4sn9Kl5w4N5j4mwxc=
X-Gm-Gg: ASbGncuwJo0Mb0mkLJ61vVeqvXY7sE228F+XFsGYO9nNJ5bUnKYvYRa+tF//0tWqBn3
	+gnuj/xXWBoAzCYK/gr2jqVzm/jAkZai9q0PcL8CjeE+giudXZyj3rz5uzt/Ed0YOMhjhTN7S+H
	A0pQRGkq2LLL7jI5JAPUEb94ndKOg30nEd46F2wSdxMbfE20hdpy/pGNfmJG21ska9ch3MIV+Hd
	60qPCOSnX5WExm11xM49a4m0apiSLnPVdqHPA5txsyzVe28BktRI+hWG7BN+VEGtO9ki3YMmbYP
	h/MqPneKLfx5pMwtvUoR/ozPmpTzDupvK0qajz/q/z4zYVjWSzr1sHOJBBhRA5r8U4a5/djXyAx
	caOYwV1i5UA==
X-Google-Smtp-Source: AGHT+IELhJPOd4W0qPAgNgABcD5moXsKlcKW8ZKlMd0/6RuVXfSWqRkHz67gqaNmak1AZcnDjWmnpg==
X-Received: by 2002:a05:6402:50d0:b0:5e0:818a:5f4d with SMTP id 4fb4d7f45d1cf-5e4d6b628aamr8322653a12.28.1740751646827;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:21 +0000
Subject: [PATCH 08/18] rtc: meson: drop needless struct meson_rtc::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-8-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060728_433054_B81996D9 
X-CRM114-Status: GOOD (  15.54  )
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
 drivers/rtc/rtc-meson.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index db1d626edca5fbb590f26c1cdd0774d350244a99..47e9ebf58ffc2f2b6c65932f8ec3773a213a62ef 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -59,7 +59,6 @@
 #define MESON_STATIC_DEFAULT    (MESON_STATIC_BIAS_CUR | MESON_STATIC_VOLTAGE)
 
 struct meson_rtc {
-	struct rtc_device	*rtc;		/* rtc device we created */
 	struct device		*dev;		/* device we bound from */
 	struct reset_control	*reset;		/* reset source */
 	struct regulator	*vdd;		/* voltage input */
@@ -292,6 +291,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct meson_rtc *rtc;
+	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	int ret;
 	u32 tm;
@@ -300,16 +300,16 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc))
-		return PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->dev = dev;
 
-	rtc->rtc->ops = &meson_rtc_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &meson_rtc_ops;
+	rtc_dev->range_max = U32_MAX;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -365,11 +365,11 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	}
 
 	meson_rtc_nvmem_config.priv = rtc;
-	ret = devm_rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
+	ret = devm_rtc_nvmem_register(rtc_dev, &meson_rtc_nvmem_config);
 	if (ret)
 		goto out_disable_vdd;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto out_disable_vdd;
 

-- 
2.48.1.711.g2feabab25a-goog


