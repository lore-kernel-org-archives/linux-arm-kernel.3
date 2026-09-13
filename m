Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EE9C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWlrSuY01GdV11TIXI5P8cmkxAQSB0ZioYMZIiZx+uQ=; b=M9PSXbd5viqEbwPidtfglxqr8e
	kIwkGd+Mv3qUh9xhnVaIC4T1eOwu0L3S40F+zdgyIbtZrllhvliO4tNJHkviAP2RX/QiLjJt5/4jG
	XUw6Ir2TjrWyZDdeAwqGk3z4yBBoNTlaYVquyIfoC0N0CQSh2lk7GFfGPYHrbx6bRy4ZU1IYm8SLK
	ShBI49Z4Sh8aa2JtOW60grt4B8jO9henFq58M8K3v8zCCYvqjuQ7t6EbtfrmZJ842H4wCK2hDSXwy
	gbU7+2eWMLvLXomwVkblfbUGySO/erPM0FT/LU/bU1glfZMY0GfkomXgPkAbv7w8RF8clZuJpEhOa
	3SxrvwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgn-00000001kqk-2pJH;
	Sun, 13 Sep 2026 15:00:17 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgf-00000001khR-1Gk0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:00:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2963624a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311608; x=1789916408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWlrSuY01GdV11TIXI5P8cmkxAQSB0ZioYMZIiZx+uQ=;
        b=MBBGGeplVYvy6hByofXoo2KHpHt/RZRLx9xDj0+rplrgkUOQSF6ox0MY1ufpCiVki3
         gsrC7hXSjlaOtg7MZvhzu1+N8Ttjz4ep55x2v5ijlDqTzxJsM15COLEqqTU/dYo9jkiM
         y7XiyvZX0gpsawDYoYBWUpZdRRd2AJMI6xKS7QKah0jGMYwllGPS96l0DQOUtfGum5Vh
         Z30Bu+QWOd/S77lH2HbrgH5zr/ouDkFM7kbHlSETPlUmghg5tt8wAMb9S2vumapVoceK
         E2GtrKq22W8Qp7vw6oFGDAONe86py8QRVvL75cUeezOstLH1tIz3fDzk6W4CBFtoRfco
         760w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311608; x=1789916408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWlrSuY01GdV11TIXI5P8cmkxAQSB0ZioYMZIiZx+uQ=;
        b=IylrrAmyDL3XEaO9xSXwVUV1V/MIUL7GY+Izv+0aPOZpBdZm3Pser55LdVvqh4fsNr
         tYUblaIwyP/T1z3+oS/GCQmlX9C6uTEt1ZB0ctPPZ3U12SZvHVpzhkMfacM8Tcm7+xFX
         jDayzhGFlAJoTiK1MAQ4O88lxCVBdD3HBGB+CQQ56VvSMFyU7F7JaospuGugiuKimwSt
         XomREH5UMGu2G10KwxkuRCVlrCMgzMA7v00xZsUBJdv0XOjNMJe3cAKjXnMIm0aLATUa
         r4KXJ74TkxYZnpz7X2a/Swr2WOndFzljfPk0ZCGDhSGfzSAQWIvUsNK9WfN0vi3i9cNL
         h50A==
X-Forwarded-Encrypted: i=1; AKwUvBzhSYeTwW1/P9egqKCxOek48sd3bgFT9dj2IWfXRdaeJafVGWSfAbUjnj7yjOSeZIPL5+qymBNPpwGaOFJFt5Op@lists.infradead.org
X-Gm-Message-State: AFuF++mj+Rww8yBdyoeyt3SGXa6VrKpa9JmBDvH4U9hIFB1eKt+NKMmi
	+4W+lTZ9NFGawKLkbJbCj86ZAAUBG5aPa3bGT9b/cMbBD6+WOw6dIwAT
X-Gm-Gg: AYBFou1CgpG9g/amtKwHjKfNj8TbFl3R8gmUysDIW6ideFQpZNacfHkZ2O2mwGLsx1M
	peyzxwEb5L+uOuOyq/u/DmNbm4SptLASPy1YTy3YkLlY92+laMOxKFuKUHYgOgzbA42sZ1Yqi7A
	DV9TZsycTrMxbqdnPqrVUj7jHLyb4YB98tlzeLHcVXpKOSa5vJRp+7XjfwO7M+iiSiptBlTeNHD
	FVH6Hnxj0SgshcQ+G0nGX/qYiBcBlLUqNdggBs8eEqVF6Ia2Omn9h1u/oIQVqGT/sO/+o36uBLU
	qWs/lDgAvQTeYLv3QA/Sc6BMRqGp3LJJJnwa9EslJqVvvApWFGbKbPc/MflQEMIi2qkUhi+Ha3X
	JjEsdZC9GKyzuk21vJ/le2ot4KS56ZnoQ8ZA3dM42nphbJhN6W2xa05pZX4myN1FqRz91mEZYTv
	YXuK8Ay+eFXx2RqY8Mh9EQrhF/gEUpZmC1xIBulHKrValHMleIK3FCwCvH+1jGzn01kgZM4B7K
