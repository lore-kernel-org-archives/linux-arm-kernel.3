Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A762FEEF305
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=; b=O0HTHH7cVurZsyhiAVKC1ZDXFe
	AcH6caUugjO8W2U77ra/qPc5JO6ZNYm5ObIKKw4ZqKn/Y5LeNVH58/x/VMdSOftUluikkAV/bFh/9
	LOmWVZG5AZzVrqoZ5lRL5CS6HMllC58nRvQlM+EzGJ4VgR/K6YDrxnAoDqQmZms84K+FbxKFinn8w
	yJlNI3fsMECHFGSUUR9Dz/e9g5AgK0cUlNcUU2tg2q0rJnrI+B6nE+6wS3sZjCPvaPwDzHa8e70w3
	Ijq9xauQsGhh7TktChFCzgiJEWSfhtWWB4lmdidtd2PK/3a48bYq3U0wRNgQ6hsbPGWM2y0UuNy1b
	UjUipJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wO-00000000yeZ-15oo;
	Thu, 05 Mar 2026 06:12:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wI-00000000yZc-1DKb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:12:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b93718302beso163514566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691120; x=1773295920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=;
        b=j3pplhi27nUzwmUHYnjE83qjgGCaTXJRAmZ40PTmmtMVZJjfaMwCbzJkFhix4ogDjr
         3/dnw7WECwQgMulowY9LlsYcJXB+n7jXBpK7y4O4VldqAB59kNYvgEvxNo0q9hMjieJi
         xaDkRKIWJMiXOJDj5p1t0DQtM50v3khN1Mu39WKYC7u0LaDtXjjUkYs6gS9TlKHgV/WB
         0u66jYkqvpSiXAGSFp/obV4pd4LxhB53f1oYOrmpJ3gfGXYfiNKNrO0cNn1Bjn0lawI/
         V0EZYxuuUNzexvpyFLeZA81fi3VzOe63uX7fauF3uxDDFWdUIU6vls824n0dXiHNom4E
         BJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691120; x=1773295920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJyveOpQYRN0Rj97xYSp2eMNn5Hi3Nxu7cTlokaFCRE=;
        b=jLBgf+4Pq57kveJSpqurRZUF2ddwLPv4/f0CHiw+Jg6F8zMavTHt6PMejNbdDWnvDg
         XIDsi4oiKalVBvKo5KIvaJXP6M1iNX/xuAQ4jGjnjk0pJyBS8UnK4w4ww2kENhosjp9D
         8neBmavZG5PmJyu2e58W43T5hw/OqL0mMCtBhoNn1A/RuTdge02pAQPdxx5j2Sqwzc31
         JRDlLvUaWJOUzOhjhaS/Vm75LK2IQl8IHjYBK5CAY43xDP3N+dfp8pWgEZ907ecjPTUL
         VfPTp7xgxMK/I5ejzZkboo4w6dGsQe7ML1jkdauWtQxWl8iSVMhFGxifN094FnTcsxpB
         MRxg==
X-Forwarded-Encrypted: i=1; AJvYcCW56ONLfEtnKktNFB56fnpHQLSqzTg20poKN1gUok83+efw0yeZc/yUgSEaBdEdL7T0F7KK1+iRoQoYMdgk6Z1A@lists.infradead.org
X-Gm-Message-State: AOJu0YwSnAiDnydW+9smWkYyP0twCH590Z2vjjQaFVTkot4vAsHyYVzK
	wFJ/pNtGdNZaKt0CPs2xoUsRzsW6cfOZGmiqWjvgCcVSkKWyFx2571ZworTQJ1eUhxA=
X-Gm-Gg: ATEYQzzr2c+kpPtJ8lpZ/Xvb0tdaDXpCSpMb4DEFSaVYaMO7I72n3b56Ot/EAynQqID
	fm2MfNTkwYd4vcTYij3w8By7YtV/E7YiZM/CI+kY4Sd0OTl3gPel1xhDyRO5mQQdc50pfNuEy8m
	JCUxd4vvR1PFByRKl3YSfhTihD8U76I3KHumkLv8nj9nZRCtR0q8oIlXyrh9rH+cQYu7ySW7GC2
	cZQNwG1RdjqPdTKcmhBwBahsBUWg9Zr3CMEvvH19933KmvZl2gZiBAoZE1K8VDQ0p42x/5YctVE
	3xAGkLeDwMHwghdKRnZM88Cqa5sy/UsbqDBQlb4x1qA5ilulRRwpqHmj0N/T2ueq10Thf6U78OE
	/ATj//7jFBVf12mxtWt7o2xXXQvtNO6mI//gEGBTaNyM6hFUqAYdoqaLKfrPXDftcNNJKIhLliN
	+1RjCinndxz4brZybr7RXcBKAuutIM6kTrqDkV91Jh1K35kXIM4A7UxP/BnyaKUQgguIcwdYH5q
	V78IWqEFyVPHHI=
X-Received: by 2002:a17:906:209a:b0:b94:102d:243a with SMTP id a640c23a62f3a-b94102d2a92mr24981766b.37.1772691120288;
        Wed, 04 Mar 2026 22:12:00 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:59 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:57 +0000
Subject: [PATCH v6 08/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-8-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
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
X-CRM114-CacheID: sfid-20260304_221202_376779_B61EC3BF 
X-CRM114-Status: GOOD (  14.54  )
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
index 2214d9f32d59..41a232b3cdaf 100644
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
2.53.0.473.g4a7958ca14-goog


