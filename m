Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA87C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=; b=kfu41h8AqKrl7eYNN+VQl5ULUQ
	3yshpX4s7S8frx5z7vDOa4tPd2oPk7t9brvYmo1CechT9r/6LDswH6FqAmQ3mz975oSE4gozn20UP
	hLo2t7kgKkAyHB+hP4LSm5orggAPwszys3Ev1ZFwqJ8Vwi51EC+AWYyvgVInEG7+LD1EVWdoWmatJ
	bGdOBICvz317jxCq4N3IHw5QB4kfig6QpjIuIlkn7mE/1C7qpHVi68731R1tKdd3/laFaR7vT3ZbX
	GSoJIxURxp8gpyIrhPcw5pL2zqHC/8e212/baGoW773SxcNJo+mM/xX4h1ObNINe1/BeoSJ7SXMpv
	JVFyWAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyABX-0000000DVk5-3JCx;
	Fri, 28 Mar 2025 13:55:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9na-0000000DQhM-140t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2961155a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168660; x=1743773460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=nOot1+dsqZt1fnP83zzr0w0MuRxffCKTJo6ji1eKX1vdsTAdrxAEjerwBscRYHlgDt
         VTF27q7QXlOSQ1vp7FY6jffjIu2ZY9oRXdP1DDlnapWDoqg1dZD25vVM5wKEg7IbZbP8
         Eb/tcW6x94d1Ph6wNv+Bs8A8Y6Osw+PW3O8MbD3DEvEjvJCDMF+JKzO2oRLcTd8US/Oq
         QL/xIVVZoCiQGBaSwWVnvshK0nWfxPj0M7KNcEe7C79g0ynxjN3uh0wPi6SP6hRQQjhH
         2vMx2cK1tSddQM/0tTsk0pwvZFONQaRm0KgnZPDEbXPKtCT6XmX4I8zGkgA7kVYcUdF3
         p5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168660; x=1743773460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VoGJVSU0pPXxfOhXBJG1TDUozXlWar2eJ++GWdYkqc=;
        b=TwJJF1q/vxqCty/h33B4vGKddYqNO+2y/IRZnyeb+cBhSmJm2xH1U6U3u/jFIxD+xw
         9AIHRN0r6LMv/d6OwgPvJGYZsptw0fmjZUZLYdmNq39BN/4HpKmhu9wZOduMwjnADP0r
         XI9FKqpFKkaDmXlG5CEMAFN6XO70Ny54brCQI2rc0gnOB/gujUspiumPKGovApZrJd4c
         B+8VSF9jKWibad6USAeBcWtqc1nrD3H+hAJqCgN47CPElDzO46DHOCf6YeitTCBL3uqo
         R1sRV+Cp0qJRh4Go5dy38HEBzggNdvLP8BCoau52EqavZ7nSsa98W0zkVy+FIocOEeut
         bAlw==
X-Forwarded-Encrypted: i=1; AJvYcCWpHJEIJN9VzNVWJVcqz8Yaa+EJ6XvuyTTKDllGWWafdZ/8bmel4lBeDzkAByWD4UWWFYbJ4fGF3FWrJjbd6Q70@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwa+IrdZh0u3aFhxRlfojls5+EKthdSBuP0N/cubMXGfXJbrJ3
	Vg0etKFtThMhaK4Q5J+M1UzANlKxi9hoDZJb9xlVzC4dnIJ5qF6AV6FIlTJ9MVA=
X-Gm-Gg: ASbGncvtBGQz3TAum5U48zKOtaMGacKPlzy8ko3BExVLajUWhO/Sk8sBfnh+SmK+XoV
	/6eMQDasvFdwMiGINrS1pdnULcbtydjWp5fM3Ycmj1YxJ1EAYc6EngHzJVtyNk3aKdWzEhTHAi8
	y33EG58l7CqMMfH3lnDEmiys+uFJX5HvFMAkMSw0t/EwRG2IH3NsqaW8A9kmucBzsyln/mt0TTm
	aRHPacpCTDmmtR4+sB6dq94FRGz6F4CV/7ttx4hvTN6bh0LLw0F9lO2Uirv4nyojmz00PsGEjkW
	d2pRseR+7ygBQGxK1THALoIzlAL3wUmrINj+AffxyGmuTEl66aA8X5IGtzKSIpzOV/qb6Mf1Oi0
	0GPdK4emyVoJ4/P0VVREK/C9wduSW
X-Google-Smtp-Source: AGHT+IFa1ywqWtMZSnG9pts0mMrN/sttXLfnO6tOUzdFdR1G8cdCfNjEuqB1D3yndUkb+y2vUxTGqQ==
X-Received: by 2002:a05:6402:3485:b0:5e5:bfab:51f with SMTP id 4fb4d7f45d1cf-5ed8c1f880amr7936018a12.0.1743168660409;
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:59 +0000
Subject: [PATCH v2 13/32] mfd: sec: use dev_err_probe() where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-13-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063102_293962_A26E08D5 
X-CRM114-Status: GOOD (  13.27  )
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

While at it, harmonise some error messages.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c |  6 +++---
 drivers/mfd/sec-i2c.c    | 10 +++-------
 drivers/mfd/sec-irq.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 1a6f14dda825adeaeee1a677459c7399c144d553..f4c606c5ee5a809a106b13e947464f35a926b199 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -229,9 +229,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unsupported device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 966d116dd781ac6ab63453f641b2a68bba3945a9..a107a9c1e760f90fcb59a9944b74e9a39a0d946c 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -134,7 +134,6 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	const struct regmap_config *regmap;
 	unsigned long device_type;
 	struct regmap *regmap_pmic;
-	int ret;
 
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
@@ -166,12 +165,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	}
 
 	regmap_pmic = devm_regmap_init_i2c(client, regmap);
-	if (IS_ERR(regmap_pmic)) {
-		ret = PTR_ERR(regmap_pmic);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(regmap_pmic))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
+				     "regmap init failed\n");
 
 	return sec_pmic_probe(&client->dev, device_type, client->irq,
 			      regmap_pmic, client);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892..9f0173c48b0c8186a2cdc1d2179db081ef2e09c4 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -487,18 +487,18 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 		sec_irq_chip = &s2mpu05_irq_chip;
 		break;
 	default:
-		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
-			sec_pmic->device_type);
-		return -EINVAL;
+		return dev_err_probe(sec_pmic->dev, -EINVAL,
+				     "Unsupported device type %lu\n",
+				     sec_pmic->device_type);
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0) {
-		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(sec_pmic->dev, ret,
+				     "Failed to add %s IRQ chip\n",
+				     sec_irq_chip->name);
 
 	/*
 	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11

-- 
2.49.0.472.ge94155a9ec-goog


