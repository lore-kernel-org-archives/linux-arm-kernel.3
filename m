Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA7A103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/+6mBPKyRHzZfHv/9qeLvEgXfBPcpvJNmyt49iF8ds=; b=BXeocOBtVwZJgFUCYxyKrS/kDB
	pmekvJ0vqObPhnSqYyUyX/9VHm5/k2qsayoFN16vD0Hr3y2kVeKbNkI5urTBun13wAd4pDAOg3ByP
	7prMA4gBbt2StdXk9AKrUnajv8V7srbQzd2fw9G3wx6qjBsaNR2khOrIBbUb7W+IfoGvTuhwL+iFS
	FwvYvXgj6yFaOO9yoZQOEvWnqH8k1NLX4Z0l234rwMo2gejRovRQhn/GEB/o0CQNskQQBoaxY+T8o
	IyLWYjfoWeKCzcJ8ZoJ7+3uTEypysDZcgoPITWtEXZuS1DoefZ5e/DTVYwmz9hn49CxtBQ5nwvlrA
	tasSg06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soe-00000008hgj-11XG;
	Wed, 18 Mar 2026 15:28:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soY-00000008hb1-1rmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b8f9568e074so993625766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847684; x=1774452484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/+6mBPKyRHzZfHv/9qeLvEgXfBPcpvJNmyt49iF8ds=;
        b=bL0l2OXjclqIDshLOylMHaFBAooMhCA+2Hl9QhlKOXGtTAX68+LAUYYD5YdPrNt29m
         uu2k8bd27x8HSYi28+7DzAzFUyQcd2zaolY+Jo9Sfdcbw8+RYs14X0QexiKIA1689c50
         M1/IfAyDfoGr8oHyYVLvxUaIfzyixHAEMEjtrhY94DFSB9J3HXXfhXulLx0id9BSLcPT
         1wch6BhkQxpqjQGkwn8xISS6pOl1O86d4tGJvGYR273U5ZKBzJVkK/M0RlVsN/fR3hba
         kY3VNwWE6ZbOkupvHs7nmlR7k/ZcaKr2kB7GvN0zy21wbOgMvD1w+ePzGpFLO2SdlapM
         XRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847684; x=1774452484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/+6mBPKyRHzZfHv/9qeLvEgXfBPcpvJNmyt49iF8ds=;
        b=mtctf0FjxouJStTI2AKAEV2mLL+mFC0WyGAvQGNR/uEZyI+UAJ+9oeE4aiM23xjo1m
         EHEh9hTT11h4mRyakmMdyxPdXRMG+daTJ62TC/tNBO23GHNAQ1Zal8wVRQjJY8xnyAWD
         sOCmwJl+3tVzEy58Pqyt05vf1llr3CEEXLO/itQHVKc2HZG9K46tHbxag01H9XLVBcUi
         LIO1CmMv3/yT19TCXi4q8dNVR7YP37Ixj8iOcCz3kq+lys1d6SQeowhQR7wOPjpi8jLB
         yYWLssGrhdVutbjCfyphkJI0MROooNfMbs8U9F3dWmsf9Hyxvo78CoIb4UFKzPGE/QlB
         Gq7w==
X-Forwarded-Encrypted: i=1; AJvYcCU4Qzxd5z9vpxUG/2xWiVjqXrvRDGI32t6rGE0SIHJVPNw9vtNGJ9FqtvuHovMjrLB8dr2CUoLt8qdrUEKxHHjF@lists.infradead.org
X-Gm-Message-State: AOJu0YxfPWpQ4jaQEYlM19MTRubYH57EmJyzSwLXLn7EkkE7aaglgWyG
	KiQnH4USGkqXXIcidkprMejsQi6J1cH7wKzRnGbeCU9noRw9SO2ZxWFK43wDXxz1zIM=
X-Gm-Gg: ATEYQzwKt64nrSc1FLsLEr7/l5I0TIZ8kNP0H2ANl5ddtzKecGJk95DKvIa4W0+oa/r
	0rpwbE38Hvon4tphJDs7XpGLw0rO2MeycOEq2eWdXaQVp0h6HYdtFgiKMwaUt0uJrcBeErM9SYF
	J4/5Jc/1nMJjLcQOKmPtqeWb/mwGOe1NRL574/YZKDLnJHeMtHCNTkBBiEbnNebFnCKJvnvFF42
	Nhi+c+ZfdYJrech9RDh7vJhqVfGA59fGH93NeAD/+BN2BUTUTY/MfOnBDgPUplBcmbIJ6tZkt8u
	bfYDnyDVY9Sap3x1d1Zgq69Z/rzscZRxad/tltkktps4NdnxVo811x3TJsWKl0XaWV1Bj2t8W4v
	wr//R459Hy3afgLUPeY7cEmFRytoOJSrxWAy+1j69WFWc2XUyiHBwabHFwSrviLcV/Cg5m3OCG6
	C7CQzETotWWHi2A/lkr500kbDqnOeUFaWxiVdGtdVsbmP72BCDhTePubn02/HfwGInntVUISQeh
	2VOw7fvZJbAkTM=
X-Received: by 2002:a17:906:2092:b0:b96:f0a0:c791 with SMTP id a640c23a62f3a-b97f479705cmr157898466b.9.1773847684124;
        Wed, 18 Mar 2026 08:28:04 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:53 +0000
Subject: [PATCH v8 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-8-241523460b10@linaro.org>
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
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_082806_505523_0042FCB3 
X-CRM114-Status: GOOD (  14.49  )
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

dev_err() gives us more consistent error messages, which include the
device. Switch to using dev_err().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index f8c0d11e9b33..6b0a0f395509 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -30,6 +30,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -47,8 +48,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pwr = power_on ? pd->local_pwr_cfg : 0;
 	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err) {
-		pr_err("Regmap write for power domain %s %sable failed: %d\n",
-		       domain->name, power_on ? "en" : "dis", err);
+		dev_err(pd->dev,
+			"Regmap write for power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 		return err;
 	}
 
@@ -71,8 +73,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 		/* Only return timeout if no other error also occurred. */
 		err = -ETIMEDOUT;
 	if (err)
-		pr_err("Power domain %s %sable failed: %d\n", domain->name,
-		       power_on ? "en" : "dis", err);
+		dev_err(pd->dev, "Power domain %s %sable failed: %d\n",
+			domain->name, power_on ? "en" : "dis", err);
 
 	return err;
 }
@@ -140,6 +142,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.53.0.851.ga537e3e6e9-goog


