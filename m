Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD3BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=K3fDXmd8Za9nT5CKATz2Yu/CxtGDvmK7u4P2JzL5Q1M=; b=ub0oB17SszLBvF
	S0prukem0MVSLjtpUKsI95CjVQmSlm4qfUrecIhmgolzu5ZtwFk8BWwmV3Zl/HPcYBwRsSq8k+6DW
	ge3Lin5svsHngUJ5RzMiG4s+89RViMug/vGJwJnFYmUKPYksK77ZZiKeNTxOFYXZyS6Vlodk4bNrh
	HJ8rzkituQsotytUEKlNOUO2FEFBGFPNeqS++bKVFzfNMxVQWz/QsvuQgl4dsxiYGejrHn2lIorXV
	uzefA1Z1T1bPNTMTgwJj8wKQ2iIZgsCnZU2Oyt0GesWBNiWxuv4w3qfMdn/aTM/tHVLoJlzzXbbkh
	aJlTXd5HA3oCJJ24jIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGzE-00000006orY-1xN8;
	Tue, 08 Jul 2025 22:40:28 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGwr-00000006oSw-1v4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:38:02 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3e0574d6a99so55004435ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752014280; x=1752619080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3fDXmd8Za9nT5CKATz2Yu/CxtGDvmK7u4P2JzL5Q1M=;
        b=sJY4LmpmdRPq+MNkqdQ5BOkY1AXETNZWahfNmyDKzUVh2M9iNVfy9JANwoPwBMyt+Y
         M8r8uMwyOkVqna1g8Fs/W4j97RfLsUi5J0QYGz6ZMqEO1csQeRFZLJj4qtKy0d6swZ5f
         L/BSBQj0J2puUpoX+vuAFk80Z9RqWeMlmlCgYpDYnli5e0wDcuvOymeeh1Gq7kUYp98w
         ubEFI9c2QbEI1knoAKcsc8EiNdbng+0twzz4cfAGXmVl95w6NkbeFGFgJdYYX3Y6LkVB
         qaXCB+r/7I8W2fx6mxos4dcTq9aC6H5pyJTSlhgiolJ0mNFIIq6gzAw5vYyjuV3sHkcd
         33fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752014280; x=1752619080;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3fDXmd8Za9nT5CKATz2Yu/CxtGDvmK7u4P2JzL5Q1M=;
        b=OxL7ENM6+5ZF1G4m9U2KoyUm5EGVa4Lc2JfBjueb6gLaq8G6orPgT0/+XTQkYipEVZ
         mDdKU7MCPVI7wS4ooTncd37VFDAlUba7rAonpy40GUkzbHEyypuR904KLDkJGu6muXV6
         AnTbyO8G8lG5QR2t40lptPPPZDNQ9UYan7Zm00V58h9Y0X5/FUzTcZHidLllVFYean7o
         HH08QoE7qz8dzu0gRgqwbOElvg+mmOa4f3DuNWP99RE9A9rnt7OF1si0QCW9m3Cz3CcX
         FwTMD1/74BkkL+5JEVrsmSjayzprDYm7oPxJbFy1cwP/lJRHCr6RENdLqOAJewyNfe5O
         LK8A==
X-Forwarded-Encrypted: i=1; AJvYcCWcD0vMP5Km/gbEoyaTOSeDjuQ+Go92d2VURuSwWNzgGDpb/GkQ4r5B43+pUrWjxYNTHXiYkK9QtXMCX/LjPvLW@lists.infradead.org
X-Gm-Message-State: AOJu0YxKuizlohKvfODHOISAT9zncTqmsA6evL1AztgqJZ1fTisocLQQ
	ZfZQuXJ80IdBonRagXp6k0WyvEjXRFlAlA/HnjFLe9r4Uu9rxAfmnNqdNGst9DNZlTymOWoVKCT
	M08sE0Ll1nOeM31eckr6gJBQD/g==
