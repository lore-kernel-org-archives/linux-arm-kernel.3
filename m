Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD1EECD9AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8LU1GPEC/wTQLbGFIndFfoESZHedB29NJZQNfhisd4=; b=KaWIooGv/b/kkHxVn9DqAVKK+P
	kszKp9S+REMSaVIwmE0a583PgM/Z2lUxg6eZ9zYZAMtg3fK5ujoKFrOh9WuJX3LbXqmoK8AR7ZBFt
	hTbkjRR9K2qNeh1zUn7Yai4FagqzDUlJ53R3NPebDvyj7r4LM0AlPkCmrumFoV2pJVCZy6pJbILZK
	Lvyo8KAXMlMhK9P04kT5W1G3Atex90HQNGauRwugsL6U0N0zwdP0kO5cBs43jrY3uqzTN6TzR3rWo
	VYsj6SFbh1GA4ELPFS+zcghvn2IDO3YTkUFUv8SfG5jicZ1Iu3nF6ZSCC+G0Fz83mddlpiPiCP0RG
	A9tQGFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77a-0000000AWwB-1tjw;
	Thu, 05 Feb 2026 21:42:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77W-0000000AWre-1wBb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b884d5c787bso5185066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327756; x=1770932556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8LU1GPEC/wTQLbGFIndFfoESZHedB29NJZQNfhisd4=;
        b=j2wJCdgHPdFTiF4xoXpq1SJX/c+Nc+u31/GWOxtpxF0kWv/vrlLlB2Ife9u6JVXsCW
         06B/Pwra7zb8B9sWIX1lY8jYr56CaXraRVHx4uDC/fo/ktVqcl5oFXCyG8VN0LQLOq/Y
         MMrZ+xfEvFEkZ0h+6dgeCxntbrDTuUOp+p/MJ5fOgBGLQdfcCKEub7N/1N2rQO8VBjZN
         9VThcXr8gRplnjdJujkf+OVhExADLo1TmIi6Cn2WEHpk5V2rrnD9X+n3XWx5OjIhLXRr
         SZmKt4/pXDL2HCaOVbJi1B0jExiBtn8ONT8rfLee4+E0qsllYhCRY8bvMMBV73gDHClO
         T8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327756; x=1770932556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O8LU1GPEC/wTQLbGFIndFfoESZHedB29NJZQNfhisd4=;
        b=U5rxctr8Ugx5pCgdZw0WVuW2gLgFVbhozNhXqzSd9MqZXljJDdBApR+DUVuW77lmIG
         gd3Ggne+Edmd1coBX2iinmFZuh5FVt+0w22a+irdA5dQH4mBH9QWRgBOEUjB+/mIyGYN
         ST/Q5VbSi7z8fVGSdB6EvHlbRsdx5G8B3So9Uj9Hvdr5FwuT3kx7JwI8UdQEJlYDwZ+a
         H1eqBdwvvnsHvvVPX0KM+SPwO4BjaBjbO1NxfL3yj9U6NC5UjVH/lLI9Zi5oPAjXAHuE
         dd5RcskK5Ifo2p/XeKqUd/DSwz7ntaD0DaCFmRINsa23YXSriHft8eCJvR5Y9CirTrUi
         NiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFxKvwPljOY3UySnjnh0f4ZTlkVA2/RaKRvTfzIS3gPpB8LnyCI+5VBjLH7GB3IyLDpp7HOOGxbFYGpjPxCGy4@lists.infradead.org
X-Gm-Message-State: AOJu0YxViqq3vkoy8x/MOzTusZN2wDlrsbu1nZ4JeJ3l4ADnEM34FJWQ
	QOVQR92bWG4eZVqlljz6qnGgUb6LXGTwzvOntUfDqGdwD4T4r/BTNFIyOqZ9/PKxgjU=
X-Gm-Gg: AZuq6aLS1rTIbFmQ3AQnLucC6YrF1H5gFnB7tAhMBwR5x9gY2R6vqPDj/Ut9uao4K5r
	foOqKr5hNRHBgoja1a9fw1E9cGD3SYBEISOqxu+WDvXIvuw32BfbzGiTf+jJWjm73su0pofIGH6
	FN3Z6f8RCighCBwzWlqRmIJZltGpImt1yv8E3q9G3Wh0RLUE8rUX8+BhKle0sjGYnSxNG5d+nct
	1B0PUWyrra94NZ6JfeCNq2HRpQqyyIE/O0WpWu+kEyJpE0PvTIIccBMOVNc5adMH6+WcMbE54tb
	js/xkz0D3Yh0u3u7IlG1gbmHCoc4Z1yoosfW6X576kwHGuwjKrihMmqn92Z8gryPXSxKiVqSWLS
	Ig5wbsA8+Cqgr2xhWiRlKHaM2pNuBEQYA8dvwgb7BNQxP9BdGiB6YdBy1OkW8Zvz6rCxMx9v5fM
	+cuZk4uTzlAh7xFRu+YVOx4AjU+9SryPDGKyY0WxYyl+/yKNmAjU0D9idPqxrVQwepNN/eYK0+3
	Aq1gw==
X-Received: by 2002:a17:907:2da6:b0:b87:117f:b6f9 with SMTP id a640c23a62f3a-b8edf174430mr23264966b.8.1770327756177;
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:34 +0000
Subject: [PATCH v5 06/10] pmdomain: samsung: don't hard-code offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-6-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
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
X-CRM114-CacheID: sfid-20260205_134238_514546_DAD3F026 
X-CRM114-Status: GOOD (  16.08  )
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
2.53.0.rc2.204.g2597b5adb4-goog


