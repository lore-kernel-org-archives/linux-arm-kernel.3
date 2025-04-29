Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83A2C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ8AnGaJFq1d/EGjbs2hpni0IcLnTMbT0aJoA8FUM9g=; b=H82eEHHsMOX2wNHQEeVXriUqku
	BRrN/J7LSwkoO7mALyNnbEApRwecYWftFWYz/SBZMFiyBM7KzqjGZ65tdlDjCcxAJqox/Jp90xr0p
	YTTb+tCOLJ7z71H1aGr/lQey5qpa3P381nMsR7yYDLWpfSq8accOdVlAKyM3UzT0dOLl9HEeE7snM
	81EL1tCPV0FrNVlE5J+AaDi1NY4K5zKFLA2eLUiWkv5rKEbkfOK8jVDZjC7L3cGHkq0L8cwAtZ2NE
	rQVds/i5H+sln5dqgE+rxWPOhhUXT916Vrw2mEDBSDYd6USJDyRwPTpPDDXb+GE4qlxDTnjX6xjZR
	gRasooOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qRF-0000000AdwQ-3Z7O;
	Tue, 29 Apr 2025 19:16:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pOy-0000000AUPA-1aRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76F9F6846F;
	Tue, 29 Apr 2025 18:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CB2C4CEEA;
	Tue, 29 Apr 2025 18:09:44 +0000 (UTC)
Date: Tue, 29 Apr 2025 19:09:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Ankit Agrawal <ankita@nvidia.com>,
	Oliver Upton <oliver.upton@linux.dev>,
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
Message-ID: <aBEV5gxYoDFct9PC@arm.com>
References: <20250422233556.GB1648741@nvidia.com>
 <aAjEsIwhYQpkphrW@arm.com>
 <20250423120243.GD1648741@nvidia.com>
 <aAjci3rddHt_R_x3@arm.com>
 <20250423130323.GE1648741@nvidia.com>
 <SA1PR12MB71996988916E1FB15149DD13B0802@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aBDTpu_ACoXAPoE2@arm.com>
 <20250429141437.GC2260709@nvidia.com>
 <aBD4RsUZp-BmcLwC@arm.com>
 <20250429164430.GD2260709@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429164430.GD2260709@nvidia.com>
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

On Tue, Apr 29, 2025 at 01:44:30PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 29, 2025 at 05:03:18PM +0100, Catalin Marinas wrote:
> > On Tue, Apr 29, 2025 at 11:14:37AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Apr 29, 2025 at 02:27:02PM +0100, Catalin Marinas wrote:
> > > > BTW, we should reject exec mappings as well (they probably fail for S1
> > > > VFIO since set_pte_at() will try to do cache maintenance).
> > > 
> > > To be clear the S2 should leave the mapping as execute allowed
> > > though. Only the VM knows how it will use this memory and VM's do
> > > actually execute out of the cachable PFNMAP VMA today. The VM will set
> > > any execute deny/allow on its S1 table according to how it uses the
> > > memory.
> > 
> > If S2 is executable, wouldn't KVM try to invalidate the I-cache and it
> > won't have an alias to do this? Unless it doesn't end up in
> > stage2_map_walker_try_leaf() or the walk has been flagged as skipping
> > the CMO.
> 
> Okay, that does seem to have been overlooked a bit. The answer I got
> back is:
> 
> Cachable PFNMAP is also relying on ARM64_HAS_CACHE_DIC also, simlar to
> how S2FWB allows KVM to avoid flushing the D cache, that CPU cap
> allows KVM to avoid flushing the icache and turns icache_inval_pou()
> into a NOP.

Another CAP for executable PFNMAP then? I feel like this is a different
use-case (e.g. more like general purpose CXL attached memory) than the
GPU one. Unless FWB implies CTR_EL0.DIC (AFAIK, it doesn't) we may be
restricting some CPUs.

-- 
Catalin

