Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4092BC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcpGawQ/TblX5RHXCmOdSiCrP4Rv/3YnfhBf7so7XIA=; b=Sn6Ip/mbeFFBRZAsVugZVz87Hl
	LCcMRJ9QjoymH0Oki7OPLc0vCcjUnyg00fSLjOlLef5Xiz3Fb6hGxmU/72Pbbv5pT55jkJZLbSrqr
	VocUa79ADLlNgdFLw4JhS5tVb0RGiFfM0TJaSalRBh86w+vJLQs9jC/ca1H9tYOlFghRc+KhuB9Qt
	cmpviSfUadzIHx15AUY3RBYQ+m6C93e5Pf/ALpD4eZJ0e5ghK4Pj2XCXtgkr4yiqNqZEOAD+2GZZJ
	WZbsub6vv+2tG4TvtReDCEd7TrPFc3xSC36LcXBDTmlugEKyu5TLgC4/So6cGl4QcQ8kPFljPFzFN
	yw2Fv8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IOB-00000007X5j-1o7T;
	Wed, 23 Sep 2026 08:31:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IO4-00000007X36-2zjI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:31:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09A0C1655;
	Wed, 23 Sep 2026 01:31:28 -0700 (PDT)
Received: from [10.0.138.135] (XHFQ2J9959-5.cambridge.arm.com [10.0.138.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B43753F86C;
	Wed, 23 Sep 2026 01:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790152291; bh=uo/YQJ9Ixi6nxB3CeTrx+DkpZlwIfhyjjyUZRUsJGvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ILKJZuuKIEuzmuevKqKO4tOS30td5XpGCkCczw00msIJ1M68Pm2su8zMpXlopRKtq
	 uO92e8JU8rn3U2M+muQPsaL6hrrjejHKeBhqQGZnHztXAU4EKE14nCDGLtMFyqT3Sf
	 nAHVmD4U/JKqIVNq3KlgE1+TBT5qqNmtP3stWqns=
Message-ID: <a2365246-53a4-41e6-a655-6813f913cc1f@arm.com>
Date: Wed, 23 Sep 2026 09:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] arm64/mm: Use pgdp_get() for PGD accesses
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260922061638.3967467-1-anshuman.khandual@arm.com>
 <20260922061638.3967467-5-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260922061638.3967467-5-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013132_844359_235D9844 
X-CRM114-Status: GOOD (  22.83  )
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

On 22/09/2026 07:16, Anshuman Khandual wrote:
> Replace READ_ONCE() with pgdp_get() for PGD accesses in preparation for
> supporting both D64 and D128 translation table formats.
> 
> READ_ONCE() cannot currently be used for 128-bit page table entries on
> arm64 because it does not provide the required 128-bit single-copy
> atomicity, causing builds to fail for accesses wider than 64 bits.
> 
> Although LDP/STP provide the required atomicity when FEAT_LSE is
> available (as required by FEAT_D128), extending READ_ONCE() to support
> 128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
> so doing so could encourage other 128-bit users that would either fail
> to build in configurations without D128 support or, if D128 becomes a
> runtime option, silently permit tearing on systems without the required
> hardware support.
> 
> Instead, standardize PGD accesses on the existing page-table helpers.
> These can be overridden on arm64 to provide 128-bit single-copy
> atomicity when required. No functional change intended.

I notice you have unconverted READ_ONCE(*pgdp) in:

 - p4d_offset_phys()
 - p4d_offset()

Is that intentional?

Thanks,
Ryan


> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kasan-dev@googlegroups.com
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/fault.c       | 2 +-
>  arch/arm64/mm/hugetlbpage.c | 2 +-
>  arch/arm64/mm/kasan_init.c  | 6 +++---
>  arch/arm64/mm/mmu.c         | 6 +++---
>  arch/arm64/mm/pageattr.c    | 2 +-
>  arch/arm64/mm/trans_pgd.c   | 4 ++--
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index a6afd8929a10..43f25418275a 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -160,7 +160,7 @@ static void show_pte(unsigned long addr)
>  	guard(irqsave)();
>  
>  	pgdp = pgd_offset(mm, addr);
> -	pgd = READ_ONCE(*pgdp);
> +	pgd = pgdp_get(pgdp);
>  	ptval_to_str(pxd_str, pgd_val(pgd));
>  	pr_alert("[%016lx] pgd=%s", addr, pxd_str);
>  
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 5771bf49e1fe..e05e5b41ae50 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -284,7 +284,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>  	pmd_t *pmdp, pmd;
>  
>  	pgdp = pgd_offset(mm, addr);
> -	if (!pgd_present(READ_ONCE(*pgdp)))
> +	if (!pgd_present(pgdp_get(pgdp)))
>  		return NULL;
>  
>  	p4dp = p4d_offset(pgdp, addr);
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 4dd8c1186471..f61f5bc09467 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -102,7 +102,7 @@ static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node,
>  static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr, int node,
>  				      bool early)
>  {
> -	if (pgd_none(READ_ONCE(*pgdp))) {
> +	if (pgd_none(pgdp_get(pgdp))) {
>  		phys_addr_t p4d_phys = early ?
>  				__pa_symbol(kasan_early_shadow_p4d)
>  					: kasan_alloc_zeroed_page(node);
> @@ -256,7 +256,7 @@ static int __init root_level_idx(u64 addr)
>  static void __init clone_next_level(u64 addr, pgd_t *tmp_pg_dir, pud_t *pud)
>  {
>  	int idx = root_level_idx(addr);
> -	pgd_t pgd = READ_ONCE(swapper_pg_dir[idx]);
> +	pgd_t pgd = pgdp_get(swapper_pg_dir + idx);
>  	pud_t *pudp = (pud_t *)__phys_to_kimg(__pgd_to_phys(pgd));
>  
>  	memcpy(pud, pudp, PAGE_SIZE);
> @@ -280,7 +280,7 @@ static int __init next_level_idx(u64 addr)
>   */
>  static void __init clear_next_level(int pgd_idx, int start, int end)
>  {
> -	pgd_t pgd = READ_ONCE(swapper_pg_dir[pgd_idx]);
> +	pgd_t pgd = pgdp_get(swapper_pg_dir + pgd_idx);
>  	pud_t *pudp = (pud_t *)__phys_to_kimg(__pgd_to_phys(pgd));
>  
>  	memset(&pudp[start], 0, (end - start) * sizeof(pud_t));
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 83709d987e7c..76d8d320aeed 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -434,7 +434,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  {
>  	int ret;
>  	unsigned long next;
> -	pgd_t pgd = READ_ONCE(*pgdp);
> +	pgd_t pgd = pgdp_get(pgdp);
>  	p4d_t *p4dp;
>  
>  	if (pgd_none(pgd)) {
> @@ -1649,7 +1649,7 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		pgdp = pgd_offset_k(addr);
> -		pgd = READ_ONCE(*pgdp);
> +		pgd = pgdp_get(pgdp);
>  		if (pgd_none(pgd))
>  			continue;
>  
> @@ -1827,7 +1827,7 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		pgdp = pgd_offset_k(addr);
> -		pgd = READ_ONCE(*pgdp);
> +		pgd = pgdp_get(pgdp);
>  		if (pgd_none(pgd))
>  			continue;
>  
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 826856ef64a8..dfa1356daac2 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -399,7 +399,7 @@ bool kernel_page_present(struct page *page)
>  	unsigned long addr = (unsigned long)page_address(page);
>  
>  	pgdp = pgd_offset_k(addr);
> -	if (pgd_none(READ_ONCE(*pgdp)))
> +	if (pgd_none(pgdp_get(pgdp)))
>  		return false;
>  
>  	p4dp = p4d_offset(pgdp, addr);
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 7afe2beca4ba..06470d690f9f 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -134,7 +134,7 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
>  	unsigned long next;
>  	unsigned long addr = start;
>  
> -	if (pgd_none(READ_ONCE(*dst_pgdp))) {
> +	if (pgd_none(pgdp_get(dst_pgdp))) {
>  		dst_p4dp = trans_alloc(info);
>  		if (!dst_p4dp)
>  			return -ENOMEM;
> @@ -164,7 +164,7 @@ static int copy_page_tables(struct trans_pgd_info *info, pgd_t *dst_pgdp,
>  	dst_pgdp = pgd_offset_pgd(dst_pgdp, start);
>  	do {
>  		next = pgd_addr_end(addr, end);
> -		if (pgd_none(READ_ONCE(*src_pgdp)))
> +		if (pgd_none(pgdp_get(src_pgdp)))
>  			continue;
>  		if (copy_p4d(info, dst_pgdp, src_pgdp, addr, next))
>  			return -ENOMEM;


