Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72789EF5848
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y1oNWapjfNVh50FsYoZ5SBQ/1IdNgNulUCh0e82XQ4=; b=JnbAEZVvf24rUjrd2sjg8mT2zN
	sr2Bi9rKzoa33wYaJJeklafimZMzy51EJq3HtfRnAEClCxnfPN24Tvqn6fKCwOpcDa7E5woVjQzMM
	3LOA58hb3pLh7CnwijauGkNa5NAq9dC0oXRp4Ufh8ZnOjbszXf1DR6Pt7zgo2VPQ5uRUqkBCnaJdK
	JSMKbFlPtHb6Lh15I5R87emeb/8qsUzzbI2qHIM5GuLBx0Cn6cP7xbocReC5yb4y5mPqP+JUlvo0z
	kN6g/FdeMYQdajkWR/000ZJblsQgwv+zjCicObkbVWbTLk9u49EJKmft7bl1iEGUN23WnGA1Qa9U3
	KylW3Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFp-00000004qEi-0nOo;
	Sat, 14 Feb 2026 18:20:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFn-00000004qDF-0EiF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:20:28 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2aadc18f230so13505835ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093226; x=1771698026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y1oNWapjfNVh50FsYoZ5SBQ/1IdNgNulUCh0e82XQ4=;
        b=bGnlBE1o+PPv/4BNgmMLJ10a9AUcWXTw5BHqzUj0IWfimYNy+xYLzCR6xQm/OubeQa
         o0rXaaaiCrVUiYrHZ2lvBMe89VY41SOyrW6wo2lg49qMvjFAiAP8EAAad/zJ4uV2+9L8
         aCwy/LLvb7tGOB+saV/6UAKXbSBuhoKJ4yMJgNbKu1sVsg4Ouf0n/IumN/ud7+eVtVDC
         50yflbSs+1w1jJUeQ8pV86bbfQOBZhYp/ZN7FbulyLoDU+XfEOr+EtPFXrVR/KZcxnFT
         l9EGkccnpUqphZOjEqKKGSufCgDkQSDzx11p9tP4ZUbrMFmrPXe4XW6F7SIdH3b3h1N+
         srkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093226; x=1771698026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Y1oNWapjfNVh50FsYoZ5SBQ/1IdNgNulUCh0e82XQ4=;
        b=SbEdPWJFtObmr9N0d3x7UrGf3lUZN6a11ncihAfTbVfS/cPoeNMIK+scr5BfKeKIIB
         wzUiusFIlytKSMNxHwgtInS/5s95ghuUTQxJTsE+jIFrZOuFPaq/hmKbemTKOjpUeusX
         XF2nNSCbrk6xkG0A3sHOLwf0wQVU46UVR6JWbBz82ACIrIKSwugWzC2Wi/HX7289c05R
         gpAljIkQBrIpXfVzhPMu1ppj6bU0caMwVwCCNIgM0DWi0Flx2t8HHulFAXYT87/+gWEP
         S5Q1n9DxuTvhd57l0zen0AZY/dK0Zsm83Pl/7Rj8BIkD+ke/f5y0bQyX2J9gH+D4yKS4
         4SKg==
X-Forwarded-Encrypted: i=1; AJvYcCVLv2Qf/LcFlgi4GdG42ATHi2tr3Asq7MwRa8kkoJRlz7bPyFE8IvmGbkwq3HuVEMp8bKcSLgn6pXJaNLaxrJ17@lists.infradead.org
X-Gm-Message-State: AOJu0YyUwRlAUErbzzBdal6XCyFBv0sp8uz5rLqh3hwDlxeC558tYip+
	1zHl89DPXP2Iqt7NJfOpkbWDkoRV6MDFsuHkqPqOAkcN9P0COUsK+2ZD
