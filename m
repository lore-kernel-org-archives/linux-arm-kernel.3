Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345B7D609D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xK1rXO8tid7sxZflvw8Sl0BR2j7teaHPSp5KtJr+3E=; b=sELHHAeWdPfFuzeppAgIruqTJT
	7/qLn1+DMMRBNA/9Ug+kCvB6F4zMrnQkRGj+4kDSdAWjv1vjHF0Xuh1u7A/aMq5C+S39I3pxmxFz0
	W3xw8B0kPX1s8pLxTK9aD3pd7vNuSJsr2cFIPBDWO/eq3iFlVbxH2R/Ui3863hXj5T0MY/5BEq568
	PelrcWSxD7Mb09YWuWmmY3bqM+tU75eX6ATGghAQvFGz7HaEwvEN61BNkOvIVs4pvdpA8mVDnCuEz
	GfYhk5AHOaOh4Hr7iSbHGG+P2KtV9CObB7QfdxZPMZZiAMZYWZt51RlwYBDZP/Yp6YM/yPIh18tH8
	1U0S5aog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFp9-0000000CwL7-1lOR;
	Wed, 27 Nov 2024 11:03:11 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkO-0000000CvCX-02AG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa52a5641f8so656877666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705094; x=1733309894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xK1rXO8tid7sxZflvw8Sl0BR2j7teaHPSp5KtJr+3E=;
        b=MdA9Qf0vLqkvbCo2x+avZcoUtsEA+Sc1PaNAFfzAVeOqJ6c2Jr09j22BY3xijthUVL
         RhCYqVvIudEO7MPClgiABCcVwv8c3+c440PuG4dnC3ujKztpNg6g1YsAm2wjXQ3mfgWA
         RbazqN9p0KNkLEo6S47pdQfCFq/wnijIpb765xabi/QU6IPjBy0hJegss4a3Rn6+24b4
         g5Ex4/mN2cTma0kITdL4RlKG0HfLAXg6PD0agVdpqWFHhZ97DgX3NQ9Kuq40tejPzIAI
         4A4fsq1Xv6OHq3mKU+C3HO84z2Usue+Zo2r10C4QCuNmxpXsn4f22VYXEA6iYKwgvHW7
         4FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705094; x=1733309894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xK1rXO8tid7sxZflvw8Sl0BR2j7teaHPSp5KtJr+3E=;
        b=e04iYqdNABMSnBnQrU7WxHOlVCkXxGT/58mRZRHHNt4pjEF/x2zqvunZ+yWEYZ1pTX
         rYgvjWmtT1cficNkJYSnMWoddWZKQ+//cUkxhakd7uV3EuEPqY2G97Jyxan7QrdWh1l/
         JrrKnW/S8OBFmuWiuocQw1GQEh/RdgrH9WJ3xaDfhm+yhw5WPdsEwvJJhfM04pljmLTg
         HiuwZByrL3UU6NGuswbkF0qSDDOCG/KFPTXtA8ZkQAHPre33pkzPr30pDb3eBnASmc2Q
         Pvfjn9LsZYVVvQttEXihneAuqo9db7oP/BzB1As/wAnotVP/hM7uHozBKbF9LcmoQcdz
         LVNA==
X-Forwarded-Encrypted: i=1; AJvYcCVthiGiny0r171m4fU1nttpzgweFjUd0e7L2WiV1CYfzopa3iASKyqdv5BG8H32t/vO/ASie0etrd8VqEPsthKJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywid/Ek4vwr3otrYMfno++XiXDmF2BE9GSFFB/1QCmIVG9WlM9M
	X6Ej/bZZV4CPUdKCrclnxayZXDznZBHtFiHK+dGTRRhMUFyKi/5snmJ2sm+B7Is=
X-Gm-Gg: ASbGncuDh2To6BA0I1mIg3tL1/hU6f49Uvv2pTFBMPJDbAigkljSsSX70joRf2MePAQ
	tlZjnVRH5s2VjG1ufh1SUVTOh2RMhUUdNzua5zamo4Y4WAVi6PyovIxUDlXuBa1epkCfQy8Vee/
	ECzZiVcW9IeT0VLx4+KGyrZ6Es8C4Q+aQ+JF3OFCkK83gxASL8PbKqJnzzrORom6b8K5pvG9JLM
	AYvuwqo1qD+U8Jh3I2VR2XBIdvxkdaey+xTdCxq/H3sRiv2ZzCn4U5FwIZFGZcqrOqZd1HqFXPR
	VzU5SDFRD5I9s2X3W5QcHkIonHY+6nl2vA==
X-Google-Smtp-Source: AGHT+IFg+ahvle9uWHq2KZqsvbKtQxnkarL+5juw3kuxAh2lY4VSQel9JXoaUYp7iW98tOctHLx83w==
X-Received: by 2002:a17:906:31c1:b0:aa5:31f5:922a with SMTP id a640c23a62f3a-aa580f1e0d4mr204197766b.19.1732705094209;
        Wed, 27 Nov 2024 02:58:14 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:14 +0000
Subject: [PATCH 4/9] phy: exynos5-usbdrd: convert to dev_err_probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-4-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025816_068479_AEF82871 
X-CRM114-Status: GOOD (  12.16  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
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


