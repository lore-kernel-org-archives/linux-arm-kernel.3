Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA5AC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vW3Mq6FmuxLxhnil1RMWEPl2NZrnvIFyftaR5qP/us=; b=CGaMwYVPz25NDcvINTU/sOP4bw
	chYCeZ3iWCnzOCx0IrdY5DVGRPV/keoxmjDR0uWuBN8RchYVUA031ytJTrK08bY+b1TrAzvkbVrfi
	E2S0B0cOg12b9lmsQPpark1LvRY4go9g4R9uXljfNsIeXhqxtVqZ+ibcUAs10IXm3U8CQ1hMpU6Sr
	WZ1vZ71unAAJYGKgLXz0g+d6nidnz3cFtHXRH61K8CYQx+GNavw1nhIQbT3jA26TSDrrE3qpdmx0Q
	55Ge8XcOeXVKUxgY7UO/5a6912H8unxLta3N0XiqpMpgJsKnPwmgdKVP2n9gLt4/x18Tl1ZaCl+R2
	44Kbk8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZy-0000000CDUp-3JjH;
	Wed, 19 Feb 2025 10:45:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhPn-0000000CAcY-2yJt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 10:34:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-439950a45daso10626535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739961290; x=1740566090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vW3Mq6FmuxLxhnil1RMWEPl2NZrnvIFyftaR5qP/us=;
        b=kv3ZEmnZO+v2fqoB1DDoVw1exxbaHQqyBy+mCIi2DT62zHlea0nGK4KQX2wQXQ5RjT
         wSHJCXG0IrUI86Jw5TWPRJxc+7o4moiUy2tQ+YjhE3tgK6OTBDZAwkLIU29llNIIASlD
         SwCaB7RAg006rQWlf0lLJykHuSL3EwxKTdUUeRFwyVKgpboFxDF3aaeZ/TKMTkIp7+XE
         vDnf25RoCpeJlGFJK2dRZPZvR07/Zoh0RWn8CM9/LGsY7qmR2ukJAKFQOV8QpfSl2W0h
         l0FysEBvGiWq8xHGCGhJXu3ovWBNWq2KTppu6qCqQhzzhQ6LjyXJKlBkln+CA3VoCldw
         K9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739961290; x=1740566090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vW3Mq6FmuxLxhnil1RMWEPl2NZrnvIFyftaR5qP/us=;
        b=Sz1tIrLxICto5fC4RElQSP1VQUd5O/mJwo2VWQ1uym41Mzql9i/uYjq1+6G9ATB0uH
         YEkiSZ+sH2y7AnQV6goc83ZE5nGtmKZr43r/JPMeY3TYNVtvz1hF/QpesIvD2Rs9JWm7
         5lr16GSZ8Jgq0M5+XqT5jHnkIecVpRTnN+UjuriS7nwadHkwi2dkdSsC3x+JiX3CPE70
         buX9X/BMixmo8j/zOl5qT4R8OBMKsrH0U37SW/4FdNBXEib6NMyoSdBPIUJhhqc7iYZR
         2+RAR0QyV8ZqmuqAftD8GfTPqMxdVWNVeAf1wyko7Plt4d6P/TDNFJkIJ72b7ZFoN5+e
         XlEg==
X-Forwarded-Encrypted: i=1; AJvYcCWZYKGctEt2aIrb7H9EOv0IWHO15J+vJZ/Hy/Bd2W9N9dMgz0jpEJXbsSdAdVlt50Ayp/VXswTrPRlsOzY2Y9h7@lists.infradead.org
X-Gm-Message-State: AOJu0YzqO5BFo8mzBJt1NH1zEe/7DZD/4vpXbWSDMNL4mWjqudV84hGN
	SDbGpcibd7mEhQIt7CN3edmZHRwMJf15ujkVr1r4P8xfLbaEJFYT
X-Gm-Gg: ASbGnct8dIgydN36IAadRJoNlYixjY3z8PU674lOjEd11YhD4Y2tr1yhIJ86+OzDYcG
	nSWP3UCHlj+nHPqbNON3gDkQMVPxAZ4/IXP4801AmXrnSFj59y/ZmbVYmK4RTqn7hzwCqeBBenF
	dhPh8Js2sH6fySlFgkBley4F+0zvBRTNUtvm8L/KZBjMbjaih1yXuUi5ZqQZFNI50RopBtmyxxW
	JbcmNC04/JuYAdbTo8SSDeMlb+T6Xd9dk8X6XX0AmbAHb74DkNP5paH8YdKCltGKdxtm8LkzxQ2
	ZsxboKDpL9YQK6tjj6Qqwn56I6whLLMdplCYmics42RaPTNtqL67xmdp
X-Google-Smtp-Source: AGHT+IH8omL6HrDnxAeU3OszfLwGA6mXMUbGoGbtQrSkt2R2L/0PJO2LLFU+a6jkdDY0idhFewAIbQ==
X-Received: by 2002:a05:600c:1d27:b0:439:9e8b:228d with SMTP id 5b1f17b1804b1-4399e8b2474mr7936925e9.19.1739961289921;
        Wed, 19 Feb 2025 02:34:49 -0800 (PST)
