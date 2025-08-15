Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faS9aKsYo+kMSuRXBtsCQxNAk1nb/xXS1Q3KueB93ek=; b=oIrs11H8tvfSroBdzZ3Xp3wduJ
	Lx95ADZtaudzgbiVQyCfOh2rCmGvXqtgGTgOudtaPrto+No54KYtwHB0zfaSyRv/uV/qW+dR4drm1
	2DPtpDBJ3mRddMCw4MPm6/ibwc1dtaD5dgpByahEkussz0nyaTxyLc90TdeVE1fWB0MVxN32pK/Tm
	YYluzstfIqUkRUvpvkpdbcPZEGYfvd0uRlu9+qhhXe0YkxORGLBe40dWvFAQ751weeGVSx5SlKV24
	j+11hWpEZlQ30xSlfxq/MOuxeUS9ULhySlDgwB/EdySEewuLj9pglSEwnEN5rWc1U18R+was3SeX+
	wn+/kGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwRB-00000002qlO-0S48;
	Fri, 15 Aug 2025 15:33:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umt6U-00000002Oz1-2uhf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 12:00:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3531691;
	Fri, 15 Aug 2025 05:00:05 -0700 (PDT)
Received: from [10.57.56.228] (unknown [10.57.56.228])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4A373F738;
	Fri, 15 Aug 2025 05:00:09 -0700 (PDT)
Message-ID: <34ce1000-8d15-4d7e-bf67-11e2bcd135a5@arm.com>
Date: Fri, 15 Aug 2025 14:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/mm: Update create_kpti_ng_temp_pgd() to handle
 pgtable_alloc failure
To: Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>, Joey Gouly <joey.gouly@arm.com>
References: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
 <20250813145607.1612234-3-chaitanyas.prakash@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250813145607.1612234-3-chaitanyas.prakash@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_050014_778586_86CBA07A 
X-CRM114-Status: GOOD (  17.06  )
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

On 13/08/2025 16:56, Chaitanya S Prakash wrote:
> create_kpti_ng_temp_pgd() was created as an alias for void returning
> __create_pgd_mapping_locked() and relied on pgtable_alloc() to BUG_ON()
> if an allocation failure occurred. But as __create_pgd_mapping_locked()
> has been updated as a part of the error propagation patch to return a
> non-void value, update create_kpti_ng_temp_pgd() to act as a wrapper
> around __create_pgd_mapping_locked() and BUG_ON() on ret being a non
> zero value.
>
> Signed-off-by: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
> ---
>  arch/arm64/mm/mmu.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index db7f45ef16574..19cbabceb38bd 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -76,6 +76,14 @@ EXPORT_SYMBOL(empty_zero_page);
>  static DEFINE_SPINLOCK(swapper_pgdir_lock);
>  static DEFINE_MUTEX(fixmap_lock);
>  
> +#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
> +void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys,
> +			     unsigned long virt, phys_addr_t size,
> +			     pgprot_t prot,
> +			     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +			     int flags);

I'm not sure I understand why we'd now need this declaration?

That function should really be declared in some header instead of the
strange declaration in cpufeature.c, but that's unrelated to this patch.

- Kevin

> +#endif
> +
>  void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>  {
>  	pgd_t *fixmap_pgdp;
> @@ -541,11 +549,17 @@ static void ___create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>  }
>  
>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
> -extern __alias(__create_pgd_mapping_locked)
>  void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>  			     phys_addr_t size, pgprot_t prot,
>  			     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> -			     int flags);
> +			     int flags)
> +{
> +	int ret = 0;
> +
> +	ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
> +					  pgtable_alloc, flags);
> +	BUG_ON(ret);
> +}
>  #endif
>  
>  static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm,

