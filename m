Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363C2E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wWERID7Ml99UJJW0whYVuGDsSB2aN5R/H1f4BW4+Uk=; b=XlMPcBlEfMcdIZuxJ5LMfwC9qo
	G2rcdkUkVZICAwK/9ML8ZpGGSbWpaga4NM7dGHs2aAEuW0eU47GdNtPuDxhu15uHseKT6bSjvemu+
	ofJ1lTUM0adYt6HNeT60JxD/Mrv5ms1bMVQcDuW5XCJzutJ78J2z/8Z7a4F1x7gmvFvUlDkHvYFim
	mdgDaLGYpkM2NCR4rDdhVSJIFUNmrGaWFgPvhCoxFMlvjt5XszoLgjdkrmH7RBxqpPDnxXeHsWmML
	BUWwKmZi3MnuTtMLOjnD7VcJe+IANpEwzSgJYvF5q/EUiqTYF1Ano/DKQmvsnGg5PqlpbmduAE7zL
	WLe0XamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4oS-0000000BR74-1ZgM;
	Thu, 19 Feb 2026 14:15:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4oQ-0000000BR6e-0OIr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:15:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so167379366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771510524; x=1772115324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wWERID7Ml99UJJW0whYVuGDsSB2aN5R/H1f4BW4+Uk=;
        b=Zd5e3R/ucGmu5Wmi5X+wLWxpDoPEk2zYaTDysLjYkAvf49JV6xCd/k/xzRO+jOBQkq
         dAdmEhXjFfC1r7Nk8xRQ0fXFcsc4g/pDXfmeFSuwA6egWdvefGN/YEA9upFnyAf4BMkV
         PrJYc3rHFrES32ys2bD/w2vl/xutyMvznJSqEFv29v5wQGb1QNuZzO+Ef2L62GUDcSLS
         /KUt7M/dsaqs/Jbh/rbWgGySbthkDy+f2Ud1GtqqzywrDhapjHWvz+RmoBp4DnoBbhOW
         2VgBQfkvQxC1v2jWVWAzwseBmxkzp1kwVVcI18pbQH6wCyQODDdY+Z+N6PCz3bh0Y5U9
         9emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510524; x=1772115324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wWERID7Ml99UJJW0whYVuGDsSB2aN5R/H1f4BW4+Uk=;
        b=hrnl4H6QOD6OIH9qWSa1rZTE81YLtCIGvbO2gcglpcUBYRIcmWgkhcADSaTufKjvxc
         o57cQvtPWIovYRk4cvODuLLGVgyFDlP8+1As4fop1qhPiZQTPF3ohKF4i5bZDfmONsvK
         N5Ax8VqMpICt159DCxWMQCm/POHutg+KTaZNOa6WTX42YuBqIdH0+PYps1j/536kHFhY
         NTKSkT+xDICppjYLl+fcrJ5lO2yLqXrE/cW2FVJppuEv2zY1TLs/3Hxsy878LOPJnleq
         6NsvHfrip+zG8Uwjf+ZxMHkNXmzrHCTCYHLv35rlYKFwotdHGsa4C7o1uCx3M7AXBZwl
         34Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXW03w5+syC40nxujBW/pDAwS58+sOjLq1rX+Q8jPDmTFOfke3MdUB+2QN9XZZPmV3EsI88nNSm7CoRjJBbE7U1@lists.infradead.org
X-Gm-Message-State: AOJu0YxiEo1Tq/QPH6aXtdCbn3gs4zLYpmXCi/BWyxYhWXdj7M3lknUT
	JgMteS1Ugzf/fnz0sNlTrD71GI8QC54Zc1P0ADxQQfSUie5szyk16rf3E+chjxgMHz4=
X-Gm-Gg: AZuq6aI+EmcTIoiXKsXYK3H6LsNkRuETJiVOLfF5KmK9pU9XEKrk/rtbu0XmF0p9rdm
	pDGnZ8eA2i22hi5KE1bi0bup9GesgeJTgqt0LbfJ/Ji0Ux5qJB9Pd2OXnL7TkOCOEfLYPg8BhYH
	4XaWurjGnEDwxqD23x4slOaDG5jpWQgwwlCoOGzpu/sUateZmbiz/AcogikyuYbzIvs4NySoHKn
	xQz+iiIP5GOB7Gu9u/22E2EY0cF/zSJlV4DWp6VjI/7CrNJ+BJ02TG6Pmq8uuC1dIRfBLWJk5w0
	X1MijldQ8Cslp2ZA+q86/n8D7MyOMvokIA67LD0i7eZamF+W7JzgZbpXut/dj3WF/Bt6sPyNcqr
	dBzs+/Wp+zCOtEPK0Qv5HegBKPLgdCr+yrP3U5lby89Cu0ZpxMIOVNeEzPPBHJ6YOZKZOiNFeOH
	bH2bHaCnO7xYOX+BhqOnp3EfFMPOQW
