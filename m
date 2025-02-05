Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30664C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SylEMFUGGjut9Z/r0Vs1FQy1begfn1Z+13Ei115fRk=; b=lZYYnIojYioudw10PMA5oS16Ma
	JfUQ0hFOCQWfMo18G5q2H4298t9RadKlBffdnsHv4C1U+MeL6mpaLUJo8GUa1eGKcWjkwRIP0xyjC
	rQfZroRw8huN0+IyQA6mDBLhA+V+qH5obPHAd6dRaXzvM8fn1Ky0U2c37KNcWyblYYaW4oDvqA8Rw
	uL4bHnPEdTf9+rsAEk3psghJAolOh9GnwZ2fB/i43wC+yW/WFslVy4uI/yomX6TENYlX+iXRbg289
	gUtKhuvecGxPmJisO7HVQ08jTMi5maAHsLM2fU+n+NxRDSdGgesNpD/m8wsDutvHE1m4wtOzu6diA
	VpXbIKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgZS-00000003ZId-3qdX;
	Wed, 05 Feb 2025 14:40:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgY5-00000003Z1r-0NLq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:38:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38daf14018eso1317383f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 06:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738766319; x=1739371119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SylEMFUGGjut9Z/r0Vs1FQy1begfn1Z+13Ei115fRk=;
        b=G7QnrhK6DX+WQEoVZ/fAhENem+ik6XcEEH4CZpj5DqtqC2HolHYKViaaIZ/3sDCUsz
         S9qg6CDUNUE9w5D6G15rysJgv0vQFEkLdreHEGn2KjtEP8HppYhSivT7tMIawjJ/Dql0
         TFjf+fLruPuOL5P/T1TZDtVSgWAikFGW/dlixSP0IYsaqcdJzANStIKvjAzu5B4RweKu
         z7HM871LQfQC2I1oP1uLVLMXAHs5AKat/5vJVxF3uprHpBD99pyTQtY3i9KsJlinLYIZ
         r2mRIxT2d2Dm8xHkSzCR4Dv8j+PFjy3mBSohLcgTywNICSkNWTXkapydVNmKuDCgkYYb
         xI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766319; x=1739371119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SylEMFUGGjut9Z/r0Vs1FQy1begfn1Z+13Ei115fRk=;
        b=Voe90Re/IWyUgK/Idskb9Xd7GL8TtCdysUDGoOCpk1S2+aXtI6pHhYokyHbXEmu5Bn
         wDHze5stoQk8oTr7KFyacHtCVaK17RT3K9100gfQivWRMH7jdJMra9HDmPigjQvkLaFi
         1b/bWrSBy1x1QxUvPsvAn2Sw9xv8pbc+DdFGtMZ+GAAid44SUTWGPMEDY5qKQD9QODLo
         AqnkAs1polcPqOsvkDWijg+1eQrwKfLhLzvfH8UfseiciU13it4YRtKzo168jFQTciAS
         qjz5cIfbMdTVlRvjMuiZ8GSyRu/kxc3bF5ngn/7/hBfyfnqQPtuJauRAlxo83BUUumZt
         B+oA==
X-Gm-Message-State: AOJu0YxtlUKfiBQOa5F4wUBlm+YoM6atzqTdIYesB8RmaW0W7ibgg4kl
	HOj8ajEqEt+yTrTYM9X6LzXWC8YXaO8J17YLJsCNKupFrgRbN4HnOepNnZLQfuc=
X-Gm-Gg: ASbGncu6dMJAwrV6+appq5vQ3HY4MgZDnRoIW7gC1RToZid5VKbBCBt7TW4WXKzUDFU
	GLectbSLwqkx5+NrtX6Sgvabrvak/dahZxsACeI9/reg+JKrKcY+S1dpPX4heyDjxmbvSxBBjVx
	svVkO2/M2lHdbTt26lzGKrbsquTfJHxt9loMfYET6u1J/iefa6BwRPxSQvhJyCZb6UasHkoAoX7
	dbYJEjj0/HWIQ5eeNZFs1Cgy1jS0L+4NILdEl514goqmhydY9aOy5djibQPyXOyrVvQEZNpyX5z
	BIrU+hM6wRUWKtpoVvvbBMiBmA==
X-Google-Smtp-Source: AGHT+IF9xdlTonnwajQxmm/s81j9yPZ4l8Yo6pPEF/b8p2ODFzyRC4+PB3bu63yEZdkCTZrHfqloFw==
X-Received: by 2002:adf:f243:0:b0:38a:5df9:f86a with SMTP id ffacd0b85a97d-38db48d34e5mr1766240f8f.26.1738766318785;
        Wed, 05 Feb 2025 06:38:38 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da8f6691bsm4950042f8f.42.2025.02.05.06.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:38:38 -0800 (PST)
