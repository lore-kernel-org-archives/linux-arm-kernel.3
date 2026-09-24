Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6AFC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2zQUJ23idUHk5KbjgrSsNpQFZ6X6k1nsitKWBxEjOM=; b=ro7altjJoRxNhKB0+hKU9QlVdm
	GtSJHORr8TB0O7WYUNjchU+LUtBY2w7rkc7aAfXVkzFIsHZcXGmwG0Uh2yEhL344ywu5Fl5BirLId
	H1GlgxDtWBEbAFvNB3HCCW68mgv9pBGBhiXr05hgV/mydN9hx1ZWs8c1ol7I5ykj+Sj9Xx7yVNkBM
	GFlUBHzsLU1NaUijs08EoFctBuVCtOWzUwLCJsH3eLl9SQ7OLHm0w8m1o7ao1Y/eaXiwe38O/6BE2
	5SS4HwseVSsPHZ3/4cx6OBHeqdebW2Fw32dfJu1dDKaskpJNrnFtOCRZncETrxdHZA21lFb95GmaS
	VNe08Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eqM-0000000AR5B-0N18;
	Thu, 24 Sep 2026 08:30:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eqL-0000000AR4x-1KzR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B82334035F;
	Thu, 24 Sep 2026 08:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6A41F000FF;
	Thu, 24 Sep 2026 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238612;
	bh=Q2zQUJ23idUHk5KbjgrSsNpQFZ6X6k1nsitKWBxEjOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XE3JpDcyKgv66BxukYFgGmEjQwDrMczbTevv4ZcszBIlpl8KJY3CacKcNQQPtgbbZ
	 VmD4CdC6Q2YiM6/r9a0oRFxSnsgIzzRR5Sa/KOQTNZQBBzJOwakExAzw2GIHUCo0vf
	 GRlUGdYaeL5qehGKK4tDTQ0G8nY3SHbyK+WJfRpgY2vkENDWqDBVwxpcUUpNQeQP/2
	 Co3gEwVstJd8QF3cZCS8ORpdJZk4RCc+jck4Z8q1lOC8/ojDRQPzr9erFh1rCr9fpm
	 HWLOsgoEut2jtJs/3HN7cTEiUJQILcDTvFz1Y3aUlw+PcxvpBXHq5XAKUvxsmgUdxP
	 +I90F8jJItjUQ==
Date: Thu, 24 Sep 2026 09:30:06 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org,
	oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	steven.price@arm.com, qperret@google.com
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
Message-ID: <arTfjgvZIhmXLrw1@willie-the-truck>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com>
 <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 10:51:34AM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> > > +/*
> > > + * Returns true when handled at EL2, false when the host must stop scheduling
> > > + * the vCPU.
> > > + */
> > > +static bool pvm_psci_vcpu_off(struct pkvm_hyp_vcpu *hyp_vcpu)
> > > +{
> > > +        /* No other writer runs while this vCPU is ON and executing. */
> > > +        WARN_ON(READ_ONCE(hyp_vcpu->power_state) != PSCI_0_2_AFFINITY_LEVEL_ON);
> > > +
> > > +        /*
> > > +         * Orders pkvm_reset_vcpu()'s clear of reset_state.reset before OFF, so
> > > +         * a CPU_ON that wins on OFF republishes after it. Pairs with the
> > > +         * cmpxchg in pvm_psci_vcpu_on().
> > > +         */
> > > +        smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);
> >
> > Is there an issue either with the comment or with pvm_psci_vcpu_on()? the
> > cmpxchg is relaxed. I would have expected cmpxchg_acquire().
> 
> It's the comment. The ordering it describes holds with the relaxed
> cmpxchg. The release of OFF orders the clear before OFF. The winner's
> smp_store_release(&reset_state->reset, true) orders its cmpxchg before
> that store. So the clear can't land after the republish. The comment
> should name that store-release as the pair, not the cmpxchg.

Sorry, but I'm really confused by this and it appears to be different to
what we've got in Android as well. Why do we need release semantics for
the store to 'hyp_vcpu->power_state' in pvm_psci_vcpu_off()? What is it
that we are publishing here? The comment talks about pkvm_reset_vcpu(),
but how is that relevant to the vCPU _off_ path? You say the comment is
wrong, but what _should_ it say?

I'm a bit baffled!

Will

