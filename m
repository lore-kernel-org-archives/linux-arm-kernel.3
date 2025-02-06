Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E96C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YbCfEtYjJ8HgdzmC6edBJv5q8C9brW4RxPoXoV16zfg=; b=XPpjKGlZaPdnG/
	S1hZMKyBHaP/lqft0GSJVQiVbhdhxYos3d4MFsoy3aQxK5kubYl+DdyjPGdAlopYMlFljnZzMzdnz
	mFGVFXs3+uPWBZRYo9o4OClIbjd7Yu7Hpj3dI9JzRL6ctWhCq3Aisbdpdd6FQ0JQjpG3scGOS+gbm
	g/l8MdiRd2AFBmNUAuVtHp+NCoIkdPWkuqRcdwepqSroqpmPrLhmw7qq6LODFHEVeeNNre6ZG06Lb
	XoAO7yfZWbgcvYLuYXeEKQknpKbgpc82YYNSuQ8qHYIXOPwnjpI8TLLYJcnHQGDpAfJPiC7DvGUq9
	htyefClAgnJ8GWyz5dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7ru-00000007PLC-0dkF;
	Thu, 06 Feb 2025 19:48:58 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7ov-00000007Oax-2kSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:45:55 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-845dee0425cso98144239f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 11:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738871152; x=1739475952; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YbCfEtYjJ8HgdzmC6edBJv5q8C9brW4RxPoXoV16zfg=;
        b=VU9y8lfgg9HeyzsTmsPkS3HStnnslD81wSQTkqG0puOeAu+4l2h8bhj6b3UHIqQQoK
         i2K6MvGjGTWxaH+Izn0xDdi5pQtVLxSopAQAPC1StEqHmMztzpmtAhr4EwVrA0JRDsX8
         AXfCHD+xy7sjupZNUr0J4GRPQeSm0ZUiz8BehjgYrRYqX0X7A880Jwa+XhfJfogZW5i4
         NitOZgltgDDlkLK0yxqz4JANC4GigDjC1wS3jbet+OQW302QwGOArFzYE/QGR2N5sEQa
         r+nyI9tKSiq6c5MKf/oiVgJZMiCu5EYkONGeD82pP5PMuxwHoPz1YLDGeqDbPopYr1V7
         tjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871152; x=1739475952;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbCfEtYjJ8HgdzmC6edBJv5q8C9brW4RxPoXoV16zfg=;
        b=G2zIu8B8y6X2Obk5H352kHWuNP6zyECRVqniMXFNlJsavG4YkJwUVQcKHdbIAUVTM3
         x/5ORGwnMrDL93yQSQyL1lLnjWjrB5ODAtp0hB+Beo8jQ8E92wriNJCgwcHufgXXKH/p
         Tov0rU4saEQZG8H6p5gGONSPy0Y33vE/34TOmZx3IE39LdmuNbHcf9kH7OlPaJo6zisY
         zlgU7r7wkyGY173LFPYuEg2HhXto2p1GYVrMvhK6uDaR6n1ye39iHTCAstn6GCLFt1Cx
         klLIyCE/MPsshVTtLVmK+85bRY+b4HJ70paOE2WMoXIuHhgXSKL0Z9v4CnQC0lACP+5l
         5TkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8OFa/j1kgDP2Oe+16cFjPj747VzkAU5kmwxlj10Ynp9vrQcVt33m09gHC0f3CiVNuNaQVDAa289L0xan4qB5A@lists.infradead.org
X-Gm-Message-State: AOJu0Yy60k6Q7VerBnmL/yzQlQvVizTu/xDwqhxtMjuTPHASFFOYKSbX
	vzPxrEnz7IVQUNJhS94g/44UxJR7bdrZG1Vo8VVdmbJL5eTht3Y9PPuRb3NlWx7F67dvnxVsVvx
	0k7q7um/WQk0+/U48+aICaQ==