Message-ID: <3c7e1ce0-9a5d-43fb-9767-8e4ca92a450d@linaro.org>
Date: Wed, 5 Feb 2025 14:38:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
 <0415d354-0c44-4fff-b92b-b0f5c9c72b11@linaro.org>
 <CAL_JsqKTNDQn9omG3g=6Rb4Nwt6hG9Gw7-VXL_fjQeEQmmtJQg@mail.gmail.com>
 <630f630d-241e-45f5-b449-243147fb888b@linaro.org>
 <CAL_JsqKY8MjD=iFf6MiT04WmCHYUxGtWG9JfX5-5fuG32F77qQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAL_JsqKY8MjD=iFf6MiT04WmCHYUxGtWG9JfX5-5fuG32F77qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_063841_131911_56DA3ADB 
X-CRM114-Status: GOOD (  61.98  )
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



On 04/02/2025 3:03 pm, Rob Herring wrote:
> On Tue, Feb 4, 2025 at 6:03 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 03/02/2025 5:58 pm, Rob Herring wrote:
>>> On Mon, Feb 3, 2025 at 10:53 AM James Clark <james.clark@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>
>>>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>>>> Extension (BRBE), which records information about branches as they are
>>>>> executed into set of branch record registers. BRBE is similar to x86's
>>>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>>>> (BHRB).
> 
> [...]
> 
>>>>> +     /*
>>>>> +      * Require that the event filter and branch filter permissions match.
>>>>> +      *
>>>>> +      * The event and branch permissions can only mismatch if the user set
>>>>> +      * at least one of the privilege branch filters in PERF_SAMPLE_BRANCH_PLM_ALL.
>>>>> +      * Otherwise, the core will set the branch sample permissions in
>>>>> +      * perf_copy_attr().
>>>>> +      */
>>>>> +     if ((event->attr.exclude_user != !(branch_type & PERF_SAMPLE_BRANCH_USER)) ||
>>>>> +         (event->attr.exclude_kernel != !(branch_type & PERF_SAMPLE_BRANCH_KERNEL)) ||
>>>>
>>>> I don't think this one is right. By default perf_copy_attr() copies the
>>>> exclude_ settings into the branch settings so this works, but if the
>>>> user sets any _less_ permissive branch setting this fails. For example:
>>>>
>>>>     # perf record -j any,u -- true
>>>>     Error:
>>>>     cycles:PH: PMU Hardware or event type doesn't support branch stack
>>>>     sampling.
>>>>
>>>> Here we want the default sampling permissions (exclude_kernel == 0,
>>>> exclude_user == 0), but only user branch records, which doesn't match.
>>>> It should be allowed because it doesn't include anything that we're not
>>>> allowed to see.
>>>
>>> I know it is allowed(on x86), but why would we want that? If you do
>>> something even more restricted:
>>>
>>> perf record -e cycles:k -j any,u -- true
>>>
>>> That's allowed on x86 and gives you samples with user addresses. But
>>> all the events happened in the kernel. How does that make any sense?
>>>
>>> I suppose in your example, we could avoid attaching branch stack on
>>> samples from the kernel. However, given how my example works, I'm
>>> pretty sure that's not what x86 does.
>>>
>>> There's also combinations that are allowed, but record no samples.
>>> Though I think that was with guest events. I've gone with reject
>>> non-sense combinations as much as possible. We can easily remove those
>>> restrictions later if needed. Changing the behavior later (for the
>>> same configuration) wouldn't be good.
>>>
>>>
>>
>> Rejecting ones that produce no samples is fair enough, but my example
>> does produce samples. To answer the question "why would we want that?",
>> nothing major, but there are a few small reasons:
>>
>>    * Perf includes both user and kernel by default, so the shortest
>>      command to only gather user branches doesn't work (-j any,u)
>>    * The test already checks for branch stack support like this, so old
>>      Perf test versions don't work
> 
> I would be more concerned about this one except that *we* wrote that
> test. (I'm not sure why we wrote a new test rather than adapting
> record_lbr.sh...)
> 

record_lbr.sh was added 6 months ago, test_brstack.sh 3 years ago so 
it's the other way around.

Although record_lbr.sh also tests --call-graph and --stitch-lbr as well, 
so I think it's fine for test_brstack.sh to test only --branch-filter 
options at the lowest level.

Looking at that test though I see there is a capability 
"/sys/devices/cpu/caps/branches". I'm wondering whether we should be 
adding that on the Arm PMU for BRBE?

Ignoring the tests, the man pages (and some pages on the internet) give 
this example: "--branch-filter any_ret,u,k". This doesn't work either 
because it doesn't match the default exclude_hv option. It just seems a 
bit awkward and incompatible to me, for not much gain.

>>    * You might only be optimising userspace, but still interested in the
>>      proportion of time spent or particular place in the kernel
> 
> How do you see that? It looks completely misleading to me. 'perf
> report' seems to only list branch stack addresses in this case. There
> doesn't seem to be any matching of the event address to branch stack
> addresses.
> 

Perf script will show everything with all it's various options, or 
--branch-history on perf report will show both too. Also there are tools 
other than Perf, AutoFDO seems like something that BRBE can be used with.

>>    * Consistency with existing implementations and for people porting
>>      existing tools to Arm
>>    * It doesn't cost anything to support it (I think we just
>>      only check if exclude_* is set rather than !=)
>>    * Permissions checks should be handled by the core code so that
>>      they're consistent
>>    * What's the point of separate branch filters anyway if they always
>>      have to match the event filter?
> 
> IDK, I wish someone could tell me. I don't see the usecase for them
> being mismatched.
> 
> In any case, I don't care too much one way or the other what we do
> here. If everyone thinks we should relax this, then that's fine with
> me.
> 

