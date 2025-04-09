Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FA7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10AZOLwAO1V0GSmGNS0bnbti04nTAWbZ/3NrDOuj7Tg=; b=yrmnQYvIBIZq3tDazOmIwd9S8w
	QZH7BzeiyVJxueJKnTM60Q/R2Djdr36Fy7HmIKSMxesVXa+iEjiWpGPgVuuJpEbO6PvuClH7ak39x
	FzV926H35LojA+o0/Wep3u5OHDjCJ2kbZvSmSbvkVVH4EHq9dtDfRpQS8aRjAfHSwJXfzIIuz8FT/
	5yhcxF9n3JMroVMhg0JgszFRSu6eYuRMLXaEhvaouMnsTshKTAZmU2loipwsoZoe/fYTZ+uQ4taBT
	iAqCNWmXtoM9JcQdBaKRkSr5WV83ERUjwdsA1pmUrKSXNAs92jOSiTFj89nr98nozngPtFdABM9Lq
	uKx4CDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cxI-00000008aEf-3Z1x;
	Wed, 09 Apr 2025 21:27:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB6-00000008Shr-1Esx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaecf50578eso19326066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231063; x=1744835863; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10AZOLwAO1V0GSmGNS0bnbti04nTAWbZ/3NrDOuj7Tg=;
        b=vuRK/UDx/vfk7AEH8KnmIOjyWOxJVO11HmBUmIexF0rqoVB12dra9NjgjiDd0MRIq8
         n6Qv5SK1H/hwkpv6c8i/jA/VBo7n+lbXfgKTQ6CLlCO+VLly3VrLzKnP0aKbrR2UdwF1
         wEcqh8TvjqaLsGxJmDlotpJuuDK2mq2D/v3g6gQvZrtkSFVfd3UCphl2FpYNjpDIKyf7
         LauvWtLrUqFA3a+mZcXaZ6JU7j0WvyI1Fqu6/xXJcotUYryGkQpvIITaJ7CqitWrl43Y
         sszdR1QcUC/MfBqf5YfhZc3UZQM8U/xq0RDeUGi4N8PI/w6QGSHLJ8YQC/Gsbtru7PUn
         oK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231063; x=1744835863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10AZOLwAO1V0GSmGNS0bnbti04nTAWbZ/3NrDOuj7Tg=;
        b=n+LqS2fp19XkqXvSDp0iE/JRe531J+7P/SiofjuAAhtcONcCXubxBJ2HrS99XX6pgQ
         dx9T6i7V1S+J0THRPCiHnfZ2ZD7UdAQMh8liGzzjOkNkXgrVETC73rX7Rr7NXy3d4Y8m
         ysAWne+IQ9c1yywJyp4r8Nqe+nAmJ3kcm2FGyrg4A1/HOerIrOasbGIyM40cRChtHRQn
         dLCQ7cL6tl5/ZkKAwj3V3Odm50o1v8P1eudU3xuk6V+W9ULZm6RMAxw7Dxqh2Sr1y5G3
         tK5ghMAuXaNfcljpWIQCXYY3GpZQTkDZqImTlsCMOSti2mCQfyOMdJh7VsudghWgdkYB
         Fhzg==
X-Forwarded-Encrypted: i=1; AJvYcCXRADXLwGCg4Nb3L8AUcZVT7CP2pN1WVOAnT7Ma5tAjFiLO8JL85Qrqkz/b3eZPMUZKvVstgGXb+AD+3gRKvhag@lists.infradead.org
X-Gm-Message-State: AOJu0YwhYOq5x04aQNB4JS/y6svA4i9B8mXs5hXBzSvQ1iAWMu4UxY4v
	TJxJLtjKWZx9ZXk/NY1FU0CgONGA7sqHPiEpLtZrRwOzSpb9ULessHjXwC00rU0=
X-Gm-Gg: ASbGncufVKqBHomFN3u8vVU6N08CylcPaIR7f/EgXC5wBbax/fEbrtudwboM0ErP+rg
	9i1+teWEgmkmq2AmwkAxHN1f9QKbf7Gr0STtCndNE0DzfpPES1zNtSdclHkEOU/jzuqXMwQOaPv
	98TH1+MkuYuSqUR8LsqZPE3aCPXz/S/qKOd4x3nyP/e31LAbdFRwRDyFRiWf2kEraKNafaMzbH4
	5tNAtRgJxbxoDzGNYrc/Aw+Jy3YgopD9dY4yulSzaBGOU3vOaf70C8/sn4kZHCTNw3Mm3x1dDuR
	BM7mdsgN5gaAH7/kcuvFGXIdL6xWvlWeyKxbUI+JlFl9R4beFofcmmiYBVOMkWkT9DuD7kwbmNB
	oy7rtVyMEd5U/23EV1H/8ive+MVc=
X-Google-Smtp-Source: AGHT+IFUTssASe24CO9TPtl71HAttAgy9US9arxRXimezJ/dltcAvjXzhwFcY2meWd733DjD83/qUg==
X-Received: by 2002:a17:907:980a:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-acabd3ac9bemr9253366b.43.1744231062911;
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:47 +0100
Subject: [PATCH v4 26/32] rtc: s5m: prepare for external regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-26-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133744_345196_9BAAA1D6 
X-CRM114-Status: GOOD (  16.76  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 81 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index c7636738b797b8087a0ed6844df62d47427e33b8..f8abcdee8611d1181fb575aeb8d094360538ca7e 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -640,52 +640,61 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	enum sec_device_type device_type =
 		platform_get_device_id(pdev)->driver_data;
 	struct s5m_rtc_info *info;
-	struct i2c_client *i2c;
-	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	switch (device_type) {
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
+		switch (device_type) {
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
+					     "Unsupported device type %d\n",
+					     device_type);
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
-				     "Device type %d is not supported by RTC driver\n",
+				     "Unsupported device type %d\n",
 				     device_type);
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
 	info->device_type = device_type;

-- 
2.49.0.604.gff1f9ca942-goog


