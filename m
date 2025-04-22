Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D64C369DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooGcU85uLmvlzkjhi9UMrJ/GcNbNjtlDBh2b9XJHwJc=; b=1cRbK9mUFXIan85e4cJGjPyZOP
	osOwuznkmNaIPsytiNLIb7rqFnjOpR3RnhyJGdRfhKCohw0ySyvFD4VsotKQLdZO7cqfpkl4yivfS
	oUZG+Dq6SZWNp/cf6HIUElShppGp5DXjLuQvLRXVBipiiEqcMqL6LgL0Jnc26P1aFCgTFe8LTEEL/
	x7JaH1xYKTZ9ZXtYf982UtR3RIvsldjZToXNq3pUFD5/andzzYO/n/nheTX/LynqCLt+T6EtLMFBt
	sWw7hLy3MHVFi+UlLdCsne2E2bvZaNP03BbZUyHSdkztpnccJY0RqK7xC6CpT6xm60ds0apvgqrZM
	fZJxoqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8c-000000085eL-1Un6;
	Tue, 22 Apr 2025 18:14:30 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ezh-00000007Zj6-3GIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:53:07 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7394792f83cso4046043b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745333584; x=1745938384; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooGcU85uLmvlzkjhi9UMrJ/GcNbNjtlDBh2b9XJHwJc=;
        b=PP/7hsOv5UpA+u1/KZTH7z159Rs05LXI13T5P750fZJctQ0Hl0/JEXGMligNuoZ7d2
         uwmICfHnfvfKpfr2+/HDPGrerw2YbL/wgxDfgoiSeBGlgIh4bhBDxqRkOX2QiMpb57PP
         jqPN/Upjmmt7dFP3QW/XT8RQYB4/SsasXU+nw3kfx5VUqPhHy4Natec4vZhXQuo+25a6
         kO0c5DxV9FiW5UZh7P2QkkH+bAr/aHuASJK90X7Km52nxRK0dRuo1zdRL3FZu64Z6fZs
         jQTwV0uhAkq0nzfTJOYla2AESMpj7dqITuUYBWwF/ejj6JBowOxnBli2Z1mlQvrf3pQ7
         ChaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333584; x=1745938384;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooGcU85uLmvlzkjhi9UMrJ/GcNbNjtlDBh2b9XJHwJc=;
        b=jf474nDXdwFxO7y+8eUwW5AWjS7Yd9A+fKBPbBH8XV1BTZ4oSBX45AAscO99nARtGK
         YDHCWRSEe4yT+pXLgGeLHXOfDWkwfwJjCUagPR2CYKx2XDdOKac/VzkTUCjaqz+sx9Jn
         4oGFTxx6jjW5DiTyL30e9wUKQVLCG/MwjXS7y6kOszVuD9wl9BfGm3pR32HYsdP14pJy
         lYrpXUWyDWj6Bn030ayOk/tzBUFJk4zN/ZOQEvoO/XcQ9hdZQfDfgUmcLodNwKfB2APj
         h8DvsPQE1L2XTf6aL18kpnAtDyg9nhhPnCp7UEErlcf2heft9psO5TxR0pcdlZNmDA3i
         oWLw==
X-Forwarded-Encrypted: i=1; AJvYcCUoswSyvJqoBknjZL3BbApjErnnbTOoaYS/ogOSsagbgIJnVBCjut2LKcGEKNZA77H5IQWDhulsLmLSC2buf6GJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhk0b70N0Ucbl0S+aWhQ/+SZQuFaL/uWDTH5ZBqgOEMqijG1bL
	wZMITVcgJOy/5x9fUEv4GXkHtyfAxWGwtPhl/BvEkxmTdTnjxQgdFds8LQHmFLPvNuaQWQ5RZDm
	g+A==
X-Google-Smtp-Source: AGHT+IEx25gCkpttQgdXEdRCmM9tOpB/Y3lOr09cr6TIRqh2wKfoCLxMxZ/On7rEEuVhXVHqBKJaHk715hw=
X-Received: from pfbfc7.prod.google.com ([2002:a05:6a00:2e07:b0:736:9c55:9272])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:888:b0:736:5544:7ad7
 with SMTP id d2e1a72fcca58-73dc14e8128mr18167922b3a.14.1745333584127; Tue, 22
 Apr 2025 07:53:04 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:53:02 -0700
