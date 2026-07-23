Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92697C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=; b=RzY1OgjBey9Bqal01AGSMF0zDr
	Bk5vTThsJZPjvPlujcwUOTQqvoWOYGfnNLdrVypDtouK/XLlJ9cTWx8bOqSKXeQXrBdYH2Iz7bDLH
	Yli56Ip26x8hHS2m0c4hWq3u88XMChjonnFrlmRzL06/AG1nApfP3cOS3MVu5jNsUOwbrW+tlupLN
	FDlbLMZHMk4KR1YTaXd063dHgQrBnsYCwsR+Qp1D5/yHIh/WoaUsN5T5tt3M0nGXy/R3E8P3mj+PB
	ZYjDToJk3ANsSEbGUvvtGoDeh/XA8fDFey3qm3NqvvIleOMNVk0NgzGHbqv77maNTca4ezg1qWM19
	LrlqQzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wms8F-0000000ECY1-29WP;
	Thu, 23 Jul 2026 12:02:31 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wms8C-0000000ECXi-1QFb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:02:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-69eae037da1so825562a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 05:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808146; cv=none;
        d=google.com; s=arc-20260327;
        b=e+cOSpQuT3jZK6ZwXV9L9T9th4+hX+UjWeJ1vkn67+IpdMoZ2ydCG05i5HhmBrJoh3
         YrjKqHmeE0ew3kEQOw5IwfHHIUSGZBPH/54NTEL1XyYCJ3A74Y34umWjYFidNemr/tGq
         a2ILGDk6nJ8Prf15fxicsft7uCPJCr/V+cDMDy0y8xAEW0PWJxcg2/etZSNpfFYN80eU
         WVetBUV27AVR94oqHQyyiRjn8m1BX3ZRPaVpB2AWb1LJGbxCawqHl16RezQGQ3vtewnY
         8AVf5ne28Tg05rK3kUVhBMCOUPLSpbZ0gpCw2drRhqM8lLIkA8IxSRyN/f5QTc62IWCE
         keiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        fh=zcEVplZFzpfYE+ml5v8JRORnFcWVSprygEUvYzNcJNg=;
        b=il4mwjkqDjjhCBH6jNtcUl2RUXHWWQRHoCok731QW6P1NuWjmEmASsAmg/G/Mufx4D
         oI3+YoRbtbO2psG8Vg6x7SMRtWMaR3bpeWrDoaS3upAoIwJIdP5iidg6w+KjlWatC+K1
         uf4P/38n1D5b0uy8CWKDAsggJUvslvmAM49ZBj6OucMFLp71tuYwdpJo6vy1RkB/dHLB
         DNsLZarNIlujQ48efC8//fsZYJkJUulg2VD/G4wl9Dlqs9NWk2wRdf4uCGt0HJWgdxln
         wkSjkeiVWK8akl6CPhVffqLa7ChV0WFAWl3uUmPtSfNELXJ7h3Fht963JSfIceAXqfJ3
         7j8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784808146; x=1785412946; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=CDCJl7bNNNbuW6B3zGjj34ljCgp279kHa0i8v39zAD86e2ZRsYSPtAy1oI8vq6rHF8
         GHxvnd8rXdC74KovK6xcc2peoRlORMSDwjajSaqlhFy1O2WVm8T2+6i31dQKT2lXSmu3
         s5w5DQXH2p+81jB+Rh+LTVYUmpW+4WEc0qK7WCcFNey/frXSZQEQ8sT2lclgmUTfkPKw
         I35VpDzj07O7ADPT4Tn/F2QasYYoVLBjLIiAZVbfpDOOqSJs86xgElriFXEzGb5/P9Zn
         uNHczZ3MnLWAfNanLxyfDlq0q6Xl++qIm0DHCyM5RFm/wH8G4aE2hgiJ1tWg3/ZJx8Eg
         WRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808146; x=1785412946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=VVtZUl9vi70McE2J1WyAbBytcIRmxvk1ujnkpoO/HwqR+v+MGIHcZB1il9djIeYpfD
         Vox//g/nCR8PGJKqaYcNY8Td4qyWHq1NuPyzqvA9uiGdGdsUF2MPQOgLp4a8DvWsXR3Z
         m4g6+PcmPhlM6svewXok4KswiYGxZcNh9smDjjlxeRVhhOSAeGYdFrW2rn+6vWnpE2ef
         pBfRIY6Wff0CimJYwIegt0aAEj4EemQF+2Juj8AH7s2ITorUAAwaJZsARTEsXadmKKe2
         Iit1XPUh5pDMPHyLZo4svfOETcqjJRJS+q9VNzDNd4PBThyX9WXB1DtPqn015B0V+gd6
         Qmjg==
X-Forwarded-Encrypted: i=1; AHgh+RoWaWL9g+D+rHvwfLz/SnxSf9WuFDbhyFu8NbeTxLpvaNLdHCXDsWsKv7O9bK0v7tSKlxqjnwKsym1Mqn+Jf2in@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf1JeKgNcIecqFx/1fwnO4qT8B404+eCZ03m38lB7QizG3iEfJ
	7qsxMaeaW+k7dCQt74TpF4oD41qCQEWkQiAIhSDrPDe2RWdpDRRFCo+8afxRGd+9GhNGAjtI1Im
	mvo0QBX6rmzjtfPtqNk+kQARY3163ljgi3Znv2h1DDA==
X-Gm-Gg: AR+sD12aV6LeR5ShEtlFcVOzVlVZrdydDKVx+C+EEWlHAoj/TWuKikXAg3ueuCOcb2C
	06cWkCDryccM4+ShGeLkK3/PsAUd8GPK+QXdAdc0PAnpapFCh7hhfmiu5RZM2M9v0YC6nnWDePS
	Chg+APk1A1ZJoWH0GiXSYNpx43VM6SLyndZ2FijqSTSbj+X12B7Y78dNAFQHQCdaB/S69KPwvD4
	aMFXzO1FsVUii4nuOh7RKXlZFVpKL2Fm8w6m6Xj58kVRL4PioPFOE6meqk0zKqhJ0WAdYh1U6EB
	fT5mKBLHbq12Fwsm4nyq
X-Received: by 2002:a05:6402:3241:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-69f6bf1f611mr861984a12.20.1784808146288; Thu, 23 Jul 2026
 05:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro> <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:02:13 +0100
X-Gm-Features: AUfX_mx4AjbYjM6fZT-ntJeRozz1HqK4uJ3kqrvaInoQuZ9gHqexg1gg38S2Mz0
Message-ID: <CADrjBPqSc8kuC7AUg34CKrVSbRWjO7i90Bff0b0P7nOc+m=PCQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
To: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_050228_420080_30052FC0 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

On Wed, 22 Jul 2026 at 21:44, Alexandru Chimac <alex@chimac.ro> wrote:
>
> Add bindings for SYSREG nodes (required for ACG), compatible with the
> standard syscon driver.
>
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

