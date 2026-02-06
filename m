Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B1AEA795E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vq4afyB4nOZV3ntLdfaJ1K/gi8ayC5ysivYWyKh2NcY=; b=ba9fyUGwN9FzgmTbbMSOOCMwHP
	1qOiRTkX6Rhx0L1YWgA+8DULRIwjmpsqDsyf9VHu2uZuZtyglczC6Rk3ggIKZAAhcK8dMr6RwWGB7
	4ctE6qqcID3aBDuKNNkhvaEY+8dL2NtD1AtHFSMELRhMEJKpaD38/9zHlE37gAT1bcy7AIfcTOwpH
	XBBOPKihFu3wLmV2aAuacRD0ZAQ5QXYWJ2b4ESH1/0NpdDOYSC7YDwEncDDOJn1W5ANdmonQUgKuN
	5JB2KFT7srVyX/pp8irHr/Fzd/sM5jhlFxlXEXWunExwtbAE+KbRdqqO/bAATqbHMBTEX6PSrRQ0Q
	1AxZUi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voITy-0000000B7q1-2w96;
	Fri, 06 Feb 2026 09:50:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voITw-0000000B7pg-1eIg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 09:50:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso16509595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 01:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770371430; x=1770976230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vq4afyB4nOZV3ntLdfaJ1K/gi8ayC5ysivYWyKh2NcY=;
        b=dBdKhF2xy9BCvvYoq1P7ncxwBl1ebo8rEMGs0LzYiZ9cHygOIZluXfMT6DNB8EIAMb
         AzdUXX/l5LHbhrwyMN91q7ur3osAgYme+4Vn+skCdaGIqwESKwg+L14oaMqcUzj8bKv/
         RMYLYh9zcoFkGO9kSTkmawA/6xkgMe748gJlnPaihrtxCE8hslJh9i7vtnKvZ1q1HjHk
         /iJXeUXrsmsH5artQrMgFojPWqV+6E8QRJ4NbZ0+NnQaYf8ZOmfKq4GYQxxTjk5Ijijt
         JPt8mdoimoK5tGeNlXLG3rqDNHLfN1cFvFjOjWZK7tI+07VDixbAw25dU5BPk4lWHOWW
         TaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371430; x=1770976230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq4afyB4nOZV3ntLdfaJ1K/gi8ayC5ysivYWyKh2NcY=;
        b=owFG1THP9ReLdHLJN6q66mBwxNlv8PYL4ndlWl+Gh7WFoC/8bPVoLArtS28MxMo0zO
         PUfuJYq8TTRvlkh53YpCELDJo7p9He7KJ+7D54k0IBJfreeouj1k4AVdMU+3VN6C4Quy
         cDflVjYnV79xXLTZqveOLR1V9jpxJrAaWeSfHdOg+6eAKyNHUaCLVYSNLHvBU1tP8D+F
         SJNgF0mtxXTnvAxSIOnjNgHc1IvPBdCM8TBij8RoEkKBlUzgsUu8a5T7RyjyHIvwmguc
         7h6t4wd5pPtCavHJavd8gSZvJfyf3sW+DbjzlPQHWRENIDbXW/g5uwlVyKEfW4q2Oca3
         IHbw==
X-Forwarded-Encrypted: i=1; AJvYcCVWncJcUqAbFOoeL3OOh5zwq+Q+CeZ68PV7N3YsLno+njbOyQnwU/QQnc4o8mpL6IThMYmpAqBSYdUXF3EwPf/D@lists.infradead.org
X-Gm-Message-State: AOJu0YyH+LDSK/gNlAmXP3B37+LwNBMBoSwYuu1vCqHAN+FwTG3onKnl
	dWjDgGamVaIRqs1TpLPNCanUMAVr5qQcLBGF9BuEVosHYxRjOndjlehqCc+Y4PgW8HE=
X-Gm-Gg: AZuq6aIUHE8bJTDKUfXLlll69ge7Ii4GfcGRP3FLw1+E3cDLNUxeiE+toBoo+Vp86wB
	7IXGPUhM8MyKmczHAtWHFHdamLeB/NSVP7nd8eM/Rpeu00HcabeZORRkSNDkJGI6sn+FI2mlzAD
	40DvMTL7S2XEabzkiIddLTyzPmDaxsjd7kxnGmjBz7ByRePtuV+ncRJdHZZOhTIv26J8/ZTwCwc
	uXiy72EE4rdAiZr9lFJH994w1feVIIGPgwM4cUZZMSOPBpr52jlAEL1PhWIKtCAd4uFimgDcmqs
	VuCvHoIrl75q4pkNfPwIeFSTsE4VP99mQqMyue1l6YE2fODSMKl5VkwKPq1WtQ5+QU77OcboyrG
	vQsANHreizYFm0x809+RhIkmiWMlmlGdZTyvJSMqx8DrV5b9SO07GltLkozU6EYMCGa2vKmLThh
	t4beKQZr5Ks8Sb15sb
