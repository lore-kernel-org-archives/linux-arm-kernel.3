Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD88CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NHu7s5gw1lYyul9BgLj8lXh4B9A4kmI9Hzn2CmTilU=; b=fVDnbR5Fjpj1yi/VVqxd9ng0wg
	KyM0o23iE/w+o9KbX1e2bQ4pXkoa2qga9d2UABeaB2XK6Yhzssnr6ehOBfIW7BGLyPWJFQqUE+oly
	VbezFC0XpZftRSOuxbCZMFlh2Xy/m6cCX5lu4dqv6wRHwzJZSjx6nlJ+KEfK8k7/k+Tf+NpJubDCM
	KnfVTcHKVXP8ChMLhWNCV8pxVVm9mdW7bvsqluh4kzUrcD1weWFXKD6QJ16ugr8iAEBWXY08fM7h4
	CG6/PUfXSNggOLycBgMZxrQhhRgVNVlPu/zQ2tBdInMXK/EKQbIffONa6eq2+6BSMzVr4wKm/QD4N
	EM2P8vKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOvt-00000008BPt-0EFT;
	Sat, 30 Aug 2025 17:00:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOkx-00000008AA3-1TcI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:48:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3cd44b9496fso376132f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572526; x=1757177326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NHu7s5gw1lYyul9BgLj8lXh4B9A4kmI9Hzn2CmTilU=;
        b=yG84ewUpWn+Ncnwqitm/PU2hQZSNjMm9eCxGepKa9iU3TqEc1EiEngaFEuXp+2uBr5
         RJG5j/l05c0zx5gcfk7wxmxfKMoUhywkHl7dgi3PNoIakrv9FG4oVgX0QwWgU/04oLnK
         3CJtD5/lj/UwDmUghiMgC2qf66DdbS+FpCqrgA/aDHqYmLYC4DhBRpBQeKlY0t/0fucq
         kpk/9EsJcpfU/VxQcDHlwmcvY3zknkbN3Nm+VYJC/qYP5wv8WW4JrRxplaxn8eQSYiXf
         P34ZyVthrYmfOLWYsVPaAauwv2SffXYm/THspmc0QxKy28HiJStcnAYskhEQ7Nr2PUM0
         eNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572526; x=1757177326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NHu7s5gw1lYyul9BgLj8lXh4B9A4kmI9Hzn2CmTilU=;
        b=WxFSSXsRufH0A/mrbub2GXlZf5nqA3mT0tmkAVAXBwcswsGq2Dv9nTX+8Ca8e4QNBn
         Ww/sHQVoCUyhLHt+9OUDv/8pkJfvvuTL+td1g7Bkl0VaBR8gJBigoP3WKPBxqB9HfH9F
         Q0G/qDoXNi/3tTvovrq6BkVok1/5dcdhe/hV0DdeQd1Ct6IDhhYrqttqzRFQvaUnNrZy
         i6WiIUETtfrg6Cn/NuhkMzoovNcaC71qkZ7rq47SUdws8fBeKHCVTS8B3/7wxoms5B5r
         /PoRGNImcpzGN8I23+tLbaZaK6nvAXZCjtzaRVixdJMlVNHP388lYb14rmEs1zUE8ZqB
         geCw==
X-Forwarded-Encrypted: i=1; AJvYcCVc/oFXlJVYClpxoxDlb04QV+YgniA7+zIWMvkeXR5ux3yZvmo3/gV6OsGf+HukaHrZkACUQ3GJhIx8mevMUnZm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrtsr3Mfo7WrBKQQD6yDVdMbNw9XvTHw0VtwRH7KY0jj4Ml6m2
	+9qsL896Mc11z6iPg5c0Im8PBXwF+Er+GFVnq/pBqgGck0Blc2u6ilZ62VZqt8rlfVk=
X-Gm-Gg: ASbGncvNjyAnpu1t8ta7iDJngI0pb6zjz7BlCnXhfm6CnOUGYBMfgYsAFZ2rx04+ymZ
	PXd6Kq6b0EkQsNWfHtayddfIXknVUpVi8JivNkS5nXc5K9WCiPDpcgSYwdmJ8pTOTeIPW2A8Gtb
	XgcdoxP5t/gSVYfYdNhWG65/tQe2S6jyges1G5HanQ1LLRBGhkIvayX1UvLjOKRcU2FkyWMDTEc
	pOFrpFIQe6JiE1MKOiYussWodLfsnxDpVaC27X7RQlspPhqXuuBZf5FTJx+VOdf3WDX88VlK2Zp
	jRjqLQrUeNFqhVF/NEwehwpkvtd+zPedeAqK3qd+9jKIY2ZSkB/qo6Qo225RTPbVgSrvPpMENIe
	ktGFt27AVgBGzrsGcwwpZaXbmw0HeE389MJI8GZNVt1YfX2wOYw==
