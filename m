Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09488EEF309
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=; b=MNdv7BveEdHbx05oyw9rUhDOcd
	3/EGKOz+QjrbfWkLZn6HSfAljVI9gd4zyk2JpA+w4KGohWNNeZu8eAXKVAm4il3pJ3qzKMJB7BKVm
	bt2ajZ+UAoLHMxVkjabEqXwZn/F/y0+OtbFIPcVHaRI/b2a9cdm13HSD1uGeZEsSnQNyKRB31i27v
	6x9twJyDs2IcsuWhyIXACLbynzNqO0eb75KfFelkf+5jIG78NanBuaQvT1+lHMSbAzicHliRtFejE
	MBlpCDkRqo/Kt11XUYochOITWfC7fP9qtgE09PQEphveqI5YN/RQhcfj3AZPrZCQtsmz619aT3bLm
	rXweCCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wO-00000000yfR-3bLc;
	Thu, 05 Mar 2026 06:12:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wK-00000000ybE-2Blu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:12:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b9382e59c0eso212961666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691123; x=1773295923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=;
        b=nI5Sb2nenrd1QAxKg6hKY08fFS14J2aUJRV0zQWU/gNfjRa54gdq0rPePABxcG6Vup
         NE2rSqGxj2L3JmRTeFe+VVyIwFA9hkwG0O0RXZSLiazINbTXK/lB+6vkyKrqyKnOegll
         i3kMr/DE+DukT5SUeSocVMBl3BmJd1lH9BDihSbaOV06EgaFEhI+/WEDSmOmPO3fBEs8
         N0DCxC3fMITZs3HaSqN8l72+BjnRX+bgoGCikxcGuwhsnDcH59OqHwjGbaArjojT/ZF7
         fYm3gNoVJJAHBhx3MU6zuo63x5vyYrOurmgIvO9R1BnBSLadyr2BWV/X+YGLJlQbSuXB
         Ft3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691123; x=1773295923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+RpBQOuQW07kF7dgJNXDXfeT4g3XJJZS09GBpqTzzg=;
        b=h0h92YTeQi7P9Eg41B14QsgqXjy9Si8HmgunuP5zlgs4xGpbTu2AD77gbAvZtPYdKi
         xrPlVGUcbZByroOknTSrZLsTheE0Z9v5k/95DCbRNbqGe2rjXNeJ2CoZHJWZshFXq4/W
         4zHS2j9kU884k2kT4aLNHuGbcRI58zgZZvvKZikjrYPWetXnsDT49UVIFYe0KUZqdvw3
         G7o2GswcrST9n+eGLplJBXpRTNbNLT+f8xIvOJZUHu3NgZzQvB07rq7RfcCQNpqb9b4K
         Ks/IkLZchbWpopS+1fDRs/JdVxEb+pOrF0117FXFcmUlw0rtj3OcV27oUmY9IqTcr/fU
         O7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCX48MrpJMfFyXYgkfhMtCxnnQnkUW9Hh6eByuMde20G8ssAJMqxgUoyHjO6uKwoxa9NddEVIbd7LIVV4iPP05iQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzZM4ieVbW4VIb2CN/aTndUHH3QlE2rZuA2R2vNWJYxayHkRKdO
	GZO/li8D3U4E5vUOndXQWrfUaWOoGpmKU6h4QQX8jxKRPYlcu1uhO3L5QDGm6UrDWUg=
X-Gm-Gg: ATEYQzyRouMuejDbXgKckhC1a7EK793J70M3BnNtpsTSutt6REpxUOxuhjl+vOJ87AZ
	RqID3Js0cfffJ7guS1IXf44NM3DqAeegJ1F5ZYSFVv3oCSrYwOjoccdDLCcrsUSOwuez9H+OoUh
	66Si/mCrxd+odwXZHVolyM0RQiUc0hro6XGBQ7x9InNUZSG4BLUQ027tv30cN49bFMgqphFVS3F
	X2fIbg8sibsjG5b+6ydYph2SQ9loSG2ruN0dK+VXK0lkmTioXF+xLNTYkNt4eG6CE2lE0/cnrHQ
	pdw7SPFeD0lJTjv+ZAluYE3fw3GkCidNnNcCT9qUfbPQbCxCNXjrblxFdsNT2toN9e+Tq2nOvQB
	ZD3CIrIvkxsos3RuYLlxV4bpmijEK4zJ+cqKpqrxOZ/LcmCXvxi3tqvw7MV/yf58FjidC8WhjMq
	EYujfctC6c2flhM4cpCt2i8AoNGNDKDuZhvAFRYXg/7vQf0eb68oUU8PZ2aR42CEo9H6fafCSn+
	2yfHgqCoxeAEvmzEhZXP3nwrA==
X-Received: by 2002:a17:906:6a1b:b0:b8f:8cf4:adf9 with SMTP id a640c23a62f3a-b93f115f763mr262528766b.6.1772691122762;
        Wed, 04 Mar 2026 22:12:02 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:12:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:59 +0000
Subject: [PATCH v6 10/10] pmdomain: samsung: implement domain-supply
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-10-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
X-CRM114-CacheID: sfid-20260304_221204_649699_A112B657 
X-CRM114-Status: GOOD (  20.34  )
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


