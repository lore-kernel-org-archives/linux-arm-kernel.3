Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5777AEB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CAhwn0L/es+Z/kiWXoW/P41mLkYQ6qC5q4Cz2nXIOA=; b=libNUjlInCyAbBHo9Cf5usPRep
	crL8sOyMZtmAgc7U5ZHNktScOH+bjJpuMbRqM9AkB6mlQOBK4YCm22vaLnUlQvvsIu4Ah/dA2XIx8
	9P3SfQFFXucIwcIUq1I1MTjAjZUFm7y4p5bBBB7JaU02YVJbL8FMibR4GlRhssVh3fnNFaNRRYKfn
	F0rlpcdD0Ns5mrDsDqg5pDKHiN31M108pu3YL3ZjUR+Rzc6wHxdFjY2oVF5Q1fv90KHW1nqOYf1Vd
	1UHCSj0lRBCtvVv5iIiS83id4ApOgpCVlkoKbZA0ZY/Gg6oO7Y75v/G8j85A2dqwQIBXEojbAgrra
	4lys4zrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiF7-0000000GqS7-2koa;
	Wed, 04 Mar 2026 09:10:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiF5-0000000GqRF-3DVh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:10:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so645784f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772615406; x=1773220206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CAhwn0L/es+Z/kiWXoW/P41mLkYQ6qC5q4Cz2nXIOA=;
        b=hACOboWbHre4UPPwNoOeq2/PApnLLiVxuJ9jqg3c+j9+YhKrv7/OjUOQHNYu63K8E9
         M5eUEmSnXSJAE5UEkaxe5tmMV/UKiHEQklX+iCKlAaoreKo37oQT/0KKzUM+lyyNDgYd
         r+jKu0IyWbAAW0uAU8L5mtahzcoQTtszC/vxF3vCAXOLyneH6pOqWIiTiLWXCGzuDNpM
         I+Dh9ASuOWFsBMlNx//842JZS55xokAEholWQzKzAFtJnF3vUwcbxmxzPgPnlruoADFI
         pvnnLmDTXGLhq9kzS7UGqAr3SS0JYbHntgoYWbiJfVVciHcOGD2D+EYParT8aFdwZ+Lv
         Ry1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615406; x=1773220206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CAhwn0L/es+Z/kiWXoW/P41mLkYQ6qC5q4Cz2nXIOA=;
        b=lawWK730rnknQhVT1GLLf8wvRTuRsw0V92zJvvQmKCh/swc6kNx2iUxSlQqXDDUwGk
         PaFkwjVRSPHhgP851eememYNR9LLvRxGLDBzFbX8mxRCNWsiW7w25h2CYWHfAzxQbs+D
         xd4osgL4muxM+FnCWscK0AZzQGj8nvCc1vv+UlTz5SlSxFX9bdMpdOQfvfT3KyGXA4ig
         GdbjgSlKaB2RvaL+ncPiJEiKCIMW7E0+k+11u6BxGda1CtfxVZyJfNJ/444yO9qncmK8
         L0rWdlaEqKJRTGIrcMdqPd1EWP7GYTNqceGeWdp0woP6Sxc7tofz9VE8aZIBWAF33i4R
         2K6w==
X-Forwarded-Encrypted: i=1; AJvYcCV7AFFtfLnlG4hL99GnPE0YazbEujD+spUb7N3gjvoZQX8CHtT4vEFIRevje5cUhwUe0OyYinkgdNM7DbTlPQWc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw60VoKWd0gixbDdgR0tOAIzodnXJGp5X9Izz0Ty6rYl11BY42t
	yxa0FKO9jS/yk+F4Uoff6CLi7eCysCaUpbRBD/RR0ItiCEOlXaTsxBpdxgZiYibbFq4=
X-Gm-Gg: ATEYQzzxDVAwc2rTyhM3X6+vzg6w/XUcpkhkZbcdtcT9hNYur5KGdUUT+LGAZ/yEd5X
	523ogdyqiDqMU1stiGgg6Hc9kE/TCxGe805klCrfIFyw+lBzuGbOzbCTsPIZUsJS5QyWBv4GGbJ
	S4E65i8vo7Doafl9dndXSuHT0KJHNDfPQE+Rxhtx477CmNl+lfkFe10ROTqZ1Zmy7sbvBCkcF7K
	UbZ0PLwHmPPJBFYIxQRIHUkiyMkRjeFKBh1nMFdPpoqS3xbXjO67hX5aBQdTrefsOgkH6tCHdcw
	OvSnI1wLfhFyOv2TsKiZ5GR6xR1NrSP81M5EoGpHd61bUQYE+nQ2IBJgzB6wt20WdQum3M+eUeT
	vDyRKqQ0K4o8Sj892r7mXXqu11QAAwYSFG5qwp9/vvLyINM/2GIcqcheV5k7XaGNI8R2ItDLhq0
	dh8SSaD0Mx0LN02Z+qQ5KqnlBh3Qxe
X-Received: by 2002:a05:6000:604:b0:439:b744:c5fe with SMTP id ffacd0b85a97d-439c7ffcb6emr2262601f8f.52.1772615405678;
        Wed, 04 Mar 2026 01:10:05 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm17858078f8f.33.2026.03.04.01.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:10:05 -0800 (PST)
