Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955B4C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=e/kzWc0kpD6KViH3+1QPaMZ6x27hYFTDLDJNvBdlpRQ=; b=mfPHSCRhXpC4Vp
	Xtbp3qzwvPN786A+a4fk7exe6AGVOu1SeYRakJJSo7mwe8DILuqUocKQvyr6WYiIti6DiU8cR1Kw6
	5Sp4Fs8YCvyB/zDg+nVgVlDyjNJQcHN0oXDCnRUlz214DLLR6neK2Tn0vUbfnv7lvP9br3xkZSdEa
	UijHKzp3RkK4/0om0HZQyZaGuP/3MaLLCl++6anHBebw+MYjtqY7uSR+aGHShPUMdPn5x2HHCBaPV
	2temZXiXTHFhXPSc2UchpHysL79kODcrkghS3XzH46GY+FKahNUwxBzQE6o281kp/lW9HzTYpmsfm
	kpR/3Rdm359lZOdF0iuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMula-0000000EBtc-1iG2;
	Wed, 04 Jun 2025 20:31:18 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuRS-0000000E9za-155P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:10:31 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddbec45b07so4482805ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067828; x=1749672628; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e/kzWc0kpD6KViH3+1QPaMZ6x27hYFTDLDJNvBdlpRQ=;
        b=gNCbkoahHv210ncnLb4YUX6Blp7o37uee3/dJjLHMZVLrT2k2Ya7MEP3cD9Du8WDDV
         xVr+057yKuQZFARCVweZfYDrJuANKrwk1JnNyZKH1wdfA+kqJsWer92JopV4SUhgHGch
         Uyeu2brcHFOojdNXiAgixgC5MlDzdUq5n9y1lG4+FZb8pT+DFV26q93aXe/BhadhhJ45
         rbBYm3/v6zuO3aEtsPeZwQOHsEsX24lXZkS8e4a4wSRObArKxghqIF4qYpHvHutRUgzT
         wccuYkqzbL4Zw5h/icn9vM4m/NGpF7LsIN6n7KOWDkMOOS4faostco4zma2DXEfBtvBn
         jjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067828; x=1749672628;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/kzWc0kpD6KViH3+1QPaMZ6x27hYFTDLDJNvBdlpRQ=;
        b=nIFUnEFSmidZeIOOKV4spTSS0a7nujhyITNg+4S+sXuEdY8yWppjxhXhEu12Nj0n9e
         eatpnzb51jOfT7DimY2wWG+UoFcM0jfWp59svNoM8kSN6sPjZ370K3qDkS/OZl1VKK8f
         4xTGA2iq/m8AN3cvwgz/h9NF9M5L5oOXY+i9AfZedQSskR1T4Q9Q5vjJMGNJCjrUcYfO
         v85+skAe+A5nrhmon6iYYPh7WGGspOCPWkOwz8Vk3aIBlV6PWn5nuHKYIUzxlxEP5OT+
         496fEGj9ABwHfYnD/FAcWPTiJcAdGxHkY1xAKKJIM0yPZhjkppM8XHKJUStnmGKcch3x
         LZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU56CZ+jQwqITf8UR5G3ISFa0zzrXOGvUi3LcEVpLd3ddwzHR4Vwn6vKES6orhU7+5Jb1nnG0x08VQ1hWW4xvc9@lists.infradead.org
X-Gm-Message-State: AOJu0YxoTWBuWq40xkmGZCrVjjdtGWB9tD44l8kTdXMQ7vRI35Uq0r8o
	AFLGxWjnO9+7+hsFpaDSQNPC9PzSB/OJWSBxF9N8qrbglMTwYPzeLZw5AlV9VCf1IFVpfVLx/2j
	8JwfB2Fbh5SJpYfv4cZx49TLHXg==
