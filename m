Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B56C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr1cPFt1ocI87tcXWWTIGTy3VVDZtRQqFIo86Zh/iAA=; b=yzFT58hYJjO3ow0vW2OjiuTkuy
	gDxf6gRH8T5uH2MT74KYvT5ErfK9XCf12QjUClVlDZ3gHqGaj1zecIN8j8B5RVfco9ydm9YabEFeK
	apgzNJv/PUgAH4RuXg8ACv1SyeMuCnXHIGLkmyQjQ+R31XupmvYSrTt085zDbQBD+z39JQz9K7lRQ
	TF/tM4UbMMaZ6ao5/9klNucpcHXiL/C2riXESRJ3SSo4z3KV/BBUe4gCVCDjg+GSEqRa3Q2cSeJqf
	knbcmlUNYJHVuZtRd9z7pMK5gSihqXXZL0avrxc4FocvsW+kExehNlE7yZdytxECR2W/5D4Rdg3D8
	in8lNWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjD1-0000000Ewtf-0027;
	Fri, 04 Jul 2025 16:24:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXito-0000000EuAy-2x31
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C185360054;
	Fri,  4 Jul 2025 16:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEA0C4CEE3;
	Fri,  4 Jul 2025 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751645067;
	bh=M9n2Q9cXb3bGzai3G9o0+Afu6gYoxXbovRVunTPC6tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tU7+z4FYuh0BVlLIvRisojhalfOl91C0FNBPhC7Xq/ur/19ujU8uZOP8Vfh8ft/IP
	 xpkCMrVGdW0UecnEOmcxvvOVaIaJcbjHzaXOk4kKRES5AWDiQlWSpwh+bzY8ekCaU1
	 SvjjRnmpl6Lg9d3THr39a6aVD1vWHi80o/RncyG8r4Sp8QDOpxwkTejBQZkgO14bRu
	 QeI+oVIOyPMxQgXaAnVDt5Imhl+RXCVBz2xEbZqVJ305jUvyoPMCdSjlFB0oSZf+Pd
	 nQ8HOlRj9225heyBvWv2GBkEhbb/lHmFZaFEDIctjblBDGohhg4Fk+3zdwuHCQstFe
	 0BmXU07FbmmFQ==
Date: Fri, 4 Jul 2025 17:04:17 +0100
From: Will Deacon <will@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
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
	"tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [PATCH v9 3/6] KVM: arm64: Block cacheable PFNMAP mapping
Message-ID: <aGf7gfMjLhrqU5Kv@willie-the-truck>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-4-ankita@nvidia.com>
 <aF6hamOI7YVDP1Cp@willie-the-truck>
 <SA1PR12MB7199144BBDA23C9A06DA12F9B046A@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250630122501.GQ167785@nvidia.com>
 <4b06b163-e1ce-4c20-b878-4593bc86bf53@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b06b163-e1ce-4c20-b878-4593bc86bf53@redhat.com>
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

On Fri, Jul 04, 2025 at 02:21:32PM +0200, David Hildenbrand wrote:
> On 30.06.25 14:25, Jason Gunthorpe wrote:
> > On Mon, Jun 30, 2025 at 01:56:43AM +0000, Ankit Agrawal wrote:
> > > > Sorry for the drive-by comment, but I was looking at this old series from
> > > > Paolo (look at the cover letter and patch 5):
> > > > 
> > > > https://lore.kernel.org/r/20250109133817.314401-1-pbonzini@redhat.com
> > > > 
> > > > in which he points out that the arm64 get_vma_page_shift() function
> > > > incorrectly assumes that a VM_PFNMAP VMA is physically contiguous, which
> > > > may not be the case if a driver calls remap_pfn_range() to mess around
> > > > with mappings within the VMA. I think that implies that the optimisation
> > > > in 2aa53d68cee6 ("KVM: arm64: Try stage2 block mapping for host device
> > > > MMIO") is unsound.
> > > 
> > > Hm yeah, that does seem problematic. Perhaps we need a new
> > > vma flag that could help the driver communicate to the KVM that the
> > > mapping is contiguous and it can go ahead with the optimization?
> > > E.g. something similar to VM_ALLOW_ANY_UNCACHED.
> > 
> > I think Paolo has the right direction - remove any attempts by KVM to
> > expand contiguity, it should only copy the primary's PTEs and rely on
> > the primary to discover contiguity. No new flags.
> 
> 100%

The part I don't understand, however, is that I can't see an MMU notifier
anywhere on the successful remap_pfn_range() path. So if a driver is
using that interface to change the mapping properties of a VM_PFNMAP VMA,
how do we ensure that the guest doesn't use whatever stale mappings it's
faulted in previously? Did I just miss something?

Will

