Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0327C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJqa98pwIripZZNEFlA5eT+l3rfPGm52BpjeBkKSrDI=; b=wELZZJ8gZyVi4Lh1+UiO7doJPz
	KGR7+NfnnzTzy068r3axWdaru6t62AyYkwqLqqa8Ns4Z+jHn4jAobqLPKzQvmX8/MkjpbMvy1bFX7
	68INkcARc6ZfNERPYb3vy620fFrbWicI3WHLT24djezcHIf68VBKxHQ37HwwCtrNGcjstYpKsIWBd
	8YQ6lXd9fo4fltnK1GnieRhDtLpfFKuK0n61URDWetjFKRnhsqY7EPW4xXdrMWpn3UOrU5i92QDVp
	xnaefmwfCglrz2Zd7Y97Zvfn9obtIlmYU+Ia3lQy5p5U85vBNrEVyMXpyScG/dKTgFoERkmHpxI0/
	GE5/VXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79dX-00000006VPP-09gr;
	Tue, 22 Apr 2025 09:09:51 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78O4-00000006Ayq-37Dk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:49:50 +0000
Date: Tue, 22 Apr 2025 00:49:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745308183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hJqa98pwIripZZNEFlA5eT+l3rfPGm52BpjeBkKSrDI=;
	b=a/Zh9RU1U1TvV5VT3C4UdR1t+5WBAKj7kULzD9FlHh34TtMOJ29+lki5buWuabfemAfdZT
	0Aqyu9o7n8jvU5L2pKrHgz9R73Pa6B0nWFUEpPveQucLewVFUkGDG+JnCs4RBYQ9UuwHFC
	2AGzWW6ytzMX+MOSe7QooIzwHm2bqm4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <aAdKCGCuwlUeUXKY@linux.dev>
References: <Z-QU7qJOf8sEA5R8@google.com>
 <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com>
 <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com>
 <20250331145643.GF10839@nvidia.com>
 <Z_PtKWnMPzwPb4sp@google.com>
 <20250407161540.GG1557073@nvidia.com>
 <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_004949_071201_8C85D316 
X-CRM114-Status: GOOD (  27.70  )
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

Hi,

On Wed, Apr 16, 2025 at 08:51:05AM +0000, Ankit Agrawal wrote:
> Hi, summarizing the discussion so far and outlining the next steps. The key points
> are as follows:
> 1. KVM cap to expose whether the kernel supports mapping cacheable PFNMAP:
> If the host doesn't have FWB, then the capability doesn't exist. Jason, Oliver, Caitlin
> and Sean points that this may not be required as userspace do not have
> much choice anyways. KVM has to follow the PTEs and userspace cannot ask
> for something different. However, Marc points that enumerating FWB support
> would allow userspace to discover the support and prevent live-migration
> across FWB and non-FWB hosts. Jason suggested that this may still be fine as
> we have already built in VFIO side protection where a live migration can be
> attempted and then fail because of late-detected HW incompatibilities.
> 
> 2. New memslot flag that VMM passes at memslot registration:
> Discussion point that this is not necessary and KVM should just follow the
> VMA pgprot.
> 
> 3. Fallback path handling for PFNMAP when the FWB is not set:
> Discussion points that there shouldn't be any fallback path and the memslot
> should just fail. i.e. KVM should not allow degrading cachable to non-cachable
> when it can't do flushing. This is to prevent the potential security issue
> pointed by Jason (S1 cacheable, S2 noncacheable).
> 
> 
> So AIU, the next step is to send out the updated series with the following patches:
> 1. Block cacheable PFN map in memslot creation (kvm_arch_prepare_memory_region)
> and during fault handling (user_mem_abort()).

Yes, we need to prevent the creation of stage-2 mappings to PFNMAP memory
that uses cacheable attributes in the host stage-1. I believe we have alignment
that this is a bugfix.

> 2. Enable support for cacheable PFN maps if S2FWB is enabled by following
> the vma pgprot (this patch).
> 
> 3. Add and expose the new KVM cap to expose cacheable PFNMAP (set to false
> for !FWB), pending maintainers' feedback on the necessity of this capability.

Regarding UAPI: I'm still convinced that we need the VMM to buy in to this
behavior. And no, it doesn't matter if this is some VFIO-based mapping
or kernel-managed memory.

The reality is that userspace is an equal participant in remaining coherent with
the guest. Whether or not FWB is employed for a particular region of IPA
space is useful information for userspace deciding what it needs to do to access guest
memory. Ignoring the Nvidia widget for a second, userspace also needs to know this for
'normal', kernel-managed memory so it understands what CMOs may be necessary when (for
example) doing live migration of the VM.

So this KVM CAP needs to be paired with a memslot flag.

 - The capability says KVM is able to enforce Write-Back at stage-2

 - The memslot flag says userspace expects a particular GFN range to guarantee
   Write-Back semantics. This can be applied to 'normal', kernel-managed memory
   and PFNMAP thingies that have cacheable attributes at host stage-1.

 - Under no situation do we allow userspace to create non-cacheable mapping at
   stage-2 for something PFNMAP cacheable at stage-1.

No matter what, my understanding is that we all agree the driver which provided the
host stage-1 mapping is the authoritative source for memory attributes compatible
with a given device. The accompanying UAPI is necessary for the VMM to understand how
to handle arbitrary cacheable mappings provided to the VM.

Thanks,
Oliver

