Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9962C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTZsSNjxZR+a+6g7E908FfiySxOJ/3/Gglf+f0Vi9Uw=; b=qggpf32UdDhcakldNpLJ9fT0kg
	CO1PsO0TUfsUltZbqvgjAzxrCXgdwcTRfK+T84XP358qrJIyeeEe7lbE9fm6DV467MqQOp77rUO++
	PwE9sY7briHXlrAZzf+bbjVfiAKkYMyx85cWU2bj1EiHN0L8hq6LYvB5KB0UX7XtTy8ftGSOGBHiZ
	TD6Dqng+RsE5TcNmr3nXpWdTKKFGboXxv8ea066NoWFsxte1V4WtnTsrSSj6AVpAsL5otqYJYt5yR
	8DBF7UCe2a832hJ50mSAupSee56rbkSBm8gkb/yHaF6fh5kiGVNrdiSBmgQhXl8mVnlKVC8ojHreT
	QopENWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFoQ-00000005UWK-1fcg;
	Fri, 10 Jul 2026 18:18:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFoO-00000005UWE-0ehA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:18:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2596960051;
	Fri, 10 Jul 2026 18:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AB51F000E9;
	Fri, 10 Jul 2026 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783707534;
	bh=bTZsSNjxZR+a+6g7E908FfiySxOJ/3/Gglf+f0Vi9Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+quyzZM3yXGc4LJ5bibSjKNR5AG0efU7AzbnQ+4dSPT9BA2n3fIln+lhLNwo/91W
	 IHl16Bcs33VOncykgTll9M9s17ddVhx+zLjru+u8yz2pFPsQ2I3CoRKcAl982T1d/N
	 L21JPiH0gBmykQIsMRXxDY5Zn+RBvMTNoJ0ykCQdzDIu0nRLcV5BTrTfjeEKNffJCD
	 TGbwAHhZ03+NTMIIeZoIScpj82TADYR5L16NhrJzYsaXiMXcJ37wBRmSZ6b1E0P7GC
	 TjTM5WzFy2UcGe/yn2WlMc54JQLTclCpjCmlmDsS/+zLrYr17c1ICpoebmx9G4qC4Q
	 cyeBL+DWkhGZQ==
Date: Fri, 10 Jul 2026 11:18:53 -0700
From: Oliver Upton <oupton@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, david.hildenbrand@arm.com, maz@kernel.org,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, fuad.tabba@linux.dev, mark.rutland@arm.com
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only
 memslots
Message-ID: <alE3jRLtYeq-WesA@kernel.org>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com>
 <ak0wSQ1133O7B96D@raptor>
 <alAFmiAsNf6Xm49_@kernel.org>
 <alDM_yikef16lC5h@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alDM_yikef16lC5h@raptor>
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

