Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8118D66BA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 20:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Vqf2Irqa47r0MODYS/qJupfOYkoqLvIbxbr/hC0OZI=; b=2CVpva+ymcUhdcJzw69Kd3h5Ky
	JkqI6BKT59Kxvd+i48Fbwt0lEddaPgEe2XqshKcrUdi7AstBakHajZ5M4jw8Uxx1xSIsu2RkXA4ml
	XqL2vGoByGaceKeonaFT80Yc0lPxTZJMEWxkEjLgyS0zZWigkyj2LWBxdEOjXqnKNAy8XGg/IsvDO
	tYvBGjqP8BOlv9OFhc8n+rE5l1agNa6O1cvXpFUC5+0Doolv2DL6ezBrI8c6WwPjaUnAPqYdRKdJ2
	L7DHrjCf6UvC6TnV5we2I+KBjiIMa03eC4QrCr1FmsZ+1rlTDGmmu0VWQ4UcEvvZb4HYDU9BLHbW2
	gW6v0QCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVyTF-00000007OpK-3fXt;
	Wed, 17 Dec 2025 20:50:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVyTD-00000007Ool-31Ch
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 20:50:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso4659582a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766004602; x=1766609402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Vqf2Irqa47r0MODYS/qJupfOYkoqLvIbxbr/hC0OZI=;
        b=Xxb/CfCCvmfjbFAnoU/z5rx7UdiAUqjAlcIchIkzQX9hfox3UGeKxqcWDAvC4aZ3jd
         sfK8FoWqHdWM/N9AB10jfw+ZNF1+USZ2DIVhZzyCwIKmhZ2L1FzIgsDDJfYOLjEcXCI+
         zzj+DDHeMLWx92PgcJrPRBGlSy+GOgtA9lIBhE2BVny5Dph+4H0WM0/N77vQzI7UGfDX
         y3XdbwcyUM97LuyI25r4AVyI2bCvTL0bmj0LNEd3NK4Hpmmc14UZO5O/n91vQsEDwwHn
         1rnoYgi8Ay9/rnw1xupdRnhmIAUXHJMIR9Muht9P6N2pqWbFDnlhcBQp1VQ0rET8c9xQ
         NyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004602; x=1766609402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Vqf2Irqa47r0MODYS/qJupfOYkoqLvIbxbr/hC0OZI=;
        b=ru8IMJ8OqYXqDZ8VKyS284loexl9MT03QhnL3s/B3qRp7GAeFKErPh7J9pVj/2EzAy
         E6I48RTY2JbfaL2xvsmXxv/1FIXKZHZezfxCsGUgSrJTpSKI/1lNWoKi98HPwNhcB1Dy
         jZOjtxZDJ0zfQBwaFgB0FYGIbnsrcePaS5UjxKEOSEZBexDGQpj/lov5/izJX4s+SMCg
         5ZrUrXr6GoRUi/8S4pGOyTUh5Hno74mlM+v3OfsfEBj8ia2LF9R1lQCq/9EdVhCQ1JJ6
         16TAPIxEnLna9DUaQNDjhzUI+LOc6rNSYutVQBfQUDSAQyO5Byq9JD5BDsYDHuXuqAI8
         az2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKTHo2XK6gU/DksQ7SM5QK9dGxdItgYp7KU3sQ0R+1KIbb+5n5C7wlIgcxxZOMsMDX/k9Ua122UEtT3E2cp1N+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Ruf2B+x9dKYhIa96QCNHemCsYWmj9e2E7QFg5mESN+C4irQo
	2xts0IlElUV6CKJKtbQTdVeifQtPSXlN25/hLs/37OG32z/z54FAFsk2
