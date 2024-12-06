Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046A6E77170
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 00:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5nG2prdL1skIINqaX1bovIzolBU3gInNcwFgxO/rw0=; b=PA0/kFUNQ9ur0K5Ez/WTnkt89p
	pNQ3z/+4ud4wrYTTuIvM6QAm5/t0m2JsZXbeV8Bmc3emYmy4WsXpWguXoD4yZ0sZ6xE7AJXbwxKhd
	6sM34z4wvPOHFd603z08wPGX3rL2rdgUkQRtz06WlRouies7lFjJVARHgAxeRAhwUo3EO6ezMWbc/
	tM/lbzf1eDchrqI6JG66rvL7usBPCoX4CN/rRiEcrj651nAeIxnmNPb2WbAHukyywuL3te0wxJYe7
	6k0KGDW8tCCWprXUySsmWI9jnWfN8/yuitxa6O0bvlt6eEgmp1qYv8rbbtgcFQCGPy/L5idrAPpTP
	0z23JMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMUv-0000000072T-0dKk;
	Fri, 06 Dec 2024 00:47:09 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJMTq-000000006tm-0VDG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 00:46:07 +0000
Date: Thu, 5 Dec 2024 16:45:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733445956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5nG2prdL1skIINqaX1bovIzolBU3gInNcwFgxO/rw0=;
	b=dxA2HNTaXIewdfp4tSj8/enaHs9W6w1oqZ9zhUaPD0pq2L6Zt4apsXKgnU3vsW+EkIvvdd
	QLfsh+b4yQewYZzepTteXQnOvUg8uOCIolm/2gpdPxVlqK4G2Si6meatvyPBj6Zp2FodFX
	j92vIX2Ujdc82NL3ZWqMpqXGhDFoa2o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
Message-ID: <Z1JJOfnuKQ9LCHq-@linux.dev>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <20241204191349.1730936-7-jthoughton@google.com>
 <Z1Dgr_TnaFQT04Pi@linux.dev>
 <CADrL8HWC7HhYmEBWa+5KeWmyD+iT1zPBJUAUtNyrhH7ZpLXJNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrL8HWC7HhYmEBWa+5KeWmyD+iT1zPBJUAUtNyrhH7ZpLXJNQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_164602_445791_A9F308E1 
X-CRM114-Status: GOOD (  18.44  )
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

On Thu, Dec 05, 2024 at 03:31:05PM -0800, James Houghton wrote:
> > > @@ -2062,6 +2069,20 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
> > >                                  enum kvm_mr_change change)
> > >  {
> > >       bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
> > > +     u32 changed_flags = (new ? new->flags : 0) ^ (old ? old->flags : 0);
> > > +
> > > +     /*
> > > +      * If KVM_MEM_USERFAULT changed, drop all the stage-2 mappings so that
> > > +      * we can (1) respect userfault-ness or (2) create block mappings.
> > > +      */
> > > +     if ((changed_flags & KVM_MEM_USERFAULT) && change == KVM_MR_FLAGS_ONLY)
> > > +             kvm_arch_flush_shadow_memslot(kvm, old);
> >
> > I'd strongly prefer that we make (2) a userspace problem and don't
> > eagerly invalidate stage-2 mappings on the USERFAULT -> !USERFAULT
> > change.
> >
> > Having implied user-visible behaviors on ioctls is never good, and for
> > systems without FEAT_S2FWB you might be better off avoiding the unmap in
> > the first place.
> >
> > So, if userspace decides there's a benefit to invalidating the stage-2
> > MMU, it can just delete + recreate the memslot.
> 
> Ok I think that's reasonable. So for USERFAULT -> !USERFAULT, I'll
> just follow the precedent set by dirty logging. For x86 today, we
> collapse the mappings, and for arm64 we do not.
> 
> Is arm64 ever going to support collapsing back to huge mappings after
> dirty logging is disabled?

Patches on list is always a good place to start :)

What I'd expect on FEAT_S2FWB hardware is that invalidating the whole
stage-2 and faulting back in block entries would give the best
experience.

Only in the case of !FWB would a literal table -> block collapse be
beneficial, as the MMU could potentially elide CMOs when remapping. But
that assumes you're starting with a fully-mapped table and there are no
holes that are "out of sync" with the guest.

-- 
Thanks,
Oliver

