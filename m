Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F47BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nC3HrqDGZF7AOgHUOZz0pFaqYcIiLme0buP14VJS2k=; b=v98iIHNQgzLaQhfU0zkhbjIVFp
	goM/2Bh3x0uIhsUouUhliX60SO/WXavRTKrZWhUsHxsN1IEwbp9/U5FBmyzkLd+k1QuO8eJgbFBfN
	ezRtxM55mfB+dRBypPrCnPaYEVRKLiCUdsKHMFGtxqlnjX6fgP7++fU02Rli54UwrpygRME9tD6Fc
	0cgdW4xWdjTYwA4IzyNZzB6Ofw3yAUoQrlanA/XwGSL1P6TOZYsk0rqI2cjhzk2zZEoPGv5vE+5m7
	xaPVU26fxI6neIL9oSvkpsUZwiUnWkqECbufv3JereYArMBVl3ghBQd/Riq7dmYlnTQjBuu+X7w9b
	Q4+G/ABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ8C-00000002Xlp-2En5;
	Mon, 27 Jul 2026 11:04:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ89-00000002XlA-3Mya
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:04:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so17755125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150259; x=1785755059; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nC3HrqDGZF7AOgHUOZz0pFaqYcIiLme0buP14VJS2k=;
        b=Il6wZb9sANVchvpMYFtsG3vf5J5nqPokHyNXQHx7xzXgjSFecOTdDf3unbbok3VJjm
         NF46FcDaVRth0bOG6P0Og4QYPC48aa0vzo/j6eOY2YeUcj5RKfE69L4cHK9lDxMZ/ZOF
         fK56ZlAFa2AeqEh/3jiOuarcGWljKrmAvpAHnXqSxiZ9zjmDNd8j1ydleIky7Qr+r4Ba
         RspR7I70n6mFlyNw4YrM5nG6wV7+DG9nIyGcj5gjqt6isCssU0rwJUT8BWXa+2vjngMn
         77RetGAuweWoTQq8RqmbzsRbZXcfka4GEg211XU1uhEvN+u3Lfh5CfmzEwO9otzmfv55
         eiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150259; x=1785755059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nC3HrqDGZF7AOgHUOZz0pFaqYcIiLme0buP14VJS2k=;
        b=XsdVfucc7f7NjIW55clyqmGmQT30cEIYJycKdhaoPjDrfkb74xPxVV52GwyxeaomW/
         e9peDy8/0M/v6jrXn7nl8meU/aO4DflGzmKcyIrCzKzeNa6gC3opI00ttBQ2SjTwRTwO
         Rs6r0rMcpSxWp4DvFhOURxwscYXgVHOvEnpRoS9l5fM4Ay8KalNh+crJkz047TPe0v+r
         S0iuad1ltX4xW/4koSEmgidElPAVtMSRgO1sJDCrSSLzvOE3izaGMA8C7mAoYsSFER0v
         1sUGA5BsHGKqI4+toFavwKcYKr0obdDtgAv3Mhx4AfQ8bIYyL+f436afCexOUIKgaHoo
         YBAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3EeNe1DJDsBi8iH25HphX/wjmZtJoKrm4Mfqzl92JMuYc1GfZaoYq0M/8qHePWAMwf33eOkmeg3X4pMi/fr4K@lists.infradead.org
X-Gm-Message-State: AOJu0YygPGYr2qQzN7r5NbRFLc2LryOrIr6xIBxfblw927RMIXqJBuAb
	FFn4duAXk2mARe2FYE371zQtxDbocauOVIw3AxbxRDT8h+jXek7l+p01mxUI1rRFCpc=
X-Gm-Gg: AR+sD12Q6ep/KRhL+GbrNMfcD4Ky39r8dLU5zPhegRa5GIjs+acEAtbl2gTAZPOYQiD
	XqybL6RzneRdyCS0+6upC6kqRM+0ApzP5FIoQjroVJuf2kL08MMz9qKy9Ovp+YHBkeiXEPVzHeJ
	4hLN2us5hjh+DyTjy7Iub0ky/EJ2KgLdoeKzTAFQrUQ5QZQGeHhHSLYB01FFGIzooKa9RtNdweJ
	7Pyr480Bf+Ab+s5EoepWZ8HRhRteA1o/f6sP44V+kjkp6QZ5qhzSo7gqvmVilY82ovK2kIh2NPa
	KByjBjIc27ZpYqCL04t4Pvyr9GYPz8UNpsCrm3CW4sXntNF5aLDGJEPXVjbmpJig3HVamQi3yk5
	KA5+pJ6S8aH3RQ2YAgzQ+6MkcAe0h4kCOUKqzCYSn1Eidd+J6x0HJWs7QDETd7PEeFFfMKzHFw2
	ZdmVMJus70zM8WczBmtw==
