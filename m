Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF4CEFCF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGydiHO/+qxKlR7LYytavZmg9/Cl33p1O44Nz95/LUE=; b=wJYSNk3lIABZCU
	Yef0opD1HPKXNRt/V51vTnDW6AFJRVOZYYqSzth3TK6fyCXWoGToZpRGzlqHaUtdRp8yubqLm+/gJ
	JcGg+ZFpzjrCNWAmKFpv0nvc+DrYb4fTlTeJ/QTKS3Mny3mPT4MikH4cI3ukoJ7V+4YD2GpFnEGXO
	2LVR2yMfJztH17PpuOc1IgfZqTXSv52a+/e3qlMgqfLiBpNp+8zyAlojVEX7sdtGDXDgSadYAYMPB
	NkgdJ4k2U/ELRPpuiVtpYNRBEP8Hvon/AIyFXjEVOUzXA3/3J3LZ8MHz8F/jWzL4by3feo9QYJ7pZ
	kV/ahxN+4Cj40pRW31KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCTV-0000000DkFZ-46Hz;
	Tue, 06 Jan 2026 19:12:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCTT-0000000DkF6-0was
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:12:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9CDB497;
	Tue,  6 Jan 2026 11:12:00 -0800 (PST)
Received: from [10.57.46.241] (unknown [10.57.46.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C7853F5A1;
	Tue,  6 Jan 2026 11:12:04 -0800 (PST)
Message-ID: <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
Date: Tue, 6 Jan 2026 19:12:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
To: Barry Song <21cnbao@gmail.com>, Leon Romanovsky <leon@kernel.org>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com> <20251227200933.GO11869@unreal>
 <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal>
 <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_111211_353497_728A7B18 
X-CRM114-Status: GOOD (  26.42  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2026-01-06 6:41 pm, Barry Song wrote:
> On Mon, Dec 29, 2025 at 3:50 AM Leon Romanovsky <leon@kernel.org> wrote:
>>
>> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
>>> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> wrote:
>>>>
>>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
>>>>> From: Barry Song <baohua@kernel.org>
>>>>>
>>>>> Instead of performing a flush per SG entry, issue all cache
>>>>> operations first and then flush once. This ultimately benefits
>>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
>>>>>
>>>>> Cc: Leon Romanovsky <leon@kernel.org>
>>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: Will Deacon <will@kernel.org>
>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>>>> ---
>>>>>   kernel/dma/direct.c | 14 +++++++-------
>>>>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>>>
>>>> <...>
>>>>
>>>>> -             if (!dev_is_dma_coherent(dev)) {
>>>>> +             if (!dev_is_dma_coherent(dev))
>>>>>                        arch_sync_dma_for_device(paddr, sg->length,
>>>>>                                        dir);
>>>>> -                     arch_sync_dma_flush();
>>>>> -             }
>>>>>        }
>>>>> +     if (!dev_is_dma_coherent(dev))
>>>>> +             arch_sync_dma_flush();
>>>>
>>>> This patch should be squashed into the previous one. You introduced
>>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
>>>
>>> Hi Leon,
>>>
>>> The previous patch replaces all arch_sync_dma_for_* calls with
>>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
>>> functional change. The subsequent patches then implement the
>>> actual batching. I feel this is a better approach for reviewing
>>> each change independently. Otherwise, the previous patch would
>>> be too large.
>>
>> Don't worry about it. Your patches are small enough.
> 
> My hardware does not require a bounce buffer, but I am concerned that
> this patch may be incorrect for systems that do require one.
> 
> Now it is:
> 
> void dma_direct_sync_sg_for_cpu(struct device *dev,
>                  struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> {
>          struct scatterlist *sg;
>          int i;
> 
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
>                  if (!dev_is_dma_coherent(dev))
>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> 
>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
>                  if (dir == DMA_FROM_DEVICE)
>                          arch_dma_mark_clean(paddr, sg->length);
>          }
> 
>          if (!dev_is_dma_coherent(dev)) {
>                  arch_sync_dma_flush();
>                  arch_sync_dma_for_cpu_all();
>          }
> }
> 
> Should we call swiotlb_sync_single_for_cpu() and
> arch_dma_mark_clean() after the flush to ensure the CPU sees the
> latest data and that the memcpy is correct? I mean:

Yes, this and the equivalents in the later patches are broken for all 
the sync_for_cpu and unmap paths which may end up bouncing (beware some 
of them get a bit fiddly) - any cache maintenance *must* be completed 
before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 thing, 
and appears to be entirely dead now.

Thanks,
Robin.

> void dma_direct_sync_sg_for_cpu(struct device *dev,
>                  struct scatterlist *sgl, int nents, enum dma_data_direction dir)
> {
>          struct scatterlist *sg;
>          int i;
> 
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
>                  if (!dev_is_dma_coherent(dev))
>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
>          }
> 
>          if (!dev_is_dma_coherent(dev)) {
>                  arch_sync_dma_flush();
>                  arch_sync_dma_for_cpu_all();
>          }
> 
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
>                  if (dir == DMA_FROM_DEVICE)
>                          arch_dma_mark_clean(paddr, sg->length);
>          }
> }
> 
> Could this be the same issue for dma_direct_unmap_sg()?
> 
> Another option is to not support batched synchronization for the bounce
> buffer case, since it is rare. In that case, it could be:
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 550a1a13148d..a4840f7e8722 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>          for_each_sg(sgl, sg, nents, i) {
>                  phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
> 
> -               if (!dev_is_dma_coherent(dev))
> +               if (!dev_is_dma_coherent(dev)) {
>                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> +                       if (unlikely(dev->dma_io_tlb_mem))
> +                               arch_sync_dma_flush();
> +               }
> 
>                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);
> 
> What’s your view on this, Leon?
> 
> Thanks
> Barry


