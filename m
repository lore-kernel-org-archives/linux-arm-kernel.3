Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0ADFD5F6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 04:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvZJVvz1yetwIGi/CQ4H3ufYDNJNdd6yPa1rOzuU5xQ=; b=eaTjKD6GKgF+AdOkx++6DiPhF1
	Wo52BMHFj70vYA9VBK3sIixW5EJlvhCNlWFCgxLIzf9MUe3O9EoYyZipGtyh1/m0Zgk3eJlgp9Yyh
	JkYaTNlOZDcOtg+5dga9ve34Yazo/HlFZeuv8gxndq9h06ZqdmDbM/7dCalsHN0Jie38WHW7raVf7
	a+e9EyDbXsJzl0LYELtq/KUpiQ2sKVZtbUrH4ggYziuTGn4yWhjxsS5GxrAiYd3YXluGi/1MAGNsd
	6w+QROVJJrXA61zzRZFR7/sMDwpAVmDfEK9Mrjg8DO0/GIWwsdNwC81A99hEzDrGBAeJA3dscj0sG
	sbOtdGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKOc-00000008DjD-25Xe;
	Wed, 08 Apr 2026 04:20:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKOZ-00000008DiZ-1hOp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 04:20:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CE9F35A8;
	Tue,  7 Apr 2026 21:19:53 -0700 (PDT)
Received: from [10.163.142.59] (unknown [10.163.142.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8443F632;
	Tue,  7 Apr 2026 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775621999; bh=UkY/DeWiXJF+UzU1CgRHPZgFfeXQcMwts5esknbn6wg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GO7bqj7AxtUfnOPEktdiwI5ceB0ZJSGwylLrth8CWxj1FG8y3JA9YHfcVBR28a8SA
	 BvEVC678eOWrsaUuD3ToLrjKdf6D7/gbAEsxy150vRyS98eFjbcYunpBoJtdr+bwe8
	 utKariVcKTqHBkRzfO6EM4gztGsM4b/C7c606BLM=
Message-ID: <b297383a-731c-4efa-95b7-0f198b098d11@arm.com>
Date: Wed, 8 Apr 2026 09:49:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-6-baohua@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260408025115.27368-6-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_212003_630364_E30D7C8C 
X-CRM114-Status: GOOD (  32.05  )
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



On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> In many cases, the pages passed to vmap() may include high-order
> pages allocated with __GFP_COMP flags. For example, the systemheap
> often allocates pages in descending order: order 8, then 4, then 0.
> Currently, vmap() iterates over every page individually—even pages
> inside a high-order block are handled one by one.
> 
> This patch detects high-order pages and maps them as a single
> contiguous block whenever possible.
> 
> An alternative would be to implement a new API, vmap_sg(), but that
> change seems to be large in scope.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---

Coincidentally, I was working on the same thing :)

We have a usecase regarding Arm TRBE and SPE aux buffers.

I'll take a look at your patches later, but my implementation is the
following, if you have any comments. I have squashed the patches into
a single diff.



From ccb9670a52b7f50b1f1e07b579a1316f76b84811 Mon Sep 17 00:00:00 2001
From: Dev Jain <dev.jain@arm.com>
Date: Thu, 26 Feb 2026 16:21:29 +0530
Subject: [PATCH] arm64/perf: map AUX buffer with large pages

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  |  3 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |  3 +-
 drivers/perf/arm_spe_pmu.c                    |  5 +-
 mm/vmalloc.c                                  | 86 ++++++++++++++++---
 4 files changed, 79 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 72017dcc3b7f1..e90a430af86bb 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -984,7 +984,8 @@ int __init etm_perf_init(void)

 	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
 					   PERF_PMU_CAP_ITRACE |
-					   PERF_PMU_CAP_AUX_PAUSE);
+					   PERF_PMU_CAP_AUX_PAUSE |
+					   PERF_PMU_CAP_AUX_PREFER_LARGE);

 	etm_pmu.attr_groups		= etm_pmu_attr_groups;
 	etm_pmu.task_ctx_nr		= perf_sw_context;
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1511f8eb95afb..74e6ad891e236 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -760,7 +760,8 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
 	for (i = 0; i < nr_pages; i++)
 		pglist[i] = virt_to_page(pages[i]);

