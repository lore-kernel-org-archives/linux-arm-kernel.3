Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5552CD5BBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8GhrcAyMh3A+V43CTkvvT8Jy87HXinsSZJMcVDG3s0=; b=PPXKHCTh7b4GjKqPLUGIqUnIwO
	3xRpdFS7DFRQN+v5R7A8HbElBub0ZsqHCMgzNlgFG8pzN3/VCY+ziBquXX5Xhwd9GV1mioTt8dCMN
	WGvE4YDvHUTl0Ueff/lqw6t0jSOcSPYypFMfLbVYuX5/1T2HiIa5BgR5G0zU8hS1TSGEDPc4ntneS
	mmBqobJrJb4DvpM+7fSr9ymp9FB6NvdzORThf3aFDZa+lvgwWzz0cUVPgb/G4IVZQ3beoJceNy51L
	81Eb9tqKtWgQKhZM4IvUcSUbKbk14Ruv+XfFl287MXRitvyKZooXOQHrOXBW8ZmH50tLKU195ezQ4
	hRAvZHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUXI-0000000AHBx-2spv;
	Thu, 13 Nov 2025 10:26:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUXF-0000000AHBL-3AeB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:26:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b2dc17965so568688f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763029596; x=1763634396; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8GhrcAyMh3A+V43CTkvvT8Jy87HXinsSZJMcVDG3s0=;
        b=OgCwirE8kupg622av7y9x3ReSna/SOIwLLHVkczSEueuLoHZBQ/o0KVBAHj4/Nl2EI
         2nS/QcFnyOvrJLpfqQG58LsQ6gqj6+TmWR6w9JpNggoiYvhuqBARXyTYjkoZAcbLun/5
         Mk7oQ9jmRFUjEO+fq4D2mFq4iSiMJLks5t+dMrM5C3uKRcLvOmjN8tfG1zAcF6+Cv1V+
         sq9tG+M0wg+5+LSX+Kwx9yxY4P/m51ZVw9R9O2uT9jddCGk+T3sqMOYGesMtSEEpr/k+
         gJLdzkKVRBzgoKP51N3i5Xx7WFViA6M+/gEYQ+GG3IYlDmL355xuXnD+A7WohMSQNvGe
         gXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763029596; x=1763634396;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8GhrcAyMh3A+V43CTkvvT8Jy87HXinsSZJMcVDG3s0=;
        b=whNDqmHMHSd1DKWGcDid7szDPDALw5SVU4A99dtAXNewCYxzBI6YeCuNUzfNgzXFtH
         e2qCCk/1UV5bFpeu6aBGfclHufhMeK1LrfEyVFUXjl+MxYan2WeM7bzh6FQLUhrubnMB
         o7KNR0lQWdWYEBk4m8yla+L+OSJXb26s4Vx7XbKnoAGuh+9ChvrrVXA/wQwdAeA9mz6J
         jbfsHmUw5ET0EYuIeZmjozA7icyTRiJg4gN7jybULbAnsliBqC5C970M309zKeVVrpmD
         D18fA0zFf6HDjvUKxeGb9hSr65/khz/5NDD19N9yAkTUmgP2hJdEpQLTctg2oKwJIO5Z
         cnUg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBbmcTYO4hfAJRuPCxWBerImPeQF/lCUhooZou84+1fL8z1lzMM3md+i37GTpjAJ06+5D7YxYH2bIvu9bsAXY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn47Krleq2x1onPda21B8IQLpGgMIjq5AUzuYXJx+V8If4Ketm
	5kx8DrlEMHGmRQqOmrDL8slkSgNCfYYV3a0FDvay+kN15H/tJuHOuH+eVwyiLl1abSk=
X-Gm-Gg: ASbGnctD5Mnp86f6C3V3uvs2I+a96B0oln3T86lXTmFn65KXpSmCcjLtPJ8ctMZYTxw
	dozm3pwplFe7KrKePJ5YXxgb8jDR5xD6ZWQEGt1P1/0OGlHWeuU8tryaKQtoGxo7qRu8wgWnmMV
	FjxaDMLvIlaCFsTbEGw3LJL7HRO/p4XEd8LYhhoOCRbHfcS05BOAn7+Yl93fW39ETVvC+U1ofqd
	5mt+CX1n4ok/n1uGxdX7hs2eAwp0GhuAs3VdzZd/CAf6GJusoFRrn0bpGc7y9yPevtk8KXeOcCg
	q95sNMUbCvVDOlLQUrTUqwBvXpj55grzgorddx6lGhb9pn2ZIL2884HyaPJzBJ5+xXZYWASwSZk
	fxlOIpFrcHvGFGf0K4bpyjkSuseOYDJ8VY8cBP3uSz08kdpl6VTy9eMe+feiufDcG8CO9CRfmfV
	/S/08Atw==
X-Google-Smtp-Source: AGHT+IFappH0cJvSx4iLsRJxGuedr9FOAfOnQi4qZr3vNlHJHTAAZOTa3M8ohns19ObiXS0otCFe/Q==
X-Received: by 2002:a5d:5848:0:b0:42b:3dfb:6436 with SMTP id ffacd0b85a97d-42b4bdaeacbmr6137389f8f.60.1763029595613;
        Thu, 13 Nov 2025 02:26:35 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b57asm3088931f8f.27.2025.11.13.02.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 02:26:35 -0800 (PST)
