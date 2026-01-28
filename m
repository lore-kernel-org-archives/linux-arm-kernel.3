Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4847D3F095
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrnmD1pfTiX6z7osCVBlK0GrbNSN19fk3oj2Jxgvus8=; b=G2eCSd2lcGOlzU53E4OmLX/DaP
	pRWi8wNkbMvv80+kt8ebV7AUScU0G+29hXFC5m9Iw9NrSfZFaFu9zWBj5cxzLSzeAjQBuKD8Xdbom
	pMPOku2t4zhrvd+w9QChR9rglHr/S8J8qBrWgC61zbxipJxfLdH5GzQ/2A+qt9hnl1jDNEassh4F4
	H05Z8mM5l0c8vf4mw0ssnihFpHm/HBkCp3smW5jlswo3d9babqWz20FEvrvRvXqM1OqherBqGKce7
	FiaHwcTVWk+Q5CLDMf7A5yXi5ro2+UG71reD5bfT5sOZFkytNLvx3Uy6DoG0JCcAh1uujeHigzuUI
	dn2G7SBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88P-0000000GLz5-1kBp;
	Wed, 28 Jan 2026 16:11:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88D-0000000GLtg-3lv2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 16:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hrnmD1pfTiX6z7osCVBlK0GrbNSN19fk3oj2Jxgvus8=; b=RtuSgYQqoGhv6M0Q1LsqgGkPtY
	KOs0MGQ3pWa/l95RVwcl0sEbMPp6kyC2OoaZW5v+NGF9zkMpzmhUH1QG5KoGFO36l+JmAvO0FB+jE
	O7cCRQ70qWtBa46X0GOykdK3Ckf/EoRjI9hSn1O5ailIQrm/sJQp/cm8bXOsr7LsvokJr8FPqzvVc
	TzZZPTFouMmEDALpxrjFEhxvQIIvR/TNFlyAwra3Fq5+J8y4uXIwQXJJVo9F8zW9XL9JVDC9rt5U9
	H2uXxphj+97weTPXwjqnvOF3K9vnr3SkMopK72anwwtMU2jPPjG8LRTSi3TeRqAyLdGbz0C2NdTZd
	xvrmKtuQ==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88A-00000008uTS-25CH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:11:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b8845cb5862so1099961466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616656; x=1770221456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrnmD1pfTiX6z7osCVBlK0GrbNSN19fk3oj2Jxgvus8=;
        b=NT/eMng5+S6iFrcwXY78a46TGMR98rac7pmHEl8TraoJ0fJ67xMpIiwW3WsYDxgzbm
         RA83SVg6rB4rxHhPhc3s9B+VvIEWjXURsZEwZi3La8tkZTX2j6h/kY2+YGD9ze/hAwTp
         DPLmFU0QNFsonoVgcAz3QmUwfOvnjdXQmFMsg3TLqwgTxGtRH9LDshpo4Ls2Kc5MIleh
         TJSExZX5tzjqfl1xU4VjLDETN5urkz3BR7JwDLWT4xD9qdCaaLxWezlSpNmxWIFcxjSn
         gbtfxxIvTY2yiO0xMCsUaB8zRzNQxSC2DtQBZRszQfPQeXIYT8ucSXpJtPCxaYDpXLLd
         bNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616656; x=1770221456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hrnmD1pfTiX6z7osCVBlK0GrbNSN19fk3oj2Jxgvus8=;
        b=YnPu5mxm2l5YjLDl2JXsCOypNTa5uYwFIQxiCEIOcK9q4FyWrXnDJcfPcGjcYxhl/J
         im0/BLFqxC7UEaL0qEnnFIF9d+MlfPv4s32X7J/lUJXzUTjbO5hRIgBIs8/nV9Qvo4x9
         7lDJuI45JzQfvAEiQE2Vf8WK73kM4aOkaQV/d1nXpanuRttxLrFbmgQ6u7TT56S9YJKG
         BnuXQ1EUX4JpJQqjQ3605iFZdSOkHxRrRMa99myOp37zfHK+oJOmNPdzyHXDyhzuPl+s
         JuWG+fbW94bSmDgJ5SPUk3FecdixZtz4xDlezZHyge4Msd/jyea329AZ0LJUlcPDqA9j
         dtcA==
X-Forwarded-Encrypted: i=1; AJvYcCUVpSsv0f+xw8tp45gBT7T/78IWSF59pOov6hepoOMQSDGktLhI1ejaEAy2VnV7gjZFydB9c5xWoI1V6Nz9ZpEa@lists.infradead.org
X-Gm-Message-State: AOJu0YxCz+dlimEhTj/DUb1yX9KILoE5lV1CWTe3eLvcCn13IqbQy+1i
	Ygvc943qYETAUXljv6WYGqKT3Jcn++0jYOv/iyXnc3jjKWuy56rekN5u4DPMsniUEN0=
X-Gm-Gg: AZuq6aKJQx9AAKo8K/w/b1NzxaGDQCK3IOzfukG8UnL1bPBc0JMGvcQoMOdBSNpCZgt
	o9e+X18LeXCaNYpMImmg9gC9b731OebNFDaId+HlM6C3Bl0xhOusC4M1yLvERVqmYeB6OG0vT6t
	dpo+ZzlGkW/PHkUrkcATdbdY5TsGadDjyRXywLViHSJdO0DOG0U/sH5DOlueFhmukB0LxMylNh2
	y67+2nJndJNJQlfejBuMdWaJCWMhkVWuoyTcvWTle8rkqn2Uy/ruU6+PjjuZaxdAINWPWhddOBI
	CCBW9/rH36NZJ95kLnwmpH4x6WnKh3Vw6VRdEDYNlAqSrKTjYB4Ixht/u61O95hQ/dBEUTY+IYu
	JPfCIyo9uSZp2eYDc7DGP39sInJZXxlC6Bv/cw1v4QT40+f5StujEDwVpjVePkDg22yP+Qw1xhE
	52cjpDMqM8SeBiWrjWaO/k/GeUJWFZFh8VzTFfVTsWpQFwSquYezct1pqaWz5mwRjQMil28ZLvt
	355IQ==
X-Received: by 2002:a17:907:7207:b0:b72:a899:169f with SMTP id a640c23a62f3a-b8dab10cba8mr453205966b.4.1769616655855;
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:54 +0000
Subject: [PATCH v4 05/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-5-cbe7bd5a4060@linaro.org>
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
X-CRM114-CacheID: sfid-20260128_161058_755862_78C36B57 
X-CRM114-Status: GOOD (  25.18  )
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
2.52.0.457.g6b5491de43-goog