-	buf->trbe_base = (unsigned long)vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
+	buf->trbe_base = (unsigned long)vmap(pglist, nr_pages,
+			 VM_MAP | VM_ALLOW_HUGE_VMAP, PAGE_KERNEL);
 	if (!buf->trbe_base) {
 		kfree(pglist);
 		kfree(buf);
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index dbd0da1116390..90c349fd66b2c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1027,7 +1027,7 @@ static void *arm_spe_pmu_setup_aux(struct perf_event *event, void **pages,
 	for (i = 0; i < nr_pages; ++i)
 		pglist[i] = virt_to_page(pages[i]);

-	buf->base = vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
+	buf->base = vmap(pglist, nr_pages, VM_MAP | VM_ALLOW_HUGE_VMAP, PAGE_KERNEL);
 	if (!buf->base)
 		goto out_free_pglist;

@@ -1064,7 +1064,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu *spe_pmu)
 	spe_pmu->pmu = (struct pmu) {
 		.module = THIS_MODULE,
 		.parent		= &spe_pmu->pdev->dev,
-		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE,
+		.capabilities	= PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE |
+				  PERF_PMU_CAP_AUX_PREFER_LARGE,
 		.attr_groups	= arm_spe_pmu_attr_groups,
 		/*
 		 * We hitch a ride on the software context here, so that
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 61caa55a44027..8482463d41203 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -660,14 +660,14 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
+	unsigned long step = 1UL << (page_shift - PAGE_SHIFT);
 	WARN_ON(page_shift < PAGE_SHIFT);

 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
 			page_shift == PAGE_SHIFT)
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);

-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+	for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
 		int err;

 		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
@@ -678,8 +678,9 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,

 		addr += 1UL << page_shift;
 	}
-
-	return 0;
+	if (IS_ALIGNED(nr, step))
+		return 0;
+	return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
 }

 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -3514,6 +3515,50 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);

+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
+static inline int __vmap_huge(struct page **pages, pgprot_t prot,
+		unsigned long addr, unsigned int count)
+{
+	unsigned int i = 0;
+	unsigned int shift;
+	unsigned long nr;
+
+	while (i < count) {
+		nr = num_pages_contiguous(pages + i, count - i);
+		shift = vm_shift(prot, nr << PAGE_SHIFT);
+		if (vmap_pages_range(addr, addr + (nr << PAGE_SHIFT),
+				     pgprot_nx(prot), pages + i, shift) < 0) {
+			return 1;
+		}
+		i += nr;
+		addr += (nr << PAGE_SHIFT);
+	}
+	return 0;
+}
+
+static unsigned long max_contiguous_stride_order(struct page **pages,
+		pgprot_t prot, unsigned int count)
+{
+	unsigned long max_shift = PAGE_SHIFT;
+	unsigned int i = 0;
+
+	while (i < count) {
+		unsigned long nr = num_pages_contiguous(pages + i, count - i);
+		unsigned long shift = vm_shift(prot, nr << PAGE_SHIFT);
+
+		max_shift = max(max_shift, shift);
+		i += nr;
+	}
+	return max_shift;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3552,15 +3597,32 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;

 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	if (flags & VM_ALLOW_HUGE_VMAP) {
+		/* determine from page array, the max alignment */
+		unsigned long max_shift = max_contiguous_stride_order(pages, prot, count);
+
+		area = __get_vm_area_node(size, 1 << max_shift, max_shift, flags,
+					  VMALLOC_START, VMALLOC_END, NUMA_NO_NODE,
+					  GFP_KERNEL, __builtin_return_address(0));
+	} else {
+		area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	}
 	if (!area)
 		return NULL;

 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
-		vunmap(area->addr);
-		return NULL;
+
+	if (flags & VM_ALLOW_HUGE_VMAP) {
+		if (__vmap_huge(pages, prot, addr, count)) {
+			vunmap(area->addr);
+			return NULL;
+		}
+	} else {
+		if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
+					pages, PAGE_SHIFT) < 0) {
+			vunmap(area->addr);
+			return NULL;
+		}
 	}

 	if (flags & VM_MAP_PUT_PAGES) {
@@ -4011,11 +4073,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * their allocations due to apply_to_page_range not
 		 * supporting them.
 		 */
-
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
+		shift = vm_shift(prot, size);

 		align = max(original_align, 1UL << shift);
 	}
-- 
2.34.1



>  mm/vmalloc.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index eba436386929..e8dbfada42bc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3529,6 +3529,53 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int max_steps, unsigned int idx)
> +{
> +	unsigned int nr_pages;
> +
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> +			ioremap_max_page_shift == PAGE_SHIFT)
> +		return 0;
> +
> +	nr_pages = compound_nr(pages[idx]);
> +	if (nr_pages == 1 || max_steps < nr_pages)
> +		return 0;
> +
> +	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> +		return compound_order(pages[idx]);
> +	return 0;
> +}
> +
> +static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages)
> +{
> +	unsigned int count = (end - addr) >> PAGE_SHIFT;
> +	int err;
> +
> +	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> +						PAGE_SHIFT, GFP_KERNEL);
> +	if (err)
> +		goto out;
> +
> +	for (unsigned int i = 0; i < count; ) {
> +		unsigned int shift = PAGE_SHIFT +
> +			get_vmap_batch_order(pages, count - i, i);
> +
> +		err = vmap_range_noflush(addr, addr + (1UL << shift),
> +				page_to_phys(pages[i]), prot, shift);
> +		if (err)
> +			goto out;
> +
> +		addr += 1UL << shift;
> +		i += 1U << (shift - PAGE_SHIFT);
> +	}
> +
> +out:
> +	flush_cache_vmap(addr, end);
> +	return err;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3572,8 +3619,8 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	addr = (unsigned long)area->addr;
> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -				pages, PAGE_SHIFT) < 0) {
> +	if (vmap_contig_pages_range(addr, addr + size, pgprot_nx(prot),
> +				pages) < 0) {
>  		vunmap(area->addr);
>  		return NULL;
>  	}


