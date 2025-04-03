Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B481DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Op+5mEOgNYYFAMowJxBfybjaNESu4Eako9395vK9N0c=; b=2WgXJ4amoKFoexjAY0n0ReV0o8
	sJQjGDmwl8Vx5kgqvf31RjucZ5ZEvIamkxjuGnjZX16y+RMtEdtNrncr8+e3OaituzVVpH0GCRyAG
	BfouqHoPglmblrWaRwqYDT4lmQBzRdDakD/HZ/YCuSiPUT8GaEI/HyTmT518HC1FiAvczyqnAMtKX
	KtHgB0TtZLrBKYZHJr8fg7baDax3VK/wX/VKFf6wlqMXiKxTokKda4VIJ030EFXn/ScmcKD+iuopN
	vNAVGtVWFQa53PPpgSJOPSRK4t8RK7DZkRqmXjwrt0SSjN0/Y6SwFqOZa59cWtl0OQDaEnez1K1AI
	2KEGoanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0H3U-00000008QrR-0UwY;
	Thu, 03 Apr 2025 09:40:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPr-00000008Jnb-0J5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso1045254a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670754; x=1744275554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op+5mEOgNYYFAMowJxBfybjaNESu4Eako9395vK9N0c=;
        b=y3nhRxmnMvR4q2G2sKRpn6MAcfOadjsaKcakGgjMcumm6Z6djIRwhY1vCFed0a5S+Q
         HwBz0DdZ3N1rT6j13G1Oihz1STR5WkO5pTpyfRsiOz3SiZBFEL21rNlFomljUp/pQiAO
         AK4SpboUCfzRWLMncteZDu7yXhC2xPyhQJVPT4TMiEVnFm0fGeNjxOT6W8Lyw5dq998h
         FfEqO3dkjMonvvkp/zKvkjkj+I/AdpDnMFuqY/CHADQ3B/byVf8JBCAzxuuTrKbDNWL0
         j7rc7to512rFbM6VOHCm2ZZn3qo0EkYOOEUVqC9lF+fI2Anr1cuUp/gCphqIG0ZK9i+F
         YcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670754; x=1744275554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Op+5mEOgNYYFAMowJxBfybjaNESu4Eako9395vK9N0c=;
        b=FUNGkjmdv9v41VpwmRciyhlkR5WgVaQsfb7aFVbRZU461iz4cYQqzl/SdZDa/V9ME3
         P7OSw75Ltuxc1ljuOAjV45jCinkYGvhyXhnecDVqOVPZ8x7v+ZuPDGsCmFrk3NVxGMFG
         Vpal7Rs/max3cGJ6NIpTrytFaM4i0jR64En92FrF+V8ld+DMHCSyWg8UHbQntKRqMDnC
         F4he6NhVqQxMVl+Q5Ls21YXPUanAukpe+GCMHZZDxs3VzCp7oggPqOt0uzqqOPatZwHK
         EcyRrel6S6VAhIyf6XzGq/M36fPoDawG7BR7rLmXRU4U0YHDVzEexa9e+v58C4CRA9Hk
         Dlbg==
X-Forwarded-Encrypted: i=1; AJvYcCVD1/3T0x/Nf7L/1vCdFu/pEko4VZ48tLoiThKpMqC5LZdksqjYIirl+TS7a6QPvvo9pKOFhe0cYIjpOVVAI145@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3TKNhxylLySct74iEGefnI1PccALiyGYhPeNSEaXsBi7qs9CM
	5JCl5zJBzR2TgW+orpBVF7B1pMVWl+V1i8AZdrTbS4MavNNv6UATn7xuNAz5uHA=
X-Gm-Gg: ASbGncvgSTteetlUv8OJfqfoNBX3sOUV/iADsKt18h9VAFP5JublkDXrMbmwUmtlbeb
	HR/2J/NzCZRjR5xQ8LkAPE4L39PyGnefIm2SHrxfTS7Y6ipmBRZEga5jRu40srboh6n+T1K12bV
	5bnXj9epVAU2y1esdsCbYqYoJmsiDdCsgVWXIdIu56CFIxOisDDOC6YXylYUB31qat0BAkmaoBS
	TbJ9ng+DQWOSVVJ3FMarp66n6C/YeEnHZvwGXygvA5G1DPBEZqdyIeknMaQlHw7wo8KnsZZri83
	4kgFkzaZ9B/6uklAvOlO0t2zwDumGUht6Dt2uuRIUKcT6eLl+HvwsnY9ofyEYyajjuMqlXojxE0
	x4M9xOrx0Ziz3tXGbH5R5svswMrwS
X-Google-Smtp-Source: AGHT+IHje6/Aj3m3WFy82BhNMOZ83g9HkkSQjWHGqlCFxMgpj6dst82siBK7kkVhW9a2sxdihxbs6A==
X-Received: by 2002:a05:6402:4307:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5f087224bedmr1275094a12.23.1743670753725;
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:14 +0100
Subject: [PATCH v3 22/32] mfd: sec: convert to using REGMAP_IRQ_REG()
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-22-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015915_255259_0D6F8CE1 
X-CRM114-Status: GOOD (  12.58  )
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
index 5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb..a2c821704b771a9f8a10c7efc900812684771862 100644
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
 
 static const struct regmap_irq_chip s2mpg10_irq_chip = {

-- 
2.49.0.472.ge94155a9ec-goog


