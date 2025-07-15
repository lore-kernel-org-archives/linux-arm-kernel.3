Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F068C83F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw74VlTE+k1LGKzfAzB+538GU13x3ojR1l0lw7GXER0=; b=T1KZfYnIIoWgbNM5MAwzcsXeN6
	mg9mDyqa2JL02sEj81uJR+mFJNsrEhXX8AQuDLoQ2rsIwLIM3S6NIA86u2SSOB8j2cB4H4/yDbFEH
	zaXePSbC2s7qMTMgrqhPuTQC86K0uQzDQKuVYWLxNK86fETr/bdd+ojEKhIobY0I6h14+8dI9Nvzf
	z84aAIcgo8RcIu3Q4xeqGd0h5je+8NfcNGO6SAiDYVfaA4cdr4NaZrIny/boPMBNjb0L9QOV7dOUY
	ToiRr9EuSQ+fMihwa1UayBy/ErZcV8Br45iibY1u70wPpPofOOlhTwqPiM2baTEm8hm6w2HmU40LW
	nPwwTnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh5N-00000005TOK-1mab;
	Tue, 15 Jul 2025 14:56:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfhm-00000005D00-21Yp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:28:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45622a1829eso6295505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752586101; x=1753190901; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zw74VlTE+k1LGKzfAzB+538GU13x3ojR1l0lw7GXER0=;
        b=drl/bhRKa992rn1YTEjUwBju4BXLN+gCwipJcZ05DFVtuXwhDO0cV0fae1KRH4W/O1
         sLCUC98hv3wlEn8uE7qp6Mlowf9tdYTVpXic5N3SNA5FziJ+c5PSaYVRV6dQlvhcoXb/
         Ogjb0g2yGcgZt0gzRZTtXdx7UIT3YEB3Tp2AtIS68WfprVR6t2THSM0XMDyKPIdZ8K7Q
         U6y3Xs5EuB+75XImLA3SRZueO1nxmQv+8fZ9Rmex2GuvWSz51FAWeosBioQKMLG7L+51
         MqTdwk++6DfBf+qXXK7RIbyLWzXVkN016UXTnlQ2ssSaJclMvJWIjaubFodHH7uPioSN
         KmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752586101; x=1753190901;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zw74VlTE+k1LGKzfAzB+538GU13x3ojR1l0lw7GXER0=;
        b=Z4I2MLdLXq6L4UAZ45qWSs/dqZ0YQYbX6ldGdd6JyDcrbMqx99K+wuGV3WM3I8x94m
         BFbIan4DR+DI8gxtpKlDJabDIzGyIzgVVJ1TFtkG0EPe3gWIMQ1CN1RTr6Hma8H8CFkh
         iQZKFKCcUJNStqRddxJzJZRE01V/18ku1mHYylkB3SDUfWbnIFwSVcLLf9tUoq7JdByK
         m4ZSD6Aca3arFo2VJUOk/IrS/l0+b86ORBy0XRK6pRE9nQYR+hleQ2jeR6ONSAbgIp6U
         uZbf0xFYofXYyYUlRpjCe7VwERG72d6Zv8WGhTh7KRRSufLz0SbtuwbIi5OkZr2T54/3
         TAjA==
X-Forwarded-Encrypted: i=1; AJvYcCVGjFPUHj9N+bb8cINMNLlBPnpW1m6/6sdI7CGLonoK3pbK0t0xF/Z0dR0UtQybWZ7Fj1AJKHFmZu9dRg8wj80J@lists.infradead.org
X-Gm-Message-State: AOJu0YyxpzX4JZuC31rk4DbQZK5VRpKs+y8EVKIhhl+19Ve2f8M7oiDw
	cCQ96dPAPUnOmZe1el8PCaHNfymB6V3y6mscNDBW5RCl1wZs+Mru8mFnU6c6TIwsyEA=
X-Gm-Gg: ASbGncvAJpseFGw+aLhKa/MsKZJ0/n4JOgYMz3HXg49DE1UPH0VmkVZ6qMrA0+5MLfj
	eamxjmaRbnjpAZgf3xIfTrv3ACBesyxQqfSlJbQZltgazQA5UZxrQAJGbTwfuJ7FTr7A5i4nI7M
	E6Rs436lV3qGBLc9gL2t9xnxhAmSpYQamVbd1WSlKegGCzE/RggvDlaVnJ/pjQNwuqJeEmltgxK
	GD3CXNHceBz7s4+DRxa+bPJP02V9ERkWPQKwaRkADt04Ha1rNMGr31DRHcm+TxePaWsuanHATGx
	LqFmYehHs/sRtKwERt9g46duZ66AI3szenTXPo9xdXHxE7C+vqA+SndXWfZ9Mh30W66HcbdBtvv
	r9DzUjHV3M8IeLOvrBAH6wWEWT0A=
X-Google-Smtp-Source: AGHT+IEwYlVhkOTzgfZvBe2oJ6/DRqksM/2DDeWWAHWtXNUNAJyWtZXeDWpFZAMAarhRitTCjZMLeA==
X-Received: by 2002:a05:600c:4695:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-454f4259c7cmr140093315e9.20.1752586100864;
        Tue, 15 Jul 2025 06:28:20 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd540b52sm161683955e9.28.2025.07.15.06.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 06:28:20 -0700 (PDT)