Seeing the branch history from userspace that led up to a certain thing 
in the kernel happening doesn't seem like that much of an edge case to 
me. If you always have to have both on then you lose the userspace 
branch history because the buffer isn't that big and gets overwritten.

>> Some of these things could be fixed in Perf, but not in older versions.
>> Even if we can't think of a real use case now, it doesn't sound like the
>> driver should be so restrictive of an option that doesn't do any harm.
>>
>>>> This also makes the Perf branch test skip because it uses
>>>> any,save_type,u to see if BRBE exists.
>>>
>>> Yes, I plan to update that if we keep this behavior.
>>>
>>>>> +         (!is_kernel_in_hyp_mode() &&
>>>>> +          (event->attr.exclude_hv != !(branch_type & PERF_SAMPLE_BRANCH_HV))))
>>>>> +             return false;
>>>>> +
>>>>> +     event->hw.branch_reg.config = branch_type_to_brbfcr(event->attr.branch_sample_type);
>>>>> +     event->hw.extra_reg.config = branch_type_to_brbcr(event->attr.branch_sample_type);
>>>>> +
>>>>> +     return true;
>>>>> +}
>>>>> +
>>>> [...]
>>>>> +static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },
>>>>
>>>> Does the second field go into 'new_type'? They all seem to be zero so
>>>> I'm not sure why new_type isn't ignored instead of having it mapped.
>>>
>>> Well, left over from when all the Arm specific types were supported.
>>> So yeah, that can be simplified.
>>>
>>>>> +     [BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
>>>>> +     [BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },
>>>>
>>>> How do ones that don't map to anything appear in Perf? For example
>>>> BRBINFx_EL1_TYPE_TRAP is missing, and the test that was attached to the
>>>> previous versions fails because it doesn't see the trap that jumps to
>>>> the kernel, but it does still see the ERET back to userspace:
>>>>
>>>>      [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>>>
>>>> In older versions we'd also have BRBINFx_EL1_TYPE_TRAP mapping to
>>>> PERF_BR_SYSCALL so you could see it go into the kernel before the return:
>>>>
>>>>      trap_bench+0x1C/[unknown]/-/-/-/0/SYSCALL/-
>>>>      [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>>
>>> My read of that was we should see a CALL in this case. Whether SVC
>>> generates a TRAP or CALL depends on HFGITR_EL2.SVC_EL0 (table D18-2).
>>> I assumed "SVC due to HFGITR_EL2.SVC_EL0" means when SVC_EL0 is set
>>> (and set has additional conditions). We have SVC_EL0 cleared, so that
>>> should be a CALL. Maybe the FVP has this wrong?
>>>
>>
>> The test is doing this rather than a syscall:
>>
>>     asm("mrs %0, ID_AA64ISAR0_EL1" : "=r" (val));   /* TRAP + ERET */
>>
>> So I think trap is right. Whether that should be mapped to SYSCALL or
>> some other branch type I don't know, but the point is that it's missing now.
> 
> We aren't supporting any of the Arm specific traps/exceptions. One
> reason is for consistency with x86 like you just argued for. The only

Does x86 leave holes in the program flow though, or is it complete? IMO 
it makes it harder for tools to make sense of the branch buffer if there 
are things like an ERET with no previous trap to match it up to.

> exception types supported are syscall and IRQ. Part of the issue is
> there is no userspace control over enabling all the extra Arm ones.
> There's no way to say enable all branches except debug, fault, etc.
> exceptions. If we want to support these, I think there should be user
> control over enabling them. But that can come later if there's any
> demand for them.
> 
> Rob

In this patchset we enable PERF_BR_IRQ with PERF_SAMPLE_BRANCH_ANY, 
without any way to selectively disable it. I would assume trap could be 
done with the same option.

If we're filtering some of them out it might be worth documenting that 
"PERF_SAMPLE_BRANCH_ANY" doesn't actually mean 'any' branch type on Arm, 
and some types are recorded but discarded out before sending to userspace.

There could be some confusion when there are partially filled or empty 
branch buffers, and the reason wouldn't be that there weren't any 
branches recorded, but they were all filtered out even with the 'any' 
option.


