Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4531DD3F092
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J9mAVn8R3b4lSWOfrbKrodX1tmUBpKSiHbvrB/eirA=; b=dOBbk64h8o9rDswsW/nQSpO5W2
	d9537kQTw4USAzE1E53LtzYbshuh2+8PjQz0KExcDb0YP199/a5yBK43GIxheu6owFr4vO+uub5ln
	HDCJ3xMJBntbv4s7aY4ktukriptbs4huTg6zRMHU7VUKGNRvyxOetZocU6jtuKAyHkJrpygFK3Cbb
	ZNlclSPet7AgWCdnHmTYB89OMakd/fK7eX5hk48FMlyMz9HKlOsfrTk+hFjZCAYRSbqfGPJacFXAf
	+s/q4n/kCeZDP37l6ec6gLnPlm6U9L1jDtHvCoWCYnSbvHc1YLhto24M+djXFrONZiPJwcyzZTfg4
	f+6GjnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88O-0000000GLx9-0Grk;
	Wed, 28 Jan 2026 16:11:12 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88A-0000000GLrn-2wmu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:10:59 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-655af782859so76012a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616656; x=1770221456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J9mAVn8R3b4lSWOfrbKrodX1tmUBpKSiHbvrB/eirA=;
        b=a7/JeeFKTAPlicPYHnSTIEy48Mj3vzv8Y3m0DGP+v928mwjqrvS+gQ3PoUcG2bM41e
         /8lpovh07jH853yNI01l/UWP6t2j4X2ddHUs4ol4vKjN1DZBizcUhpAsMm9ADXhF9KA0
         LIwgDNB2qJ4afZApTDISsSX2yCqrIPmN7BqM6nO8N5jWJfWGztr+C254wPkK4OBiWoZL
         zzTdaNFDuDEHHy96dbdQD0ufHo+5Z5NGm8UdicbzYHxwyDyQt6Gg28TzaWjdTkWC0XCB
         6UfYn+LN3L+Ny4nN3sVj5tjOAoeSCoUfXZULLdEWYG0Okl75CMeZPY4WY3JSF/UO7Zbl
         dhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616656; x=1770221456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9J9mAVn8R3b4lSWOfrbKrodX1tmUBpKSiHbvrB/eirA=;
        b=L750GUuT15hrTTlAwjIZemKc4e4tSFnFe7JM0NSNPDA5b+9vSdtIxzqfEVFsYQL8Bw
         BLWSgxM5UHiT4CRPD7C6Yzb/9RxKcIk+1Vno4Un6XSZohP4gVYEbujiaw03Vbrdy+5sv
         gXdaskQ7flV0sspIAaXEte46HAxGFMTkLsAzXz5ASlLSOdYy5xehPBmNkJjqehDi0hl2
         3O0KL+DE5ZvhVYVJvYSBiT9LxWZLeOIipX0ebj/hjhpJQVIWLv01shFIwH4iCQCgFNsh
         eGTPoQPNPseBsIQeAy9b3GkQSaBnMexUNIWqDZRSf5DX6mesO8K4FywZ7fzCQ8SXMA7r
         3AYg==
X-Forwarded-Encrypted: i=1; AJvYcCX9C+S4OkcMe0pW1dKb7zVQANKYlgrD1nbSaD+gR/GwWQtKhw4b807UfvWMGAvDyFMgQPdqTOVzaL27AQeMqEbf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9A2qJ5BCoG0/pg6AW7urByIolOMK50KXF6ZygcX/zRhcgAgRD
	LNM8JUveNJBBb1BnL4pbzrN2eKnQO3fUWJjFFtwbhU6IEXteJVxJTFzyTWdqiCwwt+M=
X-Gm-Gg: AZuq6aLJjPP0+azdWj9LMChcMyEGn5DjOueEGWshI0cVTjKK+4/VWr7R8/13+ff4hqU
	f9eGY4fEBPO5MAppMuyi+LysVzlpQJ6Sv6VzK5jX4e2lrPm9t06WuL2QqB+MuvJHhbDHy0B1Fhh
	N3TBWbGwCCC/vLn0nIuGAHFS9VQGdf08psvIkCM6ewiClm9Kzsj0+EPAvhdB7U/HKgB49jEF5Ds
	L+AgtjdJCm3z1Z+kgMIdqUiiYG00HGSuInt+MwTUr6YFN6ufPHU6mGYU3/1oCC9sAmZtnyOiO9x
	8ZRM6f5kiAdd4eXtqtmOLw7UAhNKsOtRGRz2/QnRWp/ksUrEG4J7AqFy0zeHCY2HmjGGnyZqQzy
	Gn/i8fQJnKhTW18ZfUkRaXJHp893za6J6S1rpq0jJ38rbj+pcQ6WsUoqHMsWqt7jhoAfaRyuYxP
	bdgYva7AjMISy+/7yasEcGojkFhK+08G6jBMKS61i8Cn3TYoFNXwKwtb+geSSktu0echjRMrkU9
	/nQVPUszfemj3rU
X-Received: by 2002:a17:907:3f93:b0:b87:892:f43b with SMTP id a640c23a62f3a-b8dab4455a7mr396560766b.42.1769616656353;
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:55 +0000
Subject: [PATCH v4 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-6-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_081058_754996_8AA1CB8E 
X-CRM114-Status: GOOD (  15.95  )
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
index 3bcba7d38ac1572ef4bc2f4052c904dd6c4a7bfd..8df46b41f9bc8f0b2a03300169a4b52457faaf4d 100644
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
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.52.0.457.g6b5491de43-goog


