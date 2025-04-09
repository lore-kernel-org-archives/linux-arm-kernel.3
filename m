Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csncnQxkT4isvaEGr/OMhIXO14/T9F2TP3E/Vu2E0LI=; b=HyRvFDEvUg2dh0fizYN2ntmOF/
	hi+Grc46SxrdvaV8w8it4ogfyUyG68IalddeFl24aF6zAcnjQ+C74b7q80pEvmkLdG8mQW3YI+1KZ
	9y/tUDlu5MMohlivfK+V/wX2sTTN3x+3SK1fIWKGwsUM4KWpQeMjw0DfI8xrvLYEZ/SZtCwm4hdAz
	QK6cQ6qEhy2Qr2JSnkx0cAENNVKMAH98kWejXdFshJVhYNTAPyv7y+mNQkZvAQDLNF5QRwM3g1Ygb
	xD1Tordlgn12xJrCcesu/eq1PzmpSckN9LKMKvvL4UAvg6o6+1beON+DfpzgUmeDKlse9FuSReJf3
	9l5d4uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Y7R-00000007rNi-24kP;
	Wed, 09 Apr 2025 16:17:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XtV-00000007ok5-35eq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:03:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52CC115A1;
	Wed,  9 Apr 2025 09:03:15 -0700 (PDT)
Received: from [10.57.72.20] (unknown [10.57.72.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A4F93F59E;
	Wed,  9 Apr 2025 09:03:07 -0700 (PDT)
Message-ID: <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com>
Date: Wed, 9 Apr 2025 17:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct bitfield
 to not bounce-buffer
To: Roman Kisel <romank@linux.microsoft.com>, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
 dan.j.williams@intel.com, dave.hansen@linux.intel.com, decui@microsoft.com,
 gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
 hpa@zytor.com, James.Bottomley@HansenPartnership.com,
 Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
 lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
 martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
 quic_zijuhu@quicinc.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, iommu@lists.linux.dev, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, x86@kernel.org
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-6-romank@linux.microsoft.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250409000835.285105-6-romank@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_090317_868343_E4DDDA2F 
X-CRM114-Status: GOOD (  25.92  )
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

On 2025-04-09 1:08 am, Roman Kisel wrote:
> Bounce-buffering makes the system spend more time copying
> I/O data. When the I/O transaction take place between
> a confidential and a non-confidential endpoints, there is
> no other way around.
> 
> Introduce a device bitfield to indicate that the device
> doesn't need to perform bounce buffering. The capable
> device may employ it to save on copying data around.

It's not so much about bounce buffering, it's more fundamentally about 
whether the device is trusted and able to access private memory at all 
or not. And performance is hardly the biggest concern either - if you do 
trust a device to operate on confidential data in private memory, then 
surely it is crucial to actively *prevent* that data ever getting into 
shared SWIOTLB pages where anyone else could also get at it. At worst 
that means CoCo VMs might need an *additional* non-shared SWIOTLB to 
support trusted devices with addressing limitations (and/or 
"swiotlb=force" debugging, potentially).

Also whatever we do for this really wants to tie in with the nascent 
TDISP stuff as well, since we definitely don't want to end up with more 
than one notion of whether a device is in a trusted/locked/private/etc. 
vs. unlocked/shared/etc. state with respect to DMA (or indeed anything 
else if we can avoid it).

Thanks,
Robin.

> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>   arch/x86/mm/mem_encrypt.c  | 3 +++
>   include/linux/device.h     | 8 ++++++++
>   include/linux/dma-direct.h | 3 +++
>   include/linux/swiotlb.h    | 3 +++
>   4 files changed, 17 insertions(+)
> 
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index 95bae74fdab2..6349a02a1da3 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -19,6 +19,9 @@
>   /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>   bool force_dma_unencrypted(struct device *dev)
>   {
> +	if (dev->use_priv_pages_for_io)
> +		return false;
> +
>   	/*
>   	 * For SEV, all DMA must be to unencrypted addresses.
>   	 */
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 80a5b3268986..4aa4a6fd9580 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -725,6 +725,8 @@ struct device_physical_location {
>    * @dma_skip_sync: DMA sync operations can be skipped for coherent buffers.
>    * @dma_iommu: Device is using default IOMMU implementation for DMA and
>    *		doesn't rely on dma_ops structure.
> + * @use_priv_pages_for_io: Device is using private pages for I/O, no need to
> + *		bounce-buffer.
>    *
>    * At the lowest level, every device in a Linux system is represented by an
>    * instance of struct device. The device structure contains the information
> @@ -843,6 +845,7 @@ struct device {
>   #ifdef CONFIG_IOMMU_DMA
>   	bool			dma_iommu:1;
>   #endif
> +	bool			use_priv_pages_for_io:1;
>   };
>   
>   /**
> @@ -1079,6 +1082,11 @@ static inline bool dev_removable_is_valid(struct device *dev)
>   	return dev->removable != DEVICE_REMOVABLE_NOT_SUPPORTED;
>   }
>   
> +static inline bool dev_priv_pages_for_io(struct device *dev)
> +{
> +	return dev->use_priv_pages_for_io;
> +}
> +
>   /*
>    * High level routines for use by the bus drivers
>    */
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index d7e30d4f7503..b096369f847e 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -94,6 +94,9 @@ static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
>    */
>   static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>   {
> +	if (dev_priv_pages_for_io(dev))
> +		return phys_to_dma_unencrypted(dev, paddr);
> +
>   	return __sme_set(phys_to_dma_unencrypted(dev, paddr));
>   }
>   
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3dae0f592063..35ee10641b42 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -173,6 +173,9 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
>   {
>   	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>   
> +	if (dev_priv_pages_for_io(dev))
> +		return false;
> +
>   	return mem && mem->force_bounce;
>   }
>   


