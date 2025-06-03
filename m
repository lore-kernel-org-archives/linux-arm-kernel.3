Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834AFC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 22:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYBLN18ggSpU1/ZnBt64YliW65vABIyi5xIBnaUOp24=; b=yrgXDMQ9jT1NgqlgpjjqfT9Xxw
	iWMDrQgdV6mN4h6OXY6SoAd+ArAPEDD/8qUP30mcwpBp35UlnB3MxkGzTW2q4I0lwUKluDP67UZqp
	2lGzA1vvio96kd31X5d5SfTnRqvHes5nf8SuzGQWT0kXzwTy74fsna5eEF1WJsfKpzlnMk/EUJdLY
	nOIAd9NH0I84K5aQUgYiBtmkeT4FcDPh04ldLZDX6xXQ2rNsooNmlnlI4t65SdKGELzaRrdQ2Tb8m
	ibVYG6XFn7+5GM2tLaTACaLJAx2ys2OyO3dasRqCmiFvAAdpfOaRJVZsf+PYB4YB/2SpUHUOZ9trC
	sfWQbiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZkL-0000000Bvec-1EjC;
	Tue, 03 Jun 2025 22:04:37 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZiA-0000000BvRS-43O9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 22:02:24 +0000
Date: Tue, 3 Jun 2025 15:02:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748988138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MYBLN18ggSpU1/ZnBt64YliW65vABIyi5xIBnaUOp24=;
	b=dk4b4e0rO/wW9aCyG+NXQO6YRkCVUwQVLI4dYbglDpsOngGTqtDeLAsdEzAtU+ic9J/Mvb
	/2ypH0EAxpXsVG6x9gO1djeyijHbtjQcP+aDQutvZ22djAlBhSfTubZLHVBjvyEHNpOhKt
	lxfK2PTtvCJu2SG/k6dddNR+CoTrIfY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/17] KVM: arm64: Introduce method to partition the PMU
Message-ID: <aD9w3Kj4-YoizKv5@linux.dev>
References: <aD4llDZwb_sC_Ptj@linux.dev>
 <gsnt4iww3406.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsnt4iww3406.fsf@coltonlewis-kvm.c.googlers.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_150223_594390_FEA09F4F 
X-CRM114-Status: GOOD (  39.60  )
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

On Tue, Jun 03, 2025 at 09:32:41PM +0000, Colton Lewis wrote:
> Oliver Upton <oliver.upton@linux.dev> writes:
> 
> > On Mon, Jun 02, 2025 at 07:26:51PM +0000, Colton Lewis wrote:
> > >   static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
> > >   {
> > > +	u8 hpmn = vcpu->kvm->arch.arm_pmu->hpmn;
> > > +
> > >   	preempt_disable();
> 
> > >   	/*
> > >   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
> > >   	 * to disable guest access to the profiling and trace buffers
> > >   	 */
> > > -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> > > -					 *host_data_ptr(nr_event_counters));
> > > -	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
> > > +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
> > > +	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
> > > +				MDCR_EL2_TPM |
> 
> > This isn't safe, as there's no guarantee that kvm_arch::arm_pmu is
> > pointing that the PMU for this CPU. KVM needs to derive HPMN from some
> > per-CPU state, not anything tied to the VM/vCPU.
> 
> I'm confused. Isn't this function preparing to run the vCPU on this
> CPU? Why would it be pointing at a different PMU?

Because arm64 is a silly ecosystem and system designers can glue
together heterogenous CPU implementations. The arm_pmu that KVM is
pointing at might only match a subset of CPUs, but vCPUs migrate at the
whim of the scheduler (and userspace).

> And HPMN is something that we only want set when running a vCPU, so
> there isn't any per-CPU state saying it should be anything but the
> default value (number of counters) outside that context.
> 
> Unless you just mean I should check the number of counters again and
> make sure HPMN is not an invalid value.

As you've implemented it the host cannot schedule events in the guest
range of counters regardless of context. You need to reconcile that
global limit with the desires of the VMM on how many counters it wants
presented to this particular guest.

> > > +/**
> > > + * kvm_pmu_partition() - Partition the PMU
> > > + * @pmu: Pointer to pmu being partitioned
> > > + * @host_counters: Number of host counters to reserve
> > > + *
> > > + * Partition the given PMU by taking a number of host counters to
> > > + * reserve and, if it is a valid reservation, recording the
> > > + * corresponding HPMN value in the hpmn field of the PMU and clearing
> > > + * the guest-reserved counters from the counter mask.
> > > + *
> > > + * Passing 0 for @host_counters has the effect of disabling
> > > partitioning.
> > > + *
> > > + * Return: 0 on success, -ERROR otherwise
> > > + */
> > > +int kvm_pmu_partition(struct arm_pmu *pmu, u8 host_counters)
> > > +{
> > > +	u8 nr_counters;
> > > +	u8 hpmn;
> > > +
> > > +	if (!kvm_pmu_reservation_is_valid(host_counters))
> > > +		return -EINVAL;
> > > +
> > > +	nr_counters = *host_data_ptr(nr_event_counters);
> > > +	hpmn = kvm_pmu_hpmn(host_counters);
> > > +
> > > +	if (hpmn < nr_counters) {
> > > +		pmu->hpmn = hpmn;
> > > +		/* Inform host driver of available counters */
> > > +		bitmap_clear(pmu->cntr_mask, 0, hpmn);
> > > +		bitmap_set(pmu->cntr_mask, hpmn, nr_counters);
> > > +		clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
> > > +		if (pmuv3_has_icntr())
> > > +			clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
> > > +
> > > +		kvm_debug("Partitioned PMU with HPMN %u", hpmn);
> > > +	} else {
> > > +		pmu->hpmn = nr_counters;
> > > +		bitmap_set(pmu->cntr_mask, 0, nr_counters);
> > > +		set_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
> > > +		if (pmuv3_has_icntr())
> > > +			set_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
> > > +
> > > +		kvm_debug("Unpartitioned PMU");
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> 
> > Hmm... Just in terms of code organization I'm not sure I like having KVM
> > twiddling with *host* support for PMUv3. Feels like the ARM PMU driver
> > should own partitioning and KVM just takes what it can get.
> 
> Okay. I can move the code.
> 
> > > @@ -239,6 +245,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
> > >   	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
> > >   		return;
> 
> > > +	if (reserved_host_counters) {
> > > +		if (kvm_pmu_partition_supported())
> > > +			WARN_ON(kvm_pmu_partition(pmu, reserved_host_counters));
> > > +		else
> > > +			kvm_err("PMU Partition is not supported");
> > > +	}
> > > +
> 
> > Hasn't the ARM PMU been registered with perf at this point? Surely the
> > driver wouldn't be very pleased with us ripping counters out from under
> > its feet.
> 
> AFAICT nothing in perf registration cares about the number of counters
> the PMU has. The PMUv3 driver tracks its own available counters through
> cntr_mask and I modify that during partition.
> 
> Since this is still initialization of the PMU, I don't believe anything
> has had a chance to use a counter yet that will be ripped away.

Given that kvm_pmu_partition() is called from an ioctl, it is entirely
possible that events have been scheduled prior to applying the
partition.

> Aesthetically It makes since to change this if I move the partitioning
> code to the PMUv3 driver, but I think it's inconsequential to the
> function.

There are two *very* distinct functions w.r.t. partitioning:

 1) Partitioning of a particular arm_pmu that says how many counters the
 host can use

 2) VMM intentions to present a subset of the KVM-owned counter
 partition to its guest

#1 is modifying *global* state, we really can't mess with that in the
context of a single VM...

Thanks,
Oliver

