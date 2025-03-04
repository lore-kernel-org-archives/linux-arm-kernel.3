Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED85C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=; b=Ac8dgwbvJVIZnA+hykUlHOB31z
	nXu06kuagcauO/MTgYsgGyfiQLC6EN8krchHxEg9lsVe/AJsxVwgL98BBnV7oqNVKcSczJxYvHKBM
	0/m5JNAklfZ7mWGYT+VCQi0uX1YTT31h6uBFr/0/2+7JRo8lKiXhk2oPZGHEWwStEygApi1iAJex7
	raD8nU0DGACEzkjb2oDKMHq7r/fgnqqLoEgtMTr6FhbK7ZsLCx5GHTAEnrtFun6VIbQlXT5m1YJ/I
	Opmwuylb/Ki0wMIlG72McWQlOhE1ow2/wqRtFfQaRCsKsLSbSa8oQDQaOoT5i4INaqCJBHvGfmHfe
	aV6QN6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYQb-000000068Iq-3s7O;
	Tue, 04 Mar 2025 19:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViI-00000005YHA-1vgL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=; b=ANOgTmjQUFGR2Q/yc+CgbKjboX
	iQ8Vz3WU8x+H8+20dQoiWzFF+IGF/SvIGGdxmLp/Jnk29Jf0hCPlWAFrkbcANxM+OWS+iV/Fi3Hnq
	h+OupmOmJPmB740bFCsQuOpcTy/7E2kpiF1hcG52eXfGDVX98xhe6/xsHeibWbNssXerYb0kp376Q
	bQU5srau8DPMBq2Dmxx2Quoq11vQ8viOdsChh9mz25N54YLuyEuEMV2DE8LMQf/Oh8h+AcUgtfyx3
	knjYpb2J+6qljm9HEgyMkpG+4b3XD7idIqdeV+KaTsDl9lj/lJAlIDaL/6R82hBMHz57P3DMP16Hj
	uljgS5Bw==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViC-0000000075G-2Lbw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:46 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abf48293ad0so587734866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=;
        b=EE2OgQlutDc7K1zO5JyyjECN8fM57xCEZJHv0GnxImS30+jRC4hO3NAtU829DcU44J
         y+R99mNtxnWxBf097AayPnq/eGWoerqW2jiwtVEGSjQTxCuGyb1PwBmF5ttp6pha8bOl
         3MxD8G6Cg/Lo8tWBdrSOXep62pQfZGSXXR5WBIXPLlmp/NaIA+apjVWqZ5EvCfG4SNLL
         WmZLHpeSl9cvy0jL7RhXcvfzddOATrvq05Rn4rTjBoAroz1KEzX+gTnc37020lKPYSZy
         qv0sh+4e4g12uK6HVTCWqmyGElId85xUN2YsfCIxCX6TK9+/tHZze9aY+8KV/GAStFKz
         1CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=;
        b=PK361GnQvHQCqWltjb4WcHhdMH60G2No1t+MdXZXHZNApNASCC9fccRT65r18Gqif0
         /aDX0SxLINWYEp0hGhROG5+hG2rAAcOzaKIFIJp3p7QTLi5Ud6P/dMkyV5wdX7nGMjzf
         EuHlKPL5epaSHZCs8CxrUoUFgIGoZpnFfdU+YE/yo6TFEpBnmsk0qKEkifuvdpUkU9Lv
         t+FJBgwXmYDFVCfSjvyL/aYjeMwH4UzVkaqS2kHX9hXdbew3gzixOw8S3tmIv6XTz4KE
         k3M+YyW51LrTLeJHNZ0Xf4NrxQELWupn/I0ksUAks49UjK1sQqAKG3Vujenx0HDLcDhi
         LfLA==
