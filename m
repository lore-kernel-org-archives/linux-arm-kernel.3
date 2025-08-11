Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA60C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnKcEkqbIMfPFHK4N+PMDGhcrN9nsn9H5PP2EHh6DhY=; b=hkyL6P3cPXk4g3onyrmdAJ9C/b
	Gq3F/A/bk+Zea20/mDhObam+jCMM3/A2QaGrMbwO0GZTn/XWVbf1uJDre6Iqe/MjoqGUvYbhnDh1y
	Q1Z7M7/4aBVczkCHAoym3X+k//Xowo3GYFJT5n1t2S+/GSJSztjreQXob0l5VTzWti+UvhqehmvM7
	7UHULyiR3TdDju7Ab47CPYOq6xX4m+uvRASEHP1CNGDHWvatx77ll3IvjDtAEPvGb2cWYUmFjqmeT
	cdOxZmAW1A6/fOkqtquNRkrSEr0sWImtaLN3gdjQt3SeH5rpDd6QePSH8OELiVdecgVHv69KFXEzO
	wu47US1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSpC-00000007run-3Qn9;
	Mon, 11 Aug 2025 13:44:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulShR-00000007qgM-1cmL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:36:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-459e39ee7ccso43415825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754919388; x=1755524188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnKcEkqbIMfPFHK4N+PMDGhcrN9nsn9H5PP2EHh6DhY=;
        b=AbLNcvXSIHYQt8MPG0rvQbww0FhrtLgrdLa0bgwYox0S/q2KOQyLgyd8kOQjvCdn69
         gPqz0GitXZyQ7XfMImCAzA/3hjmNRZxU1dLbLQFFSg+B0tqyta8xVskIRBnTfbTWxLTi
         Dxp35Lm7DbQO2yKLpp6Z9Sra+rAhLrzGPNzBGqndJq/+LMjS4mn2Obcj3U7K+LfUFDNe
         l/f6ITCsAvLChF6PvdDt3xs6Ht5CSBN/t69a8jQTxPH1x4cjihwBEGeaHZN1cbkqiZIZ
         68WsqxswPpSlUy5bmR9GMZgR5iiUlW66zeea0zcad2/m6ZH28qSaJfd4/HnTjVQZTl/F
         UQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919388; x=1755524188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnKcEkqbIMfPFHK4N+PMDGhcrN9nsn9H5PP2EHh6DhY=;
        b=jx8Ju5UjJt+XN+6F3tRh2YRHryNrZqxqXoXTXOU6mhyRhxCIO8I+tsMwrCrNQUWcsj
         AlJ16RaeL5RKXU5vQOfVhKNgqwTqfXHlFoTHXHxYuSVpAPJovpwkEhdB1InJWcCqy8sf
         2q/DQ4mStzfkAzec3jQAJIC8LKUv/EV9GHWYYl/uq4wBYYoFzdDCEewtXwp4jt0rFOCW
         MLe3+FHaO/zP8mLlmVqKKHPUrhsDGOTxqoaf+QZ+ktenaomF6STpKupmkeln/vFgznZx
         hx6v0eZAOsq/EufzHaKvnWv0qXGv3He/i2x1ovWVPuYwf8qmkYtZZI89lsRjohL29u1U
         pYlQ==
X-Gm-Message-State: AOJu0Yz+1OBNPPB0TACMX6as4djKsvlLbJJRnRXZsw1sOaN+HrEyVv3N
	hmtXpSNZCuqOwPq5wtng1mHrHWwEPic9WJukUjAuS7ZSt10zSTGEiDZTmWT5vsTkZDmvmoXD4QH
	Ums+c
X-Gm-Gg: ASbGncuNtj9EUsxFiHcZxdIOsd95HHQB1GXLzzeA1DMqbtrHov173MfuuxqzFYB7AEy
	8PVEaqEqqINynyx6wMHVxWT/6LULvOdmjIruhUUJhNx7IxlBTxlEkPYLmxbRy3htRTwrcHEJn63
	kN006sgSjgxH0gsu2Dkv1Twi46zczzbKqR8GBeQBb4pWp9z7LM78rnDbtVzh8kI77vx7SDjElP3
	njXs+jADvRmOyKRW6oRlUqHZSZj5p6QRko5YGHgsywAbwOB9UOTBxfq+pE1g6hGSMgsfJuxyizU
	dqk1HFYX8fYIGRHbgiTEiECJl7RIUnmkJCEIsZkBhkk506hTx2oG/7b67aUwfUd7RKDZckd1SFu
	EGX9//a3LY3o9BuWyyse6b1KLCu7m
