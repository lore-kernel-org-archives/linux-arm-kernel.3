Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A77CCD1A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRtuCWl6DsZm6id43RaQ+ggcTZIQA9X1wHdBvSFgFgY=; b=j31zljOnkiHwVM30hG9fb2m1hx
	UU0DmGBM4Wca4jsOILNnKQUpE1mJsJEYjrnMIJNnDuNzipk6BdTIgVnAIR0nwuND8wNwJ6WJkOu3y
	BGlCkgiOJWpqRPebadYKRtD4fc3NTukdbprMaWVnNUg8lso5R0PtLyJWmNz/XytwVgU0mln6kGji8
	RJeYyi4Rxkh4cAE+iHq87+fpSi1uFeP7Be4uiwPRNfEi7zrbl/emnFeJVH30C046AiXPhXBLLGlAG
	5cFL+suKFooDRP29TUXnBMlbPNu4e5xA+wSiehi4dKe11qGxGW2IKj82CMbaLfadreiW2PcPsmxZq
	aliR10kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNa-00000005IjD-0t0H;
	Thu, 16 Oct 2025 15:59:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNS-00000005IZC-0okj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b07d4d24d09so147526266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630332; x=1761235132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRtuCWl6DsZm6id43RaQ+ggcTZIQA9X1wHdBvSFgFgY=;
        b=wrjM7Oo8VsGcpYULUUU0vtOfoltZ7LpLc2hGt/dc0iWt57ffoS6Ed9OJ4IvMPs/DHX
         qGg2xGNHeQzeNDtXBb9I2TjNPyQEw8cjI5Kkg6WZhFQhacwDwueb1ULWowPy/24HRpeR
         zVUUDkY0Nu/leSwzX4kYSx9uvfmSqLkat5e6HaIR3KNQCKW9CbvvzWWjPBhMFhAV8jed
         AUbjf1X2ldr7pwSPupdxnSufAr+St3Fj3VfCCqlNGg6+V/WsY6CQ7/mT40w6wAi9wgEs
         ZTEfcXVD1UXjYRofSnAx2MsjBrsJ7X09FNDBYzMelSDx9kDqBPGijIIn2z1tph7eNLHI
         m0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630332; x=1761235132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRtuCWl6DsZm6id43RaQ+ggcTZIQA9X1wHdBvSFgFgY=;
        b=X313unefYQHgmliPrI0+o0W3KgQQF/lD1THstgqyXiVRpb4ixdeGvmsQ7ENy8PKN2C
         PthUYe7Ak0pFcMmChkmJT4vS+EY8Lzoa0q+4d1vvxKoBdOWz59OMZ0WISr1Knqse9OI1
         pyccBr8n36vpbUsLo7b7tROwlqO6vbTwIqRrnnFuuw7lAwDF3ImOXVh/eZLPbowYxK05
         pnCrcyDPT7l5lv85n16ympcnckEXTyZgwyh5UClg1HV4RUD2tPwFDs6LX4WVR0Tqnx0m
         IjThwdCmJ/XxHAdkfYNY3uf1h32ygP675q6y9MCcVQHu+8outgacVFG+4epw4Mq1l6VB
         7fLA==
X-Forwarded-Encrypted: i=1; AJvYcCVm8BmeUUdhL2BSfTchXqQ71JiOAw4a11cnnSj0kwP1cDLH4H1UHPdglXjqzi+4BdMJjXVJ4Fy+AEkGbHR5D2pD@lists.infradead.org
X-Gm-Message-State: AOJu0YzUvGYAkty1ulDO4mfDX58q/+s2ak65IuRBDWKMA9qSqW31d3qU
	iKwRITlBR5PHb9RCi9gcg4VQo4eCelaBDNdQQ08rVv1uQ4RhsjNUtAXCHPEW8kISUTE=
X-Gm-Gg: ASbGncu3htE3RDMe/DORncK+JlJGQ4GVi5Q70nMiWIzHLmX7AEgwdrj8ssrSoBmEb65
	+QJOPxPWgn+EqNM3kVRXDVyWzILpSBNxytdJvFwMNEnqJlbgmG5cKVEuXZ0Aav8q3fuoEabaU5t
	zDLEt//AS3HrZAQTOU4fuskLJV5vONSSn50CuKcyFHeJX8BFuX/Az+CxLc0WDE0Kx9/AvNAoq32
	dKobT1ZYFWEIbLSNaJ3IJHQbYKgOEQU+dpqK5gldClOPxLDzkDaG4HdtJsDmUjogU4JxZe7Q9w7
	pWLyYM7PvljEppWbpUtcztnVbo3aWoSXivkOJWmTz8roeJ3cXutVBGB6uUedGqVx7SNeIR6cwwn
	8gMS85KJ+xAIJ1ixgroLxrNcCcSGoL23OKzRO0bsBxgaJZ6t7wNv2jIEU/7q37VqwlN0dCXaF/m
	Lur0crHY1Ckrc+7EMLaRnv6xeggtrBKNRPemvMeSzlv9QdEK99tsx8jmUkkIzE
X-Google-Smtp-Source: AGHT+IEbUoUcanooKZDlk5mEzvgz5a6q2790fxYwvUg/eU6pRWdoDgf3AvUevu67xFJRES2YBilqRw==
X-Received: by 2002:a17:906:4899:b0:b4f:f6ff:a82f with SMTP id a640c23a62f3a-b6474b371e4mr39583466b.32.1760630332293;
        Thu, 16 Oct 2025 08:58:52 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:43 +0100
Subject: [PATCH v3 10/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-10-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085854_303358_A2E1DDE9 
X-CRM114-Status: GOOD (  12.75  )
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
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index a7e55624728a62545eac049c9a51012a229f44c2..387ee1c91caeae4519237af2ec659f56782e7bd7 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,7 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	struct regmap *regmap;
+	struct device *dev;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 	u32 configuration_reg;
@@ -53,8 +54,9 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
-		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
-		       domain->name, power_on ? "en" : "dis", err, val);
+		dev_err(pd->dev,
+			"Power domain %s %sable failed: %d (%#.2x)\n",
+			domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }
@@ -123,6 +125,8 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
+	pd->dev = dev;
+
 	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;

-- 
2.51.0.788.g6d19910ace-goog


