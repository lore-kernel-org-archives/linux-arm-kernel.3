Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8102606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inKPopJU;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hl0e9+IB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQyDvfX7kGhNcVt2WJOUsbR6Xr7YV1OMvJOHBnTjnZQ=; b=inKPopJU8DJVEHWeazmmXswGdA
	+vZPXtMST+VHXcz+R+jrEnXoAfj2PXeo74XYh+AEE1MFhsJkYxUXnnwrEwSUdk16TEHsBE5oyf6gd
	kNExNjHZXMGUjHvuVKshG+TA2yw7kEd5U9h95kBR5LPyBaOEzsIM4iWYinJoChCvKYSiI4EIyULB4
	ukbyOHohTxSK01xqHb92rx/a8eFIyD+8EJlEGRyDM/pefgtYpMMg8lhBmLrZ7gHNrLV63eX0ei5Du
	nRoL7AKetne9mbZVhaVDxjEvVFKYeWvMnz7GGqN3rFuDDqRxTL77Um+TbkvRwWQBSRHtf5Zv2KdBJ
	L5+eF1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJB3c-00000009yfb-1AZV;
	Tue, 20 Oct 2026 14:43:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJB3a-00000009yef-1HVx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:43:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55CB716F8;
	Tue, 20 Oct 2026 07:43:08 -0700 (PDT)
Received: from [10.57.15.218] (unknown [10.57.15.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2899E3F7D8;
	Tue, 20 Oct 2026 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792507391; bh=W/Yikr956noee/xLRWy1f51hzGlzHc+4smIokQpB9Lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hl0e9+IBBWp9E+x72oIanT99AIWv1ndjtvX6GN8kI19JG/d+AuHI3PqRQ6e/X8css
	 q2rfFAxHAiCe+WVgV0zQ7cavUxeKYacxdjD4wKMQCTYTDjc7z9R2PIBTMT/nPPcGNM
	 cjqHRZXreBywaD0rBmQJWQJQ4FvcTFVYuTnS+1mI=
Message-ID: <16679dd3-c168-4dee-bb9d-da9b0e3416cf@arm.com>
Date: Tue, 20 Oct 2026 15:43:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH kvmtool] arm64: THPs for systems with pages bigger than 4K
To: Vincent Donnefort <vdonnefort@google.com>, will@kernel.org,
 julien.thierry.kdev@gmail.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org,
 oliver.upton@linux.dev, alexandru.elisei@arm.com, andre.przywara@arm.com
References: <20261019145949.1922019-1-vdonnefort@google.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261019145949.1922019-1-vdonnefort@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_074314_545516_EDD78178 
X-CRM114-Status: GOOD (  22.70  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 15:59, Vincent Donnefort wrote:
> The THP support imposes an alignment of the memslot userspace address to
> the size of a THP (PMD_SIZE). To do so, kvmtool overallocates the RAM
> size and aligns it. However it assumes PMD_SIZE is 2MiB, which is only
> true on 4KiB page systems.
> 
> Use a huge-page size, based on the system page size. This value can be
> massive for a 64KiB page system, so skip the alignment if we couldn't
> even install one THP.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arm64/kvm.c b/arm64/kvm.c
> index 36b3284e4a92..2c01dc32fa9a 100644
> --- a/arm64/kvm.c
> +++ b/arm64/kvm.c
> @@ -18,6 +18,8 @@
>   
>   #include <asm/image.h>
>   
> +#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))
> +
>   static struct arm64_image_header *kernel_header;
>   
>   struct kvm_ext kvm_req_ext[] = {
> @@ -35,20 +37,23 @@ bool kvm__arch_cpu_supports_vm(void)
>   
>   void kvm__init_ram(struct kvm *kvm)
>   {
> -	u64 phys_start, phys_size;
> +	u64 phys_start, phys_size, ram_alloc_align = SZ_64K;
>   	void *host_mem;
>   	int err;
>   
>   	/*
> -	 * Allocate guest memory. We must align our buffer to 64K to
> -	 * correlate with the maximum guest page size for virtio-mmio.
> -	 * If using THP, then our minimal alignment becomes 2M.
> -	 * 2M trumps 64K, so let's go with that.
> +	 * Allocate guest memory. We must align our buffer to 64K to correlate
> +	 * with the maximum guest page size for virtio-mmio. If using THP, then
> +	 * our minimal alignment trumps 64K, so let's go with that.
>   	 */
>   	kvm->ram_size = kvm->cfg.ram_size;
>   	kvm->arch.ram_alloc_size = kvm->ram_size;
> -	if (!kvm->cfg.hugetlbfs_path)
> -		kvm->arch.ram_alloc_size += SZ_2M;
> +	if (!kvm->cfg.hugetlbfs_path) {
> +		if (kvm->ram_size >= HUGEPAGE_SIZE)
> +			ram_alloc_align = HUGEPAGE_SIZE;

There is logic in builtin-run.c to detect the host_ram_size(), could we
use that instead to decide if we should apply this alignment ? Or retry
the RAM allocation without the alignment on failure ?

It doesn't look like a good idea to hard code this based just on the
requested RAM size.

Cheers
Suzuki



> +
> +		kvm->arch.ram_alloc_size += ram_alloc_align;
> +	}
>   
>   	if (kvm->cfg.arch.guest_memfd)
>   		kvm->arch.ram_alloc_start = mmap_guest_memfd(kvm,
> @@ -63,7 +68,7 @@ void kvm__init_ram(struct kvm *kvm)
>   		    kvm->arch.ram_alloc_size, errno);
>   
>   	kvm->ram_start = (void *)ALIGN((unsigned long)kvm->arch.ram_alloc_start,
> -					SZ_2M);
> +					ram_alloc_align);
>   
>   	if (!kvm->cfg.arch.guest_memfd) {
>   		madvise(kvm->arch.ram_alloc_start, kvm->arch.ram_alloc_size,
> 
> base-commit: f67bc0bdae9433a9cfd05e65ea2c1bb6102566d9


