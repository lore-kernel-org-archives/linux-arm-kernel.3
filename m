Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDAEEEE25C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKscxMgny0o6LLVEA6vN8ZVBDS1ccGXCTWftPDaMoPo=; b=zaiFdAbwwjIZiIV1CB/2lNsEWZ
	GKTqJeSfvLKRbnTjYbzB+5zoeU3+2gJmUWLgxo8GDdDIxm7X7vbsjKhd9AESnWcNVP6JyCalJdlwW
	ZdNTrZqS0/tZyArYW5t3zI063+roAR8bsEvQtKY+aGWQ1T+1ppejJSVNXABZQaQyuaGE0azgMJJIO
	n5sndunfXG98793Om2QClj+QnxS9Av8DoqtCbzR4sLt1abc5VsXbRmb/kxNMsoJI7cVanGBhJBj6Z
	32DX/4fcyQ+upr5tc77mu+OffFJ1km/WqajlAJxJiwIRuZGK4ihf+//xb/vhpSZgtNHlwc8m8lE5N
	fSst840Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd38-000000087Gp-0juR;
	Fri, 02 Jan 2026 11:10:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd36-000000087GJ-0Tm5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:10:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E66497;
	Fri,  2 Jan 2026 03:10:20 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88A0E3F63F;
	Fri,  2 Jan 2026 03:10:23 -0800 (PST)
Message-ID: <dc8b55e0-7cba-4bd2-a68b-88710c17e9aa@arm.com>
Date: Fri, 2 Jan 2026 11:10:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, david@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, mhocko@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20251218194750.395301-1-yeoreum.yun@arm.com>
 <20251218194750.395301-3-yeoreum.yun@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251218194750.395301-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_031028_279489_BE6FD120 
X-CRM114-Status: GOOD (  21.68  )
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

On 18/12/2025 19:47, Yeoreum Yun wrote:
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
>  arch/arm64/mm/mmu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 96a9fa505e71..9ad9612728e6 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1369,7 +1369,7 @@ static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
>  	return kpti_ng_temp_alloc;
>  }
>  
> -static int __init __kpti_install_ng_mappings(void *__unused)
> +static int __init __kpti_install_ng_mappings(void *data)
>  {
>  	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
>  	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
> @@ -1377,10 +1377,9 @@ static int __init __kpti_install_ng_mappings(void *__unused)
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
> @@ -1391,8 +1390,6 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  
>  	if (!cpu) {
>  		int ret;
> -
> -		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
>  		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
>  		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
>  
> @@ -1423,16 +1420,17 @@ static int __init __kpti_install_ng_mappings(void *__unused)
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
> +

nit: Restore the blank line between the variable definitioins and the logic.

But you already have my R-b :)

>  	/* Check whether KPTI is going to be used */
>  	if (!arm64_kernel_unmapped_at_el0())
>  		return;
> @@ -1445,8 +1443,14 @@ void __init kpti_install_ng_mappings(void)
>  	if (arm64_use_ng_mappings)
>  		return;
>  
> +	alloc = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> +	if (!alloc)
> +		panic("Failed to alloc page tables\n");
> +
>  	init_idmap_kpti_bbml2_flag();
> -	stop_machine(__kpti_install_ng_mappings, NULL, cpu_online_mask);
> +	stop_machine(__kpti_install_ng_mappings, &alloc, cpu_online_mask);
> +
> +	free_pages(alloc, order);
>  }
>  
>  static pgprot_t __init kernel_exec_prot(void)


