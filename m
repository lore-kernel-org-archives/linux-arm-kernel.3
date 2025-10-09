Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6FCCD190
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uQKQdQ1MYiF5juA60OL7pKbQX2emtwofvg1/NDrBMs=; b=iVYJ7PcB/IrIs9cJc35euSpVHs
	COVWFXFeQ4qfZyN9N9piwWpK6lmXoDj0C7+yja6k5hmylq0v1EUJcNamnA/dyJrZZ7J+I0xDg+W00
	Jj+CpRrZLBSgvAJWOyZT3fLf2oxnzBH4NB+9zl1vJtarcUJUtdYckEQfbsBDuq4/TmKeAe/k76jmB
	1dw1Gdb3K0kuNwvuzgwSAkoTLSQb32r4jahA2K6uiyOGP3SU3z72MxSQFV+bd6oS+14fsynv7ENSt
	sexKS1K1ZNyUQ5rfOC0uhhSTnH6YJ4a8ul/L6tMVfMsu5D+A8D+y+5B584UTRAl2AtENr2QnWXxTq
	3pnicT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW2-00000006TzA-0Rrm;
	Thu, 09 Oct 2025 15:25:14 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVx-00000006Tsb-3dIb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:11 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso194998166b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023508; x=1760628308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uQKQdQ1MYiF5juA60OL7pKbQX2emtwofvg1/NDrBMs=;
        b=AJySZLs1q7ngIV7xgIXdP38ZnWCkgunDxRsSnHtfdVfbF/HHj0y1AfG5/ZJBSPFAI1
         7dF9+mBc5nTZUUmbXHl63M/b35OB1MpTKGsrw2Ip3UvBd7i3shL/scNGUSKWwibS6O9G
         +uL/n3TCMncTBnOdC+yDFo1LZ8lYraBQ6K2DZM8CcE1bZHYE3UapxHdDERekO+vh/U23
         fwB5OpfMIf2JG0tvg75EtG7Xet05+4YmCwRAYMNSy523rbebARFbOuM+Yej7sP25LGG9
         E/b7j5+/pAiQAP33/YmuZ4nWCLYlUBcEnfhX8VRyppAFi2758j3d4m5E3EHgZ7WlH2iS
         jK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023508; x=1760628308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uQKQdQ1MYiF5juA60OL7pKbQX2emtwofvg1/NDrBMs=;
        b=dPyA/aX9zTk7fU3coxnMUxYmDIakFbLmWkWSx+ijR8Msc2+ca2BEq8btWgA65TPSqk
         xMGUIkn4d5PQ/YhoKh3Y/t60NTkSkpWmwLiR870qiWxiYaQkW7tLkGLULFiwbLcjExwm
         6PgmkdSJiOy9I9wWAxwn1zEPbwBun1iZaESK8VPqzy2tP/DoVvrH55KlJuSD2+2pIAXj
         Cu47AYyYflN8ezDSt3Wf6wRZwK0oxdAab1lqbVm7T4CwkJcASraErInsLdBwPyw+gjkj
         itK66sD1RD22i1dwpVDK1jqfsV0mfZlfuBTRIMl3I+TxgDYE+LXIftAovWdVCQEqJlAW
         bQqw==
X-Forwarded-Encrypted: i=1; AJvYcCUp7w8Q3GJXW1yu9tlkrCsk7yNCWrQOVtqpmZSKUtz7bh3Gid5f1v7WOXoTXks4EZevrk0V4xPq37LUkIX6IodQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwuutgyfWnAkynpYBuqxrjd9dRbBXsBFzFZNcyQO3yBQO6exSrm
	S+2ISNnnxuiqBvfjWX91VzE6kM1eOzWHh165Sq210Cjh9ZFv05v8+lHTcgoLFemtDvo=
X-Gm-Gg: ASbGncvQjcMx0SuoPT8Lq9UEn/VwBZi/Ylj9hQ6POXpqpTMZTrNHRVoPyghU3UAjqeu
	qjM89StFp9an6bjzAgKGOGgY3Y1Nfy9BkpABzwSsSl+t+fo6I6UTAP3WYn2bgt4JwSq6amPnVfc
	XPL99EQJxKQCsnR5PQ46dGTpOh5YTi9hQrWYXiq7rRyVYeGcWlfVql+DVu8UiL4NyCfZhNlQlTF
	2pCfllQbYEAncd9+pXUKM+S7PUEf4Awc6vB/ZZiVS9rvMgeLA3gshKCQJIvzKUqzBgg4nd5QWLF
	bC6BUeuiYLaq9HSiN0nuAMXRs0oLVe/dkqPRcuzU7o4UHW1dNRg+99h/0FTFCKpevPvuw8CvxxV
	0xqiT0uSP6d8mng2aBMGq0z2x+KJERX0zKeafwfXjCjF1vc765LvMGtKT5POBMJ31ABEoJw0meS
	kxG4vsPneISHphg/+otXPlPylXW9dOEKGPIjHevjDC
X-Google-Smtp-Source: AGHT+IGnZBRhQiVL3K77bERhMVDqgbMpxbRqX6c+qjhP8qmTDZBZaNH/mZYsCBi4KHpMR5tC0seqCQ==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr911916266b.57.1760023507942;
        Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:07 +0100
Subject: [PATCH v2 05/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-5-3f4a6db2af39@linaro.org>
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
X-CRM114-CacheID: sfid-20251009_082509_976575_797141F5 
X-CRM114-Status: GOOD (  24.15  )
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
2.51.0.710.ga91ca5db03-goog


