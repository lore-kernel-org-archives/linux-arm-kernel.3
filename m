Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91356FF4940
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 04:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OntGkxRdMOJpBCC4Oh8YPUInGzQOIU95pTWj+sT/les=; b=Sn01Nc4w9uRdqCnME9g7i00qCO
	f/es9iXC7592TtL7UAiwxWTc/2zf+xt7C0Qjfey8vQ19xhrGsvYp0FJ0pSWuX1fm1JvTsoKFZJQBS
	mXNSS7Kbi0Nucr2QrXofpGpZbDTL0WM8yJVde6cRdOAqHNKW6K3deADi2jVl/taStM7JRzYePZ/su
	OW7fIjn9YW0Vh3EL28wFTWovhkq2RfR6xzVJxHFi4w7CzVJ1N+ZbPS6IF+WtHSNvNM85kwt8Xu4o8
	/PGYtDUFZ+UrxxZOUY8uDnJJQjCynr5q+rExvyhMoa0sZYb7Vs+T5sauNjQzH4uKJyAkoeuDsfmVC
	wBf9CacQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w74hH-0000000AcJ9-20sV;
	Mon, 30 Mar 2026 04:57:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w74hF-0000000AcIm-12Yj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 04:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A57931C2B;
	Sun, 29 Mar 2026 21:57:45 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 745763F915;
	Sun, 29 Mar 2026 21:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774846671; bh=QaLFBPGPcR9DUZ8VRQyMuGIuOhU4fJIFDEX7tp7QiuA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vV3xvxKG1nY/L7ne/t/EU5usEAdqjd/SQdX7SFtzF920hbTP5O3CQpdnNk02bR6r5
	 5GscpPsBhu2DvYGZ/Bfwo67cAB9SsdQqv2U35zpc9/oArHDaQ6iK/kmut+jkt9Bgvt
	 JkWREKPXgYOG8wfhQfgKTiWYWWk2jQToqOCi8iwY=
Message-ID: <849e40d3-f77b-45ba-bf03-744e8a306b2b@arm.com>
Date: Mon, 30 Mar 2026 10:27:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/30] KVM: arm64: Isolate mmap_read_lock inside new
 kvm_s2_fault_get_vma_info() helper
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-5-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-5-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_215753_443801_4C9933C8 
X-CRM114-Status: GOOD (  22.02  )
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



On 27/03/26 5:05 PM, Marc Zyngier wrote:
> From: Fuad Tabba <tabba@google.com>
> 
> Extract the VMA lookup and metadata snapshotting logic from
> kvm_s2_fault_pin_pfn() into a tightly-scoped sub-helper.
> 
> This refactoring structurally fixes a TOCTOU (Time-Of-Check to
> Time-Of-Use) vulnerability and Use-After-Free risk involving the vma
> pointer. In the previous layout, the mmap_read_lock is taken, the vma is
> looked up, and then the lock is dropped before the function continues to
> map the PFN. While an explicit vma = NULL safeguard was present, the vma
> variable was still lexically in scope for the remainder of the function.
> 
> By isolating the locked region into kvm_s2_fault_get_vma_info(), the vma
> pointer becomes a local variable strictly confined to that sub-helper.
> Because the pointer's scope literally ends when the sub-helper returns,
> it is not possible for the subsequent page fault logic in
> kvm_s2_fault_pin_pfn() to accidentally access the vanished VMA,
> eliminating this bug class by design.

Makes sense.

> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 5079a58b65b14..1f2c2200ccd8d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1740,7 +1740,7 @@ struct kvm_s2_fault {
>  	vm_flags_t vm_flags;
>  };
>  
> -static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
> +static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  {
>  	struct vm_area_struct *vma;
>  	struct kvm *kvm = fault->vcpu->kvm;
> @@ -1774,9 +1774,6 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  
>  	fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
>  
> -	/* Don't use the VMA after the unlock -- it may have vanished */
> -	vma = NULL;
> -
>  	/*
>  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
>  	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
> @@ -1788,6 +1785,17 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  	fault->mmu_seq = kvm->mmu_invalidate_seq;
>  	mmap_read_unlock(current->mm);
>  
> +	return 0;
> +}
> +
> +static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
> +{
> +	int ret;
> +
> +	ret = kvm_s2_fault_get_vma_info(fault);
> +	if (ret)
> +		return ret;
> +
>  	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
>  				       fault->write_fault ? FOLL_WRITE : 0,
>  				       &fault->writable, &fault->page);


