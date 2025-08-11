Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0A5CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYzY/GwjRyWYnZruLJaXlBjFISWXxi8U16dg9rgGvJg=; b=4enYg3hxbTJydO/UBi54epFAtK
	ujbIN76wOXsDGnkpZycPpYNXXZrIvE90+j2kRk8DDMqBgIQnbiY/ostMxt/ZEJcHClvK77qCGmlNU
	Ktbx6JhOthldBeb1ViJ0w1JJeLi4v3y3iwXrlH2KJMnRuZXKcvTL3ez+81qbULrEKZIrkHAGNKb2r
	5pw0bC4CO9FbcryymSTSww/4U22EqWnt8K5maZiext2haoRdoh0IWkzEJrfjMQJUQQH/Msjav7UH7
	W+XtdiJ1ymPUi9w4jv6FGiJjasXNXun/WjhaRB0JLKY5c50wOkis68jwWHojEAk5GJmp/t30pCRoH
	HZdZk2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulabh-00000009B3v-0aTq;
	Mon, 11 Aug 2025 22:03:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWHk-00000008Y1A-2zzJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 17:26:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 111EB1A32;
	Mon, 11 Aug 2025 10:26:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFE693F63F;
	Mon, 11 Aug 2025 10:26:07 -0700 (PDT)
Date: Mon, 11 Aug 2025 18:26:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Gavin Shan <gshan@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>, Dev Jain <dev.jain@arm.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [RESEND PATCH 1/2] dma/pool: Use vmap() address for memory
 encryption helpers on ARM64
Message-ID: <aJonrTrr6nW7qdLI@arm.com>
References: <20250811005036.714274-1-sdonthineni@nvidia.com>
 <20250811005036.714274-2-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811005036.714274-2-sdonthineni@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_102612_829582_DE534683 
X-CRM114-Status: GOOD (  24.05  )
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

On Sun, Aug 10, 2025 at 07:50:34PM -0500, Shanker Donthineni wrote:
> In atomic_pool_expand(), set_memory_encrypted()/set_memory_decrypted()
> are currently called with page_to_virt(page). On ARM64 with
> CONFIG_DMA_DIRECT_REMAP=y, the atomic pool is mapped via vmap(), so
> page_to_virt(page) does not reference the actual mapped region.
> 
> Using this incorrect address can cause encryption attribute updates to
> be applied to the wrong memory region. On ARM64 systems with memory
> encryption enabled (e.g. CCA), this can lead to data corruption or
> crashes.
> 
> Fix this by using the vmap() address ('addr') on ARM64 when invoking
> the memory encryption helpers, while retaining the existing
> page_to_virt(page) usage for other architectures.
> 
> Fixes: 76a19940bd62 ("dma-direct: atomic allocations must come from atomic coherent pools")
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> ---
>  kernel/dma/pool.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 7b04f7575796b..ba08a301590fd 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -81,6 +81,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  {
>  	unsigned int order;
>  	struct page *page = NULL;
> +	void *vaddr;
>  	void *addr;
>  	int ret = -ENOMEM;
>  
> @@ -113,8 +114,8 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>  	 * shrink so no re-encryption occurs in dma_direct_free().
>  	 */
> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> +	vaddr = IS_ENABLED(CONFIG_ARM64) ? addr : page_to_virt(page);
> +	ret = set_memory_decrypted((unsigned long)vaddr, 1 << order);

At least with arm CCA, there are two aspects to setting the memory
encrypted/decrypted: an RMM (realm management monitor) call and setting
of the attributes of the stage 1 mapping. The RMM call doesn't care
about the virtual address, only the (intermediate) physical address, so
having page_to_virt(page) here is fine.

The second part is setting the (fake) attribute for this mapping (top
bit of the IPA space). Can we not instead just call:

	addr = dma_common_contiguous_remap(page, pool_size,
					   pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL)),
					   __builtin_return_address(0));

in the atomic pool code? The advantage is that we keep the
set_memory_decrypted() call on the linear map so that we change its
attributes as well.

I want avoid walking the page tables for vmap regions if possible in the
arm64 set_memory_* implementation. At some point I was proposing a
GFP_DECRYPTED flag for allocations but never got around to post a patch
(and implement vmalloc() support):

https://lore.kernel.org/linux-arm-kernel/ZmNJdSxSz-sYpVgI@arm.com/

-- 
Catalin

