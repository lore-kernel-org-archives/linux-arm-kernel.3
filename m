Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690FAC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gawkt9In8aJG8h+rAcH7YnbMFtyCA6IgsBVkBeTJrC8=; b=gj1MgvuxOimpkxjpiq1mSFT20l
	SigWch2SfpL1Yfkr9M47gA0Zrz45gj4+H6dQeuTo05Dw0xy11mjCBHnKnEeNBBpvDh9RWrT7uynTG
	rNeruECV7fhM4lQ8JmN3Cc44dhZU4IMM6qOcdckzsyYCg7XRzkwulMzbK78mhazrRoCYH3gbNGDI2
	FSegg3jP88ssCMQXVJtpAaYV1zqsppHIFfsDqSysL8TzyENYV8T3VUA4Bhdni0mHhbZUETFqc6QhZ
	pVafrXaDxqibQV02dkeYd6o0KgDLp7iG8vQnDCkGkZiBco59kmtu4FSdKm+GRYmtdCh/A2BZsO19Z
	jB+B1SfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipXf-0000000Drw5-0wdx;
	Fri, 14 Feb 2025 06:51:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipWE-0000000DriK-1Ufx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:49:47 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso704531a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739515785; x=1740120585; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gawkt9In8aJG8h+rAcH7YnbMFtyCA6IgsBVkBeTJrC8=;
        b=g3yjFXAoejrC+UMpHQl/AgTLPl6yy92T7TN6mpNU4F9Ti+sJvSv9o1KfBi5AAPxeIz
         9QlrW6GKkDbTOwAof8F2DIz426ZRMMvV9Jow0OJFxEjqnyhtBvs63qG9F9PAz6l9amSw
         SOxhlcKkDNiB0ut77JwamKBNUX+pkFrGCLz5qdQUHnNJvJZSr+vVfSiwlWuy68pjhp4v
         SRwqPW9lWWQhjQYA3erAJ3nOHAxQ6KyyzCag27FIWgZq1qK0E6y3Rik+flO113bzLXYR
         CZm0jVb7yFSMblvZmdI3MeKktGWkQvbO25LdHA1CoZH5HKdznCKSTiF5UKxkkHhwEXcw
         Ageg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739515785; x=1740120585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gawkt9In8aJG8h+rAcH7YnbMFtyCA6IgsBVkBeTJrC8=;
        b=HNWaVfYdDrlvme8qeL2auL3avJc6b80lGpFkRHr/tvarAxg+JJYVb3BZyP+IHXbaqf
         lJtrj43a5KP9KvKEPPOXS0L0340FWeWNIlHT2LOC56t/h4Y3meUMOM29pK6GZm8B3YGj
         GNd1hTV4d4mnoBpzgASdGdkDCDclfl9r9pULx7Y7SWZYvy6SL0dicTu6/1KsGKpQhmOk
         khMG3xvu5vaYn4klzEl2JOwBtsoE7CeptJcM71XCo+Br8HsfwQKk7hjfK5ebSboTnW44
         azchuiY47VV3QhY1H1ZQk5FBzXvTTN6FJ1Mdt7gyfNNr4icqc1kxRhMWMe8eIeRUl8+i
         5Abw==
X-Forwarded-Encrypted: i=1; AJvYcCUncFezbBuivufpgnLDdI1K5meh6i1Ckju5E4wyTf7wEB8bEPXCcw3Pwcm9NcDx9nqDbBtQIkr5dM+4W/fnlFfS@lists.infradead.org
X-Gm-Message-State: AOJu0YwbLE53Se+7R7QHiV+J//eP0sgYjvLbeGcoVMHTMZgAEX6R5f4x
	xikCUwNa9aVEWW11jSZQjO00SXMq7STDIiF/tkeJp+B9ZiOvmym6OrCU/I4qlcY=
