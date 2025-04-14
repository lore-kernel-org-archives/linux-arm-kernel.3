Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66DAC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 02:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X97F5MgRA4m0PgntN/AzNUw5CItqAr4WVJ5ZtYo90bQ=; b=ZPGv/YfUStSchpF5+B/sQINf19
	X+XZG5oHhKfsIiUU92xxRB47Vsmy0Job9jBz9aXjF8Uu5KtdkhwWXo/ASgiZUYyI1K7LGDguoHYG0
	aWhWlrxcyZ9ogzimpDJxMyYClM1cGMuGN6p3cpN7aaACoLXIfHETf0vAXioy0DVuViXzhM4o+v+3C
	d+WyR1Etmc2SA/PRniQexCj5r2oilekJe7je7IkRWtB0mrbSH03Nly4HW9Yx8Pg+tCiCCQX2dPwS2
	Vm3JZKOve5Jki4FLE2XkTvcNmto7j6yk3820HvKT2bQS6+4UZeb8akB9OlrVRpC7zkcIsBSAZ1xJT
	Yc2+2KNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u49Ai-00000000T8H-0TBZ;
	Mon, 14 Apr 2025 02:03:40 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u498t-00000000T0P-0We8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 02:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744596103; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=X97F5MgRA4m0PgntN/AzNUw5CItqAr4WVJ5ZtYo90bQ=;
	b=VcFq6s9GdagObMRd7AlfZnKHFo10XVGLBbsORpZuheqF7GXmIY7OsuLxRScR0c6kQTIUm73j5Q/7K8FqLzee+nIruvMVQCUhKpeMxHTUeBxIAE31E0yAf9ZovN1H4YbONX1qgXFfvjAxdjWpv0W7mPUp5yP+i5pk5VAAfK1886c=
Received: from 30.246.161.79(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WWdgnQn_1744596100 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Apr 2025 10:01:41 +0800
Message-ID: <f384a766-d91a-4db5-9ed6-c1ed6079da1d@linux.alibaba.com>
Date: Mon, 14 Apr 2025 10:01:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/11] arm64: idle: export arch_cpu_idle()
To: Ankur Arora <ankur.a.arora@oracle.com>, harisokn@amazon.com
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <87h62u76xg.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_190147_668793_20BA8167 
X-CRM114-Status: GOOD (  11.16  )
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



在 2025/4/12 04:57, Ankur Arora 写道:
> 
> Shuai Xue <xueshuai@linux.alibaba.com> writes:
> 
>> 在 2025/2/19 05:33, Ankur Arora 写道:
>>> Needed for cpuidle-haltpoll.
>>> Acked-by: Will Deacon <will@kernel.org>
>>> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>>> ---
>>>    arch/arm64/kernel/idle.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
>>> index 05cfb347ec26..b85ba0df9b02 100644
>>> --- a/arch/arm64/kernel/idle.c
>>> +++ b/arch/arm64/kernel/idle.c
>>> @@ -43,3 +43,4 @@ void __cpuidle arch_cpu_idle(void)
>>>    	 */
>>>    	cpu_do_idle();
>>
>> Hi, Ankur,
>>
>> With haltpoll_driver registered, arch_cpu_idle() on x86 can select
>> mwait_idle() in idle threads.
>>
>> It use MONITOR sets up an effective address range that is monitored
>> for write-to-memory activities; MWAIT places the processor in
>> an optimized state (this may vary between different implementations)
>> until a write to the monitored address range occurs.
> 
> MWAIT is more capable than WFE -- it allows selection of deeper idle
> state. IIRC C2/C3.
> 
>> Should arch_cpu_idle() on arm64 also use the LDXR/WFE
>> to avoid wakeup IPI like x86 monitor/mwait?
> 
> Avoiding the wakeup IPI needs TIF_NR_POLLING and polling in idle support
> that this series adds.
> 
> As Haris notes, the negative with only using WFE is that it only allows
> a single idle state, one that is fairly shallow because the event-stream
> causes a wakeup every 100us.
> 
> --
> ankur

Hi, Ankur and Haris

Got it, thanks for explaination :)

Comparing sched-pipe performance on Rund with Yitian 710, *IPC improved 35%*:

w/o haltpoll
Performance counter stats for 'CPU(s) 0,1' (5 runs):

     32521.53 msec task-clock                #    2.000 CPUs utilized            ( +-  1.16% )
  38081402726      cycles                    #    1.171 GHz                      ( +-  1.70% )
  27324614561      instructions              #    0.72  insn per cycle           ( +-  0.12% )
          181      sched:sched_wake_idle_without_ipi #    0.006 K/sec

w/ haltpoll
Performance counter stats for 'CPU(s) 0,1' (5 runs):

      9477.15 msec task-clock                #    2.000 CPUs utilized            ( +-  0.89% )
  21486828269      cycles                    #    2.267 GHz                      ( +-  0.35% )
  23867109747      instructions              #    1.11  insn per cycle           ( +-  0.11% )
      1925207      sched:sched_wake_idle_without_ipi #    0.203 M/sec

Comparing sched-pipe performance on QEMU with Kunpeng 920, *IPC improved 10%*:

w/o haltpoll
Performance counter stats for 'CPU(s) 0,1' (5 runs):

          34,007.89 msec task-clock                       #    2.000 CPUs utilized               ( +-  8.86% )
      4,407,859,620      cycles                           #    0.130 GHz                         ( +- 84.92% )
      2,482,046,461      instructions                     #    0.56  insn per cycle              ( +- 88.27% )
                 16      sched:sched_wake_idle_without_ipi #    0.470 /sec                        ( +- 98.77% )

              17.00 +- 1.51 seconds time elapsed  ( +-  8.86% )

w/ haltpoll
Performance counter stats for 'CPU(s) 0,1' (5 runs):

          16,894.37 msec task-clock                       #    2.000 CPUs utilized               ( +-  3.80% )
      8,703,158,826      cycles                           #    0.515 GHz                         ( +- 31.31% )
      5,379,257,839      instructions                     #    0.62  insn per cycle              ( +- 30.03% )
            549,434      sched:sched_wake_idle_without_ipi #   32.522 K/sec                       ( +- 30.05% )

              8.447 +- 0.321 seconds time elapsed  ( +-  3.80% )

Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

