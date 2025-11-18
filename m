Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E750CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FG5jhL1tmnvgpxVM1AJkqsgjjuSRURlgF7jX76NTtrw=; b=XxL+COM6Q04CQG0L6Kr2c8Kn8z
	vzX6B4ZHPRKIGmZN+JG2p0GPu40h8IzBPZOOVdfqm9wdzD+EhH+qmLECXV0x2zOty7+uq8hpu858H
	rhL671JfPTlSxqOe9ePz1HEePhyC8ZlGDlzJrswweEUeh0TLyd0kbYrKpYxB7TPEwd8VtM1YHMIB8
	n7h7heEbWDSnFhD2qmyXbQwGbjJqsWqUNoyGayIvOLaSM5vInwryfxQ0ym/qvZTQHp7DRzgZTkn6q
	UpLZ7P6baQmLSRr/xMJNE7+Fy4gc9TBXqW9YN+POvIZqNG8cMfiF0I9BRgX/OFj8az1Pgk+mCP0vh
	VXeZ+kqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRT-000000005Mn-2hfz;
	Tue, 18 Nov 2025 08:52:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRQ-000000005JQ-2L0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:52:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b427cda88so3669196f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763455916; x=1764060716; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FG5jhL1tmnvgpxVM1AJkqsgjjuSRURlgF7jX76NTtrw=;
        b=NFPtbWaM/T9c5d+Ld0mUb/xyfbJx14L97eXx2lQn4tgSkUHVyKCoa6wX0kkOstHTk+
         X2/EhZ2girtH/1rZw9RipL3bacJcs6001cUlkJGdhvhv+kDs58/QLZHvIXb9HSNGRU83
         pXvxvGGyWKjbSmAW/B6gYKuwD+eI8pY4Y5b60DCgomM+zBKeDtlIp1gW4bn9YWcAvBZc
         p/Hgm3Of1reXUhv87Vb0lLGMx+7BIs4p+PjGaIS3rqbk+8pWpdNQXxdKHBn1kkzndhqP
         QbGCaouI+TCLMoGax1VAQanSuH17MrMLunF+uRvOaGR8bWUN3l1yP5w66k3pWfQ1At7U
         WtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455916; x=1764060716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FG5jhL1tmnvgpxVM1AJkqsgjjuSRURlgF7jX76NTtrw=;
        b=GPq3sYikiJr8iSNjlL130rDdTdJjpluIgu5PRGDERI34JA51TU3h3/uy7fnw+iKmm3
         XvuGa2bAiqw+zpf7a54/ObGOHbOVar4ueS7t8EGVMRt1uM5J7aIcYWUaBRno2d2XVME+
         /mzhkAglWkLMDZI0D9rr5BEw7L0vGWePCfvL1/ud6ce7/O5yaoCeP2d+BnKQfAScnHw5
         Y2l4BV/ru0nCsGAHjZB23SIr2HOaEUwvBLmYe9QhfNil8vRUOyhmacSaJ8mSdqXEyqWW
         mNJ7LS8HFMKaj8uMyArZ7vAb7GsbdQxfSxRvnEsdP9GfTMTbZGco5MBsN/sgLv9+srog
         W55g==
X-Forwarded-Encrypted: i=1; AJvYcCWX0dzKra0Qo9j999nxWAKajkmIEMXmYL6e6MxHdOJy1xEJ+HNGbAT+5/P8/peov066KQWOCbjv867tJu82R0SN@lists.infradead.org
X-Gm-Message-State: AOJu0YwUHwdB3LE+6xVTGy1hzlobfzLszYoqhN5bD+t5Bvf797Rc7iyA
	7CAEuO8v6MMOO+KoYchZKl/r4lBdMZcLSK23DeCQ7KbYV7UzFQsYWVS/KftnlXbzTLs=
