Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsrmQMiPRNQtLASMnp7wNKwahA5UqK6NJVAux3hx5Cg=; b=CTmZg9fFMGANPUNz4YVGC5PZZ2
	rHNcaoRCEx0NfMrJkTQb3r1BgbF1peLfAvnjTotZ4opt4Crx9NxnGRWebXiZA77Cyceo+9b14FwgW
	V8YsFNE5Ickq4m7SMPFKbK7ezHEdAcw57jJ39uxbQ4FRYw/jFsk0704O8kvumNJsIC8owfR9dxgcf
	XJlCV3LK3OCJC9cGJriJFEbFLuv/hpUMK+4hDITHXtSTl51b3AtTGrD/hD2xN2ubUG35zrEittk9N
	/crcktfT5EQPjrOxe+gN5I4d3UwTK28mEI7izOuEQa9IopdBJheUbiFzdRaaoB2bjc7vX1Vvos/i/
	mWj09VBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL10l-0000000Bi5K-0kMN;
	Tue, 10 Dec 2024 14:14:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0zh-0000000Bhtl-3bo1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF2B5A415CD;
	Tue, 10 Dec 2024 14:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2D2C4CED6;
	Tue, 10 Dec 2024 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733840024;
	bh=p1a7HwVIsBUxDg8oRarlZACVtkKI+wv6CArQotlXVmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ScFZexYJCgt6WvxjNXGB3iIshv5MbK12VwWs0RNL583DU7niUDPigVOfY7yoa3/j7
	 jGKzBvbGaWkSU7EFm2X0qPfbstIi4iKBDga7bJC0k9DWU3BazppUxr0LWaPMk+xnV+
	 rlYMQcmCO5VeCUkgLgxianbVXCIVXl65tIL1OWREDwLJpFaM5Stz0HxofjGwGB5X+o
	 yT3RQcemmJywxVjQ8F3OLIiwuAl2qtVRprlycljaqADLvtxXjgH3GeHsbNYgTmVzhb
	 IbJUmrWsLgl+k+bglmuJTHdPdx0mlfARHOzohz16FYOvVOYcmimzSppaIV4dfgGZNK
	 xIaVtrdVHGb7Q==
Date: Tue, 10 Dec 2024 14:13:35 +0000
From: Will Deacon <will@kernel.org>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
	acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
	danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <20241210141334.GD15607@willie-the-truck>
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241118131958.4609-2-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118131958.4609-2-ankita@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061346_027533_9D2C4F30 
X-CRM114-Status: GOOD (  31.81  )
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

On Mon, Nov 18, 2024 at 01:19:58PM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Currently KVM determines if a VMA is pointing at IO memory by checking
> pfn_is_map_memory(). However, the MM already gives us a way to tell what
> kind of memory it is by inspecting the VMA.
> 
> This patch solves the problems where it is possible for the kernel to
> have VMAs pointing at cachable memory without causing
> pfn_is_map_memory() to be true, eg DAX memremap cases and CXL/pre-CXL
> devices. This memory is now properly marked as cachable in KVM.
> 
> The pfn_is_map_memory() is restrictive and allows only for the memory
> that is added to the kernel to be marked as cacheable. In most cases
> the code needs to know if there is a struct page, or if the memory is
> in the kernel map and pfn_valid() is an appropriate API for this.
> Extend the umbrella with pfn_valid() to include memory with no struct
> pages for consideration to be mapped cacheable in stage 2. A !pfn_valid()
> implies that the memory is unsafe to be mapped as cacheable.
> 
> Moreover take account of the mapping type in the VMA to make a decision
> on the mapping. The VMA's pgprot is tested to determine the memory type
> with the following mapping:
>  pgprot_noncached    MT_DEVICE_nGnRnE   device (or Normal_NC)
>  pgprot_writecombine MT_NORMAL_NC       device (or Normal_NC)
>  pgprot_device       MT_DEVICE_nGnRE    device (or Normal_NC)
>  pgprot_tagged       MT_NORMAL_TAGGED   RAM / Normal
>  -                   MT_NORMAL          RAM / Normal
> 
> Also take care of the following two cases that prevents the memory to
> be safely mapped as cacheable:
> 1. The VMA pgprot have VM_IO set alongwith MT_NORMAL or
>    MT_NORMAL_TAGGED. Although unexpected and wrong, presence of such
>    configuration cannot be ruled out.
> 2. Configurations where VM_MTE_ALLOWED is not set and KVM_CAP_ARM_MTE
>    is enabled. Otherwise a malicious guest can enable MTE at stage 1
>    without the hypervisor being able to tell. This could cause external
>    aborts.
> 
> Introduce a new variable noncacheable to represent whether the memory
> should not be mapped as cacheable. The noncacheable as false implies
> the memory is safe to be mapped cacheable. Use this to handle the
> aforementioned potentially unsafe cases for cacheable mapping.
> 
> Note when FWB is not enabled, the kernel expects to trivially do
> cache management by flushing the memory by linearly converting a
> kvm_pte to phys_addr to a KVA, see kvm_flush_dcache_to_poc(). This is
> only possibile for struct page backed memory. Do not allow non-struct
> page memory to be cachable without FWB.
> 
> The device memory such as on the Grace Hopper systems is interchangeable
> with DDR memory and retains its properties. Allow executable faults
> on the memory determined as Normal cacheable.

Sorry, but a change this subtle to the arch code is going to need a _much_
better explanation than the rambling text above.

I also suspect that you're trying to do too many things in one patch.
In particular, the changes to execute permission handling absolutely
need to be discussed as a single patch in the series.

Please can you split this up in to a set of changes with useful commit
messages so that we can review them?

Jason knows how to do this so you could ask him for help if you're stuck.
Otherwise, there are plenty of examples of well-written commit messages
on the mailing list and in the git history.

Thanks,

Will

