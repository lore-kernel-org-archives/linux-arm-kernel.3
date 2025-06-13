Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06934C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05h3cJJBxazbpz5FiVZjgC7ryx5+viWkk/L4vbZmO2k=; b=emhj/3Kgr57hFnf+3dGM9FAlpJ
	ECl6QM590H1rDghtg5+9oWu/l1BF18ZEdSbsuDCVcS+CPrh73jyCDSjIL/cVSj0AfD0yjFkseQ9jN
	1nZZRxY8FQIlRNQdLZAsUgTxHYwywjSrcKg3aITTJcXVsA5NG2vPCKGI1/nlBXOeC855ePImx4GVp
	7R/XAAtL4/OOyaCpmb/0FrQT3Cqrhf0Ia5DhodwYTURlXSAFKlZ/6+p9al2tOeCiQ/mfGia8xN0ZX
	WCQ4xw7oH4EtQfUK6k168be5+1UFgqxHGSRlR+pfe8IEcnIzKhqlSdOniyjfygT35nhNMCGqN28Vz
	yJ73OY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAGk-0000000HTw2-0Aa8;
	Fri, 13 Jun 2025 19:40:54 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAEY-0000000HTa6-10i5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 19:38:40 +0000
Date: Fri, 13 Jun 2025 12:38:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749843512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=05h3cJJBxazbpz5FiVZjgC7ryx5+viWkk/L4vbZmO2k=;
	b=nHVMfSp17TO+6pXWRN4z4CUhv9KXUKZYW16bR+BF10UJ7m/uUOfxNwfBQwC4twFlBHRKSw
	Pf4lttmhhbapozJhj8WeTWmvaEhliYPwyic1QqNvnmgCUFm2IwxzdvvDpp7lJZ6EY7EXPe
	YehBIglTD6fsw9/Y9qBBC2aqrl5gBus=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	Krishnakant Jaju <kjaju@nvidia.com>,
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>
Subject: Re: [PATCH v6 3/5] kvm: arm64: New memslot flag to indicate
 cacheable mapping
Message-ID: <aEx-JlaYJsLAQx3J@linux.dev>
References: <20250524013943.2832-1-ankita@nvidia.com>
 <20250524013943.2832-4-ankita@nvidia.com>
 <20250527002652.GM61950@nvidia.com>
 <SA1PR12MB71990A84FDB4350DC02CEC6EB064A@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aEMsDsi3DSm1up0G@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEMsDsi3DSm1up0G@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_123838_687091_F74ABFB5 
X-CRM114-Status: GOOD (  22.71  )
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

Hey,

Sorry for going AWOL on this for so long, buried under work for a while.

On Fri, Jun 06, 2025 at 10:57:34AM -0700, Sean Christopherson wrote:
> I would much prefer we have a way userspace query the effective memtype for a
> range of memory, either for a VMA or for a KVM mapping, and let _userspace_ do
> whatever sanity checks it wants.  That seems like it would be more generally
> useful, and would be feasible to support on multiple architectures.  Though I'd
> probably prefer to avoid even that, e.g. in favor of providing enough information
> in other ways so that userspace can (somewhat easily) deduce how KVM will behave
> for a giving mapping.

Agreed, and really userspace needs to know what it has in its own
stage-1 for that to make sense. The idea with a memslot flag is that
you'd get a 'handshake' with KVM, although that only works for a single
memory type.

What's really needed is a fine-grained enumeration as the architecture
allows an implementation to break uniprocessor semantics + coherency for _any_
deviation in memory attributes (e.g. Device-nGnRE v. Device-nGnRnE).
Although in practice it's usually a Normal-* v. Device-* mismatch that
we actually expose to the VMM.

So, in the absence of a complete solution, I guess we can forgo the
memslot flag. OTOH, the KVM cap is still useful since even now we do the
wrong thing with cacheable PFNMAP so KVM_SET_USER_MEMORY_REGION
accepting a VMA doesn't mean much.

Burden is on the VMM to decide what that means in the context of $THING
it wants to install into a memslot.

> > > There is no easy way for VFIO to know to set it, and the kernel will
> > > not allow switching a cachable VMA to non-cachable anyhow.
> > 
> > > So all it does is make it harder to create a memslot.
> > 
> > Oliver had mentioned earlier that he would still prefer a memslot flag as
> > VMM should convey its intent through that flag:
> >
> > https://lore.kernel.org/all/aAdKCGCuwlUeUXKY@linux.dev/
> > Oliver, could you please confirm if you are convinced with not having this
> > flag? Can we rely on MT_NORMAL in vma mapping to convey this?

Yes, following the VMAs memory attributes is the right thing to do. To
be clear, this is something I'd really like to have settled for 6.17.

> Is MT_NORMAL visable and/or controllable by userspace?

Generally speaking, no.

Thanks,
Oliver

