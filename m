Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E887CE7B0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHEr0VGdvNGDZiR6SQYgH1KlLGPNA+7KAqiw0a2paZY=; b=FATLBlKCHiYWq4GQv/CWACqQL5
	0C504I+8FMVss1ncgfqaADjs9jXnp+swYo4TXNmEsZ/pVHUWjICRKw/JLQ8QhzAXzI6joQr5pbDsn
	vgPTq235ApB6p2SCfwqoYz4YVlH+yxmGL9QqkMdAs0DqFSuboxCmNobL9xb8qGlNzYBT24ESg6jeH
	KI0ubogpDKj4sCgmS1hwAsX8F9Dowe8w5rOe4FBs1LUNmsZML+zJbEJT18Bq4N6R0ZRSlO5OMXV/Q
	+xFC+RzwmMcMyhlTqml+XzeCmnLaaNUQEnO1+1BOl+m1Ylsv3V2Ajt3WY0f6PW61jGETg859WZ3X3
	d8E9vpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtyb-0000000CGp6-3tai;
	Fri, 14 Nov 2025 13:36:33 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtyY-0000000CGoL-3pG7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:36:32 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3418ad69672so1471210a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1763127390; x=1763732190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHEr0VGdvNGDZiR6SQYgH1KlLGPNA+7KAqiw0a2paZY=;
        b=AQW09aAc44xA1D+dTz6hmPQrPEZaYHvJQt+M6pHgchWqykzuqZkHfH0as2Ye3MvS6n
         0CWHbIhTpx4xHzDV60XnlMaeIE42JnVq0c4zGayjDWHfvx+oTjefFEUFNC8T4rmhLlHt
         YzWdITwF1Ud8TTza+at62F40lZJo4Tb5Lw4EsJYAxExGmuEBzdtwzBCQcRhbIcrKqzcJ
         QqKJALa8lf1iDkNZ3aeYhJyAsQaM5ytbMdcbz03lyfGEbY3hbelRmG7CYGIsqB3VQfjm
         qp5L1EQsZTmd/cIWUBdPWugyZtBwwygiQex2n3lsEiv5j04KXJhfN/oO7JM/5gWf6Ll7
         XNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127390; x=1763732190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHEr0VGdvNGDZiR6SQYgH1KlLGPNA+7KAqiw0a2paZY=;
        b=W1p2WDLoGfdDDEhtNgxv8JpPd042MWYro/dtCpDKV51JIua5r3QFBxT4VG+TTKysxi
         SnKkT4ZVmxT/B/tkLGW8kGMvPH/L2CGd11cEKqR8Nf/duWjJWWW2w7F7Sez3zIM53ZfE
         Pf0cREgsV9JwIhq91MdW1GErA6TErn694QK9N2xHQOtt97v+diNolEHIwY/PaTW3PBfI
         u8Gp28kC0xS47/Mi0LdytAbletSAaMOUWjlTiDxUlLc9JfsV/ZaZSezuVj9whPylFAio
         gve+oEmSBZ4+ayjHSUBGMIv76nlpCKAmwt3nR+uqh/nsHttwWJvMOOlGQLwoXnmmMkWD
         63dA==
X-Forwarded-Encrypted: i=1; AJvYcCUXi/w3mwVNr0MdFDXpj/gQbfvvdtDToQ8XsYxktc+o9dDKRNShNTnSaSFUPdpF4r+6xEDjfFvJqZQZInU5s5pS@lists.infradead.org
X-Gm-Message-State: AOJu0YxZB4ZIQ4yQ+MBjgAOCFFe0GYuho1/g0i7zY/W3uGMEHbo37aKG
	vAOk2KT7MqUkQ5UVzcLcuSi6gdth/HA3RtTzTtAyc8uOQFPq74pfW1Vzme+3nrT58lo=
X-Gm-Gg: ASbGncvbIeePs0pQT1+mqcIz+ZPv+f+dHXUOQ/cbuYXzeIsnKPtJNwPnBVY8+OSyYDz
	d8TUcvjP6gxD1u8eIJlo1X/DlJ604+RROSZweybLzuXYnDmn0B4K/C0jtlElijDJzwzig5fmkRZ
	0QstV1+9vDRdl6Bh8jDLlFBgxn0nAt/S0myi5IXHg8hHwduNg01BpDYIgngBmCuo0m0ZEzsywuv
	qDaBfzTd195S24aBa7WCYCu+E75p6BM8k6wAPQ2mtZtNKWmIofu4y/UzJJuFD4d3SMo/Od6pVCc
	5KxXkhT56Pj8XC2+dAq82+uiAM4uUsvA4wrsjKbpBZWfyxDTq71uwaFJT7FHg7jvL54G9jg+aeo
	Gsq0JbQ2FuoAbDdtuElkq3jy4XhYC0Q+1BqVooUkDqMP3wjsB/qJbU4PjVAFV3IYUNTk0NElNvg
	tGF0NSj4BB8hLvy1RxjMNSqCqWKvbZCW2oH+GwUPBlXFE+NQ==
