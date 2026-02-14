Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72D2EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9mMRm9Rf8IRm6thRLVnHSRFul8AYpRyy4igzBQWHAs=; b=rZZaKfBM3wD2g3ZyBIvp4TfGy+
	lOeK9Ho/87a9s/TLcfqZHuu3M6xNgBCPWInDmOrlFjTapni+07jFgX28Xlu9+I03mYz2QRrDZ5DbY
	5545kTjr6RAwc+qbADLp4brQIthA579DI4Ku6EsnT5NflFHBTfT6E6S34mRKwfcrQKIrdjmeMUK+y
	I5IaMkSwp3x+34PDrQYvOmkaBZkrNoqdW1ZjNA4ZRB8qgh+FcBQXK1L01cPRAuCT+NniKyuCgaZSU
	wq1t58wtqUsgcRs3BUwM4bxIFivYNyCkCTdp2oI1MeL92wttvhibqJePqJL5YjqNMNfIDcsjMdNgF
	ufdOAWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFV-00000004q2Z-2pMu;
	Sat, 14 Feb 2026 18:20:09 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFT-00000004q0e-0I6M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:20:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2aaf9191da3so12890585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093206; x=1771698006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9mMRm9Rf8IRm6thRLVnHSRFul8AYpRyy4igzBQWHAs=;
        b=MM2Q5vWKAGrPzCxXV2la0eKizQSuRfmlCKvo1R6rq1RLJfC4hMZBi6Zu5rm8uRj9Uu
         mZ/oIDLrQpypv7hzwZsUyvF4LTGD28d5g3Jn2Bz+yF0OgPdnvHpVHQh+bk0BruN78Ccb
         4uYHABRoDi5IPb5my4Y2wp3ajZjqI8Gkp/Cs+bLVed1ui7ctnkh3vRHG4/A5GflLhTrY
         SAtbhLGx9Boos0TsEVVZj/8KeLu9Dk8SrjjqsJebPW66TjaPmMmL2aawBreQldoDMHgG
         dYxOqCqLK+R/UZSiqovmJRbFcTRHuotjL4px+tonPF0XSiynRrAwaNR9O0A66z0KcPyz
         iPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093206; x=1771698006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9mMRm9Rf8IRm6thRLVnHSRFul8AYpRyy4igzBQWHAs=;
        b=v5HJPuUAGNyDUl4bpbNem/qOetfO5xTMMwY4tu7TupD1FF8cPHTM/VOjnBD7rGnoRg
         eEuIKQVQE6M1BEkgnPQMymt8qBouTmTo8fDeVkaPYn5dH98nSwYXI69Pp+oQ7+qwiDUg
         +vyPp/4brRLDtwZSZaNSN2g8AfjBfwNSnU18q0mCR19CjUSZAXa7KwX/Iz6j3+vyTQ0k
         3TVpa1xh6Nxw6vJoOtN/IFgPNYG7qHnXDOrUpxBKnRnnDQ9dgMEI36d1mOOLeoUh5MPf
         xgSF1sJOLOyxCDpDYQEXVokqn6UTCvz9F1iz3SOEbocMoSYPS/dvbBN1h6KZF70xV1IJ
         QjEw==
X-Forwarded-Encrypted: i=1; AJvYcCXzJa3wZW58iWIqYfOzyr80P/ypQ88NUab0Hua13r3tKHh7OyNXCJH/+bqJAko7Q5sLcbyEbeyPrjXEvZ/5xhCu@lists.infradead.org
X-Gm-Message-State: AOJu0YxqQpl9b1DPUPc+iXBBr6gMGhMU7mulvyzwFthCitjsoET9S2ym
	QqY/PA6ziHG8bf6IZWeXogaE7Ejz8IaXh2LhAb2jqdwK/2rdPF0BaDmN
X-Gm-Gg: AZuq6aKJfdmEvpdeiwgMVysenybnzfGM8qwuasTKAkGHVvJE9IY9UIU8ERhXzm+/rmt
	wCvBjkyNWwplTIo3tbU1awUbXqZMqP0pTFyOQT1O9Q/t2KgHYNbzJ8vYVfPI7O5GVEvQIo4WIGv
	u+l5RdMRXS8Sn9epdYi/52QsRsaovG9BO3YYU4JM/QX/OAW8tHIHpjZCFjD8Jw1zTLEBjAluiJL
	r3Q1GFcNeatsG8YqbS0V1rpWzAQ899oJnkR8yvJrviTfRW4WbQfNOD1arbdH7x98siyDCQD/QcY
	yfF7R3tbLVnwGoCSCHb+IaSTHJTHWDxJNW52dUQK/q1n+Msp5M7loc8eSUVAjz6Yhy3YTmbndbp
	oj3u/a8xKn0EOBvQJyb707+F1XYRKGYy/zfciNz5rOigskW4SLPqdjEVZSgGb4M/0sDNDlkXJib
	Imq2OvOGFKK6Lisepzk60=
X-Received: by 2002:a17:903:1b43:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2ab505d91ccmr68367655ad.40.1771093206154;
        Sat, 14 Feb 2026 10:20:06 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:05 -0800 (PST)
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
Subject: [PATCH v8 4/9] thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
Date: Sat, 14 Feb 2026 23:49:01 +0530
Message-ID: <20260214181930.238981-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_102007_139197_1CE4A4B3 
X-CRM114-Status: GOOD (  14.02  )
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
v8: None
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


