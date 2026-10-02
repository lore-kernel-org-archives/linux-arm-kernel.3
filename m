Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D61CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=; b=NVYUmUJXqetGUlubQbNIglNa0I
	thiyBja05d9NuhXZH2aY3IL+ge9h8L+m2YD87vFt4d1NzuF6IFt9CU6QfN9zOaIPKkU5i4jVJp6zb
	AwjqRDyKwZSfGn3h64eSbb4oH7+KjaHt5e+8WbrBp5fRro2mCSyxsloSWWcBR3rII6bqvUXYHjiL8
	i6uc/MW8qJe5XUQGMWdWKHNStfg84Pksjm0/0c1J2et8EHUkq6Gol3JTSzb686QIQ6YQTA6V+gHam
	PGP93FwgLf/1subSplklBOY+KJXypoUyL6Z26Pp2XO96NEmJwBFQpP+vfEEYuWuZD3XjjRUtxWf5z
	yZcBMd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeJl-0000000BmlE-2ujI;
	Fri, 02 Oct 2026 14:32:57 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeJi-0000000Bmkj-4Btt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:32:56 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso6454427a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951569; cv=none;
        d=google.com; s=arc-20260327;
        b=oPiwcxWe+qpJK6rVsjqMMXbQZj1536h1rQyFXWdeHg17IqvGfU2zlG9rcwkVnFAtb2
         FVZNPODE3dnOjjPbeO7OQxAkiKSAp4nPX46NuqFqsbIGvbUtzHzBAdA8F8JZ7OhSept1
         Er9IVd/L0cJQyBiR67YbA3KucIjSmrutSb85kjK0HwoKKpSO7WXWdKkKgGkeNrzV3qqf
         vArMiGOTpxo4xY0y/RgBVXOjulkgwnZIl9kEQU4G/6a4684fD97RoZAxIKZGTs2etEiK
         ya4UNhAtWybEr1qYZL2VgrlmzAmkykJDnoLB60CQRUZ/uKOjyREODhNpde5IskC3cV1/
         KXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        fh=8umEt42llfQHcJXtmFPojy11y3ahiicts1Vpq2Pr2Vo=;
        b=GVfxitbgBjf7pKJL+6J2hQaxf5cpyJJ0ohjlo4p+dy1zEavazbxLphVSE0Cp7WbS9D
         /Db3+7LOBn8rhekcxUh6aEv+orK0SeVk65xp2NH1bGwy/2h6ChcFVr0zWdwmrjUetCjU
         giu/o6Puy9h7YUQbUoU/Hm5HdU9++27UVdfUQzMZx8az0Lwj0rD6PF/GPeAksAcjLLaJ
         nuXcSJ7MCt4Xuwf5KaanW7u8Rn9PXWw9qDLW2vKg/ai4cMR1oGEpp53gIpBJQOb2Xkx6
         +pnsbe2+lFXayR7NpDAl/0dubE+6bhFLCEfILB9pvDANLzgCsguyYc5GzVwPvdDvbbZC
         kSew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951569; x=1791556369; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=blGR8NWWKVub9G7hT3ehvDlH3SLa97mvd3RphiqI5q8448BwGm2OjMqDRUr9xioCe/
         5RFE7aD0hXFnlYB75zlznnqZb65RV8d11KzwBjj4JUGo1DILNos5PzB/V7tR0s0nIaIf
         kcBJscZC4XmfbJ3Er30Ou4jw/ChsPYIJv8Majdc71Qi0+zOBqTiSKbU3/Fu/CLzATlu9
         zWsygpt1JlhUvbHG/r3NAe5PqugzQbE5gvKn4kMkkGwfTarBdm7swaq4Dszyb2KEePRI
         ypgVm3xgfWKlpBkOheuU5tEVAZYu45dpQQla2gCDWVyWQ1XwplkEPusizfLyJjTa9S1X
         E7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951569; x=1791556369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=HLX6vbkxYrVr/dOlYA6YdixDHFlq7HnAUJVNip6RIcXcwvawKsXZzamkAwej16UCyl
         T/wAEk87WvoV53Lbw/hChmfTh5cJ9U42j/xge7GB3cRNO3YmIHsd3eYnpxm7Acd842v5
         u6z/ba1305I3aUSKChF8UECDlIswP+s2DI1jVH9LYWSljWEbSVDRvqbzpExHLxQjda/T
         2hfkeQnPT0XyHeUgbVFmhF8fevXuFqQAm9vt+9bRXFCmd28cuKr/pgVYueiANAPw7qLZ
         XcF8DwhTHOKucv4v5CX2bT9FiM+xRe54BrKKI8CtdKISZotmnA0WeMXMpTdJ4+d4ICHe
         HDLg==