On Fri, Jul 10, 2026 at 11:44:15AM +0100, Alexandru Elisei wrote:
> Hi Oliver,
> 
> On Thu, Jul 09, 2026 at 01:33:30PM -0700, Oliver Upton wrote:
> > On Tue, Jul 07, 2026 at 05:58:49PM +0100, Alexandru Elisei wrote:
> > > Hi Sean,
> > > 
> > > On Mon, Jul 06, 2026 at 05:56:12PM -0700, Sean Christopherson wrote:
> > > > On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> > > > > The memory represented by guest_memfd-only memslots
> > > > > (kvm_memslot_is_gmem_only() is true) is shared with userspace, which can
> > > > > freely mmap it and access it. The only thing that is preventing dirty page
> > > > > logging for such memslots is that KVM doesn't allow slots backed by
> > > > > guest_memfd to have their flags changed; they can only be created and
> > > > > deleted.
> > > > 
> > > > Please (publicly) document *why*  you want to add dirty-logging support.  It's
> > > > all but impossible to review new uAPI without knowing the use case.
> > > 
> > > Of course, my mistake, I was so deep in this that I didn't realise that
> > > there might be different perspectives.
> > > 
> > > My thinking was that since guest_memfd created with GUEST_MEMFD_FLAG_MMAP +
> > > GUEST_MEMFD_FLAG_INIT_SHARED is extremely similar from a userspace point of
> > > view to using an anonymous file (created with memfd_create()), that
> > > supporting dirty page logging and migration would be a natural next step
> > > and would expand the usefulness of guest_memfd. It has nothing to do with
> > > confidential compute.
> > > 
> > > As to why I'm working on it now, it's because of an arm64 feature that
> > > requires that memory remains mapped at stage 2, called Statistical
> > > Profiling Extension (SPE), similar to Intel's PEBS or AMD's IBS. Exposing
> > > the feature to a guest requires that memory remains mapped at stage 2
> > > outside of userspace explicitely unmapping it, and guest_memfd, with the
> > > patch to ignore the MMU notifiers [1], has this property.  I wanted to
> > > expand the functionality of guest_memfd to support migration of virtual
> > > machines when that arm64 feature is exposed to guests.
> > 
> > Can you please expand a bit on how you actually expect dirty tracking to
> > work with SPE? Taking write permission faults seem to be at odds with
> > "thou shalt not fault".
> 
> For the initial posting on the mailing list, my approach was to keep things
> as simple as possible: allow memory to be made read-only and then have the
> host map the memory as writable at stage 2 when SPE reports a permission
> fault, if the buffer happens to be enabled while dirty page logging is also
> enabled. Of course, that means that the quality of the profiling data might
> be degraded. I was planning to point this out, to start a discussion about
> it, but we can talk about it now.

Understanding how this is going to fit together end-to-end seems
relevant since you're asking for UAPI guarantees to enable SPE.

I agree that degrading the profile isn't that big of a deal but the buffer
may not even be in a restartable state after taking a fault. Who (KVM /
VMM) is going to handle rewinding PMBPTR in the case of an incomplete
record? Blaming userspace is always a good start but at the same time the
more rules/gotchas there are around the feature the less likely it seems a
VMM will pick this up.

Assuring that there are no KVM-initiated invalidations for guest_memfd
doesn't seem unreasonable but we need to have an aligned view on how SPE
will actually be enabled in KVM + VMM first.

> Another approach that builds on that, which I have prototyped locally, is
> to have a VCPU exit to userspace when/if the buffer is enabled and there is
> at least one memslot with dirty page logging enabled (with a specific
> hardware_exit_reason) and then let userspace decide what to do: resume the
> VCPU and live with the blackout window, or keep the VCPU stopped, and the
> guest gets non-degraded profiling data as the expense of the VCPU making
> progress.

My take is that there's no amount of idiot-proofing we can do in KVM to
prevent the VMM from messing this up somehow. We can just document the
limitations and let userspace decide to quiesce when dirty logging is
enabled.

> My hope is that if migration is fast enough, the VCPU not running
> for (possibly) the entire duration of the migration process won't be
> noticeable, but I might be naive in thinking that.

Err, for a live upgrade of the VMM or kernel, sure. But an actual copyful
migration going over network could be O(minutes).

> According to the Neoverse v3 errata document (MP168), r0p0 is affected,
> r0p1 is not affected. A quick google search revealed that Microsoft's
> Cobalt 200 CPU is based on Neoverse v3, same for the Arm AGI CPU. Wikipedia
> also says that Graviton 5 is based on Neoverse v3. Don't know the exact
> revision though, for either of them.
> 
> I was planning to add a kernel parameter that permits SPE on the affected
> parts, so people who trust their guests* can still use it from a VM. I
> don't think migration would be possible in this case because SPE bypasses
> the read-only permission at stage 2, and the host would not know to mark
> that memory as dirty (for dirty page logging).
> 
> * Ignoring migration, guest_memfd is always mapped as writable at stage 2,
> so a guest would have to point the buffer at memory that KVM represents
> with a KVM_MEM_READONLY memslot, like the CFI flash device used by EDK2.
> 
> > 
> > Fixing rotten architecture would be a more appropriate starting point :-/
> 
> I like to think that the architecture is constantly improving :)

I'd like to think that too...

Best,
Oliver

