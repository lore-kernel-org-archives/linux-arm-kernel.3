Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB034F01827
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=; b=MSLcyvAfpACL8wgQZyPp06b1tG
	XeMjw3Xm/S+zcSn+2irz14d8DpFhohY573aKL6CVJg6k7QyZwSeSyKYfcg723iZ1lh2lwxBaM0t7d
	zEEaJq6vAO4oVWnGN0XvgPoSfdz0GOZCf/ggAavCTarqs0PiFEI9WIMHTTIHpRkU/AITQWc7R6gO3
	adQsfh3X+nbpfGYMd0/8NnxVqbQueaBvR5BkKczrFJqRccYWApN3clGrmtrqtxSaup61vieThfSww
	vSjkR4Sdhu3dZ2TEloU5x09wtlXPNo43UOKAjaetpH8DdwCW8o2tKmU+44vx8A9SYlpG1LuzSzLLo
	FKvqJGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRZ-00000003Sd7-2eGa;
	Fri, 06 Mar 2026 10:30:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRU-00000003SWr-2cLS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:30:02 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1110077366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792999; x=1773397799; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=;
        b=VRCA2cUdtxp9IxPAV53Uhx4N/oI5xqvyMlQpJnIhjToJgOzUjOLa+CLo2H1agMb1AJ
         grz0DWli7Z1r1EZYrL0Ap+X1c4Nr7Dw4N0CIuVjsAUk14RPKUC8PiF/b+aS7z+41wKCc
         f+h1cY/zZ126+NVsXOLO65NN+Z/p4kKiiUsQ5qD2eRKc1hwS03ziI07yD3VWu1czP66/
         PvKhELcUNwH5p4o63NQ1OPWd1igcEnQDUIPGubB4YizgdxT96EmsZm16IzKL429MqaoT
         JUFaFMSvJI640ScITMEVShQc4+gmonLzlRQfE8fV/E0P3UhgM4667FpzUDEaTQxfZPei
         r96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792999; x=1773397799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=;
        b=o2Hvy/toNy28/mPqhhJrqrgMGgm4fPEo4VLkNu5dXyJRceSXWHZNBwHTZEYidoGjvM
         p+F9MINEo7rXS+WmJvtWXwCuo/muu8juRMAhUYVTdGtDBP89fUqkhQs3dpQdsiM3FjlB
         Db3Knteh28wOdAe0LklfiAIEBVJCmZyq8coydQ07pGj9nLxBwx6eJ1r9s//wMKvSOVdE
         BQ5pDv0V2miNib6MxJDIpr8a5snJoOCTfDknr4GSsCAca+/hGTY8cMX4WhmVet77abCO
         bAA8T5Z3e7KsP+qvVfMxt8/y3ReUR60kbrW0JiyKBrREhedA72Vx5ZSuoxLwly+RiYw8
         6BUw==
X-Forwarded-Encrypted: i=1; AJvYcCWrCPAK/xsLY2g49nV4Weiue/SJnm+4JYTiGZ423e8Lev9LPzcdOrZndMIL2pKpXolxa6noixwMroVJZ7rkG0UW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2xYsw9qhWvhDt5K7TJA0QRiaVFCrvxafy74cCtsiYfswLTdq
	zojgi5Q/2Xtm0sUasJNPAyziW63s2LVJ74G9mFCFMhkXh8l5xy56xVrfdHHbWq9uEdo=
X-Gm-Gg: ATEYQzz1bSqrbvV6raIIKdZFuQlxPNa6mdmYeHNOhG5/7GwoNJZbwyQ4uC18mQGSr3a
	0nYlDiSnwW6L7ahXr8lk01GedPPtJhw/e20CWPAprneZn3+JKNEH9RmtDbiTBAStfDloiXo37xG
	UyQlEDHTtS4/hdLufU84G6cVnWiIua49KpgyHOjgCrPwsO5Bh6U5E67L3oH9qWs8mxV2PJ/a7gf
	DoiO+BrGiqVbGddcyIKYEio7HefRsG1O+ra0So/GCU6VYKHwEFYA+2v0A5WddqKc8O6uvdxlfvo
	501l4JTZ2z6bQ0lHzshDLOIyMgWjBPQc0Om+OetejDpTnTC64DQ/UhsvueCp+YDY9tDE1U9O2qC
	m8hQgDICJDy0hgez9j07oZRGw2iPxvgNhdZ0f8pAqC0Y+13kC9ynKU09JSdckX3u/23PJenPWAm
	aDcWmu4XPMUX7IDc3WqoHaBoiulKTz22ZHD69pd7s1itC6c4CODfXzGdQsQaCS27++xUNO+LCcx
	3smDvsm7wDV+No=
X-Received: by 2002:a17:907:6e9e:b0:b94:29e:a94c with SMTP id a640c23a62f3a-b942dbdc1femr96088266b.15.1772792998840;
        Fri, 06 Mar 2026 02:29:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:58 +0000
Subject: [PATCH v7 07/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-7-03f7c7965ba5@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023000_692472_1A8E70BD 
X-CRM114-Status: GOOD (  22.44  )
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

On Google gs101, direct mmio register access to the PMU registers
doesn't work and access must happen via a regmap created by the PMU
driver instead.

Add a flag to the device match data to denote this case, and obtain
the regmap using the parent node in DT if true, while keeping to use
the traditional direct mmio regmap otherwise.

Additionally, the status is just one bit on gs101.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- add 'use_parent_regmap' flag instead of going by 'syscon' compatible
  in parent, as it's not a given that the parent provides a syscon-
  compatible regmap (it actually doesn't anymore after recent changes
  on gs101)

I've still kept Marek's Tested-by from v3, as legacy Exynos code
doesn't change.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 66 +++++++++++++++++++---------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 8df46b41f9bc..2214d9f32d59 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
@@ -21,6 +22,7 @@
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	bool use_parent_regmap;
 };
 
 /*
@@ -93,8 +95,16 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
+	.use_parent_regmap	= true,
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
+		.compatible = "google,gs101-pd",
+		.data = &gs101_cfg,
+	}, {
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
 	}, {
@@ -122,17 +132,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	struct resource *res;
-	void __iomem *base;
 	unsigned int val;
 	int on, ret;
 
-	struct regmap_config reg_config = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-		.use_relaxed_mmio = true,
-	};
-
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -143,25 +145,49 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom regmap (from PMU parent)
+	 *   2) this driver might map the same addresses as the PMU driver
 	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
-	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * instead use platform_get_resource() here, and below for case 1) use
+	 * syscon_node_to_regmap() while for case 2) use devm_ioremap() to avoid
 	 * conflicts due to address space overlap.
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return dev_err_probe(dev, -ENXIO, "missing IO resources");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU registers");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap");
+	if (pm_domain_cfg->use_parent_regmap) {
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap");
+
+		pd->configuration_reg = res->start;
+		pd->status_reg = res->start;
+	} else {
+		void __iomem *base;
+
+		const struct regmap_config reg_config = {
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+			.use_relaxed_mmio = true,
+			.max_register = (resource_size(res)
+					 - reg_config.reg_stride),
+		};
+
+		base = devm_ioremap(dev, res->start, resource_size(res));
+		if (!base)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to ioremap PMU registers");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.53.0.473.g4a7958ca14-goog