Message-ID: <7b008bb8-47de-450b-823f-29d28b2366f0@linaro.org>
Date: Wed, 4 Mar 2026 09:10:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] perf arm64: Send pointer auth masks to ring buffer
To: Jakub Brnak <jbrnak@redhat.com>
Cc: James Clark <james.clark@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, acme@kernel.org, Andrew Kilroy <andrew.kilroy@arm.com>,
 Vince Weaver <vincent.weaver@maine.edu>, Mark Rutland
 <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 kristina.martsenko@arm.com
References: <20221020101921.1219533-1-james.clark@arm.com>
 <20221020101921.1219533-2-james.clark@arm.com>
 <Y1F8DUWaWhlh/phL@hirez.programming.kicks-ass.net>
 <4e50b890-0588-1551-fb7c-6cd8191d1054@arm.com>
 <Y1q914IVy6XgE1xq@hirez.programming.kicks-ass.net>
 <133c2f4b-1ca5-2d0c-f4f4-e01ff5e028c8@arm.com>
 <aaW7s-ISz1QGpmqB@jbrnak-thinkpadx1carbongen9.tpbc.csb>
 <197f3d1e-5d1e-4b2d-a12b-782287eecc43@linaro.org>
 <aab9ioyUSAZ7n8Gw@jbrnak-thinkpadx1carbongen9.tpbc.csb>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aab9ioyUSAZ7n8Gw@jbrnak-thinkpadx1carbongen9.tpbc.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_011007_885647_BEDC9CF2 
X-CRM114-Status: GOOD (  36.50  )
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



On 03/03/2026 3:26 pm, Jakub Brnak wrote:
> On Tue, Mar 03, 2026 at 10:38:23AM +0000, James Clark wrote:
>>
>>
>> On 02/03/2026 4:33 pm, Jakub Brnak wrote:
>>> On Mon, Oct 31, 2022 at 01:48:56PM +0000, James Clark wrote:
>>>>
>>>>
>>>> On 27/10/2022 18:20, Peter Zijlstra wrote:
>>>>> On Tue, Oct 25, 2022 at 04:28:12PM +0100, James Clark wrote:
>>>>>
>>>>>>> Why do we want the same mask repeated over and over with each sample;
>>>>>>> should this not be part of the address space (side-band) data?
>>>>>>
>>>>>> You are probably right that it could be done that way. The reason that
>>>>>> we did it this way was to be consistent with ptrace feature [1] where it
>>>>>> is delivered to userspace on a per-process basis. And there is also a
>>>>>> prctl for the enabled key types [2] which can be changed dynamically.
>>>>>> Particularly for the last reason is why it was done per sample.
>>>>>>
>>>>>> Having said that, the enabled keys field is not used by perf, only the
>>>>>> mask is used, so I can drop the per sample data until enabled keys is
>>>>>> needed, which may be never.
>>>>>>
>>>>>> I'm going to assume that perf shouldn't use ptrace because of
>>>>>> permissions and conflicts with debuggers, so I could put the mask
>>>>>> somewhere like PERF_RECORD_FORK instead of per sample.
>>>>>
>>>>> Yeah, or create an new RECORD type which you can also send around at
>>>>> prctl() time.
>>>>>
>>>>> The only thing that's needed on top of that is exposing the mask
>>>>> somewhere in /proc for existing tasks; which is what perf also uses to
>>>>> syntesize RECORD_MMAP events on startup etc..
>>>>>
>>>>
>>>> Hmm ok, in that case I can just add the /proc interface for now because
>>>> the mask won't change and we can add the new record type at the point
>>>> it's needed in the future.
>>>>
>>>> Thanks for the feedback.
>>>
>>> Hi all,
>>>
>>> Does anyone know how this issue was eventually resolved?
>>> Specifically, is the mask for the pointer authentication bits
>>> currently exposed and stored somewhere in perf.data so it can be
>>> used when running perf report?
>>>
>>> Thanks,
>>> Jakub
>>>
>>>
>>
>> Hi Jakub,
>>
>> No we never finished this, you're actually the first person to mention it.
>> Can you give a bit more detail about your use case? Maybe we can dig out the
>> old branches and work on it again.
>>
>> For a summary of the current status, frame pointer unwinds in the kernel are
>> working with pointer auth because the kernel strips them.
>>
>> We patched libunwind for support on commit f67ef2867bc5 ("Unwind with
>> pointer authentication on arm64"). And libdw on commit 0af6c7289c22
>> (libdwfl, aarch64: Demangle return addresses using a PAC mask). These two
>> were to support dwarf unwinding, but the kernel changes to expose the mask
>> and Perf changes to pass it to the unwinders were never finished.
>>
>> Thanks
>> James
>>
> 
> Hi James,
> 
> Thanks for the answer. I was investigating a failure in one of the perf tests on
> AArch64 RHEL-10 that verifies stack unwinding using DWARF, and it was consistently
> failing. I dug a bit deeper and discovered that DWARF unwinding in perf report does
> not work correctly at all, and addresses polluted by PAC bits are likely the cause.
> I stepped through the program and observed that in libdw the code path responsible for
> masking these bits is executed, but the mask is always set to 0 and therefore has no effect.
> During the unwinding process, there is a structure that is supposed to store the
> mask and use it later. However, since perf constructs the unwinding context offline from samples
> and currently does not store the mask anywhere in perf.data, there is likely a no way to propagate
> it into that structure. It would be nice if we could push this forward.
> 
> Thanks,
> Jakub
> 

Sure, I can put it back on the todo list.


