Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB82C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLie5zOVyoKUjA33oPyC/WGRzvoFygYuppsebPS2FNA=; b=JZRfsyJwbgi6DVoC5pAFeramn0
	UCR6/3OrXpxQbdjB5KKoTYZC2inJkJCMWLSMxlExLycXm0e4epxdnsgZ5JGX1PKMMR0LoHRgkTo6v
	5RcBPVY7eSu6jAkhIEfqAQjE/vfhulRMJEHEAUet4tUZXgeAXytZuhIf2N0OhBev3uSfu8quryged
	j/GHyBPdiKJQ08w7Yc/ofQDnjrd2AXpCMjEqS9VjEXloz2KRomyeWSOUhk4cfoF+XNcG2wfEfEXiy
	B4/X65lYYZtWEEg00PGiLm0d+lGzlKkejpEyoY+0iJ+YKC14sXUBW8mOkGB0hSexAatMkFF2u7VAb
	QRx4j39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubghI-00000005NnN-3dZU;
	Tue, 15 Jul 2025 14:31:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfQL-00000005AJt-3l3y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:10:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2866812f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585020; x=1753189820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLie5zOVyoKUjA33oPyC/WGRzvoFygYuppsebPS2FNA=;
        b=uNeRx7Xx5+rdxyqKUXRBglBB6qHC68ma/opGxas5zG/epB/fJNFxVTkx+jtEDPDQBf
         7B4zmTPPfVdlu97MYz/KK4pv8DvbJ1m72BNXJdsvkS+rq0YfKjg2pzP3/nD9sRCUTyVN
         eNvJkcteM1kFz1vkz9mFFCJIln8CtifRnK5+rjpYTu8b+ZTHYbCljq02mQ5knSdiBelT
         WkYSh2pSw6+DBVLNQNYte6hiV9kFKZgoOKwNBttyDqdy6grsDl4sY1pT8nonBK9UCRyR
         IVeTOq3zzALpSok9Dse35nbs7zn6huYGGGDpGM7HyU/tbCHd6Uogc2QLkD1KT6UlBbfe
         VqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585020; x=1753189820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLie5zOVyoKUjA33oPyC/WGRzvoFygYuppsebPS2FNA=;
        b=IrcuXZqzAaTc5CeUzhGXPg4BdHHPtj9hAeSEYWhtxXCvShjTFRunvpzzRt3iaHtWVv
         ZjdLeb3I9xAdyVFFnAugfraVjuLfzyNgI7SUSrmq3Qb4vUc3qw/d9/6MGyUxX9idRenv
         lUdRvWM6dKdgfkpS7foT43mjmjli+vffYbxqFc6hqHpfvaNAhihCdaXHo8+tjAh4j9su
         sqVt4YTuG8iK/dRz0m04mZbdnA/iIG6WdirQNJ56XXQR64UKbFJ/Fi6+yT2afmpGqwQb
         DcEuSOhpJcb0/HraHhnHBva1bgELQTCAWeHiAaa62vAdXvTIiowbOm5v5Iu1heEugpKX
         whtA==
X-Forwarded-Encrypted: i=1; AJvYcCVpommjajbGULaE2VB40vbH1VRm+K+hm+YGlkg12ELh9u2A1BNlTtjS7AF1T8LHid1dbG206XHagbYctCaaPgGB@lists.infradead.org
X-Gm-Message-State: AOJu0YxWc0hRo1F401/dX4FDZOyw7PWxqB5p5OOdzszPX4HOfZpqlrgN
	ggYvlXvn+lsqyM7PLhurm6h8BFPRIO6EAo9oK0XAe4xLbnLKw3TKdy1QqJmXd1zvcjwbDl3KNyS
	8U4Vzi5E=
X-Gm-Gg: ASbGnctKHjYp9ZriBLMm5YNQwmPWnBYQXDgrtTs0CmzFK2XaV5lAs19LVF7hPZph5CH
	lDH29Bc0PX6Acs+96MnH8azQyDWZ1aaeB3Taj94w29eK8k4L9vbRYjZanDh32KHiYH+iKtOK9Mo
	amygWca6TRC5CHVI2vbrco56kvLysisQO5Tm30ge1ZqhR8oW0//6xxagbwLbpAFwgVt5cxV4MNp
	eivRIUxlYkovWtx+83VWeQ2eStWsBZeVxAGVoVOMQKBHwMI56l2S/DwWcyJPxsw6dR/IqOP3VJg
	v+LPAgbo01HHWLPRscOXdhbwdKknByb+ESJE8p6EieaW0suC3mHg54mShgs82Na013wcSLxK5e+
	K7xhn/LV+MU7qH65Yc5MImWNuTtA=
