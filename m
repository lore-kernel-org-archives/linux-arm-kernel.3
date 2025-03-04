Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D390EC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=; b=BL01In6AaB2aycioW0Xts+jyqm
	fdw5hVgs/8DrX1w8tKJ0mkWlSOLOS7T3UUwVHoy4fh6ihTIOvwQjiMP0p+5t6JF/1/+UIVdgP2jql
	Do4wNYWsHaaxLGy/k7xAo6+eyNxifp1qinOwHr0HhWyByrabV4b/3WvxY/YEpUw/C5iQLe9Enz+vn
	IbctlvBHcCPXtdkZuTyR9dFx/rwlZPlWWrEizLv5PA8L1vvVpkjzcCLhd8nmxTuAG8is9X+dU0Ikt
	v3qxp2vqofaVbg24UaC/NmlTxwx2sUf0sOsA1Sm30GwGfOpadH1BOrNKG/ARM+1P7ew1T5775v4Mg
	Ww9KPFzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXPl-00000005vG1-0Tab;
	Tue, 04 Mar 2025 18:54:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViM-00000005YI9-1Wvp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=; b=arwdDrJ5nxUaqiXcnprFNMi6rt
	NyiiJeRBQOQwZ19lYuYOvgMngKdIa2acf8681Y/r0CyLZQubERvC8mOFr/9XaN9TOTWM2IEtJlj6v
	SsHlz9ELkiLES5kCsbbe77RO2s8LacXeaGG0H+uxoMAV+ny5EySQSCE9ufGpS3RYohhpdbt5BQU7b
	w8V9r/xCHs0/nwtVg6c8bUu27Dpve/jJeOIWMBhmjWrEn7Rpzhwg9i63EEwkfo6r/2HQGe4O6r+/f
	4D6QBUrc6xg/fJg0ytuC0yscacn2GQEfUNCwX3Cor7m/+raFecyTjn4fHRZih41025ZxmpJNMLzAS
	8LitMknA==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi9-00000002D0Y-0TjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e55ec94962so3638544a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107938; x=1741712738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=j3Um0OTITg7odN79pu3s5Us+3s8CK0yWy6ssNGqA9JvDSIfcW+qG5HfzEAf/PYTAzm
         J0rhEInhemNDMXWaoRFGoBKjXEwgZ9LjNe5eZndPQvUsRQWF56SBptOKJ67iUCLiDjuU
         DaTnvdGM2oIxyZzkOqO/Ld8d5j8AK3N2UV6lcO0XaD871Ets3iXFyzFYADSYUNBReOOX
         H68KDwO25ZCfy24fLvOOcfBgMM7/KixNVpfGp646dDyQ8cmGhh7y/uY0Nd8h1S3i/fXS
         CRnJER4ybjfBzwcZwsGpKOMztwWDco103srIVBPfGDALtf+l8CWP/N08uo8LtpxXZ9IX
         oZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107938; x=1741712738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=mPmlyGbiNEDGVKHumvVVud66uvNCNufrutDgHk0I1Zgk0PcDGJRbJowBMwc+DforDf
         9P9iMSGcnSjPeYFxz7+YNcRyUHQLgwXoO3fDXVuMSMDC9MzrwojbE5ybxLdCioprO74K
         qthdF18XJ/XxPqvTdCrRQHI0FEdFnZKS3lnZiqHi8x7FggWpoDfuiIkcN84rzPsAieet
         CTfKaBwlXL9wZVM0LPoqY7XRqnF9xIyXIWyXVTBxtsORfR1lXvTqYJkb7REBv8sg6SNa
         FVhxO58ZRxTBgZhlkunlastLLlPH0/dRvG4ZJoqKjRteONntf7mJCPvaFE8BKfX8Wqw6
         nx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCViycQIGKGQmi2ManIeAuL28LVc5Ord/TlrL1g7Gr5Or0GrtOgB/Ct8Nt7hFx748rEo+HHunWM+fkMmu6rEnrxX@lists.infradead.org
X-Gm-Message-State: AOJu0YyS6Frih3SNSM4aAgHrd3nqiSBv3bYG2IV8y6BEk9cYRmUUFRJn
	y5iFBVK/ru9uryaIZvGniqp9LOHGFG20cQUtmjW583Wsm5C/T3F9FDiUHagSwNk=
X-Gm-Gg: ASbGncu8q82d6pT+dyayryYOwvtDdT+3R/FYagLqet55PzBWgeb+8hNhweFsBERv0VB
	vSXCaVFHPCCzoe+NpFFIr9TUFbWeKldv4hNlJxaDm28CCdZcLtYPKE/CyRhf0LDOACl8s8jcg2J
	5h/L25Tx0uIcfZkT3CZLolO/pQwqAfq/QYKLkILgXRZgVfChpoWKiBHiOuFHnrOdODqX3C3P2wK
	J9zdF/MKwJN3Vzor2u3l8900ccOBbq4K4vT8e6IvSKm89bt6w4TNbZLRHGhHl1P/4eY2v1rpnnB
	rYExj2HZq4xEwuZImKNqi5IPE6ds3ucxRzjMW83+FXP+6cgGM+PVeS4/K1QjpE7GvjotW0gRHpv
	Q8zPbGxTTVbcv0oWxFanTj4koZjwb
X-Google-Smtp-Source: AGHT+IHF998NpSXE/Qa2EdiSn4vtx17I0lnFV/wyKnxAJsCHaDM1j6HSEMvcUwtHdnvoXlFd/CgYog==
X-Received: by 2002:a05:6402:d0b:b0:5e4:c532:d693 with SMTP id 4fb4d7f45d1cf-5e4d6b8535fmr16782448a12.31.1741107937989;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:38 +0000
Subject: [PATCH v2 10/16] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-10-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170542_943443_4A6B3C59 
X-CRM114-Status: GOOD (  13.50  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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


