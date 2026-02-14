Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD71EF5848
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=; b=ApqpBhOHrZzfj1u4re0rD5FKU7
	mXoGRlhvStGUKI1ziOei+ppqe3BA4pZE3AtghdXB1BE6g8HJO9I2ppZEI9CkCbcg0fJ3b38iZRfNH
	8UqZppgftKFIBD6P35TQ1FqZM8uusXYycj/w29cHCpPY3gAGinb1Su2877XAH7RFge61Hyr1oig5I
	wNtBkdRLMg03XJPG7R7KXgic0C4+Jr8wH6PqAWRva2CIgUBnTvD3WRCu1FaDhMjiC8ckHlnPgGe30
	ycEmHOid3CyPac6O4FKVx7lEYqqs7KKKXPJqEm/7bTRvTheX8iJCufbAsgv07GQTORjmVHl30vNIO
	UibiV0gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFH-00000004pvS-25kr;
	Sat, 14 Feb 2026 18:19:55 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFF-00000004puh-38lb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:19:54 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2aad1dc8856so13218215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093193; x=1771697993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=mrVtJP3HxixgAHshqVAS07NABFo4Oo17KMbTIY3aOcDhscuLq+w/bGLijP1uIGf4wT
         mvrhErHLbPAWnKWJSxbY7BnbRqvrCh8tYeBEWdziUPGX9DyzYVfwC9K5yoZrrz9AaYt8
         nkdMg5XjAvgMAPUpl0mfj4l65PHn2CMJEfSPvtijvoSfWxf2YEv1JTgj3nVb7OrBFin8
         D5z67WNP8a+IvobXWEIVPDEAOyiNluRutzzBuI/CjM9tJBTpN5i32BZg4mgNTBWNgxkC
         k5/RzmAmkZ6jJBwlut1NSql4Fasm0/xCTPujJ6JkCUBuTI6faBPL5jxt2fis2r18FN09
         pdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093193; x=1771697993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=wlW9YMee+4ijPg3QqlKXjvzaFFhacP20twy/rUrRpCuon4aTxG/R07rt4Hh7OCBmeS
         B7jLTbDm98vGzoVE8InUyZoicv/F7gEKn9TcB2KE61xrdDZEPlagLqRJ2BjYG5SXTmrQ
         ER7RBCgiZ+Eb/4LingpY75MvvmvGGsRNhfsV7WAB0TayXnCmo9P2C3zqHLcofRDh7LFt
         atBhDuLth4RiQkWQQZ8ojpczzQ7qNCDbBKjOfJ+5v/1cwMHJeUaDzfq6+w4ZUoFBfcxd
         l/WkzA6Vby1PdN9uJNgD6A/NVqHOMTcrjzVStLMefCgPxOUqudh+u9QvCVHwNKZ/c2Fr
         CIZg==
X-Forwarded-Encrypted: i=1; AJvYcCUeU+c65aRuHsi6rW94UkjjQV6E5p/tQMu+ERcC8Oxjune8Vq+fTb0aFQUqT3p+E4SJT1X9Ad6l/UVHNo/erlRq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy47lJ4rsC1HuFlBfazqvjasg59X5vAsoPCjrEc/dMsmnjuhia
	851KHS5vBoyaQwzZ7ogRbjWHM9cwe8IqzDoZnSJvpcIso9lPYXpAW1RQ
X-Gm-Gg: AZuq6aLkatjz80xTY3QrITKRYbeuI75rVvJrBnqHpkpR8Ao6Y5aBfwJ8rKc1Ips/eDQ
	niwEgsSqWr8JnlDEwYpCoWGix87YYorGWa7fEeq9lhbN43gWH/mnR6qpsN43zRJf3m2SFJyYtTt
	snpq1gfKhz0r4hPzf3vHxFdKDkPXcqiF3KVVilRwieOBjbmv+mj/O9omWCZuCMsZ6BVYxkOoPVi
	NL3bM7Bm+o71VuiFSsgR2Vr2eBZj1RNkuWLW9L1k/M4t/EXagH/xzne87uVdLD4duVDYGbcfcZn
	F0HqMj2iSIujdmzvIRR0ScKFfYoS3Fszsr5/R/m4S0947KAF5qEg1oFf4zNndItQ1JLCN7Jipco
	hDZAG6tqV9RjzvUjU6BCVjgjiKkBz/X6OgasIg1UwpPeq2Ys2KzQJ9YHEX4qrJUzCPkGGp5Da/2
	pgz46MlvRkYGesF4osg/E=
X-Received: by 2002:a17:903:1ad0:b0:2aa:e3d1:1438 with SMTP id d9443c01a7336-2ad17431b9amr32756855ad.12.1771093193179;
        Sat, 14 Feb 2026 10:19:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:52 -0800 (PST)
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
Subject: [PATCH v8 2/9] thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
Date: Sat, 14 Feb 2026 23:48:59 +0530
Message-ID: <20260214181930.238981-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_101953_951565_750E602F 
X-CRM114-Status: GOOD (  14.87  )
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

Use devm_clk_get_enabled() helper instead of calling devm_clk_get() and
then clk_prepare_enable(). It simplifies the error handling and makes
the code more compact.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: None
v6: New patch as per Daniel request.
---
 drivers/thermal/samsung/exynos_tmu.c | 77 ++++++++--------------------
 1 file changed, 20 insertions(+), 57 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 04517d52afbd..aa0726b33c84 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1036,65 +1036,41 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
-		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		return ret;
-	}
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-		if (IS_ERR(data->clk_sec)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					    "Failed to get clk_sec clock\n");
-			goto err_clk;
-		}
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to prepare clk_sec clock\n");
-			goto err_clk_sec;
-		}
-		break;
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
+				     "Failed to get clock\n");
+
+	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
+		data->clk_sec = devm_clk_get_enabled(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec))
+			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					     "Failed to get clk_sec clock\n");
+	} else if (data->soc == SOC_ARCH_EXYNOS5433 ||
+		   data->soc == SOC_ARCH_EXYNOS7) {
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk),
+					     "Failed to get sclk\n");
 	}
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
+		return dev_err_probe(dev, PTR_ERR(data->tzd),
+				     "Failed to register sensor\n");
 	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1104,30 +1080,17 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					dev_name(dev), data);
 	if (ret) {
 		dev_err(dev, "Failed to request irq: %d\n", data->irq);
-		goto err_sclk;
+		return ret;
 	}
 
 	exynos_tmu_control(pdev, true);
-	return 0;
 
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk_sec:
-	clk_unprepare(data->clk_sec);
-err_clk:
-	clk_unprepare(data->clk);
 	return ret;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.50.1


