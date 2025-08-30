Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAACECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbqsXZ0a+2gRMmLHMi/t44FvhwPty9xFovSO5BTpK8k=; b=f7+UZNbGeHrG1osOq8EdP7hAiE
	2GQv38wseXiq9PShtXSLy/ehzcpz3CER9Vf4vB96Zlsc9CfFXneJoDXmvNEM7QwcXeDYD8LlXfVSq
	7A5bqkX5rLHRtEZQ4AEnb47rBKc9XuN0ryXlk/JqOeRPp6IrQjOYfYHCBOVh+kKQIaWgIwQ32I8HO
	PDlQQgAdBJUrWWcrKv4vH1hA3O663YI5HAvhLTjbuHDJ3mDwYPSxBoxAmWeI/UmIXkjCNeNSo3zbE
	PQWdNWtdrySxXeVy4DpZypqJUBk9o8T66pv/HPUcTmFcQiiWyRfQO+C6Vp/SZP5KzZT0xzfq2GImS
	THNfiqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJfA-00000007nwb-3ZAU;
	Sat, 30 Aug 2025 11:22:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJT0-00000007mti-0d5m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:09:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso38097766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552192; x=1757156992; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbqsXZ0a+2gRMmLHMi/t44FvhwPty9xFovSO5BTpK8k=;
        b=ZHlplW7l9fjPvNH/0ipZ6MOqNKBEBWsTngYkHgt+RdXFCMne72I/LpIvjjYinN4kGY
         oyJHW6reOeUTm1/adBpDAge13Zy4MJLqCLKNqXMGBGN9CO8xyf+ox7xS2y/Cr8zco9w1
         r75ETQk37Gr001zsolZNpJLpgkfAer0fBjP85DaljDYy8tHeZm62+KhCKAWZ9FnRKCrd
         edE3VigDyM+REsZb/WP3LPd2BiEObk6aKviwSGtkSwD0YCjvNPmH5V8IwGK8SJExlbQT
         cf6JdGz8PhLt7vePZTbIFfk4SK+sVEQwsSp/zYag5yW6MdWLqrJgZAAGIvB3jQpnd/s+
         FY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552192; x=1757156992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbqsXZ0a+2gRMmLHMi/t44FvhwPty9xFovSO5BTpK8k=;
        b=FErOjNVwsr1M1z1iw+/WK/cE2FhRVHNTPSHT2CooLowJ1SXeEjAZqtg3lCHqAjRtko
         Sf695tJGQoccHfH8Mg9GzZ0yJoObEjK+eomlsVLgZe+kbjxTAqIUH9IykOT5K41BR0C1
         aJbf01BV6u/AdSKYSt/K0ZV3EY4Uku1xDVqDFXzJUXmL22doz2fn2resgdudvZNJQr3B
         jeUB4BKzhT1pwPfXKFDPIJJ0ODWbmKI17hwCw79sfwqHzCUtfjVW8gumRl3gVpmufCK0
         XxzEnC1uB2XZnbgar+DNAlpfgkHhGGjuzXAnnFXEjIVc4IAZJ1bduLTghyLQmMhlbumY
         wtsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZq7M6QhmepVkdARbWRfYM180MtKu/xUnwGwoEg+DABQybNuKqg2fFJDX2M7ttgssWh+gkW1QuxoBfLcxPTxsA@lists.infradead.org
X-Gm-Message-State: AOJu0YzXhqDT3R+scqWbtXWUO2eCwqfmIa8MKsIshDIpF3CacPbkgKm4
	B49f3GqnCl48pbo+ktE5JENoulqg6f7/1bxaRKukbb+5U+gm36BZkKq5fhUGmEALATI=
X-Gm-Gg: ASbGnctRDHDRnl83PkbxSIhxHjvn1nkCeM9o3LiilM/KOyEy2hrNC2vMCYmaF/FlWlt
	EeUj0jH8kspaGGP8oDphtrOuEYinpkeio+7yFr19Kz99/V+Yc8RuHi6CsqvBA9pnHmUU+T4EDsm
	783GTHTIZrBFni1Y80Ke4owtUtBBIew+upxViHYKKn9oAfsT7N7AEwxB+1GUKfw/c7zlVMB0pdn
	U1DNHtJ1MozQIzY39+b6ftvskJAnJbOOjlfw0CYBLNs/rr2vLhGa4kth+ttW1gVp+Kn7SF3D2Ge
	89nGxU35RywgRNb1nfsgwmK9JoJG84OL3M6Btg4W6iBwoZQC0q1zt1htwY5xjvocdYuC/VeZeDS
	KKzurdwzHxkvCNLl6/QIXhJ9ktjjBBm6hoYkgsJg=
