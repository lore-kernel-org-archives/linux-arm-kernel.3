Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF101C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT3Yk6DS2Kbe2735RSd4cf+nXdJU5X+2AoC8BP1PwxU=; b=AlUsvcOOOGl58UHiP5XiykOQF/
	jWXb/yJ4SKdQIU1mKu4kQuf8TXxWXuyctb5xLwO5F0ETvns7/hOYKQlJvv5Q5jFAhupCCPGorCo5H
	wTMBxpdJVBv/PQ+4S81yWkdNXR7iaCokYWpuv81oW7TAEwHH8SDjPgBMepMfwVtSrLBjqioNKI6Kf
	/pTqcuC4k85JRoYkHB7yMxUelN4yR7vtGgrXoPeJCyrDmJ/arcSOENKA37YNC1TQzI+RFnUwOMvgR
	mOJ6DjTn901CYPI2s3FO4F1gLfJxIyufH67HbP9PMVsRe077j4KHlEJEGZfN3BSYU/w4Zzqo/YrjV
	0B9qOT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YX7-0000000EUtA-1jMi;
	Fri, 18 Sep 2026 13:21:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YX6-0000000EUsq-0WVt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:21:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9332840937;
	Fri, 18 Sep 2026 13:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9965A1F000FF;
	Fri, 18 Sep 2026 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737699;
	bh=oT3Yk6DS2Kbe2735RSd4cf+nXdJU5X+2AoC8BP1PwxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JwCL8z9eL3OL6zrYiXmtaUkJFT7xMiqf3sWLeC9MXzTjC4nRbl0DmS6ip/aXy1RKD
	 ovYMViPUbj+1cC539eR/fx2SZK7AwPJ6AtG61W3w2Tv9ODcwPixrpwYuz7wr9QuK/x
	 PrUuCvKjdt1e8CP51HwR9MA1SOOm+tqxPVY0W7HmxwMXfbM0Mxq+JgfolRWm1YxAYG
	 9nzPLilf6e86z41wF0aJcRaZh2cLK+lw3nl4wI7d4YyGIbWj5S0LdrGDQMm/DAIl89
	 y5EIUSsoBgUYz73wEeMDLrVldXaQqhylnMry7a5bWfyBwxfkbFq6tooY95+UHcN4oG
	 UsiuijPk+SRIw==
Date: Fri, 18 Sep 2026 14:21:31 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, oupton@kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com, steven.price@arm.com,
	vdonnefort@google.com, qperret@google.com
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
Message-ID: <aq0628Ci4pfEj0KG@willie-the-truck>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org>
 <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865x045mke.wl-maz@kernel.org>
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

Hi Marc, Fuad,

On Thu, Sep 17, 2026 at 09:06:25AM +0100, Marc Zyngier wrote:
> On Wed, 16 Sep 2026 20:07:28 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> > On Wed, 16 Sept 2026 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
> > [...]
> > > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > [...]
> > > > +/*
> > > > + * Once a protected vCPU has run, the host copy is not the guest's state,
> > > > + * and EL2 has read mp_state, which it does only at hyp vCPU creation.
> > > > + */
> > > > +static long pkvm_filter_vcpu_ioctl(struct kvm_vcpu *vcpu, unsigned int ioctl)
> > > > +{
> > > > +        switch (ioctl) {
> > > > +        case KVM_ARM_VCPU_INIT:
> > > > +        case KVM_SET_ONE_REG:
> > > > +        case KVM_GET_ONE_REG:
> > > > +                if (vcpu_is_protected(vcpu) && vcpu_has_run_once(vcpu))
> > > > +                        return -EPERM;
> > > > +        }
> > > > +
> > > > +        return 0;
> > > > +}
> > > > +
> > >
> > > I'm not keen on returning -EPERM for the ONE_REG stuff. For a start,
> > > X0 *is* valid on MMIO, and when you want to support LD64B and co,
> > > you'll need to show the actual data there.
> > >
> > > I'd rather return what is in the host vcpu structure, as normal.

I just wanted to chuck my thoughts in here, as some of this is my fault
and it would be really helpful to discuss it on the list. As you probably
know, on Android, pKVM has the semantics you describe above: the ONE_REG
calls succeed, but the register state isn't propagated to the guest once
it's started running. I think we largely did it this way because we were
solving a million problems at once during the initial development and
having to pipe-clean VMMs wasn't particularly appealing at the time.
It's also worth adding that, to my knowledge, we've never had any issues
in Android because of this decision.

So, based on that, it really sounds like it's the best option. If it ain't
broke, don't fix it!

*However*, I can't think of another upstream interface that behaves like
that and, when we came to document it, it was quite difficult to explain
it in a way that could be extended in the future. If we say that ONE_REG
doesn't propagate to the vCPU after first run and returns whatever was
last written, then userspace could (even accidentally) rely on that. If
we wanted to extend it, I think we'd not only need a method to advertise
the new behaviour (which I think you probably want even if ONE_REG
returned an error before) but also an opt-in for userspace to say that
it's ok with the new behaviour. In some ways, it feels a bit like the
"unchecked flags" problem for syscall arguments.

> > I think we should keep the error, for the reason s390 returns -EINVAL
> > from ONE_REG on a protected vCPU and x86 does from the register ioctls
> > for protected VM types:
> 
> News flash, this is not x86, nor s390. I don't feel constrained by
> other architecture, and we deviate *everywhere* already.

Right, this wasn't the rationale.

> > once the vCPU has run, the copy is the VMM's
> > boot state plus what the exit handlers copy out, and the VMM can't
> > distinguish them. x0 on MMIO is one of those fields, but the VMM reads
> > it from kvm_run->mmio. For LD64B, EL2 would copy the operands out the
> > same way and the error could be relaxed to those registers. Loosening
> > later breaks nobody. The comment and the message do overstate it by
> > calling the copy "not the guest's state", and I'll reword both in v4.
> > More on the kvmtool thread [1].
> 
> A protected-aware VMM already knows it cannot obtain the registers.

I think you can use that argument both ways: if the VMM knows it cannot
obtain the registers, then it's fine to return an error if the VMM does
something wrong.

In our recent investigation, it turned out that both kvmtool and crosvm
were perfectly happy with ONE_REG returning an error in normal operation
but we needed a handful of fixes for kvmtool [1] to handle things like
the 'debug' command.

If it's helpful, we can ask the crosvm developers here if they have
opinions for/against the two behaviours?

> I don't want to have to revisit the userspace interface once you have
> to relax it, because I know for sure that you will have to.

I think we'll have to do that either way, no? The VMM needs a way to
know that ONE_REG works and the situations in which it works. If the old
behaviour wasn't to return an error, it's also going to need a way to
enable the new behaviour.

> As far as LD64B is concerned, there is no place to copy anything in
> the run structure, and the relaxation would require to cover all the
> GPRs, ESR, and FAR. At this stage, returning whatever is there is the
> correct thing to do IMO.

The nice thing about that is that we can presumably tie it in with LD64B
support for protected VMs.

Will

