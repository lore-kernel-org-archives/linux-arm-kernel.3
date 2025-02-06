Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617FCC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9nxlc2gVdRgkfK+9g7k7PvXPxIVZmZ3lhTkJf7wy0M=; b=majTmPIZEUEuMiGh41uSpvPP3I
	03Ec+bAeGgLtoNNxw/RHmbzKzQqxHa8sGTAJQgiIXiPNWbWzkmX3WWxShzSYHD1+muCcNYV2FtYXX
	iqo5CiYFJsQII/Zx/89V59DqzaVcFJp0eEVijyQpWOB4SeWQrqaVwq4jvhHZzZ5T3WglMyvqsMsf8
	qh2hK/4jLzeUfu8O9wrS+SwgSZKf6gqRsDXEwObLFy9q5y9Sj4fYT6rspLL6qqfB6hNysCasXnvhk
	y4gZ599CrMn1xoNyFWkn9IwccCDs/tXoAC8mjrKva69Yyc9ApPVbUgNr/rWNSKxQ3tQ/nZ4KOeY4M
	grOk60tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1UB-00000006KdY-2yyo;
	Thu, 06 Feb 2025 13:00:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1So-00000006KOG-0O4V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:58:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7157cf352so392947466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 04:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738846716; x=1739451516; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9nxlc2gVdRgkfK+9g7k7PvXPxIVZmZ3lhTkJf7wy0M=;
        b=dBceHMykvUq+EzYgmzrPeHhXQYhrP5eRqzAnxEJmK1ii8GBaci/r8QBinvPa8xqqiE
         b19k6zDbg6vhWxqFl2MtwzYuuUv01N5dXdxJ+0qlUm23p4Nkwk6b/CfAgBp/hn61UquD
         kR3EnzhOHDmswhsQTw2MlD8Ej7sLZrjYRRqTXAnSudygtWybbSTHTHEC5NNO6OXEcOQR
         KyUGpidSesdZoJzYAaCfhXRzZLdMvLNleBCmciKlP3t1RZVbx2skUv6OVA1FyNHXUS1l
         ehwg7GjAnyKM5uiPUPIEXi7aAaJLKV9gaYkuIxd8eTqjqefwOmIzCiwvUrL2Mf5lxmJ9
         toXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738846716; x=1739451516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9nxlc2gVdRgkfK+9g7k7PvXPxIVZmZ3lhTkJf7wy0M=;
        b=KnjW1f5FmCBl5C0re7aHaDEaCrT8qBN4DRcY0YwXgaOVbJ5toIpT9f5p0B2bVTp/F2
         OQwH+p+Gzt//fzjGHRX+ptC5ot3ecopZcDp68FOX2L4il+c7vOF20gwGjYjjKojPzAq/
         YrbC0ubK9z2MF7DmAOpsYf0wvWX87kF3GMPlxrF/aSGzAHTanYp/v64hvUjnNx0//AOy
         Ew+qNuMQdmcFNfdgVeY33AHTYThHJleJhln6/Anc/1akHTWQh/y/9E3hbFvk88xsn61p
         DIFTH+nDnCTD0cdlglr9tzUHxlvFV4GhBHkC6+6HuQhxGkmSVuLoSA6kHhpVhw2jJ9dG
         yBaw==
X-Gm-Message-State: AOJu0Yy4nkxTMWu7PSTurjHUcyiKuekXWrs73vSPNvV33k49sjG4loOq
	i0HwfzRuJ5jQfHcBS1r0pYkcqWpbAkFtDpWG+qMdWuA0H3semGRFkSL6neHMPOY=
X-Gm-Gg: ASbGncsWJzUN26ySfc1Fnwfer15+i0OqgytjBHi1pq2eWFeXbnnFP10VP+SEPlJQKn3
	Yj4aIrlFHCpWUeljSUi85JWoLtIb3IdgPzaA43JV6j1X6zfnZFAsvqLmLX81Nnr0TGtTSgnjHZq
	9qZhUqGcipwDrQMAgtnefB8gj4MG/TUASEyWSHrcWjckdGd+9c1hR/Xv/wolx2a4GA54DDNOXLI
	rSupSRcqZrj+aPF4NHZ/DQ8Zps3yg5rathpgXB7F6nYAddwbpFLZpc8scQvIHlGS1cV9Ga5cynX
	qouJsly6YkLPbrFUhNzipXQruw==
X-Google-Smtp-Source: AGHT+IECG2Og4HOQAjuT4F+XFrfhk8Mhc4LucLG60WazGfhVmFMGz2JtXe62pSAA9VTn2VX8teci1g==
X-Received: by 2002:a17:907:6d21:b0:ab6:8bb8:af2e with SMTP id a640c23a62f3a-ab76e913b7amr351703766b.26.1738846716275;
        Thu, 06 Feb 2025 04:58:36 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm96240266b.143.2025.02.06.04.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 04:58:35 -0800 (PST)
