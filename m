Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA53C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrKApdHkTzLPincImPYL07CE0wRIY5rb+KJxRsRRgwI=; b=i0Z141yIwHjFaBQ0/czjqxlkBQ
	nb/ZMdCEa0eecWZB0CcimQfzq0Esu/HKVY8HCGEXG+dYtoOpl15xg+V+Gz+7BcPGjMIFH4OIPN5GP
	VvoZMNmGkVQYx4ahbbCy8i5FxM2idmN6gRjyQ13AgkssPtByhj75EdRytbceYbed1qcDU/nFlvIPN
	Wrhr+BLgzUXakHX4Q+XAWJt8PpmTUVbsfn985TNgU8kGau3UPu1NYkOhtaudQQxX2WpoLPy2D5k7p
	FqTIwPvF8SVQOe4yRxYF8FAmDnITtoVvdtLf2h//8e/AFMg//WrFW7XfmVv/gsoGwKayI/fpDNXGa
	A6usS0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cqJ-00000008Z2S-3acf;
	Wed, 09 Apr 2025 21:20:19 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB4-00000008SgK-2O1p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2151206a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231061; x=1744835861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrKApdHkTzLPincImPYL07CE0wRIY5rb+KJxRsRRgwI=;
        b=QZA00LI/kA3oOfVAk9pKuRm8onZDiHo88cxQRXbjmUaUMRLANujF4xRDg9njl/jnmB
         KmoHIb/YNo+HBO43cXtiROSJR9kr140bxUiYdcpuKIZHM+CMLqsq487+A+bnCCHrQENn
         7wsJRcqZw4V8MN6UQUt45zTPX7xpeav8vXzf3eYfJEDqLSJ5imzaKepzrwI9YJMAzLqy
         isdbj2jZAyWR9HUuoxq8pFEGttCi6zmNe190uprHqmxI8a6mlvhYb5zGhXBRMrd7g2nZ
         fw5Yz8TxQ2fIV5tCupTmiG/bn/BQ8jFa1NDN3Vylb8yk40/ZmVg8dmluD1yNOpX+J5FY
         zOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231061; x=1744835861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrKApdHkTzLPincImPYL07CE0wRIY5rb+KJxRsRRgwI=;
        b=pPG4jS7BwksNF6cBnwYQ6djHerLxkyAiMgX7ZS0uJQZHQgBXjmDbMcWEEYlN/uFT49
         MIz18k70XFKHgrIOYFTo9C5VjwhghwQQ910xMeHUFb42cHHUGu5xyG6ycODkmIwjD7Cc
         y3qibbPOyZr8Q3Q0WemRHdDQ6j7Z9rGZOjvlTONMD8ZTAE8YNmAU/t4rctei04Kp8dRD
         4FHXKrGuNMnC2LVEyOMnT97hdix0sPWRSwYVMkIiOQPnoJnKrjHcK2nPmo4fpQg3zz7W
         lnZ1SV9/It0MvXkRDs2qTdOBVmjzH94k1f8OCrPXCmFhcChmSA8H0R6bn/JBnS2a+480
         lqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE0J8K1QaYKYEoE+x3HU40ePIeo5o8z97SUhB6AvSNYxlWCXp9sOmgb3LOaR28okUdIwS7mDi0sU8niGASY8RT@lists.infradead.org
X-Gm-Message-State: AOJu0YyBFDnW3OteoutEi1nvjfcmMDbTGhLx8SNQFg7vAOnZYVn/1cgN
	7Iw91FKdB5x1CrY2BFxtlyAg3Hn9UWxsifrDXGBDlwkolbzJGOvG1hlq2ljHfeY=
X-Gm-Gg: ASbGncsS5ITCYqxiRb5sr+UAX9ZswjyrheIHoLp9b2griu2/GlOuTGW8rNr+orJKYWI
	DlXwtZnXiUik4eWEPh3HQgLhgJDyHdBuZFE0wLgEMBqccpS6xnYjBMrSddySTtW3MeTe99IhDRi
	MFHKWKXi8/UXRwb+xOar9/rscewJqb9diK1JTrQDyWTU8oCRsfvGN7Q4EhKr8XavnSfNMLZNH5d
	XxcI3/LfaATuC6s9OIjeE+ramSGkiSgZPC5SclikHkjfwABxkhkFJA5MGtsTAdYcvlAGVkTi9aQ
	BemqaZ+dgvU6uhYEAQ1j6C7BZd5FTrqwhyx/CulJO4S1FbvHWu9maxBKQGihwnUcDwPzJRQzO7y
	uStkPBNBYePVv3BGze9S0DQY1Fm8=