X-Received: by 2002:a05:600c:34d1:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-483201dadccmr27868905e9.3.1770371429302;
        Fri, 06 Feb 2026 01:50:29 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm147954785e9.0.2026.02.06.01.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:50:28 -0800 (PST)
Message-ID: <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
Date: Fri, 6 Feb 2026 09:50:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aYHXCkFZcVm1L_25@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_015032_480682_75D72EE7 
X-CRM114-Status: GOOD (  23.82  )
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



On 03/02/2026 11:07 am, Will Deacon wrote:
> On Tue, Feb 03, 2026 at 10:46:37AM +0000, James Clark wrote:
>>
>>
>> On 02/02/2026 7:03 pm, Will Deacon wrote:
>>> On Fri, Jan 23, 2026 at 04:03:53PM +0000, James Clark wrote:
>>>> The Arm ARM known issues document [1] states that the architecture will
>>>> be relaxed so that the profiling buffer must be correctly configured
>>>> when ProfilingBufferEnabled() && !SPEProfilingStopped() &&
>>>> PMBLIMITR_EL1.FM != DISCARD:
>>>>
>>>>     R24557
>>>>
>>>>     While the Profiling Buffer is enabled, profiling is not stopped, and
>>>>     Discard mode is not enabled, all of the following must be true:
>>>>
>>>>     * The current write pointer must be at least one sample record below
>>>>       the write limit pointer.
>>>>
>>>> The same relaxation also says that writes may be completely ignored:
>>>>
>>>>     When the Profiling Buffer is enabled, profiling is not stopped, and
>>>>     Discard mode is not enabled, the PE might ignore a direct write to any
>>>>     of the following Profiling Buffer registers, other than a direct write
>>>>     to PMBLIMITR_EL1 that clears PMBLIMITR_EL1.E from 1 to 0:
>>>>
>>>>     * The current write pointer, PMBPTR_EL1.
>>>>     * The Limit pointer, PMBLIMITR_EL1.
>>>>     * PMBSR_EL1.
>>>
>>> Thinking about this some more, does that mean that the direct write to
>>> PMBPTR_EL1 performs an indirect read of PMBLIMITR_EL1 so that it can
>>> determine the write-ignore semantics? If so, doesn't that mean that
>>> we'll get order against a subsequent direct write of PMBLIMITR_EL1
>>> without an ISB thanks to table "D24-1 Synchronization requirements"
>>> which says that an indirect read followed by a direct write doesn't
>>> require synchronisation?
>>>
>>> There's also a sentence above the table stating:
>>>
>>> "Direct writes to System registers are not allowed to affect any
>>>    instructions appearing in program order before the direct write."
>>>
>>> so after all that, I'm not really sure why the ISB is required.
>>>
>>> Will
>>
>> We were under the impression that this was required for the SPU as it is
>> treated as a separate entity than the PE.
>>
>> In "D17.9 Synchronization and Statistical Profiling" there is:
>>
>>    INDWCG
>>
>>    A Context Synchronization event guarantees that a direct write to a
>>    System register made by the PE in program order before the Context
>>    synchronization event are observable by indirect reads and indirect
>>    writes of the same System register made by a profiling operation
>>    relating to a sampled operation in program order after the Context
>>    synchronization event.
>>
>> That specifically mentions an indirect read following a direct write, which
>> seems to contradict D24-1. Although I thought this is a special case for
>> SPE.
> 
> My reading of the the text above is that it is covering the direct write
> -> indirect read case, whereas I think the case in the SPE driver that
> we're considering for your patch is when we have an indirect read
> followed by a direct write.
> 
> Will

Yeah, and that text also only applies to "profiling operations", not 
writes to PMBPTR and PMBLIMITR.

Upon further investigation you are correct about the isb() not being 
required, even with the new relaxation. Seems like we just accepted that 
the relaxation required some change to the driver without really 
thinking about it. But yeah thanks for looking in detail and catching it.

So we can drop this now. Sorry for the noise.

James


