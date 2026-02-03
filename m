Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40035E83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jivzn1TaUgvG4Fo6r5Dps174hoUliqTt6Of7Vkws0qw=; b=ScrFVfZSorWHCdRVaHufci07GJ
	esi9v5VzY+zkzgRmZGaf0U2eVr3JgNDf/ck1C6ZN75taePhaGBfTHGXMCBX1d16wOHLSNm5FvwSGQ
	4qqPeHOxhfscfvoOxrCwOvp7X7KB9CsEIRXItFGhw2Xv8l8s9hQntN+0yoAhd887HFEJ7MZotaN6B
	L03DPnPvTLmNGYg2pTEWCvYGxcqDhDZ21kMJHpTrRxzoE7Le0rng4WNysfVcj6SwTiV5ksJ2rDmG8
	5k1mQGqn84KMAcXn5bh0cois6PChOcK3qQmz1xgnoGxifATEwsZEG9xvILI0/PSiUHJ9ijKKkaTlh
	3kj9zlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCjT-00000006N6x-1Nhj;
	Tue, 03 Feb 2026 09:30:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCjR-00000006N6H-02RT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:30:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47ee2715254so28941185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770110999; x=1770715799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jivzn1TaUgvG4Fo6r5Dps174hoUliqTt6Of7Vkws0qw=;
        b=SPQOzqxjpi1AOuvlMqtjHALCuucFxmkqHwqewxvUikHKTjIgxy7FsgyzrNktkFZYAX
         XD5kC25Ld23ByTJszJYbSx3F/v1AYMi96fHC2aNKFVZUyOQM1y4kTKaXU7G7EmTPr+3a
         ijJQ9HmoKAx5ZzdAU6YtK/07vdrK5JRN7U1e33wXRHc4Zpz1qMIEgWnXyUV+N1VXXQRv
         sItsM/FQ0LdldHuf6X7WZA6BquTYgNChauza4Wnmkc6E8ByLVXmSYgx84JLSKRUnIO16
         U/1nEHHYP3BY8+fsHFJXo2asyaUpt73JZDd/ybaf5p/iLOK58OjdVNvbItmNOAjdswex
         rXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770110999; x=1770715799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jivzn1TaUgvG4Fo6r5Dps174hoUliqTt6Of7Vkws0qw=;
        b=UbXg0ssBIxKbNqWtTrDkZhqLah9MFIiacNznkvuc7EC0N3F9X5MHXivrzTGHpkTJlT
         DThQDJaaTGX2nwldjscKirk86x1nGu0/8Hk282/IldAyYwHJqQ7g4HsrIyNgsvLTud9m
         gyd5015OSx9EAQj/cfxiB5TMH4jR0YC3iT3EBKbuIk03x91+lC1vYbjGoIZP0dx4Pjsg
         RXL+ZJ7Q63+UmkasZzLZ3YfOjh4UMZ3BszxrGz6wqYqQIiiit8pwKoEMrDU8J5FjwZvM
         w+M8yJWlcAWG5t39fg0A4j2sDbo9ESNaRDled+yuuZOM2R00wvKs4Hxa47swHyF4Vtyk
         sCVw==
X-Forwarded-Encrypted: i=1; AJvYcCV/YY0x3Rh8FQNeUcMhFyZT8t7X8+U2XgJgyX0Kjso95otPD5zNNtoyC4AzFmn3RVVD3eIlm8Bmp1L3Ax8THUNV@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ/do7ObtmTlv1Aycyyqc0HwPsq253B9qL4Y9tTZoGM1aDelFu
	kaEeNjyUz+fZLNr6//pkJ+D75N8mO/vPgRFcOo/vXoELWvCTRg5nGEKeeYwghbIUjJ4=
