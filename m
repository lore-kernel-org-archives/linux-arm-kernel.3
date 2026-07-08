Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573F2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2AT9xr1vEyQ54p+OXNl/EXreb4EIkVz492WmIMeztY=; b=HAA60+FfqeBNxinq/zMWPN1Ufy
	C4lQ+p3Zu7RBtwuyJUVppvwUxJwZfmSDMPoYvqhvn5KgoJIZ/p0daAsvtAWWeKx767NowB5syJxTc
	7YA85h0GwWDI1NhsJph9gGhUmStvy2CMVHWoHsPGJgbhBnHBhfKLX7ocb9U0QZDL+0mjrTZpKT/si
	eiDhDMcqX3uwhyOM9UbkQqN6mrSbfZn87inyXE0WxaNU6e1/rqFNv2uYdMM0jGSbRdnZ5VmhJfNIZ
	KEHB5YCBhE4UIFQFme/sJeiq065fMJL2KvW3qMUJEzw3Hw3bWVF2nNOscQTn4E8ZvMt07cM1Ug5ce
	qWsFSStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR8K-0000000H4Ex-3lln;
	Wed, 08 Jul 2026 12:12:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR8I-0000000H4EV-25fx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:12:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8995215A1;
	Wed,  8 Jul 2026 05:12:00 -0700 (PDT)
Received: from [10.1.37.27] (Suzukis-MBP.cambridge.arm.com [10.1.37.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B81CF3F7B4;
	Wed,  8 Jul 2026 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783512724; bh=8/7zvmWxegXEn2qwWzbLy+la1fhDjUolmn1c+tkuiCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VYLThK6nv7poE0WxqyAkkUzVattkhpNXgz0FB5kUhD63AtBVZyrisuMmv5M0CoESI
	 L6c2zVVqqGetqMAqNotIZPSb5x7ZJI/M+DkEmmj/SyrIe71mPHqJUlt3Lr8T1+qgXX
	 3+YkEUZClQkuG47VW0GuZxUiJRDmk0w4H31JziKU=
Message-ID: <79a41669-72f0-4068-9f38-62fb586d9180@arm.com>
Date: Wed, 8 Jul 2026 13:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
 Petr Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
 Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260701054926.825925-17-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051206_618201_A41EC710 
X-CRM114-Status: GOOD (  15.93  )
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

On 01/07/2026 06:49, Aneesh Kumar K.V (Arm) wrote:
> Teach dma_direct_map_phys() to select the DMA address encoding based on
> DMA_ATTR_CC_SHARED.
> 
> Use phys_to_dma_unencrypted() for decrypted mappings and
> phys_to_dma_encrypted() otherwise. If a device requires unencrypted DMA
> but the source physical address is still encrypted, force the mapping
> through swiotlb so the DMA address and backing memory attributes remain
> consistent.
> 
> Update the arm64, x86, s390 and powerpc secure-guest setup to not use
> swiotlb force option
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
> Changes from v3:
> * Handle DMA_ATTR_MMIO
> ---
>   arch/arm64/mm/init.c                 |  4 +--
>   arch/powerpc/platforms/pseries/svm.c |  2 +-
>   arch/s390/mm/init.c                  |  2 +-
>   arch/x86/kernel/pci-dma.c            |  4 +--
>   kernel/dma/direct.c                  |  4 ++-
>   kernel/dma/direct.h                  | 45 +++++++++++++++-------------
>   6 files changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 97987f850a33..acf67c7064db 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -338,10 +338,8 @@ void __init arch_mm_preinit(void)
>   	unsigned int flags = SWIOTLB_VERBOSE;
>   	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
>   
> -	if (is_realm_world()) {
> +	if (is_realm_world())
>   		swiotlb = true;
> -		flags |= SWIOTLB_FORCE;
> -	}
>   
>   	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
>   		/*


For arm64 CCA bits:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

