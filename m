Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B25D103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OmOSgH2/TrtS7qixNkttWcSY4QBZ3ekluiBJZ/v3k4=; b=Z2V0M2cjgze8ZeUInx2RJ2Xumh
	wXnQQnkH8ep0XHVep1cPK0I2q3C7QXdKOUplA7jYog/zU1b0jwQQ9kwIugbYmJA/asEw5f5QAlTOn
	5AJyi8hpLfkjMgii23TsD63s61J3M2X1RXZ7tLXfR0d5P8fNeoY0VwXBdcyL8fxYrN9CqY9JpVyO7
	y6c1Kn5IaX6TV9l0C15Vh2A4TbzTLqB03GHdxAEZuIjE/p5kxz+6DrWvVggGihHRh3bBmFsjj0UlO
	YTE3vJ0t1j6rARLDiVxgAdQ5QzaMo5xHXDbjkBAkVJx8V8Mt1OTANgnXwtCncq4ExKa/CKlCN1TT7
	tzMvCwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sod-00000008hfe-2ASa;
	Wed, 18 Mar 2026 15:28:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soW-00000008hYD-1M0T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b886fc047d5so150881666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847682; x=1774452482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OmOSgH2/TrtS7qixNkttWcSY4QBZ3ekluiBJZ/v3k4=;
        b=nSdeuHIoaFpjm5InlBMlFbsho/WcQMFmmpQn+STNjO5jrHkpwTD225s5M+q0vbSTAZ
         5cTTVQqfI96E4iGG32s7/72u9AzQuJzqjWjqiWYBAKSH56OpxzVmEqRY2+FH/lUeOKlM
         rMrDoJqrsXoQRz54BaS2vytuEj6S+NJweCCv2HonsFAv7vS77tI+MF3CeQmv1HPo3lfn
         AGb5olAyRvFAh4gTB38YgykySRTyBQpX4wwotJajyAxZkCmUfBMf0s+zjjgp5KZ95mWL
         a7ykm80iMEpuCLWSgpTrUAJtg946o+IA4sN4m8xCXo2JYomCQlrCLgFpTXjloDyVxtc5
         bhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847682; x=1774452482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OmOSgH2/TrtS7qixNkttWcSY4QBZ3ekluiBJZ/v3k4=;
        b=e9QttfC+QGsoqATLSYVkeynDUV7zODPnI35xE8i9m31rza0G7bqdYKRY5jOyDwA/nQ
         O72oEPBQPsIhn3KA0H9Ku50ZuBRtc+HK4wslXnTPVlrQSwwQaioBMr3iDmMM24KRp5+p
         rwg0FOFW8mOOK/wrVSLxfmzu/uMbtEtJQBA/J+g5hBowS0auM4SRLcVIm1e0wKapmyoO
         8+JKJSYT2Flw0ijqTfRbLtk4P1Nz4cnnm4P9Ws+7ICfIvnR7CST6zb1EN+oX69G1SXEv
         xrN77gJapinrrbJg1R95PZpcXjaBGJEvEQ8hRf+RKsafRQfyhmNdvEgf4ose2dlo2iYw
         +h+w==
X-Forwarded-Encrypted: i=1; AJvYcCWRbq9f9iRADuCYWzIBlknAGjYhIX4jdLn39VYtRVYn2FvnHcEgQEXob9aSKYgztIi9peR8NNxsm/ennE/1S5/S@lists.infradead.org
X-Gm-Message-State: AOJu0YzwHgSXD2E+salbogF3iJQLbJL0rfEQ157gtn2uIKzvrNt7rg7F
	Cyzx9MMH6MOTFDSDBe8nEbsWDMZDYgyl495ecpHL1rA8N2DcbkPbL/Yh2MGv2hOuHxo=
X-Gm-Gg: ATEYQzyc7y+FFFmN5415X8Frk47kLcqAIt4sV+y/h/LYUPzqIN+m6pVlTcJKjrPfU5J
	xHTmIYDz4OSBr/lsGF1tZTqxM4j8wmthCP2j0zDP4T+WnW/gQwBUlXTUOvC7MqFwgJoiKOQzHZZ
	0edv38FHdg23m8SMGCah/U1Pg0xvKwM0JcbH+7a6/ixVoRt7njrwPtJVZfP4e6IkjNgT8YTaHfU
	wN+Rw00Lxsg+nI5P06oxVuXD/BH4pM4HunNchrPIcTtVRsSVz7NY8beXfkpeZCnlb8t1joX+WWj
	MqqyAfu/IGBln/GloB9NidcfPV4viLwb5T9tOKs6c3aaIwKNDLsvqdjh9xP+os5zkTQyPsna5az
	WEsNue1NYkHZgHLfG/+KdZkuXwc+4znV6M6zNYYO9cNCny8PqF+PEb7jwe+0w1XTzNuw6T8C26W
	Kjj56QBVhYx2IeELmOrEM2b9yE08Zq/4+OhX52nqcK4LnN/X9vUai+OWnnMRrhPxp2z8XzdomMs
	qEpinj1HYOvUok=
X-Received: by 2002:a17:906:4fc6:b0:b97:c45a:840f with SMTP id a640c23a62f3a-b97f4a73bfdmr272840266b.32.1773847681503;
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:50 +0000
Subject: [PATCH v8 05/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-5-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
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
X-CRM114-CacheID: sfid-20260318_082804_412389_E54518E6 
X-CRM114-Status: GOOD (  26.47  )
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

v8:
- add missing \n in some of the new log messages

v4:
- rework the loop in exynos_pd_power() slightly, to not return 0 early
  to allow more code to be run after pd on/off register write without
  changing the loop again, required for gs101.
- add error message in case first regmap write in exynos_pd_power() fails
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 83 +++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5c3aa8983087..68b1e7ba8729 100644
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
+		return dev_err_probe(dev, -ENXIO, "missing IO resources\n");
+
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM,
+				     "failed to ioremap PMU regs\n");
+
+	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
+	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+	if (IS_ERR(pd->regmap))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "failed to init regmap\n");
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
@@ -137,7 +174,11 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "samsung,exynos4210-pd"))
 		exynos_pd_power_off(&pd->pd);
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
+	ret = regmap_read(pd->regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read status\n");
+
+	on = val & pd->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.53.0.851.ga537e3e6e9-goog


