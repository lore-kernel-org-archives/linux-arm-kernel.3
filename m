Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ED2E8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zERQGDkpzo19ryIESqEexWtJlPeGhsgatD8vZJknrhU=; b=UDh0e63XHL9LpjelAkr++O+KLa
	SHIZJh4SLi9zf4d8GXk+rWnjdSUdOszl4+7YxDoLGa6dzX4DPGqkYzs/IMfjZ7cGK6G5W0ZDUZXDa
	ytG9XnSFoPqPejwsk3fs45PieZyPji2Tl25b9s/PFt6EtPtKhCaEQwarqTUSZy1wXd8KqQIOGQDLS
	v90UbdOHZd2h+X+aw+Gpzi7eXKjlDKakz9CJ9AVpTeEDY+hUY6jKTnhXatB2SwPh8yqLea9682kdo
	FuP02dziwI3957vAtZ9KfwGnV2gtNCi1cF6Xgxm22hcvYCagS17AKYiZPe26+0bNA6L+/XGo0lJVS
	PI9TvwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKy8-000000077NI-3Pca;
	Tue, 03 Feb 2026 18:17:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKy6-000000077MQ-0Xg8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:17:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9A69339;
	Tue,  3 Feb 2026 10:17:31 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAA573F740;
	Tue,  3 Feb 2026 10:17:36 -0800 (PST)
Date: Tue, 3 Feb 2026 18:17:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlbpage: avoid unused-but-set-parameter
 warning (gcc-16)
Message-ID: <aYI7vUJKWVmzz5Yi@arm.com>
References: <20260203162147.2103175-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203162147.2103175-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_101742_211084_AF9F0FDD 
X-CRM114-Status: GOOD (  20.89  )
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

On Tue, Feb 03, 2026 at 05:21:23PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-16 warns about an instance that older compilers did not:
> 
> arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
> arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]
> 
> The issue here is that __pte_clear() does not actually use its second
> argument when CONFIG_ARM64_CONTPTE is disabled.
> 
> Reword this to compute the offset each time instead of updating the
> argument variable. I checked that the resulting object code is
> unchanged.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/mm/hugetlbpage.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a42c05cf5640..4ad7662e8323 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -374,8 +374,8 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  
>  	ncontig = num_contig_ptes(sz, &pgsize);
>  
> -	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
> -		__pte_clear(mm, addr, ptep);
> +	for (i = 0; i < ncontig; i++, ptep++)
> +		__pte_clear(mm, addr + pgsize*i, ptep);

Should we not fix the macro instead? Either with a (void)(addr) or just
turn it into an inline function (still compiling):

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 64d5f1d9cce9..c248b033a472 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -179,8 +179,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))

 #define pte_none(pte)		(!pte_val(pte))
-#define __pte_clear(mm, addr, ptep) \
-				__set_pte(ptep, __pte(0))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))

 /*
@@ -1320,6 +1318,12 @@ static inline bool pud_user_accessible_page(pud_t pud)
 /*
  * Atomic pte/pmd modifications.
  */
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
+{
+	__set_pte(ptep, __pte(0));
+}
+
 static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 					      unsigned long address,
 					      pte_t *ptep)