X-Gm-Gg: ASbGncu2uwt7QUzn5jUl4qKUdGjd7eUadO9n1tS5kF70/MasYAzAOY89Mz/SU8jtn3W
	SyThgFr7ntKkUlKJmeDojYNmZVmGTkeg9TPO/QgXjIBmzScKUYn+njHpWvf1oAo32+ldUamtWe9
	88UfuZvExZM1RExQlaaS8rsDKnNUea/VAq6W4Bcbc/hLkeWaaZ+bZzNuX/AcNLHOqbbbnLeL5iV
	pJD+7FWNJccpwJfSYGQLKTYVDFqK8nV0j7jopGN+z7PhmAiWU2pUhKkfAmgL9AKWLApJI6M2dmE
	oxITkuY6FYP41CpbQcpJWoAIS6mAbNcYe72emwy3Hg9DXdaqhPQWUm3ZqbKOLvcRtifghDAWxhO
	HVJpZpOpDG8qOxpH1woJ4EpQ6Y0Lcxy9Oy8IzpXDBZglqBZZc2d04mX+kKcgvk002gA/JpMI/3B
	/pmcqgHKzgXjt4+By8rm1g2mdyE6ZMSXwFvCc4sDX321nCPRz76shdALIdx9uvXMSYZLM=
X-Google-Smtp-Source: AGHT+IFbQY3roU4LxVOv1sSrsfdnu+sjLRsCWOocTRontDGE/iUMAmfdyMaz6yG1qYX4S6kpb2xvfg==
X-Received: by 2002:a05:6000:2509:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b5937335fmr15262616f8f.43.1763455916429;
        Tue, 18 Nov 2025 00:51:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm31560396f8f.19.2025.11.18.00.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:51:55 -0800 (PST)
Message-ID: <515d639f-7814-4104-b757-63c16429d325@rivosinc.com>
Date: Tue, 18 Nov 2025 09:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: How to Avoid Starving the Kernel When Using SSE
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, =?UTF-8?B?6Lev5pet?=
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?UTF-8?B?5bSU6L+Q6L6J?= <cuiyunhui@bytedance.com>,
 =?UTF-8?B?5YWD56u5?= <yuanzhu@bytedance.com>
References: <CACnXVncnu6Rnx64GemdBvxu+mTqYEMGePoR5OvaJh3gC4uG-NA@mail.gmail.com>
 <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com>
 <4a24df59-a209-4f2f-9465-f98482e83952@rivosinc.com>
 <00786ddb6d626442879072851d455bbd8ef1181d.d460d6ec.7656.4a45.8288.5b0b88825811@bytedance.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <00786ddb6d626442879072851d455bbd8ef1181d.d460d6ec.7656.4a45.8288.5b0b88825811@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005200_828142_C7098468 
X-CRM114-Status: GOOD (  49.62  )
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



On 11/18/25 09:46, Zhanpeng Zhang wrote:
> Hi Clément,
> 
> It seems that your patch is based on the PMU-ctr-delegation version. However, I'm using PMU-SBI and the SSE extension of v8. 
> So, I made corresponding modifications in `pmu_sbi_ovf_handler` as yours in `rvpmu_ovf_handler`.

Hi Zhanpeng,

Indeed my modifications were based on Atish rvpmu series.

> This indeed prevents the kernel from hanging during perf sampling, and the sampling results look good. But according to the debug results, I think the problem with this approach is quite obvious. After this modification, most `pmu_start` operations are triggered by `event_sched_in` rather than do_sse. That is to say, `pmu_start` is delayed until `event_sched_in`.

That's the expected result, point being that the IRQ rate should be
throttled. Depending on how slow is your platform, overflow might kick
in faster leading to more throttling and thus delayed start of counter.
I do think this solution is the one that should be implemented since the
overflow return value from perf_event_overflow() is exactly meant for
that (ie throttling IRQs).

Clément

