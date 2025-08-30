Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A4CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=; b=cm7lIXqUcg+pIm7VnVkX1aEByX
	BzLwSyy2WjrKsRIGhPIeTgvyFpZYpvw0XRYKURuObTSFSKFDTQSE7DYWKUAXDkPow2MLj4BCArmn5
	wsGBksrOgenw9xzTKVyrU5v3bbVlbebNuldEQsImlgOc8GdhnHfnn18R7/GQRLD9vk2Bz4oyXE9h2
	JQgEDU6Eni+GFnXEfuuWQ1/r1IYGjjwiuEA+qS714k+/JkgdWrn8a4Nkf/VboOVD/W+gz0T3lI0UW
	jSxauyxJYe2rnViJhyD49NgyhsQJMwwFb/QJUAfuX23pt1ssoqigaqn/dmNxASffiudSfOEWmqd/j
	8N81ho5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIo2-00000007juv-298p;
	Sat, 30 Aug 2025 10:27:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIft-00000007jID-3aav
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:19:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ceed75169cso232532f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549148; x=1757153948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=;
        b=at2ejbmFyz9/FjCQ/A41g/zAG1ibZ74mlPyhJ1+htAQ+W0e2t/Eo+P1IXkFKnBfO7d
         8YQPAScbi7iew1hTboV+osnFcgEpgNQG7AGZ+3rWLstQEp8g9rfD1PDWfzJoMeD4a68e
         TkJ/nPy3VYAzkclw4HbRAYh3zlu+sgfK8jIgk682O3e7zDDJ7bCwgziMcMonNq/bf81S
         Q9gLIsJ54T9R2GV+V+fANtX1yCJBFY9MbNZfMqRN2ET1neU5FMUv0y2xP1MrNvaxrBME
         UtJfjVaDhfnrfgLzNaMyh0vX7YlmiEj1ApXKudrCeE0CPGSyMIviB3YhUTLtZSOWumSi
         JSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549148; x=1757153948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZnyvhWBfuOE2HRHqZcb3d7aQZKVvQuhqPXuSlkPMk0=;
        b=GAkZcA8W7+GCjCvuQZiFKkop7OSxphxge2e16AUFJ+Q6PEEYfGuBJXEq6k1poNKmIq
         XJkn8oxAZS5CJoaifpiRjvgo/nwhkp6Q9jiGKHRL5Fagr45TFGMZrSThzA47USEWdQI8
         IHbbA9QJ7zkCE/0CuVdWlrvRu0lL+zZyyOemyu3NPAsLYWpBsNpC9Gmknw1kSfcrg4iF
         xaMqumRQQBza8bk1U+/58gXxAmSzNB9YoKrjLZ6rSTyvMLLRZlFJ8zqQ5QFlPQmYYHIm
         6jJ1AA9jHnJWvHj+gUTV5qWM8CdN87hN7QqllrO+ykfR1uFcARIx9M0uMXm1xwK7qlpm
         eeJA==
X-Forwarded-Encrypted: i=1; AJvYcCXXmnnoxviTN2I5sUuxRj8EhRZZnJN+LaZd2+30zz3u4gwAPcREvdTwi13aUBEYoiehVftBPh2tZOIiK5bnRn4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzOv5/OS6K5aJv4GLhf6/jm4LZhm0AYZV2C8qyk1L9NG5sDdaY8
	yaZ7MO+mfLx6PVTFj1eP5zSpl+iYHR2gmNMSJK0wD3G+tFOy4+pHhS9S5XDf+Q6JfrU=
X-Gm-Gg: ASbGncs0VgYF81nu0zLcDuFjehangseDbXRB+OdleW2nd+FlyrkyGrzT9wFKVWITwNh
	xr9foKdBUZIcf7Fcg4ES9gkVGUqqy7JFpJsTVhYOlFBLsr06hPY4AEtwr42eEwn/cT9monD0vFF
	QH4z72Cdm/CuHrCeoXtxhZz4tOiaU/FFAhJNgcYpOddJbWdqmUhjNaN+FLtqzbxCJZNZO6POxSS
	60T/BxS6qzKBdQup2ztA1pPMUfrZxqcEqtwg2KUxxptUXMLyYd0Yko3SV9dVx6HvHL8Wd5h66+w
	tErFPmR6x3GLUFLETYL8le3wk31IF3noHWUbD4UsON8gK0LWKKrLrJ1izh+igNa+abgVnY9OHTX
	TEOwI+oETkJYmDiYtKKNUQEvW/CoW2y+H5SWV/49VPOsm3/Mv4PQt2UlW3P6b
