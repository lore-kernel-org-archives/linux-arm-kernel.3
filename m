Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51634C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGUYPGJwOu+txVjkFezLPGRB5nEoRA1jL64Ruvx+kFM=; b=BrNemWYEdHmeBhIfyb7TKT6V2f
	qL1KZ48dpSHrx8PbM98huq61fyHYhewUPbdBQ4bI7nHTJ9N8xaYjUpxk8se5+/saXSH5gNU0aKSdA
	xCFCuuvhlbABt5lEX3B/SMj29IjR6L093Gv4RzIVmVwA4rVybhArVld9hArq3iS25ktMEUQzdq0fu
	bLfIocH8KZUNov6MzlgAB9Yw8WT61nm6NXueqr+WZwKE5CrgtXQCo9dPJPtD1HMoi9iVL6TikCp4R
	ziTsO/RJYX7PHVT6vbGPJXa2IPPBR+Mb0WIs4jQA5t8RfP5PNH4YzqNrZv1mvpTRnsefNTmnfiWM0
	RIVvI08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGZR-00000003rsT-326V;
	Mon, 17 Mar 2025 19:56:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGXk-00000003rha-3L6Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 19:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C29F5C54DA;
	Mon, 17 Mar 2025 19:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF56C4CEE3;
	Mon, 17 Mar 2025 19:54:27 +0000 (UTC)
Date: Mon, 17 Mar 2025 19:54:25 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
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
	"seanjc@google.com" <seanjc@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <Z9h98RhunemcFhhz@arm.com>
References: <20250310103008.3471-1-ankita@nvidia.com>
 <20250310103008.3471-2-ankita@nvidia.com>
 <861pv5p0c3.wl-maz@kernel.org>
 <SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <86r033olwv.wl-maz@kernel.org>
 <SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <87tt7y7j6r.wl-maz@kernel.org>
 <SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
 <8634fcnh0n.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8634fcnh0n.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_125436_944479_7ABB6CB1 
X-CRM114-Status: GOOD (  31.74  )
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

On Mon, Mar 17, 2025 at 09:27:52AM +0000, Marc Zyngier wrote:
> On Mon, 17 Mar 2025 05:55:55 +0000,
> Ankit Agrawal <ankita@nvidia.com> wrote:
> > 
> > >> For my education, what is an accepted way to communicate this? Please let
> > >> me know if there are any relevant examples that you may be aware of.
> > >
> > > A KVM capability is what is usually needed.
> > 
> > I see. If IIUC, this would involve a corresponding Qemu (usermode) change
> > to fetch the new KVM cap. Then it could fail in case the FWB is not
> > supported with some additional conditions (so that the currently supported
> > configs with !FWB won't break on usermode). 
> > 
> > The proposed code change is to map in S2 as NORMAL when vma flags
> > has VM_PFNMAP. However, Qemu cannot know that driver is mapping
> > with PFNMAP or not. So how may Qemu decide whether it is okay to
> > fail for !FWB or not?
> 
> This is not about FWB as far as userspace is concerned. This is about
> PFNMAP as non-device memory. If the host doesn't have FWB, then the
> "PFNMAP as non-device memory" capability doesn't exist, and userspace
> fails early.
> 
> Userspace must also have some knowledge of what device it obtains the
> mapping from, and whether that device requires some extra host
> capability to be assigned to the guest.
> 
> You can then check whether the VMA associated with the memslot is
> PFNMAP or not, if the memslot has been enabled for PFNMAP mappings
> (either globally or on a per-memslot basis, I don't really care).

Trying to page this back in, I think there are three stages:

1. A KVM cap that the VMM can use to check for non-device PFNMAP (or
   rather cacheable PFNMAP since we already support Normal NC).

2. Memslot registration - we need a way for the VMM to require such
   cacheable PFNMAP and for KVM to check. Current patch relies on (a)
   the stage 1 vma attributes which I'm not a fan of. An alternative I
   suggested was (b) a VM_FORCE_CACHEABLE vma flag, on the assumption
   that the vfio driver knows if it supports cacheable (it's a bit of a
   stretch trying to make this generic). Yet another option is (c) a
   KVM_MEM_CACHEABLE flag that the VMM passes at memslot registration.

3. user_mem_abort() - follows the above logic (whatever we decide),
   maybe with some extra check and WARN in case we got the logic wrong.

The problems in (2) are that we need to know that the device supports
cacheable mappings and we don't introduce additional issues or end up
with FWB on a PFNMAP that does not support cacheable. Without any vma
flag like the current VM_ALLOW_ANY_UNCACHED, the next best thing is
relying on the stage 1 attributes. But we don't know them at the memslot
registration, only later in step (3) after a GUP on the VMM address
space.

So in (2), when !FWB, we only want to reject VM_PFNMAP slots if we know
they are going to be mapped as cacheable. So we need this information
somehow, either from the vma->vm_flags or slot->flags.

-- 
Catalin

