Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A81CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7lthe9+wre5awWCYoJIttXe0wAvE4ktNNeStpXQATs=; b=OJdSd5PV7AyXhwHY7Nzt86xdw6
	pHFpciOqAl9NZWyeveS67XD86h3TiH6fVP3UiQr8fGURdkERORORx07bx+xKf8o/nX/yCmaKzvEt4
	xjkAtXpcGOuK5YlkRYP4h97Qh2oEl6won7y7n4xazGXB1sHgBQ1qGsG6ZYKZAKUCjANMjXuOd7ONY
	hwjQRN0Jsfa328UkhNE486/wRSiFmMW35sRjZpJ9SgFpnmhsnR3HuFUxZVP3w0qSxD9xefiZVVkO5
	/Ethqd/2MAKYAl4mECDLobNYG6iEb0nvsHWyil5sAqOyp87ikg+YXoBurMp7QR2eDymUy5sYJV8q4
	NirLCC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVABl-0000000Evoc-09MB;
	Fri, 27 Jun 2025 14:36:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9SY-0000000EpCp-1BD2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FA8944075;
	Fri, 27 Jun 2025 13:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F9DC4CEE3;
	Fri, 27 Jun 2025 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751032181;
	bh=x75YqVVzzS7TCKzUXIRVofETxdXNt/UoDPIixGWr9DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tXym3Q84Zf5oFf0O8EIrMHuqj8aZsOo5LS+tasIcYOyNV1khV4muUgzsIgJhypT36
	 LLxDOmfCdp6MIbkQDAnE1hcu7PbIR0VP7FdZsnBfmnQ4Xqo4NYv9iCMS08w1+bVDxr
	 yuNxbf2j+dHfJpPSA04KrChBV4Xn62IrSg945Ia0hLhO41fapaoHJmX0IRs+2u4NE3
	 cPAv+OaowQcbaQgJc6Phkf8ZvLtmgvSK8UUmB7GNUOFN5pzKsefuYrgYP6vpfXqV4m
	 OpPp7UlHxPHT7TfN1DGpsNUCACNbloluxbWOaIHkZNQ2pQWlTwp1s9gZXE54ndx3mT
	 v5m+3RqiBEbpA==
Date: Fri, 27 Jun 2025 14:49:30 +0100
From: Will Deacon <will@kernel.org>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, ryan.roberts@arm.com, shahuang@redhat.com,
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
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn,
	pbonzini@redhat.com
Subject: Re: [PATCH v9 3/6] KVM: arm64: Block cacheable PFNMAP mapping
Message-ID: <aF6hamOI7YVDP1Cp@willie-the-truck>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-4-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621042111.3992-4-ankita@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_064942_360208_90A68B61 
X-CRM114-Status: GOOD (  17.07  )
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

On Sat, Jun 21, 2025 at 04:21:08AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Fixes a security bug due to mismatched attributes between S1 and
> S2 mapping.
> 
> Currently, it is possible for a region to be cacheable in the userspace
> VMA, but mapped non cached in S2. This creates a potential issue where
> the VMM may sanitize cacheable memory across VMs using cacheable stores,
> ensuring it is zeroed. However, if KVM subsequently assigns this memory
> to a VM as uncached, the VM could end up accessing stale, non-zeroed data
> from a previous VM, leading to unintended data exposure. This is a security
> risk.
> 
> Block such mismatch attributes case by returning EINVAL when userspace
> try to map PFNMAP cacheable. Only allow NORMAL_NC and DEVICE_*.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Sean Christopherson <seanjc@google.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  arch/arm64/kvm/mmu.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)

Sorry for the drive-by comment, but I was looking at this old series from
Paolo (look at the cover letter and patch 5):

https://lore.kernel.org/r/20250109133817.314401-1-pbonzini@redhat.com

in which he points out that the arm64 get_vma_page_shift() function
incorrectly assumes that a VM_PFNMAP VMA is physically contiguous, which
may not be the case if a driver calls remap_pfn_range() to mess around
with mappings within the VMA. I think that implies that the optimisation
in 2aa53d68cee6 ("KVM: arm64: Try stage2 block mapping for host device
MMIO") is unsound.

But it got me thinking -- given that remap_pfn_range() also takes a 'prot'
argument, how do we ensure that this is reflected in the guest? It feels
a bit dodgy to rely on drivers always passing 'vma->vm_page_prot'.

Will

