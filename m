Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E8C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zRq6q+Q3aRIIcPAovmp38L5s64IDYxDAuFuBlXk1Vs=; b=WcfU7bWW9sChb7rlE6BAjN4Pz/
	nCFpR9qDy6yWm4vNhoteRMLVaIp5Ie3iEccOAyb4hLCtoheEpxf2Fd5w25MQZLJlwqwQ30t8m51/R
	qFqU9FfxkQjARBT9Ew5IlMQ2pNrCuUKon088M/J33IsO/RiVBg6LirNuAiIDBpQj3PbBjmC7q0lny
	LNMjWeGdk19IfrizlOW7XgtTun3cOYvXuC97AfiTx8EiHJzHOUpYfJhh+GS2hP2aCJtOQmJxCkpvE
	OFk+fxsk4eOkw+E6Lsua7aWL5LdmcsL7nEZFmak13CbWVRBY99nxByG7gMef54Ve8bQwff7ofSemL
	MnrOwKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO2-00000002w28-3m9u;
	Tue, 22 Jul 2025 15:58:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEFz-00000002l5q-1Sdk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:46:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso46613115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753195573; x=1753800373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zRq6q+Q3aRIIcPAovmp38L5s64IDYxDAuFuBlXk1Vs=;
        b=fIXY4IJGaFu51zvQS87JDRH+u3kuhKeEAAMQY+TvwkW55OLDe+jlShozJBQVpv0fw+
         5KzJ9sCtkSBsixfnKu26cvMC/b/crQj66s/X0WOLNSIpax1KtvpiXd9+5sWnDjERH6z0
         3HtA6WlI7l/qH7Jpu00NXXb4SLls8kRumlbk87jokNUxtUTO9BRjfpLUUftJhsPHnjSZ
         zNcQSgyxA1uHbeo/zA409n9B7xKyIzNYeYlGGWgoGZ6EHZ597sVFH0lM5qLj7JlMCr9w
         Ld7pYNNQuW6/aIyD5BGJmhRt6BLLUgJlnRGNuGWwL8B2fSDXMBmG6MjQ2KhrRH7vdItO
         8TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195573; x=1753800373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zRq6q+Q3aRIIcPAovmp38L5s64IDYxDAuFuBlXk1Vs=;
        b=U3s1JJY/bhzUA4ZnEnPHCcrhar2JxI5q1TozuXyyDW8M4sibLeimkatasukQpdRsN3
         pi8lItO3bBz6MhU81T+4gBqeqet3RsgvQ49jEDXX26mTkY497xJ/YCmD3XY+fBnjNPBB
         pdDCD4kW9nZqIqQhiDby46nfqjRpQVK0cLc57ehZgVSxcB8OQFMsbuL+k6K0Rc0V1jGT
         wO6Kdbq9ee5Ptn5f5yRYBI+F7YJhRq5CUJ2U+63ueWJx8kccM8/tS0JtLbiFFE6Fo3ch
         yuJmvO2dWKO7aRSnq2n9IWjJtXJAZc5tSs0R/Y7Drmv1a1n1uDTz1IQNZLCiBrv79roU
         T9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXrrS4EszZhKYffukbSJ98fSdctwwh2o6fG82ImF5h12MrQfRyML0APQolY8xZbTeYQcBKcj3XNmX6Yu8sW8f/o@lists.infradead.org
X-Gm-Message-State: AOJu0YwcKAn1e6BPBvqLJrCA36iBq027NIcsPq3DJBt138CWSg0NGcqg
	iI0KiW9iSZua5u83ylm1DPQfJFja1xfnLt7+LZE69yCn5qX7dS4ue3Q5oNk2aww74EfmRY8goMx
	qNrlANkM=
X-Gm-Gg: ASbGncsIIMLjI4kF+9yod8Hfp8uDpDs9qJAF39LvtA9PrnJAnV2i1c40/Jivci4rwFc
	/j2v3d+S8KhFWvaAWF3HHsjyndxousUMOMVbAf2AmfG/CQkGfVwhkhPoRAnfipnYzqukoHCE8uN
	sRgwH6vd/kVE5F5PStHjt921JKIDZEuJ3oYJe9iBttPqJCyY7oo8fCMJA+4xK3/lrJZFgbg5gbh
	Gcbnap7dnUBXNsocnpgyB4FyVbwv00sbOc+0rrVhQ+8M5j9fej/Ngsez7xWYe8zUuS1kgCoi/I0
	zpUFkyP87HWTulAwZgdADIExdGp+wDkL5DK68ErElmNEoQs8kzWBwZYBaeYaFBsubelrWFHcncm
	Oju9DsNQSGSI32nrokyHy0/LvETk=
X-Google-Smtp-Source: AGHT+IEzlWOgnfRNv4/fQDkTRc8GhsQBHo1Y57syH6gUs7Qb009+oIXJL35tfLadwhf4ZS07sILvoA==
X-Received: by 2002:a05:600c:354c:b0:456:161c:3d61 with SMTP id 5b1f17b1804b1-4562e275c25mr216633925e9.22.1753195573391;
        Tue, 22 Jul 2025 07:46:13 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75cb86sm134030035e9.32.2025.07.22.07.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:46:12 -0700 (PDT)
