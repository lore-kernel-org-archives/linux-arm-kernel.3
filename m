Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A7CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO3U9E5jlyRzt5gakHuWl7JAgxXNMoK2+FWGHF/5Pz8=; b=xOY9yf0iKzYqKnnsLOhPQekXJZ
	ZjJC3+J5vfvvu+MfbUYuLzvmRaGj9lIt2q0d+5Y87uGN3q0PIz6zyYBuJw1XyBCFMXAIWcmtaI5uE
	mZ3lh1BEjFzPqa5zG9dExU5uUB+Cb82tElwmJt2gYAUHXCFhL4vEDPpXmzRVrmNe+QtAxiSWrnIqU
	HaD0VEJaq5mMQ1ia3jZnBH0bV6wzS03j7cKmcYKKpb6l8Uzcp4Tk2gyHrz0yMeABxDO4tWIy4abxM
	LSpGchKkEkmweVqbC0XXKRQ/kCWvoTSp82ogtVA4IWz5jxr8M093SFFE/A4vype4XP7ROWS3uXwdP
	JMKQoi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJH-00000000QZ9-4BPA;
	Mon, 06 Oct 2025 16:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJD-00000000QUP-1hkt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 16:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XO3U9E5jlyRzt5gakHuWl7JAgxXNMoK2+FWGHF/5Pz8=; b=qtbIdOFe/YTJ2Bo7J3d963hJWi
	61bZ7n4Wg9pv3WSvCuBGsLC40cx/Rqa0jJp8B8iNuyMkkl7XLJbMLMa1t2SnF60RN3cZ9t+9K9zOV
	5JhFFGxl9TJbEkOeOtY2BWX3ijEdLd8NDs4pCQb8fG33vFbsdGAYeJPkrW8AsPecHdRbUWZQXxN50
	BiDzr/1ObA0jbC0FvhdFOURlIZSf6s4Vt70/KCrM1k+5+xavPvMn6T+odKQ8aPvM/7BvMdaezrk6e
	6jsVuVZdfXlH+calN+gTIzeWP+ei80+8uf/s2CDkeKsE/4PT2HBujQaEP+HoSHo6YIWial6Ch+TUp
	m1LTwegA==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJA-0000000H3B1-0RId
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b4f323cf89bso26984266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769010; x=1760373810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO3U9E5jlyRzt5gakHuWl7JAgxXNMoK2+FWGHF/5Pz8=;
        b=ww9JNzDv8ePZuoJuXnHVynLyqZxP/KX/8tju5yKBCoM7xv2+Q8r/rMJajB5j6HjzyN
         olQpN70l9ErLZU5WgQXzeGbcKXOd85JmXQkU0NfXSNkcfG9e2p0aI1JOzrXetPvsATbF
         bq+E6NiIP/uH1FfXry+rD0+8rvvuHfjNQgY+s4ia2nF0zUt04pCOf1Pud11scmuCD2sA
         tVkAFETZsMgfxQa87Xt4SFUWno29z7pzz2UGiTjVtTXxTsjaEWjnUt927/JoqXYf+/BD
         M7wiwC3YSto7K0walIX1x6XhhmjLZTXyU4KujIJfAGDfHUJg9+Enxa+n3tR43QcEbTtE
         mXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769010; x=1760373810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO3U9E5jlyRzt5gakHuWl7JAgxXNMoK2+FWGHF/5Pz8=;
        b=iO4zWhov+X9WhA6K8X0if7ip+uV55viRkC16xuGnie/6gOJ7PRaSjdDGxEnCdHEmxj
         siaMfhrao2GrWlKpx5U5N3vaIgwzp7v+WdKNh8/wz1qu2HCxwGxqZaONbphVcZFK+Atf
         RwixoASSac9GeIkZnSi+PYhIG+7OsuZErNF3Bt1Rv6WpPs5tQ5x7kji7H/QhyEgYoHhi
         7VBpNB0zqnVd8gld5WWdeB2+6HUiK37Qy/CKasBlufnYWXHia6f0rEMFSjz0Ci/sgxx1
         UJEtTJ6Xu/DlM6gFih+fgooPQI16X6/tZOY7LlLA6DXwrXieVJJc5Os72nU29hoJ+5oW
         nbDg==
X-Forwarded-Encrypted: i=1; AJvYcCWbghMbsIpoZzhidGVLYpU959oc/ywbzHflEchdYpJFhFDqYFcvB5sW/WOdITVXVQoYvln03xe4jUv6ALAA28Ik@lists.infradead.org
X-Gm-Message-State: AOJu0YxqgRcmjiDEkkGBQAx7qmf39jDqFLvdDFnov527jUj0iBydkAsk
	2511Xiv24TsjS1CftWDhKHR7aQAgot//D329cwpNEntPgd8hOkX0bSGtefmrYYmc6Ps=