Received: from [172.16.20.186] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439872b59e9sm76783555e9.31.2025.02.19.02.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 02:34:49 -0800 (PST)
Message-ID: <451d52cc-ccb7-44ae-b6c1-cd3ab65465c1@gmail.com>
Date: Wed, 19 Feb 2025 12:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: exynos: add initial support for
 exynos2200 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215130500.170738-3-ivo.ivanov.ivanov1@gmail.com>
 <675ddbf4-dfeb-48dd-b48a-466bf2888ce5@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <675ddbf4-dfeb-48dd-b48a-466bf2888ce5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_023451_762202_1BD1B8AE 
X-CRM114-Status: GOOD (  15.15  )
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

On 2/19/25 10:41, Krzysztof Kozlowski wrote:
> On 15/02/2025 14:04, Ivaylo Ivanov wrote:
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> new file mode 100644
>> index 000000000..645a31d46
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -0,0 +1,560 @@
...
>> +
>> +	ext_26m: clock-2 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-output-names = "ext-26m";
>> +	};
>> +
>> +	ext_200m: clock-3 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-output-names = "ext-200m";
> What do these two last clocks represent? Where are they?

External crystals, apparently. They aren't passed as phandles to any
other node in the vendor DT, so I'm not really sure what samsung
would use them for. But they're described, so I assume they exist.

>
> I see we have them also on Google GS101, so same question there :/
>
>
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cpu0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&cpu1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&cpu2>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&cpu3>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +				core0 {
>> +					cpu = <&cpu4>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&cpu5>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&cpu6>;
>> +				};
>> +			};
>> +
>> +			cluster2 {
>> +				core0 {
>> +					cpu = <&cpu7>;
>> +				};
>> +			};
>> +		};
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu1: cpu@100 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0x100>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu2: cpu@200 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0x200>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu3: cpu@300 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a510";
>> +			reg = <0x300>;
>> +			capacity-dmips-mhz = <260>;
>> +			dynamic-power-coefficient = <189>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&little_cpu_sleep>;
>> +		};
>> +
>> +		cpu4: cpu@400 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a710";
>> +			reg = <0x400>;
>> +			capacity-dmips-mhz = <380>;
>> +			dynamic-power-coefficient = <560>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&big_cpu_sleep>;
>> +		};
>> +
>> +		cpu5: cpu@500 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a710";
>> +			reg = <0x500>;
>> +			capacity-dmips-mhz = <380>;
>> +			dynamic-power-coefficient = <560>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&big_cpu_sleep>;
>> +		};
>> +
>> +		cpu6: cpu@600 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a710";
>> +			reg = <0x600>;
>> +			capacity-dmips-mhz = <380>;
>> +			dynamic-power-coefficient = <560>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&big_cpu_sleep>;
>> +		};
>> +
>> +		cpu7: cpu@700 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-x2";
>> +			reg = <0x700>;
>> +			capacity-dmips-mhz = <488>;
>> +			dynamic-power-coefficient = <765>;
>> +			enable-method = "psci";
>> +			cpu-idle-states = <&prime_cpu_sleep>;
>> +		};
>> +
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			little_cpu_sleep: cpu-sleep-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "c2";
>> +				entry-latency-us = <70>;
>> +				exit-latency-us = <170>;
>> +				min-residency-us = <2000>;
>> +				arm,psci-suspend-param = <0x10000>;
>> +			};
>> +
>> +			big_cpu_sleep: cpu-sleep-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "c2";
>> +				entry-latency-us = <235>;
>> +				exit-latency-us = <220>;
>> +				min-residency-us = <3500>;
>> +				arm,psci-suspend-param = <0x10000>;
>> +			};
>> +
>> +			prime_cpu_sleep: cpu-sleep-2 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "c2";
>> +				entry-latency-us = <150>;
>> +				exit-latency-us = <190>;
>> +				min-residency-us = <2500>;
>> +				arm,psci-suspend-param = <0x10000>;
>> +			};
>> +		};
>> +	};
>> +
>> +	pmu-a510 {
>> +		compatible = "arm,cortex-a510-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
>> +	};
>> +
>> +	pmu-a710 {
>> +		compatible = "arm,cortex-a710-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
>> +	};
>> +
>> +	pmu-x2 {
>> +		compatible = "arm,cortex-x2-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster2>;
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci-1.0";
>> +		method = "smc";
>> +	};
>> +
>> +	soc {
>> +		compatible = "simple-bus";
>> +		ranges;
>> +
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +
>> +		chipid@10000000 {
>> +			compatible = "samsung,exynos2200-chipid",
>> +				     "samsung,exynos850-chipid";
>> +			reg = <0 0x10000000 0 0x24>;
> All numbers in hex please:
> s/0/0x0/

Alright. Will fix, thanks for the reviews!

Best regards,
Ivaylo

>
>> +		};
>> +
> Rest looks good.
>
>
> Best regards,
> Krzysztof


