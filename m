Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA1CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DqQ6MoGys1zapyNUJpLRuxdOB+fSzbQVKEkSbvrKC4=; b=dP5bs0d43E9t9B9K3pBOIAKuNZ
	4fmS8QG0/jzH/6O9UiNNHd4SnzYAHixMVP4Z21lJVhSrl1OW0sRFJ1JxqUhaFSscauU++B6fVVv0W
	k30IGN8L3SDnVcRM//W0FZH0r+vPaH0hJbrCa/mVGBaB4mCTYJUTjdEcXgwtlG9NtCl8ENG9MonPq
	qFHs1IEXRBLs3rL+F3buAKLrwAhF+J+cSSX0/Idn467pa50LtxuiR5LHvIxm1NHhNs4dTwW0dJ+9w
	TPnd18d804WXzrDxPide9BY0OFxuXe+CumpORx+IdWnIPy+9RpeuD/Xl6O9bDKJqdTNaeZF25QC5M
	BmPdiGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNa-00000005IkD-2kND;
	Thu, 16 Oct 2025 15:59:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNW-00000005IeW-1nh6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Oct 2025 15:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4DqQ6MoGys1zapyNUJpLRuxdOB+fSzbQVKEkSbvrKC4=; b=bl6p2zMT5FscXvJmce+jE/e6QZ
	CjPVDQm4DaSiT5IBXNIWM4ce1EC+R9YJfhqe8HbVlyQMcNVc6rSCZiP0bOl9PosLTLEN/moZw+aVF
	pexKjkmakjUNc23JpFCXURTNWnyXOFP7E0kO24mK4pfBM2knp2Tlb8uA62O+CmpW3SqJVMUM0tLnq
	bWga/u3nPGiN9nRQE+VuTkZFPsFXKmYaVAyFO3le5R2P8RKOMz222UiZrFATeLxWGT/s9c0XEaG1z
	7xssn5UcEzYUaE301N0qn8xuxNCgRqRleQCJJbc3oEmmIZOxKGVAOxZTnNQvfnl16eQicd0UI/4OM
	mpaepEtQ==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNS-00000006qCj-120a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:56 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-63bdc7d939fso1854350a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630332; x=1761235132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DqQ6MoGys1zapyNUJpLRuxdOB+fSzbQVKEkSbvrKC4=;
        b=V9l1GqdAUaAhA5JIb7stjgaOCPHNqvtsxlMfxCUxiFJlqSt46dz8I5DSwmBUy4Rvzp
         26YdQ+7B26m9wBnnDOHY+f8TwOo8yFHXDrMVZl3PnmP2heGGvmfyMNbsYjohaky8w24f
         z/H/eo+NpEZldBmyKppCHtZarVnbxMV+PWJa7LFP+6suh3brERTwDQztlpAX9Nk4FsGq
         FojDweDuGHl+MaBZc9pCSRFoKofMn93UpM119Yh1PuvdfYrAvVQMo4CC1P0z5uHmpPXp
         WcXwhWgAfmHvFs2w+6N2j31s9pP+mjAOFKfqf6XX7z2tsuOlByJm/NSyVCaR1pWC2u/L
         Zejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630332; x=1761235132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DqQ6MoGys1zapyNUJpLRuxdOB+fSzbQVKEkSbvrKC4=;
        b=lmoRm71Q222yYc4LFDamECriCEpOxMvx5Bh6j/XVjS2WmkuvJkuaQGooyGkQ1tWnI0
         PLfiRq5BGOc53rd9tAANDNxjM+WfoI4OXdUeMDiYoD7C55M51L/kUq068cXD0UOoqGuY
         ojassprkonmfulFeC3dKt9XpKf6/m+N64ob+Mts6jGajJQkB9ECjk9SaNPvb4CmFBEVP
         GiWGI0fvMTW+DZbgJDmxdtHQhNa82l3MuwfH4cT+eAFOsSIAz9U2Ri1nziuj+AfRowJS
         kkvkxcOunx+bfNH0A4wzY4B5R42NzMZgjklLX+Yvd3UxafLjxWOGIOI+D3x/dNdEQ3hp
         vZiw==
