Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EF5EF5848
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnXmUEvVp0FKiuAf5tSWSg+X4ncehtCc9Vi8+FOLDFA=; b=KvLR24+klly1WHbjSnSMpJKEAq
	6Cs7zMXwWsKjMi8wmOxZqDncOE+cjEqdi5ML3LCcCIjPFdTJp53YVUq0bl6ON9neWGXvckwcrt3mT
	c1LK0WlDYGc0Hjj0RRmyYYyVvF8V5mkvxPoHcOJMvl6j8CpalFLzec+QbQZYcp2u+jqNmjFq8k5Fr
	DNDVeA2TPc4dPbW1Qh1MPibyR0MHaQoJXGu9LCFtMcUPjWfm8v3y6nXeOLVJG9u0jmWlR1U/22qAG
	imrXFZjfg+UJ2DfuhCzWTsT9vWhB6P9pjKNcREk01+wNPvCHb5rRROrSrPmSvbA9I54za3SSdEeYS
	Gu8hcldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKG3-00000004qPW-3wDA;
	Sat, 14 Feb 2026 18:20:43 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKG0-00000004qLq-0QXp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:20:43 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-c6e1f417918so557184a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093239; x=1771698039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnXmUEvVp0FKiuAf5tSWSg+X4ncehtCc9Vi8+FOLDFA=;
        b=YlRMK5IuMAv5vBi2xqKT+pyrcqA35UwVtT+EneZ69gOjkJxkxfvwt3SIoZiblS8waf
         w8nX8akwsjvYjak9acdKocptkoMv6CZM7eNxS4i8B3WD9uY4mhRaDtK+O4OJ8kJPdpE2
         oFH3vBzCyexyqpbf6FsuQWPo4XxPiBV4BP+Q/SV4PJe5jJfql85Q3QzgFbxErEaQSZp0
         Kr5XNR8gb5R8tlkwg6ZIWtdbzqy4b4WhsGaomBkCfFcJDMqUJvSpc6DG84df1PtCFLDP
         K+cLfp6lE+iwHiJ4xyJ0kyv34KFh1ztoDZOQ/pS84x0RGzPKqTBZs1s5bseyQrWkleRR
         nzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093239; x=1771698039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnXmUEvVp0FKiuAf5tSWSg+X4ncehtCc9Vi8+FOLDFA=;
        b=QU7uF8kT/xTDLvOI7u0G995+hgOgxIi0zmYRxU97YhIWxmISltQoG/P0EIATZ1Y5Dw
         Q7lWk8yJUx6X1hgh1brKwX8Cylm2GhanDrdMgcytfn0Dzjf5KuH2gzWjbbX8eCY7opP0
         w4q6aOD4l2RCOQloansO1l1mGSTpKkXBgmPdbGU3FbuEzKDkYwCL7bEVTs8R95t5yPOQ
         mNwtSnpPfjIRREDgctMd4TMu4aiunJA8wMtA/ams8uZopxpPIXw6hbRVSwfdP26vGEYZ
         4axWQ5j9Y+THxyB6UiDujwwGxSEE+KkwEi6Iiik9GyZgAHIfC1r5bSmaOZbZHZQvwchq
         6Tew==
X-Forwarded-Encrypted: i=1; AJvYcCURBpuJGaaHDEc1igSBDz4QoV7mKQB1US7fZBrW18z7yOIz7G4xwWROSff2jdh/olmZcdAY4xRa7WSqEpkARPJ1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg9Bcmj3FHD7MDN3hXcrF0cHjv+Ge/hXYxewtozCIg3zMNpgzq
	B+a7LNrnH4dwBRf3Wy1n1JdF5enYtu0sbqFpDwSCgjsQnn1GdcbfvcD1
X-Gm-Gg: AZuq6aKROar+WWqsVd+HPeFRjLmdbm+BVzpbj3o6HlTsbAm2kufx6L8xtFnY9pMSFOY
	NVHIDyalhyYzoCrApKROT1nv91dPaWnjJf8mj8PDKVByrxcRcKcVvvfcKFbZjgtq4IiGrxlCj6X
	kCofo3aVGIwg/QsSLbPp+rCig+V4ccxbQjWUWwPNsuV3sc2vvOYpKAgc/4y09XbQVYFj+bk+LSW
	hJew9mH51lUXWIUZpsldOTpei9kCMobohVqViqmRSw8mo4f96tf+DEcCcewLlpJfaQUE+u/gxoM
	8tzWa6A5NauCBLPgaVOpixJk+HkTVq66ewwqGcLpgxC3VBU+e8dXcH76YHPNizIpX4x6sCb966v
	w/lyg+Txld4IQdqtEpZG/lO5eQDjqO1OUGqpunFDorKRiuGRG9EcSiX/OTv6pmr38TY1j9psC+9
	Z0ZWKHCGonEFGFKtndxB/FyhF6vam2cw==
X-Received: by 2002:a17:902:ce89:b0:2a8:7814:47d0 with SMTP id d9443c01a7336-2ad1749829fmr30161265ad.22.1771093239295;
        Sat, 14 Feb 2026 10:20:39 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:38 -0800 (PST)
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
Subject: [PATCH v8 9/9] thermal/drivers/exynos: Fix some coding style issue
Date: Sat, 14 Feb 2026 23:49:06 +0530
Message-ID: <20260214181930.238981-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_102040_805876_78FAD41F 
X-CRM114-Status: GOOD (  12.90  )
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

Fix several coding style issues reported by checkpatch.pl to improve
code readability and maintainability:

- Remove unnecessary parentheses in sanitize_temp_error() during
  logical comparisons.
- Adjust indentation to align function arguments correctly.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47b92c84ae98..f7f604230cfd 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -252,8 +252,8 @@ static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info)
 				EXYNOS_TMU_TEMP_MASK);
 
 	if (!data->temp_error1 ||
-	    (data->soc_config->min_efuse_value > data->temp_error1) ||
-	    (data->temp_error1 > data->soc_config->max_efuse_value))
+	    data->soc_config->min_efuse_value > data->temp_error1 ||
+	    data->temp_error1 > data->soc_config->max_efuse_value)
 		data->temp_error1 = data->soc_config->efuse_value & EXYNOS_TMU_TEMP_MASK;
 
 	if (!data->temp_error2)
@@ -536,7 +536,7 @@ static void exynos5433_tmu_initialize(struct platform_device *pdev)
 	}
 
 	dev_info(&pdev->dev, "Calibration type is %d-point calibration\n",
-			cal_type ?  2 : 1);
+		 cal_type ?  2 : 1);
 }
 
 static void exynos7_tmu_set_low_temp(struct exynos_tmu_data *data, u8 temp)
-- 
2.50.1