X-Gm-Gg: AY/fxX7ASQUtjmNjQt0JbwsL+ghknQdaBiiwo2LbuZStXaMstU9N80Ph6hdPtNp/FPc
	S8hhvMOzxQO51Cnck9MreVkb3OcvSQJDradFlhYXra1kWRu1y6Z03GsZY+3/cR/kk1a3RJ7lm1o
	81RIjaP6rQ5WorZEJjJPiDBKDx/786QOFhOKgag/0CzzXo69Sc5IhyZqGvOluNwVerGZ0uHtquD
	44077GbT20/UP7FT1p0xmW8a1GWbTNz4tEWBebqxhzb3LISFwggQqpc1vb97SHpJx962Dzoxi4p
	WGQ5D34CXzICRQLik/1Lfih18AjyUDCVZAa+DkOTTgFc+xJ3oFvmRbUxGVw3CJmWlYXLkFuCLwG
	PatoqrtbkITa7gPgOqg0DnAqmio9muYNeMersDuaPkSYYO4sOPGIEXmTKNg==
X-Google-Smtp-Source: AGHT+IGUYpYXdBuUIy2BGU5YINHw7vHPbEi5/3qNwcr/8j7+nQe807tukrqvmnkcXYlc9GyRKCPBGA==
X-Received: by 2002:a17:90b:3f4f:b0:34a:4cc0:9e38 with SMTP id 98e67ed59e1d1-34abd71f4dfmr17296990a91.10.1766004602462;
        Wed, 17 Dec 2025 12:50:02 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7bcsm434558a91.13.2025.12.17.12.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:50:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: exynos5: simplify probe with devm
Date: Wed, 17 Dec 2025 12:49:44 -0800
Message-ID: <20251217204944.10862-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_125003_764167_ED820867 
X-CRM114-Status: GOOD (  14.25  )
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

Cleans up probe a little bit and separates preparation from enablement.

Also use devm for i2c_add_adapter to get rid of the remove function.

Fix return code for failed clk_get_prepared. It returns PTR_ERR.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 41 ++++++++------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 9c1c5f3c09f6..fcc062910497 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -903,23 +903,20 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->adap.retries = 3;
 
 	i2c->dev = &pdev->dev;
-	i2c->clk = devm_clk_get(&pdev->dev, "hsi2c");
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return -ENOENT;
-	}
+	i2c->clk = devm_clk_get_prepared(&pdev->dev, "hsi2c");
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk), "cannot get clock\n");
 
-	i2c->pclk = devm_clk_get_optional(&pdev->dev, "hsi2c_pclk");
-	if (IS_ERR(i2c->pclk)) {
+	i2c->pclk = devm_clk_get_optional_prepared(&pdev->dev, "hsi2c_pclk");
+	if (IS_ERR(i2c->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
 				     "cannot get pclk");
-	}
 
-	ret = clk_prepare_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(i2c->clk);
+	ret = clk_enable(i2c->clk);
 	if (ret)
 		goto err_pclk;
 
@@ -958,35 +955,18 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 
 	exynos5_i2c_reset(i2c);
 
-	ret = i2c_add_adapter(&i2c->adap);
-	if (ret < 0)
-		goto err_clk;
+	ret = devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
 
 	platform_set_drvdata(pdev, i2c);
 
-	clk_disable(i2c->clk);
-	clk_disable(i2c->pclk);
-
-	return 0;
-
  err_clk:
-	clk_disable_unprepare(i2c->clk);
+	clk_disable(i2c->clk);
 
  err_pclk:
-	clk_disable_unprepare(i2c->pclk);
+	clk_disable(i2c->pclk);
 	return ret;
 }
 
-static void exynos5_i2c_remove(struct platform_device *pdev)
-{
-	struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
-
-	i2c_del_adapter(&i2c->adap);
-
-	clk_unprepare(i2c->clk);
-	clk_unprepare(i2c->pclk);
-}
-
 static int exynos5_i2c_suspend_noirq(struct device *dev)
 {
 	struct exynos5_i2c *i2c = dev_get_drvdata(dev);
@@ -1036,7 +1016,6 @@ static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
 
 static struct platform_driver exynos5_i2c_driver = {
 	.probe		= exynos5_i2c_probe,
-	.remove		= exynos5_i2c_remove,
 	.driver		= {
 		.name	= "exynos5-hsi2c",
 		.pm	= pm_sleep_ptr(&exynos5_i2c_dev_pm_ops),
-- 
2.52.0


