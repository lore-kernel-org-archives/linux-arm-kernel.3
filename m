Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD87D3F091
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kov2pn4auGP7KnNGCEIBpS1LmUNVpZnSgM4Kim/Xeow=; b=dVSFBwnbvrq6FML1GypYU1iJ6K
	62IOVcwVliBxxuwsvTChRl/XFGZI05k77SFE467xIrgwYSStE9aUbmmox6XSgEQ4ktRgQ/xCLiu4P
	DziGmCJjwal2Hm5N8q9NlsLTMDhsAZPsmnFypS3xCv3r3onTVI08dh9P1bkBAKUY4YAr3erA4ze88
	VKRK6+gVGSdyKbD8TH60eXm/RrZrxFQyuvranvA8W9+gIxc1JFgzRwTDzaSBnZ8TV58cfCpdrcVSG
	xzCzbHoJ8M8MMIOkXU/a6lLXJOxVpu/1tVe2dOE0UWDi3aPY7h/N4qlvcZzyp3oh6dG2a+A4sQAME
	PhPLMSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88Q-0000000GM18-16jT;
	Wed, 28 Jan 2026 16:11:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88F-0000000GLuI-23FL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 16:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kov2pn4auGP7KnNGCEIBpS1LmUNVpZnSgM4Kim/Xeow=; b=dUDvDWvYuN+FrTIGXgcZ2RACBJ
	IVxZOGa258jII8RdWv5D69EYSZqJd34yu6BWKGacFm8XUUBjLA5fixOSzJCsey6DjoR1ZltOvKeJa
	g5B5IfWNNC8MGswauwdtQHSp6kEHTT3ehgawXqA2AlKoglAidvGXz/EahePw0owwSe7Ewu04+qXTD
	W4YFW422LOW03alpmNrucKQqjFX2pnVPUoys2nDj6nRCLXt3bMFRe/cqJfI9iQKAO4VU1rFGYFGFb
	s5Z8W3Q8vKNAYcWfGF49IgIPbv8wgRxgXgwmqiTtthpTELa+8AISpSv9E1MJUZdVJDVQJiTX000qc
	NyE6hMsg==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88C-00000008uUP-15KP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:11:01 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b883787268fso1101093066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616658; x=1770221458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kov2pn4auGP7KnNGCEIBpS1LmUNVpZnSgM4Kim/Xeow=;
        b=WetUoBoBzxmRK6eZmF0oTgBEstWxf1vQM8p4AC9UaNsumYebcNeL1CGZ/RBGec6hii
         eVVTnjjUyFpg36d7z/oOs0zk3+I6UfFUnpD3vb6jN8XhHdmTUiazFrnyEdHAGi+JTo66
         gthkTid3fU3aOgCHfkMYW+gmGaBmCmQnk1XRl54+L63OjCAzIsURdVI288UCqxZUyclb
         E9cOqdahCO/DoqpdFyDJlxGXzPh5VrAZZa0MK+gFxpxo3DEXSKANoOTxAma6LXlJWT0B
         TayTwd5t0feIc+a7FxSyLa8Dj1Ut0TgcXjOIBuIjUuQAiGYZ1f2qr6quBUmd/hG8nHXa
         bhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616658; x=1770221458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kov2pn4auGP7KnNGCEIBpS1LmUNVpZnSgM4Kim/Xeow=;
        b=OnfOoqCKvlrEwVPpE+f0Jv2BTYxpcfD9GrenzXeBo7kUM6H3Yb9QfQoOeFEwk7AYht
         OZCV2vdXDUjHVK3Tz9e2tkiMfIdaYauvpckQcbQ+XhBi+UrAmJcrWWQu5xsN/v658XV+
         k/4Hp0bJb6TDortsixXhv4a5i6vpgxL2K03p12SibiEmdFyTnYLtGx8MiNW3niQZJUlu
         /fxgD9xISDHWnZGiy+lFUdo/ldV5bxZ7Gcy83zc7wZ5C1h6TtGFLiv9+Yok3g21p4WRz
         /fzhiEQeXFphyE0cZ6kgbUgz03gc1HNASmUUapO3SBikfEJScaZrXUxz7WvV/gRiRHDk
         pq/g==
X-Forwarded-Encrypted: i=1; AJvYcCX7B2M1tlF6Lm9DiZg1dNIsKjJSbxw9DXC6ENR7KvSGrqI7nE0clOE6i8y9hZqJ+PDpYjvExNacLRfnJQbfmSdD@lists.infradead.org
X-Gm-Message-State: AOJu0YyUgM8PqaHq+1nIvYfkPalnuA0ozFMBZgBjvSkKPqaSDi+dbKE3
	6wUerswdLQpJV/j9wval0qJzBIa+eabT8FavxjMREp8opf0tkH66bLNKUSbVbtT7NS4=
