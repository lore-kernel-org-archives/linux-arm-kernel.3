Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D45C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=; b=tlM6qlJvDbB399QfH8my6m79aS
	6ftZWVN2pGMaqZaqTbjuTSzmbJNz1QaJItskozfdN/sVHwva/stNhXtxOsHtL723ybcpsU5nMKDwN
	UD8rzme0/gO+GIizGIrsQU9/1h65TU9OLuC42mML0qAdM0qMu9IUfGtsYpA+WLB3qoJOCF8eNPWcf
	KAiUWrwlYP8nJa7C9Xzq1mYkqUYdYSUqPVrzJlVK2d064PfPXNodtQZyGzcuYs7JmxRnzWryn8ZXe
	f79x56eSNzebt5D7Hz4pU4b6SlZMvYZKPrFncr5B5yQmwBeZnMpwIcEr0cGfiq9yxNA17XnUmfv0f
	Pgy74ZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXI0-00000005tXy-15z8;
	Tue, 04 Mar 2025 18:46:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViG-00000005YGd-3Hbn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=; b=keYM+f65vDh+BwPeCuIDv38QRE
	nOTg3qv16kkH/X/UQDV0sn683ixzcqGaILoxXUPPltGF+ItpDfFm03b411QYb6UAon3sYFa+nJFF9
	Ag6TQFpCx++By6/zG6yoJsudy1+o56OLSrmv086EOg1wbvs1JyYujZvuMooh8o9r3hKYo4ScRvUpH
	x65rl5ycrGkD9v4a0rbgiJ4D0DcZ9wKyPEHIBOHUe3AdWGsYlZVkNPyeEsSL+jdGNvRiVHLOaBaBW
	1DYlYxYCrS779pj3fZoAGwifh/U9uwUbQS23dpQTj5aeUVWt8faG0Xv3laNvPzEsuIMXP+1dliAOO
	AhMJjjwA==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi5-00000002Cxl-1uKy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abf628d653eso467227666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=LE+eh+IMTG1vJanP3LeJtNRN7CWgGUjkzdTVt1r9Iw3iQAOkp5QtV0hoIAaDH9ExHM
         0+EnJiQ5WpFuRx5zc5yyAXOH5/EemTAnI8iMsCALshbLOwBwO0oBihjBPxLm63lBhwEV
         JNTEn84o2CwyM9mYUxR7swcde0Zq90LnO0BQQD8LmN8YgeNamX6qf7/eaijiVdaA2jkN
         Jw/oQ27HFXEhoRt5X9zBhw41j3wXcMnYjqbE3arsCReRyx9PnbTVx4sw2Olg6wFoRip1
         +SiHu7X6OQO6fosBb1G/wWaNKNvjUov9YqszJIbrhW3oNvypKfcvQtdhFhI4LMW/A7dd
         W37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=qRskdGZqxFOZjSmmoDviYDsnyHaiR++5utsf93pJuJ7VzLwfxgOHbSYB/IGluoakqs
         3Kxgbt8yLsji3R213KHgnfxClMbJQavWCPK594dIexQV+nij1UPgQXlGTdU5ucUOsIc8
         ZoFbOD3IVtDrnVqakDWtStr8ACC148h8u50VEnvKXngXFZmHP+aSeqHy2MJNtUb6uO1j
         ZyYGKdu3I6sqXo44+PY/jWvejpdttCkA0pVLGfnEiV/ETHkwZJ4Dv4tjlTgWAgyVNGit
         UwFy1sQpPHNXcHoBW2r0WZHAviljQVkqzRn2F37C0qcIe6M5VpqSXM9T3HjLtPgSczso
         /QSA==
X-Forwarded-Encrypted: i=1; AJvYcCUvLCembhPOq4eSlBms9qqdBnhr1rabyvQnGlR778s7q+1Xkr0bHyW01W9vXvSYVPFnjZp9sSTxwdoXnCdd3V5X@lists.infradead.org
X-Gm-Message-State: AOJu0YzDkEzprA6A1RZMAFr4Mqe/1qVnGsnHhfZQE1gAv78JvJKHzmkl
	ccOLBUUD84nWL+GCeoaJUj7KVRIwH2nlChalAzFt9AzXRAKB34Jkd3ehZRzmYms=
X-Gm-Gg: ASbGnctcssbWsggHnspkTXlSplzH9rV1hB3IQTskAP+pHurxo/d3DF1707mCdZqb1iC
	uG8o90kN8tMsK7sSn/X8r3BZrGJGBgqpgY8T1jg+8e/puv8bVCzMcSjPFkTH9UD0XGNXLyeRkvg
	Gmox5egKhMBTii/4pw+ojA7EPOBCOE9Uaxpn6uohvSgO+okuwjGD5cunPE8n+wL/wDKYsFQutk/
	lfi4fTrwYUjjzm8BDavtxeEmfGq6OrY4WfDCc3Spo90YT+lq4Ekm8l9Z9v14ETw4LhcjcVAvJgs
	DsXwMZhN5XlhQmtWeEmWtHhrGr3uLmJb9mILCX2KX6WkT3uGQ5Rcpr66+DnNuvzVtW6w6rU1quS
	e2a3m8XuNgqlitWfNJ6GTEG40US5P
X-Google-Smtp-Source: AGHT+IFwDsDh5i25qijWXwIP4x1jml1OHqbOIRoS6nzVQBGxqFZ6SJJ2B5idZS+kqD7e/PzkpEaGBA==
X-Received: by 2002:a17:907:9490:b0:ac1:cceb:d9b0 with SMTP id a640c23a62f3a-ac20d8bcf0bmr3896666b.16.1741107933256;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:31 +0000
Subject: [PATCH v2 03/16] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-3-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170537_952667_7971A7B5 
X-CRM114-Status: GOOD (  14.81  )
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


