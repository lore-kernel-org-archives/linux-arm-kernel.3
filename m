Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D3BC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnz+Q7oLxdFchNprrTfz7D+oxXdhW/W/4ETjjtBR3y4=; b=QRrlJSk54tlf0n6ldMuBw3N0Ye
	c0hxAwBSP5MC6USiKrceJoXvGqAxQx+4zhaOEaB/Tu4+GmB/qDteco1E28tepbgJIsOocPu1FM8DI
	N4IV8m2CEF9njyMc59jgAyKY0hlTmU7R+rJcSKahnntuqBdspIGcq4Nu1GSt733brT2H+S+X5BXag
	VG5507hehKk7Kj/8TgQE4H7cyiDjjmw+8OT3Tx+9h6XPbcUTe2kB6drqxsZEh3N7OhUuFGvWtWwMb
	0HjeUTs9Htj0rYLFaWztZ5KJUfklMWLQtmLDCBkl2eQdCuELLQmqB4xkUXGirehz+HzLldTDpQJAV
	J0M26DwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOfN-000000073UM-2wzD;
	Mon, 11 Aug 2025 09:18:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOFs-00000006uZ9-29HI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 08:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D03A5C07FC;
	Mon, 11 Aug 2025 08:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFCCC4CEF1;
	Mon, 11 Aug 2025 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754902303;
	bh=WflSO903y7ZETiHLGDPSPJxjN0UfaKdaYhjpbSXbXag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbfmldhQDgE0qA0nzncKOn/nHwg2xz2L+4eL22OGsob2fROA5jdJlkeZvvYjgkKzT
	 3QQHP2OY1qwmDEzGa9w2N1At/TpQ8hmD5FHJnLx4Jbew5YxjUTnfuu+0XQ4iveAI6J
	 RNDOh4KijMV8bqtWFgFUb8czC0BFGmB9W/JPNwHBJIxXkFqpMQ4/ks+Oc4uQZbi9pI
	 cCl1aVM/2omiQB7Xhv2X+ojoj9vPXye7McTtwznMpzx5wCdFK0c1pbSSyBDd89Cro5
	 c2OnxwtQq4H/6LFmwIPztIWwRNRCBUV9hiU67MNIKZs8UdIDr2FQWm5Um5NeTvznkr
	 wdY0LB2QzY4Fw==
Date: Mon, 11 Aug 2025 11:51:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Gavin Shan <gshan@redhat.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>, Dev Jain <dev.jain@arm.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [RESEND PATCH 2/2] arm64: Add encrypt/decrypt support for
 vmalloc regions
Message-ID: <aJmvFz-0xlfS2B3p@kernel.org>
References: <20250811005036.714274-1-sdonthineni@nvidia.com>
 <20250811005036.714274-3-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811005036.714274-3-sdonthineni@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_015144_635731_4B4CC705 
X-CRM114-Status: GOOD (  36.02  )
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

