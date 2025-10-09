Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C1CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC3uJwytBymNcNNUBl3ACIVe5vrNsKsuMCXz3oqIuhI=; b=OuiBYUe02YbOilpfpAZcwI+0GC
	cOWISvG0+4AAaXQBXXBbU7ak0mfIRKYFpJjLLZcibDxyOFgvFkXVpEugS9wlAZT+bOSe+IJzgREvY
	pZhCYOQT/a4TefEyeXxPnRXs2b4GHy8A2GH6FMt+zkYPj+IhTbo3SSw+6HvFlm+33UIYdbyzVpNcb
	5TQ+JY7t3LgBRSuKaaL3ltKCdV6kZLnqh3oP9QbhdRpzQqbYkIeTzYuSPWR/qc3yCGpvyHGHYw5Hj
	RvZW8d8IrC+8ixuCX61jzJuU7Ur1fDsvNpNtNC4S9ZLDSrmsa315g/ZKAxtQ7NQmmuHQ66iT7lXRe
	Xj7ni3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW8-00000006U6P-3VId;
	Thu, 09 Oct 2025 15:25:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW1-00000006Twf-0ozC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:14 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b4aed12cea3so172485066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023511; x=1760628311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MC3uJwytBymNcNNUBl3ACIVe5vrNsKsuMCXz3oqIuhI=;
        b=yNwnf9aB8x2aD6OnTh7ZGe2OojuOp+R9Z2CrlvNyqGLmKFYIC44NVlDIQhlAefVhtc
         MsXMYaQsHjkciGdC7JBnn+Pa1V+nDMim39VDFSIyzA9czvmoc7Ehp/p+4BM5L1JedVp+
         IRHgzC/kS/Ai95Rukq2spz6WdfJGXMywIuL0BrYUH76sSKOyu3tiNJ28zNyvYY3ti8Vp
         LXRa5Dp8VFweeBJPiq6EB2nk/DRUU1qG7Vn6thx6XOiCFywaLPrT/vq6TYuGcUGjwHcu
         f6W2PH/iQ2mTECiQFVN7uSYIX3GVMLaTp7VJCdz1SmQM00AJsUG0jlbHJp8J96N+mLI2
         Gflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023511; x=1760628311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MC3uJwytBymNcNNUBl3ACIVe5vrNsKsuMCXz3oqIuhI=;
        b=hLljwyKnfzXkWMfSZMzqMCGa+4ldYCTopaKNExemW3Kid3A3/1FVecjgXNQkQhna5O
         3PFuV3G+sYe4zxbmlvAG+nRZZ9Ghz95If6YM3uPf5E8BTqtsSOM5o1v5ZSrysZ7RJ+89
         5KTVIaGnCQ3+/158DqbqB8eLAvwP8HoQ8Guc5Ov2unlFwgGs357aVdFIhRR4Gz2XuR3V
         DT95sYC6C9VgwW/9Oy+EfjiLP4sV42XFa+odDXVPUjVVlxHcpeK0BJdN2taiiDPS9pXb
         Ow1XPQ2QcWEW1avi2Iuxw4oL56O6Wr/pwPXTeBF6pRa1Zun7SDP0wf9k5dS5zcCVeaFv
         Dkcw==
X-Forwarded-Encrypted: i=1; AJvYcCWV91Nz3Tu6Q7HmIlmBuQDU3OzsK2Y8TlAK3RkMxi5l/7Ym39lIS1wjn2agHmWesVU9E5kkK9xQpom2tdx7vYg+@lists.infradead.org
X-Gm-Message-State: AOJu0YybWo+gGXUivU4XSRr2WA3YrLYMboCEOlROMu/mx4J42URaVCIM
	Gwa5qG0N27Lzj/xvToLuzJz0k5fO5AxbN8DrH5wc2IN15d5z6DVrJl6Fg8z3bLj0b4c=
X-Gm-Gg: ASbGncvlDYapwF7TfHA1kuB4k6QoRxhr1pxIqLkv+vpcn3ChktAwxD5MFx6rwKWxtG3
	koWG+5/9WXutJohemNogZMlKa1MaL+TNFc4wHclHg9AJCT3vBFZ3GbO4PRs8b2Ki4okmEtltf53
	imL91oE8xmnbtiK/4A1hNgkfBsvolspp4nsnlVaCKf66nkQ+X3aow4kQ96TvmwBxp5ySvvRchAO
	SHvUJaEQlRZ3krfSjQrgFzAK1iCek9lFCreuNMK+dzD3hGlUjatjf+MAr6Xcor9j8JRFpQkilIV
	hgPkG0eNKRP1gZW+GrBvNP4rtUBmWTWmCkyqrPUfoAPgTCZb5fBLC5B9VTjqyn3fDz49wXxHC65
	D00SWb4P63Tteq0JxxBuz/0hJ3OGmGQlKYBDc1ozs/8t0q8DOZKZh0JaFwNFceR9wJsal/3TJG3
	S4uIUXiAPfXvLAI6Vo5JcIcicPJgAkKf0WX95/5pQO
X-Google-Smtp-Source: AGHT+IGUCw5TbDsbNDU12n89wz1xnvXjoWKEOoQfEfCs7xti4zjASJ6sSLgSUPyBLFyQO2HMcf/P7g==
X-Received: by 2002:a17:907:6e8a:b0:b3d:5088:213d with SMTP id a640c23a62f3a-b50abfd4902mr890576066b.42.1760023511315;
        Thu, 09 Oct 2025 08:25:11 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:12 +0100
Subject: [PATCH v2 10/10] pmdomain: samsung: use dev_err() instead of
 pr_err()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-10-3f4a6db2af39@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_082513_250862_74EA3861 
X-CRM114-Status: GOOD (  13.07  )
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
2.51.0.710.ga91ca5db03-goog


