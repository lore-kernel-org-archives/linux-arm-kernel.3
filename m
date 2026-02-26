Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C42EFD8FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4JELgxsFHw+6nBu+y8vI4aNbSoxJuvNiKsH4U80RpQ=; b=aSVqJHsUDgouXROE8MM2i9SBas
	kIDxX1+6QHDVonz96duhhclK8dpOQy+CgtZ0mmddUhjrwI6/9XQy2zyGbLZAl4qbZCevF1Deoxlsi
	zKSz0R1CxY+PkBEa4QpdUwo+y/uut78HiUKdCAKo4731OrpEo1wp7WYSwqKlCe3c23rVmz1p37fjG
	opwKWxGryMZV0TlUTTNQF0ku5gap76T1w7J3HZXhK8HYkDZItiFZm32ntFrWmADBFXmGK0H+LpHsb
	YfKXporbINhcZECAs6LBo6WggpZw89RM2bqtZHZLIIaDX9z3idAhIry2VMlbJnWCQMWwE6Pi6xwnj
	5CvcqEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaP-00000006YE5-2vx8;
	Thu, 26 Feb 2026 15:47:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaC-00000006Y4x-0mCA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=w4JELgxsFHw+6nBu+y8vI4aNbSoxJuvNiKsH4U80RpQ=; b=fz+Zqu9baSF84ax7er5qJ8CIsq
	jzEFRHYU/092aDhwjW1bHombSPC3uDKUpf4dGuGBKL5WgaQwy+qRniEu1t9lrTqW9C1QVZ5taaASL
	g2kFed0KZRwyVrUrWmRXBQE6adE+mg2dlfgmVYQtg2ycWLfPS+OqU0h1HhEpx7Bq+uBS+23lH90zs
	B36fG4SNOMsLcro4anEve42iZeUOMBmYRLR0wCph+LTJ5Q7pu7uaEv/iG4GFwATyxXL3DD46KIO7P
	0Lcz1MaYilK1eqGvNRtnqjq023O7uLasg8CaD+7urFSojkKacug2IzCfRGcBfow+IGgjuJlYyPgmg
	/GHpwL6g==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda8-0000000BMys-3FwU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso9320825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120835; x=1772725635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4JELgxsFHw+6nBu+y8vI4aNbSoxJuvNiKsH4U80RpQ=;
        b=PAGWEN2GxVAprOSd5cllcUDlBcxz54Bm6APcl2loXY4YyvUHz9n115Q4P8bjZumkqs
         vxzu55NpPS9F082TOQwTPQt/jmDCMVrhA47X+0UZNFn+X95Kv2cPiYZb+IIkp9omcppu
         8F0tMpC1As8wiKBqlbMEG3xCHWCkDtnWXJQiqWaJ7VgzQbSEZnRS878bvN6XhTRUG72E
         4pPivHeZLtGzlVn94aaK09R0+DZU4dknfdrRMinM19lEJLaIZEnVJu5xoHlb18CaSgfI
         gfMkc72dQEZi74SFTwiMwGhzc2Aicnj6hBos3NWqftzQfP95cRJHcbAGL3Rt4NW4Bjod
         c4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120835; x=1772725635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w4JELgxsFHw+6nBu+y8vI4aNbSoxJuvNiKsH4U80RpQ=;
        b=bRKPKPxNAQKULDBFpL7zuwT/ZR8VFL1YPXdszrbq/LmNn3d6cc8t5VrdKJcP/vZNyd
         h46VEOGEljQS9leXv51Q6amBqinCiZN15eQvO+wOc6w4J97Ybay+jjFWraZxJpd7QVyd
         WXBwU59Zq7bX9HNd/Z77OgaG1aYAtuP1ukbxiTH8inSPvOzEVBW7wyA4ocykEehPzB3M
         v6de+KHXEmrKjHnDFHdZ+cOUtEjanhI0WLbS7ROjaoOSmKxMRZfMuuUXfo9E2Zh74HlD
         hamcNFnrKkA5VM8shZGWaqpTQ/y5V7DQmM/1HDg01rnJW036I4DqLyOu5TVemmvIFXus
         UkFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSCkRlUEX4PN3xezwX9e2cJhRggZuJN10QFEk8mi9d4d3Rqd+3esPkKdhmMd/XQfYXTxV/9IaHJ0ZdME7tSQX3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw2sAUHohMz70KU4bTtL2wKTC2TpgMEdRhyQllYzUsAqknSBKq
	rb4XEwXbS6OF2Ptlwhne8zcblpEibD/KHC0nMTuzREIYyjhmuWvG/HCMDObwvpyVXkU=
