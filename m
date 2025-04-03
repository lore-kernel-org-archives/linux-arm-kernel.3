Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F1AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=; b=4AybdYBMO5LoLGtv8NZizn9QlS
	fYR7oMb7KXgPwFrp8anEqSfl6LBY3KWlHFO2B63MhS5rS0px88/oweMUyXj3EjACpQ4F10WV/qyZ8
	G+52fIRY18T+sSCEIIIorGAKqsRuNsA5pwS9ytH17Cc3+ZHBEV7uVrsofobAF5yjbGBkfdKYQkVBm
	Vdh2/7hn4cmJ/fGpTK+I/kJp5XUTXmd6SurtEfOoHfnqbmXtuvVyrfofvMoRVo2NONuslphd0dbPI
	IwoEXDoLsYIfakIlZgQf3ZOiP+tGPL+sqKsLpGVo8FM1NKAb9FMjrQOgCa+EZh5SKh3+Kt41k6Wdb
	C3+FXUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H8e-00000008RSD-2iOk;
	Thu, 03 Apr 2025 09:45:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPt-00000008JpJ-415C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abec8b750ebso106540366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670756; x=1744275556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=F2DQjGb8a9jwpbqbSOfNRi1H9u/rhcVpSc0OKQ2Xwvej+EPimKtnbi/NnWmbC+tF54
         rxEI6r5E6z7LnDUT6fK++Rs8PIY5xAz9vFYYS50WWkSgHOPJfxg9Fymm/2z0PIDxfcvi
         7XkxFe909MxnbnMxtAJ9FgfIzqwOv5gdJssHFcQpimWpSnv1s61UkSjXRrSIXZFRFieC
         rD5ywLeM1kEN1pzwuQ0BIi4LwJVLauYVBkLC7EbHMLehwlph6ZvUDocFgTsfaVatOzVB
         FFBvH+OBgnwCVIlfllbTkAQRS742/JotmPJLfMi5idTr0JUPjY6w7EPCXcSW1aJDY/2z
         /t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670756; x=1744275556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=DBVoocDhslQxDhNZ5Ov9ZW+RpOWeXuJLBjSxvh0KERRm2g4dMgNvIlkR+S7FW1ncxY
         +6rwVdsyaQwkhnHHqr7o/MBp/o/T+gD2U2fusYmlx6SmJxS7GCXLUqhvpYKMCm1/3iD4
         8WkOlz/K13bZSd5s7yqRJc4PbdiInF5iV9bK5jfahO7Ctj0kJV8JKUXhTsyfqZn9+jbS
         aQT8BEvyFCyfvuXGxXFIosBcsDhjMVSHdxnV83DYSRbHaxKrcsng8igg8Hq2rp0ERNAR
         PGWbV0fNHkfB1tt4iqalgxxku9mRWbIZJKK19HKWWm8gh1MXlPIY6ZE4W4gYyXSOWdGE
         EqfA==
X-Forwarded-Encrypted: i=1; AJvYcCVtrp5GQO3qMuliIh4jRjGf8GvGAXo9FI9pP6IpTsj7enpKyyx7sTxlMyAGscNn62x1rGYUX+9VO0jbASSs/cDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxtCP6w/bsI0NUj+aeJ41IBs+ZxhBIFvwCzw6p87R+LdDL6/3Aj
	FaL7lQQCOJyiTi5WTU8iHGg1hmA6pqHFUd/wQsyfreqTEJ7+PSLJFf0sJnlCNv0=
X-Gm-Gg: ASbGncucujGA2CexYWVWAJoa7tRFevjeD0AcCXNmgTsF3dMjatLyMuh/kDq0b/LQ1k0
	lROONLZ7Vg3DgKakVPq2eyhSZF03RnmHQXaa9hIn1BV+creaKehfGFDGs4ECIjBwV8bdb2tjWaB
	x6mWe4NURG6uhahwBJpyBmDCD54FH7WBnVKgMiDHpk1Z6O2WvasK7fKuNPEwSDweLSNJ6AvwfLq
	4XEFG0SOqBLueNnwbrPDMzobsjHI8pABkRvfUI3FPp2blbiekMMhRRDKwmYWCJfwfnGYHPcsUvc
	3JhABg6sCZQeX9oE/CppuuGfrwVhfyxKrY1kOA8qlbKMywAWfWbRHyfRHofn6H2xLL6QSi0XrEq
	EwMouNjsllXPzQrPuuhVX50KnXEC5
X-Google-Smtp-Source: AGHT+IGxqvs9WDVLgnZbd0Q1P61p74Sjm20wNP22/EBrrIOH4ecB3274nitjn+0Tvp+BuQBO2JC0vA==
X-Received: by 2002:a17:907:c23:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac7a165e83fmr473122266b.3.1743670756231;
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:18 +0100
Subject: [PATCH v3 26/32] rtc: s5m: prepare for external regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-26-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015917_999419_3CEA2F8D 
X-CRM114-Status: GOOD (  17.14  )
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

The Samsung S2MPG10 PMIC is not connected via I2C as this driver
assumes, hence this driver's current approach of creating an I2C-based
regmap doesn't work for it, and this driver should use the regmap
provided by the parent (core) driver instead for that PMIC.

To prepare this driver for s2mpg support, restructure the code to only
create a regmap if one isn't provided by the parent.

No functional changes, since the parent doesn't provide a regmap for
any of the PMICs currently supported by this driver. Having this change
separate will simply make the addition of S2MPG10 support more
self-contained, without additional restructuring.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 81 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 53c76b0e4253a9ba225c3c723d35d9182d071607..86ccf666c68059408907c97f2647716ffaad10c6 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -640,52 +640,61 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	const struct platform_device_id	* const id =
 		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
-	struct i2c_client *i2c;
-	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	switch (id->driver_data) {
-	case S2MPS15X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps15_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS14X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps14_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS13X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps13_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S5M8767X:
-		regmap_cfg = &s5m_rtc_regmap_config;
-		info->regs = &s5m_rtc_regs;
-		alarm_irq = S5M8767_IRQ_RTCA1;
-		break;
-	default:
+	info->regmap = dev_get_regmap(pdev->dev.parent, "rtc");
+	if (!info->regmap) {
+		const struct regmap_config *regmap_cfg;
+		struct i2c_client *i2c;
+
+		switch (id->driver_data) {
+		case S2MPS15X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps15_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS14X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps14_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS13X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps13_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S5M8767X:
+			regmap_cfg = &s5m_rtc_regmap_config;
+			info->regs = &s5m_rtc_regs;
+			alarm_irq = S5M8767_IRQ_RTCA1;
+			break;
+		default:
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unsupported device type %lu\n",
+					     id->driver_data);
+		}
+
+		i2c = devm_i2c_new_dummy_device(&pdev->dev,
+						s5m87xx->i2c->adapter,
+						RTC_I2C_ADDR);
+		if (IS_ERR(i2c))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
+					     "Failed to allocate I2C\n");
+
+		info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
+		if (IS_ERR(info->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
+					     "Failed to allocate regmap\n");
+	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
+				     "Unsupported device type %lu\n",
 				     id->driver_data);
 	}
 
-	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					RTC_I2C_ADDR);
-	if (IS_ERR(i2c))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
-				     "Failed to allocate I2C for RTC\n");
-
-	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
-				     "Failed to allocate RTC register map\n");
-
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
 	info->device_type = id->driver_data;

-- 
2.49.0.472.ge94155a9ec-goog


