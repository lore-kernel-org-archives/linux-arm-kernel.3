Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952DACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqYPU935xT6Mbxf99JNTihbkL+VHpmHTTHKi4lhwoZ8=; b=mmfKa3BithRcs+FAn8n/FMP/xm
	auRRuH4ipSb37WY7fcNwfVVWFMgvpUQbSj7XEMcCc0Eq7659jjsryL9xMTH3x6dGKQ6A6nexV/I2G
	s9P8fllCwbgSaDQMhvypgPmZfneVHZtCk3T0NJVqnjozENdQvg0Wxzx4K3cqbtBHaNjPgECu4qO+1
	xUZ0CpPiWo31z4mWgISz9eVUe5DHBldGPpVPkn4s2zRMZrMjqwu1MgrJcjODA2oeOCnVp3olZ/AK0
	9RUyMeWr/dfRZNWSbStTTuUKr4NSDXaKSsiSyDS+HoPjYsLhr2BNd118IawOxVLuZeXneNmyASPpQ
	LwyABv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umByx-0000000DqE8-17jg;
	Wed, 13 Aug 2025 13:57:35 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFx-0000000Dj4O-1efx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:11:06 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b47052620a6so715080a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090665; x=1755695465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqYPU935xT6Mbxf99JNTihbkL+VHpmHTTHKi4lhwoZ8=;
        b=UfVK8FlPUNnGwkbGXz+gsL5myXcm7M8wUo7t7YprSOWFnZGs4DM+SgioQYfl5NIzUM
         PUecc8p417xxTiGf61OASJks6uILYhkaqzyY54wXz8cWbJa1wdqNfaqSNNGhSaJATrgC
         hUiwLbLylF32VI1EZe376o5epAM4SKibfYv8/ocUZ03FCgX0/jJOGKjWvf44tDgaMsp8
         G4XreagurSmpzJtAI1yvgZRU9DiJ8MG36HaodFLLYbMM9Ljyt32SczZRaGrF5wbdFUWr
         weWY5D4KhLYKHlLJDKu2LRIvzW9HK7WjzW7c8ARNGVAcOoIAr5OYgBHOYXBty9tmZX3o
         oCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090665; x=1755695465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqYPU935xT6Mbxf99JNTihbkL+VHpmHTTHKi4lhwoZ8=;
        b=SR793tmSTMzwTjiZYiHgIViQrWcUeAcN7UfBWNnFWZPI6lqr2EVEvVBSJYoDsIuxUZ
         dsfnXUu3SuvrvERd15KvFPPa8W0lYsKxzAbT73JbD0Fnf82Bt0y87/MPtT9+Ttbs28ok
         9kqs/hX7cVq/lSB8MhOZtr1W2ja8l/ZO5G2nkp+e6jqv5fYCeXi6gZ0uNIozf1W2U9bo
         t3FvwpZyx48mYi0TEBvpfAeI7JZuSIOcxQmOisGUeh1IDdXPmR/gcSg5p55yYSSNzMaD
         yrrA4xS/fLW3bohkGv/YhmABmqy00+5t/Tljs7gfOr9UDxyzoJaljx2w0UE0EwBFYXU6
         lVZg==
X-Forwarded-Encrypted: i=1; AJvYcCXcXej7ncmd6km6S4SHQP6vjZ6ivgIZPGpazRCVzY3YokX7XbcqHYUvKCfVkmg3CPgNKnKslaXB1uHsctCZL7N0@lists.infradead.org
X-Gm-Message-State: AOJu0YzUP3VTQ0MB7fTkbdfAhvzwI9tK76a5AnAJvR24RXqOprrgDXX4
	xkZXtxNntm6ciP8AQjdNr3zun0iJIBNhEJ45AS8GEd3LwMOy7kCGoc1e
X-Gm-Gg: ASbGncukby31o/UziDGEuZNdvbUeip56HTNISOW8t8um9JMNZGO4a3kWI5cHuIEYxHY
	PWfJZNksH/DmDzhz19fpGxqWHYuk47n3y0W4+Wt/g+WUxijr3/5pgArRJCW4yH5GUbU8y20/GYj
	O7z4mmKdrLHfxb50Bt7rFECvYHA5wr0HuwlMELH2FzmZXwexkdEova+vKLztcw7Ya/FuEnoMO/B
	RMgxeumAyhkOZE/7JVy7LoAkpk+mnWUg1eP/j/pJF37E+03RHKL5LSM209+sH369zEZqRnYf2SM
	zmzvwFV3M7JqF8MX2NplL31F6mtfy/bx11tvr8KKwNP8ZEmaQGRfHCA226pM957TbSF5lm7vMEY
	ZHJWKd7N0Wz7FIaO4Vq7N
X-Google-Smtp-Source: AGHT+IEr3XOImum0AShefQhjlb0HC1vQdpy7jXh1LMHfhhnS2hv+Ey/hdEltC+XWyCUiKfzsSfAP4A==
X-Received: by 2002:a17:90b:2fc3:b0:321:9462:49b7 with SMTP id 98e67ed59e1d1-321d289505cmr3515824a91.12.1755090664483;
        Wed, 13 Aug 2025 06:11:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:11:03 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mateusz Majewski <m.majewski2@samsung.com>
