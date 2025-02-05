Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFE3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNW7uXFJKMR9kCFEqLTGkFIRk/6qrajv5bHRhgQljQY=; b=ues4oMBgPPXWRNUHOHYBqQKmt9
	h2J9nDXmD6L9OHbd5S2rJxZIcNIHhMu7/BtXossHg9szbr2sdaueuEy6BgjYgFF2Yi0j796eZSvHi
	FMPgXY92D+r+XYuCW7bMInyXKxie1KS2jcFnCIJrTyOGzqsbTLx6/Om/bAXh1WeY8Wvn9l4QolmPa
	HDIs66EY60R2+QVvb4PTC+z4KM1usPJBtOBBqYI6aKZsy2VMdEpJky2gjOsXD2C7ZhhO7nuaOhIN0
	ZKSCb7V2liAOYjvC97fsHR7nJSb0mEg2vuyau8IbD/4cQu3TVk7XeaG/kM5BHaksbAO0hjU+bb/dS
	vZD20qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfadq-00000002ZRU-2mYG;
	Wed, 05 Feb 2025 08:20:14 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfacT-00000002ZIb-38Yh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:18:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso1293057866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738743528; x=1739348328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNW7uXFJKMR9kCFEqLTGkFIRk/6qrajv5bHRhgQljQY=;
        b=NjLDdvnDXjJPEZay4L3Xyoyi+zLo09NWAhNNYAtwY8aQUaf7iSXB8Rb2hom+1Fbv0k
         TWN7nkXM3CxvegkZnChj/ke4N2HLyPaC2lHD6ALk3FtERpcwSpGzskxNTUmP16mwJJ8s
         eVIMjtTMcWizwSolQu39NmdUYOUZf+PXGDCe4XivNYpQLyhzkRd+cmamHCH2ZhkCyFgP
         NbOJnN+1mQ2IrspGF8CY0H5T1nw0MMR5ukRQDqzcLvDAUFMe8rgv4eGaxAqoMRTs/SXP
         o+rZLPEMChDZATzQIErGMnRcmVxn7uKT85lmGdW7DAOqvwNflBAwc2g8FF3Ax3xby/4u
         b3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738743528; x=1739348328;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNW7uXFJKMR9kCFEqLTGkFIRk/6qrajv5bHRhgQljQY=;
        b=aUs/GSPDZqyZk5NVpZ9ATeLOOYD4msLKMaFXH6zsR67a9hjO9Ai9jCbkyDqJs6shb+
         dsqkmcdcWXxuHvnoadLBCNZyxHpeLLO/R/l5OhmsX9PcuU6flLWRuoMY/+4vOXnkFj8x
         LQxMCZqdFTjVmkDCJsLRowKGVkAd45pfsVMqv9ieBpW21Z1U3lAbofEPXZ4KB+Jlj46L
         CyLeC2r00VIm3zbUPHLSh4D0TBPMlinmYrOGMDptTkiO5JV1173WoBWMOnk4qqQaLinC
         cVkyA6IBnxIsnnMp78y1SFY90eNXsyp2iAKEyeRJ25WNt5qPkKq0aN+kSdVsqmTM0iUe
         9jbw==
X-Forwarded-Encrypted: i=1; AJvYcCUdkzyKCB7swZhwWX2gUiCYXl/gjJKw3eHZnPR4ACcQOzaZUH9W27HXVB7ORGyFBLy+5EJEYbHlz0mUSICaII4a@lists.infradead.org
X-Gm-Message-State: AOJu0YygQx3kvAXOw0M06X4bjy574u6hU+ZZDpxuUvz3Z+r/uOO6aPuI
	P3blGlOhWMEBZErUsWXmxkedcvKCStAZqmCloVscezwR8VAyB5nw
X-Gm-Gg: ASbGncudMZtkfL99NR4gHkGYkx8l3KsCrhnEfkL1fipw7fgegw1qwQXQYsd+rXIymhX
	VhY1Ea94Bw7EXFuCzFcVUz1kj+JoaGACrHQHv7/v96LRczHsGhBf1YoaXNugMS4pzvzNBAbjLXR
	zuJWtScy5fc9stB45jxuM2xmzIgu+2z3EXAGTmU4D/nCtBsi0SDZvl+kD752MSfYlIVlYFFkKjA
	jhHDTK2bZfDUMj/7fY+FGlYNLs4eOrhWA3qMaASNBVhPssgTv2qdCDJViNa2TkXCccBjT2F04C+
	ilzGnXuH49FlK1Da+8DOgH/h+ONkd4uuVD5s2Ry/m7X4zpW7HDFau+sLfjV9hBHLqrlz4w==
X-Google-Smtp-Source: AGHT+IHDbLiE7YoVUr4CvYmahaf4zTpaa81sGHBgInIf/ZKG021o5cEBnKKzmiCc6pqVQHocIMOaAQ==
X-Received: by 2002:a17:906:db04:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-ab75e34dc14mr153610966b.50.1738743527521;
        Wed, 05 Feb 2025 00:18:47 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7008b2c04sm852094466b.33.2025.02.05.00.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:18:46 -0800 (PST)
Message-ID: <dc3dcfe1-2706-449b-8622-2783349e8b41@gmail.com>
Date: Wed, 5 Feb 2025 10:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: update all samsung,mode
 constants
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
 <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250204172803.3425496-5-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_001849_799216_12C12409 
X-CRM114-Status: GOOD (  16.50  )
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

On 2/4/25 19:28, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +++---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 +++++++++----------
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
>  .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
>  5 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index f1c8b4613..cb55015c8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -651,7 +651,7 @@ usi_uart: usi@138200c0 {
>  			compatible = "samsung,exynos850-usi";

...

> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> index 387fb779b..b73c152c7 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts

This patch won't apply anymore since gs101-oriole was moved to pixel-common.

I didn't see that [1] was applied yesterday. I could make a new patch that
also covers these changes, but I'd expect the rest of this series to get applied first.

[1] https://lore.kernel.org/all/20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org/

> @@ -161,12 +161,12 @@ &usi_uart {
>  };
>  
>  &usi8 {
> -	samsung,mode = <USI_V2_I2C>;
> +	samsung,mode = <USI_MODE_I2C>;
>  	status = "okay";
>  };
>  
>  &usi12 {
> -	samsung,mode = <USI_V2_I2C>;
> +	samsung,mode = <USI_MODE_I2C>;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 302c5beb2..473db46aa 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -825,7 +825,7 @@ usi_uart: usi@10a000c0 {
>  				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
>  			clock-names = "pclk", "ipclk";
>  			samsung,sysreg = <&sysreg_peric0 0x1020>;
> -			samsung,mode = <USI_V2_UART>;
> +			samsung,mode = <USI_MODE_UART>;
>  			status = "disabled";
>  
>  			serial_0: serial@10a00000 {


