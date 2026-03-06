Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C03F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=; b=RGQBOkf1azQaG5FlH+GpCHE4G6
	wYx7hJXY1GJa9X7zjKEs6KuW37kpig/FtptaTfagwPx3G6RAxXfTgZMFZl9jIvg58XIXrheuTU0Z6
	MC6L5rAlUl7QhtMu1FfgT1xg3qNNkIAxqZjDgDFaIiVHMABYkun6+6fWi9dO4sqHr7wx4pvH4wwgI
	u6QdnVIwB7DQNCEulJC216+hh3fFtsKgWsW7pCHlrbaAYopasRZ3B4keORotRpuykvX619aXUh9Oh
	uSz1u4gL9PpjuK0wZVBjWytGztjDWuQaNiooNDDBQokc9aKmBatfrN3bri84wJVrZ+Ak9NKlGcYWq
	K0EoDRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRi-00000003SmP-2LMN;
	Fri, 06 Mar 2026 10:30:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRW-00000003SYc-14tr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:30:03 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-661568ce781so2482116a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772793000; x=1773397800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=;
        b=PL1T6EvaPs69yZk/c0hlsJFUFSjZ2pnPZnvmO62ZLftFFr3eGC5hNsx06mHJc3iFhf
         XeOAmw/PY0icss6uAZ8S1c7H0nSp+nEuSz4s4qntzWrVoPHJftwCqjGkDIx9iHhFY++l
         /1x851NbrI8WJ8RsId3JwmVpt4Xo93afPKEl1urJt5RjItGnDNjfm2OxGpFTlFEoSQ1g
         ktW7UCg268mJFrKMhNmLkQJ+VsXuOQX5SbDmVNPxMhlxRWmlrHPC0kbwz0yrVbCnic+K
         ISH6LTN1JdUuc8TX+zem3DLkSy6JHCvJRknYaV5TrqWRPuInO16zo/V1RIB0fn6xNSWP
         xWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793000; x=1773397800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=;
        b=T8hKNDVoeBMpyFFoakwMrQdezcsD1CDa8TgGhYHNpKh+kQ48mMOysdxfIw8GoB7UAT
         YBDWJUsNruN1ajz/kg67nKZ/MjIIGgBMERpvcNdjgFWT+uwRlSgywjmqITnn6laODhxT
         AjSaAxSRiTrncvKDJHak9M2rk0toOt5TKSq9u2qGxCvMsJsW8CgN8G+uEe9cDabeqXRI
         d5Uq5fpKBlYvT/ghZNNkR+AWkuFVE9nXLfM0KX1a4QUPezjjAICNTREYyQVgdybizBmm
         soDS1vnHsEGkNa+YNmIxEfm8VMepthxy/C19SwV0OkdkdaikOTzre/reY1T5oevWC70E
         bXGg==
X-Forwarded-Encrypted: i=1; AJvYcCVBMLm8js6uvgyxQ7/FlWgfGqSKZp0IjhXwk00U7RywK4H5BEtUEu2ejBUNB4RUdMjYhp5RTP7lSqzBx5OAPEPP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjf5fHIQJSHp6VfonNNaCFFdiRVKpVUd5PLjJSMRVYzF+pDhZs
	OC7Qw+jz0V4SW9Wz0hXR4XqHi6KqIMC7/voSngOboOECWHHAtXW0tu+21O464lirhIM=