X-Gm-Gg: AZuq6aI6Da9CFRfUdmjvdZf/8je7z4jF+3MJ4H/zXffqBYpTofA140pqPD/PopxQH31
	VNgUpjSXSau/BetvFR3MwiveqokR/3TkokBMdnd5+TO80FVLmYLtY1Pji+oW2yipNunTz07LUKF
	KatMymoRLGKMUKKDAFdGmm9+/ZPVSAtbfUy060YndTiHhxvstIVXx4sOlJwGLMJ1tq2Hl2HWQaf
	c2L3RVeTcw30TqwYZGFojmh3ejqAqJXf3enldwj2XvQ1L5JzUwFmjAo3Grck0xqKS1pbNo/4mcF
	5It1zMp1f7xLNvtt1hq583enWlZs6GnQ117gd+WJ1eAsbYhAoa9hoG5YGZ0t+dv1RfuNWc0M3KQ
	kA81CnF/fvHi/2a0XNGRO7Mr+MBObkvn8oVUUngEQQZXYytx7IzV50hWXsZMBx9YHjQdXmGraj/
	AaCq98V6IaJyS7mAspSrl9cBfyQ6p0eWebv/s+GlrFlneVOysYDZsLTQO2V4WWn/26PAJdKz2Ne
	E80kg==
X-Received: by 2002:a17:907:94c4:b0:b87:2780:1b29 with SMTP id a640c23a62f3a-b8dab32edfdmr423420166b.37.1769616658444;
        Wed, 28 Jan 2026 08:10:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:59 +0000
Subject: [PATCH v4 10/10] pmdomain: samsung: implement domain-supply
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-10-cbe7bd5a4060@linaro.org>
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
X-CRM114-CacheID: sfid-20260128_161100_415897_94EC5488 
X-CRM114-Status: GOOD (  19.83  )
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

Some power domains on Exynos are fed by a regulator rail and therefore
regulator control needs be implemented for Exynos power domains.

On Google gs101, HSI0 (USB) is one example of such a power domain.

While at it, add a to_exynos_pd() to avoid direct use of
container_of() in various additional places, and update existing code
to use it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f59986b56213dfcc470d9cccc61a36a81954bdcc..ed7a5807555bcf86e4ec88166bfd5f6c06c9322c 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,12 +20,15 @@
 #include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define EXYNOS_SMC_CMD_PREPARE_PD_ONOFF		0x82000410
 #define EXYNOS_GET_IN_PD_DOWN			0
 #define EXYNOS_WAKEUP_PD_DOWN			1
 #define EXYNOS_RUNTIME_PM_TZPC_GROUP		2
 
+#define to_exynos_pd(gpd) container_of_const(gpd, struct exynos_pm_domain, pd)
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
@@ -39,6 +42,7 @@ struct exynos_pm_domain_config {
 struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct device *dev;
+	struct regulator *supply;
 	struct generic_pm_domain pd;
 	const struct exynos_pm_domain_config *cfg;
 	u32 configuration_reg;
@@ -64,12 +68,10 @@ static int exynos_pd_access_controller_power(struct exynos_pm_domain *pd,
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
-	struct exynos_pm_domain *pd;
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
 	u32 timeout, pwr;
 	int err;
 
-	pd = container_of(domain, struct exynos_pm_domain, pd);
-
 	if (!power_on) {
 		err = exynos_pd_access_controller_power(pd, power_on);
 		if (err) {
@@ -126,14 +128,45 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	return err;
 }
 
+static int exynos_pd_regulator_enable(struct regulator *supply)
+{
+	return supply ? regulator_enable(supply) : 0;
+}
+
+static int exynos_pd_regulator_disable(struct regulator *supply)
+{
+	return supply ? regulator_disable(supply) : 0;
+}
+
 static int exynos_pd_power_on(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, true);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_regulator_enable(pd->supply);
+	if (ret)
+		return ret;
+
+	ret = exynos_pd_power(domain, true);
+	if (ret)
+		exynos_pd_regulator_disable(pd->supply);
+
+	return ret;
 }
 
 static int exynos_pd_power_off(struct generic_pm_domain *domain)
 {
-	return exynos_pd_power(domain, false);
+	struct exynos_pm_domain *pd = to_exynos_pd(domain);
+	int ret;
+
+	ret = exynos_pd_power(domain, false);
+	if (ret)
+		return ret;
+
+	/* Ignore regulator errors - the domain was disabled after all. */
+	exynos_pd_regulator_disable(pd->supply);
+
+	return 0;
 }
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
@@ -283,6 +316,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* get the domain power supply if required */
+	pd->supply = devm_regulator_get_optional(dev, "domain");
+	if (IS_ERR(pd->supply)) {
+		if (PTR_ERR(pd->supply) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(pd->supply),
+					     "failed to get domain supply");
+
+		pd->supply = NULL;
+	}
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be

-- 
2.52.0.457.g6b5491de43-goog


