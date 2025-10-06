Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E11CCD186
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpB7AuKalXwpl/RbLMZ5nDUUEYNNft2mby5//un8yy4=; b=oUqbjH4h2w3sjZdR59H/awo2yy
	alRLSJHz4JQxwfE9faOCXNrWJiJKwZIi1yspG0B9fTQOMEFfaUo/I2KNvfGpWc+i11B228x9Faq5p
	fWKFdbP42q8LaIwsrO+2yj7gaK5X3qmYi05T25vUJpwmHfDRPTJJwRuC62RVvDtelQIB8t9yrDeIO
	Cqc5eJA4OBAfoBshxH77MBtwG0crlKm4Shm8DsNTErNlF5cHwCww9LMi4qO2+D47e8mcPngHkQDs4
	bkRIx6/oR1d7N8wNNfkhVc3RuNaN3EODLhEErJAgmB88Y25q1+DnfOj1g5PRcneipbG3QJGaNb/D9
	ofmQE6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJI-00000000QZe-1StW;
	Mon, 06 Oct 2025 16:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJD-00000000QUQ-1hnr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 16:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CpB7AuKalXwpl/RbLMZ5nDUUEYNNft2mby5//un8yy4=; b=c6CM70SUz7ym9gTB6T+dGbYhio
	hJCvzBLwCUjEotT9PfB6XaCe8JJmXwn4N7heqTkZ5Bx+fRzER7njZv4nJNWSDRwUDv7Hl+5Da4G/D
	+HSwkQfvgQ2MmcEY1X+fH7S6cfHLvWZJjAiEOLKogALkrfLAhuya0E9WZoknPz1ngC5wqS85HeU5W
	B8tOqsz3lpts4mDh+aaCzApJR8RAHsZEI/EnWtwPwoVVDaySqlIH/HIFjIIG7hFhrb46+8mk1wrfA
	uJc9cobZoy5IkkotbwLCVe2ZH3IpjELOe6zcy3xLknYvz06U+JX4+mdHC07wnEJUpbROetagQLNbv
	Lfc31VzQ==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJ9-0000000H3B0-3oP6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso9741245a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769010; x=1760373810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpB7AuKalXwpl/RbLMZ5nDUUEYNNft2mby5//un8yy4=;
        b=zdtyNRFxtnq7m2mUgHdxlAXhLKxKvZLK4SW27TsNUzCFBs7VS1oxl6utqPrFOmDxpO
         phdpUrK20k4wT73X7edn3/xlFKppS9J7+VeAY8LXQOxj3Pex/sHUUOLoZWf9yaIUG/67
         s8f1v+bAdSagNFABDHOOJxRBJUacG7Oo/JGUa5gN+BS8Q6ciGPxXna3gKKAnyTcvU49q
         TPq3GZ8NU99zG8zRV1x+fwYzp1Ra8x4MNIlaXfsE9gz3fTvQoKmYMyRe8WGecBcK/973
         BOTC/4SwTT51d3udO2Hhazg5HsHCZcHUmi5Qgb7W+Zc18HqlSvgAjN1APRQoGvIg0QKE
         Ddrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769010; x=1760373810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpB7AuKalXwpl/RbLMZ5nDUUEYNNft2mby5//un8yy4=;
        b=XbnULRpedHoGDdxE+NaGbBTku72CrvJASAJRg8umhLduZIBB98EynPQ2GihPXIOBAO
         2LWK7x1eaeqwKnmIXht9faCxZRgXVja9UkZCb3Gklh2Ukt8ArJjklQqFWsKPFg2zSzpz
         dd21DMYZyPNwQtQDLTCF7eDtpfphRh8SHV978e9pJhgo2X4LH+oZhMxM8uzzAx6/lOWA
         SD/TArUfQ5DvRPm7raw40rYK42VZmiswHqjD6FrA3ol9TFA0GvaByvfGaOnQ9ygzCprT
         Ey4Ge6SIV8qUKoM9YbVDwQQOG9JKIk0dWdOPGtRfhqk1qoHkpSl25DV+WJ3E9zTYFLz9
         yINQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI5GrE4fJLyurwOWCxQyFLltxh/y6bXW/1kpES6wEacStTj2Vg5VwkCFbD48rXC85KBhqpk696Afod5layNSRy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7KToqEXvbx9Zb4PmZ/xqzlT6e494Lk+7kjPVQEnp8lbbEQCJV
	7rODqcLNuu4pPWqLnWDh6mQvpRHNvGqyEt3Z7H3c18GpmOHHFQWfZMilIhj/I+S4Cik=
X-Gm-Gg: ASbGncuDBEtasACFz1iEiTu0NWlhyGNHyMgqSlGgLRtaOe5WLQ8aD7rWd5ZZkh7phaH
	I9EbFOyCDZp0xkSGT6H4v0KrVjUSCGAKP7yc8r+bTtHHDKpo5pWtCDQc0Zin8iGI/Ll5kiXJFKr
	iZ9FvMTkYpFW6KW7uC3SbLxSE1RaHU+J3qGI6eb7Zmassap3W1RmAo0afP54oXZsgExvJFq6vBe
	iqa+COaOPJ5znSaWYN6jE/MSPeZYjIPMjifpuklDpneIRKaXdmytGO6UJcIS4JbXKdq1Ctki5Cf
	Lp2TokSx7nxFbdHb8ygBhqs898GMXMIFQ3LY+VLP+vqkDg+y7QFNcy8LF96cf5Mg0MfvUZ5lSCk
	AE64J6Lw/uAyAuUAX/bdQUuvgOab5a/Wqx9xE+gzOyvbYTaZRVjqs+gyVplFNFYHN/J1NsXqV1g
	ZzW9zPIUn9lJWxqrxJt+vStp/pT8BksOUuiP2ZE/KMxZIpOZE13dU=
X-Google-Smtp-Source: AGHT+IHBkJ6T+XP8HkZDYRjvyUd2ghQ/PYqM+/0Cceabo1BsPtNMlQLAkihUvoTvqsgb4eUlM6RIwA==
X-Received: by 2002:a17:907:3da0:b0:b48:44bc:44f2 with SMTP id a640c23a62f3a-b49c393a608mr1526934466b.43.1759769009794;
        Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:29 +0100
Subject: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_174332_335417_79566F93 
X-CRM114-Status: GOOD (  12.02  )
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

Convert to using devm_kstrdup_const() so as to simplify cleanup during
error handling.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
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
2.51.0.618.g983fd99d29-goog


