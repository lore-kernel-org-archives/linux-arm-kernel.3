Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=; b=mfGCytdLavA8bNqOipi1HF8mfc
	yh0XnkBU058f2YryMYpG5sckiKIUs4HARg5dB+w7E2uJN3HlIOH6BVPQVpSaDrkqTZExfa+Qni32o
	wRlTRkn/Cq6AUxEPecAMO39bzZzvlZeIH8P0nc50MYrVznFVMwWrEhNKzj0dCxEbiQiCQfzoxoCKL
	YWK9q1+9aUtwqsb2UkouxXzBxLedaxfxyskdTmkk/Z/SKgAaBPBmGsaBvgEJmMGRyJ93uu5GvYSfy
	AzS2aqy+N6ByA5mX0Q7lEukHoRt0S4zWDCnbKNGd58FZcS2+Rh0rb9/9VU/Jbq+J9hHTufpo/GHUe
	dlkAtEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbIR-00000002BTG-1rur;
	Fri, 06 Dec 2024 16:35:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEO-00000002ADS-48uA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:07 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53e274f149fso2617283e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502663; x=1734107463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=oKT9uGmUWvsupxgmEMebfD8zhvFhR+J7axPfIuTycsrQVY/Jcxt9Henvfhif0bDVfQ
         lQOeBz6wljqM93nd5YL9+H7oFJfw+y9JxPmORgcr9sCZ6aPceh8wMl6nKf0GO1/GfZOu
         AWJHs7RTpeZqNy3eQXpC4bDcm+Oo+g07h0aCLVZl8PxQCpLIE6KwNt/51zD1C61dIsA6
         AtEoPn2DO4Pe777wD1JtDcmuZpjVRwY4fo3c5sTsfGnRJz/o8YkaiQMb2gG4L23fFMPP
         BiNxMI40Xe0za4CvXE0hxiTMoDYC8NZtbOEE0WjQKnxPQ4q2QRiEoCiax7LkuO04tY3y
         3Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502663; x=1734107463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H11rnIjZ/6A+y0BhElAhFFU5gZO2NZydl8Xc9FZjLpY=;
        b=VLZS76nIPHaeBEjZ/O4zzhR7fA2VgbxLHa2Gt5p7zl/6dfyp+QW/jE9ScPnRJt2PvP
         m7w6qONPGf7Q03Nj1OQi1C4poafv4QHWuSEoaGiGaXHhBKMQ1EGf2I90lkdeTuqOPz+d
         CNNqNwSHpWK7hiv0JIoww8wvF1k3zBbsnaY4jAJQVhSNW2pSAu5DBVf0XQnFiDZ9zZgC
         mIdE0kBCXD5UMUBJ7useZkEU8MfDJMCYGcAQS89Db2Mv+Fs+k4WmlR9OVXZUMBkZbTyn
         +GeLroCDsPm5DZLucwNbPpIOWVYusn7hnMjwLIOm8jWmP2jzlrjbxtJSnwmy5q89OjN2
         wN8g==
X-Forwarded-Encrypted: i=1; AJvYcCUqgD/YVFikTyjULZAzD50JnvxbKi/9dECNDvVYo81W1htKB1ua91APYMu3TA/A3o0+dyH+R4iXNicJCiYA+mG2@lists.infradead.org
X-Gm-Message-State: AOJu0YyXdbr64FtMWZlApGqdtrJroUGndIwAAzpUH2Ad9UNZ80vsbZ0n
	sG5mtTvdJk9qYu0SCYACmdadI4Uh4f4dLL6voRlYe4/m3m6uUsgdW/fhA8w7hYA=
X-Gm-Gg: ASbGncs6UpYZWY21yhDJU4+wKbgaeCXpBfoXU/3tajZYDcfRD9hsME3NED5TAAS2ZT2
	DdWGDPj+Q6LY2Qp1zPkEXnDNlGPhzYM3uTqdIrbT8CQUCPpLRnB4MSpdMZDG9SfgijU3g43TIb0
	EJ8RLdaQLL70fpt0Ag47VOueJCl3Am4KRBmX7omp7H0jLCTAUrVvyTqndNHjAYVio85dLlTIj0M
	eVIZlHVbz3tJb7PVOMUh4fhp3V1dtFYv1AGpgvpF/J68ijMnfImM1QqlG9wzWA+WmPt0PTuDLhk
	EGKmT3yIYdfYsEUY+IAhWsgFG9XDV1vZYw==
X-Google-Smtp-Source: AGHT+IExkzoUN1HflnT9opUQAW9MqmmpGeThLHiF2BwdjV6cAu9grD1ih7bZFlXxIc4t4D7GinRxbw==
X-Received: by 2002:a05:6512:ad1:b0:539:da76:c77e with SMTP id 2adb3069b0e04-53e2c2ac7fcmr2130253e87.5.1733502663241;
        Fri, 06 Dec 2024 08:31:03 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:03 +0000
Subject: [PATCH v4 3/7] phy: exynos5-usbdrd: convert to dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-3-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
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
X-CRM114-CacheID: sfid-20241206_083105_017689_9C9E4F03 
X-CRM114-Status: GOOD (  11.51  )
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


