Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39870C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxAiZIWTohCHE3URqspBODvbQB2hR6En63VyQJNJmas=; b=Nds7D9CGF4S0ysN3URlC0TR/PB
	SgSHtZPiUbLCFhbO8Nk6hu6U5hw3eaD7YR3aOrbCzzI1R8fh/k/oCuChOywh6sOQBisGENvebrill
	OUeu9S5rnoGW1PDz7uQneRVRQYtnO4WKz6yxuy0yx8lTC1Q9DQ8UviQ2Sr9QiHZ3kvvZF0xJpIfor
	BKXNGL0/uha68PwpqgcgJTaYORt+VOMi3FJPZBYWnVR0a4qelsP34gdoytLjCYPoAn37IVbCEDAxy
	JafmvnsaZlBLPzPrEQjS5II6utgY0l9p4rxXQ2ml850wMAjB/QDuc22XwFEv2t+QWdT/Szt5k6N9R
	lB1hpi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lg1-00000001kMG-30US;
	Sun, 13 Sep 2026 14:59:29 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lfw-00000001kLW-0Ig9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:59:25 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1375647a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311563; x=1789916363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxAiZIWTohCHE3URqspBODvbQB2hR6En63VyQJNJmas=;
        b=cyXFBczVV4XeW9RQAz0LBR+jCEeym8+144SpItgRlHHfqXIG/g1LbH+FYip+if9gan
         E8J/BcJoMS2ep8abuFx9/AG8qH8Afay0YiKxPD7j5Uq6+O9ZkF60VzF/zfRapZTgglWl
         cPnLo5fHwaHMulabDo1kIQnMegg12u7FAJ2SCs5h5zTzqofP4+Jp86zzPPmtbz7yOPL3
         OS7zxtnsSEDxpJtX0TJvws+h5AlCy8yrilMDsLTKoNLlGPr+39B/0ELodjjplqmaAGkZ
         QqBiR63hyvVHxAOmfbl4pqZl0wueUOXll31hyJ/RiSSt9p6a/EKg3IZmDtWW/r2kQZTv
         D8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311563; x=1789916363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxAiZIWTohCHE3URqspBODvbQB2hR6En63VyQJNJmas=;
        b=F4EAQ5cTHUVpeCF3mFZqOLybDviLQ9NHsJkDk2TxSfGD5AvNiXWD0UEmiyNPG1kTr5
         DBCvwhrUtqISRQgBl2FW01mV9dQuNELs1W6vp27Wv0eN/RrAKxLL5fDg4MfLIZWrrPJB
         NUunZd3jYGBATtnCfb93+8FAwbIQc4F3rYr9XpI0eFolvnCkBjHcO08RRSL0cCZGGeD4
         shg83TAlMrgtO7fa/lCEGH37CeDOgeIpHROvJTTgZO3b6WcW1ZH5OBgl3N302mFYtg+P
         qYBzCTmRneEVTIxXIRzJAJVRY3xz1a8z4QDMpNqTf2aF887jwXdbk1b62Lh7ApR5glX1
         wrNA==
X-Forwarded-Encrypted: i=1; AKwUvBxctZJjvSHscYEVRzynuXkbkHo2nMzovzox4wZIuyKYDA6PAHvMlfWEzfbX47gyJi7AlhN9Eo3P/l7GYDiZMGsF@lists.infradead.org
X-Gm-Message-State: AFuF++l91FTC6qdb4pUZrTRrGiEz9W9D1vQPdqR8MhfnOrgjUmOvaSUU
	PcOLCMdYmHCwPtuJT9ZVxKspp7KZAVFxrTP/CBSLPbfjGBxBM9fxS1bE
X-Gm-Gg: AYBFou2UwVQmeVr6p8YPbgCeK4GVR0eA37sQjnQZTOyLubPGf6GfhgyZW9qiZiEVOeh
	kZQ20oNPfAehnVnPxu2PtHQRsTChLLHP8oVpoE/KK3zSUd3rexlo5Sr1+u3aSrH5gAy1zK5pgcC
	Auxr42hXS7Qx6luCRkTYblmqg+Q72VNpydx77q8fH4Pmt5vBUFWFlugUVSt0kQDQD+mO42F9yur
	CXwXFzY7Xy7YOB7f9UF4YPwX2G8dQZN9/fVgs4taPzU/SilBdCT7zVa3CuojwaYgKT64PurzA8T
	AO/cr3YxCivbAVuwEEwUF7ATUNBoFrhioI3/1PBZZLSLujlYeHQAzckULvAILFEqCkib1ubRFb/
	kMDYz9HGpM6+dhvv394NudhaLe7cFO+8xf8FfzABGLMij/7TJvi1060vamVOvtYnrKGHwKINC4t
	2oxhX0qlO0Ejxgp8osy1SVETikaZ79FnHXQvnuBnu2cLvuEqoM6MgOUU4aOBTTGXyA/QSJPhhLm
	0FW4gPxYdc=
X-Received: by 2002:a17:90b:28d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d9c3f2ba7mr26213072a91.23.1789311563420;
        Sun, 13 Sep 2026 07:59:23 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:22 -0700 (PDT)
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
Subject: [PATCH v9 1/9] thermal/drivers/exynos: Optimize clock lifecycle with devm helpers
Date: Sun, 13 Sep 2026 20:28:29 +0530
Message-ID: <20260913145905.9404-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075924_119687_CCABA426 
X-CRM114-Status: GOOD (  19.13  )
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

Use the managed clock APIs to prepare and enable the TMU clocks in
exynos_tmu_probe().

Replace devm_clk_get() followed by manual clock preparation or enabling
with devm_clk_get_prepared(), devm_clk_get_optional_prepared(), and
devm_clk_get_enabled(). This also allows the manual clock cleanup and
error handling paths to be removed.

Preserve the existing requirement for the triminfo clock on
SOC_ARCH_EXYNOS5420_TRIMINFO when using the optional clock API.

This simplifies the probe and remove paths and ensures clock resources
are automatically released when the device is removed or probe fails.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 86 ++++++++--------------------
 1 file changed, 25 insertions(+), 61 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 56717bb50d60..e75040222ccf 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1036,65 +1036,44 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
-		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
-	}
-
-	switch (data->soc) {
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
+				     "Failed to get tmu_apbif clock\n");
+
+	data->clk_sec = devm_clk_get_optional_prepared(dev,
+						       "tmu_triminfo_apbif");
+	if (IS_ERR(data->clk_sec))
+		return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+				     "Failed to get tmu_triminfo_apbif clock\n");
+
+	if (!data->clk_sec && data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
+		return dev_err_probe(dev, -ENOENT,
+				     "Failed to get tmu_triminfo_apbif clock\n");
+
+	if (data->soc == SOC_ARCH_EXYNOS5433 ||
+	    data->soc == SOC_ARCH_EXYNOS7) {
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk),
+					     "Failed to get tmu_sclk clock\n");
 	}
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
-	if (IS_ERR(data->tzd)) {
+	if (IS_ERR(data->tzd))
 		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
-	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1103,31 +1082,16 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 						| IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(dev), data);
 	if (ret)
-		goto err_sclk;
+		return dev_err_probe(dev, ret, "Failed to request irq\n");
 
 	exynos_tmu_control(pdev, true);
-	return 0;
 
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk:
-	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
-	return ret;
+	return 0;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.55.0