X-Received: by 2002:a05:600c:3113:b0:493:c8f7:3631 with SMTP id 5b1f17b1804b1-496b570dacdmr94916415e9.22.1785150259287;
        Mon, 27 Jul 2026 04:04:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f5f9f8sm212127145e9.9.2026.07.27.04.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:04:18 -0700 (PDT)
Message-ID: <2941da1a-b0b4-47a6-b57c-b28703dc0454@linaro.org>
Date: Mon, 27 Jul 2026 12:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com,
 corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <gsnt33x95sra.fsf@coltonlewis-kvm.c.googlers.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <gsnt33x95sra.fsf@coltonlewis-kvm.c.googlers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040421_906414_EB344EA7 
X-CRM114-Status: GOOD (  67.27  )
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



On 23/07/2026 9:57 pm, Colton Lewis wrote:
> James Clark <james.clark@linaro.org> writes:
> 
>> On 22/07/2026 12:03 am, Colton Lewis wrote:
>>> Hi James, thanks for the review.
> 
>>> James Clark <james.clark@linaro.org> writes:
>>>> Hi Colton,
> 
>>>> The existence of the parameter makes sense, but can't the default be
>>>> arm_pmuv3.reserved_host_counters=0 instead of -1 (partition disabled)?
> 
>>> How would you interpret reserved_host_counters=0? Because that would
>>> express that the host should have zero counters and the guest gets them
>>> all. I remember in early versions of this series last year I did use 0
>>> as the default but reviewers asked for a way to express the scenario of
>>> of zero counters for the host.
> 
> 
>> I think I would interpret it as it is now. Can't the host still use them
>> until the guest does and then they only get squeezed if there is a
>> collision? That doesn't sound too bad to me. And if a host wants
>> reserved counters they can set a positive number.
> 
> Yeah that makes sense. I was thinking in an old headspace when it was
> just a static reservation instead of changing when a guest is loaded.
> 
>> Is reserved_host_counters==max_counters equivalent to -1? And there's no
>> overview in the cover letter or documentation about how it interacts
>> with the dynamic guest counter reservations. A bit more detail or a few
>> paragraphs in one place would help users, maybe with examples so they
>> don't have to piece together all the commit messages to work it out.
> 
> It's not equivalent since we need a case where the guest only has access
> to the fixed-purpose counters like the dedicated cycle
> counter. reserved_host_counters specifies the number of general purpose
> counters.
> 
> I'll document the operation more clearly. In the future please feel free
> to email me to ask if you are confused about something.
> 
>>>> It's still a bit fiddly having to do two things to make it work, and
>>>> there's no documentation about what the defaults or other prerequisites
>>>> are. IMO it's not even trivial to work out that you need to prefix it
>>>> with "arm_pmuv3.", which documentation would improve.
> 
>>> It is fiddly, which is why the more I think about it the more I'd rather
>>> ditch the kernel cmdline entirely and leave it up to KVM. That's the
>>> most flexible approach. There isn't a good way to change the cmdline
>>> after boot. Trying to make it writeable via sysfs runs into the problem
>>> of when is it safe to apply the change.
> 
>>> I thought it was commonly understood module parameters need to be
>>> prefixed by the module name, but I can add better documentation to that
>>> effect.
> 
> 
> 
>> People just want it written out fully somewhere so they can copy paste
>> it. Kernel developers might be able to piece it together, but not
>> everyone will.
> 
> This is the KVM mailing list. Kernel developers are the primary
> audience, but I will make reasonable efforts to include others in the
> future.
> 

I'm more thinking of the users of this after it gets merged, rather than 
just for the review.