X-Forwarded-Encrypted: i=1; AKwUvByqcfqB+bP1Z9pVrsmfDnmj2y3BP4ObnSxFEX1xhuKULkAW8HLk8HIW2ccsez/2vIkjEOAwvvCJUbYTvusR1TDT@lists.infradead.org
X-Gm-Message-State: AFq9FYJDlJvhRXjLhIn0f6ZtHVKRFyvh8upTDk9/ecBfHuXtKbsxLZ7f
	1kmoXyQ3qgbaYarLtFiYnIEwJ0Vi72NNp7KRMQOLGWtNPA3LFSxQ3k+1yZPyUtC4epN0NLO+V5v
	Uwvg+lw3FoVEwjFrlqiE24ZPWyJYSanApYkY25RXiKA==
X-Gm-Gg: AYBFou3khGah5z0SiiLdOiO/Gx21xdluNuyBccEnJfedMDYnZEjzjA4yIjH92X6qNEQ
	vMunkJqex44g0gKHqjFrtIRDAg+4ewhmsivvws2HL9NGWkryqilh7Xb8eYRuktK2AMsNHLYsYNA
	Oe9kbB9oISQY8EpSixAD7gb9+uRF12baPtph+FuXKarT2ysfRw8rNjTYH3gHLF/aOsjgaJcHb25
	IDahEadbld5c/RZj9DhZjyrldfcxN5RF6BJjFPeBLPNv2CESQ1MAHgUsEcm/8+cLqq8wkrHOvOe
	2S9ef/t24HU2SvpOrRGQFAHfCx6Gs2iSge7qBDVW72wUXq1dv8s1uQImw7pXml0DRjxM6cqgs5W
	IwN3FEIN/Q/+qKA==
X-Received: by 2002:a05:6402:27c9:b0:6af:9dd5:f524 with SMTP id
 4fb4d7f45d1cf-6af9e312059mr1764408a12.37.1790951569540; Fri, 02 Oct 2026
 07:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:32:38 +0100
X-Gm-Features: AclHuK8RgbuTKFPwHvZ2diSbOtgklcZExTKeCVUevkgRzFlX0CzGjFVcTRb15lQ
Message-ID: <CADrjBPpOcpgLeRBYaf=RtLecjBEWK32icf8DcY5d1F4GQJ=WVg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: exynos850: add ADC node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_073255_355574_ACEF279E 
X-CRM114-Status: GOOD (  15.48  )
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

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
> Add DT node that describes it.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..eb87225a756b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
>                         clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
>                 };
>
> +               exynos_adc: adc@11c40000 {
> +                       compatible = "samsung,exynos850-adc";
> +                       reg = <0x11c40000 0x100>;
> +                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                       #io-channel-cells = <1>;
> +                       clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
> +                       clock-names = "adc";
> +                       status = "disabled";
> +               };
> +
>                 cmu_core: clock-controller@12000000 {
>                         compatible = "samsung,exynos850-cmu-core";
>                         reg = <0x12000000 0x8000>;
>
> --
> 2.51.0
>

