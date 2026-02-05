Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C24DECD9B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtN6jc9h6sN3C2/z3TIutmLFJBrc9UMMYm4XTm15s9g=; b=Mz8/lr2rh2dcCQ8h5MBZWJXn/L
	o975Ped6Ycrs/SWpvadj1JgnmSUrGqMMOr4xsWpehAgE4jU2HQn6A5c3Tvnwy8GtXQDUd9Sx71L8U
	6//v1gRIoMnMup+eP5KfxQuVuDy0GHN5XQnsGK9CvoU6ZZ6TRKjvwp6Ufp9X8xraleAqIaO/OVXmf
	60mkqrWW7Czug8HV0U7CoEs6qzE5rRcYT6WwFz8NDmK9LWAK4AiPoozR0TLI3pIKJgpRv/d/vQxtJ
	bSxDaOdRerFe9vXFT2ZBT+IdJJjsCJK2950h7Qq9/vbBVL+LGfdU1Dl7z//T10b5IXYWVKePNp/PW
	EyLGdGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77k-0000000AX4A-0dMa;
	Thu, 05 Feb 2026 21:42:52 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77Y-0000000AWtL-2js1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso2421398a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327759; x=1770932559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtN6jc9h6sN3C2/z3TIutmLFJBrc9UMMYm4XTm15s9g=;
        b=QgylN3UWJbQvko5YJiVPUCPJdlXE9X6sTcfkCMrF/RhLWxLka4dJR4dNaLAMPSLEsv
         eNTupJaNKPToWLe9117Iwq8T9DUWUTAGRfNbk9C2NmxsGEvqi4ZPk0/cVJ34x9nMqKCM
         ES/YMgMMyQIZZTax/QRDrnMYN8DAYwvBUlJH7h3tDaN/RH4knqDip93WRos9Eq+rg0kA
         6IGUd8L2pD2y3xE/d9Vtah4SeTG5c4aAa7aDz8+nYbfp4MszTvTDSXnXyB4jP0W7a4C1
         6c1cBW3UWdIBjaWqyi7y6dQn+jHnQPkKM4S+/E5mY9MRZ8M+1LOPKsseCh9yWCoQEjpk
         8Oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327759; x=1770932559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gtN6jc9h6sN3C2/z3TIutmLFJBrc9UMMYm4XTm15s9g=;
        b=bKwo7xzxpi78d4XIVPSyLH1H5PLDWANIeE1vwJ8hnFX0aUCRxMoHeLfAbHlzsrLnS5
         Juk53C34tui8YByxQj1Spk1xRcmo9lzDyHccKmIrIq3W/nb+oDEjZg29xs4m3BZ6VmFi
         pX7QB8YHIPYYQtuhsYnR7FrBSDqhagqdlcR1m4KMQPxCd0DNhWFa6NntRR4ED69TmyBF
         APfroBMbkW8ev9cxzpatYbEmNkcSPD9shohTSh91Lx8Xakrr4+9cjSnmuWB/Ww7+Dkev
         R1h3uN6dvH09mCZN4h0sVrwWHRtRJE+3LYbCMFaJ/JReFxxs8JlRcLGtj78qHHcCsQBF
         cbzg==
X-Forwarded-Encrypted: i=1; AJvYcCUDr2YCEYTwhvabH/GPsdyg7Ma6RB4YW6nYjDzG2vR8FekcfmRnnok2Co6suGkgfFj3uxoPb4TqvH95fs7W/p2F@lists.infradead.org
X-Gm-Message-State: AOJu0Yzni+vfirTYBCRSjDXAaj16NVSwoSRg7f3gbiEY0ERA5lb7cT0d
	thI8sJxXkm0sAnCFOq6YBIZly8mykTZxalFPRRpXcBBdYogaMkyOdvh61ncaOAsUybg=
