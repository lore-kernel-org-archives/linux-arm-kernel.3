Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11C3C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8JJUa/aNAV/P70L0oa1PWI0esDvQnXBP48aD2W+hbQ=; b=qbkGzbj8zi9CLI1GgRb2CKlx2r
	jKxZY4RpPVCq8i+1Vel6az6EWVnERNdvBPbChUFKkzD/1ahaCho8fj0TXEqI12mF4PwED4cBIHKs2
	ybqIxppa1/YE9Nl3qYUV052zdPO8O5mg4Cn4V3gSPjKwExjHVR/OmeGKE7Gc3kruA/+m8ifOW6cii
	0Xahs1IQbrXKgiJOWtfSx87zyTK/iyx8Y1SB9j7+be12SZlGg22/j7VQVU3hzKO7CQt6XgQbz4quB
	6FHfXzkMe8qZhcqJzlXnH+AHMwvxy6fsE7cARBray8tXV103q03ZmllaVwwsDkc45Tz5FKa7+KjM5
	e2/+TVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYtE-00000009MHw-2hv0;
	Thu, 30 Jan 2025 18:03:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYjp-00000009KyN-3ErL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:54:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so766427f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 09:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738259640; x=1738864440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8JJUa/aNAV/P70L0oa1PWI0esDvQnXBP48aD2W+hbQ=;
        b=WfPKQDYOYTSsu/ZAYmEnnCVWR8UH6f7wqd5XEVyERFSUEWzYI4TUQa39U4taeIm6Cb
         hnyRCeYTOiT+CgvBHjgchTLTT63I9nuUjoRCfjdttMN1rxTnefBbyL+3/DIGQgxSeYTN
         kLIbPInczlMN0KgCgKUjtw4OBoG9JRdpOkOWSjZmCHsUy68SSBihOj/UI2kqLonBm0KD
         94hKUgL2dYFGK1Ni8Z0sAX0q/QLBMua5oyHVsRqxliSNkodCDvMaPV3TrbnVc6GMThAU
         DjS2gqFCDC82OhYZLvhMnPlbDHa/NXA0n1HazSWCUxadKZwU6cV5nyFsphaCjFCN9pOh
         XyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738259640; x=1738864440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8JJUa/aNAV/P70L0oa1PWI0esDvQnXBP48aD2W+hbQ=;
        b=bvZ4HzhcGN3jTC6VKbJkXF58KEK4w0TabXnNA9U232iaHP53ns7iMR2tvouodGLP3a
         vAGX9kBBJLFGstsEBqwbFbnghC3PIBQtUsmvGzeqjLdtwIToGgvEowbHu23FofpJdp66
         fwhtdtdZZ1OiK8ztM41T8o2C8y6QTzf371tsyqsoUucNN9/YbV9eGeREa7bxEBhfS5XG
         TnEfR3PBs8dkImS0qBAMjTv50XRGzhJdHVnZab4jfP9u8y6cGl8FnQP8bwurm62v4BiN
         r7b9oBIGMF9QVpEq+3PA1oucI1fL2m1nOV2AEFAuhwmE42oDTJpx/w6Gk3jBFaWJMsoJ
         NvoA==
X-Forwarded-Encrypted: i=1; AJvYcCX+jr0KwzfHcYQepB71cXc9ceXCkJsN1Ug32Aq75UTmhU9fBd8oA1J7Crctx5Mbi3q9kCB94ID7qqoli2bwh5Sj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn2b6LIZp1dG4tkyEVFIkBg4AzsisHxd5Win1eRr8B5gH9wk9g
	ix7z/GRcAL+CKabXMTsDUpMw5YFtvrWoESlv8mdMcijF1bIfgpB3B3N02NNC1P7kLmc+4PyBp1e
	s
X-Gm-Gg: ASbGncvyT0R1YLuFSoH0hlWLuunOs6isf/OPoOtj3w+xcXKo2YS7j1WQlv4p/9N2znS
	/lDN17w5C7SUZL5DEzJRKd4fchydAvxPRtzOmKJ6lqfd2M53fAG6EiGqmL318RyAUgnOWJq9cRf
	DDJhS3YBse3+VNYpzGuQI8IAOPrb+evVOAWsUXxDF2RJakE772Srnf7a1OZdmZwUq8O8rTp4IBo
	lSLmUU5hy5GqVWK4gCsydTKeOnGRijvA2oHQ0bxnU18o8n0HnkWaLa9+L08jw2e1vpR8mw7MWgr
	vuZcLzXKKtShVEypch4bhTpG6KA6cfkW/UbAjs/sNP/6iGt3VF0n4cE=