X-Gm-Gg: ASbGncsUgQ+177QG36ilzp4CKXFOy5c/SvhJsj89fzG4xwzz3/jrbRhJcNlLym+0ZkS
	fIs6I1itYYm8zTFpRphDIP4eGPd0QjMEW257asF7Vuf1FYe2DBGpuh5nl30gEzXGy8yucJULu9D
	3TrFmJyzCVEoyck2zW0WtBu/8RCmV+BhWmDuQVfBO+SXzC58UgG5Rk1Gl2/ZbGqMS5nkmBNNOzl
	pbt4/11vFzrXl1lImZ0m6uF50BKRw6vgVss0P4ZiGDXC6CaSftWL0gA9MS49STGBkN/zNS1q1ar
	YwcxiFRsFyQ+Md+eeQH9e42E6vcnM0BpW1Hi1UnqT3QxzHTUh+gmxV8L+QYwb7FleDsaVYJVCIs
	hpbd5cGP4NHYqgW+35uCtebh4ALkXcqc5+gqyIi5IaBhuKDOsBoJcc6N95aBOWgkcEcvB2eOZ4B
	IXiFXMkWBZDE5W4py5RpYK4DqyC6b+QepoC8PZOF7P
X-Google-Smtp-Source: AGHT+IGS3njBrZsQ87tYM91STie880rOmzE7eSI7lZ+5noJx3QO+oaLr3u+TwbXHZ8Hk5CihM+ezuA==
X-Received: by 2002:a17:907:6d0d:b0:b43:b7ec:b89a with SMTP id a640c23a62f3a-b49c214bb24mr1487687166b.26.1759769010288;
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:30 +0100
Subject: [PATCH 04/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-4-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_174332_335642_D9A9A605 
X-CRM114-Status: GOOD (  23.60  )
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
(syscon) regmap created by the PMU driver instead.

In preparation for supporting such SoCs convert the existing mmio
accesses to using a regmap wrapper.

With this change in place, a follow-up patch can update the driver to
optionally acquire the PMU-created regmap without having to change the
rest of the code.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
There is one checkpatch warning, relating to the non-const
regmap_config. It can a) not be made const without resorting to having
two copies and copying, and b) will go away in a follow-up patch
anyway.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 78 ++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f53e1bd2479807988f969774b4b7b4c5739c1aba..383126245811cb8e4dbae3b99ced3f06d3093f35 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -9,15 +9,14 @@
 // conjunction with runtime-pm. Support for both device-tree and non-device-tree
 // based power domain support is included.
 
-#include <linux/io.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
@@ -28,7 +27,7 @@ struct exynos_pm_domain_config {
  * Exynos specific wrapper around the generic power domain
  */
 struct exynos_pm_domain {
-	void __iomem *base;
+	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 };
@@ -36,31 +35,37 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	void __iomem *base;
 	u32 timeout, pwr;
-	char *op;
+	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
-	base = pd->base;
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	writel_relaxed(pwr, base);
+	err = regmap_write(pd->regmap, 0, pwr);
+	if (err)
+		return err;
 
 	/* Wait max 1ms */
 	timeout = 10;
-
-	while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
-		if (!timeout) {
-			op = (power_on) ? "enable" : "disable";
-			pr_err("Power domain %s %s failed\n", domain->name, op);
-			return -ETIMEDOUT;
+	while (timeout-- > 0) {
+		unsigned int val;
+
+		err = regmap_read(pd->regmap, 0x4, &val);
+		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
+			cpu_relax();
+			usleep_range(80, 100);
+			continue;
 		}
-		timeout--;
-		cpu_relax();
-		usleep_range(80, 100);
+
+		return 0;
 	}
 
-	return 0;
+	if (!err)
+		err = -ETIMEDOUT;
+	pr_err("Power domain %s %sable failed: %d\n", domain->name,
+	       power_on ? "en" : "dis", err);
+
+	return err;
 }
 
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
@@ -109,8 +114,18 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int val;
 	int on, ret;
 
+	struct regmap_config reg_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.use_relaxed_mmio = true,
+	};
+
 	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
@@ -120,15 +135,36 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd->pd.name)
 		return -ENOMEM;
 
-	pd->base = of_iomap(np, 0);
-	if (!pd->base)
-		return -ENODEV;
+	/*
+	 * The resource typically points into the address space of the PMU.
+	 * Therefore, avoid using devm_platform_get_and_ioremap_resource() and
+	 * instead use platform_get_resource() and devm_ioremap() to avoid
+	 * conflicts due to address space overlap.
+	 */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -ENXIO, "missing IO resources");
+
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to ioremap PMU registers");
+
+	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
+	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(pd->regmap))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to init regmap");
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	ret = regmap_read(pd->regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read status");
+
+	on = val & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.51.0.618.g983fd99d29-goog


