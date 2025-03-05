Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBD3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=; b=wXU3/F/NaGmzdM4v39I0CLy/Ps
	9dy+Cv35NObyvKQgIkrQtymaK90duhTA/zH9SWIvMSU1JqPjXAFos+AzIBUTCBge+5A1woMQUhOVU
	E43EHQ7FeHFgX2avu5GbPSFE5cMZh9lg3hk5Hj78ftjEhNwmO0tXKOqBhlClWWdPiMDiyjElbWZXl
	OBIk9wboc6t4qUFLY51V7FQ2216aOImIE6ZewPKnnFbcrw5j3phw+Cb4jQ8nPzsW0j4CQIOtYVitR
	9GeW5pA5cpUfwKOZDGadwdpVSbjlXSc7vr77TsxwuFUHA+oeM+kJFO7Aa5KK9lxideO/ZnVB93RFm
	p7OeZUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwil-00000009Q8B-0Vg2;
	Wed, 05 Mar 2025 21:56:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXG-00000009OSm-00SI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912387cf48so63710f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211052; x=1741815852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=;
        b=LU4IySLIh3oVEUE10d92FGpXj5QA8vfaJ0RQqKoPM7mt+81zABbQBNgL7hSsdjG3jl
         YYRVlOyNy5DLpp2eK8uKbvNrUyaxP1mSAhaOhwK/gX2YGjFk3678dBpYZ6OTmWUGweTz
         dl0Qr8NkhxWHnS5nGUBIwoZKUav6t5qGJmoAWaJXQJblNp4/6467f24X/Wvn2JjCvAHe
         w/P34/aiY6srDl+nEzXTV8h+5rBABP13QZLLHPHstr10AtbBANxdSzqzHc+XxU/dYMBs
         ReWM2pakuhzZFnwp3KeCb+Na3g0U2NC4y/SJKNBvYSiIde1Jd6rs9T4WpEs9aGQFbk+J
         uCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211052; x=1741815852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=;
        b=aItpFhh1MC+CaZLj5Hq7R/r7qkkdmdg/Tdn9xCyLtpkaS9StilLksC6+FuHvsOAhAg
         Ckfs5VdQo7msw6igXPFIK86x4MWHB31xBxEnpDn5dSzcUwMj44DHX/H6x7TzBRKp2mTl
         vLzIjCGQJeyzGFskevm0f38UYBFs8fD0EaVeXJZZT9LWV5r5cqqpfiivDd2zPXbKs5mW
         jLYcNYfMh9uSXFjskFXDhtHqj7ctS5rztUOGDrEVhh/u29ndYxPamR8kw+dN67fEdwg1
         5vCZSqSSVp+0eVg0ClN6qIaI3X6HCC5biFDbEfabE5sMDQi+TykX8lgOYCu4/cKoYZBJ
         h3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFZKU6uyBMXA80peYjM1O9mH3cSZRAk8k1MusdS5FAtqOzpiEL5XYrU10C49v0PFvZRoEWB8Q9C6+1k4NJjvMc@lists.infradead.org
X-Gm-Message-State: AOJu0YyBAww3WDSmdriz7TGNzx/BLkFK3TrOUWURQYrYVTmt6Dk7mGAE
	yjmciEnzxeKAgS7UtAiS56zK5hNWhwd6ZtRX3yfx9kwWnwfBv6JgnChkrfmfzNc=
X-Gm-Gg: ASbGncvsNikh3LOfOUtjFPRmOmF0+IB57656X4o02Yx+CiktBj3xtuQxh923z4kZm7x
	C5qXZz16bCC5oD4Z7PC7ypR6mV4q5ug63rTHYNuHyf7OcAum69dEyHbUBUmYw1IcyYpnMR3DTqB
	jQH7K/EUL2ENosJiD6QZZKc69y5ZHZzaa/OCoZqVLz592HSQD/RFgQCmg2uwsGhXlJuy24jqGML
	CzRQFzFNNoK7oNXCHPQMIlcHYU8kOGYaAgbGn0TE0sVXA9c8BYZHw7a9UI3wYbGJNgyDR4ikcGO
	3olm3wa3hX73fx8+fsu5Ygk3i2602xEiOzJGwTv55uNFcrCyzSC9GhP4WiRK
