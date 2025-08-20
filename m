Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2BCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdHPLUmqCo9HY1nOpwkcVjNUH/3wA8OL40QJzve35P4=; b=OA0hhTJbF4Q6M8i2K93/e0mGHD
	ir36J/pJT+zdWxw0DdbTbqkBGi6OAc406c5v5OK63op5412ZrvZshN4yIh7VwiFXu5JTc9Fkf0+GS
	ZT8Mhbgw8pubeI4TiMyPx5VgpYn2/B/d0bNjRWWhpXINgMKvakMbNkrEQWMMm4y96WY9nl00wnVLs
	TGa5oLJPrJAeItX3Kfo/uc1kHSc6gx0VPhsTCPSobJalo0xzIQOX/Nspb2Ij6SST2gtU7Ctcz10QH
	3raKpbabw1SswNaOEJp/L09zrsyZiThE2zQiMrk4kDxdxAwAJ48yN7Q2CusadSSfA9SgxP72KZEp8
	80OiR6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojWE-0000000Dxmf-27fJ;
	Wed, 20 Aug 2025 14:10:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiol-0000000Dm5f-2KmB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB63761430;
	Wed, 20 Aug 2025 13:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C110EC4CEEB;
	Wed, 20 Aug 2025 13:25:29 +0000 (UTC)
Date: Wed, 20 Aug 2025 14:25:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: john.cox@raspberrypi.com
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64/dma-mapping: Fix arch_sync_dma_for_device to
 respect dir parameter
Message-ID: <aKXMx5RZCy6cuc33@arm.com>
References: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
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

On Wed, Aug 20, 2025 at 11:28:06AM +0100, John Cox via B4 Relay wrote:
> All other architectures do different cache operations depending on the
> dir parameter. Fix arm64 to do the same.

I suspect that's a bug in the users of the DMA API. We shouldn't modify
the arm64 implementation to cope with them.

> This fixes udmabuf operations when syncing for read e.g. when the CPU
> reads back a V4L2 decoded frame buffer.
> 
> Signed-off-by: John Cox <john.cox@raspberrypi.com>
> ---
> This patch makes the arch_sync_dma_for_device function on arm64
> do different things depending on the value of the dir parameter. In
> particular it does a cache invalidate operation if the dir flag is
> set to DMA_FROM_DEVICE. The current code does a writeback without
> invalidate under all circumstances. Nearly all other architectures do
> an invalidate if the direction is FROM_DEVICE which seems like the
> correct thing to do to me.

So does arm64 but in the arch_sync_dma_for_cpu(). That's the correct
place to do it, otherwise after arch_sync_dma_for_device() you may have
speculative loads by the CPU populating the caches with stale data
before the device finished writing.

> This patch fixes a problem I was having with udmabuf allocated
> dmabufs. It also fixes a very similar problem I had with dma_heap
> allocated dmabuf but that occured very much less frequently and I
> haven't traced exactly what was going on there.
> 
> My problem (on a Raspberry Pi5):
> 
> [Userland]
> Alloc memory with memfd_create + ftruncate
> Derive dmabuf from memfd with udmabuf
> Close memfd
> Queue dmabuf into V4L2 with QBUF
> <decode a video frame>
> Extract dmabuf from V4L2 with DQBUF
> Map dmabuf for read with mmap
> Sync for read with DMA_BUF_IOCTL_SYNC with (DMA_BUF_SYNC_START |
> DMA_BUF_SYNC_READ)
> Read buffer
> Sync end
> Unmap

Between the device writing to the buffer and the "read buffer" step
above, is there a call to arch_sync_dma_for_cpu()? A quick look at
begin_cpu_udmabuf() shows a dma_sync_sgtable_for_cpu(), though there is
a branch where this is skipped. get_sg_table() seems to do a DMA map
which I think ends up in arch_sync_dma_for_device() but the sync
for-CPU is skipped.

An attempt to a udmabuf fix (untested):

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 40399c26e6be..9ab4a6c01143 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -256,10 +256,11 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 			ret = PTR_ERR(ubuf->sg);
 			ubuf->sg = NULL;
 		}
-	} else {
-		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
 	}
 
+	if (ubuf->sg)
+		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
+
 	return ret;
 }

> I get old (zero) data out of the "Read buffer" stage in some cache
> lines sometimes.
> It doesn't matter which way round the mmap & sync are.
> 
> I am aware that there is a patchset going through for udmabuf that may
> well fix the udmabuf case above, but given that this patch fixes
> something similar in dma_heap/system too I think it is still worth
> having.
> ---
>  arch/arm64/mm/dma-mapping.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index b2b5792b2caaf81ccfc3204c94395bb0faeabddd..51c43c1f563015139e365ed86f0f5f0d9483fa7f 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -16,8 +16,22 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  			      enum dma_data_direction dir)
>  {
>  	unsigned long start = (unsigned long)phys_to_virt(paddr);
> +	unsigned long end = start + size;
>  
> -	dcache_clean_poc(start, start + size);
> +	switch (dir) {
> +	case DMA_BIDIRECTIONAL:
> +		dcache_clean_inval_poc(start, end);
> +		break;
> +	case DMA_TO_DEVICE:
> +		dcache_clean_poc(start, end);
> +		break;
> +	case DMA_FROM_DEVICE:
> +		dcache_inval_poc(start, end);
> +		break;
> +	case DMA_NONE:
> +	default:
> +		break;
> +	}
>  }

As explained above, that's not the right fix. We need to identify what's
missing on the ioctl() paths.

-- 
Catalin