Message-ID: <80b7c29e-83b9-46a4-826e-d252ad425d4d@linaro.org>
Date: Tue, 15 Jul 2025 14:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
From: James Clark <james.clark@linaro.org>
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
 <e1210c84-69d1-4fb2-88c2-a6a1bcb179c5@linaro.org>
Content-Language: en-US
In-Reply-To: <e1210c84-69d1-4fb2-88c2-a6a1bcb179c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062822_538827_9E804D97 
X-CRM114-Status: GOOD (  28.83  )
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



On 15/07/2025 2:10 pm, James Clark wrote:
> 
> 
> On 15/07/2025 1:57 pm, Will Deacon wrote:
>> On Tue, Jul 15, 2025 at 01:48:03PM +0100, James Clark wrote:
>>>
>>>
>>> On 14/07/2025 2:54 pm, Will Deacon wrote:
>>>> On Thu, Jun 05, 2025 at 11:49:02AM +0100, James Clark wrote:
>>>>> SPE data source filtering (optional from Armv8.8) requires that 
>>>>> traps to
>>>>> the filter register PMSDSFR be disabled. Document the requirements and
>>>>> disable the traps if the feature is present.
>>>>>
>>>>> Tested-by: Leo Yan <leo.yan@arm.com>
>>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>>> ---
>>>>>    Documentation/arch/arm64/booting.rst | 11 +++++++++++
>>>>>    arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>>>>>    2 files changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/ 
>>>>> arch/arm64/booting.rst
>>>>> index dee7b6de864f..abd75085a239 100644
>>>>> --- a/Documentation/arch/arm64/booting.rst
>>>>> +++ b/Documentation/arch/arm64/booting.rst
>>>>> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following 
>>>>> conditions must be met:
>>>>>        - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 
>>>>> 0b1.
>>>>>        - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>>>>> +  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
>>>>> +
>>>>> +  - If EL3 is present:
>>>>> +
>>>>> +    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
>>>>> +
>>>>> +  - If the kernel is entered at EL1 and EL2 is present:
>>>>> +
>>>>> +    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>>>>> +    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>>>>> +
>>>>>      For CPUs with Memory Copy and Memory Set instructions 
>>>>> (FEAT_MOPS):
>>>>>      - If the kernel is entered at EL1 and EL2 is present:
>>>>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/ 
>>>>> include/asm/el2_setup.h
>>>>> index 1e7c7475e43f..02b4a7fc016e 100644
>>>>> --- a/arch/arm64/include/asm/el2_setup.h
>>>>> +++ b/arch/arm64/include/asm/el2_setup.h
>>>>> @@ -279,6 +279,20 @@
>>>>>        orr    x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>>>>>        orr    x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>>>>>    .Lskip_pmuv3p9_\@:
>>>>> +    mrs    x1, id_aa64dfr0_el1
>>>>> +    ubfx    x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>>>>> +    /* If SPE is implemented, */
>>>>> +    cmp    x1, #ID_AA64DFR0_EL1_PMSVer_IMP
>>>>> +    b.lt    .Lskip_spefds_\@
>>>>> +    /* we can read PMSIDR and */
>>>>> +    mrs_s    x1, SYS_PMSIDR_EL1
>>>>> +    and    x1, x1,  #PMSIDR_EL1_FDS
>>>>> +    /* if FEAT_SPE_FDS is implemented, */
>>>>> +    cbz    x1, .Lskip_spefds_\@
>>>>> +    /* disable traps to PMSDSFR. */
>>>>> +    orr    x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
>>>>
>>>> Why is this being done here rather than alongside the existing SPE
>>>> configuration of HDFGRTR_EL2 and HDFGWTR_EL2 near the start of
>>>> __init_el2_fgt?
>>>>
>>> I thought everything was separated by which trap configs it writes to,
>>> rather than the feature. This SPE feature is in HDFGRTR2 so I put it in
>>> __init_el2_fgt2 rather than __init_el2_fgt.
>>
>> That's fair; __init_el2_fgt isn't the right place. But the redundancy of
>> re-reading PMSVer from DFR0 is a little jarring.
>>
>>> I suppose we could have a single __init_el2_spe that writes to both 
>>> HDFGRTR
>>> and HDFGRTR2 but we'd have to be careful to not overwrite what was 
>>> already
>>> done in the other sections.
>>
>> Right, perhaps it would be clearer to have trap-preserving macros for
>> features in a specific ID register rather than per-trap configuration
>> register macros.
>>
>> In other words, we have something like __init_fgt_aa64dfr0 which would
>> configure the FGT and FGT2 registers based on features in aa64dfr0. I
>> think you'd need to have a play to see how it ends up looking but the
>> main thing to avoid is having duplicate ID register parsing code for
>> setting up FGT and FGT2 traps.
>>
>> Will
> 
> I'll give it a go but that could end up being fragile to something that 
> is dependent on two different ID registers in the future. Then we'd end 
> up in the same situation for a different reason.
> 

I think I've run into it already. Wouldn't checking for FGT and FGT2 
have to be repeated when doing each ID register? Now we only do that 
once at the start of __init_el2_fgt and __init_el2_fgt2, even if we 
might sometimes check a different ID register twice. But if we flipped 
it we'd always have to repeat those.


