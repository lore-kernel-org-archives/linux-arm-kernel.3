Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80CBECD9B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khuzBcy7Hz6jo0S9i03alRelHLigzIL+h0sUh48v3Z4=; b=gRpTjcwdT1F+07Zzzv1TL9Aw8r
	9zYADf44TukA13X8hGpXFdgwzSmy1AMWVzxrKXl0pTdS0fHjt1jqes5rwMmm0FirUx0tQhJRnY/xK
	lI3ICEcZPdSrsYVlhuvlWvR2xd6cQJZeBRrQ7xPPvRJQccIj+AS0xC+v77x4ytDX7iaiN1diWpakU
	SoBjXd+09+oT0q//Le7ZbEmt9hBB4yVCH/FxXvnEdj9O+7OXSi+OijL25At0KPGJ4l+F1RlKZQ86n
	S1RGf4tRgLU0IUh9XjJXWn8thpEPjSoxEMw9u71QdTjXJbbEv3rZcr5oa9dbHlldiap4piQ8RbnaX
	XbbRlyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77k-0000000AX4m-3RNm;
	Thu, 05 Feb 2026 21:42:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77Z-0000000AWu5-3zHW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:43 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-65832e566edso2032671a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327760; x=1770932560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khuzBcy7Hz6jo0S9i03alRelHLigzIL+h0sUh48v3Z4=;
        b=mbsEqpxptYyM8rUaoo2UUGxDiARAcF/g47lEEfCrb5YQZwvp/29UlWKqnmSw/vaR2K
         IJZdwEAHE+9bdgJAM7UKy2SHw6YSV+hBSoRRSsXuU7qTCC6NjqOzUR1PODeN0aCRUlFR
         6ZUApXpFnSkuNTZnMW2WR4yN0ukZp9fCWgV//S2EDNhTPyfxRlhn6CPI5CCvcZ7GMg5i
         Tp4vSo0xCmMeoVsiWBfC9tdJoJmyoWw3u6K+wnxRb9SbA4U0650LUIIOHd4ygC/BcrMU
         zdKYNKx+HEEcNL0jgxPjE/Yb8uXyaT3iXt41YkpDg7uZx1XefAsihP3ChG2INZBrUedC
         dCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327760; x=1770932560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khuzBcy7Hz6jo0S9i03alRelHLigzIL+h0sUh48v3Z4=;
        b=Xmp3KWz3i9c7KlC5woT+toMRBv7IXV573sCQKisann6a+hrUnEl+RUNlIrZy3BPwH2
         V76L7eCHDBxf3ShVGtQxctLVAs7zg6kgpFAo2+kRbj7WOW3GGKvCabbs1ecJQUwePNvv
         YmZOPE+RBnGXCDVlCMhvg3ZwvhklVoNv4f+WmCtDSlAM1UaKQEk183KskcLw7STN91ty
         xLOd0szBdGULTZAuRECwMP4hoQgJhzPb3UQ7taSsY8szeuwqiAoM8fmGBWlcxI/Z3FvP
         uSw+J+cDxh+5pv5BDTLbOzjffVe9KES9macsZH9IHvglkeTpcQAu1t/BVbe8QxZiTxI+
         mHyg==
X-Forwarded-Encrypted: i=1; AJvYcCVxDZhlogFhwlV6O6mmNYTLkh5muB9fAO92ST5EFLwzbPXkQ0KwG/VIYirddR2PcZXh1LpY5dgN6lN3EdljTx43@lists.infradead.org
X-Gm-Message-State: AOJu0YxbtuEjwPVRwWLxhtME0oz3OrQyb2o9FbB65l31fQnhsjA3DRdn
	sqfEXVpXkIfh8+UcsE6o9eYJ7hiucUYOOUcf0u+miWEsVrpiI1Il8Aeuo9CpiZmGVg8=
X-Gm-Gg: AZuq6aIBFEANJX4CxeSdcTy3PNxuM6EewRU5/+p9pO/x1FfrBVoeO+YwAgDxpEZoLNd
	jMajxVCEO8WLgow0cfRxsgOBKaiA48TVkVgz1zRvio2F6Fsc+zv2NVFJrEE2XDuk3w/e4mx0SDL
	Qsq7vBZQP7junOGK9cPgJ/E40tjTZDQY+FwhHMLjoZXsr4X3cD9fIec7jODDwNeo7tQOP40/bFN
	IpPjj/8uw/Jen29JD9AaToC/3uUViQC03jxWwgf4MmyE+z/dO5esHNklNEZc2glO6V8u4fKUwgH
	R/0K9KQ3nqP+DVdDiqFnNguijPLEX4Pz9LYTFgLSojIxCujxezo+MbOH216BsNDYlqmuZnVYsSW
	PICieW2JiPxeC8eraAIS4OKg7K80K5ENq7WzdJ6Bb2sKJN85vwWUE4FoP0Lkjkq3NblVpjFCTYt
	dZnH7SkXM8E6sG6HHdRWl3cDLFFWAL1kOnqjQ0aikVdzDPXV1hf2NbmKQ6mne6VV3RX2/IRm1Z/
	ERk4Q==
X-Received: by 2002:a17:907:9810:b0:b87:39d:2bb4 with SMTP id a640c23a62f3a-b8edf45a619mr26687766b.59.1770327759827;
        Thu, 05 Feb 2026 13:42:39 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:38 +0000
Subject: [PATCH v5 10/10] pmdomain: samsung: implement domain-supply
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-10-ede49cdb57a6@linaro.org>
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
X-CRM114-CacheID: sfid-20260205_134242_021730_E7D61B26 
X-CRM114-Status: GOOD (  20.00  )
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
2.53.0.rc2.204.g2597b5adb4-goog