X-Google-Smtp-Source: AGHT+IGTlOsBEwW7dz/WZ/DHBPhbduYubtpAD4QTiOhGNCk+QaT1FYVrfJAMaEe5hmWNAFKDgI1qjg==
X-Received: by 2002:a17:90b:540e:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-343f9d906dfmr3058440a91.2.1763127389658;
        Fri, 14 Nov 2025 05:36:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343eac7ec71sm2423873a91.11.2025.11.14.05.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 05:36:28 -0800 (PST)
Message-ID: <bec1e1f4-e188-415d-bbb2-1854b7e8cf1d@rivosinc.com>
Date: Fri, 14 Nov 2025 14:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to Avoid Starving the Kernel When Using SSE
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
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CACnXVncnu6Rnx64GemdBvxu+mTqYEMGePoR5OvaJh3gC4uG-NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053631_058482_937069E8 
X-CRM114-Status: GOOD (  35.36  )
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



Hi Zhanpeng,

On 11/14/25 11:24, 张展鹏 wrote:
> Hi Clément,
> 
> Lately, I've been thinking about how to avoid starving the kernel when
> using SSE:
> SSE is powered by M-mode irqs such as M-mode PMU irq for perf sampling and
> M-mode IPI for inter-hart injection. Meanwhile, kernel is powered by S-mode
> irqs, so the kernel may experience starvation when there is a flood of
> M-mode irqs, and kernel may cause such flooding of M-mode irqs when using
> SSE, either deliberately or inadvertently:
> 
>    1.  Malicious SSE handler: Kernel may deliberately register a bad SSE
>    handler, which triggers a new inter-hart SSE request via ecall. This will
>    cause an endless loop of SSE, rendering the kernel unresponsive. In this
>    case, the only thing SBI can do is to prevent the nesting of SSE in
>    `sbi_trap_handler` and ensure that SSE events are executed in priority
>    order.

That seems quite convoluted. Anyone that can load a module can do worse
than crashing the kernel :)

>    2.  Perf sampling: Kernel may inadvertently choose a bad parameter for
>    Perf, which causes PMU irqs to occur too frequently. Continuous PMU irqs
>    will leave the system with no time to respond to S-mode irqs.

But this one concern however is valid !

> 
>  Hence, I think we are supposed to improve the SSE framework to avoid
> starving the kernel so easily.
> 
> Here is a case study of perf sampling:
> When using PMU-SSE for Perf sampling, the kernel may hang and become
> unresponsive due to the PMU-SSE loop. Once we start to process a Perf
> sampling using PMU-SSE, the kernel may fail to respond to `Ctrl+C` or fail
> to exit after the timing of `sleep 1` completes (these are the two most
> commonly used time-based sampling methods in perf).
> 
> By default, perf uses a relatively high sampling frequency, namely
> `perf_event_max_sample_rate`, and will adjust it on demand if sampling
> takes too much time. If this frequency/period goes beyond what system can
> handle, it will make SSE events connect end-to-end, and the system will get
> stuck in an endless loop of "SSE → PMU interrupt → SSE". The kernel is then
> starved (at this point, if you print the `sepc` of SSE completion, you will
> find that the `sepc` remains unchanged each time, indicating that the
> kernel is stuck), and the kernel can never escape from this loop of
> PMU-SSE, because it can neither respond to Ctrl+C interrupts nor adjust the
> sampling frequency.
> 
> Current solution: The key to this problem is that every time we finish
> sse_complete, there is already a new PMU irq pending. Then we resume the
> kernel execution via mret, and the system will immediately trap back into
> SSE.
> 
> The PMU-SSE-Perf processing flow includes the following steps: `sse_inject`
> (mret to SSE handler), `pmu_stop` (clear PMU pending bit), `pmu_start` (set
> a new value for PMU counter), and `sse_complete` (resume execution to the
> point where the kernel was interrupted). The reason why kernel traps right
> after `sse_complete` is that there is a new PMU irq generated between
> `pmu_start` and `sse_complete`.
> 
> In order to address this issue, we propose to delay the procedure of
> re-starting the overflowed PMU counter during PMU-SSE. When kernel triggers
> an ecall to restart the overflowed PMU counters, SBI can check whether it
> is SSE-powered PMU handling. If so, we temporarily modify mhpmevent CSR to
> stop counting kernel events. In this process, M-mode events are always
> inhibited, and U-mode code will not be executed during the
> `pmu_sbi_ovf_handler`, so we only need to inhibit the counting of kernel
> events.

I'd rather let the kernel control the PMU SSE event delivery by masking
it at the end of the SSE handler and reenabling it later. Additionally,
that solution being in the SBI itself, it does not guarantee that all
SBI implementation will actually do that correctly.

What seems odd is that the perf_event_sample_took() call at each end of
PMU event handler should actually allow perf subsystem to throttle the
rate. I'll take another look at that part to make sure it works as
expected and that we aren't missing any bits.

Thanks,

Clément

> 
> In this way, we can ensure that `pmu_sbi_ovf_handler` will not be
> re-entered by the new PMU-SSE, and minimize the modification of perf logic.
> The price is that we gave up sampling a small portion of kernel code(from
> `pmu_ctr_start` to the end of `pmu_sbi_ovf_handler`), and we probably need
> a new parameter in `pmu_ctr_start`.
> 
> Looking forward to your suggestions. Thanks!
> 
> Best regards,
> Zhanpeng Zhang
> 


