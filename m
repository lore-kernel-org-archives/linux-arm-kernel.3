Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A60D59D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NzWUthEm6qM67H7+l7VSfoh+naGIv34T+Myn0YzgNIE=; b=Jg59z3/lO21F7d
	5Lmik9iQ1nhbuHUgMZLw5RK119c43Q+Hw5n+tOjn7gjW5Vn2F/XFl3Eh1/Fj34/4SYPeYI/7mezpM
	8asPexLcIHYRnbxOiYmxURJ1NwuEbE1UTgpUohokacSQ0Fc5zDXDd/qr6cQx4XJO5bqjcJ0FcnlPV
	OdUdcJ/sVcCxy+IfkA7k9oU+oRI9jR+Aqzqqvrz8XI1fdZ9amduVPbOxhozIMEfZ1YVBDfjbKqtmB
	uqR5WoaMMjI3VukPv/bp75o4oS7nZ5U3Gdceko30X5WV+nImAgOG6ZkNKKhvv9dew8daiXWWIgL25
	sFUQDI3UQKetUbJMjEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA72-0000000157f-1Y7d;
	Fri, 12 Dec 2025 20:51:42 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUA6z-0000000156n-2NGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:51:38 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-656b3efc41aso1948369eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 12:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765572696; x=1766177496; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NzWUthEm6qM67H7+l7VSfoh+naGIv34T+Myn0YzgNIE=;
        b=cdJJ5KAClRzCrSzJ2NhLhXjAQnLWBMZLXNFqWjIhfBLdM7mRTlBj9pZOr5+LNlhyQ4
         TSXJS8/oeEgaOFo0Wpx6deMniGnV01gIUb12qmnF6l73KgCtlcbn1NR+UtLjZCgMgHW3
         w3TgRsvcyMz3pnCJvErV0UGNIXJMoKugjunO6LBExTLopj43hsRnKCj66+BpgLY2a36C
         i8UAGPBOAlY8Xx0/qrHwW0Ypbd3rYOj6Z2DOoEiyWalspsHkmmstlDNaHt4pyqHaXkt3
         Y6Y6hNlLvsm0a/Zpxw91uNjHPtLMYdzxEHNscEK6GqqB/OegMN+Mfftxoa0dDxJlh6eX
         01AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765572696; x=1766177496;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzWUthEm6qM67H7+l7VSfoh+naGIv34T+Myn0YzgNIE=;
        b=C+oNxxoH++FYWvHoKaU59xawx48zzGI/l6iXsjoYcHaZINcuskbh63FBL0TStD2cVx
         p6lHja9IgPNKvqp4UB9Cq6+VP4KQNmY0f6WaiLGcLwwgfVoGeiw+mO8GX58QnxPEEmSR
         ZftLLjVjlws4iUVGCV6U9mPvrXuTlPjVxKFUd2RcKfx2G6UeeAn+ATARECZKHVszzF6M
         1qQCSlAu9ko+zU/eCn3MFvn0qB624cfjRwADIRDyVaMDulnpHdPXSl06BTeHkZZRghYU
         8nNfarCP04b+he+ATTQ3BBpU7OyOwKHTLaRKjPWzD5bnT5xEPUa0QRrO/I/eFuBhvLL6
         sh+g==
X-Forwarded-Encrypted: i=1; AJvYcCVBszFlCQhArytrprfWgFCn6Rd8iBxgVEwFUeuqMm5Y9brUPgADXCvqaQwcWr43iE6LJo8Uk6KBg/6IIvFUfPLE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcxx8pRf1gl/o5vCmTukwR5bZpTA5+q6uvBpSQVecUA5VBtVqc
	INRWYc4fctFmg5RcyzCkIwSLUlguYWcI9VQmgwiYzCOYObqTqkqeokP/rwLAtA776uBibM3ZeoC
	QMnSVhCWHbeRmsVeDQkZN5dkQfg==
X-Google-Smtp-Source: AGHT+IGQzDy6EDRUx9rtYBW2j0eF+TYsJjWcSkav988OtHvTbiJ4yAnbUpXjKLkLa46xMZa50qB/G0Iw4pQoa2klIQ==
X-Received: from ilbbs15.prod.google.com ([2002:a05:6e02:240f:b0:434:972f:bf91])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a4a:e90c:0:b0:659:9a49:8f5b with SMTP id 006d021491bc7-65b4560080dmr1608719eaf.32.1765572695916;
 Fri, 12 Dec 2025 12:51:35 -0800 (PST)
Date: Fri, 12 Dec 2025 20:51:34 +0000
In-Reply-To: <aTiPvS49uMOJEBrf@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 13:08:13 -0800)
Mime-Version: 1.0
Message-ID: <gsnty0n72zl5.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 10/24] KVM: arm64: Set up FGT for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_125137_617287_BB7AC0C7 
X-CRM114-Status: GOOD (  25.71  )
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


Hi Oliver. Thanks for the speedy review.

Oliver Upton <oupton@kernel.org> writes:

> Hi Colton,

> On Tue, Dec 09, 2025 at 08:51:07PM +0000, Colton Lewis wrote:
>> In order to gain the best performance benefit from partitioning the
>> PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
>> trapping common PMU register accesses by the guest to remove that
>> overhead.

