Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5755C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=; b=wNP//zdmQEEbjApWfUTlaIaWZU
	1aDSrdfLtR8ihve2laM4DhNHDPoY/YIY+kHQ6EZQodD0GujSYYnll9rnfqAeNNyaccW2QnV/1XUiV
	fTGRPjwikhhOgJI1ploHarv3zVQROZWc5WnLzPi8V6/woMmyqcDtIvmfdmR2cUYarQctlFfgLKK2d
	3LHM6c4q8QY62njwtitfFeDo0OgO7JLvBKkil3wf/cABsgRIMg68W19EHVh9WGq2/7lV/E0AhSoDz
	B0snhU+a68PsxA7jE2wVTlyQRa43HtPkaPGTdTcvlaqlb7aW1MNzjhy3e7X0UTr3Of1h7wEkcHskP
	5On0gJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H5C-00000008R4O-3iAU;
	Thu, 03 Apr 2025 09:41:58 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPr-00000008Jnh-2H8s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:16 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1272160a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670754; x=1744275554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=RRy5/RFynYiAX55IF/fuaZQVApzvmVY1iPIMsTjYXj22ZVbuz06yt4MRMtwofMuWXK
         pkxS/j+vxO9iKLugK/N0ENlDk8XFCj+hAa4dXg46frFB9wtdxEyRoGbhuCq9jZtMZq73
         A2Ti3Xbi8S/7HGcBWan5+1IqxlzAPAAVNrRWp3xav7J+WOI5LAN1ZHt7DoJP0ukjhcag
         wHhsAAaY8Nbkjb2yYjGEXHApBgqVHdkYjbQL5J5mo4C/wQQvkqd1EMcdHrXN710LY2YE
         KIlPOA7JcxXcX8uCEEacvSB5W5t/DAuRbOPfmBizDR24g4No1DsOq3waFd8LUauSVzYk
         nH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670754; x=1744275554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=njCC3IWC1SrBCiHUvN5BwCECLwKLcARadUbh1P8YkOpmOerhrRkQ6wMYfNavtFQWsh
         lowIYZPYN3BGARxxW/baDrHlL1g/ia2/qmwyyXsnzAfLNJrgpgKmHgl1U0GWizFTMDus
         KLJ8/P2NZMMzx88AegkC7nQLqm3zlTK/MaGw55vo7TrXWhdheoCkjgzmqsPXlKlNYzWK
         gOd9+fZrjPu4AEv+tPEjjEEILD1QkEe7OA/+70uRCEaVDn489XGfP/l39mHWKZV5UQrF
         jVeI8Hej8s2o/XzL8ZIcJk5u5yzc61ugOBXkO5LQHujqtP1oPGuZvIWjUB96ha80IpSb
         zpNg==
X-Forwarded-Encrypted: i=1; AJvYcCVw9e8UBWcA+I302lSfJL2CoDtFmOU6drljWpi+WIjvek7ZhQmoYuFwDAqeuG3jju2F34oMK8KkxxlE4w19okPl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4OZwUmRXxZRq3oSqWrdXjmy6my3GhFI8coILv6cYe+S0j24Xg
	UVoJySXX9FbRxsLUAzdIhM6UHuU/lUr3vWyeBFWSkNL9fbogJ25cTJTXO8w9hJ4=
X-Gm-Gg: ASbGncsRXSr5/bb0LPAGmWF2WbOr2vsMjjjCXJ7rR5MKS5dDfKuP62bcrDsZQydOyNc
	wiCnmXE7EEtNzXjKPQq1mo/UxyT0KIevU5CghHmhtKB70U05QwzvjJR9O9g7a7V1yxCsIqIeDsW
	K6yfq968cbIOQ45k5dCIf2+l826WucWrKq+YBQNAtwkvSohOQQExdC8ZgSHfgA5zzMDMsfd0I54
	ZNq332Zf0VZTisGLre2jpf4DDahO0mZ9GcYsywno1BxLZhatpuztJRTHAyorqmg40AZA/hIrI/o
	Ax7cqdDm/mpVJVJ5StwBYMVAP7TCKZu09b6l01912HmWIQzU/wFGqFSXBk/8LwBJJI4FjtT7I2I
	zzOohAHWGIwNblbvjyPupeL7flqGs
X-Google-Smtp-Source: AGHT+IHPaEYedqVEDLo93ujbRrtVNCm/mxpEYABRhJlFkwLFXs8WrbrWDofWHLr/5jqHegGOehX8ag==
X-Received: by 2002:a05:6402:5112:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5edfcbe92b8mr15687119a12.6.1743670754243;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:15 +0100
Subject: [PATCH v3 23/32] mfd: sec: add myself as module author
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015915_592920_BA88654F 
X-CRM114-Status: GOOD (  11.49  )
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


