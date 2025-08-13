Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E837C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=; b=L26euigJsUjYN+37ewscVIS1Y1
	HbMSc9Z4n5Ea6WwwTZ64LtSntXKQNTZ5r+4NnJas3tyk1WYlW8KX+fPSIgzwBX5iglhieya894YSd
	qLUxS2Ldsm2VYDpuWlY13RP6JHuAlJe6n8lVsVhh9WNhlq7jQ38gEQ/MYcqYDkdzeJbqkEKJfAf5B
	0dcLvvx78tTDTqMoHtH0b5VEFgen/WOB/RRbtkUxzikJcw+/CQ08smrnRweY/bJWfecwU5sujSokZ
	vUbB3zixGfUsOzmNkSpZ7IKxpAhpk2Kk/USebGrF2gfcA2TknTVc5bGIhz14yD0wPwcoimCaEwn1g
	9i7PGEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBos-0000000DoNR-0AnD;
	Wed, 13 Aug 2025 13:47:10 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFS-0000000DiyW-3Yk5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:10:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so5801788a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090634; x=1755695434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=K2t0lgctCiUdJlzEWXDfVGbA5SIGVDv4OaXCdewRYeqPROIaMrY1vyqJNJNC9YYCqg
         DEdea2WNUzpY4JGJW8TvGtErEONJxGDpCvXxYTwGZeEiD5/dPpZEiKB7hhV43Al2diPM
         D4ugBmxMLkbhEtbF+S9o0enF8phlvRfaAi6TVhiSns+x2XNpxY8Bguvrc6gQDSQtkMTL
         9wOnDr8VYSs3Bgj8F31Uvo2voi3BOycnQTK6n32dcYl7Kr8GNnew1DGvVOYgpFiBtpMh
         HrZlg9KS4b+d7RzKNHznlO2FH6vxGPIdWFtlA6FbysgQEw4JclH1XoC7GDU0h9VnMuTc
         YJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090634; x=1755695434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=Kr21lDxmSKexFzE2cl1+SphiMWaRVtkwDJBe/nb4sNq67x0DIGv2I9Ba42S4lXwnrJ
         SBgOkLXK+irTtN2tqHfMJD4vgqE5+x0NV4t4/tAxa6tQL1sIQFf7wIvcg2V/6/qe8m8C
         GkPMf/QaV2nbuj7LnbSMEftFk0mfj4qlX5eWPNCBQH01B9dafGoise/BepNc+3LKejWt
         vHYPiaUnG0Zq2qjcen7d1Il1G/s8e+lAySjsjZKMi0XT96kGNTE3BK9txCxr7XV7YvwL
         RT6YNIxyHO6HEiLy/SUPNTZzhQUjbhsIpco4JCk/unjLk8VYPOxPft1gyraZdLyvGAIv
         jWJA==
X-Forwarded-Encrypted: i=1; AJvYcCVR8CeuR1PAd+nOQaHwo7s0WqtR6dkyYhF389S/6AUTQTC1OkCgDbfOmA8GRlj/xIhlYl7pSTrerD1BIlc93zqK@lists.infradead.org
X-Gm-Message-State: AOJu0YxJKcQ9E0PxzX9tYOcYGDCetQk157wemuHSB7oRyaltzTXg42CN
	qfgqmwZMJKAeUj36mSIid7UbnmDVm9ET2s36H3oZd4oN4CcJmvvTyfmh
X-Gm-Gg: ASbGncuUAGSieIq9u+IPuDvObYQXMjgY+ln2RNDPfGmrOIg6bStBpEetQqn1Z7mHJK0
	1xRHPvJpbQcmpkqgEgIwt03DvaofoLcwaCrhWjW1JNuQ/Lypg7Yl7/tNTqtzpRGZ3ZwYDxWgh/E
	ug1bfEMZvdlLJFauD+UGiNWivapC/GcVGqCeQfMPlZVd0Cpw9uCnDp8xjEI2n+M4l/7VNuL00GL
	U145Df3fNaOm11Wri55diA4EC1ByM6g0EDPxnaarEoIisvU/AmP9emys0UaDKdHu+jdJMSf67Nh
	xZachA1LITOKXNARfcSZf9ii/eYh5Lj0mNVK/YbAqLad3S+9+OvWbS5UwRaRlMb9XBIzgTDf2O5
	ujo1hiIaxE3kLr9HH8j+xWisipe1Q4Gk=
X-Google-Smtp-Source: AGHT+IGEeZfwc8KgJ5Ns1b2FIvyMA302/9ltr/X8zgoJP35tdZsAS0jyCBmXwRQduH4q6OrS/apLgA==
X-Received: by 2002:a17:90a:d006:b0:31e:5cc7:133 with SMTP id 98e67ed59e1d1-321d0d68ae1mr4148290a91.11.1755090633811;
        Wed, 13 Aug 2025 06:10:33 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:33 -0700 (PDT)
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
Subject: [PATCH v7 2/7] thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
Date: Wed, 13 Aug 2025 18:39:46 +0530
Message-ID: <20250813131007.343402-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061034_886857_B02FA699 
X-CRM114-Status: GOOD (  15.90  )
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
v7: None
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
2.50.1


