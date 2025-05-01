Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1589EC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgwakmqHlp3M4BuHJh0II3nl/7c5y+mQeic4clcaFRg=; b=nSA/PKVVQVhTXrHb5Ud+WCl4Iz
	VzYg0pz4lXDnfS4z+M2z+5dZrcXoBRgTZa8GvvJCVDw+1d9wVUSzvL4XK6qx997wWJOYfOuPSvkae
	DrQZib6nZiuoPVHsip28NnydhGuQWHj/YFrPt1Dgz30WA6I5qZm/MPU+0N9PYqXJH4XRrJMlKv3uX
	HsbLGXWstkfc5B7djfCRYV8P5DjjPNXsccU+gn0e5+WjM1tDPl2/+wuRdqxzNKXYiTaqs4Iaj3p5v
	iinp1IHosRa2s5+OqwZvCSDqKmh+A5MSelbQr8kzfXrfAXdybs+vpt8Cs5SORem0c9LHiIIT7BWhm
	T1578A6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASoC-0000000FTra-2gmt;
	Thu, 01 May 2025 12:14:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASNP-0000000FJbN-49yb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:46:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso1096435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746100010; x=1746704810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgwakmqHlp3M4BuHJh0II3nl/7c5y+mQeic4clcaFRg=;
        b=yMZdsoyNZmldWxDkm6+LfNo1A1feUV+YF/Jj1/xX+FGDJL9Y9vl6c5rAuCocv0N7//
         h514FxZKQwlMzNZrKu3fagYjYIOUEVai8tBB9qLZa0uNQv1AQdmojDzwPkbdcjnDEacJ
         3LlOCvXK1mJ//CvGNq0llKQLGTJNGG8hEKDlpOawRfEK1e52R6EEDjZEkbcueMX8DArm
         c2GJWWTU4x3K9x6OTY/rrs2wpC1d9kPIUIaQtncJatCFnFPfH5w2CQIekUGgzmrkqwrt
         DyJc8NS5WXjTcT84JeKRz3L1KGW+vIkwrGd/wrO55jP2tsU58u2LgeGZykhVG1kfji6J
         +m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746100010; x=1746704810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgwakmqHlp3M4BuHJh0II3nl/7c5y+mQeic4clcaFRg=;
        b=Nd5o8G9MPHNtfWQiKOd77QkIFGPG8f3rwvMA4fJTLLBAedICUHPsC3WJkq29Ptq1AT
         X0zv6eb3A8g4kQoAVaj4qOVZN66RP/FdJPuYIb6Jxc6QLnQDG8MOLbAWvRKYrpW1wsVN
         2LIdZM60BQOTgxaGmPbZ8o9/+w9MgN7ztAfecjH+ulSVaWSaqaDw9ivxPprkzMJ60NKw
         O+elK253q76a9i7VkwVXgFvTiMBB36E+3EX+UC8FNroVVAwa3ArlPmWh5bWIyQO79ls6
         NcISxPJtAELifDmi1XBXA0abhicdjkMcaK+oxgNcuQrDyNvLprb/EFuEnGMMndZFsxkS
         4hgw==
X-Forwarded-Encrypted: i=1; AJvYcCVfhafH4idI1m3poiI6uDyR95q7/8BdsH8eI0S3I+RFnZwvUvRlhW2nYBHkQK7jefP/jnPYe8EJSVkQodUvKQ0+@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWJA03PLiJ2x96T/TwtxRvRiQLjKmfb8s9ZU9ssy75wL+Ld24
	goHd6FjLEFefiemM/1KTE4kD1YIO/TnM4UylNXnxQ/uA8Qk7aTJVdAg8lLtmI/I=
X-Gm-Gg: ASbGnctXwyfUEv/MMBIbEfRjAOi3KoZdFrcBdEHTYHduOUGpKjwJorT5wm/CSho+hLf
	ubYWE4mdgcVuKmxP4/uzJ3dCDhCqV2U+US/aVuEqRgTgnt9pdOndl8RZ6MADcxn7PHIHAnv14YM
	TtUzeB8ZGoCJYXRRXEq6Yh09KIHSKJaEwWPDFe9jENACJrVDirOLTselIl4GjgG6gOdEbjst0lh
	c0pN1V3/v6ylGK8nX2mRzxSOj9VbrCesOQPP4Swn/3mC37+rvdQ/0kZ4O9eHtgIYy3Gv943C+HP
	Ab/3ABDbepg5DXmwdNziHySui0aURfQ1Kgadg0k0uPBZu1le9LtB26V3xVY=
X-Google-Smtp-Source: AGHT+IE19/IV2sTGx5RIWEjQEneEcVM1DQ6fXDyvBd3U1JlBxsPULPZVr3GiI+mJAGk12V9wXMS3lA==
X-Received: by 2002:a05:600c:a281:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441b76d51f5mr4498065e9.9.1746100010177;
        Thu, 01 May 2025 04:46:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af306bsm56097115e9.21.2025.05.01.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 04:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
References: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
Subject: Re: [PATCH v7 0/5] Add support for the Exynos7870 SoC, along with
 three devices
Message-Id: <174610000860.28558.16541132218843175138.b4-ty@linaro.org>
Date: Thu, 01 May 2025 13:46:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044652_047438_66E961BC 
X-CRM114-Status: GOOD (  10.64  )
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


On Thu, 01 May 2025 17:02:56 +0530, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      https://git.kernel.org/krzk/linux/c/004bd8536cb9d56cfe2a13a6e05a4a1998455b71
[2/5] arm64: dts: exynos: add initial devicetree support for exynos7870
      https://git.kernel.org/krzk/linux/c/d6f3a7f91fdb84f286d943d89cf082f43fab239e
[3/5] arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      https://git.kernel.org/krzk/linux/c/61296c6b604df4409834eec0bd1115ddbaecb921
[4/5] arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      https://git.kernel.org/krzk/linux/c/d5cbf26a5c8f57536fcb782c8985a83ca16dfc7d
[5/5] arm64: dts: exynos: add initial support for Samsung Galaxy J6
      https://git.kernel.org/krzk/linux/c/fc581fae50a2d9777a4056c07a62e5f0470b640f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


