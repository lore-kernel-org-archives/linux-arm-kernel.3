Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECAACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEgfXQmBvwIZTKnjUPX92QY8u5Mv9cN/Yg04BQtYTgI=; b=CYq09agakSBc1LPILihCwLmn/t
	EDoUZk30nxMW90w12xOtU02VJinEIohqQCIgtz2sVgrtGHVeVcS2f2uE7AucWE8+fVt2ZrkxLLVbC
	j3BUfO80kuLph50klhJeUFDpdulXq1OQDh5PgaG51TMDHDwcyLcg1D0yz7DQ97Y5TEK0L+oK9zaTo
	89DyrOohslhOXwnoSb4ClcTTEI5jmDUOR7UYMi1qg1j8XtbjAupGN5lZNrvNM5BuuTRBnQekaLik8
	ABLc+Bw95op2ktVQGpZDz1VtM/zAk70eV1WZCSyWMDIsHV4fNx03W77i7UaiTjX6U2Hau/p0UerjQ
	uVKDoqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBtu-0000000DpKh-2q34;
	Wed, 13 Aug 2025 13:52:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFh-0000000Dj1T-3lel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:10:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2406fe901fcso68852855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090649; x=1755695449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEgfXQmBvwIZTKnjUPX92QY8u5Mv9cN/Yg04BQtYTgI=;
        b=jhaR66KMXzfosZYNP4hEF3lRcO3JO/J50qiNWnONUoI5c0UtKmUGQXEaTvu1Ac5Wp9
         2+KqqWerlRLmnA+zMiWKya2sVdtEbmuEImltX1Vo1/SSZwCSDbzPXCd9T3XI7ZFW4Zqr
         Q26SIkYuL+ltAiNvzIgkswSTaGwVNkT4VF9iQMZ70fcHUoWwAf7jtwKtmPpmsVo8RRi8
         UgiYrK1/vLwm9PZLMFBGKlt08SVMc2e83xZMxNXJO+CZVehw8t4MwaaVkupoObCWG+5r
         CAc9HnkEZyAEQLI2kdIdyVHu8BUq5zRLLSQ1OpMcGzTz7m9SV+Fnt+uPp+mzxj1lmzLU
         +XDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090649; x=1755695449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEgfXQmBvwIZTKnjUPX92QY8u5Mv9cN/Yg04BQtYTgI=;
        b=ik0v/HzMN2Uhai2w1nbvWTDFKMwX8Yw7R1/PLvBsBGOOyAyRddOhfkQsLBDCDH+9Il
         F5UcpFhHBPTfC0VtnezhUVUP0222/MqnRWOPpLPJlPM9xRrBkKpXUW33O24x2lx5Kezk
         egF5iuB+04KVygE7DAiebN3aRr/sw8Er+SQjHftL3mjcfuPzl+Pn6MPI8F+e4Rw4hWi4
         CG3e0qsKq1fqI23ezRm8fvV8FrzNTNiqeDBWE6hHQs7THNqzwbbI7xGGwpzVywBgayEl
         dS9A1hWvf+ySGm8goBOxK+fHlpnahNUlHss4De+W2sYbKz5LhQQLGikxQnyMxr6AbF1G
         ynDA==
X-Forwarded-Encrypted: i=1; AJvYcCW2SaSTSlZl7UJZFaRjujvhe+4hdfwipnYnOOYW7vnp9KD4xiCLRvJLck6HT54gYdabMqPESNqp738qaj897lla@lists.infradead.org
X-Gm-Message-State: AOJu0YxzphdPpLEdoALHwgEqFYmSkc5TFW+R9IQDectyFMwo4Si9ROi/
	XYYLvO4np6jqSLc7+IXeSp1mqQrRc31p1S552YOel5j9raHZoo1S+2jZ
X-Gm-Gg: ASbGnctx4RqmprDHkFRw/2yqIBcPGKFj2FFUGktbvJWD0SUacI8dQWOOifrDkjcY7Jn
	6FwtUEeecCUTIE8CUWeBZ2lZvItNlZ0MkaXcPNGWgKDOcWVFaYP+6SjGw9ABFOvdVQ8XjCcJgC/
	ATIi3wYuNFpOVKvVW7+BvTTB33xAESyfIh8V9n7hryYP3cH7Vqze7GEMBYnu4ncZeZs0PKXq7TE
	RwEQ5DUz3fcKdpHQzTGnFb3Yd8sF72s6sZya0YudUMmvChDAdYYKvMMMkyug+yw+pdRT0GflFBU
	hkirYitFJxOqBnh40ghkzyYHU1svkLSXMVYH6or1ZpzcvmCRlGIK2f6eCiq5ZooPuGKdQetPIoW
	1HIsd/y2D6tht4c+c7V2GKfos4M3aqxI=
X-Google-Smtp-Source: AGHT+IGQetOgmxbvgH8GlqPCrs2OPO9JHPjy7ZNd3WOoXSBNnPAm/Dj6z2ZNFN01W49Z7HuDNX97gQ==
X-Received: by 2002:a17:903:1965:b0:242:a3fc:5900 with SMTP id d9443c01a7336-2430d0dc1eamr41861055ad.8.1755090649047;
        Wed, 13 Aug 2025 06:10:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:48 -0700 (PDT)
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
Subject: [PATCH v7 4/7] thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
Date: Wed, 13 Aug 2025 18:39:48 +0530
Message-ID: <20250813131007.343402-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061049_935503_FFC45455 
X-CRM114-Status: GOOD (  15.26  )
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

As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
if e-Fuse value is out of this range, then thermal sensor may not
sense thermal data properly. Additionally, refactors the efuse
initialization logic in exynos_map_dt_data() by replacing nested
if-else blocks with a switch statement for better readability
and maintainability. Ensures correct efuse setup based on SoC type.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: drop the Rb Llukasz, as we dropped the nested switch to set efuse.
v6: Add Rb Lukasz and fix typo in subject
v5: None
V4: None
---
 drivers/thermal/samsung/exynos_tmu.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5f017a78f437..3d12e95703bf 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -884,6 +884,22 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	case SOC_ARCH_EXYNOS4412:
 	case SOC_ARCH_EXYNOS5250:
 	case SOC_ARCH_EXYNOS5260:
+		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
+		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
+		data->tmu_disable_low = exynos4412_tmu_disable_low;
+		data->tmu_disable_high = exynos4210_tmu_disable_high;
+		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
+		data->tmu_initialize = exynos4412_tmu_initialize;
+		data->tmu_control = exynos4210_tmu_control;
+		data->tmu_read = exynos4412_tmu_read;
+		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
+		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->gain = 8;
+		data->reference_voltage = 16;
+		data->efuse_value = 55;
+		data->min_efuse_value = 0;
+		data->max_efuse_value = 100;
+		break;
 	case SOC_ARCH_EXYNOS5420:
 	case SOC_ARCH_EXYNOS5420_TRIMINFO:
 		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
@@ -899,12 +915,8 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
-			data->min_efuse_value = 40;
-		else
-			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+		data->min_efuse_value = 16;
+		data->max_efuse_value = 76;
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.50.1