X-Google-Smtp-Source: AGHT+IHYI3tcuSfMfYLyvgkgErLnZ1GzeCpm9S3JwFpVHykTzgSrhsFx7MfV7tYp5tXNWutnC3a91w==
X-Received: by 2002:a05:6402:354c:b0:61c:d7e5:47a3 with SMTP id 4fb4d7f45d1cf-61d0d365421mr1981474a12.3.1756552192554;
        Sat, 30 Aug 2025 04:09:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:40 +0200
Subject: [PATCH 3/5] iio: adc: exynos_adc: Drop platform data support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-3-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KjoP2OpIwgvcEU8lQlbyugpaZUrY36rc56GQiCq2XW0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv13VGu7FUVwm7lV7kKSuqLAH95o21fWUsyk
 kZGd4D32xyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9QAKCRDBN2bmhouD
 1xCpD/9RsBrZtrfnGAO6kOBtpZf3RsuYS4WozEoGAPOZ/+LUFG7GyY6PHdLh04yO0tyeru9lmnl
 NWiyylXT161JodBZBtmPzVGF03rHBTAOUplPZd5paYxfpJwt8PJb/xHmt+0xSbnapKtKq200hOX
 EUPwCpJQ9D8g6nPMbYUQ6Ens7xPCUMXbhA29e7wK9UBBL0oTOeUZRaBbz4p0phSh1Jm1shYTVXp
 QngUaBT09dvDLQfrg9tGI+JBpDndf89JRLDDK3yQ/Vj813uwCaXSU3NmD0OKS/vtuUyzo/J0OIt
 8vVneJFmFtj4xhz1JdbVUnA8vMsGRMZLf/f0M9GRJHxy7pHzmzW6OUolCzk+CHo3KCQgbOY1coA
 6v46Kib9uoMtvr7Y+3aQb0c+2zWCV24+9ia905h/shhAk8pEhuZun2FPDPiUxSr490p1irdBmt0
 6OCDoUzRL5lkSOt6avOdIL9235r4vBEvl2HvUzT9elT+Z6862INH90abu3DWL6oAm+rk4O2k401
 /PuIEEZckhNUQTxHX/j6Hsvdc+1QQgbLp5dQXn/VfZp8fCYyNy6NE+jvz2674Gdvk0LFg9KbCrn
 v26uvKiam2qS5ejw+6+GF74I/T7rOXWawPDPYNvrAjuXZOsC2O1WHTbgNsWyDAC4U4RJ3YDi9gQ
 EEPu7EfKv7b8Umg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040954_198665_0F46A26F 
X-CRM114-Status: GOOD (  14.05  )
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

There are no Samsung Exynos SoC ADC driver users which bind via platform
ID, thus platform data is never set and can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 30f6d8436e775a8d2177951b436cd45152307ea2..dd1494ee365a7b34d6b485ee4c9e753f50b5ff26 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -106,7 +106,6 @@ struct exynos_adc {
 	struct clk		*clk;
 	struct clk		*sclk;
 	unsigned int		irq;
-	unsigned int		delay;
 	struct regulator	*vdd;
 
 	struct completion	completion;
@@ -213,7 +212,7 @@ static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 	writel(con1, ADC_V1_CON(info->regs));
 
 	/* set touchscreen delay */
-	writel(info->delay, ADC_V1_DLY(info->regs));
+	writel(10000, ADC_V1_DLY(info->regs));
 }
 
 static void exynos_adc_v1_exit_hw(struct exynos_adc *info)
@@ -556,7 +555,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
 	struct device_node *np = pdev->dev.of_node;
-	struct s3c2410_ts_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = NULL;
 	int ret;
 	int irq;
@@ -657,11 +655,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	if (info->data->init_hw)
 		info->data->init_hw(info);
 
-	if (pdata)
-		info->delay = pdata->delay;
-	else
-		info->delay = 10000;
-
 	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed adding child nodes\n");

-- 
2.48.1