X-Google-Smtp-Source: AGHT+IGU5f4CFfN52Eji+qJBgn9yLo2zeYNv+sZvVOANxwUJnTo17xDP6bdyENJM47mSh3r+31a2Bg==
X-Received: by 2002:a05:6000:1f88:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3911f7b2c38mr1483785f8f.8.1741211052257;
        Wed, 05 Mar 2025 13:44:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:38 +0100
Subject: [PATCH RFC/RFT 03/12] clk: samsung: exynos5433: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-3-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mXOe6fwHovvLXqqthe9+GQXLrhENIXsJm1doaVUDONk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWYud3+m8P2UJvxkM+EHo/GfYaZm7KB6mDdI
 9TVoiHY0OiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmAAKCRDBN2bmhouD
 13+nEACPnS35jbBP3i9U7AQvyLAnMz3XKRsQifaM7t8yYT6AfyoMEXcp3pG5SLgA3pVqv5ha1lv
 52C5BQr5kJ6P+NK9X0dkjtP92H2u6fubKR2rg4Dtk6RupP1xgdAAXdd+3jyjGRSFD+i2da9QjAj
 +JxhgxtCX5WjGFM51N5aJ3ryOAAq9f0m7Y67sD+co88ThBlWXrI/6wvaRIQjEvdQ5Vjsp37FrsL
 VNW+Gz4IC21imJje2I1Q48V4M662YCurNx/VWRN+ESe/k9MHsqChh+8K4Av79mQHcgmjePUSY1j
 72r+YZiq9GiMZeZT4ed2j9HdTDA5DvHfFdXu7ekCZLrQPzWd3+yI+5Tb2L0wW+VOlIWU1BMGqyc
 PpqlZBgckDKYZnyH7Kx4HqZFkCZNbW08ekfhT6LGncLMBtadr4GdO7hpI3xy2V4IQ9mZhPxUyHE
 xj8x/9xy8bmBGu0aF7ZUxm4ufQUsB/AMRM0PQ0fnMDVfOnyvURmH9bGkcz7qp6z3klJvx/J7I5j
 YjMpjDQZGoJjcDqu6G+J3NYY6iNrYgQJq8W+W5oQTIEyuzuIs4B+l9O3xH14ysWXH+v+TqoRhWp
 Uv1n9ppucj8g5zRIepffyZg3m8837UyxgsFw+qWvdQEUyLBKnCjPnXMVSo8SwNPQvwoJPQWbjVw
 zZz63fp1bPZnPGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134414_045369_C840A378 
X-CRM114-Status: GOOD (  14.44  )
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

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos5433.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 609d31a7aa5247e6318884609d1e651001616b73..d18b4f7b96b66e48fb94b86b663443ec691e968d 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5555,18 +5555,17 @@ static const struct dev_pm_ops exynos5433_cmu_pm_ops = {
 				     pm_runtime_force_resume)
 };
 
-static struct platform_driver exynos5433_cmu_driver __refdata = {
+static struct platform_driver exynos5433_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos5433-cmu",
 		.of_match_table = exynos5433_cmu_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &exynos5433_cmu_pm_ops,
 	},
-	.probe = exynos5433_cmu_probe,
 };
 
 static int __init exynos5433_cmu_init(void)
 {
-	return platform_driver_register(&exynos5433_cmu_driver);
+	return platform_driver_probe(&exynos5433_cmu_driver, exynos5433_cmu_probe);
 }
-core_initcall(exynos5433_cmu_init);
+subsys_initcall(exynos5433_cmu_init);

-- 
2.43.0