X-Gm-Gg: AZuq6aIw4SKDhaPUIcdVwtN3qr4UnKL8g6c9C7gjErP17BMCGD+7jiWaqC+0I7GhdMx
	1ocpDnSpbPoJGc1ST5X3wUFxrKYFVb/40uwkjxq7d0tlboFtW9ORytXoHcLOWxcVtxFNLQIGv2B
	tmUdkIv7PBDRnIZqYRPhRKmxBFpDwBD5ah00f9FU2L0R5lJ5/fIR4M4hrMbDCoSU+/MtGZsNEBq
	TTSC+1BUX65PyS6q5SoiL5kWs7XtDh3oUFyfUVXCplrZ2VZprPYj9uDZasxOQC006zpoZqSS01J
	Cs5arIIivbvPbbhzOD5L3bXTbqgEtU9enYUR88qmYcYcf4eUVYfpi/yij5pgRAoR2dZTyMtquLv
	4PomcIL9E06cXNKesuC4liocEo3Bh4Hb+/enD99auoSryubEidBk9R0zLkT9lFsUke3fU5ycqk0
	aKPEMohJAC15K0ooVCyq4=
X-Received: by 2002:a17:903:1107:b0:2aa:e0c4:c076 with SMTP id d9443c01a7336-2ad17596f38mr36024625ad.54.1771093226306;
        Sat, 14 Feb 2026 10:20:26 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:25 -0800 (PST)
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
Subject: [PATCH v8 7/9] thermal/drivers/exynos: Relocate exynos_sensor_ops for forward declatition
Date: Sat, 14 Feb 2026 23:49:04 +0530
Message-ID: <20260214181930.238981-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_102027_104667_B7EA35AC 
X-CRM114-Status: GOOD (  16.49  )
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

Relocate exynos_set_trips() and exynos_sensor_ops to a different
position in the file to resolve forward declaration dependencies
for register to pointer to thermal_zone_device structure.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: new patch.
---
 drivers/thermal/samsung/exynos_tmu.c | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index f77abdcdc62b..1d657802a310 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -808,6 +808,34 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
 	writel(val_irq, data->base + tmu_intclear);
 }
 
+static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
+
+	mutex_lock(&data->lock);
+	clk_enable(data->clk);
+
+	if (low > INT_MIN)
+		data->soc_config->tmu_set_low_temp(data, low / MCELSIUS);
+	else
+		data->soc_config->tmu_disable_low(data);
+	if (high < INT_MAX)
+		data->soc_config->tmu_set_high_temp(data, high / MCELSIUS);
+	else
+		data->soc_config->tmu_disable_high(data);
+
+	clk_disable(data->clk);
+	mutex_unlock(&data->lock);
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops exynos_sensor_ops = {
+	.get_temp = exynos_get_temp,
+	.set_emul_temp = exynos_tmu_set_emulation,
+	.set_trips = exynos_set_trips,
+};
+
 static const struct exynos_tmu_soc_config exynos3250_data = {
 	.soc = SOC_ARCH_EXYNOS3250,
 	.tmu_set_low_temp = exynos4412_tmu_set_low_temp,
@@ -1008,34 +1036,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	return 0;
 }
 
-static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
-{
-	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
-
-	mutex_lock(&data->lock);
-	clk_enable(data->clk);
-
-	if (low > INT_MIN)
-		data->soc_config->tmu_set_low_temp(data, low / MCELSIUS);
-	else
-		data->soc_config->tmu_disable_low(data);
-	if (high < INT_MAX)
-		data->soc_config->tmu_set_high_temp(data, high / MCELSIUS);
-	else
-		data->soc_config->tmu_disable_high(data);
-
-	clk_disable(data->clk);
-	mutex_unlock(&data->lock);
-
-	return 0;
-}
-
-static const struct thermal_zone_device_ops exynos_sensor_ops = {
-	.get_temp = exynos_get_temp,
-	.set_emul_temp = exynos_tmu_set_emulation,
-	.set_trips = exynos_set_trips,
-};
-
 static int exynos_tmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.50.1


