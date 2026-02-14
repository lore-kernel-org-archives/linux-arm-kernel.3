Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3F9EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1D1hHSd7ku04iGe6HhlRrD0l+nMik2FyODF+cOhPL3M=; b=ap4KT5Eb/TOx1dev5fDwqNkWCr
	B9HDVqXgsiJ8b7WYxOd2e5vEcqrciYqc2YS8algUatTYr/4H65Nbv+pogMi1zCr6Q2lFBWIrWZXt+
	fMOZ7ROdLygO1Yjcp8oQU2YGYAcO9tsDvXi3SolUm1Y0WYhCRIQjrn69vIUIhDwuckhJ0maEFQK5g
	FnUqix2WqNJs4/NCPhh/XAojb1GKKWxcQXzw3Bxw94merEh6AYesaY9u0LVEQOgfXlrxEHZDhv7HF
	1xpkA/BODILq3pFCURY1cCyAyAuQsVdZJFHQTZX/iSUc9B21GjOX5NdK/T/n4mvrLXL73JxaaZa0B
	h/PIDqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFc-00000004q6B-01vk;
	Sat, 14 Feb 2026 18:20:16 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFZ-00000004q4a-2LSY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:20:14 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2aad1bb5058so20811305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093213; x=1771698013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D1hHSd7ku04iGe6HhlRrD0l+nMik2FyODF+cOhPL3M=;
        b=doleQ7CSjBRq7VpNPLsCM+6lL8QkSfyoTXPpD8DcmtvR1+VqqMBRMEnLQgOymVMpug
         fCm+WrtZhd4niSV+5608AHuV4tHwN0nct5DgyjkJEBatgEPqdp2DsIdGsOxL9a8w+INc
         eu3wF8xd/bbFORhDVStGPrbujNVQ5miGQz2n3SOwvTSPk8OZV1MMAVjkG+yr4/Hwe23Q
         oQZO5unS8Ny9omeFSm+0m0xyExeWr01TrJ54tah37pt7MKmJyY6krtwg4qe3Yl7RYypc
         nQVQIFAkHy0+cKRUcwf/eVSNHqivHtIhycPHa3L7CoX/bOV4ELl4jnIHmhLBilonck3f
         n7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093213; x=1771698013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1D1hHSd7ku04iGe6HhlRrD0l+nMik2FyODF+cOhPL3M=;
        b=NkM24Xo5norwE3rwajp2lr+0Ju7RQTgQRZJnxTponFrKCF5DfP9sGd60VigAPLAdut
         fYrWDKCO7ViiYdV1qEFHrqXd/1eW/L+5aCrcVRjnZ4P6/AacTqkTEt5OPELnIdoKrFzL
         VvP1dmUzd/WgpdTDPvTK5sG1dIm1IeuLVwk5lzO9cvOsX+ZqCa6yzA3HFPdFGLBngdQn
         CgR4WXglPnfWUuxHf4ktKHFSS1BjX9dSjxMIuoZWC0H6TvWpnhgPgjyY3QVA1srLVAXG
         YiX11iz5IaCcxIlDhAQk/2PuPd0tkdx0Ha4h8LvhNoxo2TNhyew/076+eIZRyG5yQqKs
         XL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUveiNW8EX6BN4LbxgQD/AZqmV0++8gFe+g1auad4PrMjA1xCqtdAabQhTKoUJ3VgvEexT9UCcmuLQ2uf4RollR@lists.infradead.org
X-Gm-Message-State: AOJu0YzX3gkHu4UZyhdD3pta2o80DQcXHGnnbrosVbLWPUKsq0Xw+Z+7
	kEy5HN1RGanNxFKQppu+U5EbLmVZO4OopwxQxKuQOdmTcuMxhb2oCf4t
X-Gm-Gg: AZuq6aICles2Dv/C0YLz65GW6ffWFm+TWjhPjH0ov3dbbh2Wr/uSZeAsIw1XL4ea1PI
	+u7eAM3TYlcbIblIbi9AqgRZDFY6j0v3m9Fm0gvKHHwdvAWS8R0qPixXv7HZ8WwthEkBPVKqnkI
	GU5Igk/LegLTgWWkrzoj3UhrQ7nfbdvT6dhJXwic7WfG2R4bWtDYA2CGK3hnY3yWGLvTF2wasJJ
	Tt9lQgFeiDHX79O7BkMlet47I/nIFq4WfARHci2cSEx8g9OF+83sXwRWuYeoV/OPGxRd9f4Qer2
	RphKxFNu6mdlin6s/3hq/taSOStHxv2TpgmZoRjV2dZjjq77jUTr3Cot3WxQGiBvO5YfhdN3YTo
	i2Qqe94TkHfyzmAO4CPjvzdUHrNz1JWHa5NPBJIT9Ny0wCVfATTcNu3981w4rbDacpkUWOOxtnn
	9SGJJ+xo51HOfUQdFkO3U=
X-Received: by 2002:a17:903:1b28:b0:2aa:d39c:d68 with SMTP id d9443c01a7336-2ab50596948mr60204805ad.29.1771093212674;
        Sat, 14 Feb 2026 10:20:12 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:11 -0800 (PST)
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
Subject: [PATCH v8 5/9] thermal/drivers/exynos: Remove unused base_second mapping and references
Date: Sat, 14 Feb 2026 23:49:02 +0530
Message-ID: <20260214181930.238981-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_102013_609437_DC042998 
X-CRM114-Status: GOOD (  19.92  )
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
v8: None
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


