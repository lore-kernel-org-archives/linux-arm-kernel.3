Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2251EC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3o2Al+ah5HLHId+sovtfURIatXMLe6xwgsl5Nxm6Ms=; b=YXQg+fHK7PJ8Aqmsb+nzrqwc0G
	LNtmQp/Xs5B8ckPjCCgL8tKrnQ2WxPqeb40BRRShSKB1oXwupnyh5CZWlzcCvnMKd9HbT0FdXCbU0
	HgS8wvumDyBhL2gSIQ+3/vIgiWteSCDKl4Ybj1S+t63R5rnL74EcAgBxNvd7M9h3EkNUPWXj98BHv
	IOIQcwIwe19Xy8Z0f2Vy7QpOVUnVKKfL9yxk95AHq1S4kzj1nudrK63uGm2VZC0IAukWrJN6hrTzb
	rbY6BSHjsyJPAa/AbA4fffYGAzWu2YHULbdAGOOL3hzlBrBALKRghIJcZMBLinnaEaxC01UVT1TaX
	arh3I/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMn1c-0000000DIdn-0F15;
	Wed, 04 Jun 2025 12:15:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmk9-0000000DGJ5-09Qs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:57:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso1845051f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749038235; x=1749643035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3o2Al+ah5HLHId+sovtfURIatXMLe6xwgsl5Nxm6Ms=;
        b=JjMNAwlepLmO2lMOZau2NtGNJUuk3mYo5iivgza+OgiFlLYBa+8Q5jXz50VWwW4rjs
         vavqL4BI2ITA/2+Mwlo2eOx1kqdDTUFXKBemoPDx8xF4Q5bhvV6qAySyGoweZxphEhbz
         DA77FeP6nfK6po0pcuzg8tmso2SHlD1h0v4MLLwS1TIMdc+7MarIcYp9moLOXtTgYa2l
         qbEsWcwt05CP9Vgpc5fUOa6VVAIT6/NLjFg55sjjT70wgBntDqW1fuOn5SDehGcrJsed
         vJovxQ8giWzf5pPnjvL/cX0+EunKCOUIEzEKCuDcNzkRW0HUZoflAR2zXdf54afzk7Xl
         cciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749038235; x=1749643035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3o2Al+ah5HLHId+sovtfURIatXMLe6xwgsl5Nxm6Ms=;
        b=L7k2Efp1OcoTB8rf5rpByBXGU2Jw20KHvgVLU9/fcbpQSZ7PEaYrrI+AiZVPettAlv
         RlW8w6EY57gjmatew/n4XHVJbwg43XDD9dCa/Dr86hQN1QQcxIEhxC5Vw/ohqN8aJRWK
         WWx7/LP8TYvYrIMe2O2FqjgqbGvAkMwHWl2LQPKMF80kJ/MLosjHc59GHH+W6xMhjFgg
         Nxm5vYCRf875cAb2cc3wklg2SpOlIbEU4pOGZiPStYqFLiwu4/pWv+C3q2di/bzVvFNU
         4cR9HICu2CfuNAe0iSk3zplHUolEMHoewUPmseF4/fgbEy+A2jfpOIFhM+1a6849YnjO
         iZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCVuEslrE3QzkEDIuiAQGlgc2Nqnj4ryGP3IBVul2zQc8rTSugvO4SMSlMCYGIDjt6dOpWIH3EJtelBWoXWsZJq6@lists.infradead.org
X-Gm-Message-State: AOJu0YxYj7zDvOCp2hJ+4lnjbWstH06Raxl0nwWB6QtpUgzZNslzw3cV
	EsmA5UGA1WaP30djADxy6YyqURx70d//AHFEaYFDI+n4HFR1434knngSaQrJ7ta+2NsLhHcR4cB
	7Xk9eUAM=
X-Gm-Gg: ASbGnctSEoaZ4GjkU0ULUGRobeLNmYEdVeAUmouYLKEQeklHhdekdu+sS50YUNJL+nc
	TxAU823y2LjqyWqJHcDPEfYju/M848yUxPeu6O6w3i4LFka3wmZ55qMcbRKrlVBwTkRORXeOBU4
	iZSMNDaaFonnQK/JEnberM+0BP3lxxCzR8fTSoT8CHSBKY52zjElX7dDh7e4jQW3gw2u4Ja4cLy
	ZaxKHYKg7JrvKNyTMdJpTYFKt1iDwNCz35q4hymJAUNd+MrS4r7HjslQ6CD4gqeF/8f4xPo56Bt
	s1S5q95fkvig/HK6N+UO0nQffv4xqSuBoxLfhryHFhla59qqO7f/catRCHh7U9VE2ac=
