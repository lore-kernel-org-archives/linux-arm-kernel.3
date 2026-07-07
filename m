Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVWoVZb1H32IjvjrkxviIjF2cIh1I7I63VhHBiW5LZQ=; b=4Vqj1iJC8loKT8Sv6VpQkYrQBA
	3qd8nSafAhigoXG4R6yD6ZLpbOm6UZxS+7Q5VnZrS9W4AkH20pltaiVJmvUY17as0KGnUdunew2Fw
	P73+lbVNnCSYR7NM/n9kKZKDf25mirX++sPZBOocBAY/0QevKovIMjTT+ua3dbb++EboDfiPR61PR
	m+XkAyJHE4RSy4h93jfWxCDMWHMJNn2Ro5eDHmYXCZgzIrGwCeyNNj6dgdULHUjXSAJmB8lu+gblC
	sudCcAgNSkBxGQyi0FauZd4y7kJweo8oHTMitiko8FsQv9SmCD7Uy9M2DN1aWwhP4ZWwsE5bYcLD8
	vQGYbEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9FJ-0000000FWRA-0kjG;
	Tue, 07 Jul 2026 17:06:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9FE-0000000FWP7-3DmM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:06:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 337B11596;
	Tue,  7 Jul 2026 10:05:59 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 553233F905;
	Tue,  7 Jul 2026 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783443963; bh=ucV5WtJiMT7xqag1YtM9Bd4fTSEWyIp6jpJoT0dTmwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C84rZEsys4yeYqvAbSUL8fd3MIZ++2ZudFn/13049kZO1iLz1txJAkZpqDygBZPI3
	 5WFYjDUMQrPm8BT8qassMRgYevdzAWWHSSnPodHK5sVn3o7R8vl0Cfe3UZzNjAbucM
	 e8ou9pLR/cD7kNKXpca2UpMmfTAY+NzpSqdqD7R0=
Date: Tue, 7 Jul 2026 18:05:57 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david.hildenbrand@arm.com>, pbonzini@redhat.com,
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, fuad.tabba@linux.dev, mark.rutland@arm.com
Subject: Re: [RFC PATCH 1/3] KVM: guest_memfd: Use memslot id to keep track
 of associated memslots
Message-ID: <ak0x9VAWz823HnUk@raptor>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <20260702142912.6395-2-alexandru.elisei@arm.com>
 <8a24f016-6f0f-4322-b646-d843f6fa481e@arm.com>
 <akuxjY-VRrmcybjZ@raptor>
 <akwiG_tDu5Eyyc0-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akwiG_tDu5Eyyc0-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_100604_913912_11663CE7 
X-CRM114-Status: GOOD (  23.09  )
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

On Mon, Jul 06, 2026 at 02:46:03PM -0700, Sean Christopherson wrote:
> On Mon, Jul 06, 2026, Alexandru Elisei wrote:
> > On Mon, Jul 06, 2026 at 09:14:59AM +0200, David Hildenbrand wrote:
> > > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > > index db57c5766ab6..43ef8e908aaf 100644
> > > > --- a/virt/kvm/guest_memfd.c
> > > > +++ b/virt/kvm/guest_memfd.c
> > > > @@ -25,6 +25,7 @@ struct gmem_file {
> > > >  	struct kvm *kvm;
> > > >  	struct xarray bindings;
> > > >  	struct list_head entry;
> > > > +	bool found_memslot;	/* Used for balancing invalidations when punching a hole */
> > > 
> > > Probabably best to document what it means, not only what it is used for (and
> > > maybe document above the member if you end up with more text).
> > 
> > Sure, this is how I changed it:
> > 
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 210bdd76f0aa..3cee64047bce 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -25,7 +25,13 @@ struct gmem_file {
> >         struct kvm *kvm;
> >         struct xarray bindings;
> >         struct list_head entry;
> > -       bool found_memslot;     /* Used for balancing invalidations when punching a hole */
> > +       /*
> > +        * Keeps track of whether memory has been unmapped during secondary MMU
> > +        * invalidation, to keep the invalidate start and end calls balanced.
> > +        *
> > +        * Accessed while holding the inode->i_mapping lock in exclusive mode.
> > +        */
> > +       bool memslot_invalidated;
> >  };
> > 
> > Hopefully the new name is better.
> 
> Why add a boolean?  It's not _needed_ to balance updates, or rather it shouldn't
> be needed.  filemap_invalidate_lock() prevents modifying bindings while an
> invalidation is in-progress.  It might be a performation optimization, but if so,
> it's a premature one and belongs in a separate patch.

It's not about bindings being modified. This is the race I am trying to avoid:

CPU0:							CPU1:

KVM_SET_USER_MEMORY_REGION(slot, memory_size=0)
kvm_replace_memslot(kvm, slot, invalid_slot)
kvm_swap_active_memslots(kvm)
kvm_replace_memslot(kvm, invalid_slot, NULL)
kvm_swap_active_memslots(kvm)
							fallocate(guest_memfd, FALLOC_FL_PUNCH_HOLE)
							  __kvm_gmem_invalidate_start()
							    slot = id_to_memslot(__kvm_memslots(kvm, as_id), id);
							    if (slot == NULL) {
								    // Early exit, does not call kvm_mmu_invalidate_start(kvm)
								    return;
							    }
							  __kvm_gmem_invalidate_end()
							    // No corresponding kvm_mmu_invalidate_start(kvm) call
							    kvm_mmu_invalidate_end(kvm)
kvm_replace_memslot(kvm, invalid_slot, NULL);
kvm_free_memslot(kvm, slot)
  kvm_gmem_unbind(slot)

Does that make sense?

Thanks,
Alex

