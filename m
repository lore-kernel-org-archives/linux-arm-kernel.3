Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C1CE8D49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg8Ti14sQYHN7alKAMbJMnVItExkexNvxjvu4qSCw0M=; b=IiKAhW5imxH2L8cU1fYenrO3eO
	i5x4iy6Gc36atZeugJHFIOC1ZU5VeR3RX5pzPrMMX93/ezqPhRXtM9FYhpXhrlzzeN2vWw4GKnyUZ
	zYP2Ga5lYX0QYc8WwFlG9oEoOzIV9KNs6YcJaH06W8y4hgUDIvV5+a2+Gvp9K8TaiNq4oQICgy5U8
	G8dxyEVARR9SXmhhr3tk0yVax+fsQIVK7mCKoFyj+j5joXp1/zmIOWhrm+p+M72rdUJ1WMdls1mrp
	2iG9YDeLMYx4lYAL66nGihtrSGYyrYYkC1Z3DD5NLnFRQM7Dhaay9+dSBHRiKCLEvfV/MoObTXCtk
	OsLEmOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvvi-0000000Cb44-3uHI;
	Fri, 14 Nov 2025 15:41:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvvg-0000000Cb3A-2R2k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:41:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29516a36affso22728255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763134900; x=1763739700; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg8Ti14sQYHN7alKAMbJMnVItExkexNvxjvu4qSCw0M=;
        b=KLuzf9tbLa8PhdWdaMfvuI2+AvC6fbUB/peuy+rvPxGZNqBskdN0Qenp2wsVjlBCtr
         133tKBW2zdL4fEVuXm6/kUeyYV4nFl0kQ9n6KtY293IHgeCqkRhSphFkrz5mSAL2Or1R
         yj9WkZ2VyQ2YZNiAXYG10VrtKRUv0lsNiIF+bsVyS+pzy9XAWCRKubedHnYSFgbLO6lS
         pHzpc1SksxdmXsrVS0oWNLP+maP9VNgvCLmdfTp3bMkvplRz2nG9RxGJh1uaNnJo5Npe
         55sBJAlHrrExyNjByofCGU04QevAcsvahqItwgnGwV6NDFEwI1THOmVZz4bqOdOMBqju
         cNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134900; x=1763739700;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg8Ti14sQYHN7alKAMbJMnVItExkexNvxjvu4qSCw0M=;
        b=EBOzYC0j9PigF00j/kj/DL7qN50EdLs3ISsFcH/TOx85GaJbhcLj6xAnvFuSIl8Q2x
         FcFbf0RbOEnUKBmNP1d8QuC0wZa0OYpAWo3xHoVQe8WfTM2LVnZYjeqpxXpsgph+vzj/
         /whv45CW/FNJblD+iXsaSRQjexx9i/Yal2By8WAfVVxaFcUWW6NDL+2nnWuzEuHnc8fL
         JVy4HhoJJTAFYXSADZ3EgppTjaLr/yWD2aso8brk2i6y9SLv4Fa0yJJY+9/M9bgcY3mG
         OP5KUi7+hh9Xd1tgBcqJYHCW0dR2O8+c1a9zcrA4eXSXnB3du8ZqlMmDQ74qcQRnGrbt
         HWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVFT9c7nziZG6mlmEjbqar3rhQt+6VcedjpFA3tjzludhSZex0wxm9E2/sq5USZodj2QzpRIjPRte7g0uTnb+DO@lists.infradead.org
X-Gm-Message-State: AOJu0Yytenfa0RoB/ERr0e+aqJwxhnPj5cftWw9riaUpuZS7lyDEsema
	0d33dmW/a+/PAnWFoZQSBBpOjzolsUVqE69seDh1eTyFIH28rfgzWCXxGJtrjRUaQZk=
