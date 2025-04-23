Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD004C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jK4eLOZAO+NeR0mENoE8rBEEAUzeupCz2Uf9vs4VHm4=; b=3xLB4ATOV2Nf4nhpkks0SqMQMY
	gSrbr9A2C0hxYrtrpgz4a4pVG8x9d+BrSX819Cp+ZDkAQEYO3K6pls+unRQMTTWcDv3n+OoGGqgg8
	dq19BesZjWp0n9LPacl27N21g3SaeTcBv8CRUS0LypVI+9zij0HY4On/ZBUKNJhhHUn3psh+Vjo8S
	0rGAlOgbdeNxUPWNRr8qIjbarWkNrfjS+qF/cKrdEimlpnH/VKiErYYvGGnKJGxPmax+rPMzBvyIB
	SA8aKgx3xGmFEUlcGm0lGlDRCvdwkp3LQeumvr5c0l+zLY+EIo5DtCBZoFVDHtfjPD3kES4LXrJ4L
	KEmFLonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWH-0000000Ag3W-2UMZ;
	Wed, 23 Apr 2025 13:52:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZBu-0000000ATOp-1MMA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 12:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F4E8614C6;
	Wed, 23 Apr 2025 12:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679B1C4CEE2;
	Wed, 23 Apr 2025 12:26:54 +0000 (UTC)
Date: Wed, 23 Apr 2025 13:26:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Ankit Agrawal <ankita@nvidia.com>,
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
Message-ID: <aAjci3rddHt_R_x3@arm.com>
References: <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aAdKCGCuwlUeUXKY@linux.dev>
 <20250422135452.GL823903@nvidia.com>
 <aAfI2GR1__-1KQHn@arm.com>
 <20250422170324.GB1645809@nvidia.com>
 <aAgJ8g8Gbb06quSM@linux.dev>
 <20250422233556.GB1648741@nvidia.com>
 <aAjEsIwhYQpkphrW@arm.com>
 <20250423120243.GD1648741@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423120243.GD1648741@nvidia.com>
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

On Wed, Apr 23, 2025 at 09:02:43AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 23, 2025 at 11:45:04AM +0100, Catalin Marinas wrote:
> > On Tue, Apr 22, 2025 at 08:35:56PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Apr 22, 2025 at 02:28:18PM -0700, Oliver Upton wrote:
> > > > Wait, so userspace simultaneously doesn't know the cacheability at host
> > > > stage-1 but *does* for stage-2? 
> > > 
> > > No, it doesn't know either. The point is the VMM doesn't care about
> > > any of this. It just wants to connect KVM to VFIO and have the kernel
> > > internally negotiate the details of how that works.
> > > 
> > > There is zero value in the VMM being aware that KVM/VFIO is using
> > > cachable or non-cachable mappings because it will never touch this
> > > memory anyhow, and arguably it would be happier if it wasn't even in a
> > > VMA in the first place.
> > 
> > I think this was discussed at some point in the past - what about
> > ignoring the VMA altogether and using an fd-based approach? Keep the
> > current VFIO+vma ABI non-cacheable and introduce a new one for cacheable
> > I/O mappings, e.g. KVM_MEM_IOFD. Is there a way for VFIO to communicate
> > the attributes to KVM on the type of mapping in the absence of a VMA
> > (e.g. via the inode)? If not:
> 
> I hope to see that someday. The CC people are working in that
> direction, but we are still far from getting enough agreement from all
> the stakeholders on how that will work.
> 
> > Stage 2 could default to non-cacheable and we can add a
> > KVM_MEMORY_ATTRIBUTE_IO_WB as an option to
> 
> I don't think we should ever allow KVM to create a non-cachable
> mapping of an otherwise cachable object??

Ah, good point. So we want a strict cacheable mapping even if there is
no user/VMM mapping alias. Is it because KVM cannot do cache maintenance
on the PFNMAP or because the device does not support other memory types?
Both valid reasons though.

In this case KVM still needs to know the properties of the device. Not
sure how it could best do this without a vma.

-- 
Catalin

