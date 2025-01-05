Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02F8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxu//ISNcCtNY3FBtAgva/sWf04S+B9CxZogSVZoMPI=; b=pSNxxXLAadJeM4aHNAdTY4jqxg
	vm+b7zXQ2tnj3ULBi2NZkHTzUoBFogKGhdcFBiMR8YLtXPWOADCpMjl7q6DWEZOIQ2I5d3KF3e8b+
	Yv/AFzi0Nxdu107lQ5pppkmTAXdF5urS6oEfT0FbZbpdRo9M0NGW1IM0zclye6D7VZbjAQ7aEsYL4
	cTwV1UK9UxCAdsLe1Ulz846cvsqq0SQqgnQYKu8Qk9JAFNMo1rO/0Ren56KnwPXh/C0VJn7pF28PO
	xg6/32XjJtf48tEPYZ21amgS4McEZlGje1QcBuXa9y4SSVGfWE5HNbSsErnGr5RvjXSGsp28hB8hg
	f6AZuy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOzX-0000000GlFg-2SEn;
	Sun, 05 Jan 2025 11:40:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOyK-0000000Gl8o-3fvb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 11:39:10 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso19978557a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736077147; x=1736681947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxu//ISNcCtNY3FBtAgva/sWf04S+B9CxZogSVZoMPI=;
        b=U3SQkEFgt5jrrzAafnc3PH1CeO8Ny6JzCC8guDUTYpJxehE8jxf7/UxfX3rEPOiFH6
         1Qa5O5VL80tG/Xsru80bvnXlu46ybA/FdCercB11VDxpGOd9/+gmdZQvQBACXIsxvV2Q
         2YNiekcB8nxT1J3W+p5nnLlPfl5HaSO+xxnEOb0zQVW4vMch0PLKPrszvwyB3jsl2AWf
         wB0NKwCJmK/1VP9XA//OVdJRPc9tWzmrQdb8IX+nnE0aLopSB5geDvOR8ywBDHwa4VnN
         XQoqFzurynrLvDXrlmavMgPnR+dl294p9FcFSBiJ7lmXQGLCV8QLleCVa95EmvYLeZ2J
         C2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736077147; x=1736681947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxu//ISNcCtNY3FBtAgva/sWf04S+B9CxZogSVZoMPI=;
        b=WELBpkWxC3/duI3h20l4OarhuzeilYqoe3kLQfw/mFXgXht9l3s/y7HT0hrVfNOC+A
         00kUgQfSkoVQAcYjF9fI1YyI9gtWwh4E/k6g1TxawlE2HIvtjm6D7cETqzXiYysxVY+s
         grM0MIRJaVBlPL65zVxMVRLdXyW3r4EhUtDXaEPodWRx5xUaISnKo5d0WzNYBQs6duG5
         06rODtAEA7bv0N1k8p3o/X5jEtSgDu/7ZXFwlZyQnYbiCl7dLZgZIcD8lieqhjYZwi05
         6KFZUQqJAOeFh/Sq+knxbaHJf4bdJypJojvNHcti01BvKPXmED+6kNubpMZrMm1KS6sB
         FcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDArLAnbLj5xQ6i+1HAwxU6pIlAJdb+CUFipAmVp/ieDa8wJ8dxUGNMpZoJQLLbEhKjQSMUAjASOCNS5TsgyJw@lists.infradead.org
X-Gm-Message-State: AOJu0YwyDHl3PJ+7+sh5nAbJyUiU4iCH2mJohzTLSbGDtozLutYlxBXZ
	OPkgkUNAISIs28XHZKp41i+bM+IeKhPYfYgphZUAB7OIKciSXjAU
X-Gm-Gg: ASbGncuu/65p2xTPdFJSM8Dr3l8MN33qeLZAjNxb0t7lBSkGQWsuXRoiBMk/FljPzJ2
	slgZpaOqJr3uUWpl06sle/2GaD3plQdX8vKDQSD4SoEFTY8gPDovsSpmWkfCqUoVKsDtRoMaV0e
	mB0NYKcCC0uMIl5DC2FsihqEZNgsm5lkaufi7oj/2xGAofGIRXRzno8ptrqRMMNEGI0BupHD7te
	H65yX/DQdcu5KwSquH8hslCC0RqDB8ypUooEEpICUAQt+0xqdGbhvmc/9vpAF6KJHA9
X-Google-Smtp-Source: AGHT+IF0csgd6RKoTCBp6b3WBaRUbNGsIKif1YMuHokZ78M4uOjQYYixcVOoJBLzM102/1S2/+WOYQ==
X-Received: by 2002:a05:6402:5189:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d81dd846ecmr123155836a12.1.1736077146868;
        Sun, 05 Jan 2025 03:39:06 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f1aasm21754982a12.50.2025.01.05.03.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:39:06 -0800 (PST)
Message-ID: <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com>
Date: Sun, 5 Jan 2025 13:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Content-Language: en-US
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_033908_917502_AEB4D97C 
X-CRM114-Status: GOOD (  16.45  )
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

On 1/5/25 13:16, Igor Belwon wrote:
> These nodes were sorted by name, but it's nice to have the same class of
> devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
> This keeps consistency between other Exynos SoCs too.

Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
apply this change for all exynos device trees instead of waiting for other
people to apply it separately?

Best regards,
Ivaylo

>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 62 +++++++++++++++----------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> index 9d017dbed9523e874891f13258d331c3e829ca03..fc2c5049d764c3f50be7337bc777bb9561f88790 100644
> --- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> @@ -25,37 +25,6 @@ aliases {
>  		pinctrl6 = &pinctrl_vts;
>  	};
>  
> -	arm-a55-pmu {
> -		compatible = "arm,cortex-a55-pmu";
> -		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		interrupt-affinity = <&cpu0>,
> -				     <&cpu1>,
> -				     <&cpu2>,
> -				     <&cpu3>;
> -	};
> -
> -	arm-a76-pmu {
> -		compatible = "arm,cortex-a76-pmu";
> -		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		interrupt-affinity = <&cpu4>,
> -				     <&cpu5>;
> -	};
> -
> -	mongoose-m5-pmu {
> -		compatible = "samsung,mongoose-pmu";
> -		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> -			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> -
> -		interrupt-affinity = <&cpu6>,
> -				     <&cpu7>;
> -	};
> -
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -163,6 +132,37 @@ oscclk: clock-osc {
>  		clock-output-names = "oscclk";
>  	};
>  
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-affinity = <&cpu4>,
> +				     <&cpu5>;
> +	};
> +
> +	pmu-mongoose-m5 {
> +		compatible = "samsung,mongoose-pmu";
> +		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		interrupt-affinity = <&cpu6>,
> +				     <&cpu7>;
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-0.2";
>  		method = "hvc";
>
> ---
> base-commit: 7c19e0e190aebd1c879a3913f1a8855a88d73a2a
> change-id: 20250105-pmu-sorting-ec6954b6b659
>
> Best regards,


