Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4647DCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ousPsrsRzOuJ9D//mwlWhy/3PCTfUESlugicNK8z87Q=; b=LKvx0fytxi58qZIVjVIatUjyOT
	gBhRekHvX2Q83c7L9E8B1hB8Osg2alh8/+E13Roozh8eqPvV+Jv55cdt5MKUrJUTv0DRnSJ7eU1eN
	Tg9UO6B6CrhuDYjsnwrTyPh3N7sy1aQx0c1RzLeDVoZjbozetXMvOwcua4cYxA4++bDn9jdd9YRVY
	OxR57t9t6e/5OKuUZxzXfj5ssVszPp6A54aQIlseR1w3jsrKt4gABjoUm9/hsDYkhublbYJULV/N2
	fP6B0kweeVOOVbbp/xQ7o5Ygx4jwvTsF3wjQ2N/P3NcUwxzcMKqaLrn1THaEz9ukeLw7YnYAxZwrJ
	3nmVgt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW1-00000006TyY-3PZc;
	Thu, 09 Oct 2025 15:25:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVx-00000006Trw-0uEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so201489666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023507; x=1760628307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ousPsrsRzOuJ9D//mwlWhy/3PCTfUESlugicNK8z87Q=;
        b=UrxU86bH5rihkW0pwq1RkkSJXw5mKspwhHcM07a28YENNAt7HXml95fA0c0k/CIP8K
         B/CMDSAyXqm8YlEwN5/RFzuXbXk0Uyn+2ldmbIfBpLC+xxz5COy1qQQLrcGwNMRPjwps
         8ywsEuxdkb7UX3Tm6uDzhXpTkoCZr3VPwFU+ZGVwE6nWMuimfE9AdAexqn0hvO5WHWED
         72ZUqQVF7ZYsHygBI4YFKeCZaBv9DDZfYXuDv50Slz8gsd7xTM/LMPpp24JLZYqyADx0
         0hVPv5o6p/lz+wR8PjBSOJoHXj5lRKcURl2XUFfIBB5BlOLerhKmDoJ15Z5d/DAbeL8T
         TV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023507; x=1760628307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ousPsrsRzOuJ9D//mwlWhy/3PCTfUESlugicNK8z87Q=;
        b=eVhy8DfitKPIro8jRw1vdvFnpbvEvZt48qpYxkgJpit1f++n8MIykMxuDDZkmcAdtk
         duQnSpl9DJEi+1zZnlzMLTGhrR8g09O7mxN8JUqMPDfzLPLhkIONwD568nk6ozmY4+5S
         Ub5foUtEP6a6DmcpFVGY7lL8TCDJaSUObPsltmWXyg00Glbh0o24GJnXios6zMzfMLO2
         a3a4F3aElkekjZ67Kx69LRZP+i60apHTtOmqPRA9XB0A4O3zYMh5Kbrtil1eU+6q7Mto
         OfL6qE7dna6Sq4Rzfx5shA702RbxtPVorru8G2bEUol6pBQK7peTPN4axt2ePSIVWKGA
         6v4A==
X-Forwarded-Encrypted: i=1; AJvYcCVhFLw8eVZABtOxJYMkd/YKek+nk1UzTwqZBqzWAAA3qsevupfiAXixQyz+wBxCNPIoR/8yeBue7esTJbUPoVqT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8CejjoVMMJD7gmFuy9AaalWMayU7SCrp+DNB4605I13Ui/clz
	R60MEaZLulJ9bGAP3pSlCo8eZv/bkcpzK3J7CvxAZpU3NgAg9o7W1q0SuSXQTrb2H10=
X-Gm-Gg: ASbGncvQlDwj6PuySW6HAIbIdPl/L7z1YAuJsAP3C5EqpKSRTWnHmgEgf6f0ApjFECs
	KL58nJh8VDDWxwXW8CcUtrlYAXALj6nUGRM/OZK99mLxctDOAD0g9YNhnL3D5LwqUSpH8eXcJnd
	bKQpX4svQVQzFQxLd9aDrF9H1LjQXJ5VwkC3kGDDP/z5xzgXREIRJrIzdxPu3DGQzCs5t1cebXu
	Mbd0lcpm1Wjrgy387GuUNPsjwcBscmiG/Wt1cyC38u86Xp4Fxm8FO13bpEz8Bcn7nhcV/Pr+2bY
	v79rKevfg/SuU92MKtSX1dmaPa4XKzlEjuUW63WpYX1FabDd6cvqbyVgpyHyr4YSit9hhepH1Yc
	qrlxb4k9YOGLzW6XS6P2xBD0peCYIchRUTDwJMxBZykffInEcqbfTImCMj3R0DV7yhlHdh8u5VQ
	peWODU7MAPBnWPv5dNbE0uMgFRI5guQzTVvBhY7xEYqNX8/71Tj34=
X-Google-Smtp-Source: AGHT+IGU5YJiQEOLDla4H1yxJNOxda/6iu+/j1tDENPR+jWfagJHuOHAMVeCVTX+CKrhpEHAyCcJqQ==
X-Received: by 2002:a17:907:934a:b0:b48:730:dbb3 with SMTP id a640c23a62f3a-b50ac1cc3eemr881096366b.32.1760023507336;
        Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:06 +0100
Subject: [PATCH v2 04/10] pmdomain: samsung: plug potential memleak during
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-4-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_082509_274486_6B005FEE 
X-CRM114-Status: GOOD (  13.33  )
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

of_genpd_add_provider_simple() could fail, in which case this code
leaks the domain name, pd->pd.name.

Use devm_kstrdup_const() to plug this leak. As a side-effect, we can
simplify existing error handling.

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Cc: stable@vger.kernel.org
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
reword commit message, as this isn't a pure simplification
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5d478bb37ad68afc7aed7c6ae19b5fefc94a9035..f53e1bd2479807988f969774b4b7b4c5739c1aba 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -92,13 +92,14 @@ static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{ },
 };
 
-static const char *exynos_get_domain_name(struct device_node *node)
+static const char *exynos_get_domain_name(struct device *dev,
+					  struct device_node *node)
 {
 	const char *name;
 
 	if (of_property_read_string(node, "label", &name) < 0)
 		name = kbasename(node->full_name);
-	return kstrdup_const(name, GFP_KERNEL);
+	return devm_kstrdup_const(dev, name, GFP_KERNEL);
 }
 
 static int exynos_pd_probe(struct platform_device *pdev)
@@ -115,15 +116,13 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
-	pd->pd.name = exynos_get_domain_name(np);
+	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;
 
 	pd->base = of_iomap(np, 0);
-	if (!pd->base) {
-		kfree_const(pd->pd.name);
+	if (!pd->base)
 		return -ENODEV;
-	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.710.ga91ca5db03-goog


