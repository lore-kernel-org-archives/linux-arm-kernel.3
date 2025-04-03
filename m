Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5A6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=; b=qmrXqi3OqV3Gyy1q9ArjYN4QQg
	G+2seGbecnaHQkVn/8ig/0cp4aCzDw3dbFlnHPRg66ejHb4fzoMZIxaHjczxHD1i8F4DeRL7rGni9
	usi5REbfzcYiqes3XEV+bwFlYVtwx8+qH7E7nijvtObwejWZrXcRDZzidtGTGHsYDtO7NmLJ38qgJ
	mZ3fFp5K3qOlzI1fvXr/TqhJmEhV3CBzVMCR7/WFBPx165InssYPZw+PetItl8pwXh4nicEBBhg7L
	lyosA6SrEgAk8bv6kx5scJPNP2DTstAbIeLcCUwksjhXr4GVLQ+qOCmz7iZ1Nsod6H5ZEg5NSqmou
	DKNVvCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H6v-00000008RBW-3xr4;
	Thu, 03 Apr 2025 09:43:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPs-00000008JoE-0SYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so924403a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670755; x=1744275555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=Xqa4N/uoBtu55wJuTcWc9AiwvFPFtiRnuMZCGGaifyCRALLHOMZsPecQcdZEjG+yiA
         toQP5XXzcg69KIO0uP5/seXH4hCQDxnh6+SLQ9pPJ3A7kxRXZi8LjLNGI2WD8vAf9B7+
         AzBLPd2Ze6Ko2lPLf6kK2HAJ3SJwuh0luMM0yIxwfYucXaRiQRvv7uQRl2afVOBNPCjV
         IJmolkhnuCg52kQm6unya9zaomLtV5b5jf1qqP9wNovAdeP90mwRCYelNHBLS4GiYf7Y
         ci3mT2ERyX0yo7V62m8Kd5+K6o8gZ6onf6VnQPAOm/YPpj8bHxN09zwWs43YDOUdrZ7y
         hEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670755; x=1744275555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=IdF5CUl7qu8etVkyF2gS9PGz0hcLGKL5gvNAiRD+3+jjp6gZuYkgJyaqesy5NUpbKe
         31BDGPf/YX7A87IEse6a25FEK5pMj04yuqJ2h/zkImSViHB+FWcX8Pfy5GIiGD/4A/9g
         DUA9GtC2cXhzG+AdBCiOqaZRmMJJa7tTaDrdt/XBaWJ/WKO8AVSeGnpFYHVOegOgwb/o
         h60peeSTtRa3xyl5rbcQWZbm1ZUaG/cEQrqt2z8JAysD9cTuFs1ZWVCm3Ufja3GAfL0S
         rQlNuund1kpCd2gwIzlk4397RLBUlPtqyiebuacQaQQqq+BczMQYogDoPA20bW/LSJID
         xFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5N3JLo6keStSn3BZw+GMJfX5hnCIoQMERyw1dqIwX4nuESpAldRTAjVeYRz3VwUb/ylhK7i7A78tfyjrpjNO6@lists.infradead.org
X-Gm-Message-State: AOJu0YzRnyGLqy/3apQEOMlcU9ES5A7g/NhRg5JOlH88yrd7QM3IFttp
	uv3uXLSufrtgMYOEj0VTM+Yj2FneWbYQMf5C6vuLMEQj10Vv+R+gdCXmWyzt9AM=
X-Gm-Gg: ASbGncvOTptN2CeGDoRbYG5cWo6QEVmR6c82TM1Ur5TqFwnWMesRtRJcWUxorUGWI7M
	6eva7qdp+c7iUf/b6O8YeW0ix9lOu+yy2LJAGHNi7EAFjKe5gAaKTCVXUZ+6WlNOtbvDZkxfFy1
	RI35NX7MY2toMJFazNaB4qjRXEehJrdks8KcMVZhYHcjUPD9RP6cJW7JAlQqTqjIm38SUmf1Bm2
	cDYydeUPbKodn7eKlgYy5o5ek1OLMnjgfRMN8BHyt3FW0yppp9a04jzzsOvViW7lSgEkAQIXb+w
	WnFCdfyr6C5Xdmfuv0QvhP9073xHajaeHizyw+aqPGhsJ7ed38ZkS0+pigA7wCNw7fmXUOOu5wF
	eOYdh+krVna5DY3jUo+HmaKHmf1Mj
X-Google-Smtp-Source: AGHT+IHEdGFmSr6KJkifyjVrc0xIRhrTNMltNPXKgSl8ywP+14sm3GrLINtRDwSb2RF2kU14UFLFrw==
X-Received: by 2002:a05:6402:40d3:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5edfd156c0amr18247266a12.16.1743670754722;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:16 +0100
Subject: [PATCH v3 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-24-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015916_145595_7E402EDA 
X-CRM114-Status: GOOD (  14.88  )
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.472.ge94155a9ec-goog