>>>> Testing the whole set I ran into a few issues:
> 
>>>> This warn is hit when there is some kind of interaction with 
>>>> sleeping. I
>>>> tried to bisect it but it only appears on the last commit when the
>>>> option to enable partitioning is added.
> 
>>>>     /*
>>>>      * ARM pmu always has to reprogram the period, so ignore
>>>>      * PERF_EF_RELOAD, see the comment below.
>>>>      */
>>>>     if (flags & PERF_EF_RELOAD)
>>>>         WARN_ON_ONCE(!(hwc->state & PERF_HES_UPTODATE));
> 
>>>> Steps to reproduce:
> 
>>>> Host (arm_pmuv3.reserved_host_counters=0):
>>>>    $ sudo perf stat -C 2 -e \
>>>>      'branches,branches,branches,branches,branches,branches'
>>>>    $ sudo taskset --cpu-list 2 ./lkvm run --kernel \
>>>>      /boot/vmlinux-7.1.0-rc7+ -m 1024 -c 1 --pmu
> 
>>>> Guest:
>>>>    $ sleep 1
> 
>>>>     WARNING: drivers/perf/arm_pmu.c:302 at 
>>>> cpu_pm_pmu_notify+0x278/0x2c0,
>>>> CPU#2: swapper/2/0
>>>>      Call trace:
>>>>     cpu_pm_pmu_notify+0x278/0x2c0 (P)
>>>>     notifier_call_chain+0x84/0x1d0
>>>>     raw_notifier_call_chain+0x24/0x38
>>>>     cpu_pm_exit+0x34/0x68
>>>>     acpi_processor_ffh_lpi_enter+0x40/0x78
>>>>     acpi_idle_lpi_enter+0x54/0x78
>>>>     cpuidle_enter_state+0xb4/0x248
>>>>     cpuidle_enter+0x44/0x68
>>>>     do_idle+0x21c/0x300
>>>>     cpu_startup_entry+0x40/0x50
>>>>     secondary_start_kernel+0x120/0x150
>>>>     __secondary_switched+0xc0/0xc8
> 
> 
>>> I'll attempt to reproduce that. I've never seen it myself but I've
>>> mainly been using QEMU for my testing.
> 
> 
>> The newest Arm FVP should have cpuidle enabled if you boot it with ACPI,
>> but I hit this on a Radxa Orion O6 board.
> 
> Noted. Thanks.
> 
> 
>>>> When running the guest on a single CPU I get different counts for the
>>>> same event for a single process, although this never happens on a host.
>>>> I think there might even be some Perf tests which expect them to be the
>>>> same, and this doesn't depend on whether any events are running on the
>>>> host or not. Not sure if you ran all the Perf selftests in a guest or
>>>> not?
> 
>>> I'll investigate but I'm not sure perf is intended to guarantee
>>> that. perf stat just runs the event counters but may not write or read
>>> them at exactly the same time.
> 
> 
>> Is that true? The perf core calls perf_pmu_disable() when a process is
>> scheduled out before reading the count of each event of that process in
>> an inner loop. The perf_pmu_disable() clears PMCR_EL0.E which freezes
>> all of the counters so they can be read out in a consistent state.
> 
>> It's important that they're all stopped at the same time because
>> counters might be used in metrics as ratios of each other. So I think
>> it's deliberately designed that way and appears to not be working in a
>> guest now.
> 
> By default I think perf assumes events can be measured independently, If
> you want to guarantee events are scheduled together to avoid measurement
> skew you need to make sure the events are grouped.
> 
> The common way to do that is with {} around the event list:
> 
> perf stat -e {branches,branches}
> 
> Please see if that resolves the issue.
> 

Groups only change how the events are scheduled, not how the driver 
starts or stops multiple events running on the same PMU (grouped or 
ungrouped). In my repro I had less events than counters in HW, so they 
will always be scheduled at the same time regardless of grouping.

I did notice something extra though, you have to first open some amount 
of counters, and then open more than that. Then the second time the ones 
with different counts will be however many were opened first time, as if 
some state has stuck.

For example if I open two counters then 6, the first two always have 
different counts the second time:

   $ perf stat -e branches,branches true

   Performance counter stats for 'true':

             106129      branches 

             106129      branches 



   $ perf stat -e 
'{branches,branches,branches,branches,branches,branches}' true

   Performance counter stats for 'true':

             117013      branches 

             117013      branches 

             110364      branches 

             110364      branches 

             110364      branches 

             110364      branches