X-Forwarded-Encrypted: i=1; AJvYcCWKjAG/oLJBilq/XetQxQrzYJGgUwsyt/WBCYX5Pu9g4cEWx8WThYpe80pkDjRD1rdWreHU28JaIVdnMlE7rzff@lists.infradead.org
X-Gm-Message-State: AOJu0YxkFN8SNIW8azorXKwIJQmrBPTNHLZ/nDiGJdRcGrvM2XCcFeEX
	T4xnQa0rFR9jfOuRxahvFB3fk06QXtAbaiEb1FfBWbBpsQU1mrMNa24Qe2E6tdo=
X-Gm-Gg: ASbGncvK265rPch/WryluQIXvBQumgj/g8jo77o5bLx/HT5EwBSwbaCsGi3PjMPjNWr
	cDDO1WOOPccNM1X0rJy2+++C5yax+Ut4A6Hw334Zt1cR9zZ7ifVemmWdTuoHNanwfRtzv11JWw0
	9ZuOKLyjV+sa3DyrZrXn8VGeYPmI5SCNn/4xaSzoVKCT1QiJuRl8Za1JbtsEgheno1YXB33dtYP
	99dP+fX78ZuvSiiw707yKwZEU8O44/2kZ8f0UoHBJsHvNMzTyjBlAUohJzjkX2mK7aj8S36zgzz
	XeNlL6ap58V7ForY0vp6IJNiRCd+HdNa7xZ1SIHa03JAAY8gDDfwURj2nQ3pBvHv7E5/uowtsxj
	V+Bir7S43QY5KYbkgZ3/zA7kWcMde
X-Google-Smtp-Source: AGHT+IFbhvINfL30hs3YpvAxvNGhpuF08a7SPp+ErND7dZCCpi05AobDmHrT2jaUznfQQ+NeOSHQXw==
X-Received: by 2002:a17:907:2d0d:b0:abf:777d:fb7a with SMTP id a640c23a62f3a-ac20da97c7dmr2947466b.46.1741107942351;
        Tue, 04 Mar 2025 09:05:42 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:44 +0000
Subject: [PATCH v2 16/16] rtc: s5m: convert to dev_err_probe() where
 appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-16-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170544_918201_5FD9B643 
X-CRM114-Status: GOOD (  15.19  )
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 50 +++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 88aed27660348a05886f080a2848fcabbf9666d0..db5c9b641277213aa1371776c63e2eda3f223465 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -626,11 +626,10 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	}
 
 	info->rtc_24hr_mode = 1;
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to write controlm reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "%s: fail to write controlm reg\n",
+				     __func__);
 
 	return ret;
 }
@@ -669,26 +668,21 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		alarm_irq = S5M8767_IRQ_RTCA1;
 		break;
 	default:
-		dev_err(&pdev->dev,
-				"Device type %lu is not supported by RTC driver\n",
-				platform_get_device_id(pdev)->driver_data);
-		return -ENODEV;
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Device type %lu is not supported by RTC driver\n",
+				     platform_get_device_id(pdev)->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
 					RTC_I2C_ADDR);
-	if (IS_ERR(i2c)) {
-		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(i2c);
-	}
+	if (IS_ERR(i2c))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
+				     "Failed to allocate I2C for RTC\n");
 
 	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap)) {
-		ret = PTR_ERR(info->regmap);
-		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
-				ret);
-		return ret;
-	}
+	if (IS_ERR(info->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
+				     "Failed to allocate RTC register map\n");
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
@@ -696,11 +690,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
-		if (info->irq <= 0) {
-			dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
-				alarm_irq);
-			return -EINVAL;
-		}
+		if (info->irq <= 0)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "Failed to get virtual IRQ %d\n",
+					     alarm_irq);
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -724,11 +717,10 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
 						s5m_rtc_alarm_irq, 0, "rtc-alarm0",
 						info);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
-				info->irq, ret);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to request alarm IRQ %d\n",
+					     info->irq);
 		device_init_wakeup(&pdev->dev, true);
 	}
 

-- 
2.48.1.711.g2feabab25a-goog


