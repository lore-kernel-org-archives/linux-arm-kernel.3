Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF41DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVL+xsmVsAx+9Gwpx0seodzg63M6LJEVcVeD2h7hazI=; b=G+qX9uKbtGsF7RodVFDQtIL8ZA
	PLI63f89Va3X828pWkoKAwZoMRxW2zSif75DbtuAcTlGGqd+8N0UL2f76WTuvhzkPjxKCrCavkoxC
	JFLCeBaPpWJLbkUYjOesMUjPCA5GVlhZ9HVpz5ctFw2i/2LKqRWJZ13xE3Eycw2Vj9AnxZ3ONbPaI
	Q/gfrX5yvW/Eta0wLHhN49B8FeCYSUOwuVeID02hVTJF4eDMjVgJxmBaEq/G9AT8neL1Pv2P+8a8I
	WtB5sGPuxrAQRm5QC/3M+VaVesf8jgjoqfRN6JKsqHCKBw1DieDWTl6bGSWGDN0BXHybLy2/jECyp
	Cg1qOKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Eg-0000000FWE1-3Nh9;
	Tue, 07 Jul 2026 17:05:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Ee-0000000FWDL-0CJW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:05:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2BA1596;
	Tue,  7 Jul 2026 10:05:22 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A2223F905;
	Tue,  7 Jul 2026 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783443926; bh=ug+9jrai/CuXVAvQyv/Jezxv0Oj5FFJG3PAlU+06syI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7qHB3aSYCEnS7e4ir8sbUdAC4sfDxnAAEAux8ilLS491jwhiW21gFcB8DH+89xwa
	 IpdY/NgOtAzqG+mzxcPyzbManVZR4Atct78IGLoM/Cql8NAdNXbd19dGDEUJbK1aIy
	 XpuJhpuPZTuNE5dZBZaRL99x9qt40x87/V5zudmQ=
Date: Tue, 7 Jul 2026 18:05:21 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, david.hildenbrand@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	fuad.tabba@linux.dev, mark.rutland@arm.com
Subject: Re: [RFC PATCH 1/3] KVM: guest_memfd: Use memslot id to keep track
 of associated memslots
Message-ID: <ak0x0QIWWw6lFUiy@raptor>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <20260702142912.6395-2-alexandru.elisei@arm.com>
 <akwhexqW66RK5Gru@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akwhexqW66RK5Gru@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_100528_257719_FB151EE0 
X-CRM114-Status: GOOD (  38.79  )
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

Hi Sean,

On Mon, Jul 06, 2026 at 02:43:23PM -0700, Sean Christopherson wrote:
> On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> > To enable memslot operations, KVM maintains two arrays of memslots, and an
> > RCU pointer to the active (in use) array. Changes are made first to the
> > inactive array, and the RCU pointer is updated to point to the inactive
> > array, which becomes active.
> > 
> > The guest_memfd file maintains an xarray of pointers to memslots that use
> > it as the memory provider. After the RCU pointer to the active memslots is
> > updated and until SRCU is synchronized, readers can observe the old or the
> > new value for the active array, and therefore the old or the new pointer
> > for a given memslot.  For memslot creation or deletion that is not an issue
> > for guest_memfd, as readers will either read the same memslot pointer saved
> > by the guest_memfd file, or a non-existing memslot.
> > 
> > But when changing the flags for a memslot, readers can read two different
> > and non-NULL memslot pointers. 
> 
> And?  Why does that matter?  KVM memslot updates aren't atomic.  Practically
> speaking, they _can't_ be made atomic. Userspace is required to quiesce all
> activity that must not observe inconsistent state, i.e. userspace must pause
> (stop running) vCPUs when performing a memslot update.

Is that true when KVM_MEM_LOG_DIRTY_PAGES is toggled for a memslot?

As far as I can tell, KVM today tolerates VCPUs running while the
KVM_MEM_LOG_DIRTY_PAGES flags is being changed for a memslot. And by
tolarate I mean that VCPUs that are running when the flag is changed don't
return an error from KVM_RUN. If changing a memslot while VCPUs are running
were fatal, I would think that KVM would want to take vcpu->mutex for all
VCPUs to keep them from running. Or is it a case of KVM allowing userspace
to shoot themselves in the foot if they really want it?

When the KVM_MEM_LOG_DIRTY_PAGES flags is being changed, VCPUs handling a
guest fault can observe either the old memslot, with the old flags, or the
new memslot, with the flag changed, but they still continue running without
returning an error.

That's not the case for memslots backed by guest_memfd: if the memslot
observed by a VCPU during the flags update does not match to the memslot
pointer that the guest_memfd stores in f->bindings, __kvm_gmem_get_pfn()
prints a kernel warning and returns an error.

I agree that memslot updates aren't atomic and they cannot be made atomic
so I tried to come up with another scheme for keeping track of the memslots
associated with a guest_memfd file, to avoid the situation above.

> 
> > Since there is no easy way to ensure that the memslot pointer that the
> > guest_memfd stores is consistent with both views at the same time, modify how
> > the guest_memfd file keeps track of the associated memslots: instead of
> > storing the pointer directly, store the memslot id and address space id
> > (as_id), and use that to reach the memslot in the active list of memslots.
> 
> I don't see how this changes anything.  Readers can still see the old or new
> memslot depending on when kvm->memslots[] is derefenced.

Indeed, and I'm not even trying to change that. When I'm trying to avoid is
this when handling a guest fault:

slot = gfn_to_memslot(kvm, gfn);
kvm_gmem_get_pfn(kvm, slot, gfn, ..)
  xa_load(&f->bindings, kvm_gmem_get_index(slot, gfn)) != slot

Another way to avoid it would be this:

-       if (xa_load(&f->bindings, index) != slot) {
+       s = xa_load(&f->bindings, index);
+       if (s->id != slot->id || s->as_id != slot->as_id) {
                WARN_ON_ONCE(xa_load(&f->bindings, index));
                return ERR_PTR(-EIO);
        }

and to update the memslot pointer stored by guest_memfd at the same time as
the memslot being updated. Or that check could be dropped entirely, but I'm
not really sure why it's there, my assumption was that it's a sanity check
to make sure there no unexpected race somewhere that left guest_memfd's
bindings inconsistent with KVM's memslots, so I left it.

I'm sure there are yet more ways of allowing flags update to a memslot that
uses guest_memfd.

It would be extremely useful for me if I could get clarity on a few things.

* Is allowing KVM_MEM_LOG_DIRTY_PAGES to be set for a guest_memfd backed
memslot something that is worth pursuing?

* Is the current approach, of storing memslot id and as_id in f->bindings,
acceptable? Should I continue working on it?

* If it's not acceptable, what should a new approach do differently?

Thanks,
Alex

