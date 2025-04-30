Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6F5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjF1aak/Vxutzt5SCKZiyBKrPP8O+zRq73MMdmerku4=; b=pR1935wwODdh6zSlLSemUygD1Y
	4oy/U0LHd8GLPlnRFqhK3Xm9w8j+VvQc0zufT4IIhHAFtsOYtN1pSU3bfKmw1OsDrrrLSKwFaGjt1
	S/zrP4bKebz7bl8/rPXfbnTc1U6IXn5zIowC8/siNKESedW6s4viwWEYY92BV6qAPEQldGFARG2xK
	YoMnqRBHPOuvYckj/u/WT80i9I79xaPQQlrJmEEBDc4hNFWPB6TaHTGZH+HKWdw/bTXt23xvQOA8J
	EmnzvbSLxTA2L4vptKXw+1Gtpxo2TLMy9aQCOEfrvVEZ2s0kbvcPRKcbk2Yu0CCsKBcQWOH+62Drc
	01OFL8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6mT-0000000CrGV-3SKO;
	Wed, 30 Apr 2025 12:43:17 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6dO-0000000Cq3j-0zpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:33:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74019695377so2846818b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016433; x=1746621233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjF1aak/Vxutzt5SCKZiyBKrPP8O+zRq73MMdmerku4=;
        b=Xw0fpuRMlTsB5jisSxdZyEAgQrDEH5St6MFXVpUaHLrTao5VEjViQWD1wHm6u9bgd/
         TgE5LMmW4lNKswOSLUC3r4hW/bujTwWCXzxi9M2uEjLInoc5cLpyzwknEZa7YBYIUAXM
         gUlFPn0X8TFAL3Of2H5fhVCkZ6AIkBabhKrQ0EVgI7Ym+KYGDXESe3+UUkKT6nhTC9zx
         abWRTdRQnQXJX4I2M95YAUGDSJEMwM/rAp9KPmjAyhHUTGcmC3yG/3f9Y2cTs8Ujsl5u
         v58W8tdM2totoq1J2vCneZ4Nw94VLxfQiAWrCV8/Woje2NRYH1Bm+wudu2HkZPYveEt5
         m9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016433; x=1746621233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjF1aak/Vxutzt5SCKZiyBKrPP8O+zRq73MMdmerku4=;
        b=ZLauWuhyY2T0gPo36osR4NVx6yLi/DlgQ0PxQC2Br+vvS1bvZdHUf9KV9NCBlXJGMq
         uHaQ27wQ8BiBf9tFWw82dscZ34gmhEjDYW+inIK8dBTGPkTZxVNkisfeWjsMLAMyJk0v
         dEvPIBDLmtuisZBsX/tJDLn6PpVedFjpnq46KYUcKdAKzIkrIO3IdUwuk1GZKiRR5S4+
         sWqZmBygRz4CZcWoLzibh9OmFJIFwhfBMh+nDGnBb0SCL24i+0SzHWNk0yDrDXT+ifKM
         eoRUk0e4Q+zJKOa+4NgKbZVEWtbiK9ylan0QPgZrkcVZTLktPEbYLB+R0aMX8pCMmb2u
         XkXA==
X-Forwarded-Encrypted: i=1; AJvYcCVF2mNA6CyLuNI5QanQ3beFxmBgkuz6G+ZkWQ4rFmtfsxdm3FXYrPaNlJ4T99wd7X+j41pi93zspPRb8JJykjIX@lists.infradead.org
X-Gm-Message-State: AOJu0YyNcc4sSEjqYQ0Neh3qgMXTadwJic8iCJW54kzJwo6MBdgW88D3
	ezctJfBfoNtitiC3s/kkmnZh/mUPlp62aT6gQZU8fmoHsqLtac48
X-Gm-Gg: ASbGncu/zhv6QjwjrN8ZQ2qKrXphaqpVtWX++B5pbn4NkYeVYFesAq3bCa3mX2Ny1Q4
	8uZ/A/Uj20KvhN7MceEfZdAVodtSjzzWAN5Oe8yGQuenzPKUj5UY43G6839slka/z9jKPEdWimJ
	UFlDb/6jhM8uI7Q6RoqRh6yWy66OEcs3HDbWyeGzXn02SZ2odd1f20cbn+4vdnRCoxASVGL08BU
	DszU9UGfvjfLO/NIV0ePlp+8hT7fCyne9IJPYuqNhAFMksp4Q5XLg6lIqFzX/raNZdWijT5lL68
	YG8ZqB91mW3lgaaekwaM2om4lujutOcFsrzWirHPUmKJz6+yDQ0Qnw==
X-Google-Smtp-Source: AGHT+IHJKBDe80VIu8qKthsvPbjAJ96qR6Xh6rsf0+iAijz4bJVrcEqmDWrR6oeCmx91YoLYuQSEJQ==
X-Received: by 2002:a05:6a00:3a29:b0:736:69aa:112c with SMTP id d2e1a72fcca58-74038989dc9mr3923336b3a.9.1746016432889;
        Wed, 30 Apr 2025 05:33:52 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:52 -0700 (PDT)
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
Subject: [PATCH v6 4/4] thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
Date: Wed, 30 Apr 2025 18:03:00 +0530
Message-ID: <20250430123306.15072-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_053354_275010_6FB50B91 
X-CRM114-Status: GOOD (  15.79  )
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

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: Add Rb Lukasz and fix typo in subject
v5: None
V4: None
---
 drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5f017a78f437..ef216aac13ee 100644
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
2.49.0


