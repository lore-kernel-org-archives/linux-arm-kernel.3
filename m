Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B22FEE4EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pew039JfZAlJjaElxpgJRZ+nNgjTgGGbktRpJh5x1cI=; b=0lgo58TrrGtEPKYoIUEtqu3rpO
	GDm7R4dVsGwY+/HFiFs+IATykY4xzFjw7VDqf5+VPbWHiDL+xXCGcf27IvULkJuqHYQlEq2LlI/D9
	ftlRIij9ca41SX3g6ASLpRp+DvOHK6Srt/Hw/5OBC1YgtmvZO+aY1oQeZfdEmQKivtU80TdVYqkzO
	QDnOUpORXva0+rUCH0ED28Yrhebr3u1yUi5uUnnN/5X/8xYAc6b1Gj+9949E4oYI4zAULtqZ4aly6
	9DI07bRp5+yG010nfCuOHf8wKj0KpAXYx0oijc9AEl5SQPjr4Eenj5OTf9twOhEJZrb2ER5ezxTP1
	/o7qqsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIKe-00000009mJn-2K9P;
	Sat, 28 Feb 2026 11:18:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIKd-00000009mJc-1htV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40C926001D;
	Sat, 28 Feb 2026 11:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22147C116D0;
	Sat, 28 Feb 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772277477;
	bh=jZWXF3FSqtf+aARQ2Sqm5G5WYHMhSQtLomtx/zb4iPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5i3/kOmW/i0sUqzxJ3FKLi2yeBskmRPGb6DY6Ec1H+TYDc/Qrhdr5WHM/I2q1WO0
	 Z7YdJeXtqkKmjW15QmTb1pbAicnNyXc8qgKFxFJ2v0wCr/p31kOfMGmtsw+MTJXnT7
	 50phJM1WxA+FvNNnksGF0NXwd2PY0vuPXebF0YEuH8ZqG3CQW4tDVyWQOmDc4/ZFcJ
	 MuaQHxrEtdTAE/GH/Xgm1Wy0nwf1+pP6K30ZENYjDjJKyWJckKf6wLEneM6BOgg7mz
	 6O4loYJhwm23/jqut/hEvS3Q6xIXrMak9UDUMMkfq1ux7Ca6bAz7EVS1XaedQg4Snz
	 irg8fkIn0Ezuw==
Date: Sat, 28 Feb 2026 13:17:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V1 09/16] arm64/mm: Route all pgtable reads via ptdesc_get()
Message-ID: <aaLO3yOu1ShO2tNz@kernel.org>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-10-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-10-anshuman.khandual@arm.com>
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

Hi Anshuman,

On Tue, Feb 24, 2026 at 10:41:46AM +0530, Anshuman Khandual wrote:
> Define arm64 platform specific implementations for new pXdp_get() helpers.
> These resolve into READ_ONCE(), thus ensuring required single copy atomic
> semantics for the page table entry reads.
> 
> In future this infrastructure can be used for D128 to maintain single copy
> atomicity semantics with inline asm blocks.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 257af1c3015d..804ef49aea88 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	arch_flush_lazy_mmu_mode();
>  }
>  
> +#define ptdesc_get(x)		READ_ONCE(x)

This will be confusing with 'struct ptdesc' APIs, maybe ptent_get()?

> +#define pmdp_get pmdp_get
> +static inline pmd_t pmdp_get(pmd_t *pmdp)
> +{
> +	return ptdesc_get(*pmdp);
> +}
> +
> +#define pudp_get pudp_get
> +static inline pud_t pudp_get(pud_t *pudp)
> +{
> +	return ptdesc_get(*pudp);
> +}
> +
> +#define p4dp_get p4dp_get
> +static inline p4d_t p4dp_get(p4d_t *p4dp)
> +{
> +	return ptdesc_get(*p4dp);
> +}
> +
> +#define pgdp_get pgdp_get
> +static inline pgd_t pgdp_get(pgd_t *pgdp)
> +{
> +	return ptdesc_get(*pgdp);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  
> @@ -384,7 +410,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>  
>  static inline pte_t __ptep_get(pte_t *ptep)
>  {
> -	return READ_ONCE(*ptep);
> +	return ptdesc_get(*ptep);
>  }
>  
>  extern void __sync_icache_dcache(pte_t pteval);
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

