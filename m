Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D51103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02tyCAuDgIFu9biWUbxZXHp6fnkY15VCU6AYSHfqVA0=; b=qm7OBEh52g0uy/yYNrbhssAoBl
	DutB8wqDTi4gaLkix1XSb0BL4ivhS3ncMLuMk4xv1z2vvxajASEFDpHRn3poXMTqPBJXdWop6e6wz
	JVf7voa8sTl3aZSWmVQocJVh2NyHXRnL0C42h6hys4C9+xkJ3S0DtuXQ52GWO9JNOegx5bhihAoz0
	U2ES2UW2EdhbRAHoz3i6rzR1W0gBfcvJEYMU8Y77L4yrbXa9ACaQq1VVxcLLXr7g41cuaTEdFWcYP
	EauYeUsShs9cfyeCZDQJYxdIIrpL8HxgKujh5XPEIFui8Q5hteEYHVW2HCGSwJ5evnqPxaNlQRRhj
	ZQoZySrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2spF-00000008i8I-0mA7;
	Wed, 18 Mar 2026 15:28:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soZ-00000008hbX-3hJc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8d7f22d405so937170466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847685; x=1774452485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02tyCAuDgIFu9biWUbxZXHp6fnkY15VCU6AYSHfqVA0=;
        b=E8B4OnD1PNd8eo0v3WdNx/ubiDg/2gU+G3eV8XUxcE2DDzPIwbJencZDu9UvYOn+np
         PjNqHQRy1xLJyCaTkIx0jGydbJjT6oUYsIGgBZI8hYV/8qxKeC3HddzRAFfMBiyK0NKD
         dEcforSfvDjfAnnpmRSc+e5lo5GTQGfCUYZY2O1ArTjjAG0LB00n85c51V/1Et23+qjl
         HiWpilcc/0A6KdvN114+Km4zmc4f5vTjXgSihgqyKqejQdlAAskqXWNvx5DmyW+J0qMc
         dFjY5EKteX97ruO0eDA0UhL6GRKy4iYJH3pMgW3V0Dj78v0BdqK1KUvN5Ji8aZogPVB5
         7Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847685; x=1774452485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=02tyCAuDgIFu9biWUbxZXHp6fnkY15VCU6AYSHfqVA0=;
        b=kd0TOU5Tr0EJzv/Ioo1Gy/7iXlZH6P3ZRNfsc/3nI7uZeSzGGTbMA5sKuejpt9QdOg
         XKzDbW0HQiMfwDGF65ryab1LhZUlIpVVts2w0phyu6Y644SUqXBuZXXE41UAc3xDg12u
         M9nNwRL426Ph/N4vbAh5UqJAh4TWk61XbvkQMFoplTNPp/PSOQF5MUt/Sm6vf+Z0cU7R
         /j/1OodhQKaTckJEXexw+qOeZZF0JvY0LzwA4FAe3JASHtuSvHwjIcq6earYF86k1AQ6
         78ZFO3LQ0smvjpgMszhPzDntSMxK+a/pjFzO77QCkraGsAZMNtclrRD8ZMALWvDi4m6l
         lwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjkkBPHWOgaKlQRHLd0+kP8Eh1EQayYy1zRJBaqfQRWIvHQ80LFa8nLkXGx1MeGEkpIESWdIYWoHd33IbO+7Hq@lists.infradead.org
X-Gm-Message-State: AOJu0YyM1v7iGHJbd/ZuVDW5ebtz7PrPZzVxg08FLIFTetCFqoQnuBiE
	+wTCkSMiLqv3OlyyEQKVcFzhRRIcalWoL+SWXkFf/eTucfRIjIjsooz/pObCS8arg6A=
X-Gm-Gg: ATEYQzy8gJhoIlklOcecaRZHf31Fr97pRVOd0DZ6jlo9HvCDi624XCFKf3JGfR2X99I
	aRZPvPWtpzHrSogaPyRKpQfYg/BxD/Zb/TnfVrEabiJeVIEo5Yw8yZUs6Uk7B9rjw9YChDEKLNL
	8UJfib9uBOyamkC5z5h4YQpOR0Iym6DY0WDIfDhWB2C/PCtEbVWK2VPJGthExwIIF5y71QSnoBt
	80OidWR+mSw8DPiJLt/HFYkCR5ODCmmQupd29ApI6UygWFbelZ3IpAwtuzPeGY9l28Rps4jGEJe
	SyyXF9PfrsyWV9e82HYG0DoAUT9afTtFMNMbsIN9AA7N/2PJZh46W9GJI6pBixZWO5HahK1GD8e
	BfYCxQmjMdCaPDO+ZRu66p62/jt+/3G/ZmzpJZjr4+OS//6Kp9VXeLpNYAUHlr41Ar/ApvrZNz2
	Dac81c1CIfGlKytR/LCvjo6mDqTtbWC1aagM1AfnhgXMMQbrKdAP6AIvDJaM8mMvh6sS+GiQbHY
	7b+s6FPqLH0yQ0=
X-Received: by 2002:a17:907:3e89:b0:b8e:a1ad:36d3 with SMTP id a640c23a62f3a-b97f4ac9dcamr257964866b.46.1773847685322;
        Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:55 +0000
Subject: [PATCH v8 10/10] pmdomain: samsung: implement domain-supply
 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-10-241523460b10@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082807_954199_695031B1 
X-CRM114-Status: GOOD (  21.02  )
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
v8:
- add missing \n in some of the new log messages
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 53 +++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index d2e00f8310ce..3b5e84ca2dec 100644
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
@@ -291,6 +324,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* get the domain power supply if required */
+	pd->supply = devm_regulator_get_optional(dev, "domain");
+	if (IS_ERR(pd->supply)) {
+		if (PTR_ERR(pd->supply) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(pd->supply),
+					     "failed to get domain supply\n");
+
+		pd->supply = NULL;
+	}
+
 	/*
 	 * Some Samsung platforms with bootloaders turning on the splash-screen
 	 * and handing it over to the kernel, requires the power-domains to be

-- 
2.53.0.851.ga537e3e6e9-goog