>> Untrapped:
>> * PMCR_EL0
>> * PMUSERENR_EL0
>> * PMSELR_EL0
>> * PMCCNTR_EL0
>> * PMCNTEN_EL0
>> * PMINTEN_EL1
>> * PMEVCNTRn_EL0

>> These are safe to untrap because writing MDCR_EL2.HPMN as this series
>> will do limits the effect of writes to any of these registers to the
>> partition of counters 0..HPMN-1. Reads from these registers will not
>> leak information from between guests as all these registers are
>> context swapped by a later patch in this series. Reads from these
>> registers also do not leak any information about the host's hardware
>> beyond what is promised by PMUv3.

>> Trapped:
>> * PMOVS_EL0
>> * PMEVTYPERn_EL0
>> * PMCCFILTR_EL0
>> * PMICNTR_EL0
>> * PMICFILTR_EL0
>> * PMCEIDn_EL0
>> * PMMIR_EL1

>> PMOVS remains trapped so KVM can track overflow IRQs that will need to
>> be injected into the guest.

>> PMICNTR and PMIFILTR remain trapped because KVM is not handling them
>> yet.

>> PMEVTYPERn remains trapped so KVM can limit which events guests can
>> count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
>> are special cases of the same.

>> PMCEIDn and PMMIR remain trapped because they can leak information
>> specific to the host hardware implementation.

>> NOTE: This patch temporarily forces kvm_vcpu_pmu_is_partitioned() to
>> be false to prevent partial feature activation for easier debugging.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/include/asm/kvm_pmu.h | 33 ++++++++++++++++++++++
>>   arch/arm64/kvm/config.c          | 34 ++++++++++++++++++++--
>>   arch/arm64/kvm/pmu-direct.c      | 48 ++++++++++++++++++++++++++++++++
>>   3 files changed, 112 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/include/asm/kvm_pmu.h  
>> b/arch/arm64/include/asm/kvm_pmu.h
>> index 8887f39c25e60..7297a697a4a62 100644
>> --- a/arch/arm64/include/asm/kvm_pmu.h
>> +++ b/arch/arm64/include/asm/kvm_pmu.h
>> @@ -96,6 +96,23 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
>>   void kvm_pmu_host_counters_enable(void);
>>   void kvm_pmu_host_counters_disable(void);

>> +#if !defined(__KVM_NVHE_HYPERVISOR__)
>> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
>> +bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
>> +#else
>> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +#endif
>> +u64 kvm_pmu_fgt_bits(void);
>> +u64 kvm_pmu_fgt2_bits(void);
>> +
>>   /*
>>    * Updates the vcpu's view of the pmu events for this cpu.
>>    * Must be called before every vcpu run after disabling interrupts, to  
>> ensure
>> @@ -135,6 +152,22 @@ static inline u64 kvm_pmu_get_counter_value(struct  
>> kvm_vcpu *vcpu,
>>   {
>>   	return 0;
>>   }
>> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>> +{
>> +	return false;
>> +}
>> +static inline u64 kvm_pmu_fgt_bits(void)
>> +{
>> +	return 0;
>> +}
>> +static inline u64 kvm_pmu_fgt2_bits(void)
>> +{
>> +	return 0;
>> +}
>>   static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
>>   					     u64 select_idx, u64 val) {}
>>   static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
>> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
>> index 24bb3f36e9d59..064dc6aa06f76 100644
>> --- a/arch/arm64/kvm/config.c
>> +++ b/arch/arm64/kvm/config.c
>> @@ -6,6 +6,7 @@

>>   #include <linux/kvm_host.h>
>>   #include <asm/kvm_emulate.h>
>> +#include <asm/kvm_pmu.h>
>>   #include <asm/kvm_nested.h>
>>   #include <asm/sysreg.h>

>> @@ -1489,12 +1490,39 @@ static void __compute_hfgwtr(struct kvm_vcpu  
>> *vcpu)
>>   		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
>>   }

>> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
>> +{
>> +	__compute_fgt(vcpu, HDFGRTR_EL2);
>> +
>> +	if (kvm_vcpu_pmu_use_fgt(vcpu))
>> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= kvm_pmu_fgt_bits();

> Couple of suggestions. I'd rather see this conditioned on
> kvm_vcpu_pmu_is_partitioned() and get rid of the FGT predicate. After
> all, kvm_vcpu_load_fgt() already checks for the presence of FEAT_FGT
> first.

I can use that here. I'll still need the use_fgt predicate when
programming MDCR_EL2 so I'll introduce in the later patch.

> Additionally, I'd prefer that the trap configuration is inline instead
> of done in a helper in some other file. Centralizing the FGT
> configuration here was very much intentional.

Sure I can centralize it.

> The other reason for doing this is kvm_pmu_fgt_bits() assumes a
> 'positive' trap polarity, even though there are several cases where FGTs
> have a 'negative' priority (i.e. 0 => trap).

For the bits I was concerned with they all had positive polarity, except
for the dedicated instruction counter. (Side note: Why would ARM do
this?)

IIRC the FGT setup I plugged into in previous versions of the patch had
some icky macros that accounted for polarity. They were confusing and I
didn't like the effort to understand them.

Is there a good reason not to adopt a convetion that 1 => trap for
kernel code? Reversing the negative polarities immediately before write
could be easy: Have a bitmap of the negative polarity bits to xor with
the traps we actually want.

A^0 = A (positive polarity bits)
A^1 = ~A (negative polarity bits)

> Thanks,
> Oliver

