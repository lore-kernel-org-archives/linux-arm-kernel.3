Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98095C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fU2o4X95qtgokOtXyuTuOjB5JSG2sKXAjoLOfp+pRM=; b=Ta68F1KBSeW5zn5974Wo+GHJh3
	95FLxpVee9+nubjNwew+zLmWY+pYJxKIDQA9feYRSsf9QrQ+Ih7b3vA1Rd+ob5a701Ccw83YD+gGb
	R0k9779BoisWq88jRdOXSTK3tl1G2WQeQIHiIVlTK4PL1NFDGp5qsuuW0No8WyA4KDDTO2a7L37J2
	u6hK9xB7aOQmfdBIwwooRb/8litjSu+QgLmCRcOnbStJdqIuorsZeBa81PbYDnw6+/ackudVKOvmk
	pkRuOYUH5gaitgcIjwXBPukBeCOr1f0bv78nrBYJXliLWEt2z7wOLSapKF/IY3uxynw/Cx3xj7OQr
	9JIt4GYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjksy-00000002WHs-3GAj;
	Sun, 16 Feb 2025 20:05:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkna-00000002VYO-1DTt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 19:59:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so4807245a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 11:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739735969; x=1740340769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fU2o4X95qtgokOtXyuTuOjB5JSG2sKXAjoLOfp+pRM=;
        b=SDtUZz4gG/6fmnizcH0ocZgEMnlIXVrezzF/W8ydh5bp/jFPKKxVRC8e2PLRNc4W6p
         XEudktGVdmriV/mHXzwUuIkB1bHgZEiNgIczylhdoLj9l80hI0Y5pGBsasfgI+Uyfn8M
         SSYKvhkIwDQZXos+jdz6fy/il3uCZB7GWxakoHteSwcbX4oN/ONefHHtNBT81SCvZmhr
         qom/0jWgqD89qsEXW6/Y/pxzUKy88BVI2ouygCvqiDGmVs7dzkwDFS/R3BQVmsy3Wjp5
         Lr0kHbPrBTeV3n3YeiEadwdwQNqC0cvH4clp06oFaOzpJMc4YryeAd3l7upSurq1sSTW
         6QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739735969; x=1740340769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fU2o4X95qtgokOtXyuTuOjB5JSG2sKXAjoLOfp+pRM=;
        b=XvmzcEkMM0tIHF19+I4gh1GQyrw9HpJ7xxMH1F788MTao322bNp8kkeZgVoNjo1gDj
         8+G8TPT+vwIwKoOiVi8+kSS/BDC2M10lIqFnZlKDg9vzfx5zZTRH04AWn2904x4pPLFs
         CXZoVeKyFKBVT6CPOZ0WvJ1BcAO4pluiHv3RF2KHoidjkRzEMgVTEFMmd6cYTkv5P0cg
         3Awlt3UHrQhMuIdrqRGnJQwBNRe5JNkc42/x0h93NBsfL71/bzbBK3Cr0X3j0/z2TrwX
         q5zLaNl1N+bacnNHi/w4JLGeS1/SjhvSpjKTzq7aR1YNi7fqhVjW7jIsziUWOLjG1cQk
         HECw==
X-Forwarded-Encrypted: i=1; AJvYcCXYLh2wuxfPmefeDxl/Px68cLOmbcDHlzeqaiw+zvkWsqpOARXh4Km2SSPehgrfeOOCsOKXpC/7B2mV/5YH70ba@lists.infradead.org
X-Gm-Message-State: AOJu0YyMQ7SybtCmx6oOznZI062peuK/vpF8qNWW/xCxagYFav3waMFu
	7MYwmaqFe7u/ouoswzL3Kso3k4E5oGZE75Pjr/m+SLHGYtLaCgDb
X-Gm-Gg: ASbGncuRPvUvXfQlNjs7+A6zDMHsZOhH1scNjtjSL4KEu5cC6iGSst52hm52fw0BqWq
	ffcQMj5xlAerhR6zNMdCndNI4NET38aJ2lgJJBJ85qVU0iC2ALABCGVSFn0dpsvb1VDTFyJZUIk
	sFoQEYEmbVTUL7JnF+gobDFqQEKsbjVDAjncgA9t3syy4GmpRR6jVCKndwKIP6GDgfw65omh7FY
	XWGu9Eru4XrpR5i0coOhEnrecKlPbzL7Wizqr6HqkHd23hqtMQ7kmpfSarQCUHbC2y4kFEFTzv2
	BmkqzC91i7UQ9r5riOwkX8qbwAHBPw==
X-Google-Smtp-Source: AGHT+IF7AzoUr1XgA1+Ea19Qvyb6/a9hAQAMMD8i2pvWMA2A5gLxhj2+OjivqU0UpmUYjnEdPJhzfg==
X-Received: by 2002:a05:6a00:4643:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7323c751ab9mr30761565b3a.8.1739735969416;
        Sun, 16 Feb 2025 11:59:29 -0800 (PST)
Received: from localhost.localdomain ([110.44.101.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265098570sm3023559b3a.22.2025.02.16.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 11:59:28 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 3/4] drivers/thermal/exymos: Fixed the efuse min max value for exynos5422
Date: Mon, 17 Feb 2025 01:28:36 +0530
Message-ID: <20250216195850.5352-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216195850.5352-1-linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_115930_328456_78760C38 
X-CRM114-Status: GOOD (  14.70  )
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
sense thermal data properly. Refactors the efuse value
initialization logic within exynos_map_dt_data function by
replacing the nested if-else statements with a switch statement.
Ensures proper initialization of efuse values based on the SOC type.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: improve the commit message, fixing the warning wtth W=1
---
 drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 8d26000c73aa..fe090c1a93ab 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
+		data->max_efuse_value = 100;
+		switch (data->soc) {
+		case SOC_ARCH_EXYNOS3250:
+		case SOC_ARCH_EXYNOS4412:
+		case SOC_ARCH_EXYNOS5250:
+		case SOC_ARCH_EXYNOS5260:
 			data->min_efuse_value = 40;
-		else
+			break;
+		case SOC_ARCH_EXYNOS5420:
+		case SOC_ARCH_EXYNOS5420_TRIMINFO:
+			data->min_efuse_value = 16;
+			data->max_efuse_value = 76;
+			break;
+		default:
 			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+			break;
+		}
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.48.1


