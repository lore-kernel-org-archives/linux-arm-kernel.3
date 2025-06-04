Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F2EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOW1xdrjziPgqyySMNuIr3SaQxi8OEOWfnwiMMxBaSE=; b=UIql35vARyV3uZkDuNrh4UBhQQ
	2TUxLrWw9FKUolqwaUOjIP3pkaCLtHIGeAmNktmbzEOzsWtMDW1sdufij1AWRJ3m7K50LepZLHmuC
	KLwT2WU8FjXNPHoUxok1C+7EtjCtYMOVB+etAOEO/kJ0Up99DJcjZOcVaGY5pKarOBat5pgo/Wh1S
	NywPPoBAs40po3e8iXsw7gehyMCpLE4GTzIaUmZDJ3BegY/v1pwI0ol75E/iqw1UYRCrKYKJo7bS3
	XRUh0896+tXDTzwvmFCc8Ku+jUKjMQ5/IuG6417sQlMVejt7CBXjwT6pNL7rD4Fys3dmemZvhv39M
	eDQnojgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvDs-0000000EDww-0UmV;
	Wed, 04 Jun 2025 21:00:32 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvBl-0000000EDkW-2ZcU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:58:23 +0000
Date: Wed, 4 Jun 2025 13:57:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749070695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOW1xdrjziPgqyySMNuIr3SaQxi8OEOWfnwiMMxBaSE=;
	b=xeKrlC9zIC3ZmPVYMgcrLAAdA1ixnF5cvvgJyn8+c3/RJLlbX+/MB67tAaFBuiw+t0TcX3
	bT5MXuHNghyhuS4IXUcX8DCQblIYjCBZmsxRaWOO1Pg4L6QzKGiQwcYAuFS5Krli8PlayG
	Kps59HH5Y5EsnRyEyCt7qGrhtUhWWRg=
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
Message-ID: <aECzTYoj1F6WHAUC@linux.dev>
References: <aD9w3Kj4-YoizKv5@linux.dev>
 <gsntsekf1d58.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsntsekf1d58.fsf@coltonlewis-kvm.c.googlers.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_135821_865795_17BB4807 
X-CRM114-Status: GOOD (  30.60  )
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

On Wed, Jun 04, 2025 at 08:10:27PM +0000, Colton Lewis wrote:
> Thank you Oliver for the additional explanation.
> 
> Oliver Upton <oliver.upton@linux.dev> writes:
> 
> > On Tue, Jun 03, 2025 at 09:32:41PM +0000, Colton Lewis wrote:
> > > Oliver Upton <oliver.upton@linux.dev> writes:
> 
> > > > On Mon, Jun 02, 2025 at 07:26:51PM +0000, Colton Lewis wrote:
> > > > >   static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
> > > > >   {
> > > > > +	u8 hpmn = vcpu->kvm->arch.arm_pmu->hpmn;
> > > > > +
> > > > >   	preempt_disable();
> 
> > > > >   	/*
> > > > >   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
> > > > >   	 * to disable guest access to the profiling and trace buffers
> > > > >   	 */
> > > > > -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> > > > > -					 *host_data_ptr(nr_event_counters));
> > > > > -	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
> > > > > +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
> > > > > +	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
> > > > > +				MDCR_EL2_TPM |
> 
> > > > This isn't safe, as there's no guarantee that kvm_arch::arm_pmu is
> > > > pointing that the PMU for this CPU. KVM needs to derive HPMN from some
> > > > per-CPU state, not anything tied to the VM/vCPU.
> 
> > > I'm confused. Isn't this function preparing to run the vCPU on this
> > > CPU? Why would it be pointing at a different PMU?
> 
> > Because arm64 is a silly ecosystem and system designers can glue
> > together heterogenous CPU implementations. The arm_pmu that KVM is
> > pointing at might only match a subset of CPUs, but vCPUs migrate at the
> > whim of the scheduler (and userspace).
> 
> That means the arm_pmu field might at any time point to data that
> doesn't represent the current CPU. I'm surprised that's not swapped out
> anywhere. Seems like it would be useful to have an arch struct be a
> reliable source of information about the current arch.

There's no way to accomplish that. It is per-VM data, and you could have
vCPUs on a mix of physical CPUs.

This is mitigated somewhat when the VMM explicitly selects a PMU
implementation, as we prevent vCPUs from actually entering the guest on
an unsupported CPU (see ON_SUPPORTED_CPU flag).

> > There are two *very* distinct functions w.r.t. partitioning:
> 
> >   1) Partitioning of a particular arm_pmu that says how many counters the
> >   host can use
> 
> >   2) VMM intentions to present a subset of the KVM-owned counter
> >   partition to its guest
> 
> > #1 is modifying *global* state, we really can't mess with that in the
> > context of a single VM...
> 
> I see the distinction more clearly now. Since KVM can only control the
> number of counters presented to the guest through HPMN, why would the
> VMM ever choose a subset? If the host PMU is globally partitioned to not
> use anything in the guest range, presenting fewer counters to a guest is
> just leaving some counters in the middle of the range unused.

You may not want to give a 'full' PMU to all VMs running on a system,
but some OSes (Windows) expect to have at least the fixed CPU cycle
counter present. In this case the VMM would deliberately expose fewer
counters. FEAT_HPMN0 didn't get added to the architecture by accident...

Thanks,
Oliver

