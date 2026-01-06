Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0A7CEFCFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG60FZDkcqzWhE70VeJQVrD+9VvdPHIYIWCrDYXnyBk=; b=jxgicCYMToarMA
	ib/LM5NLwe+SNJm+tkWfxB+Su2bCoiQgigfnq4QXLgM7z+Z6abfZEWEb0MIFIhiSQ/D8psEaKMNNn
	3doJR9yMLFqtdOwMof7uvYGIR+9VdvtpREDcub3KxIhJd/no6qfKKSGQwui2Qpae2ChaLxnI4Mfqf
	7S/n1G+n1CNMD/5PKcwkmNzBsOQeWfKXT9PG4b8u1Pbo/8dCfqmuVgP4LAU6YuKmpFiR5zw0gxmBj
	9oERwr6Fzku7vjVZ+KSay34ru7FDUXRlAOj7SzowfGp8kqPV0UkLn5PkAi/+VaaWn3OrbeU1atN+P
	LPE1B0wDC4KyPTqqVjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCwd-0000000Dlwg-4B6c;
	Tue, 06 Jan 2026 19:42:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCwb-0000000Dlw1-3GcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:42:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01059497;
	Tue,  6 Jan 2026 11:42:09 -0800 (PST)
Received: from [10.57.46.241] (unknown [10.57.46.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 259E33F5A1;
	Tue,  6 Jan 2026 11:42:13 -0800 (PST)
Message-ID: <73c533b9-1315-409f-baad-ef9a46ab6bf0@arm.com>
Date: Tue, 6 Jan 2026 19:42:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 8/8] dma-iommu: Support DMA sync batch mode for
 iommu_dma_sync_sg_for_{cpu, device}
To: Barry Song <21cnbao@gmail.com>, Leon Romanovsky <leon@kernel.org>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-9-21cnbao@gmail.com> <20251227201642.GQ11869@unreal>
 <CAGsJ_4xssfB7hNOWLDianQfx+9wC2e4qZKtRBUzEZ-v97Sa63Q@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGsJ_4xssfB7hNOWLDianQfx+9wC2e4qZKtRBUzEZ-v97Sa63Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_114217_950915_65E80C11 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2025-12-27 8:59 pm, Barry Song wrote:
> On Sun, Dec 28, 2025 at 9:16 AM Leon Romanovsky <leon@kernel.org> wrote:
>>
>> On Sat, Dec 27, 2025 at 11:52:48AM +1300, Barry Song wrote:
>>> From: Barry Song <baohua@kernel.org>
>>>
>>> Apply batched DMA synchronization to iommu_dma_sync_sg_for_cpu() and
>>> iommu_dma_sync_sg_for_device(). For all buffers in an SG list, only
>>> a single flush operation is needed.
>>>
>>> I do not have the hardware to test this, so the patch is marked as
>>> RFC. I would greatly appreciate any testing feedback.
>>>
>>> Cc: Leon Romanovsky <leon@kernel.org>
>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>> Cc: Joerg Roedel <joro@8bytes.org>
>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>> Signed-off-by: Barry Song <baohua@kernel.org>
>>> ---
>>>   drivers/iommu/dma-iommu.c | 15 +++++++--------
>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
>>> index ffa940bdbbaf..b68dbfcb7846 100644
>>> --- a/drivers/iommu/dma-iommu.c
>>> +++ b/drivers/iommu/dma-iommu.c
>>> @@ -1131,10 +1131,9 @@ void iommu_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sgl,
>>>                        iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
>>>                                                      sg->length, dir);
>>>        } else if (!dev_is_dma_coherent(dev)) {
>>> -             for_each_sg(sgl, sg, nelems, i) {
>>> +             for_each_sg(sgl, sg, nelems, i)
>>>                        arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
>>> -                     arch_sync_dma_flush();
>>> -             }
>>> +             arch_sync_dma_flush();
>>
>> This and previous patches should be squashed into the one which
>> introduced arch_sync_dma_flush().
> 
> Hi Leon,
> 
> The series is structured to first introduce no functional change by
> replacing all arch_sync_dma_for_* calls with arch_sync_dma_for_* plus
> arch_sync_dma_flush(). Subsequent patches then add batching for
> different scenarios as separate changes.
> 
> Another issue is that I was unable to find a board that both runs
> mainline and exercises the IOMMU paths affected by these changes.
> As a result, patches 7 and 8 are marked as RFC, while the other
> patches have been tested on a real board running mainline + changes.

FWIW if you can get your hands on an M.2 NVMe for the Rock5 then that 
has an SMMU in front of PCIe (and could also work to test non-coherent 
SWIOTLB, with the SMMU in bypass and either some fake restrictive 
dma-ranges in the DT or a hack to reduce the DMA mask in the NVMe driver.)

Cheers,
Robin.

