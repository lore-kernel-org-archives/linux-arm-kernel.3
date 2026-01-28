Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE335D3F094
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLy2uL/FtYE0GEpGfFAeMw9BLXBDMwcv0NDa1wsnuec=; b=hbhUL1VrUuZF23HEsqDCS+Ssh9
	2y7kSzSuRy2pmhDKQ2Ue4EwNEMChWK/nvXIK5ZaS+AqxA4iM67RdhhF3uXn/J7Xb9o8DCWuTGd16w
	BgNciCWLRbIFo3qIKdkZJo/BW+EfZnFP4Cvl5gPFU7ZscVWw0BZZ53onY2hApHRd7yH3+r7m9zETQ
	Z6r6BKtOyUZ2xWpNXBJKP5q2FpcKthLLvTluB0kl9lOJYBHTOXAIaVnPHfl16azsQBOlYXVLnCJY9
	jzD6tTDe+3LRqGweQ0XOVoJ3Aw3PcPC9JahdeL6reiy5NPFHp60QdJsDKXR7xI9y6eIuwy8FYVAOk
	mNlebVJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88Q-0000000GM1y-2ohM;
	Wed, 28 Jan 2026 16:11:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88F-0000000GLuJ-3Sw2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 16:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mLy2uL/FtYE0GEpGfFAeMw9BLXBDMwcv0NDa1wsnuec=; b=gkrvw21uzhqy/uXNI6cN8gAM+L
	TdAOcZ0HhCKR1PlIlqqu+n5xS0NRJRHpeahut5bcD5RPOYkOsnnfgZaD3L4+W5DO0ed0zIKyIqmuz
	LprAOGRDqgByLSMyyMrMnefa+srehK95Rqan/PflpVaVl3jkGIdadB/KbvGQJNHaoY/zKSBMp2ezi
	YZdTYuDl8rKJC8mlzaeelEDA7bJ3V4dYXIEYfp97v88cQHz6X7KkSJba2EeGocxNw07gUSTyzbg/3
	66LkMSsrtqh3CXY4qLKCjR4MZ6+UTgwyWhM/UFzURpOcUc8jP164eNpjXxUsc4dE8xFPSfPaiysvq
	gaV/YU9g==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88B-00000008uUN-2xgx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:11:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-658b9e95990so92021a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616658; x=1770221458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLy2uL/FtYE0GEpGfFAeMw9BLXBDMwcv0NDa1wsnuec=;
        b=cSc9nLpRnnQdF/B2IjOKmkKMUqfF6/S9Qgb2nGQZbduN6gv3Ry8A5+dhGp+zbsmzHm
         4H9w53/+dGGsT5+KIpKRwiJjJMUvLjoxxsZ3I7ta5oC69WYkyMoejG/HZ3O2Aj07XyJN
         A8nfdiQi6//Br0sNad2L/MJIaegPgwfaYx/qykP7ZPARzBRMkhuMTaaTXTJK1Mg9J9wc
         HkuhMN+7lJ5Sv2kRnki9Tszo/JGlT4eJFPabRnortZr549feYY66CpTpKabKH1Q7OFX+
         NnLE25emyOlhbSVechibFcLpRJDb9RCnzvYoGLrFez7ZO4Ds/JDbIXXPL4YowMXtdE7b
         O2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616658; x=1770221458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLy2uL/FtYE0GEpGfFAeMw9BLXBDMwcv0NDa1wsnuec=;
        b=uVtSygjmAzG+xWvAuCA9TdjsPzE3DuclVuMlCIbloMXgfRwU27ZCQE9ZPKZ/uDW/UM
         S78PD1/GgWs145R4cwQ10EOTX32G9pYVFrD2ndMQojo5RWzGZs9DgtKPTkCG3iWsOOmy
         Og7YqhO9zVnX0eo3+BmL2i+pMonhGzv0xj5qEXVK5QmSXqO2BXMne6zCqdz1S73zKtOS
         oPN4UZDI0l2vlGZIFT9mIOl2rNOkRKLdQEj3oC/wyJ2ogKDwUWDb8YQ3ITjLii7mlpOP
         X5fiOn0l1HgaIniex8Ye/HerQaR0dCah36T21SbN28BMuDAoHc44QPUH8Gcvx0pd2sem
         h8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTGoJzwlyXpGACSvwjxuEyZPbGgr2B2W03j8Wv+S1XGmikPeKaErmCi1ftjq0H1SHDGnPlmzQuFjp27bTk0mq6@lists.infradead.org
X-Gm-Message-State: AOJu0YwOv8FWfxM34cZ9n2yk4TcPi/cr+rz3so8cJPx+dx/UHf56Ue2X
	70pHjJFM7eHyiH3U4sjFxh8xoajb4xdByHo1yOgvYg4FeoZMLsSgWxD2l3QyuAaWN7M=
X-Gm-Gg: AZuq6aLnAEeXf6j0bZSxffos2TCb9O5Ydu5BmrsHlOBkAvQ48j8vEnbqMmMHFBc9QLt
	/XfO3f4SE2bWHi3kiMf87Wmw5pv11Jim2jSj4Eh/h331LQxu7SX2aoLuZJdZEcyn+DSzM8G2HJM
	lb7HRWPwCjATBq6k4S32cfu9QeCsPxAeHYD0vICN+jNO6GZHv0tr8mAFYhmHZGqCToWQ4M23ZpQ
	tNEpor+H6Qo2dly7HWqJqGrHztngB+qgdMI/xaL/G663Jz4kCN8IEABG8rf0IJZX/fg/o3MkzTi
	DDED3Opybmv2Z7htEq2AYHRxY4G0R+qEwT7/FnBwHCaYNUOmAnU7Tgfn/WNkGBngu/EAohvexGB
	ts5IpHKsrPvxBOlkzq3sIj3R6QFhupfCPboVdbHiOp4cIiC9uGrcU1EbNa8DGeCmtsKQpimXZaI
	zSVCQtmM5NM5g6vTUCgofOiyISugSB3erOox5x0crLHwwQjvC2sF7KxVgyoCNe8R8M6Gmy+XQr/
	TEa+g==
X-Received: by 2002:a17:907:d88:b0:b88:587f:f594 with SMTP id a640c23a62f3a-b8dab1b526bmr445917666b.18.1769616657919;
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:58 +0000
Subject: [PATCH v4 09/10] pmdomain: samsung: implement SMC to save /
 restore TZ config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-9-cbe7bd5a4060@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_161059_862394_FA6839DA 
X-CRM114-Status: GOOD (  27.57  )
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
2.52.0.457.g6b5491de43-goog