X-Gm-Gg: ASbGnctIJ1MerxAA8rXpAjfnrOAFnkpjrU2EuFVURY6QBP7DH6hBknzEeAqzXTJMsxL
	lvVJ9Q0d8SjYJ/aAck2ScwKORmiq0JuvS8RBa9Q8OvKaGVDOP7Ecw+wInV+JXmE/bWpwK+h/X9+
	6KderkoyAwYLqM54vDsj8ezjLCqkCKk0bPqasUVs4jYPoAw6tR4zhV+2yF/7CwgQXPpkqlJfI6c
	mCc9x+j0WTbINn4g2vqHouDy6JGMFjdULR4vsRE/GNTCf+Vo84zXw75EVQ8ZFHY3erkycRuL6fl
	J78x50JD4rf06yjgx90lUHk5H59Gno7ASLv5ZZr1SMnRxYM+FtAFKz14wrQlK4phLxC4ciFXPbD
	6T/33DOg5QXaZ7l30GmKYzHRDnCIbVoJGbQf66D/Vlx5usCCo6l5z1PzAoP7rha6rrVm6RQM1Q2
	p+YCnqubM/I5xM7xgd6Lj5OC4Gy8pB4Z27+mJNjHofZLUX+w==
X-Google-Smtp-Source: AGHT+IEIzmumTxzs8HD0cpCB3dd/dOOpZl7zhM3ACSM8EeZdfADSdgjpRi0Fxb/n7gUrXKWU7BOHow==
X-Received: by 2002:a17:903:2f0e:b0:24c:965a:f94d with SMTP id d9443c01a7336-2986a741b6cmr35738145ad.46.1763134899754;
        Fri, 14 Nov 2025 07:41:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c23849esm59745065ad.5.2025.11.14.07.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:41:39 -0800 (PST)
Message-ID: <4a24df59-a209-4f2f-9465-f98482e83952@rivosinc.com>
Date: Fri, 14 Nov 2025 16:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to Avoid Starving the Kernel When Using SSE
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: =?UTF-8?B?5byg5bGV6bmP?= <zhangzhanpeng.jasper@bytedance.com>
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
Content-Language: en-US
In-Reply-To: <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_074140_625797_D2F38F20 
X-CRM114-Status: GOOD (  35.81  )
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



