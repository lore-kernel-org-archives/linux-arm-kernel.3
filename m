Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA94C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=; b=vjd1UHtD1LMadLi0gCsueKp3df
	x4/bsQKi9gv1MsvZAvl6qhaKjgIwgeCsEy6PHI2LfJuTlaI8N92wx6CafbbXVVkTc1EcyAnzycpBW
	4jLnP37MlEzBJ0wexkAZrTBbdBeT+7v97/pQXyZYC6HWi5imMBTyaYWWuRUh6e7DWOEgD8085pJ3k
	r6HNnCXrBW07bRN1hlm2/Or3TJC0SOLRNpxjnZwLpjgiKdrc70UoAfnrPiuiU7w4S+IgSxcnSCl/g
	7nLFCxuLn06doVybvOQTc/rSHv60IkVfYfiYxMNJTy/YpsaW8jBBk1a54Cppvjux8n4/9L6pd/5L7
	G9/Wez5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GrO-00000008PIc-3TlQ;
	Thu, 03 Apr 2025 09:27:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPn-00000008JlG-0Yzg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so1078251a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=lXfu8klQkN26iV7clgteIOEZXTdKZAHALJ48Z4Gp0scNk5I59t0VMI1hSq9O4OtNE5
         gvcq/MPMLSS6quRdPBSKT74CUPdp1aREImfY4G09fw5v5V21Q0UPskzPdSh8oqtVLQk6
         OAx7HGAZ1dkgSw5mu7tK8ytYfXzjpXe+TrdkGWJlqWkNovYG+Y5nguJKZqeL8a8pYNkD
         HYSsEVdiDkNsSS0nsWj2BaHLCtfAKz4SigwAq47kmGE+8EJ47jXwUy0fROfk5ZSCjppZ
         gEes3gwX0WL2WH1AHZuHN0TltmprawccxboMd7fMipxfYhAECx7+n8YGljE5xqVWgr+2
         iRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=JzS848qu2aPabwwiCELHCanS8dS93aoJ3ZPCFWrnTkc/9MjBn0SXlTw3PBqAQs6UfG
         TuRGf8xMYQ63DN2gWFrgxX3wJN3jAIFM1Njm26Mxy2lZSNuX9R9f6cw0daIjTUPjNhON
         EHcoh+Dw+lEDsOW5f4wuyrySDWgsKD7sSk/pcKEEdNm1y9EYfHy3tT+2mbJnG0v9iZwE
         uQr+9IaYdm+YiwvixAHrHASdtf/iOK0W4zb1fEx0E6cP5sZlHJm4XEmDnIyfe3FfuUJH
         U6OqWhi1fEo20YvIfi4Bq03geLLN7zjK8OOHgXBVkpBkOtwBZUio3fLbzmCRB6No5IYX
         v1sA==
X-Forwarded-Encrypted: i=1; AJvYcCVyGk7WNtIXSU6brwQDO8o684VdJmGyCnAWZE4ZKThPKQliRdWT0qt09HjJlKUQJbJAM1j+/NB313OnZ7Dh5FTF@lists.infradead.org
X-Gm-Message-State: AOJu0YzDDBY4NIY5D1zRy+yRqJ7DkdD8hUAiZHVZa6GKzKxZSJ0qytLX
	JtA1yWrq6XwGxH0PctrXPIGwXYbVZRdLeoBj01Az/Z4qKM71dzbgEOIDEcN9EUw=
X-Gm-Gg: ASbGncv2KJiFWjRisiPv//hi2munjFR3Uxj/BMVfO9gD8oDWOcU29fXHfDbTlOBt/WB
	WLV/EvuOyNqDdq0CFiVGkP4xMLU1f35bQoiXhiMq3LGIzSOsCbFxJ/T17gc9ZDdGG7fygDEcN4u
	yp5z8aVOxvzo3Clst/2j8CCAXuOMDRfysaOX1a3Nn5KMRuZY0CJ76KetQoDDoHjZA4o/gssXHFN
	8ZvrSL2cDSaCFI0c+U8Uz6ZdZH192Z1TgX7+wWQmWeU7WJL2XJkBoKUvdAo6L8b60iXUmhbGry3
	lDQZR0balk77/v9sHZE9YCWKU3DaOYeSxvWGERBErwro3I9Y4Oc3LN9x8oEUQ5RdkSbjoejBBCF
	oo6njU+cqTNg4qgZPswR7usI3PC1l
X-Google-Smtp-Source: AGHT+IHqq5xE17qMmS1fs14R51Ih6MAYPGlP5NH+CbKlyAqH2jZK+FRszx7kpSpBogd0Ourruy0TcQ==
X-Received: by 2002:a05:6402:40cc:b0:5ed:1444:7914 with SMTP id 4fb4d7f45d1cf-5edfdd23b76mr19122813a12.28.1743670749730;
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:07 +0100
Subject: [PATCH v3 15/32] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015911_170302_46A3270C 
X-CRM114-Status: GOOD (  16.36  )
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

The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
s2dos05") adding s2dos05 support didn't add anything related to IRQ
support, so I assume this works without IRQs.

Rather than printing a warning message in sec_irq_init() due to the
missing IRQ number, or returning an error due to a missing irq chip
regmap, just return early explicitly.

This will become particularly important once errors from sec_irq_init()
aren't ignored anymore in an upcoming patch and helps the reader of
this code while reasoning about what the intention might be here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 9f0173c48b0c8186a2cdc1d2179db081ef2e09c4..79a3b33441fa5ab48b4b233eb8d89b4c20c142ed 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	int type = sec_pmic->device_type;
 	const struct regmap_irq_chip *sec_irq_chip;
 
-	if (!sec_pmic->irq) {
-		dev_warn(sec_pmic->dev,
-			 "No interrupt specified, no interrupts\n");
-		return 0;
-	}
-
 	switch (type) {
 	case S5M8767X:
 		sec_irq_chip = &s5m8767_irq_chip;
 		break;
+	case S2DOS05:
+		return 0;
 	case S2MPA01:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
@@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 				     sec_pmic->device_type);
 	}
 
+	if (!sec_pmic->irq) {
+		dev_warn(sec_pmic->dev,
+			 "No interrupt specified, no interrupts\n");
+		return 0;
+	}
+
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);

-- 
2.49.0.472.ge94155a9ec-goog


