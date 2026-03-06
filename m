Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A993F01828
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=; b=eTQhdE6Y/mhr5O2Tiykz9YVJBm
	NMlOwcPXJeCiPmflLWmQBquJeEJakBly2cUQ6/dmWmuQGz1quxa+imJ4ykeqoAbXLolPcufSXEGYR
	iubWkK0k8sS0PSADoLzS88Zo8Es626p4RDuC8HFCASQ7D2Mb6+LQSI3fF77vEA4tMPwfFAzS4TQNz
	5Km1+NwmoehnVpDwZms55E5bUUW1eu1gG4kEUS5ff6dNa+nArvzjVlt+oD7/Xz5yje2gZTI7XMQU1
	jdehmKvHcGCLpVDVERGeEKpYfgxJTcWpyrAKMG1RQbvuhAEu5llpxA3BW3vA+cEJPcgh+Mn1l/akw
	S0SU3Syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRY-00000003Sc1-3be2;
	Fri, 06 Mar 2026 10:30:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRT-00000003SVi-2CbH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:30:00 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-660a293515fso7717267a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792998; x=1773397798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=;
        b=BBUlwcrUyukgVfJidSHMBpN3D1zO44eMSclzRN7bH1xgz8A3kTLVHnxCMahTODO3Ta
         iqutT4/OTUTaeUwjtyGlxcf5GEsVta/hjtXJEnOApy+H9RMJ0LkkqJwiav7ZAxK/ha2J
         jvdB9VJo4q3Ert2jZOXpiMCJ5SOUqTMkfKV9xNS54KAImkNUoooaJZXF4szf3LIH5Qqs
         yJ09aye1mDCwAf2iRaC4Hy1QmRHVqiqWkjYUNXppZTd8WYL/l6Po93nMjOR8uYuM92C1
         vxCmhLU8BuNehjXB7DM9l7XsCgXyQ7Mg7lA9kCDvJsvPKphVtiPlcW/EWpheAXjjpeTz
         Gkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792998; x=1773397798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJ65cMxmtD9hm2QF0vSs9PHPLSm4kdpoTVF35SUjEBw=;
        b=U5sX4K/HvO9GIbC5u4LB+4uWX657zPIxmaogozdfU9vhF4F5uSEdlVAl0i98gCyz5n
         AGi1MMlPQEmrE7GuzeaV4+cXuECJqO5ZvDYP+ayo1IEMlUS8bxHdhpZegY9rHJQxsv67
         16bB99K362g9M3CD2qiFsxZ5BG+xMikg/C8NZLeq2Yz9zIRIQZHW67C/CDP6ssL/OexZ
         Irk/j30ZXtaed5I0qHhfcQQljFtoygtb64Laz2m0HhcUx0pOEnB4pG36HT+r8KLsPNwV
         Go+APILprRneKgvDBtqErnGZGiXXwiKxk1jwP8LmqMz5Y55rCLMiq3FJ+CzavYA9AR3Q
         ca0A==
X-Forwarded-Encrypted: i=1; AJvYcCXd88RRI/mmu8EAR6w6K6EgOq6KRYujObQOUSILL/QIbVA3dltc01V2TlbadL8C+9636eA3LRWlaOe91DaqXdRD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Qw8x1svnab5p4a4UUhF2xCTSNBirDplov55wQiTb3Xnwu4ns
	5OTkx144TMxvgiTrkTU4TCkxXogo0y3I9DQia90R1IC2fas1Gh1uXww8h8qKcKXjl9I=
X-Gm-Gg: ATEYQzxkFUovYtNYYBtOlUjPCtnRgBAwK4mW1bJdpz0B3yAgf9AOA+gdUI8uqp22KA2
	7ilh90OXAksCfZEtFo2dWngPY18UEcIVDxKhnOGPSYDuHAKnq4/UGCdax1v9z0DamIXjS4HgJwp
	eFZ827E9dCWETbIP/H1bPEvtRAdVs7bGwH7pMKWMN5c/DIKUkQIPoHhJiYDCqlsH0rLCeEEa4xB
	RDYjN7ZXVPcwEPSLD18DsS5XLosP4yGCw0PF2BAvOEn7LVXYz9BZHOMaTkVL6JB/nfkyOo32K7E
	b53c05L9BlzP+CTLN9X46uzpx3OhZzLx9Oigvkn0Cf8VCRRIiIcvyJrARpaFJ0CKNhjLNdFDtah
	mDCodWONX+CO+A04alvrU59ghGjVaKUOLF2TWau9dVy83gts+85JT5a5pPMD8MRhXlCXqHbRItx
	X7agPITiKmTnfaUAr/g3vwoSjVnylaWyHk2z28QbzT3Yub88ENtrwG75zHUdWFZ8EzYjqd2h9pn
	yU5V2CC+nFPknA0GKyCwxGsQQ==
X-Received: by 2002:a17:907:6ea6:b0:b86:fca7:3dc2 with SMTP id a640c23a62f3a-b942da71fb2mr86532966b.10.1772792997560;
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:56 +0000
Subject: [PATCH v7 05/10] pmdomain: samsung: convert to using regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-5-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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
X-CRM114-CacheID: sfid-20260306_022959_622944_F6D8DF1A 
X-CRM114-Status: GOOD (  24.89  )
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
index 5c3aa8983087..3bcba7d38ac1 100644
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
2.53.0.473.g4a7958ca14-goog