X-Google-Smtp-Source: AGHT+IGn06nCm9CZ+nzlG32HvMMbBVuhGSihb8VF+3WUu807Tfp1nhfGPv/rtrugveMa2wQtbIoPODa59ewzY1piAQ==
X-Received: from ilkk6.prod.google.com ([2002:a05:6e02:5e86:b0:3df:42dd:4aa6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:380f:b0:3df:154d:aa5b with SMTP id e9e14a558f8ab-3e166ff0481mr5601765ab.5.1752014279704;
 Tue, 08 Jul 2025 15:37:59 -0700 (PDT)
Date: Tue, 08 Jul 2025 22:37:58 +0000
In-Reply-To: <aGvyFiyEEsMrhN0i@J2N7QTR9R3> (message from Mark Rutland on Mon,
 7 Jul 2025 17:13:10 +0100)
Mime-Version: 1.0
Message-ID: <gsnt1pqq1f7d.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 04/22] KVM: arm64: Cleanup PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_153801_503268_8D748063 
X-CRM114-Status: GOOD (  28.77  )
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

Mark Rutland <mark.rutland@arm.com> writes:

> On Thu, Jun 26, 2025 at 08:04:40PM +0000, Colton Lewis wrote:
>> From: Marc Zyngier <maz@kernel.org>

>> Reorganize these tangled headers.

> In prior versions of this series, there was some earlier text explaining  
> that
> there was a circular header dependency. In v2:

>     
> https://lore.kernel.org/linux-arm-kernel/20250620221326.1261128-6-coltonlewis@google.com/

> ... it said:

> | asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
> | which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
> | causes compilation problems why trying to use anything defined in any
> | of the headers in any other headers.

> Was there some reason for dropping that? It's a bit odd to start without a
> problem statement.

When I rebased on top of kvm/queue, that included a patch from Sean that
changed the the problem. I thought I wrote a new description but I guess
not. I'll include in my next reroll.

The core issue is still that including *all* of kvm_host.h in
arm_pmuv3.h is a circular dependency.

asm/kvm_host.h includes asm/kvm_pmu.h includes perf/arm_pmuv3.h includes
asm/arm_pmuv3.h includes asm/kvm_host.h

Some other things in this patch are vestigial or needed later, so I
should put them in the patches where they are used.


>> * Respect the move defining the interface between KVM and PMU in its
>>    own header asm/kvm_pmu.h

>> * Define an empty struct arm_pmu so it is defined for those interface
>>    functions when compiling with CONFIG_KVM but not CONFIG_ARM_PMU

> Which functions in particular are those? What prevents them from  
> depending on
> CONFIG_ARM_PMU?

> Mark.

Functions I introduce later. So this hunk should be in a later patch if
I need to keep it.

bool kvm_pmu_is_partitioned(struct arm_pmu *pmu);
u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);

The first, at least, has to be called in non-PMU KVM code to check if we
can use my ioctl later.

I suppose in that case it's only calling a dummy definition that returns
false, so I don't need struct arm_pmu * in the argument and can just use
void *

>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/include/asm/arm_pmuv3.h      |  2 +-
>>   arch/arm64/include/asm/kvm_host.h       | 15 +--------------
>>   arch/arm64/include/asm/kvm_pmu.h        | 15 +++++++++++++++
>>   arch/arm64/kvm/debug.c                  |  1 +
>>   arch/arm64/kvm/hyp/include/hyp/switch.h |  1 +
>>   arch/arm64/kvm/pmu.c                    |  2 ++
>>   arch/arm64/kvm/sys_regs.c               |  1 +
>>   include/linux/perf/arm_pmu.h            |  5 +++++
>>   virt/kvm/kvm_main.c                     |  1 +
>>   9 files changed, 28 insertions(+), 15 deletions(-)

>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index 8a777dec8d88..32c003a7b810 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -6,7 +6,7 @@
>>   #ifndef __ASM_PMUV3_H
>>   #define __ASM_PMUV3_H

>> -#include <asm/kvm_host.h>
>> +#include <asm/kvm_pmu.h>

>>   #include <asm/cpufeature.h>
>>   #include <asm/sysreg.h>
>> diff --git a/arch/arm64/include/asm/kvm_host.h  
>> b/arch/arm64/include/asm/kvm_host.h
>> index 27ed26bd4381..2df76689381a 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/bitmap.h>
>>   #include <linux/types.h>
>> +#include <linux/irq_work.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/kvm_types.h>
>>   #include <linux/maple_tree.h>
>> @@ -1487,25 +1488,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu  
>> *vcpu);
>>   void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
>>   void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);