X-Google-Smtp-Source: AGHT+IFNNmO9kDGnCQ3Tcv/rO4jc58g75MwHio/abi5ncLytMBu/Tab1kPhA/Bby7F9V3R2isfkFKifDgylapF+8eQ==
X-Received: from ilmy18.prod.google.com ([2002:a92:d812:0:b0:3d0:ebcd:cf64])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c0e:b0:3d0:4e57:bbd3 with SMTP id e9e14a558f8ab-3d13dfa2297mr2468995ab.22.1738871151883;
 Thu, 06 Feb 2025 11:45:51 -0800 (PST)
Date: Thu, 06 Feb 2025 19:45:51 +0000
In-Reply-To: <87frkrtr4z.wl-maz@kernel.org> (message from Marc Zyngier on Thu,
 06 Feb 2025 08:27:08 +0000)
Mime-Version: 1.0
Message-ID: <gsntmsey26xc.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2] KVM: arm64: Remove cyclical dependency in arm_pmuv3.h
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_114553_720436_428DCA7F 
X-CRM114-Status: GOOD (  39.14  )
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

Hey Marc, thanks for the review. I thought of a different solution at
the very bottom. Please let me know if that is preferable.

Marc Zyngier <maz@kernel.org> writes:

> Colton,

> On Thu, 06 Feb 2025 00:17:44 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
>> which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
>> causes confusing compilation problems why trying to use anything
>> defined in any of the headers in any other headers. Header guards is
>> the only reason this cycle didn't create tons of redefinition
>> warnings.

>> The motivating example was figuring out it was impossible to use the
>> hypercall macros kvm_call_hyp* from kvm_host.h in arm_pmuv3.h. The
>> compiler will insist they aren't defined even though kvm_host.h is
>> included. Many other examples are lurking which could confuse
>> developers in the future.

> Well, that's because contrary to what you have asserted in v1, not all
> include files are legitimate to use willy-nilly. You have no business
> directly using asm/kvm_host.h, and linux/kvm_host.h is what you need.

That's what I'm trying to fix. I'm trying to *remove* asm/kvm_host.h
from being included in asm/arm_pmu.h.

I agree with you that it *should not be included there* but it currently
is. And I can't drop-in replace the include with linux/kvm_host.h
because the that just adds another link in the cyclical dependency.


>> Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
>> because asm/kvm_host.h is huge and we only need a few functions from
>> it. Move the required declarations to a new header asm/kvm_pmu.h.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---

>> Possibly spinning more definitions out of asm/kvm_host.h would be a
>> good idea, but I'm not interested in getting bogged down in which
>> functions ideally belong where. This is sufficient to break the

> Tough luck. I'm not interested in half baked solutions, and "what
> belongs where" *is* the problem that needs solving.

Fair point, but a small solution is not half-baked if it is better than
what we have.

>> cyclical dependency and get rid of the compilation issues. Though I
>> mention the one example I found, many other similar problems could
>> confuse developers in the future.

>> v2:
>> * Make a new header instead of moving kvm functions into the
>>    dedicated pmuv3 header

>> v1:
>> https://lore.kernel.org/kvm/20250204195708.1703531-1-coltonlewis@google.com/

>>   arch/arm64/include/asm/arm_pmuv3.h |  3 +--
>>   arch/arm64/include/asm/kvm_host.h  | 14 --------------
>>   arch/arm64/include/asm/kvm_pmu.h   | 26 ++++++++++++++++++++++++++
>>   include/kvm/arm_pmu.h              |  1 -
>>   4 files changed, 27 insertions(+), 17 deletions(-)
>>   create mode 100644 arch/arm64/include/asm/kvm_pmu.h

>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index 8a777dec8d88..54dd27a7a19f 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -6,9 +6,8 @@
>>   #ifndef __ASM_PMUV3_H
>>   #define __ASM_PMUV3_H

>> -#include <asm/kvm_host.h>
>> -
>>   #include <asm/cpufeature.h>
>> +#include <asm/kvm_pmu.h>
>>   #include <asm/sysreg.h>