Subject: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature threshold IRQs with SoC-specific mapping
Date: Wed, 13 Aug 2025 18:39:50 +0530
Message-ID: <20250813131007.343402-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061105_432531_26E4628E 
X-CRM114-Status: GOOD (  22.54  )
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

The Exynos TMU interrupt handling mechanism has been refined to utilize
SoC-specific mappings for interrupt clear registers, targeting rising and
falling edge events. This change introduces a tmu_irq_map structure that
defines these edge-specific interrupt bits, improving the accuracy of
thermal event handling by ensuring that only relevant interrupts are
acknowledged and cleared. The exynos4210_tmu_clear_irqs() function has
been refactored to incorporate this mapping. Notably, for Exynos4210,
a check has been added to prevent clearing unsupported falling edge
interrupt bits.

As per user manuals, specific mappings for interrupt status and clear
registers include:

Exynos4412: Falling edge bits at 20, 16, 12, and
		rising edge bits at 8, 4, 0.
Exynos5422: Falling edge bits at 24, 20, 16, and
		rising edge bits at 8, 4, 0.
Exynos5433: Falling edge bits at 23, 17, 16, and
		rising edge bits at 7, 1, 0.

Cc: Mateusz Majewski <m.majewski2@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: New patch in this series
    simpilfy the logic for set and clear rising and failling
    edges of the IRQ clear register.
[0] https://lore.kernel.org/all/20250624075815.132207-1-m.majewski2@samsung.com/
---
 drivers/thermal/samsung/exynos_tmu.c | 70 ++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 146f29fadea9..5e581055e3f3 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -197,6 +197,12 @@ struct exynos_tmu_data {
 	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
 };
 
+/* Map Rise and Falling edges for IRQ Clean */
+struct tmu_irq_map {
+	u32 fall[3];
+	u32 rise[3];
+};
+
 /*
  * TMU treats temperature as a mapped temperature code.
  * The temperature is converted differently depending on the calibration type.
@@ -765,8 +771,9 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
 
 static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 {
-	unsigned int val_irq;
+	unsigned int val_irq, clear_irq = 0;
 	u32 tmu_intstat, tmu_intclear;
+	struct tmu_irq_map irq_map = {0};
 
 	if (data->soc == SOC_ARCH_EXYNOS5260) {
 		tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
@@ -783,15 +790,58 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	}
 
 	val_irq = readl(data->base + tmu_intstat);
-	/*
-	 * Clear the interrupts.  Please note that the documentation for
-	 * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
-	 * states that INTCLEAR register has a different placing of bits
-	 * responsible for FALL IRQs than INTSTAT register.  Exynos5420
-	 * and Exynos5440 documentation is correct (Exynos4210 doesn't
-	 * support FALL IRQs at all).
-	 */
-	writel(val_irq, data->base + tmu_intclear);
+
+	/* Exynos4210 doesn't support FALL interrupts */
+	if (data->soc == SOC_ARCH_EXYNOS4210) {
+		writel(val_irq, data->base + tmu_intclear);
+		return;
+	}
+
+	/* Set SoC-specific interrupt bit mappings */
+	switch (data->soc) {
+	case SOC_ARCH_EXYNOS3250:
+	case SOC_ARCH_EXYNOS4412:
+	case SOC_ARCH_EXYNOS5250:
+	case SOC_ARCH_EXYNOS5260:
+		irq_map.fall[2] = BIT(20);
+		irq_map.fall[1] = BIT(16);
+		irq_map.fall[0] = BIT(12);
+		irq_map.rise[2] = BIT(8);
+		irq_map.rise[1] = BIT(4);
+		irq_map.rise[0] = BIT(0);
+		break;
+	case SOC_ARCH_EXYNOS5420:
+	case SOC_ARCH_EXYNOS5420_TRIMINFO:
+		irq_map.fall[2] = BIT(24);
+		irq_map.fall[1] = BIT(20);
+		irq_map.fall[0] = BIT(16);
+		irq_map.rise[2] = BIT(8);
+		irq_map.rise[1] = BIT(4);
+		irq_map.rise[0] = BIT(0);
+		break;
+	case SOC_ARCH_EXYNOS5433:
+	case SOC_ARCH_EXYNOS7:
+		irq_map.fall[2] = BIT(23);
+		irq_map.fall[1] = BIT(17);
+		irq_map.fall[0] = BIT(16);
+		irq_map.rise[2] = BIT(7);
+		irq_map.rise[1] = BIT(1);
+		irq_map.rise[0] = BIT(0);
+		break;
+	default:
+		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);
+		break;
+
+	/* Map active INTSTAT bits to INTCLEAR */
+	for (int i = 0; i < 3; i++) {
+		if (val_irq & irq_map.fall[i])
+			clear_irq |= irq_map.fall[i];
+		if (val_irq & irq_map.rise[i])
+			clear_irq |= irq_map.rise[i];
+	}
+
+	if (clear_irq)
+		writel(clear_irq, data->base + tmu_intclear);
 }
 
 static const struct of_device_id exynos_tmu_match[] = {
-- 
2.50.1