X-Gm-Gg: AZuq6aKaLv31wiU/gjPBCmgEOkrdH2+fjfFlaAVY2k+nyI5IA6r+/E0BJf1i1Hjd4JX
	ATCnruyfrPUdaQIhiYo/069+vq1GuKe9UPEVUCy2VSws+VB4qXc6iniwCtNuV/YLY/j21H+Aw64
	g93DFaG+CpWUHzibTQ5aft+SAv2eWC8/AlJ++kPW3m5xOsuFMef6UkinkPbx0qDg+m/ZxwaBqQX
	F34oEkYs92MOoDYMAPWnPMguI3GQjDY5wy+Z+tzqiSu+g8ZLcySmSeaJyrga2N339GncMOjVK1n
	/mWVhppltnXTzdzJDsrf0AH7y4G7a7IiIJiM/Yph/8t6ucx2JmVDNyU5nfTbD20mrIssdOl4Kf8
	tg8ivTUxaJe2cFboi5NG4ScolXQ3U3gjuglfGu9tOZ1trIlA5EiHpX6tJB9MY+lYtPvJWJN7eu7
	I3Tu81Tdb4xLx+ZsB3uQeCRaodzat5+WhaDUsVgL6k/5DiTAnrEngAGd52EMx/6ReHi1vuqXe2J
	VPCxg==
X-Received: by 2002:a17:906:f594:b0:b88:4b1f:5aff with SMTP id a640c23a62f3a-b8edf34e9d1mr24378566b.44.1770327758570;
        Thu, 05 Feb 2026 13:42:38 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:37 +0000
Subject: [PATCH v5 09/10] pmdomain: samsung: implement SMC to save /
 restore TZ config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-9-ede49cdb57a6@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134240_729047_482059E5 
X-CRM114-Status: GOOD (  27.75  )
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

Newer Exynos platforms have a Distributed Trust Zone Protection Control
(DTZPC) linked to each power domain. It controls the access permissions
to various registers from secure and non-secure world. An SMC call is
required to instruct the firmware that the power domain is about to be
turned off and again once it was turned on. This allows the firmware to
save and restore the DTZPC configuration. Without, register access to
various registers becomes impossible from Linux (causing SError), as
the PoR configuration doesn't allow access.

Neither the requirement for the SMC call, nor its arguments appear to
be specific to gs101, as at least Exynos E850 also uses the same as can
be seen in [1], hence prefix the new macros simply with EXYNOS_.

At least on gs101, this SMC call isn't implemented for all power
domains (e.g. it's missing for HSI2 (UFS)), therefore we issue a test
SMC to store the configuration during probe, and if it fails we mark a
domain as always-on to avoid the SErrors and to avoid unnecessarily
retrying for each domain on/off.

Link: https://lore.kernel.org/all/20230308233822.31180-4-semen.protsenko@linaro.org/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 96 ++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 41a232b3cdaf0f4be413b25d9373b99c6a3db602..f59986b56213dfcc470d9cccc61a36a81954bdcc 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -9,6 +9,7 @@
 // conjunction with runtime-pm. Support for both device-tree and non-device-tree
 // based power domain support is included.
 
+#include <linux/arm-smccc.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -16,12 +17,19 @@
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF		0x82000410
+#define EXYNOS_GET_IN_PD_DOWN			0
+#define EXYNOS_WAKEUP_PD_DOWN			1
+#define EXYNOS_RUNTIME_PM_TZPC_GROUP		2
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	u32 smc_offset;
 	bool use_parent_regmap;
 };
 
@@ -32,11 +40,28 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct device *dev;
 	struct generic_pm_domain pd;
-	u32 local_pwr_cfg;
+	const struct exynos_pm_domain_config *cfg;
 	u32 configuration_reg;
 	u32 status_reg;
+	phys_addr_t ac_pa;
 };
 
