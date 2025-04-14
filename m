Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209F8C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6S9D8CaBKO/q2oBksdQOb459DEafNnNvUFs5jBUstY=; b=uYqC1RqS0q/b8KkaOG9eE2znNy
	lZrSEaK9HBfaA6lwnYtZwGEPLLP6kvghrKfTDYNo+a5b1FymlN2FcvtNWpDPdVsr/VBeZNOTozSWN
	FXsZusDie5Zu27vPrMZKLWSGbfYux3I72p2E70zV9PCf0LdDqFDWgC5Nyn/auxCi9qs0TF3sUfFnn
	j7h9dRzfoaRNoz7FDqyLcc4DxYfjuSVJNlhynkWmWpAJSX3x0nMjGhwa2cAbW1iHTc4OVIheD234e
	YzaBh1X1Ye0EGj6Tu+9D+pKC7hApje7xMdY3+2lVSXSu7Y8fhPo7QcejV2ZJXDXQF9A1QMMLQweSX
	t5dQqfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EWN-00000000z3I-1fWH;
	Mon, 14 Apr 2025 07:46:23 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ETO-00000000yUS-0ezE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 07:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744616594; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=C6S9D8CaBKO/q2oBksdQOb459DEafNnNvUFs5jBUstY=;
	b=m8yH7rBy4s4AyxRV0a2mGOSwvHnyFGh6tzM/1E/JHv1Scn69rM2m5oJbv4KWGtzVdJRCU9vqPPR6URosDVqDoe4XwrEfgdrI3uoUWxSYDADY3VsKzAqdm/AQa1PjDdGq0jo/lDnhcq+LvWGAkiLaTKMnMrI+Z/rq1InVTrKGo4E=
Received: from 30.246.161.79(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WWirnWt_1744616589 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Apr 2025 15:43:10 +0800
Message-ID: <6b313eef-c576-4c0c-8d9f-8ef0bf3cc0fd@linux.alibaba.com>
Date: Mon, 14 Apr 2025 15:43:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/11] arm64: idle: export arch_cpu_idle()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 x86@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
 lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
 mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org, maz@kernel.org,
 misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <20250218213337.377987-1-ankur.a.arora@oracle.com>
 <20250218213337.377987-11-ankur.a.arora@oracle.com>
 <18875bd7-bf01-4ba8-b38a-4c0767e3130e@linux.alibaba.com>
 <87h62u76xg.fsf@oracle.com>
 <f384a766-d91a-4db5-9ed6-c1ed6079da1d@linux.alibaba.com>
 <87ikn75rrn.fsf@oracle.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <87ikn75rrn.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_004318_842691_C2BA68EB 
X-CRM114-Status: GOOD (  16.69  )
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



在 2025/4/14 11:46, Ankur Arora 写道:
> 
> Shuai Xue <xueshuai@linux.alibaba.com> writes:
> 
>> 在 2025/4/12 04:57, Ankur Arora 写道:
>>> Shuai Xue <xueshuai@linux.alibaba.com> writes:
>>>
>>>> 在 2025/2/19 05:33, Ankur Arora 写道:
>>>>> Needed for cpuidle-haltpoll.
>>>>> Acked-by: Will Deacon <will@kernel.org>
>>>>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>>>>> ---
>>>>>     arch/arm64/kernel/idle.c | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
>>>>> index 05cfb347ec26..b85ba0df9b02 100644
>>>>> --- a/arch/arm64/kernel/idle.c
>>>>> +++ b/arch/arm64/kernel/idle.c
>>>>> @@ -43,3 +43,4 @@ void __cpuidle arch_cpu_idle(void)
>>>>>     	 */
>>>>>     	cpu_do_idle();
>>>>
>>>> Hi, Ankur,
>>>>
>>>> With haltpoll_driver registered, arch_cpu_idle() on x86 can select
>>>> mwait_idle() in idle threads.
>>>>
>>>> It use MONITOR sets up an effective address range that is monitored
>>>> for write-to-memory activities; MWAIT places the processor in
>>>> an optimized state (this may vary between different implementations)
>>>> until a write to the monitored address range occurs.
>>> MWAIT is more capable than WFE -- it allows selection of deeper idle
>>> state. IIRC C2/C3.
>>>
>>>> Should arch_cpu_idle() on arm64 also use the LDXR/WFE
>>>> to avoid wakeup IPI like x86 monitor/mwait?
>>> Avoiding the wakeup IPI needs TIF_NR_POLLING and polling in idle support
>>> that this series adds.
>>> As Haris notes, the negative with only using WFE is that it only allows
>>> a single idle state, one that is fairly shallow because the event-stream
>>> causes a wakeup every 100us.
>>> --
>>> ankur
>>
>> Hi, Ankur and Haris
>>
>> Got it, thanks for explaination :)
>>
>> Comparing sched-pipe performance on Rund with Yitian 710, *IPC improved 35%*:
> 
> Thanks for testing Shuai. I wasn't expecting the IPC to improve by quite
> that much :). The reduced instructions make sense since we don't have to
> handle the IRQ anymore but we would spend some of the saved cycles
> waiting in WFE instead.
> 
> I'm not familiar with the Yitian 710. Can you check if you are running
> with WFE? That's the __smp_cond_load_relaxed_timewait() path vs the
> __smp_cond_load_relaxed_spinwait() path in [0]. Same question for the
> Kunpeng 920.

Yes, it running with __smp_cond_load_relaxed_timewait().

I use perf-probe to check if WFE is available in Guest:

perf probe 'arch_timer_evtstrm_available%return r=$retval'
perf record -e probe:arch_timer_evtstrm_available__return -aR sleep 1
perf script
swapper       0 [000]  1360.063049: probe:arch_timer_evtstrm_available__return: (ffff800080a5c640 <- ffff800080d42764) r=0x1

arch_timer_evtstrm_available returns true, so
__smp_cond_load_relaxed_timewait() is used.

> 
> Also, I'm working on a new version of the series in [1]. Would you be
> okay trying that out?

Sure. Please cc me when you send out a new version.

> 
> Thanks
> Ankur
> 
> [0] https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.arora@oracle.com/
> [1] https://lore.kernel.org/lkml/20250203214911.898276-4-ankur.a.arora@oracle.com/
> 

Thanks.
Shuai

