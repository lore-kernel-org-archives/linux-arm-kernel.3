Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D0FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=; b=1hQEeADEMcPibt0pCdtGnNBir+
	objx+t8iWBGOIquUCxWfW03zftbKQC5I2R7ifFokgt/b0w01Iy7vKkaEKGwNvxV694y7z4n0FcMVb
	bVMa6Ld75nZoeYK49a2HpaEoG6u37V9hRckGl4P50pECaLQMUPZbnSPgN8uWQilQC4BrJp1ndElt3
	XbfulkFwixlwY+HBOhzgo0LY8i4IlEjtsD/4ubH0N/FPAIjaeurLfV1b0PubOEnK96fYnMvUsZL+t
	YFVOyQE0W54ZBECqPosekoIkUoKApksqwRltMkQnKx+rcIOh6aqhTXOMgkFUEjn0C3zJskby0/hYR
	2a8NEzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAW5-0000000DZDa-2ZX5;
	Fri, 28 Mar 2025 14:17:01 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9ng-0000000DQm0-3X1U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3160416a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168667; x=1743773467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=;
        b=lFI9tBVGF31Lqx6SOmG0QsorGvXdW201CC0B602ldg5AlFQBQj1TmU2jLkMBMmVSuC
         O0NGIjLEIRwe0UfUmOWdqHmmZIMSb52u2GndAHy1ikaU7klIGDsHFlLmuTuyHU0CeyHm
         ajwXtucHKhf1OWhAtBbz71erJ2EriPxVMjIY178OxzrXBNFcmtthn2IwNA+7iqrq2SUg
         yE5MdtyFPQJW/wjfdrRN2p3vkqjubO7vwlhfVNIDTMz+D9h2QhDtHAhbQ+hUgje0YqNu
         2W6dUXe3gIezazW2BO4FrRsEPcJ+ZVhmB32ENU8W+fhRQzgbjUPuuDx2TSiGi32J+xSg
         2aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168667; x=1743773467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FZ2sB+aGjDu2Ign5/fbJkQ1EFpiN/+kFXshKweSgHY=;
        b=CdwQjrV4+oRhAb0z/KWU3202UcanyYDc2vDODaiJ4/TU3pE5WEgxzq32OhA9lGNL7S
         Nnh2bkq+apYhjhoAG5MJIL37R35fCFWcsT1Q5vZIZdqm+GrdzIP5GUsbcolOzAu05lAB
         552qPAmursJ0wsCSyQ3ytXFPCWftSOd3EY/HypOUl7bdsU61KLixbxyP7zC7kgBHLgXo
         xcbTF3OTqkJjITJP3x33hepEqHVyEDvDuT39guGJ1h8qjO6dKx8+7Assc7KSM2wsMFjT
         dNul4fdc5mkYDnVbeJgc9gbQBcJDU1gXCWjG8cRnP5axLpes3U/TW1bVgIVMYUWe0hAS
         FaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaUhiQS3dntrshM+OkBzv8XlUIsHDX2lhOLppnd1C7rbpRS9nUyNR7vBPzcQLpp6m4Su4yaDapX0GPUHmzsril@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp5iR/VZi7OVreYSucGbi46wDB0lH90/LIULJaGc6ll+iwAoWW
	Uk6+g0SsAsY5amwlCQCGgcMjPyMZQOnrK5acTWrBinI3BwZPHG37i4s95X4MT2o=
X-Gm-Gg: ASbGncsMxTxIoc0/2GlSJhF6zCewlwzAQnhZWJomCgCfv2P4QKvE9TreqGWzEbth4Ay
	YBTyXfdqsYBU/0fRyvYEVUgd6gvNabtSZesfeDjODhbr0M9tFVPA53exiJfBWojdOtUIEk4D0gb
	g7qLhhtxDgDQUOgJbNbXY/zmiqsOnfCWDhrqNPcvkYMjT/JNM3Dsgw7fEtn3Nh2F+iL3lrGj+5u
	4Kj30Di1oduzFrDwyvDtwsy69qaRPVYHk0Xe8eU2LZ/1uxO+M3/ofMeKTZosd3nnAgU+kyf0y30
	egyJ/1W+/KiGOpgd3UBOHNvwfFjVBmEdBFHCL5F/KQFor0MBDQiYNM8q1CKcRrYSzUj2vbnjuzD
	f4S97goOQYJ18ApuEjNtW8KfPrULk
X-Google-Smtp-Source: AGHT+IGSqptnzxioWGgvH+TeC2OAU/4Feh5tQVATT2tVY9LlKpIN77ufnNqeM2yiIzKx/dF//iDlTw==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5ed8e388e5emr8163387a12.11.1743168666968;
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:11 +0000
Subject: [PATCH v2 25/32] rtc: s5m: cache value of platform_get_device_id()
 during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-25-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063108_883273_7F9ABC75 
X-CRM114-Status: GOOD (  14.40  )
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

platform_get_device_id() is called mulitple times during probe. This
makes the code harder to read than necessary.

Just get the ID once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..53c76b0e4253a9ba225c3c723d35d9182d071607 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	const struct platform_device_id	* const id =
+		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (id->driver_data) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -670,7 +672,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     id->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = id->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.472.ge94155a9ec-goog


