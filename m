Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBEFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17Id6VP9a11ew7nsIEtgkI+fX37+Yb/3do5T9EXtClc=; b=djh+vLyA3Lj9HLo8uom2F1swLX
	X6E2OgrcxXck/e+ZP5y2xZ0rdatNl5u43f9FHBp+6isj+CXgBU8gkzcFkg9Azv9SPQ9xjVgbJKaFy
	M2JHTeRbKDWcBwmNQgiaicUTdbjFauXvH9zHnuhW2i4M2YyRZhO2rt0pU2bEC+OhRWa8VRhoHM8ne
	3aW5kBN5esd90Rh1ONLzTtWV+O9rsJ8PQ/AWk/T9/nenv8UqLiUwK1s0bH3VlO6TsW7KM054gv870
	Tj4NfAC2iJYPFb2vvTrdc4rsBV18axcX1YG/enbG8CdzjXJO5PU/APR7c3mHMn+iHh7arTLOzZ1OA
	LypcBBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yim-0000000AP4t-3yme;
	Wed, 23 Apr 2025 11:56:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XbP-0000000ADXe-0wx1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0E1FA4B1E9;
	Wed, 23 Apr 2025 10:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2A3C4CEE2;
	Wed, 23 Apr 2025 10:45:06 +0000 (UTC)
Date: Wed, 23 Apr 2025 11:45:04 +0100
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
Message-ID: <aAjEsIwhYQpkphrW@arm.com>
References: <Z_PtKWnMPzwPb4sp@google.com>
 <20250407161540.GG1557073@nvidia.com>
 <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aAdKCGCuwlUeUXKY@linux.dev>
 <20250422135452.GL823903@nvidia.com>
 <aAfI2GR1__-1KQHn@arm.com>
 <20250422170324.GB1645809@nvidia.com>
 <aAgJ8g8Gbb06quSM@linux.dev>
 <20250422233556.GB1648741@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422233556.GB1648741@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_034515_414777_722365B9 
X-CRM114-Status: GOOD (  19.82  )
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

On Tue, Apr 22, 2025 at 08:35:56PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 22, 2025 at 02:28:18PM -0700, Oliver Upton wrote:
> > Wait, so userspace simultaneously doesn't know the cacheability at host
> > stage-1 but *does* for stage-2? 
> 
> No, it doesn't know either. The point is the VMM doesn't care about
> any of this. It just wants to connect KVM to VFIO and have the kernel
> internally negotiate the details of how that works.
> 
> There is zero value in the VMM being aware that KVM/VFIO is using
> cachable or non-cachable mappings because it will never touch this
> memory anyhow, and arguably it would be happier if it wasn't even in a
> VMA in the first place.

I think this was discussed at some point in the past - what about
ignoring the VMA altogether and using an fd-based approach? Keep the
current VFIO+vma ABI non-cacheable and introduce a new one for cacheable
I/O mappings, e.g. KVM_MEM_IOFD. Is there a way for VFIO to communicate
the attributes to KVM on the type of mapping in the absence of a VMA
(e.g. via the inode)? If not:

Stage 2 could default to non-cacheable and we can add a
KVM_MEMORY_ATTRIBUTE_IO_WB as an option to
ioctl(KVM_SET_MEMORY_ATTRIBUTES) (setup requiring two ioctls). The
latter could fail if S2FWB is not available. But I agree, it does mean
building knowledge of the device in the VMM (it might not be that bad).

-- 
Catalin

