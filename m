Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36732C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dhwp5vjqYszriZEVm0D/39l33x16cKgI34FbGJQXy0=; b=mbfrapan7KbWZuzfznjt8e6aGW
	z6T4WKqBH72HZP6EoT2dG2zZpW+SIREhUdBycOh23urgPCxgHMeNfnKcp4kYErFTcDJYKaB8Gv0IX
	0Dbtc4Rb73LzMVZJtqfrNH7sTdmyiDau8Y0c6Vy0zVInIKGKaFGN33saASO4wd+tEcoGt2I50QZi9
	mbz2evuqTpxU8hYuy9AY9RDkuaqHfigFfs6YrQ9I+BZIbSgJoB49a6+XesQMK9f90w6a8G91cw1NZ
	be7WsZVH1kQ0lRVPW9OdaqDPqrlmdW4shyTYP9zPduNp7LUp9FDPkv4ZeQDvXK3/VgztBH8fRTTmg
	4/C4Bvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu08-00000003L6j-1fkG;
	Thu, 09 Jul 2026 19:01:36 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu06-00000003L5u-0Ok9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:01:35 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-8423f544944so81190b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783623693; x=1784228493; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dhwp5vjqYszriZEVm0D/39l33x16cKgI34FbGJQXy0=;
        b=iru/CacOuafQn7YyPkNe9k3LhmCPhNoO2O0SGIYFuhe8YDAJsNZX5NhHs1X34NxUyd
         w4L88ApBaikeOJSNMMhvbvcpZShC+FJOWicABUhfss2IHqZ55CKjGe3YtWgYhKAJkKRe
         Cp1eX+ZsVKA8b3tahbpxbzFLI2xqjoYl+22ALvtfBqVE2zxzRd9pHqxYTH3oE91DkQzk
         lI9ZSM6EFdLA7P7RvE6/rsBH40U1V/ROMk5xC6Y9uOOq9JAFlINXdDo2Y1ecNBVwG+1H
         2pWCYV/ki2l0xNI0D4qLD8Mdi+hfTv8rP+ZIYmurTvXRiw7lbLYMNd1Wm9ta8/1efAYG
         0GEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623693; x=1784228493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dhwp5vjqYszriZEVm0D/39l33x16cKgI34FbGJQXy0=;
        b=jNqOrCM6V5XXak+zuQj8ISDIjTzRLJYd8t92xejcY+IpmumAAT8C5yNZ9fmfnTd5B6
         iizLEZOa6Q9B1YvVmtQ6etr9R++bZJAES26iWS2TdqVi7EURlbovtHbe77PkvyH0A+9f
         pvRw635VEM07UCvGdUxpBWIwQXj4Ku4C5RJltSEsG//9lVS2BW7nc/DrJS+js101SG11
         AOHA4gGjl90/nwUaGl5sjAHBzjF97PTqWLbTD91u09XsYhFTyuxO4n+CFjRL5aYbLc7v
         kLgZg79fduiOWqHj3yJta44970EeiaoSmS5T7e9QHdhnESyZaE7gothvL80YNfCJzGRR
         gocQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVXIn0F8mYZRU3IlQCzEXSeBRgjP79W+h1t1Iv4aQUAEK2ysst2EpfRBiqfPnkRINoikgbJrDvKSEpG5VSZsor@lists.infradead.org
X-Gm-Message-State: AOJu0YypSU7EPWZasL4MmpfkA35tJLVAHPOUMOLY4V4UemyD9vjykeka
	HXaSyTjrRFlN/FYhc4AlpcIMMM7UyHDTCjhI7P/yJpn1YWNdhREHPF3uBTqXwR6lXm9rCC3gyiW
	tOHW/Ug==