> Actually, I'm also planning to try Atish's PMU-ctr-delegation extension, such delegation optimization seems to be helpful to alleviate the hanging problem. But I think this is no longer the same issue, as it requires comprehensive modifications to the hardware/qemu, kernel, SBI, and Perf itself.
> 
> Regards,
> Zhanpeng
>> From: "Clément Léger"<cleger@rivosinc.com>
>> Date:  Fri, Nov 14, 2025, 23:41
>> Subject:  [External] Re: How to Avoid Starving the Kernel When Using SSE
>> To: "张展鹏"<zhangzhanpeng.jasper@bytedance.com>
>> Cc: "Paul Walmsley"<paul.walmsley@sifive.com>, "Palmer Dabbelt"<palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"<linux-arm-kernel@lists.infradead.org>, "Himanshu Chauhan"<hchauhan@ventanamicro.com>, "Anup Patel"<apatel@ventanamicro.com>, "路旭"<luxu.kernel@bytedance.com>, "Atish Patra"<atishp@atishpatra.org>, "Björn Töpel"<bjorn@rivosinc.com>, "崔运辉"<cuiyunhui@bytedance.com>, "元竹"<yuanzhu@bytedance.com>
>> On 11/14/25 14:36, Clément Léger wrote:
> 
>>>
> 
>>>
> 
>>> Hi Zhanpeng,
> 
>>>
> 
>>> On 11/14/25 11:24, 张展鹏 wrote:
> 
>>>> Hi Clément,
> 
>>>>
> 
>>>> Lately, I've been thinking about how to avoid starving the kernel when
> 
>>>> using SSE:
> 
>>>> SSE is powered by M-mode irqs such as M-mode PMU irq for perf sampling and
> 
>>>> M-mode IPI for inter-hart injection. Meanwhile, kernel is powered by S-mode
> 
>>>> irqs, so the kernel may experience starvation when there is a flood of
> 
>>>> M-mode irqs, and kernel may cause such flooding of M-mode irqs when using
> 
>>>> SSE, either deliberately or inadvertently:
> 
>>>>
> 
>>>>    1.  Malicious SSE handler: Kernel may deliberately register a bad SSE
> 
>>>>    handler, which triggers a new inter-hart SSE request via ecall. This will
> 
>>>>    cause an endless loop of SSE, rendering the kernel unresponsive. In this
> 
>>>>    case, the only thing SBI can do is to prevent the nesting of SSE in
> 
>>>>    `sbi_trap_handler` and ensure that SSE events are executed in priority
> 
>>>>    order.
> 
>>>
> 
>>> That seems quite convoluted. Anyone that can load a module can do worse
> 
>>> than crashing the kernel :)
> 
>>>
> 
>>>>    2.  Perf sampling: Kernel may inadvertently choose a bad parameter for
> 
>>>>    Perf, which causes PMU irqs to occur too frequently. Continuous PMU irqs
> 
>>>>    will leave the system with no time to respond to S-mode irqs.
> 
>>>
> 
>>> But this one concern however is valid !
> 
>>>
> 
>>>>
> 
>>>>  Hence, I think we are supposed to improve the SSE framework to avoid
> 
>>>> starving the kernel so easily.
> 
>>>>
> 
>>>> Here is a case study of perf sampling:
> 
>>>> When using PMU-SSE for Perf sampling, the kernel may hang and become
> 
>>>> unresponsive due to the PMU-SSE loop. Once we start to process a Perf
> 
>>>> sampling using PMU-SSE, the kernel may fail to respond to `Ctrl+C` or fail
> 
>>>> to exit after the timing of `sleep 1` completes (these are the two most
> 
>>>> commonly used time-based sampling methods in perf).
> 
>>>>
> 
>>>> By default, perf uses a relatively high sampling frequency, namely
> 
>>>> `perf_event_max_sample_rate`, and will adjust it on demand if sampling
> 
>>>> takes too much time. If this frequency/period goes beyond what system can
> 
>>>> handle, it will make SSE events connect end-to-end, and the system will get
> 
>>>> stuck in an endless loop of "SSE → PMU interrupt → SSE". The kernel is then
> 
>>>> starved (at this point, if you print the `sepc` of SSE completion, you will
> 
>>>> find that the `sepc` remains unchanged each time, indicating that the
> 
>>>> kernel is stuck), and the kernel can never escape from this loop of
> 
>>>> PMU-SSE, because it can neither respond to Ctrl+C interrupts nor adjust the
> 
>>>> sampling frequency.
> 
>>>>
> 
>>>> Current solution: The key to this problem is that every time we finish
> 
>>>> sse_complete, there is already a new PMU irq pending. Then we resume the
> 
>>>> kernel execution via mret, and the system will immediately trap back into
> 
>>>> SSE.
> 
>>>>
> 
>>>> The PMU-SSE-Perf processing flow includes the following steps: `sse_inject`
> 
>>>> (mret to SSE handler), `pmu_stop` (clear PMU pending bit), `pmu_start` (set
> 
>>>> a new value for PMU counter), and `sse_complete` (resume execution to the
> 
>>>> point where the kernel was interrupted). The reason why kernel traps right
> 
>>>> after `sse_complete` is that there is a new PMU irq generated between
> 
>>>> `pmu_start` and `sse_complete`.
> 
>>>>
> 
>>>> In order to address this issue, we propose to delay the procedure of
> 
>>>> re-starting the overflowed PMU counter during PMU-SSE. When kernel triggers
> 
>>>> an ecall to restart the overflowed PMU counters, SBI can check whether it
> 
>>>> is SSE-powered PMU handling. If so, we temporarily modify mhpmevent CSR to
> 
>>>> stop counting kernel events. In this process, M-mode events are always
> 
>>>> inhibited, and U-mode code will not be executed during the
> 
>>>> `pmu_sbi_ovf_handler`, so we only need to inhibit the counting of kernel
> 
>>>> events.
> 
>>>
> 
>>> I'd rather let the kernel control the PMU SSE event delivery by masking
> 
>>> it at the end of the SSE handler and reenabling it later. Additionally,
> 
>>> that solution being in the SBI itself, it does not guarantee that all
> 
>>> SBI implementation will actually do that correctly.
> 
>>>
> 
>>> What seems odd is that the perf_event_sample_took() call at each end of
> 
>>> PMU event handler should actually allow perf subsystem to throttle the
> 
>>> rate. I'll take another look at that part to make sure it works as
> 
>>> expected and that we aren't missing any bits.
> 
>>
>> Hey Zhanpeng,
> 
>>
>> Could you try to apply this quick'n'dirty patch on top of the SSE series
> 
>> and check if it still hang ?
> 
>>
>> diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
> 
>> index 7dec9c2afa9b..0fb8749c476f 100644
> 
>> --- a/drivers/perf/riscv_pmu_dev.c
> 
>> +++ b/drivers/perf/riscv_pmu_dev.c
> 
>> @@ -1326,6 +1326,7 @@ static irqreturn_t rvpmu_ovf_handler(struct
> 
>> cpu_hw_events *cpu_hw_evt,
> 
>>         int lidx, hidx, fidx;
> 
>>         struct riscv_pmu *pmu;
> 
>>         struct perf_event *event;
> 
>> +       int ev_overflow = 0;
> 
>>         u64 overflow;
> 
>>         u64 overflowed_ctrs = 0;
> 
>>         u64 start_clock = sched_clock();
> 
>> @@ -1423,13 +1424,15 @@ static irqreturn_t rvpmu_ovf_handler(struct
> 
>> cpu_hw_events *cpu_hw_evt,
> 
>>                          * TODO: We will need to stop the guest counters
> 
>> once
> 
>>                          * virtualization support is added.
> 
>>                          */
> 
>> -                       perf_event_overflow(event, &data, regs);
> 
>> +                       ev_overflow |= perf_event_overflow(event, &data,
> 
>> regs);
> 
>>                 }
> 
>>                 /* Reset the state as we are going to start the counter
> 
>> after the loop */
> 
>>                 hw_evt->state = 0;
> 
>>         }
> 
>>
>> -       rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
> 
>> +       if (!ev_overflow || !from_sse)
> 
>> +               rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
> 
>> +
> 
>>         perf_sample_event_took(sched_clock() - start_clock);
> 
>>
>>         return IRQ_HANDLED;
> 
>>
>>>
> 
>>> Thanks,
> 
>>>
> 
>>> Clément
> 
>>>
> 
>>>>
> 
>>>> In this way, we can ensure that `pmu_sbi_ovf_handler` will not be
> 
>>>> re-entered by the new PMU-SSE, and minimize the modification of perf logic.
> 
>>>> The price is that we gave up sampling a small portion of kernel code(from
> 
>>>> `pmu_ctr_start` to the end of `pmu_sbi_ovf_handler`), and we probably need
> 
>>>> a new parameter in `pmu_ctr_start`.
> 
>>>>
> 
>>>> Looking forward to your suggestions. Thanks!
> 
>>>>
> 
>>>> Best regards,
> 
>>>> Zhanpeng Zhang
> 
>>>>
> 
>>>
>>