On 11/14/25 14:36, Clément Léger wrote:
> 
> 
> Hi Zhanpeng,
> 
> On 11/14/25 11:24, 张展鹏 wrote:
>> Hi Clément,
>>
>> Lately, I've been thinking about how to avoid starving the kernel when
>> using SSE:
>> SSE is powered by M-mode irqs such as M-mode PMU irq for perf sampling and
>> M-mode IPI for inter-hart injection. Meanwhile, kernel is powered by S-mode
>> irqs, so the kernel may experience starvation when there is a flood of
>> M-mode irqs, and kernel may cause such flooding of M-mode irqs when using
>> SSE, either deliberately or inadvertently:
>>
>>    1.  Malicious SSE handler: Kernel may deliberately register a bad SSE
>>    handler, which triggers a new inter-hart SSE request via ecall. This will
>>    cause an endless loop of SSE, rendering the kernel unresponsive. In this
>>    case, the only thing SBI can do is to prevent the nesting of SSE in
>>    `sbi_trap_handler` and ensure that SSE events are executed in priority
>>    order.
> 
> That seems quite convoluted. Anyone that can load a module can do worse
> than crashing the kernel :)
> 
>>    2.  Perf sampling: Kernel may inadvertently choose a bad parameter for
>>    Perf, which causes PMU irqs to occur too frequently. Continuous PMU irqs
>>    will leave the system with no time to respond to S-mode irqs.
> 
> But this one concern however is valid !
> 
>>
>>  Hence, I think we are supposed to improve the SSE framework to avoid
>> starving the kernel so easily.
>>
>> Here is a case study of perf sampling:
>> When using PMU-SSE for Perf sampling, the kernel may hang and become
>> unresponsive due to the PMU-SSE loop. Once we start to process a Perf
>> sampling using PMU-SSE, the kernel may fail to respond to `Ctrl+C` or fail
>> to exit after the timing of `sleep 1` completes (these are the two most
>> commonly used time-based sampling methods in perf).
>>
>> By default, perf uses a relatively high sampling frequency, namely
>> `perf_event_max_sample_rate`, and will adjust it on demand if sampling
>> takes too much time. If this frequency/period goes beyond what system can
>> handle, it will make SSE events connect end-to-end, and the system will get
>> stuck in an endless loop of "SSE → PMU interrupt → SSE". The kernel is then
>> starved (at this point, if you print the `sepc` of SSE completion, you will
>> find that the `sepc` remains unchanged each time, indicating that the
>> kernel is stuck), and the kernel can never escape from this loop of
>> PMU-SSE, because it can neither respond to Ctrl+C interrupts nor adjust the
>> sampling frequency.
>>
>> Current solution: The key to this problem is that every time we finish
>> sse_complete, there is already a new PMU irq pending. Then we resume the
>> kernel execution via mret, and the system will immediately trap back into
>> SSE.
>>
>> The PMU-SSE-Perf processing flow includes the following steps: `sse_inject`
>> (mret to SSE handler), `pmu_stop` (clear PMU pending bit), `pmu_start` (set
>> a new value for PMU counter), and `sse_complete` (resume execution to the
>> point where the kernel was interrupted). The reason why kernel traps right
>> after `sse_complete` is that there is a new PMU irq generated between
>> `pmu_start` and `sse_complete`.
>>
>> In order to address this issue, we propose to delay the procedure of
>> re-starting the overflowed PMU counter during PMU-SSE. When kernel triggers
>> an ecall to restart the overflowed PMU counters, SBI can check whether it
>> is SSE-powered PMU handling. If so, we temporarily modify mhpmevent CSR to
>> stop counting kernel events. In this process, M-mode events are always
>> inhibited, and U-mode code will not be executed during the
>> `pmu_sbi_ovf_handler`, so we only need to inhibit the counting of kernel
>> events.
> 
> I'd rather let the kernel control the PMU SSE event delivery by masking
> it at the end of the SSE handler and reenabling it later. Additionally,
> that solution being in the SBI itself, it does not guarantee that all
> SBI implementation will actually do that correctly.
> 
> What seems odd is that the perf_event_sample_took() call at each end of
> PMU event handler should actually allow perf subsystem to throttle the
> rate. I'll take another look at that part to make sure it works as
> expected and that we aren't missing any bits.

Hey Zhanpeng,

Could you try to apply this quick'n'dirty patch on top of the SSE series
and check if it still hang ?

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 7dec9c2afa9b..0fb8749c476f 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -1326,6 +1326,7 @@ static irqreturn_t rvpmu_ovf_handler(struct
cpu_hw_events *cpu_hw_evt,
        int lidx, hidx, fidx;
        struct riscv_pmu *pmu;
        struct perf_event *event;
+       int ev_overflow = 0;
        u64 overflow;
        u64 overflowed_ctrs = 0;
        u64 start_clock = sched_clock();
@@ -1423,13 +1424,15 @@ static irqreturn_t rvpmu_ovf_handler(struct
cpu_hw_events *cpu_hw_evt,
                         * TODO: We will need to stop the guest counters
once
                         * virtualization support is added.
                         */
-                       perf_event_overflow(event, &data, regs);
+                       ev_overflow |= perf_event_overflow(event, &data,
regs);
                }
                /* Reset the state as we are going to start the counter
after the loop */
                hw_evt->state = 0;
        }

-       rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
+       if (!ev_overflow || !from_sse)
+               rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
+
        perf_sample_event_took(sched_clock() - start_clock);

        return IRQ_HANDLED;

> 
> Thanks,
> 
> Clément
> 
>>
>> In this way, we can ensure that `pmu_sbi_ovf_handler` will not be
>> re-entered by the new PMU-SSE, and minimize the modification of perf logic.
>> The price is that we gave up sampling a small portion of kernel code(from
>> `pmu_ctr_start` to the end of `pmu_sbi_ovf_handler`), and we probably need
>> a new parameter in `pmu_ctr_start`.
>>
>> Looking forward to your suggestions. Thanks!
>>
>> Best regards,
>> Zhanpeng Zhang
>>
> 


