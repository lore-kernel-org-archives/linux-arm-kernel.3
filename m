Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUsUAk654/jXjuhXihde+TbnoPl7UugYcG82O2lu13Y=; b=vg9VZM/YX7g22J8KAHPCI6BYKG
	OoC6X/3QBkJMfRSVQAvVQ+zFW5bz3qoxay3dRVP847xdo2yYhxYqafIPFMLQO2vJLGfEoC9PTlfrE
	nXlgM8oUOoCwr+61jFgotvLxBS0AU1VwnzRGthW6qJKtZVpbz7oqQdqYDIFKeZu8YWuwCtPuoK/RL
	mU8Tkr0EBkEKmVjMU3NdeW3WjAV4vJ/gbQLHiL+TcedQewUpRkWNxYsSj/IX/icz7PBRURuagT8gM
	jA/qeWj9ZVy/nI1UBCFmD6xpSZAxelbkNPTss8+jVuhioVFhBfMelLEyWVEo/QY6ZZ/Gh6qDd7lXg
	xHHbiiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYNX-0000000GD7p-3vCg;
	Thu, 16 Jan 2025 22:30:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYMF-0000000GCuu-15uL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:29:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA3F55C5AB0;
	Thu, 16 Jan 2025 22:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3862C4CED6;
	Thu, 16 Jan 2025 22:28:50 +0000 (UTC)
Date: Thu, 16 Jan 2025 22:28:48 +0000
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
Message-ID: <Z4mIIA5UuFcHNUwL@arm.com>
References: <20241118131958.4609-2-ankita@nvidia.com>
 <a2d95399-62ad-46d3-9e48-6fa90fd2c2f3@redhat.com>
 <20250106165159.GJ5556@nvidia.com>
 <f13622a2-6955-48d0-9793-fba6cea97a60@redhat.com>
 <SA1PR12MB7199E3C81FDC017820773DE0B01C2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250113162749.GN5556@nvidia.com>
 <0743193c-80a0-4ef8-9cd7-cb732f3761ab@redhat.com>
 <20250114133145.GA5556@nvidia.com>
 <SA1PR12MB71998E1E70F3A03D5E30DE40B0182@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250115143213.GQ5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115143213.GQ5556@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_142859_392124_E9B9A25B 
X-CRM114-Status: GOOD (  34.19  )
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

On Wed, Jan 15, 2025 at 10:32:13AM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 14, 2025 at 11:13:48PM +0000, Ankit Agrawal wrote:
> > > Do we really want another weirdly defined VMA flag? I'd really like to
> > > avoid this.. 
> > 
> > I'd let Catalin chime in on this. My take of the reason for his suggestion is
> > that we want to reduce the affected configs to only the NVIDIA grace based
> > systems. The nvgrace-gpu module would be setting the flag and the
> > new codepath will only be applicable there. Or am I missing something here?
> 
> We cannot add VMA flags that are not clearly defined. The rules for
> when the VMA creater should set the flag need to be extermely clear
> and well defined.
> 
> > > Can't we do a "this is a weird VM_PFNMAP thing, let's consult the VMA
> > > prot + whatever PFN information to find out if it is weird-device and
> > > how we could safely map it?"
> > 
> > My understanding was that the new suggested flag VM_FORCE_CACHED
> > was essentially to represent "whatever PFN information to find out if it is
> > weird-device". Is there an alternate reliable check to figure this out?
> 
> For instance FORCE_CACHED makes no sense, how will the VMA creator
> know it should set this flag?
> 
> > Currently in the patch we check the following. So Jason, is the suggestion that
> > we simply return error to forbid such condition if VM_PFNMAP is set?
> > +	else if (!mte_allowed && kvm_has_mte(kvm))
> 
> I really don't know enought about mte, but I would take the position
> that VM_PFNMAP does not support MTE, and maybe it is even any VMA
> without VM_MTE/_ALLOWED does not support MTE?
> 
> At least it makes alost more sense for the VMA creator to indicate
> positively that the underlying HW supports MTE.

Sorry, I didn't get the chance to properly read this thread. I'll try
tomorrow and next week.

Basically I don't care whether MTE is supported on such vma, I doubt
you'd want to enable MTE anyway. But the way MTE was designed in the Arm
architecture, prior to FEAT_MTE_PERM, it allows a guest to enable MTE at
Stage 1 when Stage 2 is Normal WB Cacheable. We have no idea what enable
MTE at Stage 1 means if the memory range doesn't support it. It could be
external aborts, SError or simply accessing data (as tags) at random
physical addresses that don't belong to the guest. So if a vma does not
have VM_MTE_ALLOWED, we either disable Stage 2 cacheable or allow it
with FEAT_MTE_PERM (patches from Aneesh on the list). Or, a bigger
happen, disable MTE in guests (well, not that big, not many platforms
supporting MTE, especially in the enterprise space).

A second problem, similar to relaxing to Normal NC we merged last year,
we can't tell what allowing Stage 2 cacheable means (SError etc). That's
why I thought this knowledge lies with the device, KVM doesn't have the
information. Checking vm_page_prot instead of a VM_* flag may work if
it's mapped in user space but this might not always be the case. I don't
see how VM_PFNMAP alone can tell us anything about the access properties
supported by a device address range. Either way, it's the driver setting
vm_page_prot or some VM_* flag. KVM has no clue, it's just a memory
slot.

A third aspect, more of a simplification when reasoning about this, was
to use FWB at Stage 2 to force cacheability and not care about cache
maintenance, especially when such range might be mapped both in user
space and in the guest.

-- 
Catalin

