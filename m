Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D50C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MsbxJW568Vs6cJJl21yFYb8yn4Yx1Tf2R8ZdaJM34A=; b=hytgVxfkY0hntSveV63IFuf0IZ
	8GsqzhO+3Lll7FotnCiNoIju7+HRSTxAn39fEKFZT2+cuKt3dq0PVIuJkjkUmuv7cT3bMOlbam1qP
	qe6X7iM7l20GBdfG/n47QjZHj14XIrofw4oPium3k17Ie1EyVnsAcHJTtiUScAfJy3r0WWohvXc7I
	V7LqS8UkEN5JZq3f8lxoQ2UemluFe2Eg3AdI7fuEpQXfxvj9y2iQnK7HBCMY0Xa6PadRqP8X8yyom
	ei2Cwu4NwwaU6aWtHfAE5jjdmwlfG7YWDXiO+u1qN/o0a6JnUygMOKlcG1HbF5csAmyG9k/QyDyMQ
	KgCshRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lin-00000009tYB-0af0;
	Tue, 29 Apr 2025 14:14:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kzQ-00000009mN6-3Hpm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECE3661568;
	Tue, 29 Apr 2025 13:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6EFC4CEE3;
	Tue, 29 Apr 2025 13:27:04 +0000 (UTC)
Date: Tue, 29 Apr 2025 14:27:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
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
Message-ID: <aBDTpu_ACoXAPoE2@arm.com>
References: <20250422135452.GL823903@nvidia.com>
 <aAfI2GR1__-1KQHn@arm.com>
 <20250422170324.GB1645809@nvidia.com>
 <aAgJ8g8Gbb06quSM@linux.dev>
 <20250422233556.GB1648741@nvidia.com>
 <aAjEsIwhYQpkphrW@arm.com>
 <20250423120243.GD1648741@nvidia.com>
 <aAjci3rddHt_R_x3@arm.com>
 <20250423130323.GE1648741@nvidia.com>
 <SA1PR12MB71996988916E1FB15149DD13B0802@SA1PR12MB7199.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR12MB71996988916E1FB15149DD13B0802@SA1PR12MB7199.namprd12.prod.outlook.com>
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

On Tue, Apr 29, 2025 at 10:47:58AM +0000, Ankit Agrawal wrote:
> >> In this case KVM still needs to know the properties of the device. Not
> >> sure how it could best do this without a vma.
> >
> > Well, the idea I hope to succeed with would annotate this kind of
> > information inside the page list that would be exchanged through the
> > FD.
> >
> > There is an monstrous thread here about this topic:
> >
> >
> >
> > https://lore.kernel.org/all/20250107142719.179636-1-yilun.xu@linux.intel.com/
> >
> > I can't find it in the huge thread but I did explain some thoughts on
> > how it could work
> >
> > Jason
> 
> Hi,
> 
> Based on the recent discussions, I gather that having a KVM_CAP
> to expose the support for cacheable PFNMAP to the VMM would be
> useful from VM migration point of view.
> 
> However it appears that the memslot flag isn't a must-have. The memslot
> flag cannot influence the KVM code anyways. For FWB, the PFNMAP would
> be cacheable and userspace should just assume S2FWB behavior; it would
> be a security bug otherwise as Jason pointed earlier (S1 cacheable,
> S2 noncacheable). For !FWB, a cacheable PFNMAP could not be allowed
> and VMM shouldn't attempt to create memslot at all by referring the cap.
> 
> Also, can we take the fd based communication path between VFIO
> and KVM separately?
> 
> I am planning to send out the series with the following implementation.
> Please let me know if there are any disagreements or concerns.
> 
> 1. Block cacheable PFN map in memslot creation (kvm_arch_prepare_memory_region)
> and during fault handling (user_mem_abort()).

I forgot the details here. I think it makes sense in general but as the
first patch, we currently block cacheable PFNMAP anyway. Probably what
you meant already but - this patch should block the PFNMAP slot if
there's a cacheable S1 alias.

> 2. Enable support for cacheable PFN maps if S2FWB is enabled by following
> the vma pgprot (this patch).
> 3. Add and expose the new KVM cap to expose cacheable PFNMAP (set to false
> for !FWB).

I'll defer the memslot flag decision to the KVM maintainers. If we had
one, it will enforce (2) or reject it as per (1) depending on the S1
attributes.

Without the memslot flag, I assume at least the VMM will have to enable
KVM_CAP_ARM_WB_PFNMAP (or whatever it will be called) to get the new
behaviour.

BTW, we should reject exec mappings as well (they probably fail for S1
VFIO since set_pte_at() will try to do cache maintenance).

-- 
Catalin