>> -static inline bool kvm_pmu_counter_deferred(struct perf_event_attr  
>> *attr)
>> -{
>> -	return (!has_vhe() && attr->exclude_host);
>> -}
>> -
>>   #ifdef CONFIG_KVM
>> -void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
>> -void kvm_clr_pmu_events(u64 clr);
>> -bool kvm_set_pmuserenr(u64 val);
>>   void kvm_enable_trbe(void);
>>   void kvm_disable_trbe(void);
>>   void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
>>   #else
>> -static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr  
>> *attr) {}
>> -static inline void kvm_clr_pmu_events(u64 clr) {}
>> -static inline bool kvm_set_pmuserenr(u64 val)
>> -{
>> -	return false;
>> -}
>>   static inline void kvm_enable_trbe(void) {}
>>   static inline void kvm_disable_trbe(void) {}
>>   static inline void kvm_tracing_set_el1_configuration(u64  
>> trfcr_while_in_guest) {}
>> diff --git a/arch/arm64/include/asm/kvm_pmu.h  
>> b/arch/arm64/include/asm/kvm_pmu.h
>> index baf028d19dfc..ad3247b46838 100644
>> --- a/arch/arm64/include/asm/kvm_pmu.h
>> +++ b/arch/arm64/include/asm/kvm_pmu.h
>> @@ -11,9 +11,15 @@
>>   #include <linux/kvm_types.h>
>>   #include <linux/perf_event.h>
>>   #include <linux/perf/arm_pmuv3.h>
>> +#include <linux/perf/arm_pmu.h>

>>   #define KVM_ARMV8_PMU_MAX_COUNTERS	32

>> +#define kvm_pmu_counter_deferred(attr)			\
>> +	({						\
>> +		!has_vhe() && (attr)->exclude_host;	\
>> +	})
>> +
>>   #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
>>   struct kvm_pmc {
>>   	u8 idx;	/* index into the pmu->pmc array */
>> @@ -68,6 +74,9 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
>>   int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);

>>   struct kvm_pmu_events *kvm_get_pmu_events(void);
>> +void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
>> +void kvm_clr_pmu_events(u64 clr);
>> +bool kvm_set_pmuserenr(u64 val);
>>   void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
>>   void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
>>   void kvm_vcpu_pmu_resync_el0(void);
>> @@ -161,6 +170,12 @@ static inline u64 kvm_pmu_get_pmceid(struct  
>> kvm_vcpu *vcpu, bool pmceid1)

>>   #define kvm_vcpu_has_pmu(vcpu)		({ false; })
>>   static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
>> +static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr  
>> *attr) {}
>> +static inline void kvm_clr_pmu_events(u64 clr) {}
>> +static inline bool kvm_set_pmuserenr(u64 val)
>> +{
>> +	return false;
>> +}
>>   static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
>>   static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
>>   static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 1a7dab333f55..a554c3e368dc 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -9,6 +9,7 @@

>>   #include <linux/kvm_host.h>
>>   #include <linux/hw_breakpoint.h>
>> +#include <linux/perf/arm_pmuv3.h>

>>   #include <asm/debug-monitors.h>
>>   #include <asm/kvm_asm.h>
>> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h  
>> b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> index 7599844908c0..825b81749972 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/kvm_host.h>
>>   #include <linux/types.h>
>>   #include <linux/jump_label.h>
>> +#include <linux/perf/arm_pmuv3.h>
>>   #include <uapi/linux/psci.h>

>>   #include <asm/barrier.h>
>> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
>> index 6b48a3d16d0d..8bfc6b0a85f6 100644
>> --- a/arch/arm64/kvm/pmu.c
>> +++ b/arch/arm64/kvm/pmu.c
>> @@ -8,6 +8,8 @@
>>   #include <linux/perf/arm_pmu.h>
>>   #include <linux/perf/arm_pmuv3.h>

>> +#include <asm/kvm_pmu.h>
>> +
>>   static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);

>>   /*
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 99fdbe174202..eaff6d63ef77 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/printk.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/irqchip/arm-gic-v3.h>
>> +#include <linux/perf/arm_pmuv3.h>

>>   #include <asm/arm_pmuv3.h>
>>   #include <asm/cacheflush.h>
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index 6dc5e0cd76ca..fb382bcd4f4b 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -187,6 +187,11 @@ void armpmu_free_irq(int irq, int cpu);

>>   #define ARMV8_PMU_PDEV_NAME "armv8-pmu"

>> +#else
>> +
>> +struct arm_pmu {
>> +};
>> +
>>   #endif /* CONFIG_ARM_PMU */

>>   #define ARMV8_SPE_PDEV_NAME "arm,spe-v1"
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index e2f6344256ce..25259fcf3115 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -48,6 +48,7 @@
>>   #include <linux/lockdep.h>
>>   #include <linux/kthread.h>
>>   #include <linux/suspend.h>
>> +#include <linux/perf_event.h>

>>   #include <asm/processor.h>
>>   #include <asm/ioctl.h>
>> --
>> 2.50.0.727.gbf7dc18ff4-goog