X-Received: by 2002:a17:907:72c6:b0:b87:39d:2bb4 with SMTP id a640c23a62f3a-b903dd049b9mr353165066b.59.1771510523782;
        Thu, 19 Feb 2026 06:15:23 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bfesm556068366b.44.2026.02.19.06.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:15:23 -0800 (PST)
Message-ID: <2d5f6207-afa2-4880-b34d-f03b5ebf3b5f@linaro.org>
Date: Thu, 19 Feb 2026 14:15:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Williams <Michael.Williams@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
 <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
 <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
 <aZcIy1Or4c5-i7Tm@willie-the-truck>
 <7b692e5c-d376-4023-80e0-76c9d9c0604f@linaro.org>
 <aZcYLZ9wETnRDJ7P@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aZcYLZ9wETnRDJ7P@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_061526_191003_7402B9E6 
X-CRM114-Status: GOOD (  27.50  )
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



On 19/02/2026 2:03 pm, Will Deacon wrote:
> On Thu, Feb 19, 2026 at 01:51:26PM +0000, James Clark wrote:
>> On 19/02/2026 12:57 pm, Will Deacon wrote:
>>> On Thu, Feb 19, 2026 at 12:08:27PM +0000, James Clark wrote:
>>>> I'm back to drag this up again. So I think all of the above discussion
>>>> relies on the ordering given by the indirect read needed for the "might
>>>> ignore a direct write..." part. But it's _might_ ignore a direct write, it's
>>>> possible for an implementation to not do that, so there are two possible
>>>> implementations:
>>>>
>>>> #1 Where there is an indirect read to give the write ignore outcome
>>>> #2 Where there is no write ignore outcome so it doesn't require an
>>>>      indirect read
>>>>
>>>> For #2 there's nothing to force the ordering. We're writing to two different
>>>> registers (PMBPTR_EL1 and PMBLIMITR_EL1) and we have to have the
>>>> PMBLIMITR_EL1 write come second for the buffer to be considered configured
>>>> correctly. For example if the old value of PMBPTR_EL1 is higher than the new
>>>> PMBLIMITR_EL1 and the write to PMBLIMITR_EL1 happens first then it's
>>>> misconfigured. That's why we think we need the isb() here.
>>>
>>> I thought profiling was disabled in these cases, so why is it
>>> misconfigured?
>>>
>>> If it is misconfigured, what can go wrong given that we're either stopped
>>> or pmscr is clear?
>>>
>>> Will
>>
>> It is stopped in the interrupt handler because PMBSR_EL1.S = 1. But in
>> arm_spe_pmu_start(), PMBSR_EL1.S = 0 so it's not stopped. And with
>> PMBPTR_EL1 still being set to the value from the last session it could be
>> higher than PMBLIMITR_EL1.
>>
>> PMSCR_EL1 doesn't affect SPEProfilingStopped(), it's only:
>>
>>    boolean stopped = (PMBSR_EL1.S == '1');
>>
>> The conditions for when the buffer needs to be configured correctly from
>> R24557 are:
>>
>>    ProfilingBufferEnabled() && !SPEProfilingStopped() &&
>>      PMBLIMITR_EL1.FM != DISCARD
>>
>> I think even if PMSCR_EL1 is clear you can still get a buffer management
>> error, even if no samples were going to be written into the buffer. It just
>> says:
>>
>>    While the Profiling Buffer is enabled, profiling is not stopped, and
>>    Discard mode is not enabled, all of the following must be true:
>>
>>    * The current write pointer must be at least one sample record below
>>      the write limit pointer.
> 
> ... but doesn't that mean that R24557 is a breaking change to the
> architecture? The current Arm ARM doesn't appear to require this,
> existing software doesn't honour it so why should we hack extra barriers
> into Linux?
> 
> Will

Yes I suppose it is. The current Arm ARM doesn't require it, but R24577 
is in the "known issues" document for the Arm ARM, so it's saying the 
ARM is incorrect here and you shouldn't trust what it says.

   Arm Architecture Reference Manual for A-profile architecture: Known
   issues

   This document includes the Known Issues for the following documents:

     Arm Architecture Reference Manual for A-profile architecture
     (DDI0487)

Presumably the fix will make it into the Arm ARM eventually. There is 
certainly a discussion to be had about whether this is a good change to 
make or not, but at this point I'm only concerned with making the driver 
correct using all of the information that is currently published.

I suppose there is a chance that this could be deleted from the known 
issues and not make it into a future Arm ARM. TBH I have no experience 
or feeling to say how likely that would be.

Purely from a software point of view, ignoring the new rule despite it 
being published here doesn't feel like it would be right.