X-Forwarded-Encrypted: i=1; AJvYcCVgB580CPoQcFlIVFVZyeGWUlCrTrPCu2LHx1UQFLrpffxMy3YeutidSF+Qfdg09d9PKqrqwDlqe+FxCHoOg0W+@lists.infradead.org
X-Gm-Message-State: AOJu0YyVAQ3fHZk2u5Ta8I6+0rLfPk3u6E+6iJTHH8DSfJV0Fro+wuyU
	YAj2YTyDXbfHGwfnZHu72ASScca2RfpJG6evhqlLx9y14jjB0MP6q8bEx1owp1Sfv3pMAUNKJd+
	t3QyHwDizPRWS
X-Gm-Gg: ASbGncv+JgAHM3bDvaMJ/Qi/P/lXaKZDq3kPduuXtSF9uzel3D6Be09ciKRTub4vs6Y
	GVk6VMqjn4kVSSMDsT8jTc9RQ9WoNVoXcq2/YTLzEdJxBHr3TqvJxVf4MX0l5PZfLYuUQTJU+AQ
	qxN4/Oo7YjVTmJe1AvVa+hz0mAPA5/1fVTsEpLjEBrp386AsZCW+DbAk8oNNnCWjMDLUGCgSyGv
	pqQCQ1OpKJ3RQ2/Hyprif74/zSR8uBHYSMQqX3hhFw1PAPO5jXNE2JujISIqSVLA1duITLXTB0L
	CJQlfi2J50LzvjpY9z0e3FM/DYQrZa4z0vRAYFiyYL9J/Za29WyjBXnx6wpGPgb3CMpyVkEGMlB
	REbWHsudG6Pvocr3HWRTteiMHtIYq1DBLlYzT1pDO5v7f1UcD5Qnk/Wf25Xumwl3mUZHib5gObY
	MuZELNb77zaBm/rgl4Wwd7mgcYSJJaw0T6p8fZVXavI0PLLvxGfhIZoRlz5rDn34tQ3n6LqL8bQ
	NEqH7/xXA==
X-Google-Smtp-Source: AGHT+IGbtiixleiqyswoz3qLTql2jI01A11bbfMUkIlJUu938gTSGbLcf+e3VcOx41cjcQhTYXkCpw==
X-Received: by 2002:a17:907:3daa:b0:b5c:6a00:f8da with SMTP id a640c23a62f3a-b6472d5bbf5mr53175666b.1.1760630331578;
        Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:42 +0100
Subject: [PATCH v3 09/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-9-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_165854_564715_3A5ABCFC 
X-CRM114-Status: GOOD (  18.45  )
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
doesn't work and access must happen via a (syscon) regmap created by
the PMU driver instead.

Try to obtain this regmap using the parent node in DT in case this PD
is a child of the PMU and fall back to the traditional direct mmio
regmap otherwise.

Additionally, the status is just one bit on gs101.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 65 +++++++++++++++++++---------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 15a1582aa92103a07335eb681600d9415369fefd..a7e55624728a62545eac049c9a51012a229f44c2 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
 #include <linux/pm_domain.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
@@ -78,8 +79,15 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.need_early_sync_state	= true,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
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
@@ -107,17 +115,9 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
@@ -128,25 +128,50 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * The resource typically points into the address space of the PMU.
+	 * The resource typically points into the address space of the PMU and
+	 * we have to consider two cases:
+	 *   1) some implementations require a custom syscon regmap
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
+	if (dev->parent &&
+	    of_device_is_compatible(dev->parent->of_node, "syscon")) {
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
2.51.0.788.g6d19910ace-goog


