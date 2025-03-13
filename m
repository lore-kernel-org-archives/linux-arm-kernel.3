Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A5C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKDdhLrRqQqmBXwJq+Isl7Gv3VYa/Deps6YYhzlsmNE=; b=H0pMV7vWGiDCqElueHHghQIzRz
	zRZR0BWetpJD7Q+NcpHGJdrThd2URFUFygfu2C1XSmrpSrR+45k9CQYgnSnH/CUYmLcS3e0ZYnudr
	JiJ3yIbjv4eHwRKzg89zs7KMmIHsN8zPsHYaCqSNY221q+xrtW5rsi9hwdAwoSuEL/QfGlUIIaFyA
	Ioylz5+HtgfJhynvKMzDLp3mS7ahRjma8PFK89Jmy+ec1Vb+upIIyEAbg+EXgYctQ5P1qtx54wjnx
	AK8kmjZ+rXp2VgdHnHV0pXtB4EIUycMmCQ9Jhg81tixQwgaUJWvEqIlUn97kailullgp8balJyglH
	AJnpAxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYjN-00000009yT1-1vm2;
	Thu, 13 Mar 2025 02:55:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYhi-00000009yJr-1fnN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 02:53:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D24515A1;
	Wed, 12 Mar 2025 19:53:56 -0700 (PDT)
Received: from [10.162.40.25] (a077893.blr.arm.com [10.162.40.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03433F5A1;
	Wed, 12 Mar 2025 19:53:41 -0700 (PDT)
Message-ID: <34b8242b-529b-4ad5-ac17-e1200965ae1d@arm.com>
Date: Thu, 13 Mar 2025 08:23:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
To: Gavin Shan <gshan@redhat.com>, kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 qperret@google.com, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, shan.gavin@gmail.com
References: <20250311043718.91004-1-gshan@redhat.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250311043718.91004-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_195350_488577_BD9BE8FF 
X-CRM114-Status: GOOD (  15.09  )
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

On 3/11/25 10:07, Gavin Shan wrote:
> Drop sort_memblock_regions() and avoid sorting the copied memory
> regions to be ascending order on their base addresses, because the
> source memory regions should have been sorted correctly when they
> are added by memblock_add() or its variants.
> 
> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
> the hypervisor memblocks"). No functional changes intended.

Just wondering what prompted this change ?

> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  arch/arm64/kvm/pkvm.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 930b677eb9b0..d9c9174f89a1 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -10,7 +10,6 @@
>  #include <asm/kvm_mmu.h>
>  #include <linux/memblock.h>
>  #include <linux/mutex.h>
> -#include <linux/sort.h>
>  
>  #include <asm/kvm_pkvm.h>
>  
> @@ -24,23 +23,6 @@ static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
>  phys_addr_t hyp_mem_base;
>  phys_addr_t hyp_mem_size;
>  
> -static int cmp_hyp_memblock(const void *p1, const void *p2)
> -{
> -	const struct memblock_region *r1 = p1;
> -	const struct memblock_region *r2 = p2;
> -
> -	return r1->base < r2->base ? -1 : (r1->base > r2->base);
> -}
> -
> -static void __init sort_memblock_regions(void)
> -{
> -	sort(hyp_memory,
> -	     *hyp_memblock_nr_ptr,
> -	     sizeof(struct memblock_region),
> -	     cmp_hyp_memblock,
> -	     NULL);
> -}
> -
>  static int __init register_memblock_regions(void)
>  {
>  	struct memblock_region *reg;
> @@ -52,7 +34,6 @@ static int __init register_memblock_regions(void)
>  		hyp_memory[*hyp_memblock_nr_ptr] = *reg;
>  		(*hyp_memblock_nr_ptr)++;
>  	}
> -	sort_memblock_regions();
>  
>  	return 0;
>  }