X-Google-Smtp-Source: AGHT+IHZN1tcDyD4GoVcTo50BtDzW8VsL3BkBBiKd/h+7UVK/nY6/nR1DP1DjOu7AhyjWKaQ5ByzdQ==
X-Received: by 2002:a17:906:f597:b0:ac8:1bbe:1a5b with SMTP id a640c23a62f3a-acabbee7e6cmr9840066b.9.1744231060854;
        Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:43 +0100
Subject: [PATCH v4 22/32] mfd: sec-irq: Convert to using REGMAP_IRQ_REG()
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-22-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133742_627717_A9B60CB9 
X-CRM114-Status: GOOD (  12.35  )
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

Use REGMAP_IRQ_REG macro helpers instead of open coding. This makes the
code a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-irq.c | 343 +++++++++++---------------------------------------
 1 file changed, 75 insertions(+), 268 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 4a6585a6acdb71d2fb368ddf38463f001e513c7c..c5c80b1ba104e6c5a55b442d2f10a8554201a961 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -74,212 +74,68 @@ static const struct regmap_irq s2mpg10_irqs[] = {
 };
 
 static const struct regmap_irq s2mps11_irqs[] = {
-	[S2MPS11_IRQ_PWRONF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONF_MASK,
-	},
-	[S2MPS11_IRQ_PWRONR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONR_MASK,
-	},
-	[S2MPS11_IRQ_JIGONBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBF_MASK,
-	},
-	[S2MPS11_IRQ_JIGONBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBR_MASK,
-	},
-	[S2MPS11_IRQ_ACOKBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBF_MASK,
-	},
-	[S2MPS11_IRQ_ACOKBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBR_MASK,
-	},
-	[S2MPS11_IRQ_PWRON1S] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRON1S_MASK,
-	},
-	[S2MPS11_IRQ_MRB] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_MRB_MASK,
-	},
-	[S2MPS11_IRQ_RTC60S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC60S_MASK,
-	},
-	[S2MPS11_IRQ_RTCA1] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
-	},
-	[S2MPS11_IRQ_RTCA0] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA0_MASK,
-	},
-	[S2MPS11_IRQ_SMPL] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_SMPL_MASK,
-	},
-	[S2MPS11_IRQ_RTC1S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC1S_MASK,
-	},
-	[S2MPS11_IRQ_WTSR] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_WTSR_MASK,
-	},
-	[S2MPS11_IRQ_INT120C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT120C_MASK,
-	},
-	[S2MPS11_IRQ_INT140C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT140C_MASK,
-	},
+	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_JIGONBF, 0, S2MPS11_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_JIGONBR, 0, S2MPS11_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_ACOKBF, 0, S2MPS11_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_ACOKBR, 0, S2MPS11_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_PWRON1S, 0, S2MPS11_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_MRB, 0, S2MPS11_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTC60S, 1, S2MPS11_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTCA1, 1, S2MPS11_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTCA0, 1, S2MPS11_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_SMPL, 1, S2MPS11_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_RTC1S, 1, S2MPS11_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_WTSR, 1, S2MPS11_IRQ_WTSR_MASK),
+
+	REGMAP_IRQ_REG(S2MPS11_IRQ_INT120C, 2, S2MPS11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPS11_IRQ_INT140C, 2, S2MPS11_IRQ_INT140C_MASK),
 };
 
 static const struct regmap_irq s2mps14_irqs[] = {
-	[S2MPS14_IRQ_PWRONF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONF_MASK,
-	},
-	[S2MPS14_IRQ_PWRONR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONR_MASK,
-	},
-	[S2MPS14_IRQ_JIGONBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBF_MASK,
-	},
-	[S2MPS14_IRQ_JIGONBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBR_MASK,
-	},
-	[S2MPS14_IRQ_ACOKBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBF_MASK,
-	},
-	[S2MPS14_IRQ_ACOKBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBR_MASK,
-	},
-	[S2MPS14_IRQ_PWRON1S] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRON1S_MASK,
-	},
-	[S2MPS14_IRQ_MRB] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_MRB_MASK,
-	},
-	[S2MPS14_IRQ_RTC60S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC60S_MASK,
-	},
-	[S2MPS14_IRQ_RTCA1] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
-	},
-	[S2MPS14_IRQ_RTCA0] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA0_MASK,
-	},
-	[S2MPS14_IRQ_SMPL] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_SMPL_MASK,
-	},
-	[S2MPS14_IRQ_RTC1S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC1S_MASK,
-	},
-	[S2MPS14_IRQ_WTSR] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_WTSR_MASK,
-	},
-	[S2MPS14_IRQ_INT120C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT120C_MASK,
-	},
-	[S2MPS14_IRQ_INT140C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT140C_MASK,
-	},
-	[S2MPS14_IRQ_TSD] = {
-		.reg_offset = 2,
-		.mask = S2MPS14_IRQ_TSD_MASK,
-	},
+	REGMAP_IRQ_REG(S2MPS14_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_JIGONBF, 0, S2MPS11_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_JIGONBR, 0, S2MPS11_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_ACOKBF, 0, S2MPS11_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_ACOKBR, 0, S2MPS11_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_PWRON1S, 0, S2MPS11_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_MRB, 0, S2MPS11_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTC60S, 1, S2MPS11_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTCA1, 1, S2MPS11_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTCA0, 1, S2MPS11_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_SMPL, 1, S2MPS11_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_RTC1S, 1, S2MPS11_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_WTSR, 1, S2MPS11_IRQ_WTSR_MASK),
+
+	REGMAP_IRQ_REG(S2MPS14_IRQ_INT120C, 2, S2MPS11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_INT140C, 2, S2MPS11_IRQ_INT140C_MASK),
+	REGMAP_IRQ_REG(S2MPS14_IRQ_TSD, 2, S2MPS14_IRQ_TSD_MASK),
 };
 
 static const struct regmap_irq s2mpu02_irqs[] = {
-	[S2MPU02_IRQ_PWRONF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONF_MASK,
-	},
-	[S2MPU02_IRQ_PWRONR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRONR_MASK,
-	},
-	[S2MPU02_IRQ_JIGONBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBF_MASK,
-	},
-	[S2MPU02_IRQ_JIGONBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_JIGONBR_MASK,
-	},
-	[S2MPU02_IRQ_ACOKBF] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBF_MASK,
-	},
-	[S2MPU02_IRQ_ACOKBR] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_ACOKBR_MASK,
-	},
-	[S2MPU02_IRQ_PWRON1S] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_PWRON1S_MASK,
-	},
-	[S2MPU02_IRQ_MRB] = {
-		.reg_offset = 0,
-		.mask = S2MPS11_IRQ_MRB_MASK,
-	},
-	[S2MPU02_IRQ_RTC60S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC60S_MASK,
-	},
-	[S2MPU02_IRQ_RTCA1] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA1_MASK,
-	},
-	[S2MPU02_IRQ_RTCA0] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTCA0_MASK,
-	},
-	[S2MPU02_IRQ_SMPL] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_SMPL_MASK,
-	},
-	[S2MPU02_IRQ_RTC1S] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_RTC1S_MASK,
-	},
-	[S2MPU02_IRQ_WTSR] = {
-		.reg_offset = 1,
-		.mask = S2MPS11_IRQ_WTSR_MASK,
-	},
-	[S2MPU02_IRQ_INT120C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT120C_MASK,
-	},
-	[S2MPU02_IRQ_INT140C] = {
-		.reg_offset = 2,
-		.mask = S2MPS11_IRQ_INT140C_MASK,
-	},
-	[S2MPU02_IRQ_TSD] = {
-		.reg_offset = 2,
-		.mask = S2MPS14_IRQ_TSD_MASK,
-	},
+	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRONF, 0, S2MPS11_IRQ_PWRONF_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRONR, 0, S2MPS11_IRQ_PWRONR_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_JIGONBF, 0, S2MPS11_IRQ_JIGONBF_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_JIGONBR, 0, S2MPS11_IRQ_JIGONBR_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_ACOKBF, 0, S2MPS11_IRQ_ACOKBF_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_ACOKBR, 0, S2MPS11_IRQ_ACOKBR_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_PWRON1S, 0, S2MPS11_IRQ_PWRON1S_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_MRB, 0, S2MPS11_IRQ_MRB_MASK),
+
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTC60S, 1, S2MPS11_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTCA1, 1, S2MPS11_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTCA0, 1, S2MPS11_IRQ_RTCA0_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_SMPL, 1, S2MPS11_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_RTC1S, 1, S2MPS11_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_WTSR, 1, S2MPS11_IRQ_WTSR_MASK),
+
+	REGMAP_IRQ_REG(S2MPU02_IRQ_INT120C, 2, S2MPS11_IRQ_INT120C_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_INT140C, 2, S2MPS11_IRQ_INT140C_MASK),
+	REGMAP_IRQ_REG(S2MPU02_IRQ_TSD, 2, S2MPS14_IRQ_TSD_MASK),
 };
 
 static const struct regmap_irq s2mpu05_irqs[] = {
@@ -303,74 +159,25 @@ static const struct regmap_irq s2mpu05_irqs[] = {
 };
 
 static const struct regmap_irq s5m8767_irqs[] = {
-	[S5M8767_IRQ_PWRR] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_PWRR_MASK,
-	},
-	[S5M8767_IRQ_PWRF] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_PWRF_MASK,
-	},
-	[S5M8767_IRQ_PWR1S] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_PWR1S_MASK,
-	},
-	[S5M8767_IRQ_JIGR] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_JIGR_MASK,
-	},
-	[S5M8767_IRQ_JIGF] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_JIGF_MASK,
-	},
-	[S5M8767_IRQ_LOWBAT2] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_LOWBAT2_MASK,
-	},
-	[S5M8767_IRQ_LOWBAT1] = {
-		.reg_offset = 0,
-		.mask = S5M8767_IRQ_LOWBAT1_MASK,
-	},
-	[S5M8767_IRQ_MRB] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_MRB_MASK,
-	},
-	[S5M8767_IRQ_DVSOK2] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_DVSOK2_MASK,
-	},
-	[S5M8767_IRQ_DVSOK3] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_DVSOK3_MASK,
-	},
-	[S5M8767_IRQ_DVSOK4] = {
-		.reg_offset = 1,
-		.mask = S5M8767_IRQ_DVSOK4_MASK,
-	},
-	[S5M8767_IRQ_RTC60S] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTC60S_MASK,
-	},
-	[S5M8767_IRQ_RTCA1] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTCA1_MASK,
-	},
-	[S5M8767_IRQ_RTCA2] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTCA2_MASK,
-	},
-	[S5M8767_IRQ_SMPL] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_SMPL_MASK,
-	},
-	[S5M8767_IRQ_RTC1S] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_RTC1S_MASK,
-	},
-	[S5M8767_IRQ_WTSR] = {
-		.reg_offset = 2,
-		.mask = S5M8767_IRQ_WTSR_MASK,
-	},
+	REGMAP_IRQ_REG(S5M8767_IRQ_PWRR, 0, S5M8767_IRQ_PWRR_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_PWRF, 0, S5M8767_IRQ_PWRF_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_PWR1S, 0, S5M8767_IRQ_PWR1S_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_JIGR, 0, S5M8767_IRQ_JIGR_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_JIGF, 0, S5M8767_IRQ_JIGF_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_LOWBAT2, 0, S5M8767_IRQ_LOWBAT2_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_LOWBAT1, 0, S5M8767_IRQ_LOWBAT1_MASK),
+
+	REGMAP_IRQ_REG(S5M8767_IRQ_MRB, 1, S5M8767_IRQ_MRB_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_DVSOK2, 1, S5M8767_IRQ_DVSOK2_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_DVSOK3, 1, S5M8767_IRQ_DVSOK3_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_DVSOK4, 1, S5M8767_IRQ_DVSOK4_MASK),
+
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTC60S, 2, S5M8767_IRQ_RTC60S_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTCA1, 2, S5M8767_IRQ_RTCA1_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTCA2, 2, S5M8767_IRQ_RTCA2_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_SMPL, 2, S5M8767_IRQ_SMPL_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_RTC1S, 2, S5M8767_IRQ_RTC1S_MASK),
+	REGMAP_IRQ_REG(S5M8767_IRQ_WTSR, 2, S5M8767_IRQ_WTSR_MASK),
 };
 
 /* All S2MPG10 interrupt sources are read-only and don't require clearing */

-- 
2.49.0.604.gff1f9ca942-goog


