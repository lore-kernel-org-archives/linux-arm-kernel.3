Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FD7ECD9AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUyvGkotnpd5Ix+9v7DeK25pCFRQ7XmZ5wApdtSkIE8=; b=1S7UBYxLQRzHe/e5stZtdofin+
	ht2gCeLWKofQt1Pg+TH/weA9qL3P9pMsGn0wA9V8z9sk0sDX6RCoxr6sRugVFdzOyj4cT3LxRe7zO
	oC1psXrGQmS0M9MCC+tn9OEdgZo0azvMeYJFFtTaV3CfmEyVi4XND0149LjEJ1w+kwaW+7SeePgQg
	DHECxXqTucVjN/lD922umHrQJ4UqY7M7rYxkKVw9IrWDUP9y1aFp2VvnJYGGQuSa2E0ioPItSyyMI
	A7ODfhDCaZ30mTgDzAcqyXZKBEf9sC7lEr2ukcEheOY/bYqJlEsAOUkYx9find/hhyoRO5Lp14t5X
	3wH+scaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77j-0000000AX3O-2SXq;
	Thu, 05 Feb 2026 21:42:51 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77Y-0000000AWt2-0Mgn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:41 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so2283157a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327758; x=1770932558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUyvGkotnpd5Ix+9v7DeK25pCFRQ7XmZ5wApdtSkIE8=;
        b=KJj61SlpnJ6hzVuyHx/dVrwyLRvB5zWkOHPDpjwuOzkUB6NUCgXsXKBAM4YWbZoKbi
         dpayNjsoF5VB02T3Od95xEwpmteOP5Tv3690/nZPcbvajY9HNepVF9rNcsfRwnhp9yUT
         Ief9rUw7JIiVslbc6i24TpO6mZqqfkzd35CgzerXOVoN0b60JXVv72PSO6AaRJuntoNi
         7lJr9ieDMNb12W6Bwqwgw6ZnLgRyy6jasuAG/5F4A76owBi2oHOoBSTTh2jx6RGTJhbO
         TZXnIbBMP3QTFdFeWztrWGYeU50aVHYQkVShwKAtzf1uQBzg7ho+6xqorPsRaf94WJGA
         XdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327758; x=1770932558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vUyvGkotnpd5Ix+9v7DeK25pCFRQ7XmZ5wApdtSkIE8=;
        b=mo6GOvIe2GFLs0VTthkJUpc+kGWVb6EUS87hN+e/JpWlULzVeV0qS7/+GmrRoNID5f
         eFDtFnnL73a5GQ0uu9hUcoI5R3RG1EwishLZs6AuH4thRia/f+1S2jLbcNAjNoOeOXk3
         /6r7G/q5QrlEZipmPd+MTFsLsQs9WdRDcfr13lNxGSQ6oJhGnFXVFmgGk4IaN+EhQTCi
         E2Lp4Oj8qyxAMwVCu8YWEMAEthPrBc15cUqMZyKCKk/69XLqquhSO72208rTKYld/5y+
         csQ0MWZD3cXje05EYlblAxZOwFFTgSTBnkkgtDb9lZKotDubwzqmIpAQ22jb/OZWJtBw
         PJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAgC1+HzA9FPc+ARJ7cP4OhlVzVTfHzWORhgt35h6GFlMtPGf4slOjj/Lv9lj+uNCoL9ojgPtq34Ny/mIpfR1t@lists.infradead.org
X-Gm-Message-State: AOJu0YwDR1ySv4sp0UXjF5boPrxPSpaSUXfhrho6+f9oNntsudEd6iRR
	zeAIhn2Hymxg7BH2V5Uk9DpL6LUCIc35+Q2piNFfZSDzjEK6FQ2VfUvd/HlZOLTrWcw=
X-Gm-Gg: AZuq6aIN72BaIXLUgIexjMebbfLt3riuqxLQQJKo+OviZ76gqnMuiT2NJVG3vj9s9Ig
	X5ZijKEY/P+SGDZV5Cul5gTalzi9Y9Q7KpnrKrnjyIrO9/gmkZ0JtDc31M5RSgN+BXMWqUsxi0q
	FRjZ8ocHAalU2UQeji9X3id4IIQwisZoGfMyuvLpfK7AZfl2tELR9rxSbOwU3rT1al4IkXKpojB
	ADTWCyr/ryuw6UEP2b3NCkeAOBGHqt0UDfsH5mC0QPehZ8tGVl/RXwHkSQW7focf105J+UGEZBS
	ZGoyXkfFg3uH070HrTBSvLSaxBLEq7DKo5B9YIvufGl3/W/23k7XdO6dHpGO9hUwuP1NHO9JFp2
	ayFxiOPiVfccoB2Gr4ui9hxmjxyON03is1/0NB6rNiyqU7cQmKBtfyAB47SVheVLfBLUPrFyIOZ
	mbwcl3zTskQFzPO+E15PQwnsyaW7Xjndua0bXzMh3S1sYFWvpfJfl4Fg17M0lvFObXpwUmaz1sS
	4OnbQ==
X-Received: by 2002:a17:906:f590:b0:b8d:c595:828 with SMTP id a640c23a62f3a-b8edf1c91fbmr25990966b.14.1770327757986;
        Thu, 05 Feb 2026 13:42:37 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:36 +0000
Subject: [PATCH v5 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-8-ede49cdb57a6@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134240_148940_7023C956 
X-CRM114-Status: GOOD (  14.20  )
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
index 2214d9f32d5967b60e84f68f4e99a725d66a39eb..41a232b3cdaf0f4be413b25d9373b99c6a3db602 100644
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
2.53.0.rc2.204.g2597b5adb4-goog