X-Google-Smtp-Source: AGHT+IGGx/pRBN6Nlohu7KEh/U2KfqTQe9QEj4xrqThZZd7vVFzq9OIm8hn6xKWvFYQxHWXlRnyzYw==
X-Received: by 2002:a05:6000:188b:b0:3a5:221:2bf6 with SMTP id ffacd0b85a97d-3a51d973d79mr2079356f8f.57.1749038235206;
        Wed, 04 Jun 2025 04:57:15 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80f6sm194615105e9.28.2025.06.04.04.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:57:14 -0700 (PDT)
Message-ID: <189edea6-49d8-4829-88ce-fa75d83401d6@linaro.org>
Date: Wed, 4 Jun 2025 12:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_SPE_FDS register
 from EL2 and below
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
References: <20250604114604.629782-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250604114604.629782-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_045717_098507_71006A5B 
X-CRM114-Status: GOOD (  20.39  )
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



On 04/06/2025 12:46 pm, Anshuman Khandual wrote:
> FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
> register from EL2 and below exception levels, will trap into EL3 unless
> MDCR_EL3.EnPMS3 is set.
> 
> Enable access to FEAT_SPE_FDS registers when they are implemented.
> 
> Cc: James Clark <james.clark@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   arch/aarch64/include/asm/cpu.h | 4 ++++
>   arch/aarch64/init.c            | 3 +++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index 2b3a659..ac50474 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -55,6 +55,7 @@
>   #define MDCR_EL3_NSTB_NS_NOTRAP			(UL(3) << 24)
>   #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT	(UL(3) << 32)
>   #define MDCR_EL3_ENPMSN				BIT(36)
> +#define MDCR_EL3_ENPMS3				BIT(42)
>   #define MDCR_EL3_EBWE				BIT(43)
>   #define MDCR_EL3_EnPM2				BIT(7)
>   
> @@ -185,6 +186,9 @@
>   
>   #define SCTLR_EL1_CP15BEN	(1 << 5)
>   
> +#define PMSIDR_EL1		s3_0_c9_c9_7
> +#define PMSIDR_EL1_FDS		BIT(7)
> +
>   #ifdef KERNEL_32
>   /*
>    * When booting a 32-bit kernel, EL1 uses AArch32 and registers which are
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index e1640a9..b6f740c 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -146,6 +146,9 @@ static void cpu_init_el3(void)
>   	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 3)
>   		mdcr |= MDCR_EL3_ENPMSN;
>   
> +	if (mrs_field(PMSIDR_EL1, FDS))
> +		mdcr |= MDCR_EL3_ENPMS3;
> +

You are only allowed to read PMSIDR if SPE is implemented otherwise it's 
undef so it needs another check.

It would be much easier to unconditionally set all the known MDCR bits. 
If the feature is implemented then setting them to 1 disables the traps, 
which we want, and if it's not implemented it does nothing which we also 
want.

Doing them all conditionally is quite error prone and extra work for 
nothing. In TFA it's already done unconditionally:

*
* MDCR_EL3.EnPMSN (ARM v8.7) and MDCR_EL3.EnPMS3: Do not trap access to
* PMSNEVFR_EL1 or PMSDSFR_EL1 register at NS-EL1 or NS-EL2 to EL3 if 
FEAT_SPEv1p2
* or FEAT_SPE_FDS are implemented. Setting these bits to 1 doesn't have any
* effect on it when the features aren't implemented.
*/
mdcr_el3_val |= MDCR_NSPB(MDCR_NSPB_EL1) | MDCR_EnPMSN_BIT | 
MDCR_EnPMS3_BIT;

>   	if (mrs_field(ID_AA64DFR0_EL1, TRACEBUFFER))
>   		mdcr |= MDCR_EL3_NSTB_NS_NOTRAP;
>   


