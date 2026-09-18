Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAACC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qk5GBb8q71h0OTX0FejewQwnd8QBnXRYigWqP30wroM=; b=lO7rCWai4qksWZU/zAdWJzmWYb
	jC2rPHwY5AfsfwU6vFWYGRZ9IbPwdI9B70mTcwx52eMaZ6S/EDLSryNbEZTCx9wbw8URD2TzHiqX0
	Q3RhrwoUEB1P87O2y6GjLmch9bT5RsvqT3CAj82ktUsMYW3+kT00HgHqsrW6xu5cfsdBteVKIE060
	qspI7539QoENMEZwbwhfGq7JtzGXNEChifDpauhGlflIqDR+NgWfzXveRca/rfQrcFo5FHPrsdT47
	oZpEAgqEvJuQ6bTdbYOPk0R3DkFiRV368ayLtE8Mi3Q1e+VEDffTPHBKr3946HZJkXjpK1p3uqO1o
	Qj7g/b4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TaO-0000000Dkto-1Mrg;
	Fri, 18 Sep 2026 08:04:44 +0000
Received: from out-85.mta0.migadu.com ([2001:41d0:1004:224b::55] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TaK-0000000DksB-2F9Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:04:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aMbcna5jLWNAqx3Ry2+7V7gyF2U3dGtOqExnDesb2fI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789718677; v=1; x=1790323477;
 b=GM3c5EaoyflUF7CWwtfTtu5IXbmYDA4S9MecRd3maV8jL/5eBAPLJhtz+IIeC27Bg8YeXroG
 sGJ10OP8XciAgkKoXHv3C/Q9rbV6R0sQRw623xarvpsk0LTGkyrGtTbGwOkNou2kuzaoTXZarC3
 ePWlB0u1vXPB9v/SPwZ13Bfk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id e28637c2a9188785;
	Fri, 18 Sep 2026 08:04:36 +0000
X-Mizu-Trace-ID: e28637c2a9188785
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 16:04:33 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
	alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v6 05/10] crash_core: replace for_each_mem_range() with
 for_each_mem_region()
Message-ID: <aqzwkVldaBWcMojx@fedora>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-6-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073116.802752-6-chenwandun1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_010442_185675_EC5A5B2E 
X-CRM114-Status: GOOD (  18.39  )
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

On 09/02/26 at 03:31pm, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
> weak defaults to for_each_mem_region(), which exposes struct
> memblock_region and per-region flags, and filter NOMAP regions explicitly
> via the new crash_should_skip_region() helper. This prepares for a
> subsequent patch to extend the skip filter.
> 
> No functional change.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> ---
>  kernel/crash_core.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Acked-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 3adee1ae120c..bd64cf585795 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -270,6 +270,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  	return 0;
>  }
>  
> +/* Exclude NOMAP regions from the vmcore. */
> +static bool crash_should_skip_region(struct memblock_region *reg)
> +{
> +	return memblock_is_nomap(reg);
> +}
> +
>  static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
>  {
>  	struct crash_mem *cmem;
> @@ -285,22 +291,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
>  unsigned int __weak arch_get_system_nr_ranges(void)
>  {
>  	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
> -	phys_addr_t start, end;
> -	u64 i;
> +	struct memblock_region *reg;
>  
> -	for_each_mem_range(i, &start, &end)
> +	for_each_mem_region(reg) {
> +		if (crash_should_skip_region(reg))
> +			continue;
>  		nr_ranges++;
> +	}
>  	return nr_ranges;
>  }
>  
>  int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	phys_addr_t start, end;
> -	u64 i;
> +	struct memblock_region *reg;
>  
> -	for_each_mem_range(i, &start, &end) {
> -		cmem->ranges[cmem->nr_ranges].start = start;
> -		cmem->ranges[cmem->nr_ranges].end = end - 1;
> +	for_each_mem_region(reg) {
> +		if (crash_should_skip_region(reg))
> +			continue;
> +		cmem->ranges[cmem->nr_ranges].start = reg->base;
> +		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
>  		cmem->nr_ranges++;
>  	}
>  	return 0;
> -- 
> 2.43.0
> 

