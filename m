Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5507E64A83
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=; b=2fRtX7toRFMDQPxsNkGCeOf8Pl
	pRwq6OvDbspGjpvF1k8aX2GfdM1cal6QvGsOjBKL6TC6f8EIv95UeUhxxbdnYnYIZvWlbgzja3j94
	19c2hYMlbtOM/Kw1/a0Z6Hr/YCM7NgEV2MhyPW1AKYdswxIAoZ53mDMnIjPzrOmgiYNQsa2EQ+y5x
	GXiixWIr/RAQLLseEzDiONKLthgbzKWv4FjHEcnxRbob8Tba4UfCoFUOkLOoVskEMdcSoyy0+86Zr
	X9NgESdaBYG12S6bSC7klB1T1icbkXnXIzRTzRPcbaJqwFToPwgYZaFQ3shrbRaVnD4vb9hdEIlX0
	vOpz43zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRqn-00000009OfZ-2sPw;
	Tue, 03 Dec 2024 12:17:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRms-00000009NeR-0HuH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df6322ea7so9352230e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228032; x=1733832832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=O8MCqRie4YO2ExDgGGkkbLImDvgUSK2lY9sY8WZLRPEm0OEzeEDAHBJNMJlUD9fGr8
         S+dkDy4WMkaF0HkoRy69BMBWKFwIWGycpLzVNU+LIS6yRvx6TBwKaCR4CqQT7t4Uis0i
         aO4Hg2CASszi34y/fuWQ0Lvx0Y1B9nWiXZEeCBBzG7+ia/GQbxaP5ePD+8QkGEbNHh0W
         AkcoK2JCMSA2NgfOtThmSnVRsMhWCrdJrkksoCVPHE6nLQcpl7qn2imakbCvOpB5JJGv
         /P7UaDaMu9ivb7WgOgdz97PtB7YWGqpvgQx5Ng+BwZtAjOp7qDBPHmaImCuciszWYq9G
         Hpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228032; x=1733832832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=oHmvqhgy6YlYvDtcI57/aZC/pXCt9+YJ2DDVj3RZ9fb4hQwvBLYx/XtcwMgKTNn0rz
         uNWr7BhMPomw2McwrgcXIbA0gm6veXMHPuGBewb1ssKd7sTz3fAifxjMSuqk8WV2jijb
         djY0lU1C1cEZSUf1T74F+3/OS00sYn0x+zXarnQs7YD8TCdLnVD6pICGdkZi9hr3lXLi
         rzSc6BqyL++DWuyEqNKEhYqomKipXI6ZCQhUCwClkuh1gV5YK6NDL3rXsY09QhHXRQE6
         q9vqrXvPARN6qCQDl/3hHNssU8UgSsuARbdKYNT3r2UqjKpLYcaGLFVx1TJyAsUKTy4c
         lELw==
X-Forwarded-Encrypted: i=1; AJvYcCVNuGRsBnsFmH5L2Udu86tClcz6AexPcHmxXKwY4myWtPvybUwI+toHOPG8dqLX0I0laXRza9iAoCMpwQun4Km7@lists.infradead.org
X-Gm-Message-State: AOJu0YzIpCqOy7KHBfJEhn+TaI30wRLtst/QO9t++crgLJ1pAlglBGig
	9502N7ObZdfyLmRV5s8F3KueHQvnP6lC2RjSUy71aqbeltNH9OHa5MrEKIBe4yw=
X-Gm-Gg: ASbGncuoLwyYWX9VFMuRgzlB/A9yDjr2Ti1Cke2QUzQQ2szlSjX2fKx8ksksYVOJoqK
	Gq0MRV9D1y0kgGpm+rRbwPMrbrsSLf0rQ4F9i3ebGBxR3wBB1G2UdOd3Gzge5v9Ql9V06DpX4I9
	ktggyJhDZ242OeKyU8LVthE14WCaXLUNgd/sM4hd0ISC35y1DLJ2frG8xIOO5vr3TwCoZ0nQbGR
	mj7hsh+CGC0nkE6HDEzopStoi76qcw0y3y0qOjKGWDz3ZxjBv0x4AVLrsj1gJpNrLD2hfIXohq1
	rs2MU/pu7Urn3SY/XkXstrKYduFZmrvUuw==
X-Google-Smtp-Source: AGHT+IHQdMSg8Woe8SDIrFAGgEbEvNlb4MTQhoB4mrSWw8iZG9ODfRvK6W0FE8ok+EwQTy/draIGwg==
X-Received: by 2002:a05:6512:32c9:b0:53d:e592:5415 with SMTP id 2adb3069b0e04-53e12a07a6amr2081271e87.34.1733228032380;
        Tue, 03 Dec 2024 04:13:52 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:51 +0000
Subject: [PATCH v2 3/8] phy: exynos5-usbdrd: convert to dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-3-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041354_104609_669897D6 
X-CRM114-Status: GOOD (  12.22  )
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

dev_err_probe() exists to simplify code.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index c421b495eb0f..ceae4b47cece 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1725,10 +1725,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
 						   "samsung,pmu-syscon");
-	if (IS_ERR(reg_pmu)) {
-		dev_err(dev, "Failed to lookup PMU regmap\n");
-		return PTR_ERR(reg_pmu);
-	}
+	if (IS_ERR(reg_pmu))
+		return dev_err_probe(dev, PTR_ERR(reg_pmu),
+				     "Failed to lookup PMU regmap\n");
 
 	/*
 	 * Exynos5420 SoC has multiple channels for USB 3.0 PHY, with
@@ -1759,10 +1758,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
-		if (IS_ERR(phy)) {
-			dev_err(dev, "Failed to create usbdrd_phy phy\n");
-			return PTR_ERR(phy);
-		}
+		if (IS_ERR(phy))
+			return dev_err_probe(dev, PTR_ERR(phy),
+					     "Failed to create usbdrd_phy phy\n");
 
 		phy_drd->phys[i].phy = phy;
 		phy_drd->phys[i].index = i;
@@ -1786,10 +1784,9 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	phy_provider = devm_of_phy_provider_register(dev,
 						     exynos5_usbdrd_phy_xlate);
-	if (IS_ERR(phy_provider)) {
-		dev_err(phy_drd->dev, "Failed to register phy provider\n");
-		return PTR_ERR(phy_provider);
-	}
+	if (IS_ERR(phy_provider))
+		return dev_err_probe(phy_drd->dev, PTR_ERR(phy_provider),
+				     "Failed to register phy provider\n");
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog


