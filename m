Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2330CE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19hUzouawp/aRIR5i7245sqjFiNHPs9y+KpLGEqgsP0=; b=3pKPD7rM/kcs9UcA7xZ1Ky5IdG
	HQCnCyHLAq9rDCXSczm1NMSoFg8luaoYgpytd0P92ruD1PrHH99ZSabbxfd2rxj9upnkWwQA5ZVcV
	3NhRKG3DORIRZI8aDElG8Yvr7CawkOb9EEzJp34FCK8JHEPp6+ZYguK++RTbmMN4FFXREFkf0OIaD
	k8lfnvC3YfPyKg3FOuvfdRa4eTfllQuCSDPZwyNYCdnvrWNfcWGVkiwPwjKIY0ydS5tvgfR0z2PXf
	xbCD9FCpMfnB9S974PV2063ptBaQ/p9MUuaLaBMYlYuFpWHZ2Hyk4ELNzSWknGN9FxpuqVF1nXG8T
	QMDblwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2pe-0000000BJhv-2sbD;
	Thu, 19 Feb 2026 12:08:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2pc-0000000BJhY-2gh3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 12:08:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so9236805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771502910; x=1772107710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19hUzouawp/aRIR5i7245sqjFiNHPs9y+KpLGEqgsP0=;
        b=sNGPrGZGsDSIP2gUl0SyzV5bR4da81FUlTgfu5aElP9eQhpYkUuZEJC3g97F4VjPp1
         usal2NiC69KWAp9f4y6DCCv/a+pLTbCNuM8AxsM9PdzaA6NhJVzDpAwu6Ha3t74RvtVJ
         8q/pJrQp11+oAg9z0LbZ1fD/mHf+LfWgd5+LnXJwwm+Pl9LpoZ7HmrGe9a5Haab/ENkg
         ouaaZuKzbDOMwuvn1VE9lhcHV8y+v6xzHPzjz7cD3mL4dS5ZAQ4RKMh/Zh7hvd1ujbYO
         Oad4wDbtn2y/fcdOS1QOKeWBjUxMIFIhj7ZbWZMYlfgCphUgCzQEmCqbMZXRshBLPJbZ
         FVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771502910; x=1772107710;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19hUzouawp/aRIR5i7245sqjFiNHPs9y+KpLGEqgsP0=;
        b=RuTlGt6k/MKtOegv7yf1YIro4wX9uh2geWbATpjFMRnU2qRSt74vbyNarCgKkixh5E
         PjwyhW1fnu8hd4jPNmLNrVZ0X6vIouDNXcAFl8oRILjk5pCi1Bn1RWmGLKLRKjaIm6Vr
         gJAUWZ2TWDwFJGE9GVRtkoHKEJloxHP+ltEVByOly6u7k3EuzQzmnOJkTHpS2h752Z93
         mW1O9b40w5cE5kA+v0VDWdBJ2ibeEfA8TV3Sqz58oNoAC7amkHWmOJZBg0oD5J4Jn9Yo
         x7RjdJqZFPimG/tGWmpQIpGZ9JNLccubF12wMqCFqgaq19xp1ybSnSvv4T4T2UUS3AZi
         1+jg==
X-Forwarded-Encrypted: i=1; AJvYcCVOdHKiqZ9AU5rL9Xnaxem4wgP1BprBwC1CRd74g9vca6hnKnfMjny39oqootb8bb2sTLjE+x7nDE88CZN9E/yR@lists.infradead.org
X-Gm-Message-State: AOJu0YwSEIz+kPwnzXsBu8Aww6SwvarquKHPR0WOez2Sbakw+e5y9tMi
	qwHxYCVTlEFc7be2kf7PK2AddV43i9oTfI4gLMDhxVk2C4cGZDBpFncLxYbFYnjQksE=
X-Gm-Gg: AZuq6aJDMcxartRdGFzhTLKB3E6wwxRomS+GTyeQUm0gZ5IYsHpgMgccExiD0b01BBy
	UYSkMZ+fA8A0bifIokS5856Ojvbaa7isuzGeTYPoGLLkIZYPulgj3eW2wX1FNIcgtbVxTEiHLXh
	KDWIB2zz94/o0Zm3NMpUSaXpuUdXz/2XCipKCEb6k01OMPdp7e61gfcvuqzY71Xd3bo5B1ojYR7
	/OnpzWEHvKd44yC8Lx58/ZKNt4czval6ldBPBTNJdvpfPi3gnF4DNOPMcRpJStSEcSwHQ6LFyYk
	IwYIN5/I+1miTITag0iJjIDu3uaYmPiKHodURjJYkXfCUGA58x9HHnzPfxmDtPs2CC37QP4ZneW
	/WgPutQjRNTvzvaR8D5viT2YhFJihLG/IxDBktj3FgKbWumuKJXqSPM+q9QK2xKWdF9oxms9jxP
	ZF+ACNGj/I09j5F5+OW5d5HCHIlrfG
X-Received: by 2002:a05:600c:4745:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-48373a4e7dfmr348245485e9.25.1771502909985;
        Thu, 19 Feb 2026 04:08:29 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f9648cbsm20304135e9.8.2026.02.19.04.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 04:08:29 -0800 (PST)
Message-ID: <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
Date: Thu, 19 Feb 2026 12:08:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
From: James Clark <james.clark@linaro.org>
To: Will Deacon <will@kernel.org>, Michael Williams
 <Michael.Williams@arm.com>, Alexandru Elisei <Alexandru.Elisei@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
 <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
Content-Language: en-US
In-Reply-To: <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_040832_710510_0FFC8A02 
X-CRM114-Status: GOOD (  28.95  )
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



On 06/02/2026 9:50 am, James Clark wrote:
> 
> 
> On 03/02/2026 11:07 am, Will Deacon wrote:
>> On Tue, Feb 03, 2026 at 10:46:37AM +0000, James Clark wrote:
>>>
>>>
>>> On 02/02/2026 7:03 pm, Will Deacon wrote:
>>>> On Fri, Jan 23, 2026 at 04:03:53PM +0000, James Clark wrote:
>>>>> The Arm ARM known issues document [1] states that the architecture 
>>>>> will
>>>>> be relaxed so that the profiling buffer must be correctly configured
>>>>> when ProfilingBufferEnabled() && !SPEProfilingStopped() &&
>>>>> PMBLIMITR_EL1.FM != DISCARD:
>>>>>
>>>>>     R24557
>>>>>
>>>>>     While the Profiling Buffer is enabled, profiling is not 
>>>>> stopped, and
>>>>>     Discard mode is not enabled, all of the following must be true:
>>>>>
>>>>>     * The current write pointer must be at least one sample record 
>>>>> below
>>>>>       the write limit pointer.
>>>>>
>>>>> The same relaxation also says that writes may be completely ignored:
>>>>>
>>>>>     When the Profiling Buffer is enabled, profiling is not stopped, 
>>>>> and
>>>>>     Discard mode is not enabled, the PE might ignore a direct write 
>>>>> to any
>>>>>     of the following Profiling Buffer registers, other than a 
>>>>> direct write
>>>>>     to PMBLIMITR_EL1 that clears PMBLIMITR_EL1.E from 1 to 0:
>>>>>
>>>>>     * The current write pointer, PMBPTR_EL1.
>>>>>     * The Limit pointer, PMBLIMITR_EL1.
>>>>>     * PMBSR_EL1.
>>>>
>>>> Thinking about this some more, does that mean that the direct write to
>>>> PMBPTR_EL1 performs an indirect read of PMBLIMITR_EL1 so that it can
>>>> determine the write-ignore semantics? If so, doesn't that mean that
>>>> we'll get order against a subsequent direct write of PMBLIMITR_EL1
>>>> without an ISB thanks to table "D24-1 Synchronization requirements"
>>>> which says that an indirect read followed by a direct write doesn't
>>>> require synchronisation?
>>>>
>>>> There's also a sentence above the table stating:
>>>>
>>>> "Direct writes to System registers are not allowed to affect any
>>>>    instructions appearing in program order before the direct write."
>>>>
>>>> so after all that, I'm not really sure why the ISB is required.
>>>>
>>>> Will
>>>
>>> We were under the impression that this was required for the SPU as it is
>>> treated as a separate entity than the PE.
>>>
>>> In "D17.9 Synchronization and Statistical Profiling" there is:
>>>
>>>    INDWCG
>>>
>>>    A Context Synchronization event guarantees that a direct write to a
>>>    System register made by the PE in program order before the Context
>>>    synchronization event are observable by indirect reads and indirect
>>>    writes of the same System register made by a profiling operation
>>>    relating to a sampled operation in program order after the Context
>>>    synchronization event.
>>>
>>> That specifically mentions an indirect read following a direct write, 
>>> which
>>> seems to contradict D24-1. Although I thought this is a special case for
>>> SPE.
>>
>> My reading of the the text above is that it is covering the direct write
>> -> indirect read case, whereas I think the case in the SPE driver that
>> we're considering for your patch is when we have an indirect read
>> followed by a direct write.
>>
>> Will
> 
> Yeah, and that text also only applies to "profiling operations", not 
> writes to PMBPTR and PMBLIMITR.
> 
> Upon further investigation you are correct about the isb() not being 
> required, even with the new relaxation. Seems like we just accepted that 
> the relaxation required some change to the driver without really 
> thinking about it. But yeah thanks for looking in detail and catching it.
> 
> So we can drop this now. Sorry for the noise.
> 
> James
> 

Hi Will,

I'm back to drag this up again. So I think all of the above discussion 
relies on the ordering given by the indirect read needed for the "might 
ignore a direct write..." part. But it's _might_ ignore a direct write, 
it's possible for an implementation to not do that, so there are two 
possible implementations:

#1 Where there is an indirect read to give the write ignore outcome
#2 Where there is no write ignore outcome so it doesn't require an
    indirect read

For #2 there's nothing to force the ordering. We're writing to two 
different registers (PMBPTR_EL1 and PMBLIMITR_EL1) and we have to have 
the PMBLIMITR_EL1 write come second for the buffer to be considered 
configured correctly. For example if the old value of PMBPTR_EL1 is 
higher than the new PMBLIMITR_EL1 and the write to PMBLIMITR_EL1 happens 
first then it's misconfigured. That's why we think we need the isb() here.

Thanks
James