X-Google-Smtp-Source: AGHT+IFygDyjBigp6iZ69YDdQmrabcSS3QXu7NjqRTS+fEAREpf4yRLclbJcT/wkaR/57d/WiRMZ7A==
X-Received: by 2002:a05:6000:26c9:b0:3cf:6a9:f3dc with SMTP id ffacd0b85a97d-3d0fc3b630fmr1581151f8f.10.1756549148299;
        Sat, 30 Aug 2025 03:19:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 12:18:58 +0200
Subject: [PATCH 2/4] watchdog: s3c2410_wdt: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-watchdog-s3c-cleanup-v1-2-837ae94a21b5@linaro.org>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tzOQaWmU4Y2kJdGcyusF9g24SdvfScKvIrSTOFMPkHE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostAUEYwVAJtWM+2isVc7f3o+wMUKCm0EagDjU
 aZ+JOri5seJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQFAAKCRDBN2bmhouD
 19uCD/9CaCFnhAJlqwZJknBdZ3Sgef20JhK7F0OVjmhy2NesYaYZyETjCt/5O33RFCN9lVnK8+l
 r8tud3DpSBL5Xyq4zqA1Fcuy5iKSpMuWigJ7LqDzquDawxoXtDcZ31/th4ZAg2Kpr0ONMCONsPx
 D8FjGLFmNJEGV0VDDcBKe3Dpv9fmAdvw89yHLwOpoEXPMboThA+eIUeOcH3lViARsaaI5taVPhU
 vDvo7xQOBXdSuzFNKsKrSis4pSoSa6/BTHoVAQX/UeVPK7uR+UnUow5LhLBCgck0ylZCU0Ey2e/
 +xFb7ptteGXzDJs36WyeCzmvqUgsEIDI6IEGdVOwE7PvZLc5Ho+PSsQ/Ij+28dDvZqv8+4yMf2M
 vFA7r+QD520/OAFmEePSx8QzVbFMkXse1EF73AnRYW7SEqS3I+gCYTIPRjflEmMqATuRoQR1NED
 m+72P3imsoEOus4/JdSRV+rXVuEYSK/sK1aUjdrTnT7+y3/CUSMDml1xuaxxHWttgkbHoCuJs10
 Mjm749ZzlD7bOY1J7GWBDI3IYaBquJX85jLKnxz8GpNZ/fXQKO7gLa2bP9eK9h9p5Eo2v7SXKXc
 QVgbwskQ2yQN7pnh+5oeGSaYhU395mJhe6AiPZ7NvNesoE+8d9N7tPq972tjXOlc3G8twG0IkSH
 m2aSXlbDucyrD0w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_031909_902065_AEF2288A 
X-CRM114-Status: GOOD (  15.91  )
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

Samsung S3C2410 SoC was removed from Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of samsung,s3c2410-wdt compatible
and s3c2410-wdt platform device name, so drop both.  This leaves the
driver boundable only via compatibles, so drop any CONFIG_OF ifdefs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 40901bdac42613458f93c09654353190785ff072..f65f25fcce3ecbb1739ff98245b69601dc5353d8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -200,11 +200,6 @@ struct s3c2410_wdt {
 	struct regmap *pmureg;
 };
 
-static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
-	.quirks = 0
-};
-
-#ifdef CONFIG_OF
 static const struct s3c2410_wdt_variant drv_data_s3c6410 = {
 	.quirks = QUIRK_HAS_WTCLRINT_REG,
 };
@@ -368,8 +363,6 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
-	{ .compatible = "samsung,s3c2410-wdt",
-	  .data = &drv_data_s3c2410 },
 	{ .compatible = "samsung,s3c6410-wdt",
 	  .data = &drv_data_s3c6410 },
 	{ .compatible = "samsung,exynos5250-wdt",
@@ -389,16 +382,6 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
-#endif
-
-static const struct platform_device_id s3c2410_wdt_ids[] = {
-	{
-		.name = "s3c2410-wdt",
-		.driver_data = (unsigned long)&drv_data_s3c2410,
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
 
 /* functions */
 
@@ -705,7 +688,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			   platform_get_device_id(pdev)->driver_data;
 	}
 
-#ifdef CONFIG_OF
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
@@ -741,7 +723,6 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
 		}
 	}
-#endif
 
 	wdt->drv_data = variant;
 	return 0;
@@ -929,11 +910,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(s3c2410wdt_pm_ops,
 static struct platform_driver s3c2410wdt_driver = {
 	.probe		= s3c2410wdt_probe,
 	.shutdown	= s3c2410wdt_shutdown,
-	.id_table	= s3c2410_wdt_ids,
 	.driver		= {
 		.name	= "s3c2410-wdt",
 		.pm	= pm_sleep_ptr(&s3c2410wdt_pm_ops),
-		.of_match_table	= of_match_ptr(s3c2410_wdt_match),
+		.of_match_table	= s3c2410_wdt_match,
 	},
 };
 

-- 
2.48.1


