Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A830CD29C32
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC7XA/MARGvKJ3ISG5mIeYett0pmou4aKSG7eK9igqc=; b=4BHnnogIOHVZIEFftLoskN4ToO
	WrmGdAeupppDaxCYIAtlkZfLoJcADtYrfCa6pcim6TfFKe+eS5oBtMVF57wqpBQBbgHl6lxskQo4W
	G/3i1K1bFg7cFVzqPPQgmQjt7z8ruuJDDw56gCCqeo5NVUOfeSoF8jJnkG7QzgHeS7sGzuI4hyCeS
	RdRzGgryMNwedrMZ5KC6zVEMFCMFO+LBE8UZLmK7MPuM83T3PViuFAZ3JaCNnEyYnJuFw7yRk8zuW
	qO2k4romD/m0gwhiOGZDQHQWK7yX3IzAfCg6QTPDP51HOgJfH162DYSy4gcKWDpMR8pmkTrBruChl
	2uXLcN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht6W-00000002eOt-1AP2;
	Mon, 19 Jan 2026 17:31:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht6U-00000002eOZ-0i89
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AB6243A6C;
	Mon, 19 Jan 2026 17:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57323C116C6;
	Mon, 19 Jan 2026 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768843909;
	bh=05zscD5VFLw9poBWpM3GKQq1zp3KfSkLbp1GatELe+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFRB3+XeQWq5bsyig93pQzFUB8JfoKBfpHnb/5C9iaywScMH36rSqm1TYkRlS9pIb
	 j2rPlm1E+e6h6nF1HCipQC3QEexcTLpvJmVa/rFxHzo670Tvw7KdgrhsfMBhZrB/k2
	 9xmsqvibvmm2T34zYT6Qa+czaeWjbOe+MWB1QWDKCjesMpKzB6b5nco7QlO79pwCO8
	 KYn/G7D6FaOL9JyakbgCZD34eEOHrvxYYVM2soeoGWOSTpn6+tvGKALNEpkaK5CJad
	 vmYH87wAmoZ7xPOOgTUvEdAOdIT0NybE/a3fTM8pmJlWo/vKTHXI81gkyuBYPGUAWA
	 PqKOetDve4wng==
Date: Mon, 19 Jan 2026 17:31:42 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, catalin.marinas@arm.com,
	ryan.roberts@arm.com, akpm@linux-oundation.org, david@kernel.org,
	kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
	vbabka@suse.cz, mhocko@suse.com
Subject: Re: [PATCH v5 3/3] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
Message-ID: <aW5qfh_bsGNRd0Vd@willie-the-truck>
References: <20260105202328.2418990-1-yeoreum.yun@arm.com>
 <20260105202328.2418990-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105202328.2418990-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_093150_275214_D85663F0 
X-CRM114-Status: GOOD (  23.48  )
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

On Mon, Jan 05, 2026 at 08:23:28PM +0000, Yeoreum Yun wrote:
> The current __kpti_install_ng_mappings() allocates a temporary PGD
> while installing the NG mapping for KPTI under stop_machine(),
> using GFP_ATOMIC.
> 
> This is fine in the non-PREEMPT_RT case. However, it becomes a problem
> under PREEMPT_RT because generic memory allocation/free APIs
> (e.g., pgtable_alloc(), __get_free_pages(), etc.) cannot be invoked
> in a non-preemptible context, except for the *_nolock() variants.
> These generic allocators may sleep due to their use of spin_lock().
> 
> In other words, calling __get_free_pages(), even with GFP_ATOMIC,
> is not allowed in __kpti_install_ng_mappings(), which is executed by
> the stopper thread where preemption is disabled under PREEMPT_RT.
> 
> To address this, preallocate the page needed for the temporary PGD
> before invoking __kpti_install_ng_mappings() via stop_machine().
> 
> Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enabled")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/mmu.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 120874a2d35b..6ea5b80ab54f 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1360,7 +1360,7 @@ static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
>  	return kpti_ng_temp_alloc;
>  }
>  
> -static int __init __kpti_install_ng_mappings(void *__unused)
> +static int __init __kpti_install_ng_mappings(void *data)
>  {
>  	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
>  	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
> @@ -1368,10 +1368,9 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  
>  	int cpu = smp_processor_id();
>  	int levels = CONFIG_PGTABLE_LEVELS;
> -	int order = order_base_2(levels);
>  	u64 kpti_ng_temp_pgd_pa = 0;
>  	pgd_t *kpti_ng_temp_pgd;
> -	u64 alloc = 0;
> +	u64 alloc = *(u64 *)data;
>  
>  	if (levels == 5 && !pgtable_l5_enabled())
>  		levels = 4;
> @@ -1382,8 +1381,6 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  
>  	if (!cpu) {
>  		int ret;
> -
> -		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
>  		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
>  		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
>  
> @@ -1414,16 +1411,16 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  	remap_fn(cpu, num_online_cpus(), kpti_ng_temp_pgd_pa, KPTI_NG_TEMP_VA);
>  	cpu_uninstall_idmap();
>  
> -	if (!cpu) {
> -		free_pages(alloc, order);
> +	if (!cpu)
>  		arm64_use_ng_mappings = true;
> -	}
>  
>  	return 0;
>  }
>  
>  void __init kpti_install_ng_mappings(void)
>  {
> +	int order = order_base_2(CONFIG_PGTABLE_LEVELS);
> +	u64 alloc;
>  	/* Check whether KPTI is going to be used */
>  	if (!arm64_kernel_unmapped_at_el0())
>  		return;
> @@ -1436,8 +1433,14 @@ void __init kpti_install_ng_mappings(void)
>  	if (arm64_use_ng_mappings)
>  		return;
>  
> +	alloc = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> +	if (!alloc)
> +		panic("Failed to alloc page tables\n");

Why are you adding this panic?

Will

