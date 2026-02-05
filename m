Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D5ECD9B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l8kLhxgu+f7eSuFAPa71vI1PB55KyeTUUj2gGy7pqY=; b=UVJLdkte7e+Afdw5Iva4WL52lD
	4goYHbTODUdmWXvGbyNdOZwNAtPnswdY8lxopyhqKT32zuycQaMLxHdJk7cfITM4+55bEaxR5NfWD
	KnC3XS8DBiF07OdxZ7JLEETI9U2M8L8G6JgoGVyfZOFZuuFebhAkIOp6wkOHP18f2EZCztQt7jPB+
	bJGDqSgIzfR7M/wBc+6YbQ/vByK9m3h32cRv/9D+hVyNtDTcj5HjT1NDsBo1wfAtW9bCilj7vJqF5
	+By33vxRqMPvzDjc5cKVOYWpI7nKw/I9BU9BQio9rRLdYDZHwXKG2WUDri/h7NT62OWlX/KG3qK/5
	PZwNv5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77a-0000000AWwa-3Jwc;
	Thu, 05 Feb 2026 21:42:42 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77W-0000000AWrx-3JFm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:39 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b885e8c6700so258670366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327757; x=1770932557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l8kLhxgu+f7eSuFAPa71vI1PB55KyeTUUj2gGy7pqY=;
        b=m7WSPd3eBnuI37v0mOCACEjg7YEGdEBJ+tlBaw9mZO2/EDbU7OGOTR93ucIb4HPjU5
         G7pM+CI8ZI42Bj9xQ1oLuPwU8ypu9dRdj4NYJ1iBfKSyNYCDKQ671eGNIkKioa1Ob2wt
         JeNVa513+FYWijbksxOuZu+ZgO07Cewf0QR8B7RQXRtvlwekrHAaUhhNS71T7MHDkoBC
         AzD84LPPcdg/U2WDAy9Q+Qg6gBrEBl4TrcCpNZr52OtgfYMb5r71iLV1IzwlL6Luq1cZ
         +dsvX0TEGVdgqrwZerYWDhRL4zXXPqOyIh2S3IdCRF2jhrLhWGvuVTXG9gbHFXdW33Yg
         scFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327757; x=1770932557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9l8kLhxgu+f7eSuFAPa71vI1PB55KyeTUUj2gGy7pqY=;
        b=hmQw0WIw3aK5lgXV9fgQsT4BGuAt4OgBjwZVmZ+9h8jM1QYnEUf/UFmcBouY2C9Smo
         xyVjcDK6aOpzP8bqDpPYltdtkUnTbWyWY1kqDBhCIpqj/77436uFEXOdAmiLL0vBzMof
         LTFKXUme5NNVRbxoxYNDB7cloWIjlsjFKtd/7eZucZjyFoslj0/bArnLDBDIe6iTjddA
         Eim5E4yfQ9aXUsKdX1uL1kX4/8FDGivApmnPD8DeDkXRECX3Gm11nKgbGQV2uJmT93Eh
         4r/I8Cycxz8UUtuciBW13I01buLMlynV/g2X2GMUTQyXNQOAcTS8QDHkwxtT0/pwa4kQ
         RxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv3xWGNF8yrUAWhEzRTRc3iDRsz6yQ+8MqXEzfCd88Mxl8Kiy24760RnnBC3yFLwyxsvTCLu75zyuXliwRo1CQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzNRbQhDHnJJfHiq78Uo8DXDJWE4onnGTBerb0l04/L5s0eWxVB
	THyCmLrzEjNFvbMnAxmnPQpbE4CnLvFWkQR1OMytGEjShmLvETfUAnB0bdA9ALT4zxI=
X-Gm-Gg: AZuq6aIzBp46WLQ7XAhCuvAUZEsFaOJRWGbfGHhSIxM1np0wBffxtu/hTHE+0IcrEow
	MdqrAlAf8gleqBIgrGVfQ6wzaE63ZvknTIpUyjMrnCZdmtyXdj3wx0OOM8YkFprL+qsmYZkqlPj
	J0Rko8hRLISx5ZZaADSBqfofSWNZ7wSRGB/jkJ8GwY4pK6uoIICYPY0GLqMaYJKz5Iixdpu6+iw
	JH+7rD8PAiwIdjVZe/KUagxPPp91yIG57ck0NOsdEwQrBULHP235xNALPVMc4WdrA6wdm4PfzCd
	9IGPVrFOfF0OA4w7vQgQvM0hc8NX0wHXzXncL8J3+Q3669NCvZoAPQIUFubGcmBRVWm3rVKORwD
	/nFa3U29GwBhkEgKyqli1aPyGOeg6c06Q8xXjSMtxpnvhvsVh681itEwSZabzBE5J4Kz3DZMy5q
	6d6e/QEYT011ycH6x9+Tdrvp1irnONAqIjyE3pJ2d1+vaT75cO6Rfamrp2Vpf951vKeWNMb42SL
	FRJYQ==
X-Received: by 2002:a17:907:868f:b0:b88:6542:868e with SMTP id a640c23a62f3a-b8edf11f3ecmr24389666b.8.1770327756743;
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:35 +0000
Subject: [PATCH v5 07/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-7-ede49cdb57a6@linaro.org>
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
X-CRM114-CacheID: sfid-20260205_134238_853580_11249480 
X-CRM114-Status: GOOD (  22.90  )
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
index 8df46b41f9bc8f0b2a03300169a4b52457faaf4d..2214d9f32d5967b60e84f68f4e99a725d66a39eb 100644
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
2.53.0.rc2.204.g2597b5adb4-goog


