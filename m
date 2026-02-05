Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6073FECD9B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCXzqfHYm7jOM4K764nK1wT55TlXGLUYpjCnio4Cc9c=; b=G3CBNh0BinNh/I5bcwrRMRsn1T
	VVkCzoyr0RgVRUl3Zvxz0WFYaZ9i923mvWkadnqPdop0Fqjjem7y00ga3Ix+OfpGWjraHVfFKBs+D
	zjg+dzNmersbiL1226qK5IuHUeKnd28IBSvI3Xj1jpLky4KN2bj6fAR7f015lyrTrdQ4O3oqDAXiy
	hAUkwTZYzxgjK2rObavAe4v28tTSBEEtSPIJPd0VR/gXmP3UDSQYq8iTSQARVfr2Ks1UqHnP//f99
	xq9XO7PBRnDi4nYlIIruTJCQeOYUFbXfpOm5Z+/pcmh1fG+5qZ52jURWiI2lligZ/ghnnC0EZdKBZ
	7MLJrv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77Z-0000000AWvE-3Fwz;
	Thu, 05 Feb 2026 21:42:41 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77V-0000000AWr2-0BjS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:38 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso3720566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327755; x=1770932555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCXzqfHYm7jOM4K764nK1wT55TlXGLUYpjCnio4Cc9c=;
        b=yDYoeB3CetIgCsn85U2+AxbifkF5GB0n7BiF9oUxaZJTQKkzOn/GnU28dOEgY0SqBt
         FW5GyZo9d7dMLkhjWeppzmvtSCfgwgdYgmlyDIsh6P6otSJKWZlLhks4cxh9mOuux7le
         HzOW8bVAGO7LLz5ecUqUdtI4ymA7rH7Bl28p1jYeFXD7qi7Ij/naPhvfxm9IADzRH7/9
         hy7Dx87LbOngcAIzvOzGpnzvRQ2i+ZHew95lKkFDHsZlN23/QZzuBuwC35mbLu+nqrdH
         9gJuFfgs2rhVL4Rztnu4pxComn89zXqUNtXjBQNiUss92/sQlSzxUKDYjnxqM2YtA0z3
         8H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327755; x=1770932555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCXzqfHYm7jOM4K764nK1wT55TlXGLUYpjCnio4Cc9c=;
        b=izlQ3PTYAik6x8t8GS0oF/kfDorRHPXCLxpG4dFOvtAY/rCzqgMAOWl06IwdCi2ki9
         UqokC2TTYnJ1hNJDXWy30k0GtdlPyrceh9oRjwWJENk5BK8wNbMzKyVUJeDFqqpRv4r8
         zbcZdmzIvmS8Qm2jCJM85cRo7C7hD9d3HdBT4gv+1Yg1agzmQmeJ75e2q3kt3TSu+9ci
         jM2gik430MQN92AIx95w4kZwEd3QUPDE7exbQdItysf1xNtsa4O9ioDwxZFXs+l8+pj4
         bFV9/VdW2LE1XYoKWbfIlJ7mYDkRepd4NPilUpRkvnU/DQSBjD/fzwGAW7D1gxLt4/j7
         3+5A==
X-Forwarded-Encrypted: i=1; AJvYcCUq6PzOxeDa8qhve8QAzOgKK3wJXZMLsRkyvOlCPFxzlh5K3txIFJK4c/qDa9EHjjFGYK0FKFQ8JnuF/fkaoHSM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ESQnt46XAb05fNurHIsBMWyraC5J4kOdWqyb1+zw9QMt7c0a
	+WZCYpbLqoIOmmoKlWoMTdA/JQsfc5O2tt/6HZ+d5nO2BQzBzcalA/U+64CHsi7PKgc=
X-Gm-Gg: AZuq6aKnYyt56gKKuzNGOXMg2nJW+zeQBh6nW0JGDzK6p2gECVLX0R1xqzeNplaQ7+t
	ohd+B14ceMSjmeVZhLmTt1yIOvvp1y0k79jwGYQ3xiUQlQzKSR5OS3HEuRAIVAbvbAo6A3QDr7V
	JH8TXVwi4GpGjFehTGKjR6F2eGLraVn/CP8zh/jnQINnC0Ja8IKRPKTaESsOPUtuK2eXLX9TLKD
	zzj8cskIX+M7RzQG1ENhCPde9QWqXy0uiXZarGyUs5XAvqCuTKdVaNf4rfQgkv3tWbzx+DnDo4e
	fWfLRjKNMjGaM7vMEgNs8qvUqCIEFCAoZU/QX9ZNg80KZQyztcEDsOewg2JqbJjN4up4iDtAZKg
	yZj59cotBqCbyO2A0yY2USaWfItyl6DH8ZF/eQnSNwIJDB9YaYa4TwPGkI0M68uQhdQ++7zqNpL
	aIvbhPzMTy+XKTO59PjHEu7IuFmgBWkvjmz5tOQGxXAVA+gtshBwNteV5xACKKDx2bkFbpUM7k5
	OYmwg==
X-Received: by 2002:a17:907:9717:b0:b87:65c5:602f with SMTP id a640c23a62f3a-b8edf2f9bf5mr26839566b.34.1770327754876;
        Thu, 05 Feb 2026 13:42:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:33 +0000
Subject: [PATCH v5 05/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-5-ede49cdb57a6@linaro.org>
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
X-CRM114-CacheID: sfid-20260205_134237_124881_F5A068A6 
X-CRM114-Status: GOOD (  25.35  )
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

In preparation for supporting such SoCs convert the existing mmio
accesses to using a regmap wrapper.

With this change in place, a follow-up patch can update the driver to
optionally acquire the PMU-created regmap without having to change the
rest of the code.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
There is one checkpatch warning, relating to the non-const
regmap_config. It can not easily be made const at this stage, but a
follow-up patch allows us to make it const and the warning will go away
anyway.

v4:
- rework the loop in exynos_pd_power() slightly, to not return 0 early
  to allow more code to be run after pd on/off register write without
  changing the loop again, required for gs101.
- add error message in case first regmap write in exynos_pd_power() fails
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 83 +++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5c3aa898308793d424fb761c58ca01ba2580aeb5..3bcba7d38ac1572ef4bc2f4052c904dd6c4a7bfd 100644
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
@@ -36,31 +35,42 @@ struct exynos_pm_domain {
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
+	if (err) {
+		pr_err("Regmap write for power domain %s %sable failed: %d\n",
+		       domain->name, power_on ? "en" : "dis", err);
+		return err;
+	}
 
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
+		break;
 	}
 
-	return 0;
+	if (!timeout && !err)
+		/* Only return timeout if no other error also occurred. */
+		err = -ETIMEDOUT;
+	if (err)
+		pr_err("Power domain %s %sable failed: %d\n", domain->name,
+		       power_on ? "en" : "dis", err);
+
+	return err;
 }
 
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
@@ -109,8 +119,18 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
@@ -120,9 +140,26 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
@@ -137,7 +174,11 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	ret = regmap_read(pd->regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read status");
+
+	on = val & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.53.0.rc2.204.g2597b5adb4-goog


