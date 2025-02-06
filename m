Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E652CC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf6yOcI/L1Rue2Wpuc/T35GQQ3sLAWy/sV2md2xNQ9M=; b=TzxkuPp2DAy+rY6MnSrCZ4f4QJ
	KeDKW6OytaOkfixDOEMXFTTiWL1UUQM4cw92QMWYSnRRdtE3uwbfXOrsWfh1D2bvGvazmU4O1xX28
	6dkhYL5lhCUdLhlGpUH48BEQFCTEb/ljh7lRH702mVB62zAehyMb/B7xZRHi4LwYgdNFzhw8kDfTK
	+M/Q/wpIhvjOTZHWcCvH9ERf+qZo6++Ej60PIowc7hdAJt4itlMx1mC1hm/FiSVT7B/fiu24FGd3M
	kAjR+ykVzmP9lwQjWcMVJAXv2Zr1az3C0QaUNdkkJdjqMEO8ToFmiFBJy+r4CATNFjO5/ruMNpEcO
	QTSxmIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfuEr-00000005FCj-23U8;
	Thu, 06 Feb 2025 05:15:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfuDS-00000005F8q-0rz7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 05:14:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D88401063;
	Wed,  5 Feb 2025 21:04:24 -0800 (PST)
Received: from [10.163.34.115] (unknown [10.163.34.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F04D3F63F;
	Wed,  5 Feb 2025 21:03:47 -0800 (PST)
Message-ID: <d8ef8240-e202-464c-ad16-1a34953cc872@arm.com>
Date: Thu, 6 Feb 2025 10:33:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/16] mm: hugetlb: Add huge page size param to
 huge_ptep_get_and_clear()
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, stable@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-2-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_211418_332363_82247CBD 
X-CRM114-Status: GOOD (  17.36  )
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



On 2/5/25 20:39, Ryan Roberts wrote:
> In order to fix a bug, arm64 needs to be told the size of the huge page
> for which the huge_pte is being set in huge_ptep_get_and_clear().
> Provide for this by adding an `unsigned long sz` parameter to the
> function. This follows the same pattern as huge_pte_clear() and
> set_huge_pte_at().
> 
> This commit makes the required interface modifications to the core mm as
> well as all arches that implement this function (arm64, loongarch, mips,
> parisc, powerpc, riscv, s390, sparc). The actual arm64 bug will be fixed
> in a separate commit.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/hugetlb.h     |  4 ++--
>  arch/arm64/mm/hugetlbpage.c          |  8 +++++---
>  arch/loongarch/include/asm/hugetlb.h |  6 ++++--
>  arch/mips/include/asm/hugetlb.h      |  6 ++++--
>  arch/parisc/include/asm/hugetlb.h    |  2 +-
>  arch/parisc/mm/hugetlbpage.c         |  2 +-
>  arch/powerpc/include/asm/hugetlb.h   |  6 ++++--
>  arch/riscv/include/asm/hugetlb.h     |  3 ++-
>  arch/riscv/mm/hugetlbpage.c          |  2 +-
>  arch/s390/include/asm/hugetlb.h      | 12 ++++++++----
>  arch/s390/mm/hugetlbpage.c           | 10 ++++++++--
>  arch/sparc/include/asm/hugetlb.h     |  2 +-
>  arch/sparc/mm/hugetlbpage.c          |  2 +-
>  include/asm-generic/hugetlb.h        |  2 +-
>  include/linux/hugetlb.h              |  4 +++-
>  mm/hugetlb.c                         |  4 ++--
>  16 files changed, 48 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index c6dff3e69539..03db9cb21ace 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -42,8 +42,8 @@ extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  				      unsigned long addr, pte_t *ptep,
>  				      pte_t pte, int dirty);
>  #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> -extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> -				     unsigned long addr, pte_t *ptep);
> +extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
> +				     pte_t *ptep, unsigned long sz);

If VMA could be passed instead of MM, the size of the huge page can
be derived via huge_page_size(hstate_vma(vma)) and another argument
here need not be added. Also MM can be derived from VMA if required.

