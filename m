Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00F3C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdxpGXS/wnimnfN1olqkWbYsmp9jSsthllf3I7l40Ts=; b=Dc2GikgUGDSw/8Hcc27Rl8fA37
	UlqMO12YKdeSvJaejgnylyl4BuTqD2h+n2nrtLTgdY5u/eBIIXgIFs7MJOoQdCz7pV8iQPJH0LEOz
	EZ3U66/oA6vd06QeLgEjNRklxT2ydjsmkvMYKd03YU6Hy+zeOSbvYaq3BKAjfZ129CuNQEyih+cBi
	DtPA9Tf1HDMHteMgUgUow/5UEQgjld8ck+bczZ5z6EP21Mht0JlilPzFP1+XSXh7VxqHUZwNSVPZi
	f0oWwLekwkOpqZ4hli5gars9Qct4PXYE/cqPhPhAAY1YTfVCBl80O7bUS2BVNKR6fumH30tNORLQU
	Ae2BH5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6z2C-0000000AEwi-0o6r;
	Wed, 16 Sep 2026 23:27:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6z29-0000000AEwb-3FrR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:27:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AEE9401BB;
	Wed, 16 Sep 2026 23:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1371F000FF;
	Wed, 16 Sep 2026 23:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789601241;
	bh=DdxpGXS/wnimnfN1olqkWbYsmp9jSsthllf3I7l40Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kequ4qrLA/stLLGW3CIkibGQx0JSpzNkkyEC2GB6l4KbXM1pbpDkBhKYpRYWyRIwm
	 caDnU8ZHFn/B0sKQskme34CLjplcus9b7TlWQJacNToFnA5bAbOllLlXZYmDH6zMAm
	 BXDoZnZZixhR6e0K0+UCYtZ5PemfnyR03j1heAsH8SrfhE6fWfTDnJoje2bpD5xFml
	 DnzY5Qkw80HsnXUwaPjQDtVsHgv0yFNKNOwH0BcPlZ2kCqNFiEGbI5HkXrq3RxF3bS
	 dCDvCwKGfBp8TcOEIkQbawKkW9Lox0zzpsfJ6q9uANwzcHOQHf6I8KpzbqcV35R5vS
	 UCDetSCvp93rw==
Date: Wed, 16 Sep 2026 16:27:19 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on
 migration
Message-ID: <aqsl1_IqnV2r8kUL@kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com>
 <20260901171558.2674031-6-leo.bras@arm.com>
 <aqneWnlsdpocLIl6@kernel.org>
 <aqqhDs3NyjtkZzXK@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqhDs3NyjtkZzXK@LeoBrasDK>
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

On Wed, Sep 16, 2026 at 03:00:46PM +0100, Leonardo Bras wrote:
> On Tue, Sep 15, 2026 at 05:10:02PM -0700, Oliver Upton wrote:
> > Hi,
> > 
> > On Tue, Sep 01, 2026 at 06:15:56PM +0100, Leonardo Bras wrote:
> > > When dirty-logging is disabled, even non-write faults make a page dirty,
> > > which avoids a second fault when the page is actually written to.
> > > 
> > > On dirty-logging enable, this approach causes all (writable) pages on the
> > > memslot to be marked clean, even if they were not written to, which can
> > > take a lot of time, while holding the MMU lock, doing atomic writes to
> > > PTEs.
> > 
> > Do you have any performance numbers for this? Enabling HAFDBS seems a
> > bit involved to avoid some stores on the first pass.
> 
> Not yet, but if the idea does not look too crazy I can find hardware and 
> collect some data :)

TBH this looks like a micro-optimization so I'm not expecting the
performance gains to justify the behavior change.

> > > 						      has_vhe() &&
> > 
> > I don't see a reason why this needs to be constrained to VHE-only.
> > 
> 
> Humm, in nVHE would not the host kernel run in EL1?
> I thought that this being a feature that depends on EL2 registers host 
> would need to be in EL2 to make use of it.
> 
> That being said, I understand very little of how this works, so I 
> constrained to VHE only at the start.
> 
> Would this work in nVHE?

We already pass a stage-2 MMU configuration to EL2 from EL1 in nVHE and
hVHE. How is this any different?

I'm not opposed to making features VHE-only, but there needs to be some
amount of reasoning to justify it.

> > > +		!kvm_vcpu_has_nv(kvm) && cpus_have_final_cap(ARM64_HW_DBM);
> > 
> > Same thing goes for nested... KVM can make use of HAFDBS in the
> > canonical stage-2 MMU (or even a shadow stage-2) independent of the
> > guest hypervisor.
> > 
> 
> Humm, I remember reaching the conclusion that it could not be used if the 
> guest supported NV. Let's say:
> 
> L0 - Host	- Has HAFDBS enabled
> L1 - Hypervisor - Has HAFDBS disabled
> L2 - Guest	-
> 
> Let's say guest writes to a page, and the shadow S2 has DBM=1, so it's 
> marked as WD by HAFDBS. Since no fault was taken, how would the L1 be able 
> to update it's S2 pagetables to mark the page dirty?
> 
> (We would have to transverse the Shadow S2 Pagetable updating the original 
> S2 pagetable)
> 
> I was wondering, thought, that we could emulate it in the last level 
> hypervisor, if it's guest does not support nested guests. That would mean 
> we can have the last-1 level hypervisor to update the S2 pagetable on the 
> last level hypervisor without it having to fault. Ex:
> 
> L0 Host - HAFDBS disabled
> [...]
> Ln-1 Hypervisor - HAFDBS disabled
> Ln   Hypervisor - HAFDBS enabled
> Ln+1 Guest - No E2H feature
> 
> When the guest writes to a page, the host should receive a fault, that IIUC 
> have to propagate down up to Ln Hyp. If Ln Hyp has HAFDBS, we could skip 
> injecting a fault in Ln Hyp, as  Ln-1 Hyp could emulate HAFDBS and write 
> the dirty bit to S2 pagetagle of Ln+1 guest, that resides in Ln memory.
> 
> Not sure if the troulbe would be worth, though.
> Does it make sense?

I'm not following your reasoning here. Treat the shadow stage-2 MMU as a
TLB; that TLB is filled with a writable translation when S2AP[1]=1 in the
L1 translation.

The dirty state of the pseudo-TLB is completely internal. You could then
layer HAFDBS for the L1 translation on top of this (which we don't
support) by potentially relaxing the descriptor _before_ evaluating the
resulting permissions. You'd then take write permission faults to set
S2AP[1] in the L1 translation.

> > The name would suggest this thing takes a vcpu pointer...
> > 
> 
> Ah, that name was based on
> #define kvm_vcpu_has_feature(k, f)  __vcpu_has_feature(&(k)->arch, #(f))
> 
> That takes a kvm struct to check the kvm_arch one, instead of looking into 
> the vcpu. I did it like this because there were some scenarios it was not 
> quite straightforward to get the vcpu to use vcpu_has_nv(), which takes a 
> vcpu.

This thing probably should've been "kvm_has_vcpu_feature()" or similar to
massage the expected typing.

Thanks,
Oliver

