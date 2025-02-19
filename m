Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03EAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgWjzKl8pOIbbfF7ognkhTAU1FOv85XsHUlTnOyLHVQ=; b=GqImEVUxvwrAJ09I+pgVXIEAXW
	JGWX7Kp2b8mcsoPDrpu0A+7PBNW7ld8BHlGNbLIvy3ZmhXrFkAigzzGhnxHXd8kfkb18AJyAhrO7m
	7+MIq0t0vwSoFE1lSORKwO5PA4tcKMt4ff0JAubDu3OexJAMwMwU0JnYm6A6OYaWw+gtkKPYSy7aP
	kBFMAI+8kudZMtVjDLVXiFmgAF0Ht3vapKLZYuElREnj7gtzcI8+ch4GyW2Lx6mQrCJs1lpuIl6PU
	kTpS9jI7clRnquouTxgpCDK5xxlIyKQttLXHb2bZN2I+YCLSVUbSFDCpvu7RzNJsr5XSduvz4OopM
	fdja4WwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgTF-0000000Btra-3l5B;
	Wed, 19 Feb 2025 09:34:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfsh-0000000BgT7-0XLq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:56:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 003F11682;
	Wed, 19 Feb 2025 00:56:53 -0800 (PST)
Received: from [10.162.42.6] (unknown [10.162.42.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF9A3F5A1;
	Wed, 19 Feb 2025 00:56:21 -0800 (PST)
Message-ID: <5fbfd74e-7f87-4f4f-86a7-7d4c38e0b4ba@arm.com>
Date: Wed, 19 Feb 2025 14:26:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: hugetlb: Fix flush_hugetlb_tlb_range()
 invalidation level
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Dev Jain <dev.jain@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-4-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250217140419.1702389-4-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_005635_287160_A26354CA 
X-CRM114-Status: GOOD (  19.00  )
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

On 2/17/25 19:34, Ryan Roberts wrote:
> commit c910f2b65518 ("arm64/mm: Update tlb invalidation routines for
> FEAT_LPA2") changed the "invalidation level unknown" hint from 0 to
> TLBI_TTL_UNKNOWN (INT_MAX). But the fallback "unknown level" path in
> flush_hugetlb_tlb_range() was not updated. So as it stands, when trying
> to invalidate CONT_PMD_SIZE or CONT_PTE_SIZE hugetlb mappings, we will
> spuriously try to invalidate at level 0 on LPA2-enabled systems.
> 
> Fix this so that the fallback passes TLBI_TTL_UNKNOWN, and while we are
> at it, explicitly use the correct stride and level for CONT_PMD_SIZE and
> CONT_PTE_SIZE, which should provide a minor optimization.
> 
> Cc: stable@vger.kernel.org
> Fixes: c910f2b65518 ("arm64/mm: Update tlb invalidation routines for FEAT_LPA2")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/include/asm/hugetlb.h | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index 03db9cb21ace..07fbf5bf85a7 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -76,12 +76,22 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>  {
>  	unsigned long stride = huge_page_size(hstate_vma(vma));
>  
> -	if (stride == PMD_SIZE)
> -		__flush_tlb_range(vma, start, end, stride, false, 2);
> -	else if (stride == PUD_SIZE)
> -		__flush_tlb_range(vma, start, end, stride, false, 1);
> -	else
> -		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 0);
> +	switch (stride) {
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	case PUD_SIZE:
> +		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
> +		break;
> +#endif
> +	case CONT_PMD_SIZE:
> +	case PMD_SIZE:
> +		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
> +		break;
> +	case CONT_PTE_SIZE:
> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
> +		break;
> +	default:
> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
> +	}
>  }
>  
>  #endif /* __ASM_HUGETLB_H */

