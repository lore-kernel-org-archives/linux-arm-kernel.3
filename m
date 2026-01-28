Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A67D3F08E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iN7RPaetGrCUTSxMSp2jttEhwD8uGc4/qT3ZtQUJgjk=; b=gaxJTDnVCaUdFlxEYlORoevQpv
	/fL4vCNooJ6UY0pBHobXQtSR4nymIn7b0AGFNwixK9e/E15zxubpCy3GtJj/fjC/PdVV7vY5IwCqK
	KZsRryg9M4q+T4LBnC8WNziX724G73Z0LfAVIiyax2Dio6boc0iom8DbZUdxPgCZjICSFm6tsy/Hk
	Ro4OVwjhAsKpT6HAAb+95ZsFwszVrn/+yohwdKlHTF5Pvroupg693P5F11C+iN0nTLt1go11KiCEu
	StFWDYH53uItrKBmQbzJn4H+UtrZYHFrO0gICrFpmZNEBgBTkaeG0OCNNMzezqKebUtBsjt8gv8m4
	yJtj1l8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88P-0000000GM0Y-3kUY;
	Wed, 28 Jan 2026 16:11:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88F-0000000GLuH-0unu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 16:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iN7RPaetGrCUTSxMSp2jttEhwD8uGc4/qT3ZtQUJgjk=; b=Wk57VObwdvoqHb4Zg/Q+f4NvCD
	VR4Gcva4uTbhhWRsP/5zmT+d0cSsQW8VX8hZ+kc+KBGWGrDRkfd35NCWfiL7oaluxP/uoz6Y/CUkY
	9FX79/fTYcuF5NjKu41QahRznfPad047yN7kGA3A3HAr7ApPK3QUg6RkXWePar18yrTesBYgX5Ocq
	14mpYlmVpXRNN2JFyUh0If3Jr5/bQ75r9lbPB600tvK+5objoIHV7zCLJDvgvi6A67CGdNHSiwcMJ
	rJHR/XrkEAP9ljfC+AO7NMQ2BAGo4WariMukCUY7YWvg8784kjmwW8rqv1htEUzU475JijNl+Rc4e
	k3RBZx/g==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88A-00000008uTU-2ak4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:11:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b885e8c679bso1412066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616657; x=1770221457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN7RPaetGrCUTSxMSp2jttEhwD8uGc4/qT3ZtQUJgjk=;
        b=sDR1RqICGB4D0Ztrkdc1WlWgmZ8SbPEY9VS4zieBgdJnFrRJxZZQPfKLpDWfVLZY2h
         7ES3DPHH4W6+L1zFKuJRk7SoYSqPLhnBEYdU1sqwp0PabqcBGB7jEgNWt6SBs/GxWrrw
         nzavHaDBrCrfj0wHoiaWgjNWRquRG+pWDGvvcsjrdC6hp3jCYqWdIQ+8082UfSVZaa0t
         HuWAEDGxWE8vYaGhwjprgZ7f5RsRbvKpLFvxPeKy+XvFF6ck2EWo4jeuhb2+vxMhOocK
         //5HmYxZXTB/Ggoy01i7RApeJDkDhXoLJ36NdzeIqXamVHlsk9Wr679DVQuVXVirtK7r
         c55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616657; x=1770221457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iN7RPaetGrCUTSxMSp2jttEhwD8uGc4/qT3ZtQUJgjk=;
        b=AaFToqywtuF9qM3VgFQKnVgdzS7BZH7kHSRBUpwBvxtopIIbC8jrGQ6CyVIkyiDAWt
         rNAfhNLmye8CTWEtQhYhlfF8090IIJCZeLgE042UwK6DjwfwWS07SnnyCTlb7hYzxVQP
         uM/gpQaqLisfeeH6oq4oUCSegoJo0qgJYbriTtdO9ZPX5FKd94cBYu8jRD2JM89iE7tv
         WLPcQjWfvEMxhYOfWdfew2/koCoH2xhCWOUDCVQinrFh7OKknRkHv1NZFyEZsCgfDmQl
         LIvh/Ur3Q3DiPSV18NWe3Ga5lX7ab37TcPJrPj4SlpRwdQXq1mN5GEh8lJ3foxWHc1ry
         neew==
X-Forwarded-Encrypted: i=1; AJvYcCVnMrGSE2fRbEUro0psjx1dE7dWHrxJ95e5CMj/wmNd0qvtCd19AruoQ/llt2IPAqMCAvCL5nh1AdLksIslMdIu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1+R8fKH2Y3dBKpXopsvasyzSYeoCRQhnXym3kM2x6Os31eqb8
	Xc8ws0r/jfvP9VA11R/NETYDON2XVclawKnPE9C/numnvKgbuquY6CDKXEHg3VFTF10=
X-Gm-Gg: AZuq6aI4tvAt11A5VV8cVI8TZR7dGXrH5apUnorJTGt0LY7/uQGG+KDd3fzktED5XnK
	8JeMc8fU9CoLJ6Jqj3u3qFNNqGL86o3ceCFLcaPw3SKJlplf9E6pcRTJGwb5YEOHdMIgEfzI9fi
	QQa4tWKr7u/1715wGxXkTq/Wj5pUWK+7yVnq9kEcBDGxtpEyldHgjvOi/ScmIdOjO1Dz1+iX4/d
	SBa5x5a6SdiNLsGfxmCvlH1sWFj4kGBJ8UTuJUy00HN7Ig35SNZC12qbCKibgyJi0gTOaI0etgK
	UDxXNiMzwLDYDW3haf3vZ2DVI/Xjxz73AoWpnFZOQUL5BqkwSjvIIuodTQGzLyIxM2TqDLuz351
	jqxTxlNDhKOVrbCHqOxRHgzvyCHphgkUahBi7lJ1ipdjNv6L59+YkOy5jlmzPFtwOMgOEapDIKD
	MnIm2lO8JkI2itxg9pY4dm1oQW37aMIKS2RCgPfXPPtRGGyBtRTRb7G7Kba+uR0A0k6y/ftg7gz
	fwj34XF4qw4jx9f
X-Received: by 2002:a17:907:7289:b0:b88:5d85:47c with SMTP id a640c23a62f3a-b8dab1bc003mr399775066b.26.1769616656849;
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:56 +0000
Subject: [PATCH v4 07/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-7-cbe7bd5a4060@linaro.org>
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
X-CRM114-CacheID: sfid-20260128_161058_768619_01C047D5 
X-CRM114-Status: GOOD (  22.73  )
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
2.52.0.457.g6b5491de43-goog