Message-ID: <10e9cb52-2476-4c13-8632-0a85830f98dd@linaro.org>
Date: Tue, 22 Jul 2025 15:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
To: Leo Yan <leo.yan@arm.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
 <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
 <20250707153710.GB2182465@e132581.arm.com> <aG4_uYJgpMXo3QHQ@raptor>
 <20250714085849.GC1093654@e132581.arm.com>
 <0c53164a-306a-4cb7-9085-bba8985c32e7@linaro.org>
 <20250721152134.GF3137075@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250721152134.GF3137075@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_074615_400793_78CE376F 
X-CRM114-Status: GOOD (  29.06  )
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



On 21/07/2025 4:21 pm, Leo Yan wrote:
> On Mon, Jul 21, 2025 at 02:20:15PM +0100, James Clark wrote:
> 
> [...]
> 
>>>> Thought about this some more.
>>>>
>>>> Before:
>>>>
>>>> arm_spe_pmu_buf_get_fault_act:
>>>>     <drain buffer>
>>>>     ISB
>>>> arm_spe_perf_aux_output_begin:
>>>>     PMBLIMITR_EL1.E = 1
>>>> ISB
>>>> PMBSR_EL1.S = 0
>>>> ERET
>>>>
>>>> Now:
>>>>
>>>> PMBLIMITR_EL1 = 0
>>>> ISB
>>>>
>>>> PMBSR_EL1.S = 0
>>>> arm_spe_perf_aux_output_begin:
>>>>     ISB
>>>>     PMBLIMITR_EL1.E = 1
>>>> ERET
>>>>
>>>> I don't see much of a difference between the two sequences - the point after
>>>> which we can be sure that profiling is enabled remains the ERET from the
>>>> exception return.  The only difference is that, before this change, the ERET
>>>> synchronized clearing the PMBSR_EL1.S bit, now it synchronizes setting the
>>>> PMBLIMITR_EL1.E bit.
>>>>
>>>> Thoughts?
>>>
>>> To make the discussion easier, I'll focus on the trace enabling flow
>>> in this reply.
>>>
>>> My understanding of a sane flow would be:
>>>
>>>     arm_spe_pmu_irq_handler() {
>>>       arm_spe_perf_aux_output_begin() {
>>>             SYS_PMBPTR_EL1 = base;
>>>
>>>             ISB // Synchronization between SPE register setting and
>>>                 // enabling profiling buffer.
>>>             PMBLIMITR_EL1.E = 1;
>>>       }
>>>       ISB // Context synchronization event to ensure visibility to SPE
>>>     }
>>>
>>>     ... start trace ... (Bottom half, e.g., softirq, etc)
>>>
>>>     ERET
>>>
>>> In the current code, arm_spe_perf_aux_output_begin() is followed by an
>>> ISB, which serves as a context synchronization event to ensure
>>> visibility to the SPE. After that, it ensures that the trace unit will
>>> function correctly.
>>>
>>
>> But I think Alex's point is that in the existing code the thing that finally
>> enables trace (PMBSR_EL1.S = 0) isn't followed by an isb(), only an ERET. So
>> the new flow isn't any different in that regard.
> 
> Thanks for explanation.
> 
>>> I understand that the Software Usage PKLXF recommends using an ERET as
>>> the synchronization point. However, between enabling the profiling
>>> buffer and the ERET, the kernel might execute other operations (e.g.,
>>> softirqs, tasklets, etc.).
>>
>> Isn't preemption disabled? Surely that's not possible. Even if something did
>> run it wouldn't be anything that touches the SPE registers, and we're sure
>> there's an isb() between setting up the buffer and the final PMBLIMITR_EL1.E
>> = 1
> 
> Yes, bottom half runs in preemtion disabled state. See:
> 
>    el1_interrupt() -> __el1_irq() -> irq_exit_rcu() -> invoke_softirq()
> 
> In some cases, sotfirq and tasklet might even cause long latency (I
> believe it can be milliseconds or even longer), this is why ftrace
> "irqsoff" tracer is used to profile latency caused by irq off state.
> 
> Bottom half does not modify SPE registsers, but it can be a long road
> between enabling SPE trace and ERET.
> 
>>> Therefore, it seems to me that using ERET as the synchronization point
>>> may be too late. This is why I think we should keep an ISB after
>>> arm_spe_perf_aux_output_begin().
>>
>> Wouldn't that make the ERET too late even in the current code then? But I
>> think we're agreeing there's no issue there?
> 
> I would say ERET is too late for current code as well.
> 
> Thanks,
> Leo


Ok I get it now. The point is that there is stuff in between the return 
in the SPE IRQ handler and the actual ERET. If someone is interested in 
sampling the kernel then they might miss sampling a small amount of that.

It's not a correctness thing, just reducing potential gaps in the 
samples. I can add another commit to add it, but it doesn't look like it 
would be a fixes commit either, just an improvement. And the same issue 
applies to the existing code too.

James


