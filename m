Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA612C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvhhvpDOxzlX5SAkLZgkSUnI6uZuO15oKBiHsWrIAXo=; b=twy5TYU69zh2VzOySeDENJ1wcx
	Crlcqh+ASupCvZ5IvA8XFqbRjTCxXnmF+DYPxEiBZ2iMwDcfumF2QJxubaEdcyAeRPWrnvsPlUZSw
	F8pBSIHh384UVhBL1Xs3cfBXFXDbau/dRAmDVz/UQFOzEXigz2WM6PLIswXYmhpibQBpyHK+6v2Y1
	Ii7XMh3hBzE/1X2zCsjEVC3K1bWH180JcnEd9RNRf6qvfW+u2v11GUR67smEej485WLco5L4+28qL
	clVHkFQBYqbmhNALtPZlB/hM003t7ZQGSrLbddjShFNITdK0srbxJKkofOIFA0Wft/f08JViuNpmA
	9locOPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6if-0000000CqmU-1aKR;
	Wed, 30 Apr 2025 12:39:21 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6dA-0000000Cq19-3y4x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:33:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73972a54919so6064605b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016420; x=1746621220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvhhvpDOxzlX5SAkLZgkSUnI6uZuO15oKBiHsWrIAXo=;
        b=ftJ+EnBmWNs+ihnEBy6VkSsZg95CgjPArZNaPgFJTxYhs3wltBVzpAfvm/4FRd13Xd
         AeSOwiToyk1tkXMdTqJM7v/cLQG20CYlVRzsBmnn+AcVX6FdDca20GU9a4FuHRhltorM
         VwH1h+YdZbtHVMytWIOjwfkDB+lASCs3UFf3s1x/H6Ioyfy0yXrO3bQHhjncDXSu8kYw
         6dfH+mQquhuOUSQXAfVENjrI0islx5upkjifCnYAJtcOH4mqX5ZTVxt7SDgD71LGSEZb
         VwgGbDmXQml6IgoiWNb8QZFpYafLau8cLXGNyqjAyo5DFYU8F+rGf4+idqRdneM3l+sy
         OkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016420; x=1746621220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvhhvpDOxzlX5SAkLZgkSUnI6uZuO15oKBiHsWrIAXo=;
        b=WGEg+h92B2wN52rlSzguw8/B1WbNqJT/L2EHuQzGMUR8qRUKy/+QAIjN2boENnL6os
         DMUUKZfAvnwzYK7PpoV94Ud4N9z3LyM7sZA5pXF9+HcILg7ct1DUdZijPUcTkDxY7mIf
         z7NFX9OLq53g7juiWCS8MknUA8Um+eipY8QDE0BawcIR2BQBcyvEDJt4tZfjyMUqIhbV
         xZK8H9nNzaTFqRHtnjUXL0DLWYt79sKy0vq9cqwYUedtcjz7/89FgKIYKpZvM46GUaup
         OfnDDTs//7Pumkej6dv0bXCdOAGCB1JzSN6QbG9Ardsz8d7u7FE86UTLciZ8WCf1Hvma
         3RgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQHfrSMPfMXO82EJCTMaMQY1Y1DvYvJfBmgI1spIkG0nQsFYHqiEvK0lHqXQTESy80mQEZktCJ9vFWQTLNqlnT@lists.infradead.org
X-Gm-Message-State: AOJu0YxQSbLLB8z86JOIBatK2x/tSkBg8TsZVj7k7jX0EsL5aNvanuXZ
	S+3IM2RH9RVJjv6F28CpnYkGWkV3urrxsqQJC12r51AyvQdMs8wH
X-Gm-Gg: ASbGncvBe8ORu6D6jl3hU6VkD5ADqPahFBOjdiHwYzFbLbP+JmK9pGlzxzZHcjdSdS0
	Yky+Y/+7atYabGOLzH9QFXZzFhKSUhH57MAMW7VszG8LLRzG2MHIZc1wejPU8d/RqC4Uq6R/7dd
	0kV6caSnvR2/5rHWR8bvEYQkbgQg5Bf2YmQpLL9Xr7XnqzJrKeMZHnkmrZTCqa9i6hJv8LncBfk
	XxyjoUSzKZIKyhya6Y1eVWTzI/ll7LTUPb11dTGRD3ILpgKmgtmosAT0EiGli2jdZ/IGl8PaY9k
	HZ9yQSRFPiw+zfopUpE8ak947tGp2qRO72hXLoW3qJ6YCeUXN7iGEg==
X-Google-Smtp-Source: AGHT+IE32P919fQ5R/hcnyijMUiuE0NQgTE1aYia66YLx8XCG3ZA9kGC6cfX4skbXBq1rJ+lGp2Cug==
X-Received: by 2002:a05:6a00:1496:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-740389cb685mr3926486b3a.12.1746016419699;
        Wed, 30 Apr 2025 05:33:39 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:38 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v6 2/4] thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
Date: Wed, 30 Apr 2025 18:02:58 +0530
Message-ID: <20250430123306.15072-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_053340_985998_C5B88045 
X-CRM114-Status: GOOD (  16.25  )
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

Use devm_clk_get_enabled() helper instead of calling devm_clk_get() and
then clk_prepare_enable(). It simplifies the error handling and makes
the code more compact.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: New patch as per Daniel request.
---
 drivers/thermal/samsung/exynos_tmu.c | 77 ++++++++--------------------
 1 file changed, 20 insertions(+), 57 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 04517d52afbd..aa0726b33c84 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1036,65 +1036,41 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
-		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		return ret;
-	}
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-		if (IS_ERR(data->clk_sec)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					    "Failed to get clk_sec clock\n");
-			goto err_clk;
-		}
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to prepare clk_sec clock\n");
-			goto err_clk_sec;
-		}
-		break;
-	case SOC_ARCH_EXYNOS5433:
-	case SOC_ARCH_EXYNOS7:
-		data->sclk = devm_clk_get(dev, "tmu_sclk");
-		if (IS_ERR(data->sclk)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
-			goto err_clk;
-		} else {
-			ret = clk_prepare_enable(data->sclk);
-			if (ret) {
-				dev_err(dev, "Failed to enable sclk\n");
-				goto err_clk;
-			}
-		}
-		break;
-	default:
-		break;
+		return dev_err_probe(dev, PTR_ERR(data->clk),
+				     "Failed to get clock\n");
+
+	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
+		data->clk_sec = devm_clk_get_enabled(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec))
+			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					     "Failed to get clk_sec clock\n");
+	} else if (data->soc == SOC_ARCH_EXYNOS5433 ||
+		   data->soc == SOC_ARCH_EXYNOS7) {
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk),
+					     "Failed to get sclk\n");
 	}
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
+		return dev_err_probe(dev, PTR_ERR(data->tzd),
+				     "Failed to register sensor\n");
 	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1104,30 +1080,17 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					dev_name(dev), data);
 	if (ret) {
 		dev_err(dev, "Failed to request irq: %d\n", data->irq);
-		goto err_sclk;
+		return ret;
 	}
 
 	exynos_tmu_control(pdev, true);
-	return 0;
 
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk_sec:
-	clk_unprepare(data->clk_sec);
-err_clk:
-	clk_unprepare(data->clk);
 	return ret;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.49.0


