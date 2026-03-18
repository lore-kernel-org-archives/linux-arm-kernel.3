Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E64103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzTEmVg0E5h4X/7Ugq7xS1ujjrPpCimVnXzUPgyNm9M=; b=2oXgwSSOB3HFCVy/t77AzEDLEp
	iNSKtT5vmA4Hg9yfTXLCwrXD4f4m2Q9kd0ALQkNxJU6ZnWNmxI9tAsvv0+XzbaGICFsx58JLo0uKU
	KPqkHlMarXF1paim6zrtm01V6GEGtxJmMjTmPTnkWWFTw6lH7GOd2/AvvcS1oeVTwjhyHepU4BxkZ
	3EBpOzZkNv3eZcHoBNN9HOIbH8oX5YnCkWHUlidFWBNI2nxTTErdBbtY6KkQEyIPCrZqWNH5TyAUO
	pScHjGtfycczQkR3mA7KxPdMf8SGNed2+O4lGVBwzEuMEqL3DENLYJx6BUQh+YCB6VpKyq7NHVdVh
	eXRBKTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soc-00000008heO-3ODO;
	Wed, 18 Mar 2026 15:28:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soV-00000008hYa-3hf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b97b1012d14so207400866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847682; x=1774452482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzTEmVg0E5h4X/7Ugq7xS1ujjrPpCimVnXzUPgyNm9M=;
        b=UPwL5BFd9SQg/Ygr955C1n0Yhmo2mn2Gyli85vOsMmQuPinjZxQ4QeQMaMy2jPOIN0
         ZrCNGTZ624kCBroozWQ7cjviKNWTg72fNtcCwMihkqcw2QRELFrGUqOn/QhOaz5qZ4/X
         +Hn+ionzx3fSr/Ni34ckJF97Jv5DwiuboATSBwcE4Lr9t/IELZlu2avQlITbPLckruUQ
         +FYTp4oCAFQItk1n/y7EGyIX+svdikkdJzWbw0zb9sxGtVqJRHj4SzprcHRLE0gnGRiC
         rs+XaimVe42/WtLoGqb879jf9Sc7vF42Heam0T1OxtRe85mPhLcPkPfDEbGruUaM/9dO
         TXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847682; x=1774452482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzTEmVg0E5h4X/7Ugq7xS1ujjrPpCimVnXzUPgyNm9M=;
        b=N0QgApmmcxL/6U8GTNDP7UFxSAWeRPa3fLAqhC8W2RDvX3wOQq0Q3zngEnP+S1KJo7
         dPK021IkVMNcRSjE2g2qAVIoaY4q9WRmFJKLeUJZDAGZXx1Ue5vUEmc69JsL5R+ompNl
         g6yXdAg5ybNM/gj1A2R1igye4aLc5leXW4TXQtSuAeJbdR5hTVjreDCl/H/jGu+ANHv+
         ZLjVAb8S5KXnnL4j9XlCk3TPX12Oqa5EkG6AH3IFPXBGAfwvXJrtwHMneUh8l7462c8x
         YKi9VAH31mOi2YNQhJ6z7taZKk2a0wUxLUQ6npHCBLxJaCvYPZSpHkTJjmpkcR5s1nJq
         yKDw==
X-Forwarded-Encrypted: i=1; AJvYcCWqlyzovQ09RXCuvKcIQRjJJUs3iS6JORzSt5rPmFGkHTouvrbX86rmL46EjTyykMJVzqy/dM6n1tIdDy06afM1@lists.infradead.org
X-Gm-Message-State: AOJu0YypHyZA75hLvuxu+h+xrOUrOwsHt/c0bs1xu++D5D9WhaGobmQY
	G18saiwre/KslSmA3oaEM41sBEWYAbIHZh2ev4fl/tfW7Y75w3zFgXVPA20zUPDQqBx+qX25YoZ
	Zq+ME
X-Gm-Gg: ATEYQzytWGToQu9kRfjpne2aks4voc090vTG0HakcKU0x0HYqUiEpAqk/0XcngJSf26
	gzSBnPyJDROx9M1mxktcmOWCbRE8N+ipi9vtUnJzOEbFaTy6sXjpx/pXQsT0+hU+p41iQ0mi1pM
	ENbpATcCd9qrrdOHxaNBP3WjTPpXvT4ekfPfCCJP4pGM0ZRCfsQzkAHOGpikOLuMo4j9Tt0mumq
	BeRDravu9OJVddM/Vn4cbphBrgfgfKiZ0K/ktolPLFDo0Qfh5PUK2lqNpx2nHxxt/cjEjmpIp0x
	z81dVOUQQLX/2EPXfHqX1qpiHGSsuwp6lta0BAiPm/UMt4terEK2SihrGN4+x60LiPN7uKp7jC4
	fOadHGZnzqTBdswgIwXIBRRF6wGokj80oagoPTheJzJxWcua5SUBYViuTovGwAddUujG+jC1Ox/
	AEZ8YSDfMN3FyTEzIZiywq8gvnJNmxOa6w/Q49pRVp1HkVKwNNLHNLeXGbQE9B4UvQ9RyVCpQL4
	AJyS9vOCrQ2GTM=
X-Received: by 2002:a17:907:e11c:b0:b97:73ae:e2e with SMTP id a640c23a62f3a-b980f9e248amr256966b.18.1773847682061;
        Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:51 +0000
Subject: [PATCH v8 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-6-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082803_962648_76EA6523 
X-CRM114-Status: GOOD (  16.16  )
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hard-coding 0
and 4 respectively.

Update the code to allow that.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 68b1e7ba8729..3aba00b9ddef 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,7 +43,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		pr_err("Regmap write for power domain %s %sable failed: %d\n",
 		       domain->name, power_on ? "en" : "dis", err);
@@ -53,7 +55,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	while (timeout-- > 0) {
 		unsigned int val;
 
-		err = regmap_read(pd->regmap, 0x4, &val);
+		err = regmap_read(pd->regmap, pd->status_reg, &val);
 		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
@@ -164,6 +166,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
@@ -174,7 +178,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status\n");
 

-- 
2.53.0.851.ga537e3e6e9-goog