X-Google-Smtp-Source: AGHT+IEZRe5mubxwzfOZXxCLQyUhvG2u7hesb/LpwWxgwrAcEN/2Kgvpu75YBEWiGSMSpRCy9Y5sQA==
X-Received: by 2002:a05:600c:4f88:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-459f4faf710mr105194645e9.26.1754919387765;
        Mon, 11 Aug 2025 06:36:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587d378sm253045105e9.23.2025.08.11.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:36:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 15:36:17 +0200
Subject: [PATCH 2/2] mfd: vexpress-sysreg: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-mfd-conv-v1-2-68c5c958cf80@linaro.org>
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
In-Reply-To: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9ATs1N+RIqy7HQcsjCsQ/Bu2Dkvoga6N4G9979jNyL8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomfHYrwsag5Tr9+cDH/r8nmh0r7g+C82rk2d56
 RwUl4GYmmWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJnx2AAKCRARpy6gFHHX
 coQ6EADdzduKhWY9iLHH/zEsVv5UlqMm1QLwEwn18/scNJbERA+TB1iwReBryX4dGi6GuAbI6LH
 Yge5RV7vzIy1/QJb+RfmpoG3Z4cluJr8Yk3O3rBVknkCl1WJ3xx85cLwmFPeZSFP/BN97wZeM7F
 u94Lhm3ijHi2jJsD5I0GIDn6NAAyw8obWQRL037lT8H4dgke3HX1vHAsEutUWJjR//FixdPQ+i1
 kclU1s21x+DWOtcGer/LILtz4u0LGPrZ2uLy5aRjS5FGhcyY+CmgdKwCoUVWcek5fvtNlzsm6jd
 5RxYHHut2AsZJ8EFf+f8f0qbih8jmxtsU5m0+CNVwfthRscP1qsM1rqGc0X97CPz1HdFl0TFocr
 pUcgMIAr3KQaL7y7kWirFCNEKK25dBC2PK8PRpsBWA1+N5ti7cNR/rqBUG/SRggQVSbwjANCfZO
 Bq2pPCA1b972kH0c8usvFHuvJduQ9oj6PpMd0KYx4A833EZ9BI/xRRhvwmbch7Xg0uZBq/NsKtu
 3YN/YOZHLc9GxQhgcrpiWVAyLaUD0pOtn2QNtwzXMXIiJWZ1UO8u67dZ2sfxIf3rGo81lVbD4/I
 bhnGIWSIMQdp6caE1hHFbx43LipZfVZZUaMFed6B5UVKKjHJbzSmV72woSXZeVJpIITmNE+JbFf
 7CQkN6vC0WXE0Xw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063629_438484_12F165AC 
X-CRM114-Status: GOOD (  15.79  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 77245c1e5d7df497fda2f6dd8cfb08b5fbcee719..9399eb850ca29b0a9d9be2173bee4bcf6888d10f 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/mfd/core.h>
@@ -96,9 +97,10 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
 
 static int vexpress_sysreg_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip *mmc_gpio_chip;
+	struct gpio_generic_chip_config config;
 	struct resource *mem;
 	void __iomem *base;
-	struct gpio_chip *mmc_gpio_chip;
 	int ret;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -117,11 +119,20 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 			GFP_KERNEL);
 	if (!mmc_gpio_chip)
 		return -ENOMEM;
-	bgpio_init(mmc_gpio_chip, &pdev->dev, 0x4, base + SYS_MCI,
-			NULL, NULL, NULL, NULL, 0);
-	mmc_gpio_chip->ngpio = 2;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, mmc_gpio_chip, NULL);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = base + SYS_MCI,
+	};
+
+	ret = gpio_generic_chip_init(mmc_gpio_chip, &config);
+	if (ret)
+		return ret;
+
+	mmc_gpio_chip->gc.ngpio = 2;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &mmc_gpio_chip->gc, NULL);
 	if (ret)
 		return ret;
 

-- 
2.48.1


