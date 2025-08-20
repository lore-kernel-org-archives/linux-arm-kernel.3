Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BD7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj3IN+qWrNLTJNkOKoee76vOwexQhhZOwIf81Qb9wrI=; b=W7nIg2qYnENhC6vAnRRNgB5S5/
	vLoy5cLooKfOcq3N2HxQ6YW50nPrYgPmzrv42byoRjD4hMYXmME3N8f+us08/a2SZXDVbgwmqGHce
	RlA72p/2AEGGThYGtsdIYzm0QaXJF6KjwGZIco6F37ojR2xibUJcOQ/zgcYJh5hmhUG4u36Am8b89
	Cz34nTFhwJ8nNKldYaYUq8Ncv6hm8vnVD8D1UHR8XD2pcP5t0JX178cZ+pvqmOLzrVyHXmpHksYNl
	jUOR8+zu7wAVXbkDPYo3Mh07fqizRa1ZhB2scfsQjncVKHFCleNigjhd0CoVnTrX0k0mK5k2RYnEe
	+ARB5sog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokmp-0000000EGjz-3Eez;
	Wed, 20 Aug 2025 15:31:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojU7-0000000Dx6D-2okI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:08:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 157EF1D31;
	Wed, 20 Aug 2025 07:08:05 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4643F63F;
	Wed, 20 Aug 2025 07:08:12 -0700 (PDT)
Message-ID: <9bb085e7-9833-480b-8804-e9a0d2167f25@arm.com>
Date: Wed, 20 Aug 2025 15:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/dma-mapping: Fix arch_sync_dma_for_device to
 respect dir parameter
To: Catalin Marinas <catalin.marinas@arm.com>, john.cox@raspberrypi.com
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
 <aKXMx5RZCy6cuc33@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aKXMx5RZCy6cuc33@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_070815_790482_7D498008 
X-CRM114-Status: GOOD (  38.76  )
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

On 20/08/2025 2:25 pm, Catalin Marinas wrote:
> On Wed, Aug 20, 2025 at 11:28:06AM +0100, John Cox via B4 Relay wrote:
>> All other architectures do different cache operations depending on the
>> dir parameter. Fix arm64 to do the same.
> 
> I suspect that's a bug in the users of the DMA API. We shouldn't modify
> the arm64 implementation to cope with them.
> 
>> This fixes udmabuf operations when syncing for read e.g. when the CPU
>> reads back a V4L2 decoded frame buffer.
>>
>> Signed-off-by: John Cox <john.cox@raspberrypi.com>
>> ---
>> This patch makes the arch_sync_dma_for_device function on arm64
>> do different things depending on the value of the dir parameter. In
>> particular it does a cache invalidate operation if the dir flag is
>> set to DMA_FROM_DEVICE. The current code does a writeback without
>> invalidate under all circumstances. Nearly all other architectures do
>> an invalidate if the direction is FROM_DEVICE which seems like the
>> correct thing to do to me.
> 
> So does arm64 but in the arch_sync_dma_for_cpu(). That's the correct
> place to do it, otherwise after arch_sync_dma_for_device() you may have
> speculative loads by the CPU populating the caches with stale data
> before the device finished writing.

Exactly, not only is it unnecessary, it's not even guaranteed to have 
any lasting effect. arch_sync_dma_for_device() has two jobs to do: 1) 
ensure that any new data going in the DMA_TO_DEVICE direction is visible 
to the device; a clean is sufficient for that. 2) ensure that no dirty 
cachelines may be written back over new DMA_FROM_DEVICE data; a clean is 
sufficient for that also. Adding an invalidate at this point serves no 
purpose since the CPU is still free to immediately speculatively fetch 
the same cleaned data back into the cache.

>> This patch fixes a problem I was having with udmabuf allocated
>> dmabufs. It also fixes a very similar problem I had with dma_heap
>> allocated dmabuf but that occured very much less frequently and I
>> haven't traced exactly what was going on there.
>>
>> My problem (on a Raspberry Pi5):
>>
>> [Userland]
>> Alloc memory with memfd_create + ftruncate
>> Derive dmabuf from memfd with udmabuf
>> Close memfd
>> Queue dmabuf into V4L2 with QBUF
>> <decode a video frame>
>> Extract dmabuf from V4L2 with DQBUF
>> Map dmabuf for read with mmap
>> Sync for read with DMA_BUF_IOCTL_SYNC with (DMA_BUF_SYNC_START |
>> DMA_BUF_SYNC_READ)
>> Read buffer
>> Sync end
>> Unmap
> 
> Between the device writing to the buffer and the "read buffer" step
> above, is there a call to arch_sync_dma_for_cpu()? A quick look at
> begin_cpu_udmabuf() shows a dma_sync_sgtable_for_cpu(), though there is
> a branch where this is skipped. get_sg_table() seems to do a DMA map
> which I think ends up in arch_sync_dma_for_device() but the sync
> for-CPU is skipped.

Indeed that path is clearly wrong.

Thanks,
Robin.

> An attempt to a udmabuf fix (untested):
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 40399c26e6be..9ab4a6c01143 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -256,10 +256,11 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>   			ret = PTR_ERR(ubuf->sg);
>   			ubuf->sg = NULL;
>   		}
> -	} else {
> -		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
>   	}
>   
> +	if (ubuf->sg)
> +		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> +
>   	return ret;
>   }
> 
>> I get old (zero) data out of the "Read buffer" stage in some cache
>> lines sometimes.
>> It doesn't matter which way round the mmap & sync are.
>>
>> I am aware that there is a patchset going through for udmabuf that may
>> well fix the udmabuf case above, but given that this patch fixes
>> something similar in dma_heap/system too I think it is still worth
>> having.
>> ---
>>   arch/arm64/mm/dma-mapping.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
>> index b2b5792b2caaf81ccfc3204c94395bb0faeabddd..51c43c1f563015139e365ed86f0f5f0d9483fa7f 100644
>> --- a/arch/arm64/mm/dma-mapping.c
>> +++ b/arch/arm64/mm/dma-mapping.c
>> @@ -16,8 +16,22 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>>   			      enum dma_data_direction dir)
>>   {
>>   	unsigned long start = (unsigned long)phys_to_virt(paddr);
>> +	unsigned long end = start + size;
>>   
>> -	dcache_clean_poc(start, start + size);
>> +	switch (dir) {
>> +	case DMA_BIDIRECTIONAL:
>> +		dcache_clean_inval_poc(start, end);
>> +		break;
>> +	case DMA_TO_DEVICE:
>> +		dcache_clean_poc(start, end);
>> +		break;
>> +	case DMA_FROM_DEVICE:
>> +		dcache_inval_poc(start, end);
>> +		break;
>> +	case DMA_NONE:
>> +	default:
>> +		break;
>> +	}
>>   }
> 
> As explained above, that's not the right fix. We need to identify what's
> missing on the ioctl() paths.
> 