In-Reply-To: <aAdKCGCuwlUeUXKY@linux.dev>
Mime-Version: 1.0
References: <86y0wrlrxt.wl-maz@kernel.org> <Z-QnBcE1TKPChQay@google.com>
 <86wmcbllg2.wl-maz@kernel.org> <Z-RGYO3QVj5JNjRB@google.com>
 <20250331145643.GF10839@nvidia.com> <Z_PtKWnMPzwPb4sp@google.com>
 <20250407161540.GG1557073@nvidia.com> <Z_QAxiEWEyMpfLgL@google.com>
 <SA1PR12MB719976799AD7F9FC4407A5A9B0BD2@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aAdKCGCuwlUeUXKY@linux.dev>
Message-ID: <aAetTj1U4BWSmqQV@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"will@kernel.org" <will@kernel.org>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"shahuang@redhat.com" <shahuang@redhat.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"david@redhat.com" <david@redhat.com>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, 
	Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, 
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, 
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>, 
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
	"ardb@kernel.org" <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com" <tabba@google.com>, 
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_075305_818193_97851430 
X-CRM114-Status: GOOD (  38.33  )
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

On Tue, Apr 22, 2025, Oliver Upton wrote:
> Hi,
> 
> On Wed, Apr 16, 2025 at 08:51:05AM +0000, Ankit Agrawal wrote:
> > Hi, summarizing the discussion so far and outlining the next steps. The key points
> > are as follows:
> > 1. KVM cap to expose whether the kernel supports mapping cacheable PFNMAP:
> > If the host doesn't have FWB, then the capability doesn't exist. Jason, Oliver, Caitlin
> > and Sean points that this may not be required as userspace do not have
> > much choice anyways. KVM has to follow the PTEs and userspace cannot ask
> > for something different. However, Marc points that enumerating FWB support
> > would allow userspace to discover the support and prevent live-migration
> > across FWB and non-FWB hosts. Jason suggested that this may still be fine as
> > we have already built in VFIO side protection where a live migration can be
> > attempted and then fail because of late-detected HW incompatibilities.
> > 
> > 2. New memslot flag that VMM passes at memslot registration:
> > Discussion point that this is not necessary and KVM should just follow the
> > VMA pgprot.
> > 
> > 3. Fallback path handling for PFNMAP when the FWB is not set:
> > Discussion points that there shouldn't be any fallback path and the memslot
> > should just fail. i.e. KVM should not allow degrading cachable to non-cachable
> > when it can't do flushing. This is to prevent the potential security issue
> > pointed by Jason (S1 cacheable, S2 noncacheable).
> > 
> > 
> > So AIU, the next step is to send out the updated series with the following patches:
> > 1. Block cacheable PFN map in memslot creation (kvm_arch_prepare_memory_region)
> > and during fault handling (user_mem_abort()).
> 
> Yes, we need to prevent the creation of stage-2 mappings to PFNMAP memory
> that uses cacheable attributes in the host stage-1. I believe we have alignment
> that this is a bugfix.
> 
> > 2. Enable support for cacheable PFN maps if S2FWB is enabled by following
> > the vma pgprot (this patch).
> > 
> > 3. Add and expose the new KVM cap to expose cacheable PFNMAP (set to false
> > for !FWB), pending maintainers' feedback on the necessity of this capability.
> 
> Regarding UAPI: I'm still convinced that we need the VMM to buy in to this
> behavior. And no, it doesn't matter if this is some VFIO-based mapping
> or kernel-managed memory.
> 
> The reality is that userspace is an equal participant in remaining coherent with
> the guest. Whether or not FWB is employed for a particular region of IPA
> space is useful information for userspace deciding what it needs to do to access guest
> memory. Ignoring the Nvidia widget for a second, userspace also needs to know this for
> 'normal', kernel-managed memory so it understands what CMOs may be necessary when (for
> example) doing live migration of the VM.
> 
> So this KVM CAP needs to be paired with a memslot flag.
>
>  - The capability says KVM is able to enforce Write-Back at stage-2
> 
>  - The memslot flag says userspace expects a particular GFN range to guarantee
>    Write-Back semantics. This can be applied to 'normal', kernel-managed memory
>    and PFNMAP thingies that have cacheable attributes at host stage-1.

I am very strongly opposed to adding a memslot flag.  IMO, it sets a terrible
precedent, and I am struggling to understand why a per-VM CAP isn't sufficient
protection for the VMM.

>  - Under no situation do we allow userspace to create non-cacheable mapping at
>    stage-2 for something PFNMAP cacheable at stage-1.
> 
> No matter what, my understanding is that we all agree the driver which provided the
> host stage-1 mapping is the authoritative source for memory attributes compatible
> with a given device. The accompanying UAPI is necessary for the VMM to understand how
> to handle arbitrary cacheable mappings provided to the VM.
> 
> Thanks,
> Oliver