X-Google-Smtp-Source: AGHT+IFe4r8KriuNAFHXNYf/4cwh/PGYuzAM7nUnVEwSGtbr0UTcF5cgzYyzCdphFsVFvt+3gZMD1g==
X-Received: by 2002:adf:9d82:0:b0:3a4:f5f6:b4ab with SMTP id ffacd0b85a97d-3b5f2dfd6f7mr10433427f8f.30.1752585020307;
        Tue, 15 Jul 2025 06:10:20 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560733e736sm104730995e9.29.2025.07.15.06.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 06:10:19 -0700 (PDT)
Message-ID: <e1210c84-69d1-4fb2-88c2-a6a1bcb179c5@linaro.org>
Date: Tue, 15 Jul 2025 14:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-4-71b0c9f98093@linaro.org>
 <aHUMMk9JUdK6luLN@willie-the-truck>
 <04d52182-6043-4eaf-a898-9f8ccc893e5f@linaro.org>
 <aHZQH7QGhi5pbXU8@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHZQH7QGhi5pbXU8@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_061021_959658_581E567A 
X-CRM114-Status: GOOD (  28.94  )
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



On 15/07/2025 1:57 pm, Will Deacon wrote:
> On Tue, Jul 15, 2025 at 01:48:03PM +0100, James Clark wrote:
>>
>>
>> On 14/07/2025 2:54 pm, Will Deacon wrote:
>>> On Thu, Jun 05, 2025 at 11:49:02AM +0100, James Clark wrote:
>>>> SPE data source filtering (optional from Armv8.8) requires that traps to
>>>> the filter register PMSDSFR be disabled. Document the requirements and
>>>> disable the traps if the feature is present.
>>>>
>>>> Tested-by: Leo Yan <leo.yan@arm.com>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    Documentation/arch/arm64/booting.rst | 11 +++++++++++
>>>>    arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>>>>    2 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
>>>> index dee7b6de864f..abd75085a239 100644
>>>> --- a/Documentation/arch/arm64/booting.rst
>>>> +++ b/Documentation/arch/arm64/booting.rst
>>>> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
>>>>        - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>>>>        - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>>>> +  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
>>>> +
>>>> +  - If EL3 is present:
>>>> +
>>>> +    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
>>>> +
>>>> +  - If the kernel is entered at EL1 and EL2 is present:
>>>> +
>>>> +    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>>>> +    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>>>> +
>>>>      For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
>>>>      - If the kernel is entered at EL1 and EL2 is present:
>>>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>>>> index 1e7c7475e43f..02b4a7fc016e 100644
>>>> --- a/arch/arm64/include/asm/el2_setup.h
>>>> +++ b/arch/arm64/include/asm/el2_setup.h
>>>> @@ -279,6 +279,20 @@
>>>>    	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>>>>    	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>>>>    .Lskip_pmuv3p9_\@:
>>>> +	mrs	x1, id_aa64dfr0_el1
>>>> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>>>> +	/* If SPE is implemented, */
>>>> +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
>>>> +	b.lt	.Lskip_spefds_\@
>>>> +	/* we can read PMSIDR and */
>>>> +	mrs_s	x1, SYS_PMSIDR_EL1
>>>> +	and	x1, x1,  #PMSIDR_EL1_FDS
>>>> +	/* if FEAT_SPE_FDS is implemented, */
>>>> +	cbz	x1, .Lskip_spefds_\@
>>>> +	/* disable traps to PMSDSFR. */
>>>> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
>>>
>>> Why is this being done here rather than alongside the existing SPE
>>> configuration of HDFGRTR_EL2 and HDFGWTR_EL2 near the start of
>>> __init_el2_fgt?
>>>
>> I thought everything was separated by which trap configs it writes to,
>> rather than the feature. This SPE feature is in HDFGRTR2 so I put it in
>> __init_el2_fgt2 rather than __init_el2_fgt.
> 
> That's fair; __init_el2_fgt isn't the right place. But the redundancy of
> re-reading PMSVer from DFR0 is a little jarring.
> 
>> I suppose we could have a single __init_el2_spe that writes to both HDFGRTR
>> and HDFGRTR2 but we'd have to be careful to not overwrite what was already
>> done in the other sections.
> 
> Right, perhaps it would be clearer to have trap-preserving macros for
> features in a specific ID register rather than per-trap configuration
> register macros.
> 
> In other words, we have something like __init_fgt_aa64dfr0 which would
> configure the FGT and FGT2 registers based on features in aa64dfr0. I
> think you'd need to have a play to see how it ends up looking but the
> main thing to avoid is having duplicate ID register parsing code for
> setting up FGT and FGT2 traps.
> 
> Will

I'll give it a go but that could end up being fragile to something that 
is dependent on two different ID registers in the future. Then we'd end 
up in the same situation for a different reason.