X-Gm-Gg: ASbGncsHXZ/CWChdbCLNKOMu52t3wd9uK2P5afkOF2XiUh2AOvFJ1iMcfEKshI5d1B5
	8YLe7Iub2N/1sBwUYk0oa5agFchTb0hnLapTxtk1A0qgwUaPGQRsFg0Ypd++D6vXFleoANtUNLH
	h/Xi1piFhyhc4BHBzmBtTeQVVhmq01hUBWdXwy3sOtJg/yxsDyxpyxtZMp4Dd9eWZgn7l/PVLlX
	vIMWaHCwoND43yi2YwVknDSKpXtxsg+7+NgvUOEtrnbryHsDUCJ+HErkJWRQrW1KPI5gTc4m+fv
	cWRr3mMscDGQqZKnXUO6amDa
X-Google-Smtp-Source: AGHT+IFxiW3VpQW8qQ1jo57FdhoTZVGZoXp1u38iJkHijnUvtqdcxoOB5BNSokQAT/jC+GtZYlbZyQ==
X-Received: by 2002:a05:6402:274d:b0:5de:5263:ae79 with SMTP id 4fb4d7f45d1cf-5deb08813d5mr8694445a12.12.1739515784670;
        Thu, 13 Feb 2025 22:49:44 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287cebsm2386431a12.74.2025.02.13.22.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:49:43 -0800 (PST)
Message-ID: <2ed6c5d8-b559-4ffc-b08e-412bab1f7917@linaro.org>
Date: Fri, 14 Feb 2025 06:49:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 robh@kernel.org, semen.protsenko@linaro.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com>
 <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
 <Z67f+lDxISVubiJJ@droid-r8s>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z67f+lDxISVubiJJ@droid-r8s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_224946_410313_4680D672 
X-CRM114-Status: GOOD (  17.37  )
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



On 2/14/25 6:17 AM, Denzeel Oliva wrote:
> On Thu, Feb 13, 2025 at 07:38:35AM +0000, Tudor Ambarus wrote:

>> node properties shall be specified in a specific order. Follow similar
>> nodes that are already accepted, gs101 is one.
> 
> Not all Exynos SoCs will follow the same order

you an fix them then. Please follow
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

> 
>> <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> 
> Is
> 
> GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_4, "gout_peric0_top0_ipclk_4",
>      "dout_peric0_uart_dbg",
>      CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
>      21, 0, 0), [Mainline CLK]

I don't get this reasoning, sorry.
> 
> You can find it in the cmucal-node.c driver downstream of the kernel. [0]
> 
>>> +			};
>>> +		};
>>> +
>>> +		usi0: usi@105500c0 {

cut

>>> +			serial_2: serial@10550000 {
>>
>> why not serial_0 since you're in USI0.
> 
> Because it is simply displayed in the exynos9830-usi.dtsi [1]

I don't think it matters what downstream specifies for labels. Use what
common sense says.

> 
>>> +		};
>>> +
>>> +		usi_i2c_0: usi@105600c0 {
>>> +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
>>> +			reg = <0x105600c0 0x20>;
>>> +			samsung,sysreg = <&sysreg_peric0 0x1008>;
>>> +			samsung,mode = <USI_V2_I2C>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			ranges;
>>> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
>>> +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
>>> +			clock-names = "pclk", "ipclk";
>>> +			status = "disabled";
>>> +
>>> +			hsi2c_1: i2c@10560000 {
>>> +				compatible = "samsung,exynos990-hsi2c",
>>> +					     "samsung,exynosautov9-hsi2c";
>>> +				reg = <0x10560000 0xc0>;
>>> +				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
>>> +				pinctrl-names = "default";
>>> +				pinctrl-0 = <&hsi2c1_bus>;
>>> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
>>> +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
>>> +				clock-names = "hsi2c", "hsi2c_pclk";
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				status = "disabled";
>>> +			};
>>
>> shouldn't you define serial and SPI too?
> 
> As shown in the node it only uses i2c which
> corresponds to the exynos9830-usi.dts. [2]

If you can't specify all the protocol modes for all the USI nodes, then
make it clear in the commit message.