X-Received: by 2002:a17:90b:4cc6:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39dd54eacd9mr3419850a91.14.1789311607909;
        Sun, 13 Sep 2026 08:00:07 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:07 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 7/9] thermal/drivers/exynos: Move thermal zone ops to variant data
Date: Sun, 13 Sep 2026 20:28:35 +0530
Message-ID: <20260913145905.9404-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_080009_378417_4F5ED793 
X-CRM114-Status: GOOD (  18.68  )
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

Move the thermal zone device operations into the SoC-specific variant
data and use the variant when registering the thermal zone.

Store a thermal_zone_device_ops pointer in struct exynos_tmu_variant
so that each supported SoC can provide its own thermal zone operations.

This allows thermal zone registration to be selected together with the
other SoC-specific TMU configuration through the device tree match data.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 69 ++++++++++++++++------------
 1 file changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index a689c6a40b67..0e7b92035850 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -186,6 +186,7 @@ struct exynos_tmu_data {
  * @tmu_read: SoC-specific TMU temperature read method.
  * @tmu_set_emulation: SoC-specific TMU emulation setting method.
  * @tmu_clear_irqs: SoC-specific TMU interrupt clearing method.
+ * @tmu_ops: SoC-specific thermal zone device operations.
  */
 struct exynos_tmu_variant {
 	enum soc_type soc;
@@ -205,6 +206,7 @@ struct exynos_tmu_variant {
 	int (*tmu_read)(struct exynos_tmu_data *data);
 	void (*tmu_set_emulation)(struct exynos_tmu_data *data, int temp);
 	void (*tmu_clear_irqs)(struct exynos_tmu_data *data);
+	const struct thermal_zone_device_ops *tmu_ops;
 };
 
 /*
@@ -809,6 +811,34 @@ static void exynos4210_tmu_clear_irqs(struct exynos_tmu_data *data)
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
+		data->variant->tmu_set_low_temp(data, low / MCELSIUS);
+	else
+		data->variant->tmu_disable_low(data);
+	if (high < INT_MAX)
+		data->variant->tmu_set_high_temp(data, high / MCELSIUS);
+	else
+		data->variant->tmu_disable_high(data);
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
 static const struct exynos_tmu_variant exynos3250_data = {
 	.soc = SOC_ARCH_EXYNOS3250,
 	.gain = 8,
@@ -826,6 +856,7 @@ static const struct exynos_tmu_variant exynos3250_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos4210_data = {
@@ -844,6 +875,7 @@ static const struct exynos_tmu_variant exynos4210_data = {
 	.tmu_control = exynos4210_tmu_control,
 	.tmu_read = exynos4210_tmu_read,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos4412_data = {
@@ -863,6 +895,7 @@ static const struct exynos_tmu_variant exynos4412_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5250_data = {
@@ -882,6 +915,7 @@ static const struct exynos_tmu_variant exynos5250_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5260_data = {
@@ -901,6 +935,7 @@ static const struct exynos_tmu_variant exynos5260_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5420_data = {
@@ -920,6 +955,7 @@ static const struct exynos_tmu_variant exynos5420_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5420_triminfo_data = {
@@ -939,6 +975,7 @@ static const struct exynos_tmu_variant exynos5420_triminfo_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos5433_data = {
@@ -958,6 +995,7 @@ static const struct exynos_tmu_variant exynos5433_data = {
 	.tmu_read = exynos4412_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct exynos_tmu_variant exynos7_data = {
@@ -977,6 +1015,7 @@ static const struct exynos_tmu_variant exynos7_data = {
 	.tmu_read = exynos7_tmu_read,
 	.tmu_set_emulation = exynos4412_tmu_set_emulation,
 	.tmu_clear_irqs = exynos4210_tmu_clear_irqs,
+	.tmu_ops = &exynos_sensor_ops,
 };
 
 static const struct of_device_id exynos_tmu_match[] = {
@@ -1052,34 +1091,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
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
-		data->variant->tmu_set_low_temp(data, low / MCELSIUS);
-	else
-		data->variant->tmu_disable_low(data);
-	if (high < INT_MAX)
-		data->variant->tmu_set_high_temp(data, high / MCELSIUS);
-	else
-		data->variant->tmu_disable_high(data);
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
@@ -1144,7 +1155,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
-						  &exynos_sensor_ops);
+						  data->variant->tmu_ops);
 	if (IS_ERR(data->tzd))
 		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
 
-- 
2.55.0


