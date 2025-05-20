Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46D6C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5a/Q8wEP4zw51MtxkVc3tOcLDZ8Tf1yjAqEkNX3oyg=; b=ZRv8RiOpYQ6ckLzgjbENR7oOwm
	Ll90TxhrVG6qDLB7SaPlAjoSqDr19lpzV9n5xRgS8LXf65C/jLVL0+GTvQEmgodXrbphXZcdgWLOx
	rBk4v+F+orvQKMSNfJ1gYMRR8dwIlvIT9wlvqYuAnPTzP5zI9wFk/BlnRMeX/F9158be/Xpkg4sIG
	itWmeCwSYyXLhX3i7Dx/cbeXr2YMlAVUjL32xp/GrM3v6/G08u5znfUwD5RoJ2vjeewR6kT8ICeR9
	tqE2v2az0ZzPsFiQFWr0HaIxCDdQak83+UDS/PiTIHwA7ELJhAoBjsrc/4WpzIlNIP914slDAVryy
	eUpLxDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOWs-0000000DGZD-246X;
	Tue, 20 May 2025 15:05:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHORl-0000000DFmJ-3rZx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:00:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C92181516;
	Tue, 20 May 2025 07:59:47 -0700 (PDT)
Received: from [10.57.50.40] (unknown [10.57.50.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2722C3F6A8;
	Tue, 20 May 2025 07:59:58 -0700 (PDT)
Message-ID: <3103faef-1f02-47f9-b1ca-ec6af200773f@arm.com>
Date: Tue, 20 May 2025 15:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 29/43] arm64: RME: Always use 4k pages for realms
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-30-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250416134208.383984-30-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_080002_011955_0DE6E632 
X-CRM114-Status: GOOD (  20.58  )
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

On 16/04/2025 14:41, Steven Price wrote:
> Guest_memfd doesn't yet natively support huge pages, and there are
> currently difficulties for a VMM to manage huge pages efficiently so for
> now always split up mappings to PTE (4k).
> 
> The two issues that need progressing before supporting huge pages for
> realms are:
> 
>   1. guest_memfd needs to be able to allocate from an appropriate
>      allocator which can provide huge pages.
> 
>   2. The VMM needs to be able to repurpose private memory for a shared
>      mapping when the guest VM requests memory is transitioned. Because
>      this can happen at a 4k granularity it isn't possible to
>      free/reallocate while huge pages are in use. Allowing the VMM to
>      mmap() the shared portion of a huge page would allow the huge page
>      to be recreated when the memory is unshared and made protected again.
> 
> These two issues are not specific to realms and don't affect the realm
> API, so for now just break everything down to 4k pages in the RMM
> controlled stage 2. Future work can add huge page support without
> changing the uAPI.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

With comments from Gavin addressed,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
> Changes since v7:
>   * Rewritten commit message
> ---
>   arch/arm64/kvm/mmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 02b66ee35426..29bab7a46033 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1653,6 +1653,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active || is_protected_kvm_enabled()) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (vcpu_is_rec(vcpu)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;
>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}


