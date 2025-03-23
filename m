Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9034BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsLbKQJRD9tdVXE8w0Z1fJ+0H6Ywqg5fj1IFaYNGdSQ=; b=EzRBWfLV+r3jaUPtcjtVVPbwE3
	fU2yBdxNMbs58y6k4CSdr1eQdOVVpJ7kneP9toY601fo0iHMYdKInmWg1+PttA9QN9Qc31irJ66ey
	2k6rk6ID8GJ9MzVHZMig68aZ8d6QUfndtZ1J8JwB8uUhhYM65vo4Wo/1/roojcxQZcuUKB7KbkKS6
	ZBTB8ZNTRtzD6bem2saaVbKeRM2D1lFtnUAQ2NelQNef+Soc29gSC/r23ZKjOD4cJujNRNx2jF87P
	yQal2Tc4tZWAJcW4YqyZRgxHUH1G2RpnlFK53fW8rWaanUrG44EBFvdogkt+cSk+Tqj/LbMaXVJRx
	+AoIWVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUhx-00000001uBk-2X0Q;
	Sun, 23 Mar 2025 23:26:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyn-00000001pCq-2faS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:42 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac29fd22163so654485066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769580; x=1743374380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsLbKQJRD9tdVXE8w0Z1fJ+0H6Ywqg5fj1IFaYNGdSQ=;
        b=m1WpiaYN7TcP86wTdsLGoD8TFuqZBzl9oOu/rmNhmz9hm5vHmj2yYPri96T8XA/NyT
         s9mvDkQ7Dp14pJ10QYZnMMNeMXVpZQh/fZtqdaYZGG2Lq+ozywNWIv7gMZgRrLnDXtWq
         H3XvwDqT8/Ov4wt5K6hve+nBE0qLIVsjfCG/wN03VhserLrfp8v9Y52CFIMEqUOVxtqq
         8P0c5EpipnOUq68N1mH62vNYVENcjgl8FmWiavLaayX1bUfOti+u5qKjJJAUqfGRe9+5
         UMaHoaDk6Z7iWLaqiK0fN1t4yyTrM8xY7XKxTq79JWhZkpY/Wm3SoCNuoiFGnKUoPZ5n
         0Tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769580; x=1743374380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsLbKQJRD9tdVXE8w0Z1fJ+0H6Ywqg5fj1IFaYNGdSQ=;
        b=H3cbv2EWeMQXLcLzN1OgKXhKk8qCVxvDzxppcX49FWaMUtS/2tj3mJzFJPMBERDnAs
         86TE64b3PksqRkKyeN0qcSBEgni1daZt68A3OYlDHSfHtf1guYgapBfyFCRlBLERORj9
         OziKP+jYMadd+suCdIZrUDa8MtALXDJXgEARCPZsMT5qCoDcoTgTR/xIkKGP+wau0Cq4
         jb2gw1c6y9Z02mAImPqfIG7JnMrUnCIyXn/kPoZyQ00F78a+ZgsQGiRX/89AfC4w3yXH
         tAzf/KaSCYboTFzmYIcMjtYpwFbEePY+jsIqwGH8/KkyMujP1RZhXsoy9acGmu0qcQyL
         90PA==
X-Forwarded-Encrypted: i=1; AJvYcCWjivqB8Xj9OYzbQzkVf7fwVUBkTtF/xONtqEAqGi8gNM3u3HjKmdqHonQdi63A/OL9vC7P0LhnrDY6uk21uxw4@lists.infradead.org
X-Gm-Message-State: AOJu0YxJSU3vQb7SfWB3Q47MG7NbsU5HKB6CIHHTW+/PcEwTkGeP7ezI
	M/etTzfFT0HxfiZrgMXSVM68Wh0Et6D+Sx1Dc9LzKd+BkcwwITjD/0yHzA4jRV4=
X-Gm-Gg: ASbGncvQ3ZLyC5fwvu202pydXQzg8tLoqNg0dlDs9y0Lqw1eoZpQuSOY0tMw4mMA0Pm
	6AGoT59ZKZTuxiMPwSCoxHXQqvanMxmue8zlg9/dGYgtsQGKCmeF8jnF4bOzbrNYQQ6P75SG5UA
	YHH4NuQHx/Yw+gShtV0hw5HiOvWsCarlzjidOcaGyrWfg5ks8emlqPUtK5Trdv97tFFGUkkNeg0
	aLdWSX/xW0locgjKTFvUthQv0CB0XrwI9FN3Rw4EcXME3w8KSlNL/hPHqK0fbtsxwNBsLKuCrIR
	Wsp7zPIeZHaFnjJ8OgY/qDjnADpBs8a7DgrX2hMJ8Ewp8yBmDHaV2kltsAYMQmGn9qKbRX/5A/9
	m1Uh2flRXiYsIMW+ZUtTd57QyggSH
X-Google-Smtp-Source: AGHT+IGvOa3XAeKcwT9Vr0T+ZVATFp5TvHs+FtoKfari/ok1W7HicIpcGqvAlFVuwPQSyDN+Jo9fHw==
X-Received: by 2002:a17:907:8694:b0:ac3:b277:2474 with SMTP id a640c23a62f3a-ac3f2285fcdmr1145400566b.28.1742769580258;
        Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:44 +0000
Subject: [PATCH 28/34] rtc: s5m: prepare for external regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-28-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153941_693044_5F1F7F52 
X-CRM114-Status: GOOD (  16.80  )
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
 drivers/rtc/rtc-s5m.c | 83 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 31bdceac7aa245175a30eb13eaaf1f52f70e22c2..86ccf666c68059408907c97f2647716ffaad10c6 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -640,51 +640,60 @@ static int s5m_rtc_probe(struct platform_device *pdev)
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
-		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
-				     id_entry->driver_data);
-	}
+	info->regmap = dev_get_regmap(pdev->dev.parent, "rtc");
+	if (!info->regmap) {
+		const struct regmap_config *regmap_cfg;
+		struct i2c_client *i2c;
 
-	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					RTC_I2C_ADDR);
-	if (IS_ERR(i2c))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
-				     "Failed to allocate I2C for RTC\n");
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
 
-	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
-				     "Failed to allocate RTC register map\n");
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
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unsupported device type %lu\n",
+				     id->driver_data);
+	}
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;

-- 
2.49.0.395.g12beb8f557-goog


