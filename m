Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542DACCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVAeMZOZRjoK+GVtbAGxhgZ6PYOesgGPyy7xYiTvQkk=; b=WyjJn2ZS2uSM8wspQaNpLwlpGa
	I4XgHUc5Qk42p1dvU8GilscPG1b94ChmiM6etfCk8hVt2ES7zq+bvfTxWyP4bzRRjlW3d0HPgqBZi
	rW3vyDd863/LmEJawyc/zk3tIHmIABjsLcNBcuEId00B/jR8JGKt4ARIRQPi7rYoXVy4OmgaPEf64
	RkORjSPt/wxUnOogUMm0odpcbABt6RgGcD2t1kdeTtPWfWKc5nYFQpJnGLbMtnnrw/9rRYjrASLrX
	hcve1dI1Y5pwTnBCdIhRN/bHSEmLyeW54iRsvJF15oNXZc5ppi8r086x2DhO9JyswDNpFjEHs5PBC
	3tWTcYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW8-00000006U5s-2GEz;
	Thu, 09 Oct 2025 15:25:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW0-00000006TvF-133v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:13 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3e9d633b78so104298266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023510; x=1760628310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVAeMZOZRjoK+GVtbAGxhgZ6PYOesgGPyy7xYiTvQkk=;
        b=p/qHX7B27Pdrh80O3pEaoOpIptWgBtNGS0OYn96PSzOkV1gE2cmiKVu3f9ipEYdWYZ
         DjgxW8uSbvNgOL55TzrX6nL2Rwhme6ZK0tNkREoOCMPqmlbn5ATATWeXrCARxLt+PXnV
         NdfgaQcA2u7CzquqqGFkdwZkX/duEkRRFtPlKXShVlBq08Rgg2MmQGUvCx2A8066uYoO
         fRRDraYYjnMfapDewHkAL8T79Nej+zqbh512ySHc2HBlnvtZlDl3SqZ4sSp+RlKoNgKI
         63z20jdP7u6LX3CsPRyA3nR6XfXBn+T9Y56Kyj6fhV2n7OAvJOwZ1Zc79aT8Rnu0d6xo
         5Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023510; x=1760628310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVAeMZOZRjoK+GVtbAGxhgZ6PYOesgGPyy7xYiTvQkk=;
        b=ULen7Gld2eComUQr0ultFtM/c6CYMgvnzE5BXGpZnaV7twqZO+LPjbK1Efjh95gNul
         YXxl5knqRyeGR8sD7JyQRRB467PoWda1K6/e+L3Vl7Kl3dKLSi/CZtHhX0g81tL5Z22k
         dg3PTIH3BBzhm2ie9bSXxBmsqW5NBPuy1jwc6gAoGstJFuoOQmp7jYEBAqwaJjDr+gyv
         QmMougFitKVDs826SPoIqXOrNdiNblRKjA5vJbRw9cTqTrHvkrHGu2Uilni5Cl2KDpCL
         NrdlWRNXlfr/wf1BMyNgPpELCvYqzbJrXmdhiqX42jA3VqVZh7dT6PGqtv20nUVLFHYK
         W9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU20sHCmpbPIVhi75Oyum9JqgltqLba/MjQf30G/be0ZwfHte+95P7MS6uNtrrlfjAxTt4vds4mPEK342SBeC3l@lists.infradead.org
X-Gm-Message-State: AOJu0YxwfkZQJm9nyP0559DHGsWjwWijvTgbtRFpVSgyv0xT0kF24XjJ
	4sKSVIkixXENoADV324dY7sy2iK/2b8+Q/G/inJZYe5SsuaTAZnfLym/U7UQAgzyfPo=
X-Gm-Gg: ASbGnct7xN5uON0406qw+2vUcxty6JMjuI8j0RTy1bREBFt1O/1O4bgNw9BI1VS+nnA
	62b+C36SNds1zmav/ABi3d2q6Xi+PTIgZJnl0SlR1z/fKSmVWaGs5VfNPDVCDmE0yYN7UlIhm9f
	XXZxWCcLxZRs0Idpzj6hmMfTgHH+/rErxOa54q2g0oQUgi6tJTQOYgnc8i1zOIG2uIPrdpqF9eV
	SvLzETi/SPOTjBGtpmBFW4cwoi+Ohf1pgakTtd0Zh+TDwrBNQCVeA8sQ6xVErY3f7h3Zw2AuQEf
	fr67eer+iSJzC67tal0xXtn921HncSTbvLd6OI5k4nP9964bWTwy/E1DEDdIxQBCgCwXKRqI5iK
	WMH35IkN2+yHf7G1qL4vQlN90jEulLP+7A1CF+ImBatKuyliYeCKvKQpPFz3zLqnsvztLGnoLq8
	cmYqRHhqG7n1vkXcwqYLNhc/QyMjvCk8oxfIa6ye96
X-Google-Smtp-Source: AGHT+IHQigChCGbyX9QcN71UtfHBK/a2r2hCK545ETZ555mAVRYH/JS8za+ESngSjBgkhY0CJel3UQ==
X-Received: by 2002:a17:907:8991:b0:b33:821f:156e with SMTP id a640c23a62f3a-b4f4116a352mr1495403166b.12.1760023510322;
        Thu, 09 Oct 2025 08:25:10 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:11 +0100
Subject: [PATCH v2 09/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-9-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
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
X-CRM114-CacheID: sfid-20251009_082512_329940_FF242C8C 
X-CRM114-Status: GOOD (  18.82  )
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
2.51.0.710.ga91ca5db03-goog


