Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190DDC282DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=; b=l5jXqwjE++tKBywfyBBhs/i35u
	HJvG+qRdtvlGscyhvtVlXlnN5Zp6K42/3WYnBbihUy21J3rq5X2k5+sexAQFsWAwHcEU1qy9sIMQc
	AGEhNBrdHn6cAtRd4rEfUUrcA5+YxO67c4uVzRlOOyUkE8l8KXwIG+hdLLBhS0HtGHrCtOMwDB4x7
	JsqoH1SHF1+isJXM8+hdRih2RlbZkvFOytZDL6R2en8UAI97jPOTPC5q01LA9lUffSgbX1cyXoTHa
	JksXyuu1VseTxGLPxM8cHjIkwHEr2UgD/OXl3L2uXZqmW4dCRR3WTQmueKxUCb+urAYMTvtbDOHk4
	5ir39MnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX7D-00000005s7v-053i;
	Tue, 04 Mar 2025 18:35:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi6-00000005YB2-2fFt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf57138cfaso615833566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=ZTO6hmwCTp1YpKlqKax098pS5kZUJQHyYPWj+h3D/hz7WM4xSm6PkQuouMdOxF3usB
         i320238+yKxF0X9yQGc51F88qHAvEhax5SeDeEQQhZse/S2se+4UMtn3Eaz9D0r01NiO
         3kbPDJjTx0xet3Lg1dOtQ61N4lp9h66+9OGKbZzS1vj9Td0Mfs0AsWC4c1Dv8ZwxeW4x
         VzAeVlxO+3zTAyHpATi8j8EmQnKRA2c66EpI7u5IGZss+1uq7zujq6ArjujQgukzJwn8
         xVXAGVgBg/FsCF1e5fwBBTQ3RIfG0A7edfMlazDdPZPCosGX3utOf/JCHoi7zr/yPjdx
         sYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=Sx6HPI4h/4DHO46K9c21biVa0jXzmkUfYp8QQRes5AsZT2D46og2Zyx/JY0+U4kGOb
         M7FHv9whyGcjskTqZOQXKG5jBhp8rZ2R+6twAPyvHJcyN6PfVRgDw8fmGuabbXQ6Zpx+
         fGPCKrdHxPLkhv2kxsgh95FSthtI4O2zHgUutfYyLTG2aWVcnQbAflbZqvz96tHnLySj
         STjBQ5WXyqcoFKXObNTtEqvOiAH/xXewJJiiryjToU7pDZ0gfksmYqX9D/lfWKoME6+k
         5fvEMvJBziCEQUIP7566w0Yt2C8G6YHQK0uniZCaXaDpTaPKxo9lalXaUJAYt/3FFFJ1
         /mSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6YurJum/rBzd6TwPnEUAzrd/QblipRkK5t69q7sQLc5L7rCiJvU3CatJ92+KX3QH/jd7vBBOQC3/acacAvWOk@lists.infradead.org
X-Gm-Message-State: AOJu0YzeIdT1qr7qI3CBGaGl5BDaxsS0l4loVt08S4ec6pytLk3RKmkK
	EhIVqWyzuaHk4Vt1tAZ3k2IgcXJuS8pt6SC8icIqhInGQC8GGJl5jl5KAqXznXc=
X-Gm-Gg: ASbGncuj74YywlGuR1WsyGi4YNTm7P5QgglDERN34I/3f6GsWrYnkqu4AoBWHRUAd/o
	nHTM9XoGb7BTC/eAPMHmqKjfqD9IYsFBb2eDnBvKuAJHYtk79eN9WugOmtWGCrUplrWn7iGxFxL
	NKp5+h9vrd1D17sq8L69ks0rFM+Qre8DLu850pufpsZxPK9URV3EEDHhMXLyvoMVD1saxXeCtas
	xLylNeiHSTzCqJhED6Um/e6YPdqWp+Uq4bNftoGfEyVc4Y7tpcuf7ck8yA1mwbfE7ptdcAFPoo3
	nqK8WboLLjZoEG25Oy3HRBlblXAXHOH5ZYdVqY+CqOGDMxN/hrYNOexwo62T0ctmHStKNDLVKFT
	BJEddwH+JRONht0/5xLnSfIUr5jfy
X-Google-Smtp-Source: AGHT+IH4UfROsxQRuhFhpuKVUGIkJvl9GfdlUj4CrGm+kiSC0tb2f0MQezXBSz1TfcCGXXToQh+ymA==
X-Received: by 2002:a17:907:7210:b0:abf:778c:58c6 with SMTP id a640c23a62f3a-ac20dab329fmr1852966b.16.1741107936481;
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:36 +0000
Subject: [PATCH v2 08/16] rtc: meson: drop needless struct meson_rtc::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-8-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090538_671142_45554775 
X-CRM114-Status: GOOD (  16.16  )
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