X-Google-Smtp-Source: AGHT+IG3g/r5+Z44VCwqW8bkfFPUWtY+KFSor7fLqkk/9p70DkqbZxuqtb7Kgq+CTTE5OETkMakrhg==
X-Received: by 2002:a05:6000:4203:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3d0fbdc8122mr2137741f8f.8.1756572525902;
        Sat, 30 Aug 2025 09:48:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:32 +0200
Subject: [PATCH v2 3/5] iio: adc: exynos_adc: Drop platform data support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-3-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6AT9ywUCC32xDJqdhfxsK5Br7bqJJTl+mGHOc7ie3tI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytk+UfhpJZqsZdbJJIvPyy0MxlR8ZzP7Y9vk
 SaMD1TerjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrZAAKCRDBN2bmhouD
 1xDHD/0XrX2T5NZEXND6PIik1dMDmd+0HGE2tUYES27XFPsmniDxAgSEe6eVzk9lgqe21JZJIc1
 LcsHr7luK3WjAUNcGYdK9aHIC9n97w6ANM/pqV+4LNHb+ZJaT2EA4yoa72a3vhHpROsEkoqycY4
 uDUyvzYWoY4YczYfj5PT53HZiBeMTPKP0HhmTl4Dyo7ip1UGM9PdgU5OSYmF0D6nB0dYjvI8+ZM
 zF8A+FGUtP6a5oSE2M0QJqfPOuKXEXX/Zdjs5Gx1W8mub0mnfQZbO7iX9L6ASlIhF037rIw0F2S
 mDlh8XipmgQIo+suj0MbhueFwkS9zhGP1oMimFhJUsd0Oidg5VLIHYmPV19XMCSgbTwChCdcjlT
 C6XINIdpWP36Qc8S/2rL/bP0lXLTEqqDlAGDHKhm+yto3OeZIGwqEIzKgEiP64ZZ7zdv/dcsYal
 CDkGJlMhxKa/FH7Zc3JBJ9GzIefC2NE1Wc9RCRd/dptcFJJgDz2ghqblRzlIfsUmtGQniVxcjw4
 8lOfUgWqxA+ltVIXYaFEzZKKo8BGDeVgF5hil3sn7LwO37UM4R4JEtL3CDAs5deIMXNUUyDZJ46
 bH7bcFxXb6Z/cG9Q/Ju62WPMus5oiQSl9FFMLAEaxO/jTNdfWpNBpyHYcWhJN4f3IGMxeUuiC6E
 zQ2aBWIdFVu3qPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_094847_404744_CE94265B 
X-CRM114-Status: GOOD (  16.51  )
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

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Drop touchscreen-s3c2410.h
---
 drivers/iio/adc/exynos_adc.c                      | 11 +----------
 include/linux/platform_data/touchscreen-s3c2410.h | 22 ----------------------
 2 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 30f6d8436e775a8d2177951b436cd45152307ea2..d21a9f3621d96c8051f2062aa6a069e8c29faf9b 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -29,8 +29,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
-#include <linux/platform_data/touchscreen-s3c2410.h>
-
 /* S3C/EXYNOS4412/5250 ADC_V1 registers definitions */
 #define ADC_V1_CON(x)		((x) + 0x00)
 #define ADC_V1_DLY(x)		((x) + 0x08)
@@ -106,7 +104,6 @@ struct exynos_adc {
 	struct clk		*clk;
 	struct clk		*sclk;
 	unsigned int		irq;
-	unsigned int		delay;
 	struct regulator	*vdd;
 
 	struct completion	completion;
@@ -213,7 +210,7 @@ static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 	writel(con1, ADC_V1_CON(info->regs));
 
 	/* set touchscreen delay */
-	writel(info->delay, ADC_V1_DLY(info->regs));
+	writel(10000, ADC_V1_DLY(info->regs));
 }
 
 static void exynos_adc_v1_exit_hw(struct exynos_adc *info)
@@ -556,7 +553,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
 	struct device_node *np = pdev->dev.of_node;
-	struct s3c2410_ts_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = NULL;
 	int ret;
 	int irq;
@@ -657,11 +653,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
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
diff --git a/include/linux/platform_data/touchscreen-s3c2410.h b/include/linux/platform_data/touchscreen-s3c2410.h
deleted file mode 100644
index bf8d3b9d7c6a98fc2392786df2c0cdf128047645..0000000000000000000000000000000000000000
--- a/include/linux/platform_data/touchscreen-s3c2410.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
-*/
-
-#ifndef __TOUCHSCREEN_S3C2410_H
-#define __TOUCHSCREEN_S3C2410_H
-
-struct s3c2410_ts_mach_info {
-	int delay;
-	int presc;
-	int oversampling_shift;
-	void (*cfg_gpio)(struct platform_device *dev);
-};
-
-extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
-extern void s3c64xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
-
-/* defined by architecture to configure gpio */
-extern void s3c24xx_ts_cfg_gpio(struct platform_device *dev);
-
-#endif /*__TOUCHSCREEN_S3C2410_H */

-- 
2.48.1


