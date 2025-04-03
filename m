Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D329DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=; b=FiorZLQ146g/ggGBVTTcmAPwU7
	r9lARb8t13MAZAmxWyUEHOhgTYN6VWTv6I5fbxG9Pr/F9zhcguKLSFlqF141o5E7FJO4Wdu2OCfhc
	V2YVVpcFvP/oQj4Iv9BfEsC1HhQIVRyunYxO2Udw1UzA/6kYeYDbaD3/9L2ev8M69+m7Fd/IQTrFs
	swa/Akize5+V9Gco8NjiinzPmpS1CW10lA9mjKpLvC+5nTNyNO6JQGCQtbyLNvn40wuy1OyaXWbKA
	OEYWO5K3zIx8hb73SaWP0yomFzGqyUpnXzXnu2S+fpQ3g17XrTCEC8IhDgoPGNMu2yPRG8w8XeZNJ
	3VF1vSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GyI-00000008Q1r-3Yvl;
	Thu, 03 Apr 2025 09:34:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPp-00000008Jmb-17Zs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so1167897a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670752; x=1744275552; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=qT8nv58JVDpgeKHrhtYb3FZN4bohmhNvjKrPnC5rtoput1hi1AM333ZFtE9wFmuAsw
         W5pfX1w48Is69hXwuSka+G530ABMr+UDw5OAK0VWNaTqiy05AckE7woaOfYkKVJUmkMO
         kfzwXg5mN1ahCw5cejduvnOTPL4xvJLlgHI9xa6Zc+QRPB5xtNvUkuAX2ETn+9ttpmFg
         E2gAaKBRHsjo9GEwcxtfjIBETDHe0F6anP2ezaI2iEap6Ec7N5P8F3UjMgRXyqSybzZN
         TcpkuISNex7dZSjG/VxPf/lH3GuK67Om3SBtO3IYow3ZKw63IF953zZbx1C6uEBtaj+x
         +UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670752; x=1744275552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=T3CjjeLyNU8Ukuz6U2LPyoz8lUuPBurDTjlaioG3wl0qvhVW4Xu7i7TKG0EMCaS84D
         5ABSEKdhPEdelcoBy1OXCO/itnWM553wz1CKc8c1XSjA2GhZljPPUYnWpj9KtLFYVO5T
         gA6tpjWAiMTLpK68YljJFwDRH2pJ5NKfFUvSY8KZ3TUTfMpwrposiLDm6DxxSAirRgiV
         mPtoHI9n+7Shd82+r75uHFx20SJ9w90MJl7fBfvhv+7g6ZgimdkJ/oabwd7sCHhrKhqF
         WNdEQk6mcxRazxogUkj+QbnXfj//rIl7qtiEXtA3nSIRrVgf15RPMP1ti3i33aHnqL0e
         6RfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeKZJfMxcWDmqR4TduwByMYl58Mb9sQZQQfjmaZ3bi02Tr1ZVYVHZGkyYlKtTYB0TFgCl0aTaCrwwEQ78gGRqx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy96ZnI0X/HLCBoke2GvFLGGmvSYhfspxVTnft/IhE/+F+QEuaZ
	UjczrZHrPtsr295HIRDd4Zf2nKPusOD6sLM75Jwzuy5W7Ymrionq2Y95AMKwUiw=
X-Gm-Gg: ASbGnctJZBVkkSxlGrpSnkY+fU09+qlVsxWJdDRJNoBvWBz+EOX6k4D153odK0QNXhx
	qrPKaYZuCJIcgC4pQb1N9Wmh/ZoDHagrN3QWqY1DICnFYQ0Z8GoTHzlIvPTYcw4S8ZaXAdsDmYS
	MaTljN53yxSrIfbcXBvunqo8LjVNDw1vcZF0gU+Iq0l5siVx4IA9bz0tozoB3vM5oWWL1AzMNXI
	5M/Gt6EdXsSoq+m8no8lWQ8IBcOISfDhPEPj0wuy5n4AVH0QxsNHTKBLjyOxWmCPCZtarpyUQp8
	19TPriBEaUSGsEyFwq6n6JjURV7W5jFvEjislQ/PCn0q5gvT59xJY7IvVjo8pkPhNeZn22YYgti
	Ly1g6AyfVzssuqP6Q4e5Fa6j1SQahXTOeh5kwNc0=
X-Google-Smtp-Source: AGHT+IHCv1y/iOD6tATf8l6JbAVP7nosxikaub6pMGAtowLVbGuj8LVxbHPFWCZvGPjo74E5dX1Kfg==
X-Received: by 2002:a05:6402:90e:b0:5e8:c0a7:4244 with SMTP id 4fb4d7f45d1cf-5f08716b5edmr1415400a12.9.1743670751910;
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:11 +0100
Subject: [PATCH v3 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-19-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015913_303992_34D98D0C 
X-CRM114-Status: GOOD (  13.93  )
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c4db58813059f07372679223ec570ed07f52cd73..5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.472.ge94155a9ec-goog


