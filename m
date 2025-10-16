Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D090BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AiSVlBoay/rNWhpOjfQNUl48vUimN757HYzsRqcO8g=; b=I8H7sDIfFMpCtjFbYO6G2yOO2h
	lgyKXaRbsr5r8QHt5ZBjPaxwubFXNrvnjFTT16/vZ9gzmaeogl918nANqEjtDBPNMajTG7/b+katf
	IvaHIJyQp8s4yWff00QRnS7SRZFT1UTyW91Yi1M6M5E4gP+jrshSLt769eDAaLBG27AL33FZIWH8c
	8czlV9cjbHHVIODvjJgD2kvk1U9DrPwkgwDDd+aawiltyqx9Evr8+3QYKN5YpYU1Ayb1Y8pK+k1hN
	YqZn9GY4YLfbJknMIBRCqH5n3tJ/vPFy/AMlPF1qqoinFdA5C3FjL1Pp2Q6i4po1c3DK6HBLI579i
	yybBxooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNZ-00000005IhX-0wrq;
	Thu, 16 Oct 2025 15:59:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNQ-00000005IX0-04JT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-63bd822b007so1595758a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630330; x=1761235130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AiSVlBoay/rNWhpOjfQNUl48vUimN757HYzsRqcO8g=;
        b=RBLzsJRxwJlPClXkMwM7GZCbnUMa37Yxq0X/5m5MbnEJJZNCDkzIWxTdFBjvHik+8L
         uX3MmyiviXyZCzjmTExHaqYUdQ+koUr9b3PJlj4dqqxgUuRJTZ+qHqmRPunu1USVwREk
         GyKDsrBYJHHDh0qhV8fJC0m3df9xQ4CnT10nvZ7L15/AodXbpN7sBPnQikKSU1moGqzN
         vQOO0/371wNv0yTuO20Rfpdr8u/uux9A5XEQnq1EtHR47DZHT6/izU019d/Rai4AXA8M
         xyLzQnMaX98Q3okeAufOcff+KeUWoeUUy6n+drBK6TIdoCGEchnCJEjsmXziHCVIPVvQ
         4ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630330; x=1761235130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AiSVlBoay/rNWhpOjfQNUl48vUimN757HYzsRqcO8g=;
        b=xNXbscD2BcfggQvpS8BHrRxENpQA70QLAa4H9ea1kPg4MIEKWwWE1E1qBRdk5B03Wu
         PUFtgZAlQXpngMFmDQLhEaa38Nl4wLE6YHUTZ1lD0j2AMzjLDoYZL0eJe4wLij3YHcV6
         MWp9sSU5bFTZhuZvl12rl5NskOCakZCb8uq0afe3z8blJVD/aA2KzdVA2D/fzed/Elfn
         WvUU+axTSrHyYOCH40srFG6dh1Wy1rZUWc56fq7tG7recpbJB5iXY7gV7Nzs2iJWC6fE
         d6wNK+tlyyazp4K0QUHEEsm8ILDNI0L2ifZevaGop5Evg73gluVGrrqquFJvdCnL+2CB
         Y0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY9rUi6ZNy/UagMyYikT1xiUpGVoxm9ox/vmZG7iaOald4hJRTNbF30J321Wrny+0C+kD/7TBw13zeBeF0GVKw@lists.infradead.org
X-Gm-Message-State: AOJu0YyCSEs6Ih22XyuxqaNi7h++f0OXA78N9wrll3LwgZhAMyXiJUXO
	jn0jRwm+ObCtjA7ZvDEqQMpy8sNxDgBrPrL5Aa8vlfCEita9e42Z+8ej6ItQDfJn/GRSWSVXLYX
	khcifBGb/3Ipp
X-Gm-Gg: ASbGncuhXsDFQF/mP/Ct/JHxBeVRlGSfxigOw+lYTJVf5CDmbCEBgiJVTiOkVPfhp36
	JW5OMSkAJQs6rEPWActPitpykZwiwPPiPy5Gdx+xYxvBuQdYOV9uDG522LNcUCyHaG4tV1MxlHQ
	STT2Xi4wYKjPhsHS9KzyGELRJorPnPlfs/z9R+yeeBxzLepPWJXcms/bouW4v00HtLpSXelWbKE
	Bl5oi5Ej8bTzILcyi7bmcq8Ql1pawzI2td8chvejjopVoyUbm13r2P8APbDl5kI+pcHB7+LCxZf
	U6su7FzONV9eeY51sipYr4Ly+i8XaAEPL8ti5fW1oVfA370es1rfAyss9eOgiRYC+d31wgtLD/g
	4m/SYZBIfF9kqxEmiEGdsyOsXagKLTNnwfIfdjym9avRf8gDvLXP/pcrHy1C3/P58GgpmMYFhZ2
	eT1z7eUQu/cnosgVNNfLoUFzlfpXvWiLEXQkhEqUzYL8eXcjNRgg+O29kG7yJ3
X-Google-Smtp-Source: AGHT+IGPO+2Zewf0zB4l3rydvFCKk2iYa8qO/BfCMfzqYngcvlnWd8aJbjMUPzhsP0bqvo/AOWVLUg==
X-Received: by 2002:a17:907:728d:b0:b3f:f6d:1daa with SMTP id a640c23a62f3a-b647443cf06mr45875966b.37.1760630330042;
        Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:40 +0100
Subject: [PATCH v3 07/10] pmdomain: samsung: don't hardcode offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-7-7b30797396e7@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085852_094207_C2B29E82 
X-CRM114-Status: GOOD (  15.09  )
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hardcoding 0
and 4 respectively.

Update the code to allow that.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 431548ad9a7e40c0a77ac6672081b600c90ddd4e..638d286b57f716140b2401092415644a6805870e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,11 +43,11 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err)
 		return err;
 
-	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+	err = regmap_read_poll_timeout(pd->regmap, pd->status_reg, val,
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
@@ -146,8 +148,10 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.51.0.788.g6d19910ace-goog