X-Received: from pglx3.prod.google.com ([2002:a63:1703:0:b0:c85:dc1c:c8ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e18:b0:845:e9e8:6458
 with SMTP id d2e1a72fcca58-84842eda2bfmr8132247b3a.20.1783623692329; Thu, 09
 Jul 2026 12:01:32 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:01:31 -0700
In-Reply-To: <ak-EKSslAz1uqEtv@J2N7QTR9R3>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com> <ak0wSQ1133O7B96D@raptor> <ak0ziUcCXUlDdcla@google.com>
 <ak-EKSslAz1uqEtv@J2N7QTR9R3>
Message-ID: <ak_wC4Q-mQe14DI8@google.com>
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	david.hildenbrand@arm.com, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, fuad.tabba@linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120134_168916_60AB919D 
X-CRM114-Status: GOOD (  46.27  )
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

On Thu, Jul 09, 2026, Mark Rutland wrote:
> Hi Sean,
> 
> Ignoring dirty page logging for the moment, I think you've raised a much
> bigger concern.
> 
> I've dumped a bit more context below, with a couple of high-level
> questions. The important thing for Alexandru and I is whether core folk
> are willing to consider some mechanism to ensure that guest PAs are
> pinned writeable and never fault (even transiently).
> 
> On Tue, Jul 07, 2026 at 10:12:41AM -0700, Sean Christopherson wrote:
> > On Tue, Jul 07, 2026, Alexandru Elisei wrote:
> > > On Mon, Jul 06, 2026 at 05:56:12PM -0700, Sean Christopherson wrote:
> > > > On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> 
> > > > Please (publicly) document *why*  you want to add dirty-logging support.  It's
> > > > all but impossible to review new uAPI without knowing the use case.
> 
> > > As to why I'm working on it now, it's because of an arm64 feature that
> > > requires that memory remains mapped at stage 2, called Statistical
> > > Profiling Extension (SPE), similar to Intel's PEBS or AMD's IBS. Exposing
> > > the feature to a guest requires that memory remains mapped at stage 2
> > > outside of userspace explicitely unmapping it, and guest_memfd, with the
> > > patch to ignore the MMU notifiers [1], has this property.  I wanted to
> > > expand the functionality of guest_memfd to support migration of virtual
> > > machines when that arm64 feature is exposed to guests.
> > 
> > I'm all for adding dirty logging support for guest_memfd, but for SPE I don't
> > think relying on guest_memfd always being mapped is a good idea.  guest_memfd
> > is "pinned" purely because adding support for page migration is (very) low
> > priority for SNP, TDX, and pKVM.  guest_memfd page migration might play nice
> > with SPE?  Probably depends on whether KVM is forced to do break-before-make?
> 
> The key thing for SPE is that any pages that the SPE HW is using must
> have a valid writeable end-to-end (VA to real PA) mapping at all times
> while the guest is running (and while the host drains buffers). If that
> requirement is violated, even transiently, then data is lost and the
> guest will see an unexpected fault reported by SPE.

Well, at least it doesn't crash the host :-D

> If there's any reason we might (transiently) unmap a leaf entry (or
> entire sub-tree) from the stage-2 tables, or might (transiently) remove
> write permission, then we can't guarantee SPE will work correctly from
> the guest's PoV.
> 
> Obviously we can't guarantee that for regular memslots backed by
> userspace memory, hence we were hoping we could rely on guest_memfd.
> 
> Am I right to understand that we expect (in future) to do things with
> guest_memfd that could violate that? If so (and if we're not happy to
> have some options to say "always keep this pinned end-to-end no matter
> what"), 

Yes?  Page migration is the main one that I think will be problematic for arm64,
*unless* CPUs that support SPE don't require break-before-make (no idea if there
are even plans to ever drop the BBM rules).  Because with page migration, unless
KVM temporarily jails all vCPUs in the host while swizzling stage-2 PTEs, there
will be a small window of time where the memory isn't mapped.

I mention page migration because I expect swap/reclaim to be fully userspace
driven, i.e. if userspace crashes/corrupts the guest, the answer will be "well
don't do that".  But (at least some forms of) page migration will likely be
kernel-driven, e.g. to compact movable memory for THP.  And I really don't want
to give arch code the ability to hard-pin specific ranges of memory.

That said, odds are good that we'll end up with per-gmem flags to communicate to
guest_memfd whether or not the gmem instance supports page migration (x86's TDX
and SNP in particular require extra consideration).  So if the anticipated use
cases are fine with all-or-nothing "pinning", or with juggling guest_memfd files
in userspace if a more dynamic setup is desired, then you should be ok?

E.g. if the anticipated use cases are all slice-of-hardware style setups where
the VM will be statically assigned a chunk of memory, then for the most part this
will all Just Work.

> then I think that means that in practice we cannot virtualize
> SPE correctly, and Alexandru and I need to go back to our architects.
> 
> > And at some point guest_memfd may support userspace-driven swap, but I
> > suppose we can cross that bridge when we come to it.
> 
> Unfortunately, I think we need to figure out now whether it would be
> acceptable to suppress that (or making it mutually exclusive with SPE),
> if only to decide whether or not we continue trying to virtualize SPE.

Eh, as above, if userspace pulls a stupid and kills the guest, that's their
problem.  Just make sure the host isn't at risk :-)

> We don't need to figure out all the details; just whether or not that
> broad approach would be acceptable, or whether we have to give up on SPE
> virtualization.
> 
> > From a uABI perspective, forcing userspace to use guest_memfd to get access to
> > something like SPE isn't ideal.  While I have aspirations of using guest_memfd
> > much more broadly, I don't know that banking on guest_memfd replacing "everything"
> > is a winning strategy.
> 
> I agree this isn't ideal, and we're certainly not expecting that this is
> suitable for all users. We're just trying to get as much functionality
> as we practically can with today's SPE hardware.
> 
> Thanks,
> Mark.