Message-ID: <3b07c400-e1a8-46b9-a5af-81239dd316f3@linaro.org>
Date: Thu, 6 Feb 2025 12:58:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>,
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
 <3c7e1ce0-9a5d-43fb-9767-8e4ca92a450d@linaro.org>
 <CAL_JsqKHGROJa1EW94iy1XzCadEst-hPWZY2BmxKgMB93nDp4w@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAL_JsqKHGROJa1EW94iy1XzCadEst-hPWZY2BmxKgMB93nDp4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_045838_150057_1A75DA67 
X-CRM114-Status: GOOD (  59.26  )
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



On 05/02/2025 4:15 pm, Rob Herring wrote:
> On Wed, Feb 5, 2025 at 8:38 AM James Clark <james.clark@linaro.org> wrote:
>> On 04/02/2025 3:03 pm, Rob Herring wrote:
>>> On Tue, Feb 4, 2025 at 6:03 AM James Clark <james.clark@linaro.org> wrote:
>>>> On 03/02/2025 5:58 pm, Rob Herring wrote:
>>>>> On Mon, Feb 3, 2025 at 10:53 AM James Clark <james.clark@linaro.org> wrote:
>>>>>> On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
>>>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>>
>>>>>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>>>>>> Extension (BRBE), which records information about branches as they are
>>>>>>> executed into set of branch record registers. BRBE is similar to x86's
>>>>>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>>>>>> (BHRB).
>>>
>>> [...]
>>>
>>>>>>> +     /*
>>>>>>> +      * Require that the event filter and branch filter permissions match.
>>>>>>> +      *
>>>>>>> +      * The event and branch permissions can only mismatch if the user set
>>>>>>> +      * at least one of the privilege branch filters in PERF_SAMPLE_BRANCH_PLM_ALL.
>>>>>>> +      * Otherwise, the core will set the branch sample permissions in
>>>>>>> +      * perf_copy_attr().
>>>>>>> +      */
>>>>>>> +     if ((event->attr.exclude_user != !(branch_type & PERF_SAMPLE_BRANCH_USER)) ||
>>>>>>> +         (event->attr.exclude_kernel != !(branch_type & PERF_SAMPLE_BRANCH_KERNEL)) ||
>>>>>>
>>>>>> I don't think this one is right. By default perf_copy_attr() copies the
>>>>>> exclude_ settings into the branch settings so this works, but if the
>>>>>> user sets any _less_ permissive branch setting this fails. For example:
>>>>>>
>>>>>>      # perf record -j any,u -- true
>>>>>>      Error:
>>>>>>      cycles:PH: PMU Hardware or event type doesn't support branch stack
>>>>>>      sampling.
>>>>>>
>>>>>> Here we want the default sampling permissions (exclude_kernel == 0,
>>>>>> exclude_user == 0), but only user branch records, which doesn't match.
>>>>>> It should be allowed because it doesn't include anything that we're not
>>>>>> allowed to see.
>>>>>
>>>>> I know it is allowed(on x86), but why would we want that? If you do
>>>>> something even more restricted:
>>>>>
>>>>> perf record -e cycles:k -j any,u -- true
>>>>>
>>>>> That's allowed on x86 and gives you samples with user addresses. But
>>>>> all the events happened in the kernel. How does that make any sense?
>>>>>
>>>>> I suppose in your example, we could avoid attaching branch stack on
>>>>> samples from the kernel. However, given how my example works, I'm
>>>>> pretty sure that's not what x86 does.
>>>>>
>>>>> There's also combinations that are allowed, but record no samples.
>>>>> Though I think that was with guest events. I've gone with reject
>>>>> non-sense combinations as much as possible. We can easily remove those
>>>>> restrictions later if needed. Changing the behavior later (for the
>>>>> same configuration) wouldn't be good.
>>>>>
>>>>>
>>>>
>>>> Rejecting ones that produce no samples is fair enough, but my example
>>>> does produce samples. To answer the question "why would we want that?",
>>>> nothing major, but there are a few small reasons:
>>>>
>>>>     * Perf includes both user and kernel by default, so the shortest
>>>>       command to only gather user branches doesn't work (-j any,u)
>>>>     * The test already checks for branch stack support like this, so old
>>>>       Perf test versions don't work
>>>
>>> I would be more concerned about this one except that *we* wrote that
>>> test. (I'm not sure why we wrote a new test rather than adapting
>>> record_lbr.sh...)
>>>
>>
>> record_lbr.sh was added 6 months ago, test_brstack.sh 3 years ago so
>> it's the other way around.
> 
> Sigh...
> 
>> Although record_lbr.sh also tests --call-graph and --stitch-lbr as well,
>> so I think it's fine for test_brstack.sh to test only --branch-filter
>> options at the lowest level.
>>
>> Looking at that test though I see there is a capability
>> "/sys/devices/cpu/caps/branches". I'm wondering whether we should be
>> adding that on the Arm PMU for BRBE?
> 
> I noticed that too. I suppose we should. Though I suppose that could
> give weird results if userspace is expecting LBR. Adding that would
> make record_lbr.sh run and then the LBR callgraph test is going to
> fail.

Looks like we should add it. The "branches" cap seems to imply that any 
of the branch recording options are supported.

For --call-graph=lbr, that's a special branch type 
PERF_SAMPLE_BRANCH_CALL_STACK which we reject as not supported in BRBE. 
The test already does an additional skip if --call-graph=lbr isn't 
supported over the top of checking the branches cap. But there are other 
sub tests that don't use that option that should pass. They are only 
checking for non zero branch stack entries.

> 
>> Ignoring the tests, the man pages (and some pages on the internet) give
>> this example: "--branch-filter any_ret,u,k". This doesn't work either
>> because it doesn't match the default exclude_hv option. It just seems a
>> bit awkward and incompatible to me, for not much gain.
>>
>>>>     * You might only be optimising userspace, but still interested in the
>>>>       proportion of time spent or particular place in the kernel
>>>
>>> How do you see that? It looks completely misleading to me. 'perf
>>> report' seems to only list branch stack addresses in this case. There
>>> doesn't seem to be any matching of the event address to branch stack
>>> addresses.
>>>
>>
>> Perf script will show everything with all it's various options, or
>> --branch-history on perf report will show both too. Also there are tools
>> other than Perf, AutoFDO seems like something that BRBE can be used with.
>>
>>>>     * Consistency with existing implementations and for people porting
>>>>       existing tools to Arm
>>>>     * It doesn't cost anything to support it (I think we just
>>>>       only check if exclude_* is set rather than !=)
>>>>     * Permissions checks should be handled by the core code so that
>>>>       they're consistent
>>>>     * What's the point of separate branch filters anyway if they always
>>>>       have to match the event filter?
>>>
>>> IDK, I wish someone could tell me. I don't see the usecase for them
>>> being mismatched.
>>>
>>> In any case, I don't care too much one way or the other what we do
>>> here. If everyone thinks we should relax this, then that's fine with
>>> me.
>>>
>>
>> Seeing the branch history from userspace that led up to a certain thing
>> in the kernel happening doesn't seem like that much of an edge case to
>> me. If you always have to have both on then you lose the userspace
>> branch history because the buffer isn't that big and gets overwritten.
> 
> Okay, let's drop this check...
> 
>>>> Some of these things could be fixed in Perf, but not in older versions.
>>>> Even if we can't think of a real use case now, it doesn't sound like the
>>>> driver should be so restrictive of an option that doesn't do any harm.
>>>>
>>>>>> This also makes the Perf branch test skip because it uses
>>>>>> any,save_type,u to see if BRBE exists.
>>>>>
>>>>> Yes, I plan to update that if we keep this behavior.
>>>>>
>>>>>>> +         (!is_kernel_in_hyp_mode() &&
>>>>>>> +          (event->attr.exclude_hv != !(branch_type & PERF_SAMPLE_BRANCH_HV))))
>>>>>>> +             return false;
>>>>>>> +
>>>>>>> +     event->hw.branch_reg.config = branch_type_to_brbfcr(event->attr.branch_sample_type);
>>>>>>> +     event->hw.extra_reg.config = branch_type_to_brbcr(event->attr.branch_sample_type);
>>>>>>> +
>>>>>>> +     return true;
>>>>>>> +}
>>>>>>> +
>>>>>> [...]
>>>>>>> +static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
>>>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },
>>>>>>
>>>>>> Does the second field go into 'new_type'? They all seem to be zero so
>>>>>> I'm not sure why new_type isn't ignored instead of having it mapped.
>>>>>
>>>>> Well, left over from when all the Arm specific types were supported.
>>>>> So yeah, that can be simplified.
>>>>>
>>>>>>> +     [BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
>>>>>>> +     [BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },
>>>>>>
>>>>>> How do ones that don't map to anything appear in Perf? For example
>>>>>> BRBINFx_EL1_TYPE_TRAP is missing, and the test that was attached to the
>>>>>> previous versions fails because it doesn't see the trap that jumps to
>>>>>> the kernel, but it does still see the ERET back to userspace:
>>>>>>
>>>>>>       [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>>>>>
>>>>>> In older versions we'd also have BRBINFx_EL1_TYPE_TRAP mapping to
>>>>>> PERF_BR_SYSCALL so you could see it go into the kernel before the return:
>>>>>>
>>>>>>       trap_bench+0x1C/[unknown]/-/-/-/0/SYSCALL/-
>>>>>>       [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>>>>
>>>>> My read of that was we should see a CALL in this case. Whether SVC
>>>>> generates a TRAP or CALL depends on HFGITR_EL2.SVC_EL0 (table D18-2).
>>>>> I assumed "SVC due to HFGITR_EL2.SVC_EL0" means when SVC_EL0 is set
>>>>> (and set has additional conditions). We have SVC_EL0 cleared, so that
>>>>> should be a CALL. Maybe the FVP has this wrong?
>>>>>
>>>>
>>>> The test is doing this rather than a syscall:
>>>>
>>>>      asm("mrs %0, ID_AA64ISAR0_EL1" : "=r" (val));   /* TRAP + ERET */
>>>>
>>>> So I think trap is right. Whether that should be mapped to SYSCALL or
>>>> some other branch type I don't know, but the point is that it's missing now.
>>>
>>> We aren't supporting any of the Arm specific traps/exceptions. One
>>> reason is for consistency with x86 like you just argued for. The only
>>
>> Does x86 leave holes in the program flow though, or is it complete? IMO
>> it makes it harder for tools to make sense of the branch buffer if there
>> are things like an ERET with no previous trap to match it up to.
> 
> I'll have to test that. x86 has SYSRET for "syscall return". We added
> ERET which maps to x86 interrupt return. So I guess x86 only records
> syscalls and their returns. There's also "sw interrupt" on x86 which
> gets mapped to PERF_BR_UNKNOWN. I don't think there's any way for us
> to distinguish a syscall return from any other exception return.
> 

Any return type is fine really, as long as you can potentially make 
sense of it in the end.

>>> exception types supported are syscall and IRQ. Part of the issue is
>>> there is no userspace control over enabling all the extra Arm ones.
>>> There's no way to say enable all branches except debug, fault, etc.
>>> exceptions. If we want to support these, I think there should be user
>>> control over enabling them. But that can come later if there's any
>>> demand for them.
>>>
>>> Rob
>>
>> In this patchset we enable PERF_BR_IRQ with PERF_SAMPLE_BRANCH_ANY,
>> without any way to selectively disable it. I would assume trap could be
>> done with the same option.
> 
> If I was designing the interface, I would make PERF_BR_IRQ separately
> controllable. But we're kind of stuck with what x86 did. I suppose we
> could add a negative 'noirq' option.
> 
> Are you of the opinion that we should enable everything or some subset
> of them? There's basically inst/data/algn faults, FIQ, SError, and
> debug. The debug ones seem questionable to me, or at least ones you'd
> want to opt-in for. For FIQ, if that's used by secure world, do we
> want non-secure world recording when FIQs happen? Could the timing of
> those be used maliciously?
> 

I would say include everything that's already filling the buffer and can 
affect the program flow, even if they have to map to unknown or some 
slightly off mapping. These tools are supposed to increase visibility, 
not hide it. If silicon and buffer space are being consumed by branches, 
let userspace decide if it wants to do anything with them or not. It 
doesn't sound like changing 'unknown' to a more specific type in the 
future would be a breaking change.

Except for any security stuff of course, if FIQ is an issue because of 
that, filter it out.

>> If we're filtering some of them out it might be worth documenting that
>> "PERF_SAMPLE_BRANCH_ANY" doesn't actually mean 'any' branch type on Arm,
>> and some types are recorded but discarded out before sending to userspace.
>>
>> There could be some confusion when there are partially filled or empty
>> branch buffers, and the reason wouldn't be that there weren't any
>> branches recorded, but they were all filtered out even with the 'any'
>> option.
> 
> Fair enough. I think we need Mark to chime in here. He was questioning
> the need for these.
> 
> Rob

I suppose you could say any branches that leave and return to the same 
place in userspace aren't useful, like trap and eret (but isn't syscall 
the same, and we have those?). But that's only if you filter out kernel. 
With both enabled the trap actually goes somewhere and I'm sure that's 
interesting to someone.

It might be fine to say that the types that we have now don't match up 
well enough, so we can revisit this in the future and add them in with 
the right types rather than a potentially breaking change from unknown. 
I will leave it to you.

I was mainly stuck on the permissions issue which seemed like a blocker. 
I noticed this one because the test was actually testing it, but you're 
right these more obscure branch types in userspace aren't exactly the 
MVP of BRBE.

Although I will say that leaving the associated ERETs in but filtering 
out the thing that took it there is a bit odd. Maybe that's just a 
personal thing without much technical merit.

A lot of words to say I don't really know for sure either.