X-Gm-Gg: AZuq6aL7tHoa5xsgz43Ffld7BANhdLEMkWVACKZhQR+5joSz+oanMLqkAZdC290IBej
	q/4BYcfamdhNfN7t8acIqt8o5fyJrDQyjcfZ9MxY7sp8WggDHQnjc7PS/t+uXy5LJJLgyaxJEDO
	xzbMokcHkG47e1ir2iFugwiY4rR+sRKXvYBa8dPN5aLOTsHvGM55hKC5GSW50SG+o/SSv7METnC
	AF2B+2aXNtJ9YAvOcs11Xh2EM9MZhwooNuG1R6U54K/QVpkZDcGxcLzeed7bTNe4H56YcLLTLpt
	ZuHlbHBGWA+ypxtP8Q12acjMzelED/BgzE4A8wkHG6FmJIkNQ88mwR7ZLsgWQ0dqXxm7HusRzHe
	VFo0NO7ZsfztIUOPOAgTPHhrFwLxmw9YNn4SGKAcIWXgHoTsooNrxicgMTaq2wia3E5ZUNYPL9Z
	jOBCBPLZhIAT+N9vfS7kSzTHIqaW0=
X-Received: by 2002:a05:600c:6092:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-482db4592cdmr187515455e9.1.1770110998696;
        Tue, 03 Feb 2026 01:29:58 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830511cc93sm58758885e9.2.2026.02.03.01.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:29:58 -0800 (PST)
Message-ID: <95e205af-3dec-48c7-8a0d-293629f1551b@linaro.org>
Date: Tue, 3 Feb 2026 09:29:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
To: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <20260130202437.GB3481290@e132581.arm.com>
 <aYDWpc8Jh4SqMcD5@willie-the-truck>
 <20260202184234.GC3481290@e132581.arm.com>
 <aYDzh1B9Cnr_expJ@willie-the-truck>
 <20260202191402.GD3481290@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260202191402.GD3481290@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_013001_082207_FC12C35C 
X-CRM114-Status: GOOD (  21.68  )
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



On 02/02/2026 7:14 pm, Leo Yan wrote:
> On Mon, Feb 02, 2026 at 06:57:11PM +0000, Will Deacon wrote:
> 
> [...]
> 
> 
>>>> I'm not sure I follow your logic as to why both ISBs are required, but
>>>> I'd have thought that if perf_aux_output_begin() fails when called from
>>>> arm_spe_perf_aux_output_begin() in the irqhandler, we need the ISB
>>>> because we're going to clear pmblimitr_el1 to 0 and that surely has
>>>> to be ordered before clearing pmbsr?
>>>
>>> I think the ISB after arm_spe_perf_aux_output_begin() in the irq
>>> handler is required for both the failure and success cases.
>>>
>>> For a normal maintenance interrupt, an ISB is inserted between writing
>>> PMBLIMITR_EL1 and PMBSR_EL1 to ensure that a valid limit write is
>>> visible before tracing restarts.  This ensures that the following
>>> conditions are safely met:
>>>
>>>    "While the Proﬁling Buﬀer is enabled, proﬁling is not stopped, and
>>>     Discard mode is not enabled, all of the following must be true:
>>>
>>>     The current write pointer must be at least one sample record below
>>>     the write limit pointer.
>>>
>>>     PMBPTR_EL1.PTR[63:56] must equal PMBLIMITR_EL1.LIMIT[63:56],
>>>     regardless of the value of the applicable TBI bit."
>>
>> Hmm, so let's say we've executed the first ISB. At that point, the
>> Profiling Buffer is disabled (PMBLIMITR_EL1.E = 0) and profiling is
>> stopped (PMBSR_EL1.S = 1).
> 
> This is not true.  PMBLIMITR_EL1.E is always 1 during interrupt
> handling.
> 
>> If we *don't* have the second ISB then either
>> PMBLIMITR_EL1 is written first or PMBSR_EL1 is written first. But the
>> text you quoted will only come into effect once they've both happened,
>> right? In which case, why does the order matter for the success case?
> 
> Yes, both PMBLIMITR_EL1.E == 1 and PMBSR_EL1.S == 0 must be true to
> enable tracing.
> 
> However, the tricky part is that PMBLIMITR_EL1.E remains 1 throughout
> the sequence.  Writing PMBLIMITR_EL1 effectively only sets the limit,
> while clearing PMBSR_EL1 is the distinct step that enables tracing.
> 
> Thanks,
> Leo

I think Leo is correct that the old isb() is still needed. I removed it 
under the assumption that PMBLIMITR_EL1.E was unset in the interrupt 
handler. Possibly because the previous version re-arranged the handler 
to do that.

If PMBLIMITR_EL1.E is set, we have to make sure clearing PMBSR_EL1 comes 
last as it's the thing that defines the point where both pointers must 
be correct by.