X-Google-Smtp-Source: AGHT+IFh/8mtqkpalqzk1KUKOx68qwJSaQ1z3VwlY5VIPWzy5mNTtLH8FEcMZxZh9pPP2vJyzvJ8dNTJRze1hcsbYw==
X-Received: from ilbbf2.prod.google.com ([2002:a05:6e02:3082:b0:3dd:a279:72c1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:250d:b0:3dc:79e5:e6b7 with SMTP id e9e14a558f8ab-3ddbedb49ccmr48769095ab.20.1749067828362;
 Wed, 04 Jun 2025 13:10:28 -0700 (PDT)
Date: Wed, 04 Jun 2025 20:10:27 +0000
In-Reply-To: <aD9w3Kj4-YoizKv5@linux.dev> (message from Oliver Upton on Tue, 3
 Jun 2025 15:02:04 -0700)
Mime-Version: 1.0
Message-ID: <gsntsekf1d58.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 06/17] KVM: arm64: Introduce method to partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_131030_296880_F162F2C4 
X-CRM114-Status: GOOD (  43.84  )
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

Thank you Oliver for the additional explanation.

Oliver Upton <oliver.upton@linux.dev> writes:

> On Tue, Jun 03, 2025 at 09:32:41PM +0000, Colton Lewis wrote:
>> Oliver Upton <oliver.upton@linux.dev> writes:

>> > On Mon, Jun 02, 2025 at 07:26:51PM +0000, Colton Lewis wrote:
>> > >   static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>> > >   {
>> > > +	u8 hpmn = vcpu->kvm->arch.arm_pmu->hpmn;
>> > > +
>> > >   	preempt_disable();

>> > >   	/*
>> > >   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>> > >   	 * to disable guest access to the profiling and trace buffers
>> > >   	 */
>> > > -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
>> > > -					 *host_data_ptr(nr_event_counters));
>> > > -	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>> > > +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
>> > > +	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
>> > > +				MDCR_EL2_TPM |

>> > This isn't safe, as there's no guarantee that kvm_arch::arm_pmu is
>> > pointing that the PMU for this CPU. KVM needs to derive HPMN from some
>> > per-CPU state, not anything tied to the VM/vCPU.

>> I'm confused. Isn't this function preparing to run the vCPU on this
>> CPU? Why would it be pointing at a different PMU?

> Because arm64 is a silly ecosystem and system designers can glue
> together heterogenous CPU implementations. The arm_pmu that KVM is
> pointing at might only match a subset of CPUs, but vCPUs migrate at the
> whim of the scheduler (and userspace).

That means the arm_pmu field might at any time point to data that
doesn't represent the current CPU. I'm surprised that's not swapped out
anywhere. Seems like it would be useful to have an arch struct be a
reliable source of information about the current arch.

>> And HPMN is something that we only want set when running a vCPU, so
>> there isn't any per-CPU state saying it should be anything but the
>> default value (number of counters) outside that context.

>> Unless you just mean I should check the number of counters again and
>> make sure HPMN is not an invalid value.

> As you've implemented it the host cannot schedule events in the guest
> range of counters regardless of context. You need to reconcile that
> global limit with the desires of the VMM on how many counters it wants
> presented to this particular guest.

It's true that's the current implementation. I was assuming the VMM
would control that with the new partition API. Given that partitioning
untraps access to counters, there is no other way besides HPMN to
control how many counters are exposed to the guest.

>> > > +/**
>> > > + * kvm_pmu_partition() - Partition the PMU
>> > > + * @pmu: Pointer to pmu being partitioned
>> > > + * @host_counters: Number of host counters to reserve
>> > > + *
>> > > + * Partition the given PMU by taking a number of host counters to
>> > > + * reserve and, if it is a valid reservation, recording the
>> > > + * corresponding HPMN value in the hpmn field of the PMU and  
>> clearing
>> > > + * the guest-reserved counters from the counter mask.
>> > > + *
>> > > + * Passing 0 for @host_counters has the effect of disabling
>> > > partitioning.
>> > > + *
>> > > + * Return: 0 on success, -ERROR otherwise
>> > > + */
>> > > +int kvm_pmu_partition(struct arm_pmu *pmu, u8 host_counters)
>> > > +{
>> > > +	u8 nr_counters;
>> > > +	u8 hpmn;
>> > > +
>> > > +	if (!kvm_pmu_reservation_is_valid(host_counters))
>> > > +		return -EINVAL;
>> > > +
>> > > +	nr_counters = *host_data_ptr(nr_event_counters);
>> > > +	hpmn = kvm_pmu_hpmn(host_counters);
>> > > +
>> > > +	if (hpmn < nr_counters) {
>> > > +		pmu->hpmn = hpmn;
>> > > +		/* Inform host driver of available counters */
>> > > +		bitmap_clear(pmu->cntr_mask, 0, hpmn);
>> > > +		bitmap_set(pmu->cntr_mask, hpmn, nr_counters);
>> > > +		clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
>> > > +		if (pmuv3_has_icntr())
>> > > +			clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
>> > > +
>> > > +		kvm_debug("Partitioned PMU with HPMN %u", hpmn);
>> > > +	} else {
>> > > +		pmu->hpmn = nr_counters;
>> > > +		bitmap_set(pmu->cntr_mask, 0, nr_counters);
>> > > +		set_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
>> > > +		if (pmuv3_has_icntr())
>> > > +			set_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
>> > > +
>> > > +		kvm_debug("Unpartitioned PMU");
>> > > +	}
>> > > +
>> > > +	return 0;
>> > > +}

>> > Hmm... Just in terms of code organization I'm not sure I like having  
>> KVM
>> > twiddling with *host* support for PMUv3. Feels like the ARM PMU driver
>> > should own partitioning and KVM just takes what it can get.

>> Okay. I can move the code.

>> > > @@ -239,6 +245,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>> > >   	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
>> > >   		return;

>> > > +	if (reserved_host_counters) {
>> > > +		if (kvm_pmu_partition_supported())
>> > > +			WARN_ON(kvm_pmu_partition(pmu, reserved_host_counters));
>> > > +		else
>> > > +			kvm_err("PMU Partition is not supported");
>> > > +	}
>> > > +

>> > Hasn't the ARM PMU been registered with perf at this point? Surely the
>> > driver wouldn't be very pleased with us ripping counters out from under
>> > its feet.

>> AFAICT nothing in perf registration cares about the number of counters
>> the PMU has. The PMUv3 driver tracks its own available counters through
>> cntr_mask and I modify that during partition.

>> Since this is still initialization of the PMU, I don't believe anything
>> has had a chance to use a counter yet that will be ripped away.

> Given that kvm_pmu_partition() is called from an ioctl, it is entirely
> possible that events have been scheduled prior to applying the
> partition.

That's true for the ioctl call. I was only saying it's not true here.

>> Aesthetically It makes since to change this if I move the partitioning
>> code to the PMUv3 driver, but I think it's inconsequential to the
>> function.

> There are two *very* distinct functions w.r.t. partitioning:

>   1) Partitioning of a particular arm_pmu that says how many counters the
>   host can use

>   2) VMM intentions to present a subset of the KVM-owned counter
>   partition to its guest

> #1 is modifying *global* state, we really can't mess with that in the
> context of a single VM...

I see the distinction more clearly now. Since KVM can only control the
number of counters presented to the guest through HPMN, why would the
VMM ever choose a subset? If the host PMU is globally partitioned to not
use anything in the guest range, presenting fewer counters to a guest is
just leaving some counters in the middle of the range unused.


> Thanks,
> Oliver

