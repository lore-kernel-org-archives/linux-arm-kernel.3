Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B15CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sx/VxWL+zXIwDerOXQo/SlWkRBTA5eJCirxOIqSzME=; b=mYupMAs31Zt99np+hGkFeIpl/j
	ai3He2R1mtvCLjz6lswZ8bEw/tcS4qaXz/sATh2pxvGNNUaMgYEKQxsMvDxjUK1fHOattx7OuTz/f
	h/EJDaHYnQJDO41dx5ZWFlvc+55yWKWgPW/9s9EyzpghWm5smOxSNKQVKJD8Oy1+uvZLfMvV/Bkr9
	3mbIswUreJFI7ZKycMHTlqtlfy5xIq0faFsSVGrPpxhqURKHj2LkwyeeR8MH625f4ZZfU8R5LtN4R
	sO+3HQT4oRrQu2Fi4zeoIBG0idhKVDrvbwFeyNNISaVyW9EaeZZeOEKqAWRYzBMkW/85PJtZ6/gbM
	A8TRs0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNR-00000005IaM-3h3w;
	Thu, 16 Oct 2025 15:58:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNL-00000005IUJ-33Ar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b4f323cf89bso182586266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630326; x=1761235126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sx/VxWL+zXIwDerOXQo/SlWkRBTA5eJCirxOIqSzME=;
        b=csW36TYwNx6K0tTxFfelwv92MS3AVJTJPQ28xKFm2KWQfXgW5dU/x5BpW7pyEwBUy0
         /QxsZmOv/2Ve1Xq5RBJ0e9qYb65/zwYJOppbVkfW4MQ1KgUiLW9nr04Ad1YMyqggX8GY
         7hNam5goST5A8VxLDTNdzhYRSnvdq8juzUXUEqRFSUDvXWfY9AabTT4KjqahXmH/s6OT
         817/KbRoEsRtvF5Ljly5bYOEwNoMxTJndOxBrGErTNPbznPJihAINwylyGsrLLna7C+d
         LBDP5eMvdSttRyWL1zGiAU0/Yzpb1gQRfSuRe9RTonl+n/O0A9v71L4X6jVMEi5v9qi0
         8M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630326; x=1761235126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sx/VxWL+zXIwDerOXQo/SlWkRBTA5eJCirxOIqSzME=;
        b=v1iPFkD/TodVpK6f12FLR5U/315Ax8CLiOHc8a8gXmnjEGKR0xSSPaG7hRg6DT1ZHW
         IAAhhiT9P9/oqmzGa6HtKLcEGBYgwPlmPeF7oTsTlflFmUjG4q+wNH/K2JGT3iUggC4p
         QJDemC1G4FX6CTgihRTpiap+lSgexlS9MVLqXSl9tiRQNT8ZABl63LYUeiIAUlftQ4G8
         krp+kfc/jYUqQ0aE5PVjLW5PnP00wGAb0vBe+tYl3FxlXXotUMDRmlQ/EZ87sy2/jDv5
         HeBh4IuItmqvtobrTl875yHlQ9AKWSr1uEQa96z5FqEO8Iqg6yF6TseEnQEoX7GN3LDR
         1sow==
X-Forwarded-Encrypted: i=1; AJvYcCXU0YuZwvF4TMZMpKqiLsDD+JHnoHg4G7YlwVGM36vnGu7SjbSSqVRy7ln3Orgt6aVeWNo7jUu/+XComUY8Cm4N@lists.infradead.org
X-Gm-Message-State: AOJu0YypdcKvlKblZIxht4h1kD8VpOoLvoM0hgJygIj8uh5ymfxG7qCq
	rwyO3a5DPDNwRk5zl6YLlBbzLxo7b7aopAXjuW3EtH78aFKaJbIJ2EXRGA3ZZsslWQI=
X-Gm-Gg: ASbGncuMsAdW4Rg6PjhgSNnzsqELBnxbmWsrtE6qtm5EY+rYnepRq0pLtHzHtlTZeD0
	y4x0KNassKMLBnC4KQESwYyrIeAo1sQUU7zsBQtaPEQu4FeGFQrc+ZIxTz/XAoZd0OprCqNXMmR
	9pt3xtT74QOjJw7CcrrjSGY5Z9qWb6wPq7WfVusJF2zZfSDnkK4JQPuwiHzJkkRD9zXKvoaR8AW
	wBiDukXUWnwv3juwRU+wINf2Yk5sRkYq/1oo7dg8C69CwFW+Yc+OaESRDDOIl25mAqmgfTdiUEj
	K7SXZx7nxMB3RkyYEHcmNLrGxV+Xz5BWmr2kdTDJntxvBLRuvOIxUfCCLQyy/bxtGWDJW/oWFJL
	8h3sGcplodiHB2HUQVi4h+ZoEmR5rJr2lYUuVN+H9OSvBgsVhMR616mqNA1GFrFmERNvCQRUoA4
	o9hxR0i1JvadOZ6c8m/4mriTa7ExXkVuM1SLcBtkiHrD6l48VPkRyxjWjyOa45
X-Google-Smtp-Source: AGHT+IGK8Ey29vlNo00zlc+GOkFyC2bjHLvIDXKhESpfZnJ6rq6388SEUQEklyoTNIyqpHblnkTV0Q==
X-Received: by 2002:a17:907:2d88:b0:b40:33ec:51de with SMTP id a640c23a62f3a-b6472b60651mr49198966b.8.1760630325841;
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:38 +0100
Subject: [PATCH v3 05/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-5-7b30797396e7@linaro.org>
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
X-CRM114-CacheID: sfid-20251016_085847_793924_F5C609C0 
X-CRM114-Status: GOOD (  23.50  )
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
regmap_config. It can not easily be made const at this stage, but a
follow-up patch allows us to make it const and the warning will go away
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
2.51.0.788.g6d19910ace-goog


