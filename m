Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49190CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpnrETzk7C6oZhvz4jEn6YRTv70n/RyEUTvN5Rj5ca4=; b=1oBkzgoU6IlYrR5tk5SUfd4GRp
	9h/p7Xpzy97laMDbKxYklcgQTn/0lZHx25n//GLsaIxkvidLUOFXqh6QXyN04LLT21P88jPskoNoq
	zYIUgDvL+PmUjSrNgEQvRvEAyMrVV5z8aA9wT3Ar79GYyvPfIX6vy6F52E0UsTkGETK82He0dj5Mt
	7vPsu6NgCJrUK6x9Rd2BYt8mRD9r1JHRje3kcUbAqYYPlJ9b4fDp0ueUMKXU1WyDF/TMSo3xVnCEw
	HfLtKehrmBAJGPjkfBEhHv/6mo64kVDkrsPw+EOfk5w+xyQU6O6hv/NG+8jOIpHfKPsJlSgyQGByd
	cLyy70rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW2-00000006TzZ-1jNY;
	Thu, 09 Oct 2025 15:25:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVy-00000006Tsw-1y4E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:11 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b50645ecfbbso226290566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023508; x=1760628308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpnrETzk7C6oZhvz4jEn6YRTv70n/RyEUTvN5Rj5ca4=;
        b=aC0IaE4QM0rCZoJxrPqHoLAS+6ZlQfCieBUrGeZfkDfcaN6IYmd3MIyQ+23fhe4VlQ
         whg5h4s3DvVnGJhuUoLyZlkYrWaNK2OTdm9Cb/JK4zFlWnG+lbBLVQ6BXO9sOqD/n+bY
         r9KLZ4kIkzXYDQfSwHD0ou08MYVfvRPwL688coY7OaInkGxZGWCGmLNIWETXjGvuhb0x
         Kufrf8cCNgG1iOnDLVc7uBmQnMAnONHg6r8K50yWcq1XkeECiwtcDuxLcfpwdJx8pM4P
         ljDANuWG5dX/5WFldzT4q+PiPe+o3SFsb2haAbBIJwOC1FE3j8RisauupTugPho5Jgk4
         Nn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023508; x=1760628308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpnrETzk7C6oZhvz4jEn6YRTv70n/RyEUTvN5Rj5ca4=;
        b=QXBTYUhyFLcSeCFZFGMzijKM8zEnIJC+eoEsO1D17DjqFkaakDR9je2rKkc9DdbOtA
         Kx4EhgEflbov46zSIJLJr6dA44VRAG/cVxi8KRzG4myzGFrjbVvu77xmZif5wVQ1jExD
         euy/ryf7hHyv9vEIyF/7sKlYL9lD3h2Wa15wQZ7HnfKrV8W1yhWtWOkuZF9BpCvrWII7
         NW9IYo5oXU3sm8KeKFAbL+RzwDw8GSf8QgGwO49EwTP9j1jpwBNv2evNjRSsalN4PSrf
         3Z+uuEPrWRWunQlom8P3ctS76j3ulO1FqP0dMmOYTA8YE9XtL/ifzg7A6qjpCkpiNAfE
         Hr2w==
X-Forwarded-Encrypted: i=1; AJvYcCVygh6FO3+b7iNVQCjUvuSgjwhYnUMu1RKqDgOvbktLh5I7bsPv7XHQgXFpOuWcaSw1okvq/zDSINpOltkc6i65@lists.infradead.org
X-Gm-Message-State: AOJu0YxD4bscTwjAoJ3RD8jEJ9XlEAUX71OHVQzjREKHI38OMHXkNiaT
	UeAZlo+oKe4YLncS3lfdSuQYO/odBBDhIl6/v0hxaJOBLagMx7/T12duLi8eeeCjuQc=
X-Gm-Gg: ASbGncunbrYWI2EbIBKqAigUzOABSaRBe6zOp/nlksz3i6hya3zMGqGSvCiAmRZevaZ
	0Qnmuhl2Rrra0+1MwBpikn2WP1WPBDd//cwyL6f9POO3QdSG8SIbLR9eS3HZQoSv+1qTAW2aw06
	e8tl1k7Hxb7Gyilwo8NQHL+7KYgr8GoMl9dRqcO8WFsKPUs9SBzFNq4araa8wbBdnQdZErEUS8O
	IHbuNenVsBImJPvqidCT7QKa2d2FWv1JGsy7SY8U2v/qHn/GCvFqsAlCn8zYVqmmxxrPdNxoR4o
	/won9dMRyj5OnwLhlw9WlvWV6xWwlgUDXgtnRPWYGlAT57uMbOP7wM6khBHK6/m8qlnJrfJKIEq
	1vtsGOtNtBMr0aQ30gogMz+0wDr2f1/zJi1N1D8dzgwM1uLcN6rj+zNON9hRMHtHoZbiPF1zyfg
	shfDBCAbK9+1aNUkW5hUPLN8a+ZDQE0iECIqZMyWjrCK4gzp9ml28=
X-Google-Smtp-Source: AGHT+IFvQJQZp5hIxcQ/kGfkBnVxpXqrxsrxpjhwZEJjbYHGciKRJL502yUl2gppViGVoCmsbV0c/w==
X-Received: by 2002:a17:907:1c15:b0:b40:e46e:3e0d with SMTP id a640c23a62f3a-b50abfd6af4mr953221766b.46.1760023508552;
        Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:08 +0100
Subject: [PATCH v2 06/10] pmdomain: samsung: convert to
 regmap_read_poll_timeout()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-6-3f4a6db2af39@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_082510_521442_38DDDE59 
X-CRM114-Status: GOOD (  12.85  )
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

Replace the open-coded PD status polling with
regmap_read_poll_timeout(). This change simplifies the code without
altering functionality.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 383126245811cb8e4dbae3b99ced3f06d3093f35..431548ad9a7e40c0a77ac6672081b600c90ddd4e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/pm_domain.h>
-#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -35,7 +34,8 @@ struct exynos_pm_domain {
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
-	u32 timeout, pwr;
+	unsigned int val;
+	u32 pwr;
 	int err;
 
 	pd = container_of(domain, struct exynos_pm_domain, pd);
@@ -45,25 +45,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	if (err)
 		return err;
 
-	/* Wait max 1ms */
-	timeout = 10;
-	while (timeout-- > 0) {
-		unsigned int val;
-
-		err = regmap_read(pd->regmap, 0x4, &val);
-		if (err || ((val & pd->local_pwr_cfg) != pwr)) {
-			cpu_relax();
-			usleep_range(80, 100);
-			continue;
-		}
-
-		return 0;
-	}
-
-	if (!err)
-		err = -ETIMEDOUT;
-	pr_err("Power domain %s %sable failed: %d\n", domain->name,
-	       power_on ? "en" : "dis", err);
+	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+				       (val & pd->local_pwr_cfg) == pwr,
+				       100, 1 * USEC_PER_MSEC);
+	if (err)
+		pr_err("Power domain %s %sable failed: %d (%#.2x)\n",
+		       domain->name, power_on ? "en" : "dis", err, val);
 
 	return err;
 }

-- 
2.51.0.710.ga91ca5db03-goog