X-Gm-Gg: ATEYQzxnQuds+fofVwHXSRFKvfe5IjF6bzRV4f/O9wWPp8mNv0YNZzXSRD2qYHrvA0l
	Z0rlioGj8niSSIoUSKivtNffrjp3IeRZIwM1PsHboERJGNxpaZkrvg+nQB02mYDW1cs5D4VTpfd
	p82NLuVK/5konNRkCk9HaTgwe4BeDOF7nkMVSUld1+jhxdVUcpdWQhRn5kTh0fQvQp+CZ1oCoLg
	HK+/hY+XevwqesmBG0CO23YvvqPFID4rZdEuYq41pVPKZiM60EeFugEAS5ggHL/8+YWexmxnK0I
	5hWRFU29ZG7LsadCgaG5Rvov31pclkUgOmIHVqEQB/hY9dG2ArSVlwAsXZcBRMzu3KktBsFCGwy
	C9Mo7HubAx5kGGTTt1g0peL8MCa9JjZdiy2biI2hlBLGdyI32v/7SYnCNKzsZc1LgtuoY9hsdRv
	tDDJA5Ue5me+bwyWZjWHttPlHSe9gRrGvRi3GyCdjF0Mwm4lAWD6gVVfGTSkactxU7KQxamJfiR
	WTH3JepT6/IOQWyzIAtb2g73g==
X-Received: by 2002:a05:600c:3516:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483a96377c9mr346111365e9.24.1772120835139;
        Thu, 26 Feb 2026 07:47:15 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:14 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:11 +0000
Subject: [PATCH RFC 5/8] soc: samsung: exynos-pmu: rename GS101_INTR_* regs
 to EXYNOS_INTR_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-5-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154716_872783_2F40B5DE 
X-CRM114-Status: GOOD (  11.45  )
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

The PMU interrupt generation block is not exclusive to gs101 SoCs and
is present on few Exynos-based platforms. Rename registers of this
hardware block prefixed with GS101_INTR to be prefixed with EXYNOS_INTR.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 16 ++++++++--------
 include/linux/soc/samsung/exynos-regs-pmu.h | 10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d58376c38179..92870e6ffc1c 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -244,12 +244,12 @@ static int __gs101_cpu_pmu_online(unsigned int cpu)
 
 	mask = BIT(cpu);
 
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
 			   mask, (0 << cpu));
 
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_UPEND, &reg);
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
 
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_CLEAR,
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
 		     reg & mask);
 
 	return 0;
@@ -304,16 +304,16 @@ static int __gs101_cpu_pmu_offline(unsigned int cpu)
 		     CPU_INFORM_C2);
 
 	mask = BIT(cpu);
-	regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
 			   mask, BIT(cpu));
 
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
 
 	mask = (BIT(cpu + 8));
-	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
-	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
 		     reg & mask);
 
 	return 0;
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index db8a7ca81080..9c4d3da41dbf 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1009,11 +1009,11 @@
 #define GS101_PHY_CTRL_UFS                      0x3ec8
 
 /* PMU INTR GEN */
-#define GS101_GRP1_INTR_BID_UPEND				(0x0108)
-#define GS101_GRP1_INTR_BID_CLEAR				(0x010c)
-#define GS101_GRP2_INTR_BID_ENABLE				(0x0200)
-#define GS101_GRP2_INTR_BID_UPEND				(0x0208)
-#define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
+#define EXYNOS_GRP1_INTR_BID_UPEND				(0x0108)
+#define EXYNOS_GRP1_INTR_BID_CLEAR				(0x010c)
+#define EXYNOS_GRP2_INTR_BID_ENABLE				(0x0200)
+#define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
+#define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)

-- 
2.51.0