X-Google-Smtp-Source: AGHT+IE96tMjtmz3u9v3Eic5ID5HrbnpMbVJNYNsrTeZ4kPIWPh0vN3o9LQirB4Tqm2SD1jL2Q6Ung==
X-Received: by 2002:a05:6000:186d:b0:38c:617c:ee22 with SMTP id ffacd0b85a97d-38c617cf0c1mr173456f8f.54.1738259638478;
        Thu, 30 Jan 2025 09:53:58 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm65847425e9.23.2025.01.30.09.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:53:58 -0800 (PST)
Message-ID: <034707dd-e6b1-4a39-860b-b972fa438645@linaro.org>
Date: Thu, 30 Jan 2025 18:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a08g045: Add TSU node
To: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, ulf.hansson@linaro.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-6-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250103163805.1775705-6-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_095401_818968_50A6BD41 
X-CRM114-Status: GOOD (  23.54  )
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

On 03/01/2025 17:38, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> The temperature reported by the TSU can only be read through channel 8 of
> the ADC. Therefore, enable the ADC by default.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 43 ++++++++++++++++++-
>   .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  4 --
>   2 files changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> index a9b98db9ef95..fd74138198a8 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -205,7 +205,6 @@ adc: adc@10058000 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			#io-channel-cells = <1>;
> -			status = "disabled";
>   
>   			channel@0 {
>   				reg = <0>;
> @@ -244,6 +243,17 @@ channel@8 {
>   			};
>   		};
>   
> +		tsu: thermal@10059000 {
> +			compatible = "renesas,r9a08g045-tsu";
> +			reg = <0 0x10059000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD R9A08G045_TSU_PCLK>;
> +			resets = <&cpg R9A08G045_TSU_PRESETN>;
> +			power-domains = <&cpg>;
> +			#thermal-sensor-cells = <0>;
> +			io-channels = <&adc 8>;
> +			io-channel-names = "tsu";
> +		};
> +
>   		vbattb: clock-controller@1005c000 {
>   			compatible = "renesas,r9a08g045-vbattb";
>   			reg = <0 0x1005c000 0 0x1000>;
> @@ -690,6 +700,37 @@ timer {
>   				  "hyp-virt";
>   	};
>   
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&tsu>;
> +			sustainable-power = <423>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&target>;
> +					cooling-device = <&cpu0 0 2>;
> +					contribution = <1024>;
> +				};
> +			};
> +
> +			trips {
> +				sensor_crit: sensor-crit {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +
> +				target: trip-point {
> +					temperature = <100000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};

1. As you specified the sustainable power, the power allocator would be 
used. However, it needs an intermediate passive trip point before 
reaching the mitigation because the governor has to collect data ahead 
of the passive mitigation trip point in order to feed the PID loop. This 
trip point is not bound to any cooling device

2. The mitigation temperature is set to 100°C. The MTBF decay factor of 
the semi-conductor will be increased by more the 100x times during the 
thermal episodes stress thus reducing its lifespan considerably if it 
hits this temperature often (but I doubt with a single Cortex-A55).

3. It would make sense to add a 'hot' trip point so the user space can 
take an action to reduce the thermal pressure before reaching the 
critical temperature

4. IIUC, the CPU does not do voltage scaling but only frequency scaling, 
right ? If it is the case, then it is even more true that the mitigation 
trip point should be reduced because the frequency scaling only may not 
suffice to provide a cooling effect


> +			};
> +		};
> +	};
> +
>   	vbattb_xtal: vbattb-xtal {
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index ef12c1c462a7..041d256d7b79 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -102,10 +102,6 @@ x3_clk: x3-clock {
>   	};
>   };
>   
> -&adc {
> -	status = "okay";
> -};
> -
>   #if SW_CONFIG3 == SW_ON
>   &eth0 {
>   	pinctrl-0 = <&eth0_pins>;


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