Message-ID: <62bb6c08-a1d0-4dba-a431-0d6ce49d66b2@linaro.org>
Date: Thu, 13 Nov 2025 12:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
 <20251113-benign-macaw-of-development-dbd1f8@kuoka>
 <9d77461c-4487-4719-98db-1c5c5025c87e@linaro.org>
 <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
 <1af37451-1f66-4b6b-8b36-846cbd2ca1e8@linaro.org>
Content-Language: en-US
In-Reply-To: <1af37451-1f66-4b6b-8b36-846cbd2ca1e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_022638_462052_A993864D 
X-CRM114-Status: GOOD (  33.74  )
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



On 11/13/25 11:51 AM, Tudor Ambarus wrote:
> 
> 
> On 11/13/25 11:35 AM, Krzysztof Kozlowski wrote:
>> On 13/11/2025 10:28, Tudor Ambarus wrote:
>>>
>>>
>>> On 11/13/25 10:30 AM, Krzysztof Kozlowski wrote:
>>>> On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
>>>>> Add initial support for the Samsung Exynos OTP controller. Read the
>>>>> product and chip IDs from the OTP controller registers space and
>>>>> register the SoC info to the SoC interface.
>>>>>
>>>>> The driver can be extended to empower the controller become nvmem
>>>>> provider. This is not in the scope of this patch because it seems the
>>>>> OTP memory space is not yet used by any consumer, even downstream.
>>>>
>>>> Quick look tells me you just duplicated existing Samsung ChipID driver.
>>>> Even actual product ID registers and masks are the same, with one
>>>> difference - you read CHIPID3... which is the same as in newer Exynos,
>>>> e.g. Exynos8895.
>>>
>>> Yes, that's correct. It's very similar with the Samsung ChipID driver.
>>>
>>>>
>>>> What is exactly the point of having this as separate driver? I think
>>>
>>> The difference is that for gs101 the chipid info is part of the OTP
>>> registers. GS101 OTP has a clock, an interrupt line, a register space 
>>> (that contains product and chip ID, TMU data, ASV, etc) and a 32Kbit
>>> memory space that can be read/program/locked with specific commands.
>>>
>>> The ChipID driver handles older exynos platforms that have a dedicated
>>> chipid device that references a SFR register space to get the product
>>> and chip ID. On GS101 (but also for e850 and autov9 I assume) the
>>> "ChipID block" is just an abstraction, it's not a physical device. The
>>> ChipID info is from OTP. When the power-on sequence progresses, the OTP
>>> chipid values are loaded to the OTP registers. We need the OTP clock to
>>> be on in order to read them. So GS101 has an OTP device that also happens
>>> to have chip ID info.
>>>
>>> For now I just got the chipid info and registered it to the SoC interface
>>> (which is very similar to that the exynos-chipid driver does), but this
>>> driver can be extended to export both its memory space and register space
>>
>>
>> There is no code for that now and possibility of extension is not a
>> reason to duplicate yet.
>>
>>> as nvmem devices, if any consumer needs them. Downstream GS101 drivers
>>> seem to use just the chip id info and a dvfs version from the OTP
>>> registers. DVFS version is not going to be used upstream as we're defining
>>> the OPPs in DT. So I was not interested in extending the driver with nvmem
>>> provider support, because it seems we don't need it for GS101.
>>>
>>> Do the above justify the point of having a dedicated driver?
>> Only partially, I asked about driver. I did not spot previously the
>> clock, so we have two differences - CHIPID3 register and clock - right?
> 
> clock and interrupts, but I don't use the interrupts because I just need
> to read the OTP registers to get the chip id info.
> 
>> I wonder why Exynos8895 and others, which are already supported, do not
>> use CHIPID3, but nevertheless these two differences can be easily
>> integrated into existing driver.
> 
> they can be integrated, but I want to make sure we're making the best
> decision.
> 
>>>> this can easily be just customized chipid driver - with different
>>>> implementation of exynos_chipid_get_chipid_info().
>>>
>>> If the answer is no to my question above, how shall I model the device
>>> that binds to the existing exynos-chipid driver?
>> Just extend the existing driver.
>>
> So you mean I shall have something like that in DT:
> 
> +		chipid@10000000 {
> +			compatible = "google,gs101-chipid";
> +			reg = <0x10000000 0xf084>;
> +			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
> +			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> 
> Maybe remove the interrupts because I don't need them for reading OTP regs.
> 
> What happens in the maybe unlikely case we do want to add support for OTP
> for GS101? How will we describe that in DT?
> 

Ah, I guess you meant to keep the node as I described it in patch 3/5,
an efuse node with a google,gs101-otp compatible, that will bind to the
existing exynos-chipid driver. Then if/when we add OTP support, move
everything to a new OTP driver. That can work, yes. Unless I add some
OTP support now, to justify the new driver. Both shall be okay, right?

Thanks,
ta



