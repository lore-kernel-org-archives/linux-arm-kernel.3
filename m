Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D89C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSshJQs9r4m1RulgZtk+BVpimPAXm4vtzmVudgOOHPM=; b=byCvh3i8ME/ma2qtZEkM/OSGJy
	wL1O4WZpLpqjlKDMxYJrWQIi3b7lFc/Japtb3QwG5pvx2h7dywJeI4OFtBWMCphekqKqQmigjCM7w
	Eg+Hbx1+AxMv11BFFowqTGiKySSvGnUguc1DNj+Yyu6ew+GAiLSDxCRFyJLRj8Q90lo+y5alGeJA1
	/5j8z4Y30MMT1a23+CeoAb0XPR1bnqguUDaZ93kM3VFSphElrSJo/OMyiZPHxcPPMF1Sl+TyKucL3
	QT3g3FGYdUkrfwMfBvTWDKx6WuiuJXB7ggsCHYqBqmMWSwrT8P+dJXGGED+B1xA8hrDSYuYQKS152
	Em2sc7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVuV-00000009OWJ-2c6h;
	Wed, 26 Mar 2025 18:55:31 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVrh-00000009OHw-1TXP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 18:52:38 +0000
Date: Wed, 26 Mar 2025 11:51:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743015153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FSshJQs9r4m1RulgZtk+BVpimPAXm4vtzmVudgOOHPM=;
	b=LShVKNPZ6tCQ+oRaWLBf37sMD9m9kLZ1yV8CQVogM0OEPbYG6Zx/v0bZJqxgtmr5Tfs8lv
	GXloeObhq8Mw9QPkel4lZfRvub7HRjUx/bgqZ08AFXisEvRmgzxz2ZRuxTRd0Ac8ppKgZq
	o9ote564OApjCSKkwU5wEfzbIGHon1M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	Krishnakant Jaju <kjaju@nvidia.com>,
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <Z-RMzYHOzc36H7yR@linux.dev>
References: <20250319170429.GK9311@nvidia.com>
 <Z9sItt8BIgvbBY8M@arm.com>
 <20250319192246.GQ9311@nvidia.com>
 <Z9s7r2JocpoM_t-m@arm.com>
 <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com>
 <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com>
 <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-RGYO3QVj5JNjRB@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_115237_669641_98F7AEEE 
X-CRM114-Status: GOOD (  34.71  )
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

On Wed, Mar 26, 2025 at 11:24:32AM -0700, Sean Christopherson wrote:
> > > But I thought the whole problem is that mapping this fancy memory as device is
> > > unsafe on non-FWB hosts?  If it's safe, then why does KVM needs to reject anything
> > > in the first place?
> > 
> > I don't know where you got that idea. This is all about what memory
> > type is exposed to a guest:
> > 
> > - with FWB, no need for CMOs, so cacheable memory is allowed if the
> >   device supports it (i.e. it actually exposes memory), and device
> >   otherwise.
> > 
> > - without FWB, CMOs are required, and we don't have a host mapping for
> >   these pages. As a fallback, the mapping is device only, as this
> >   doesn't require any CMO by definition.
> > 
> > There is no notion of "safety" here.
> 
> Ah, the safety I'm talking about is the CMO requirement.  IIUC, not doing CMOs
> if the memory is cacheable could result in data corruption, i.e. would be a safety
> issue for the host.  But I missed that you were proposing that the !FWB behavior
> would be to force device mappings.

To Jason's earlier point, you wind up with a security issue the other
way around.

Supposing the host is using a cacheable mapping to, say, zero the $THING
at the other end of the mapping. Without a way to CMO the $THING we
cannot make the zeroing visible to a guest with a stage-2 Device-* mapping.

Marc, I understand that your proposed fallback is aligned to what we
do today, but I'm actually unconvinced that it provides any reliable/correct
behavior. We should then wind up with stage-2 memory attribute rules
like so:

 1) If struct page memory, use a cacheable mapping. CMO for non-FWB.

 2) If cacheable PFNMAP:
   a) With FWB, use a cacheable mapping
   b) Without FWB, fail.

 3) If VM_ALLOW_ANY_UNCACHED, use Normal Non-Cacheable mapping

 4) Otherwise, Device-nGnRE

I understand 2b breaks ABI, but the 'typical' VFIO usages fall into (3)
and (4).

> > > > Importantly, it is *userspace* that is in charge of deciding how the
> > > > device is mapped at S2. And the memslot flag is the correct
> > > > abstraction for that.
> > >  
> > > I strongly disagree.  Whatever owns the underlying physical memory is in charge,
> > > not userspace.  For memory that's backed by a VMA, userspace can influence the
> > > behavior through mmap(), mprotect(), etc., but ultimately KVM needs to pull state
> > > from mm/, via the VMA.  Or in the guest_memfd case, from guest_memfd.
> > 
> > I don't buy that. Userspace needs to know the semantics of the memory
> > it gives to the guest. Or at least discover that the same device
> > plugged into to different hosts will have different behaviours. Just
> > letting things rip is not an acceptable outcome.
> 
> Agreed, but that doesn't require a memslot flag.  A capability to enumerate that
> KVM can do cacheable mappings for PFNMAP memory would suffice.  And if we want to
> have KVM reject memslots that are cachaeable in the VMA, but would get device in
> stage-2, then we can provide that functionality through the capability, i.e. let
> userspace decide if it wants "fallback to device" vs. "error on creation" on a
> per-VM basis.
> 
> What I object to is adding a memslot flag.

A capability that says "I can force cacheable things to be cacheable" is
useful beyond even PFNMAP stuff. A pedantic but correct live migration /
snapshotting implementation on non-FWB would need to do CMOs in case the
VM used a non-WB mapping for memory.

Thanks,
Oliver