>>   #define RETURN_READ_PMEVCNTRN(n) \
>> diff --git a/arch/arm64/include/asm/kvm_host.h  
>> b/arch/arm64/include/asm/kvm_host.h
>> index 7cfa024de4e3..6d4a2e7ab310 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -1385,25 +1385,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu  
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
>> new file mode 100644
>> index 000000000000..3a8f737504d2
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/kvm_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __KVM_PMU_H
>> +#define __KVM_PMU_H
>> +
>> +void kvm_vcpu_pmu_resync_el0(void);
>> +
>> +#ifdef CONFIG_KVM
>> +void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
>> +void kvm_clr_pmu_events(u64 clr);
>> +bool kvm_set_pmuserenr(u64 val);
>> +#else
>> +static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr  
>> *attr) {}
>> +static inline void kvm_clr_pmu_events(u64 clr) {}
>> +static inline bool kvm_set_pmuserenr(u64 val)
>> +{
>> +	return false;
>> +}
>> +#endif
>> +
>> +static inline bool kvm_pmu_counter_deferred(struct perf_event_attr  
>> *attr)
>> +{
>> +	return (!has_vhe() && attr->exclude_host);
>> +}
>> +
>> +#endif

> How does this solve your problem of using the HYP-calling macros?

This code does not directly solve that problem. It makes a solution to
that problem possible because it breaks up the cyclical dependency by
getting asm/kvm_host.h out of asm/arm_pmuv3.h while still providing the
declarations to arm_pmuv3.c

With a cyclical dependency the compiler gets confused if you try to use
anything from asm/kvm_host.h inside asm/arm_pmuv3.h (like HYP-calling
macros defined there for example). Again, I believe that inclusion
should not be there in the first place which is the motivation for this
patch.

But since it is included, here's what happens if you try:

When asm/kvm_host.h is included somewhere, it indirectly includes
asm/arm_pmuv3.h via the chain described in my commit message.
asm/arm_pmuv3.h is then effectively pasted into asm/kvm_host.h and due
to include guards is passed over this time, but this means that many
things in asm/kvm_host.h aren't defined yet so any symbols from
asm/kvm_host.h defined after the include of asm/arm_pmuv3.h are used
before their definition: boom, confusing compiler errors

You might argue: just don't do that, but I think it's a terrible
developer experience when you can't use definitions from a file that is
currently included. I spent hours puzzling over errors before realizing
a cyclical dependency was the root cause and want to save other devs
from the same fate.

>> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
>> index 147bd3ee4f7b..2c78b1b1a9bb 100644
>> --- a/include/kvm/arm_pmu.h
>> +++ b/include/kvm/arm_pmu.h
>> @@ -74,7 +74,6 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
>>   struct kvm_pmu_events *kvm_get_pmu_events(void);
>>   void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
>>   void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
>> -void kvm_vcpu_pmu_resync_el0(void);

>>   #define kvm_vcpu_has_pmu(vcpu)					\
>>   	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))

>> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b

> I'm absolutely not keen on *two* PMU-related include files. They both
> describe internal APIs, and don't see a good reasoning for this
> arbitrary split other than "it works better for me and I don't want to
> do more than strictly necessary".

I understand the point which is why v1 tried not to introduce a new
header file and I was advised to make a new header file.

> For example, include/kvm was only introduced to be able to share files
> between architectures, and with 32bit KVM/arm being long dead, this
> serves no purpose anymore. Moving these things out of the way would be
> a good start and would provide a better base for further change.

Good to know. I avoided doing that because it would be a lot of change
noise and I wasn't sure such changes would be welcome.

> So please present a rationale on what needs to go where and why based
> on their usage pattern rather than personal convenience, and then
> we'll look at a possible patch. But not the other way around.

My rationale is fixing a cyclical dependency due to an inclusion of
asm/kvm_host.h where we both seem to agree it shouldn't be. Cyclical
dependencies are really bad and cause nasty surprises when something
that seems like it should obviously work doesn't. Fixing things like
this makes programming here more conveneint for everyone, not just
me. So I thought it was worth a separate patch.

Another possible solution that avoids moving anything around is to take
asm/kvm_host.h out of asm/arm_pmuv3.h and do

#ifdef CONFIG_ARM64
#include <linux/kvm_host.h>
#endif

directly in arm_pmuv3.c which breaks the cycle while still providing the
correct declarations for arm_pmuv3.c (and admittedly many more than
necessary).

I find this conditional inclusion ugly and possibly you will have an
objection to it, but let me know.

