Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D79EEF30B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=; b=PiZNVtQFln9QFTFaC1ias9Zd7j
	WF9EXGenXnPyH2byTa1Fpt5ejVxNr7198gBruiH94K/6SoEn32sskploATEMdpKDlfYapMihtL8JR
	0DJsSucziq8mzlrz9Y5Afn3CGlytSHstZ7Zs8pLXejgay2rQNDeTEwYH/cFk+dxzmf5NXce+Gd99b
	4XghFm5kjTKtuLxxeP771HZBVrwHhJcSh7iSNyzfS/xRvlpUfqZtVzmIhYtBpHN4vS+Ly5piQo1bN
	24gWm1EbYe6eyPSzN71EUUhFu0qoc5HetbSOcv0oV7bLLZlaNiqOCToj6F9utCL/Ezi+rAMOPUk6v
	Y/ZFSLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wN-00000000ye9-3zIY;
	Thu, 05 Mar 2026 06:12:07 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wH-00000000yYe-3N1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:12:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b940f962a82so34333566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691120; x=1773295920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=;
        b=jOyhNdPyHedJQIxTQB4lqfyKWdQO0dcHx5EfdXONw8MLEG3jiyB3oGisaqPE7RDabW
         sZ+RUVFpWkVmlWUDaNa+pc/MLpR59bKSeHTB6AEk47OXa0d5F86i+/ceICk3QnxxF1Zm
         omO9B9aEkdsoHPec4L7H56CRUTFTl8K8LUAfEDpgqHp1TRu2whiY10wsYiIJcaJIDFW4
         sgLhrkidbvhqQJI9Re0cq7hKMWt0VjXIB8sg+NuBsyBvTb5OS2bNJjq4Yu8D7XhIwQSG
         bDXYpBqT+nqI5D/2P2aTPxCYOQ2RbB4vIYsyOqaRol/C565FfkqMk9laR0G2unbW83Ff
         4LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691120; x=1773295920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJGr1pYRHm/J99djTiuPZ983bNSUstvUPO/CtwCwtA8=;
        b=m07UmnOsWL9lY4g/BFJ3DG3xJu0Tr7Pai4We5mpdDVToxzPXq1fYG+NS51jEpptgTA
         2OPnG2brbmbxEv9wvkCR0OQpXitbm1SJY0Bg1DJJHegPnSgG/qVYhjcodH/ySMHGGftI
         WnwWP7IWmsyipHIfhFWVakkwWO28IyR3oJUgoHxtUpCOzkos8chzL43BagAgFyLzksWe
         6aq4kKYRrZM947g1y2o7mL8UuHRTuxX9k1f8LHtSgpoA3vtdJLqsca3NNRra8/CDtFwg
         KVQGTocclzhMrZlUwjJw7qqPtI6DITUmsinYszgqzJhvYwEv6iFFcBTPBuVRz0rCwuR7
         B3fw==
X-Forwarded-Encrypted: i=1; AJvYcCUBWR+FOkpp7hqpm1/I3tqZ242zd2qUMZLxr8YZ/ya0uJ14WI02EBgLfLJ3nxDGGY5y1t37JgIDN6Xmxi32xeIq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3BAm60Nwbmpc/UIqWGHaL7x7BXs85cdAD31Dg5C9Ltw1woTG0
	uXxuZmsQQ1vxP15JAaU6Qo7kbYtwMf7uFNyFxACCALtkfiMYFXu6bdY7Zo/IXi1kzUA=
X-Gm-Gg: ATEYQzyPcwU0HMKYz6aUtcPBArwwhdZmWNG8nrzzOmfjJM498uSNZogp2Rk++5PbVi1
	g53ldrcJMvi78b28Mai7GLVF0XiOqGu5Zc4wDrBeoxx5cc8ys4eUp2bhSqaDm0DxysV81bQbtPH
	hqXFaJFIoKrp/2wkrXpNq/TySolky7TyrKY0w2oeq25vzmNzYRjtBGHvaR5Fg2A9cbmwz1mupAc
	s0fQkGrrnRM8B0ci5R/GNwEd1rpQtwykhvz/fpzjIc0An2khtZXkTkOmrimQoiVweeZgrISIo1S
	6FNS/Swz4d/jQG+yIa3L0xVRUjulotpPfF9f67NPdWGdXzP4xTDVy3lWGvyETgadftuiFU7KJwf
	Yb71eWjMMJjdqMzPI4feU5fpQABx5BGI5Hu76DkHNvDZjEjLC5Fe7XVcW43yMAYXug8ONAnMJ9n
	SD5LOCXJQrV/xJobupP6YY06DwTL7k2I81m0rMlDqfoArN9quKflfpISpyJDsFL7F5GKFMUZhW6
	gakYajsV4qAlVI=
X-Received: by 2002:a17:907:2d87:b0:b88:5158:d106 with SMTP id a640c23a62f3a-b93f154b56dmr291262066b.52.1772691119766;
        Wed, 04 Mar 2026 22:11:59 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:56 +0000
Subject: [PATCH v6 07/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-7-8cb953c1a723@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_221201_872616_1E774DCF 
X-CRM114-Status: GOOD (  23.24  )
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