On Sun, Aug 10, 2025 at 07:50:35PM -0500, Shanker Donthineni wrote:
> On ARM64 systems with CCA (Confidential Compute Architecture) enabled,
> the kernel may need to change the encryption attributes of memory
> regions. The existing implementation of set_memory_encrypted() and
> set_memory_decrypted() assumes that the input address is part of the
> linear mapping region '__is_lm_address()', and fails with -EINVAL
> otherwise.
> 
> This breaks use cases where the memory region resides in the vmalloc
> area, which is mapped in non-linear mapping region.
> 
> This patch introduces a new helper, realm_set_memory(), which detects
> whether the given address is from a non-linear mapping. If so, it uses
> vmalloc_to_page() to resolve each page’s physical address and applies
> attribute changes one page at a time. For the linear address regions,
> it maintains the existing fast-path.
> 
> This change ensures that encrypted/decrypted memory attribute updates
> correctly for all memory regions, including those allocated via vmap(),
> module allocations, or other vmalloc-backed paths.
> 
> Call stack of Realm crash, QEMU hypervisor + NVME device (emulated):
>  ...
>  Freeing unused kernel memory: 6336K
>  Run /sbin/init as init process
>  Internal error: synchronous external abort: 0000000096000250 [#1]  SMP
>  Modules linked in:
>  CPU: 0 UID: 0 PID: 64 Comm: lsblk Not tainted 6.15.5 #2 PREEMPT(undef)
>  Hardware name: linux,dummy-virt (DT)
>  pstate: 43400005 (nZcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>  pc : __pi_memset_generic+0x16c/0x188
>  lr : dma_alloc_from_pool+0xd0/0x1b8
>  sp : ffff80008335b350
>  x29: ffff80008335b350 x28: ffff800083162000 x27: ffff80008335b3c0
>  x26: ffff80008144f000 x25: ffff8000801a27e8 x24: ffff800081e14000
>  x23: ffffc1ffc0000000 x22: 0000000000001000 x21: ffff800081458310
>  x20: 0000000042a40000 x19: ffff00000232fcc0 x18: 0000000000200000
>  x17: 00000000000120c0 x16: ffff0000795520c0 x15: 0000000000000000
>  x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
>  x8 : ffff800083162000 x7 : 0000000000000000 x6 : 000000000000003f
>  x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000004
>  x2 : 0000000000000fc0 x1 : 0000000000000000 x0 : ffff800083162000
>  Call trace:
>    __pi_memset_generic+0x16c/0x188 (P)
>    dma_direct_alloc_from_pool+0xc4/0x230
>    dma_direct_alloc+0x80/0x4a0
>    dma_alloc_attrs+0x94/0x238
>    dma_pool_alloc+0x128/0x258
>    nvme_prep_rq.part.0+0x5f0/0x950
>    nvme_queue_rq+0x78/0x1e8
>    blk_mq_dispatch_rq_list+0x10c/0x6f0
>    __blk_mq_sched_dispatch_requests+0x4a0/0x580
>    blk_mq_sched_dispatch_requests+0x38/0xa0
>    blk_mq_run_hw_queue+0x288/0x2f8
>    blk_mq_flush_plug_list+0x134/0x630
>    __blk_flush_plug+0x100/0x168
>    blk_finish_plug+0x40/0x60
>    read_pages+0x1a0/0x2b0
>    page_cache_ra_unbounded+0x1f8/0x268
>    force_page_cache_ra+0xa4/0xe0
>    page_cache_sync_ra+0x48/0x268
>    filemap_get_pages+0xf4/0x7a0
>    filemap_read+0xf0/0x448
>    blkdev_read_iter+0x8c/0x1a8
>    vfs_read+0x288/0x330
>    ksys_read+0x78/0x118
>    __arm64_sys_read+0x24/0x40
>    invoke_syscall+0x50/0x120
>    el0_svc_common.constprop.0+0x48/0xf0
>    do_el0_svc+0x24/0x38
>    el0_svc+0x34/0xf8
>    el0t_64_sync_handler+0x10c/0x138
>    el0t_64_sync+0x1ac/0x1b0
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> ---
>  arch/arm64/mm/pageattr.c | 55 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db4..65c3322a86b49 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -202,21 +202,26 @@ int set_direct_map_default_noflush(struct page *page)
>  				   PAGE_SIZE, change_page_range, &data);
>  }
>  
> +/*
> + * Common function for setting memory encryption or decryption attributes.
> + *
> + * @addr:        Virtual start address of the memory region
> + * @start:       Corresponding physical start address
> + * @numpages:    Number of pages to update
> + * @encrypt:     If true, set memory as encrypted; if false, decrypt
> + */
>  static int __set_memory_enc_dec(unsigned long addr,
> +				phys_addr_t start,
>  				int numpages,
>  				bool encrypt)
>  {
>  	unsigned long set_prot = 0, clear_prot = 0;
> -	phys_addr_t start, end;
> +	phys_addr_t end;
>  	int ret;
>  
>  	if (!is_realm_world())
>  		return 0;
>  
> -	if (!__is_lm_address(addr))
> -		return -EINVAL;
> -
> -	start = __virt_to_phys(addr);
>  	end = start + numpages * PAGE_SIZE;
>  
>  	if (encrypt)
> @@ -248,9 +253,45 @@ static int __set_memory_enc_dec(unsigned long addr,
>  				      __pgprot(0));
>  }
>  
> +/*
> + * Wrapper for __set_memory_enc_dec() that handles both linear-mapped
> + * and vmalloc/module memory regions.
> + *
> + * If the address is in the linear map, we can directly compute the
> + * physical address. If not (e.g. vmalloc memory), we walk each page
> + * and call the attribute update individually.
> + */
> +static int realm_set_memory(unsigned long addr, int numpages, bool encrypt)
> +{
> +	phys_addr_t start;
> +	struct page *page;
> +	int ret, i;
> +
> +	if (__is_lm_address(addr)) {
> +		start = __virt_to_phys(addr);
> +		return __set_memory_enc_dec(addr, start, numpages, encrypt);
> +	}
> +
> +	for (i = 0; i < numpages; i++) {
> +		page = vmalloc_to_page((void *)addr);
> +		if (!page)
> +			return -EINVAL;

It would be faster to get_vm_area(addr) and iterate over its ->pages rather
than call vmalloc_to_page every time

> +
> +		start = page_to_phys(page);
> +		ret = __set_memory_enc_dec(addr, start, 1, encrypt);
> +		if (ret)
> +			return ret;
> +
> +		addr += PAGE_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
>  static int realm_set_memory_encrypted(unsigned long addr, int numpages)
>  {
> -	int ret = __set_memory_enc_dec(addr, numpages, true);
> +	int ret = realm_set_memory(addr, numpages, true);
> +
>  
>  	/*
>  	 * If the request to change state fails, then the only sensible cause
> @@ -264,7 +305,7 @@ static int realm_set_memory_encrypted(unsigned long addr, int numpages)
>  
>  static int realm_set_memory_decrypted(unsigned long addr, int numpages)
>  {
> -	int ret = __set_memory_enc_dec(addr, numpages, false);
> +	int ret = realm_set_memory(addr, numpages, false);
>  
>  	WARN(ret, "Failed to decrypt memory, %d pages will be leaked",
>  	     numpages);
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

