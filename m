Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB93CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLjx2S6qya2QQP45Rnk1O89a+/wYhcHKpSOmbPHkRVo=; b=4l3O64ldUF9ka6MULkdLDIcYAD
	ug+dAeUtSj3hjpfe7xr4TaeWu6tL9tSd3SXFSmpo0lGXBl3Wv6jem6dCCS9hFrwhbqx4FOqIY3K7M
	nvf/bOt8ccNTvpOstPExYsxSxM3mx8EKvxiipN3njyHX4Pczb0rOFk/D3N4BoPYyUDuJ5YHOn9Nch
	cvnSVY3mkC4hMeZsu/VVAb9bfoweCrvFva6St7K3qN8oBRNKavqP0cEvjt1yDiT3Qi0itNICgSk0D
	vxH6+Pa/xaNg6WSXcEQfRVJ8A72cDaaSlAIeHzDxf57WigazPIO+FksN8dBanrlnhZYAWXEuywuac
	sbYr8dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBwR-0000000Dpno-1t3r;
	Wed, 13 Aug 2025 13:54:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFu-0000000Dj3c-38d0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:11:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-321c41cdab4so1202630a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090662; x=1755695462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLjx2S6qya2QQP45Rnk1O89a+/wYhcHKpSOmbPHkRVo=;
        b=HTdy/MTL0iwvdlFuRmXOU7/MRwJ8B8goKdeTRcDhjizOtOxT3LfLmyr76PLCRtnkXV
         Ucefwkh7YktDFW6Lb36cf3QoVAT9aokyYJ4+kqBIa06v2ZKM5iHov0bw3VbcMchIMEhG
         r4Q8LAPztmi4Ayf5X2EJQ1NODd9rwUZqmr0CZvFEo9FaqcLkbMflv2IIy8PkgfShXjvX
         y5ZbeHdxgaLtO56D/sTlN0v51rBAyqp2xCFItPAwayiMNkZDQLk1Fg6nVvdur/teraBK
         VfM0MjY9H3OKDgNd2K/zEArI7t5Y9q2g9P08DOQbYV4lDVvlrvzE1mmodakfenuIHw6+
         w6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090662; x=1755695462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLjx2S6qya2QQP45Rnk1O89a+/wYhcHKpSOmbPHkRVo=;
        b=f4otCDCmihJxqHxLSWkuMWq8TiuFbPfQxjzsUCtbdpy8eEfe9pobiHTwJ0v0FDxXYv
         ey9QSjQApEhYH/3Su46HN9Fyt/LHdyhIjKiUyglScYMEB9ACeDb/F8Pl4IezefPWySX7
         9lzy99/fkH1lNiLguz35khf8sITLvyIxnoE7yDqXNj6HPQJPInU4JbkgnziS0jqQrndv
         GIYROfgTBEugpB+DTPAfyg5D8j/Gt+AGWwdlgyRQPhD36ytmes3LUkclfEi1EH9CDeYA
         wAiMInS581zypkfsMlWx+ztcOfAiJ5qPaiNsj8PWP9qKYu2yOm/uPOcdwd5HDuh11x5o
         bX7g==
X-Forwarded-Encrypted: i=1; AJvYcCXThjb7bi3IfVpUdiPh+KQyT5y9+9g4iB55GwEpYvg/iRGgWDMp7VBFn5DLk9dU4oldbK3kKe9j9McxuWfOjYra@lists.infradead.org
X-Gm-Message-State: AOJu0YwFE0hyOFl40BjkBv/4QrgbVzA/iCjB5kYIQb2ckNsFXGIVkx9C
	VQ+IGAGzzdr9UmtBrVljnRtK+oSCa1NvD7g8xvflG3wEJiQJXXQT4tVe
X-Gm-Gg: ASbGnctpRp1FLrFeN2Ujw4BMHKn5kZgZI6/+IaghmvzwicD56Dc+jn/U2ISsf78hRqX
	FTRALXQEzN2a/rUE57BHzzDO7eyakTKsEpSBg8vUWBK8E3lkUzS0F5ON6LFhQ+V326tJHjeC33D
	bU2qW7VDwyyLGVmEWSniXowcHHogbGP/qtQzil1oe0AEIjS78ayWboX7ln5scXo5AMKTSUttEWb
	SNVxb/YFoZBIfb+qAY4dcXFLLK5nAjNe5lRgozw6K06FOltbmEv061X4fPl5W3Dfr5taHrMEJvs
	ZLmsN3dYptRsbQJ/xZ49kaWbv5Pmzm/sEqb6tyDV2WBnCX9jE+LsgdOpS9Lf/hsfUSdSnv+mUUH
	sFMUKpvgWdmx2/74FraesCLL2wjFMd+M=
X-Google-Smtp-Source: AGHT+IHV88oyfqtBf2DtpCEKgt1vkDjkfjLKVgWMl/91X6UtdjP7QV90zUlO8YXIk/uwFs7b2yRK5Q==
X-Received: by 2002:a17:90a:e18d:b0:321:380b:9e85 with SMTP id 98e67ed59e1d1-321d0d65539mr3875136a91.8.1755090656709;
        Wed, 13 Aug 2025 06:10:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:55 -0700 (PDT)
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
Subject: [PATCH v7 5/7] thermal/drivers/exynos: Remove unused base_second mapping and references
Date: Wed, 13 Aug 2025 18:39:49 +0530
Message-ID: <20250813131007.343402-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061102_786254_DD63F57F 
X-CRM114-Status: GOOD (  21.09  )
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

The base_second field has been removed from struct exynos_tmu_data
because it was unused. This cleanup also eliminates its mapping in
exynos_map_dt_data() and ensures that TRIMINFO access in
exynos4412_tmu_initialize() consistently uses the base field across
all SoCs. This streamlines the code and optimizes memory usage.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: new patch in this series,
   Improve the commit message
   simplify the logic to TRIMINFO for all SoC.
---
 drivers/thermal/samsung/exynos_tmu.c | 30 +++++++---------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 3d12e95703bf..146f29fadea9 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,12 +139,11 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
- * @base_second: base address of the common registers of the TMU controller.
  * @irq: irq number of the TMU controller.
  * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing the base_second.
+ * @clk_sec: pointer to the clock structure for accessing the gpu clk.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
  * @efuse_value: SoC defined fuse value
@@ -172,7 +171,6 @@ enum soc_type {
  */
 struct exynos_tmu_data {
 	void __iomem *base;
-	void __iomem *base_second;
 	int irq;
 	enum soc_type soc;
 	struct mutex lock;
@@ -444,24 +442,17 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	unsigned int trim_info, ctrl;
 
-	if (data->soc == SOC_ARCH_EXYNOS3250 ||
-	    data->soc == SOC_ARCH_EXYNOS4412 ||
-	    data->soc == SOC_ARCH_EXYNOS5250) {
-		if (data->soc == SOC_ARCH_EXYNOS3250) {
-			ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
-			ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
-			writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
-		}
+	if (data->soc == SOC_ARCH_EXYNOS3250) {
+		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
+		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
+		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
+	} else {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
 	}
 
-	/* On exynos5420 the triminfo register is in the shared space */
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
-	else
-		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
 
 	sanitize_temp_error(data, trim_info);
 }
@@ -974,13 +965,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	data->base_second = devm_ioremap(&pdev->dev, res.start,
-					resource_size(&res));
-	if (!data->base_second) {
-		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.50.1


