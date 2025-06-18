Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A0C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsJj5T+MDejKqzMwax9mn3jJcqivsRMM/7vUYa9OLh4=; b=kfLJmCKkRh3e8y2Db85ijvEkGf
	jDhwPvLyCgFDsUGzCmMuDkrt7pKKQWMZqhTAZVDeW9U7XSZx5AgLeXEBiuaIaOqvDYmPSJIhK3M4f
	WPcV49idJ/9/D1eJHu1bvDRG+PSU86kF9Au5IZ57JMzWsMvlV5/m1u1ymA0lbm3tsRkc9szlLBFFT
	5i6dhoMjV+/5riU8OAaE7X30O7KYj2ERxvrzq6hlaryQ5xqxHTs8NK3UB2hWD3G+754G5NW+lNLv4
	DOiVjspfDEhAXgPFPVmPQlk0p04g6auqAgcviCLyaiZNOTVQjeeOMjqGLkyonKBWPBYBOcRljiI07
	tNemAsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwUP-0000000AqTn-2XcB;
	Wed, 18 Jun 2025 17:22:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvOW-0000000AhJ7-2Pih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 16:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0D5261F1E;
	Wed, 18 Jun 2025 16:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8885C4CEE7;
	Wed, 18 Jun 2025 16:12:04 +0000 (UTC)
Date: Wed, 18 Jun 2025 17:12:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, david@redhat.com, ddutile@redhat.com,
	seanjc@google.com, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com,
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com,
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
	alex.williamson@redhat.com, sebastianene@google.com,
	coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
	ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
	linux-mm@kvack.org, tabba@google.com, qperret@google.com,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Subject: Re: [PATCH v7 3/5] KVM: arm64: New function to determine hardware
 cache management support
Message-ID: <aFLlUtKdy7yZLV4c@arm.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-4-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065541.50049-4-ankita@nvidia.com>
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

On Wed, Jun 18, 2025 at 06:55:39AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> VM_PFNMAP VMA's are allowed to contain PTE's which point to physical
> addresses that does not have a struct page and may not be in the kernel
> direct map.
> 
> However ARM64 KVM relies on a simple conversion from physaddr to a
> kernel virtual address when it does cache maintenance as the CMO
> instructions work on virtual addresses. This simple approach does not
> work for physical addresses from VM_PFNMAP since those addresses may
> not have a kernel virtual address, or it may be difficult to find it.
> 
> Fortunately if the ARM64 CPU has two features, S2FWB and CACHE DIC,
> then KVM no longer needs to do cache flushing and NOP's all the
> CMOs. This has the effect of no longer requiring a KVA for addresses
> mapped into the S2.
> 
> Add a new function, kvm_arch_supports_cacheable_pfnmap(), to report
> this capability. From a core prespective it means the arch can accept
> a cachable VM_PFNMAP as a memslot. From an ARM64 perspective it means
> that no KVA is required.
> 
> CC: Jason Gunthorpe <jgg@nvidia.com>
> CC: David Hildenbrand <david@redhat.com>
> CC: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