X-Gm-Gg: ATEYQzwaQTWkpNB7G/XE4MA3MkLKataWHZ0SdgSP5ki4i3W0ThctADB6R4SDC82mG+I
	yJoZVoODjgHdLScSAsBd3SvRAfMmCVHL15xJ1fA1rDJMHmKuHfNlVOEGjIfIjgekLJWAwicyGrl
	EGm1aEmNhA7PK9ttb2cXBQf+1AVJHC1BcaYBrqesWjzZIFUd5xYUz9SffYJ3zgmsBFsC2FynFz3
	JX9T+veptf3Ya8VByOv1awGIwnjSv69UjBTl/jeuCSCJRqjx9p3zX89iKHUevwTXhyFvyyR+qnS
	JDczg01m1OXMicrGgB39ps5xmRlGELXlJpHaPTkyWgKPFYNTQM76M1yaqIuFxaBBQBvwBefj1i6
	QiTRnxFrPJlGKgDgzCCWFVchUIlmeioYDuD9Pfg5Ny9UAQv/fjuSwtQKmkXvBWl+R6S+I45cFsU
	MiLS/phaAeHtIUOw/Couyc8OxERHHx34mx1v6WiN6ejmg9I1bgM3hTeeCvA5IIh7VreKQ5V3jKG
	vt1OViEzT668FI=
X-Received: by 2002:a17:906:f59a:b0:b93:4d73:e8af with SMTP id a640c23a62f3a-b942e0315e5mr100179566b.58.1772793000481;
        Fri, 06 Mar 2026 02:30:00 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:30:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:30:01 +0000
Subject: [PATCH v7 10/10] pmdomain: samsung: implement domain-supply
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-10-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023002_327245_23621242 
X-CRM114-Status: GOOD (  19.54  )
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

Some power domains on Exynos are fed by a regulator rail and therefore
regulator control needs be implemented for Exynos power domains.

On Google gs101, HSI0 (USB) is one example of such a power domain.

While at it, add a to_exynos_pd() to avoid direct use of
container_of() in various additional places, and update existing code
to use it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f59986b56213..ed7a5807555b 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,12 +20,15 @@
 #include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF		0x82000410
 #define EXYNOS_GET_IN_PD_DOWN			0
 #define EXYNOS_WAKEUP_PD_DOWN			1
 #define EXYNOS_RUNTIME_PM_TZPC_GROUP		2
 
+#define to_exynos_pd(gpd) container_of_const(gpd, struct exynos_pm_domain, pd)
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
@@ -39,6 +42,7 @@ struct exynos_pm_domain_config {
 struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct device *dev;
+	struct regulator *supply;
 	struct generic_pm_domain pd;
 	const struct exynos_pm_domain_config *cfg;
 	u32 configuration_reg;
@@ -64,12 +68,10 @@ static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd,
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
-	struct exynos_pm_domain *pd;
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
 	u32 timeout, pwr;
 	int err;
 
-	pd = container_of(domain, struct exynos_pm_domain, pd);
-
 	if (!power_on) {
 		err = exynos_pd_access_controller_power(pd, power_on);
 		if (err) {
@@ -126,14 +128,45 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	return err;
 }
 
+static int exynos_pd_regulator_enable(struct regulator *supply)
+{
+	return supply ? regulator_enable(supply) : 0;
+}
+
+static int exynos_pd_regulator_disable(struct regulator *supply)
+{
+	return supply ? regulator_disable(supply) : 0;
+}
+
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, true);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_regulator_enable(pd->supply);
+	if (ret)
+		return ret;
+
+	ret = exynos_pd_power(domain, true);
+	if (ret)
+		exynos_pd_regulator_disable(pd->supply);
+
+	return ret;
 }
 
 static int exynos_pd_power_off(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, false);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_power(domain, false);
+	if (ret)
+		return ret;
+
+	/* Ignore regulator errors - the domain was disabled after all. */
+	exynos_pd_regulator_disable(pd->supply);
+
+	return 0;
 }
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
@@ -283,6 +316,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* get the domain power supply if required */
+	pd->supply = devm_regulator_get_optional(dev, "domain");
+	if (IS_ERR(pd->supply)) {
+		if (PTR_ERR(pd->supply) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(pd->supply),
+					     "failed to get domain supply");
+
+		pd->supply = NULL;
+	}
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be

-- 
2.53.0.473.g4a7958ca14-goog