+static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd,
+					     bool power_on)
+{
+	struct arm_smccc_res res;
+
+	if (!pd->ac_pa || !pd->cfg->smc_offset)
+		return 0;
+
+	arm_smccc_smc(EXYNOS_SMC_CMD_PREPARE_PD_ONOFF,
+		      power_on ? EXYNOS_WAKEUP_PD_DOWN : EXYNOS_GET_IN_PD_DOWN,
+		      pd->ac_pa + pd->cfg->smc_offset,
+		      EXYNOS_RUNTIME_PM_TZPC_GROUP, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
@@ -45,7 +70,17 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
-	pwr = power_on ? pd->local_pwr_cfg : 0;
+	if (!power_on) {
+		err = exynos_pd_access_controller_power(pd, power_on);
+		if (err) {
+			dev_err(pd->dev,
+				"SMC for power domain %s %sable failed: %d\n",
+				domain->name, power_on ? "en" : "dis", err);
+			return err;
+		}
+	}
+
+	pwr = power_on ? pd->cfg->local_pwr_cfg : 0;
 	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
 		dev_err(pd->dev,
@@ -60,7 +95,7 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		unsigned int val;
 
 		err = regmap_read(pd->regmap, pd->status_reg, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
+		if (err || ((val & pd->cfg->local_pwr_cfg) != pwr)) {
 			cpu_relax();
 			usleep_range(80, 100);
 			continue;
@@ -72,9 +107,21 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (!timeout && !err)
 		/* Only return timeout if no other error also occurred. */
 		err = -ETIMEDOUT;
-	if (err)
+	if (err) {
 		dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
 			domain->name, power_on ? "en" : "dis", err);
+		return err;
+	}
+
+	if (power_on) {
+		err = exynos_pd_access_controller_power(pd, power_on);
+		if (err) {
+			dev_err(pd->dev,
+				"SMC for power domain %s %sable failed: %d\n",
+				domain->name, power_on ? "en" : "dis", err);
+			return err;
+		}
+	}
 
 	return err;
 }
@@ -99,6 +146,7 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 
 static const struct exynos_pm_domain_config gs101_cfg = {
 	.local_pwr_cfg		= BIT(0),
+	.smc_offset		= 0x0204,
 	.use_parent_regmap	= true,
 };
 
@@ -126,6 +174,38 @@ static const char *exynos_get_domain_name(struct device *dev,
 	return devm_kstrdup_const(dev, name, GFP_KERNEL);
 }
 
+static int exynos_pd_get_access_controller(struct exynos_pm_domain *pd)
+{
+	struct device_node *ac_np;
+	struct resource ac_res;
+	int ret;
+
+	ac_np = of_parse_phandle(pd->dev->of_node, "samsung,dtzpc", 0);
+	if (!ac_np)
+		return 0;
+
+	ret = of_address_to_resource(ac_np, 0, &ac_res);
+	of_node_put(ac_np);
+	if (ret)
+		return dev_err_probe(pd->dev, ret,
+				     "failed to get access controller\n");
+
+	pd->ac_pa = ac_res.start;
+
+	/*
+	 * For some domains, TZ save/restore might not be implemented. If that
+	 * is the case, simply mark it as always on, as otherwise a power cycle
+	 * will lead to lost TZ configuration, making it impossible to access
+	 * registers from Linux afterwards.
+	 */
+	if (exynos_pd_access_controller_power(pd, false) == -ENOENT) {
+		pd->ac_pa = 0;
+		pd->pd.flags |= GENPD_FLAG_ALWAYS_ON;
+	}
+
+	return 0;
+}
+
 static int exynos_pd_probe(struct platform_device *pdev)
 {
 	const struct exynos_pm_domain_config *pm_domain_cfg;
@@ -195,10 +275,14 @@ static int exynos_pd_probe(struct platform_device *pdev)
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
-	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->cfg = pm_domain_cfg;
 	pd->configuration_reg += 0;
 	pd->status_reg += 4;
 
+	ret = exynos_pd_get_access_controller(pd);
+	if (ret)
+		return ret;
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be
@@ -212,7 +296,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 
-	on = val & pd->local_pwr_cfg;
+	on = val & pd->cfg->local_pwr_cfg;
 
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);

-- 
2.53.0.rc2.204.g2597b5adb4-goog


