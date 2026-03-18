Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAB9103E19E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLahL8mmAQrPbIGTcTRAY4s4CIuPNd3v6Qz0S44aYi4=; b=bqfaTRmPMWtoBWT5InWlC8jmEn
	sCggPh09scy83kKBE8PkNj8jB4XP2aX6yS+guSpqkyuSyf+umXNhZm16dgK8zArF5Vy1IfdqHiNa2
	J/IFM1xjoAXsJW8J4viBIObQ2/AMxBLDuEfcmz1ksHqrWJbAv5mAMEKVI65JtJJRCnzBtJ22QACFx
	Bw7dsysohj1wdNY8SY95g0A9UTo+JEu79y7JkjEpSKKB2dcoBt0pd0+oygEz93QggDh+CYldkBEtG
	8P81J8Eh+55EtubmmTUoi7H/IjrqdHqgU0vSdjSEdIeslzKmDlBhCo7g6uM9Oom+87fkTbX0ryGu3
	R9DeMXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sod-00000008hg7-3YmN;
	Wed, 18 Mar 2026 15:28:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soX-00000008haO-3Bay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b9773abf811so827276366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847684; x=1774452484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLahL8mmAQrPbIGTcTRAY4s4CIuPNd3v6Qz0S44aYi4=;
        b=bHP13PhjS9GL1iKdPDbWS7etgRb9220IbzGYSLXfvUgIOtdkQM9a+9XQtgcvnhDeAW
         ghziZaBAtEcBY9lOa3tlo66vZN2uJa2yFrjXM+tAkQf52JPJaAq4affvzZDOOwciuRZ7
         JYEISVeiQy+6vn87c53Eh9m5SRbw66D3PQozOoeSrhIYalSv+mtR6I6PV22a1e6SzIQs
         lI0N+fxAbQvf1XXN9VNihVNAs0LxpRoZyeyVpxRtdjxemuQjnPfKouBZ/U/3vx1KxKg6
         NvTyn1z1nXzMA95ZyC3vzy4tDPM0rqPB0LeHIaqcJy0PNXwB2sKXqDcbiElHjlM5O5gv
         0orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847684; x=1774452484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLahL8mmAQrPbIGTcTRAY4s4CIuPNd3v6Qz0S44aYi4=;
        b=hbCYJ9IyLXP/tkJtmnxeVwsQ+Mw+/tn4qfE6HqJv4nAVeQ4vu23khH4F/ivtNJiw7E
         hCSsEoofGRgQcKwyGK1vK2n8JcXZxCymchSimUKbiZTIesdydebKRo67+0WO/WsFNcr8
         huIf9tAK0FvFJr+NWf4Ozo+WKYbRis74DVtv/ugUzmu7NCLbAKW6IiUoCf/F0wTUCrTf
         F5OplbCl6+R2yLoxgCy8o36GBGFhWdvFISbqARcw3pBlF2WlmcWlvAwjqm6nog1CDegY
         1TuD7KMnV1h4w1uj4qSCkiptz6J46mWNGfJzNXtm+iUXe0hnwm5dTFOXwZ+/vYpackKc
         QDzw==
X-Forwarded-Encrypted: i=1; AJvYcCUWwjLQgXRHApug02JuFikvFzs5+WvuXE+mhRBTxfAXzUsbywZVvkKf1lvErsv0Yy/5m1wjX+5pvTiGWLrfOQKs@lists.infradead.org
X-Gm-Message-State: AOJu0YyOSqvpAiUS9pyoAbTq1ED8JCsEneRkCVZZvcEhgR6Jr1JKolyA
	C64CdU0W82/dGmGZkkycrKAZT4QfrRXjKOM+63K47xVugz4bHaToTNp7GVT8mXJNqW8=
X-Gm-Gg: ATEYQzyjizIDiQw6/5846/zdMy4jajU03+FkEBGBpj95eripYbB/7FvsJ/sIjSgjil5
	G0YngbAjcVgi6+5o5bEXoNfQdHzhTmQwdt6EwXv9yi6KO7CwGoyx4Zczc6qdma0+f7BwD+UcTIU
	FstH4Rn4k5SKaGOedsegaciHUKeXOs1JWYP81yXIfcSi+7vnWOSdEMXqGHXo7YWBAjpLZ4XzSmx
	RI5xzov8V4VZnYGtGLjXZmD+Q2rgv9rTT2JBNUsXGKbIoQrS/2qtBbr/yERAtQEY5VXJb9GKsgN
	vYS5N0eftrO9OC2Rb4oSlUuXZrtPoqPCOgJwhSVcXOV+oKcxdh7KX9jzCg5AvmLxSbpxGP1RYJ0
	sxDZBo9XZaHOdPg8zPoBW9NsLZVFQsoF9zHEkTVi9i2mA9NbPx2Z4TI3hdNIGwcrAzM0hYIoHQB
	1gAYNCoohGd9UeMjHby6XF7OdDckqnK+jK6OhUX1aJ+FwMx4rACp64A9UjPjZIx98seHsevDwet
	zph3bw1Qx6ZJXc=
X-Received: by 2002:a17:906:7f13:b0:b97:f12a:3f8c with SMTP id a640c23a62f3a-b97f493e995mr155819266b.20.1773847682553;
        Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:52 +0000
Subject: [PATCH v8 07/10] pmdomain: samsung: add support for
 google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-7-241523460b10@linaro.org>
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
X-CRM114-CacheID: sfid-20260318_082806_011200_925B23CA 
X-CRM114-Status: GOOD (  24.25  )
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
v8:
- Update offset calculation into parent regmap. DT's ranges property
  now properly denotes PD address space to be an offset into parent
  node. Change code to account for that and subtract parent start
  address to get the offset back.

v4:
- add 'use_parent_regmap' flag instead of going by 'syscon' compatible
  in parent, as it's not a given that the parent provides a syscon-
  compatible regmap (it actually doesn't anymore after recent changes
  on gs101)

I've still kept Marek's Tested-by from v3, as legacy Exynos code
doesn't change.

We need the offset as we use the parent's regmap.
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 74 ++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 3aba00b9ddef..f8c0d11e9b33 100644
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
@@ -143,25 +145,57 @@ static int exynos_pd_probe(struct platform_device *pdev)
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
 		return dev_err_probe(dev, -ENXIO, "missing IO resources\n");
 
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return dev_err_probe(dev, -ENOMEM,
-				     "failed to ioremap PMU regs\n");
-
-	reg_config.max_register = resource_size(res) - reg_config.reg_stride;
-	pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
-	if (IS_ERR(pd->regmap))
-		return dev_err_probe(dev, PTR_ERR(base),
-				     "failed to init regmap\n");
+	if (pm_domain_cfg->use_parent_regmap) {
+		const struct resource *pres;
+
+		pres = platform_get_resource(to_platform_device(dev->parent),
+					     IORESOURCE_MEM, 0);
+		if (!pres)
+			return dev_err_probe(dev, -ENXIO,
+					     "missing parent IO resources\n");
+
+		pd->regmap = syscon_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(pd->regmap),
+					     "failed to acquire PMU regmap\n");
+
+		pd->configuration_reg = res->start - pres->start;
+		pd->status_reg = res->start - pres->start;
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
+					     "failed to ioremap PMU regs\n");
+
+		pd->regmap = devm_regmap_init_mmio(dev, base, &reg_config);
+		if (IS_ERR(pd->regmap))
+			return dev_err_probe(dev, PTR_ERR(base),
+					     "failed to init regmap\n");
+	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.53.0.851.ga537e3e6e9-goog


