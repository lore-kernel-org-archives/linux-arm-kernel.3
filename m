Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D8C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEhpfa7C7yS/4QgW58I/mknBa24icRiaeuepPgepQOs=; b=k3xmIZjUOS6EZWb59DisBkY0W8
	BTCIrRR9CJctYDYUcLXFIUDvyP2YwigDi17B/6EF8asoTR107Bg71xCtpQZs1uWkOwapLHwnyqFJk
	KLQxcNb1uZ/s/2ZKqJBdFv2FExZ4idbBNggaihmSdrt4B/XPdV9KrNM9C26ZUb8lr8npFw9/gY8Qm
	TwFJr+9evSonjY9Uy4prGg+0fRs0/hZopSx8NhcTYpbz7kFHa3oF4HxhnJZTw5uPS9chYf7n/3TQz
	zw1sMaXffof27AhMB4I/zWm9Dm3NcodOR88PX+g85Qcsx8vWCgf+uYp0AH4W2aL7C7E9rqC3cb1Y7
	xHsd4eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jai-00000008Lsf-2QSv;
	Tue, 22 Apr 2025 19:47:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GpW-00000007yG0-3ysD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3304B61126;
	Tue, 22 Apr 2025 16:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325B1C4CEE9;
	Tue, 22 Apr 2025 16:50:35 +0000 (UTC)
Date: Tue, 22 Apr 2025 17:50:32 +0100
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
Message-ID: <aAfI2GR1__-1KQHn@arm.com>
References: <Z-QnBcE1TKPChQay@google.com>
 <86wmcbllg2.wl-maz@kernel.org>
 <Z-RGYO3QVj5JNjRB@google.com>
 <20250331145643.GF10839@nvidia.com>
 <Z_PtKWnMPzwPb4sp@google.com>
 <20250407161540.GG1557073@nvidia.com>
 <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aAdKCGCuwlUeUXKY@linux.dev>
 <20250422135452.GL823903@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422135452.GL823903@nvidia.com>
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

On Tue, Apr 22, 2025 at 10:54:52AM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 22, 2025 at 12:49:28AM -0700, Oliver Upton wrote:
> >  - The memslot flag says userspace expects a particular GFN range to guarantee
> >    Write-Back semantics. This can be applied to 'normal', kernel-managed memory
> >    and PFNMAP thingies that have cacheable attributes at host stage-1.
> 
> Userspace doesn't actaully know if it has a cachable mapping from VFIO
> though :(

Yes, that's why I couldn't figure out how useful a memory slot flag
would be.

A CAP is definitely useful and some way of preventing migrating between
hosts with different capabilities for VM_PFNMAP is needed. However, I
think we only want to prevent migration _if_ there's a cacheable
VM_PFNMAP, otherwise KVM handles coherency via CMOs already.

So, for the above, the VMM needs to know that it somehow got into such
situation. If it knows the device (VFIO) capabilities and that the user
mapping is Cacheable, coupled with the new KVM CAP, it can infer that
Stage 2 will be S2FWB, no need for a memory slot flag. If it doesn't
have such information, maybe a new memory slot flag can be used to probe
what Stage 2 mapping is going to be: ask for KVM_MEM_PFNMAP_WB. If it
fails, Stage 2 is Device/NC and can attempt again with the WB flag.
It's a bit of a stretch for the KVM API but IIUC there's no option to
query the properties of a memory slot.

FWIW, I don't think we need a memory slot flag for host kernel managed
memory, its S2FWB already.

-- 
Catalin

