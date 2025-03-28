Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B8EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=; b=EZpPpFs+MeU/hsD2Va5jMhE2kw
	D8Vkc5Hg4XnFikDZUYNYiLh+DsvTNvipVnYYpUYVZDEbYeQCbKFUjTSJBtfe2cmhQVFEJ12ZhuG5B
	ZhiVSINAAEi3xFcFSPmZz2+TfuxLqGYCMQFbDbt0hz9V8i9LcqN82sNZeFhMXcYuM3LNe6URAFOxq
	mRBo2a+4WjCkH+0GNCg4O5j6b+dnjCNPxcoTftldBRdDx1nvApMgCdd03pQMWzC/pOP597OrAJYTj
	L51+yah7vASgZshMSCK/8nCUOtxUuEJuyZA2KUECHu3ecHqzuOgiCfm4qV+Gtx2L5iwilhwoRRILG
	2jgVyPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAEy-0000000DWOk-16tC;
	Fri, 28 Mar 2025 13:59:20 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nb-0000000DQht-1TN8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so4183668a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168661; x=1743773461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=Pdoj0DUBf1yKxjrsaj3QAO+2jF4zdI9483Z0RxdSWQahGY6uqiNvkFJLSsQ85/e3nL
         py0DANqVGlNbiDAWV5V5Dq7oJ1yOl0uy+RF+Q9XlPqFAQ0pF1bXfl59SvvJZEW2B7Mdf
         YYdrB36mWkW4DqX0U0mD0xBUudWhoiJeEmfj6bhAy74L1Z12PdB6zFcy7dDar3Mi6irK
         2ZpFK/LqXvK1H6U58fJIt6fRKk/NkevM8od/2m7/Sy2X4VaiV8KsWOa4Yd6rNeLf79Y7
         H5zkMFib1WRyUCwmOD7rtBvDkPT47FSjZD43F/83RtA5jZpintXy8UcQ2CAM8bZBSL4V
         R+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqGhx5PJ7AN26XxBcQwRDT/hvBtSHvxnm6hLozkr74A=;
        b=vDhzfqA4oQBR3YUzxzIlZhl5XrDjhUqnyfkmt68zxPocBJc0q7nbN2EniYpohtS0m+
         0rcB+hNSSj+1hcIHg9wFu5HF0m7fXG+2GmCNDJcsJVbIDPCuLEJ0XAeEm4o6BgxIiw50
         on8ZTsCRvGk/UV5+OId3pJxA/jy/bUG2tXSxx1OBjPBTgeNuuIhgmHLzVQlIoDGZno0F
         1MaQgefOhmFgHuezyRLS0uIuOdgH+47bTvc7wgfIfmqD3imoikyeorZVlgmceSsTi/sR
         34zrl6wMI/V8/hzsFbpdIlaFpOv5tSmYauhfWi/QDiErRapa2zIdGXgWYyWKM8ZzUW0D
         DUPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJpnZk2Ni1uM0TEG/9pXuFevPxK3uHB3YXxBQY8M1wckmxE5Erbcm/ZcK/woCQ32xsQ5bUx+9SL6ZEIgDWTGxF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2D7sVYogeRikpN6RU27yiIkIjfP1hN7ndtFd3YMxTvO6JFWaf
	hI7Q0LTxzLxZ7jmCYuu9fOsWdYBaafEQp7jT73bkYOyawPWF4JxC7wls+G0Aipw=
X-Gm-Gg: ASbGncvhkz0qyjKAuVdCXEThYBDaTB/GAFBM1ioKakNQOdK4XOyS7QTcJ+9Cv/O3vYs
	IFXWoiTHKAfH3pWhwOGEe1Q8ho5HoCF7EDj61O4DoxsJojujakV7xYrvwXaNC+2vQ2RAbznZtV+
	hkjhSe5WTUbyXtnEmMVozl5zEs6cJu6Cv3R+oxKfrf+ksXOZTw33hEb363pETcHAlN/nItM2dfJ
	TwtwJ7VKZpcnIZEza65Um9BUT1wz9iKYi/3cUnzioAMDwGqcyM+b5lcCMuSrPe8r03DZq6cwsKN
	8JXNKA7ZJQZZmWT4vxlP+BYtuDGY++g0MUhwmrHmHslYYeT7lcM9O/2Lvgkd68LCOaOxFwy1hAD
	SGeHNJM9i5qLgpjo5xK13vg0a9K2K
X-Google-Smtp-Source: AGHT+IFFA9eoxZ8yzHOxTpOhNTpQABoRUZClQa2WX7rYpC3RMUD7CguVMWSVn/HPqyoqjb3+u3RckA==
X-Received: by 2002:a05:6402:5187:b0:5ec:922f:7a02 with SMTP id 4fb4d7f45d1cf-5ed8e496a71mr7840054a12.10.1743168661407;
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:01 +0000
Subject: [PATCH v2 15/32] mfd: sec: s2dos05: doesn't support interrupts (it
 seems)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-15-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063103_388128_34B0ADA2 
X-CRM114-Status: GOOD (  16.26  )
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


