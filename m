Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axSv5eQmu0+CzEeU5AIUA3KSzkm385159mlYc9MVdbg=; b=d7J04fgtplJ+IIkUY0jlGG/ZwK
	3uN4kUKtN0nvjx6uQPIVYZqVX68upV7dM71P48yH3HUNAXpC5LSq8169lANyZ23rGlXTVI8WnHfij
	vCOFtNj1ySIjICmQE3qjD34IdBK9BXw3joS4eV7WU7AXOZasTOM8DjN19SZC8upbd4dlsp1XHoyNL
	dXOuk4oaoKV6oLLK0aYczn5rVOrtny7GIEt6yk/m7XkMxxMv983cvvKuHf3eLLE5PmehnNgFlnEK2
	xkfKFCZl5r81iDa5wHpprbaT6Ves+zvmOyxtxNi1/EJ152HU7pGnRpuubXhRnQzjmduUqhFDhcBbw
	FjI8bXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrTv-00000001Ap7-0iiI;
	Fri, 17 Jan 2025 18:54:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrSa-00000001ABe-2p1D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:52:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACEA6A4337F;
	Fri, 17 Jan 2025 18:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C46C4CEDD;
	Fri, 17 Jan 2025 18:52:41 +0000 (UTC)
Date: Fri, 17 Jan 2025 18:52:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Ankit Agrawal <ankita@nvidia.com>, David Hildenbrand <david@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
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
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <Z4qm95LRizWiBPpT@arm.com>
References: <20250106165159.GJ5556@nvidia.com>
 <f13622a2-6955-48d0-9793-fba6cea97a60@redhat.com>
 <SA1PR12MB7199E3C81FDC017820773DE0B01C2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250113162749.GN5556@nvidia.com>
 <0743193c-80a0-4ef8-9cd7-cb732f3761ab@redhat.com>
 <20250114133145.GA5556@nvidia.com>
 <SA1PR12MB71998E1E70F3A03D5E30DE40B0182@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250115143213.GQ5556@nvidia.com>
 <Z4mIIA5UuFcHNUwL@arm.com>
 <20250117140050.GC5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117140050.GC5556@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_105248_840365_1D9F5868 
X-CRM114-Status: GOOD (  30.34  )
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

On Fri, Jan 17, 2025 at 10:00:50AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 16, 2025 at 10:28:48PM +0000, Catalin Marinas wrote:
> > with FEAT_MTE_PERM (patches from Aneesh on the list). Or, a bigger
> > happen, disable MTE in guests (well, not that big, not many platforms
> > supporting MTE, especially in the enterprise space).
> 
> As above, it seems we already effectively disable MTE in guests to use
> VFIO.

That's fine. Once the NoTagAccess feature gets in, we could allow MTE
here as well.

> > A second problem, similar to relaxing to Normal NC we merged last year,
> > we can't tell what allowing Stage 2 cacheable means (SError etc).
> 
> That was a very different argument. On that series KVM was upgrading a
> VM with pgprot noncached to Normal NC, that upgrade was what triggered
> the discussions about SError.
> 
> For this case the VMA is already pgprot cache. KVM is not changing
> anything. The KVM S2 will have the same Normal NC memory type as the
> VMA has in the S1.  Thus KVM has no additional responsibility for
> safety here.

I agree this is safe. My point was more generic about not allowing
cacheable mappings without some sanity check. Ankit's patch relies on
the pgprot used on the S1 mapping to make this decision. Presumably the
pgprot is set by the host driver.

> > information. Checking vm_page_prot instead of a VM_* flag may work if
> > it's mapped in user space but this might not always be the case. 
> 
> For this series it is only about mapping VMAs. Some future FD based
> mapping for CC is going to also need similar metadata.. I have another
> thread about that :)

How soon would you need that and if you come up with a different
mechanism, shouldn't we unify them early rather than having two methods?

> > I don't see how VM_PFNMAP alone can tell us anything about the
> > access properties supported by a device address range. Either way,
> > it's the driver setting vm_page_prot or some VM_* flag. KVM has no
> > clue, it's just a memory slot.
> 
> I think David's point about VM_PFNMAP was to avoid some of the
> pfn_valid() logic. If we get VM_PFNMAP we just assume it is non-struct
> page and follow the VMA's pgprot.

Ah, ok, thanks for the clarification.

> > A third aspect, more of a simplification when reasoning about this, was
> > to use FWB at Stage 2 to force cacheability and not care about cache
> > maintenance, especially when such range might be mapped both in user
> > space and in the guest.
> 
> Yes, I thought we needed this anyhow as KVM can't cache invalidate
> non-struct page memory..

Looks good. I think Ankit should post a new series factoring out the
exec handling in a separate patch, dropping some of the pfn_valid()
assumptions and we take it from there.

I also think some sanity check should be done early in
kvm_arch_prepare_memory_region() like rejecting the slot if it's
cacheable and we don't have FWB. But I'll leave this decision to the KVM
maintainers. We are trying to relax some stuff here as well (see the
NoTagAccess thread).

-- 
Catalin

