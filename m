Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A28C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/T920A32rbyZA6cdVFBZ76jV2OTCg7TneFl2r+1b4g=; b=Q8YSV9ouILKMg/t8RK0f86e3pu
	500S6attHY8ZJUfx5XVVSshoE/ZWOP0x9FLsJxbKOiuT3v9XHYJukvWt4agWoueUldYgFzhsywiC6
	hoYZGOO3II3ZZM/OlO728ftwYB7nGtzUzMwVC6grqvZlc2iG0H98h9C+uOWIAwWWtHtlH3+rR/8dQ
	nB+8wH4EgXuIDPUg+88Pd6YeG6Iw18SJQ+pFWyZ5zQBwT7Ttrdw+B3hJM+ZL9+CM97XtCdBE6pAxP
	fdX3aoaEzPnp9Sj/GxPGF06fR/DKyKnz4g64BB0E6vuFBxoP371gYlihlg2IhCogb6rR179HntNnI
	EPOaY1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuccs-00000006vNH-2iER;
	Tue, 18 Mar 2025 19:29:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucbB-00000006v9k-1vy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 19:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5CD45C4365;
	Tue, 18 Mar 2025 19:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8352C4CEEE;
	Tue, 18 Mar 2025 19:27:29 +0000 (UTC)
Date: Tue, 18 Mar 2025 19:27:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, Ankit Agrawal <ankita@nvidia.com>,
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
Message-ID: <Z9nJH38Em9XEx3U7@arm.com>
References: <861pv5p0c3.wl-maz@kernel.org>
 <SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <86r033olwv.wl-maz@kernel.org>
 <SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <87tt7y7j6r.wl-maz@kernel.org>
 <SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
 <8634fcnh0n.wl-maz@kernel.org>
 <Z9h98RhunemcFhhz@arm.com>
 <86wmcmn0dp.wl-maz@kernel.org>
 <20250318125527.GP9311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318125527.GP9311@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_122737_579755_4609F2C3 
X-CRM114-Status: GOOD (  32.96  )
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

On Tue, Mar 18, 2025 at 09:55:27AM -0300, Jason Gunthorpe wrote:
> On Tue, Mar 18, 2025 at 09:39:30AM +0000, Marc Zyngier wrote:
> > The memslot must also be created with a new flag ((2c) in the taxonomy
> > above) that carries the "Please map VM_PFNMAP VMAs as cacheable". This
> > flag is only allowed if (1) is valid.
> > 
> > This results in the following behaviours:
> > 
> > - If the VMM creates the memslot with the cacheable attribute without
> >   (1) being advertised, we fail.
> > 
> > - If the VMM creates the memslot without the cacheable attribute, we
> >   map as NC, as it is today.
> 
> Is that OK though?
> 
> Now we have the MM page tables mapping this memory as cachable but KVM
> and the guest is accessing it as non-cached.

I don't think we should allow this.

> I thought ARM tried hard to avoid creating such mismatches? This is
> why the pgprot flags were used to drive this, not an opt-in flag. To
> prevent userspace from forcing a mismatch.

We have the vma->vm_page_prot when the memslot is added, so we could use
this instead of additional KVM flags. If it's Normal Cacheable and the
platform does not support FWB, reject it. If the prot bits say
cacheable, it means that the driver was ok with such mapping. Some extra
checks for !MTE or MTE_PERM.

As additional safety, we could check this again in user_mem_abort() in
case the driver played with the vm_page_prot field in the meantime (e.g.
in the .fault() callback).

I'm not particularly keen on using the vm_page_prot but we probably need
to do this anyway to avoid aliases as we can't fully trust the VMM. The
alternative is a VM_* flag that says "cacheable everywhere" and we avoid
the low-level attributes checking.

> > What this doesn't do is *automatically* decide for the VMM what
> > attributes to use. The VMM must know what it is doing, and only
> > provide the memslot flag when appropriate. Doing otherwise may eat
> > your data and/or take the machine down (cacheable mapping on a device
> > can be great fun).
> 
> Again, this is why we followed the VMA flags. The thing creating the
> VMA already made this safety determination when it set pgprot
> cachable. We should not allow KVM to randomly make any PGPROT
> cachable!

Can this be moved to kvm_arch_prepare_memory_region() and maybe an
additional check in user_mem_abort()?

Thinking some more about a KVM capability that the VMM can check, I'm
not sure what it can do with this. The VMM simply maps something from a
device and cannot probe the cacheability - that's a property of the
device that's not usually exposed to user by the driver. The VMM just
passes this vma to KVM. As with the Normal NC, we tried to avoid
building device knowledge into the VMM (and ended up with
VM_ALLOW_ANY_UNCACHED since the VFIO driver did not allow such user
mapping and probably wasn't entirely safe either).

I assume with the cacheable pfn mapping, the whole range covered by the
vma is entirely safe to be mapped as such in user space.

-- 
Catalin