After opening 6 again a third time they'll all have the same counts.

>>>> I'm not sure if the exception level filtering isn't working or there is
>>>> something wrong with freezing. Doesn't the host PMU driver need to
>>>> freeze with HPME? I see it's still doing it with PMCR_EL0.E which
>>>> freezes the guest's counters now doesn't it?
> 
>>> HPME only has any effect while HPMN is programmed to a value different
>>> than the number of counters on the system. That is only true in a guest
>>> context. As I understand it, that means HPME has no effect anywhere the
>>> host driver needs to freeze counters since that happens in host context.
> 
> 
>> Oh yeah that makes sense, I didn't think about that. I'm not sure if my
>> other idea about exception level filtering being responsible makes sense
>> either.
> 
> I'll check that too.
> 
>>> Maybe HPMN stays programmed during interrupt handling though. I'll
>>> confirm.
> 
> 
>>>> Host (arm_pmuv3.reserved_host_counters=0):
>>>>    $ sudo taskset --cpu-list 2 ./lkvm run --kernel \
>>>>      /boot/vmlinux-7.1.0-rc7+ -m 1024 -c 1 --pmu
> 
>>>> Guest:
>>>>    $ perf stat -e branches,branches true
> 
>>>>     Performance counter stats for 'true':
> 
>>>>               167963      branches
> 
>>>>               160925      branches
> 
> 
>>>>    $ perf stat -e branches,branches,branches,branches,branches true
> 
>>>>     Performance counter stats for 'true':
> 
>>>>               164425      branches
> 
>>>>               164425      branches
> 
>>>>               164425      branches
> 
>>>>               157743      branches
> 
>>>>               157743      branches
> 
> 
>>>> When running the guest on two CPUs I just get zeros. Do the kvm
>>>> selftests not catch this? Or is it something to do with my setup:
> 
>>> KVM selftests definitely don't catch it. I'll see if I can reproduce.
> 
>>> Since the problem happens with 2 CPUs I wonder if something is
>>> triggering the lazy context swap behavior so the counter values aren't
>>> being moved to the 2nd CPU correctly.
> 
> 
>> If that was the case I would have expected it to be intermittent, or you
>> would get a partial count if the second CPU started from 0, but not
>> zeros every where every time. Let me know if I can run any more tests.
> 
> I'll let you know if I think of something.
> 
>>>> Host (arm_pmuv3.reserved_host_counters=0):
>>>>    $ sudo taskset --cpu-list 2-3 ./lkvm run --kernel \
>>>>      /boot/vmlinux-7.1.0-rc7+ -m 1024 -c 1 --pmu
> 
>>>> Guest:
>>>>    $ perf stat -e branches,branches true
> 
>>>>    Performance counter stats for 'true':
> 
>>>>                    0      branches
> 
>>>>                    0      branches
> 
>>>> I also noticed I get the "squeezed" warning printed after launching the
>>>> guest but not using Perf. This comment implies that not using counters
>>>> makes it a nop:
> 
>>>>        /*
>>>>      * If we aren't guest-owned then we know the guest isn't using
>>>>      * the PMU anyway, so no need to bother with the swap.
>>>>      */
>>>>     if (vcpu->arch.pmu.access != VCPU_PMU_ACCESS_GUEST_OWNED)
>>>>         return;
> 
>>>> But maybe linux is touching them in a way that makes them guest owned,
>>>> even on probe? Or is the guest/host ownership tracking not working, I
>>>> didn't look too hard.
> 
>>> Maybe. I'll check. The guest is also running its own PMU driver that
>>> might trigger guest ownership on initialization since ownership is
>>> determined by which registers the guest touches.
> 
> 
>> It doesn't enable any counters though does it, even if it touches some
>> of the registers to probe? Should that result in squeezing out host
>> counters? Maybe it's more complicated to implement, but right now it
>> seems like there is some complexity without much benefit as 90% of hosts
>> are going to probe the counters just to see what's there but not use 
>> them.
> 
> As far as I'm aware the driver probe shouldn't shouldn't enable any
> counters or trigger squeezing. I'll narrow the conditions that trigger
> guest ownership.
> 
> My first suspect is the guest driver probe is triggering guest ownership
> by reading PMCR_EL0, which I agree should be changed to avoid that.


