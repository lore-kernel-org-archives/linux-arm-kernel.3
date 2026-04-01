Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0C5D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqAh8+J+p74P/kyDkkVzKjpnfMDd7XwXqLzKDtTGffs=; b=xEj7JIT4pY5tVMXdleEeMSlwfN
	qLJG96/NV+JKd5EwnPjoxho+RElzaLSqh36GWpaT/BWKVg7EKBWtgXEyrW572zuyxKkxJ3A2lUG/J
	3HFetZdbk8E8bpeC3igtyOJQT0P8W+IhW9uzHcsdcJvHmM+WSTIAD2deNyyDZYVP7Fa5xAZ/R6Pg/
	Q8cGha2WFYTmHiciq8RqRHwKAHN0kxVwiluiGdvm5Zxd7Zt4ToT5chiTG/Ncv8iOPinxia+Rf4D9I
	S9bwa8V35EtdKbR4dLnF6lA9/fOwH7Orarj2Z6q/xJbS7JVeAJwn8tBx3pIuvSaV7qN0j6VfF8xgn
	zRhAn7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upN-0000000FCHk-1Wpp;
	Wed, 01 Apr 2026 12:37:46 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uce-0000000F2j5-3C56
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1775046275;
 bh=SqAh8+J+p74P/kyDkkVzKjpnfMDd7XwXqLzKDtTGffs=;
 b=FQ9oOky/PQf60NrvvsUnsYxWSLbTXCu9+DwT7Klcq4FXq37Q5nE/AeVAfyIztx12pvDM5Dy5j
 oyRK1wYLXhcY30QaOkW697YuxFO3hhp0PXOtPYNP4e8QqXlOQSHfRl5R0NSMYj0KaV0zBfgioac
 PCkwXBZslzBzKAMSuyUkLLWvARgK2XPZDWdC/FWDXuLoDno20J44PDdQ4TVAv1uNKaDmUQU9AeK
 YcnqvHMhCCDocyupD9UyY7BB9blBx2jvcLED+6bMuI2gEYKBh+KC66mOzGGxloRtT41MPByk149
 iYymjx4aVrcH6s2WdBu4IfJZB6FyvjxuozMx2GcQcAlw==
X-Forward-Email-ID: 69ccda55842394fec82951f9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.64
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e622cc9e-8fb0-454a-b88e-dc13cf2ff507@kwiboo.se>
Date: Wed, 1 Apr 2026 10:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/rockchip: fix page table allocation flags for v2
 IOMMU
To: Simon <xxm@rock-chips.com>, Midgy BALON <midgy971@gmail.com>
Cc: iommu@lists.linux.dev, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260331075010.1463-1-midgy971@gmail.com>
 <0f285782-b12a-4abd-bca7-b6c549bed59f@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <0f285782-b12a-4abd-bca7-b6c549bed59f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_052436_887115_291481E6 
X-CRM114-Status: GOOD (  22.49  )
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

Hi Simon,

On 4/1/2026 9:48 AM, Simon wrote:
> Hi Midgy,
> 
> 在 2026/3/31 15:50, Midgy BALON 写道:
>> commit 2a7e6400f72b ("iommu: rockchip: Allocate tables from all
>> available memory for IOMMU v2") removed GFP_DMA32 from
>> iommu_data_ops_v2, reasoning that RK356x and RK3588 IOMMU v2 hardware
>> supports up to 40-bit physical addresses for page tables.  However, the
>> RK3568 IOMMU page-table walker uses a 32-bit AXI bus: it cannot access
>> physical addresses above 4 GB regardless of the address encoding range.
>>
>> On boards with more than 4 GB of RAM (e.g. 8 GB LPDDR4X), removing
>> GFP_DMA32 causes two distinct failure modes:
>>
>> 1. Direct allocation above 4 GB: iommu_alloc_pages_sz() may return
>>     memory above 0x100000000.  The hardware page-table walker issues a
>>     bus error trying to dereference those addresses, causing an IOMMU
>>     fault on the first DMA transaction.
>
> Which IP block is hitting this? We'd like to take a look on our end.

I have seen reports that the NPU MMU on RK3568/RK3566 is having some
issue using DTE/PTE with >32-bit addresses, maybe it uses a different
MMU hw revision or has some hw errata?

From my own testing at least the VOP2 MMU on RK3568 (and RK3588) was
able to handle 40-bit addressable DTE/PTE, hence the original commit
2a7e6400f72b ("iommu: rockchip: Allocate tables from all available
memory for IOMMU v2").

As also mentioned in my reply at [1], maybe the NPU MMU has some hw
limitation or errata and may need to use a different compatible.

[1] https://lore.kernel.org/r/3cd63b3d-1c5e-4a11-856e-c4aeb5d97d55@kwiboo.se/

Regards,
Jonas

>
>> 2. SWIOTLB bounce-buffer poisoning: without GFP_DMA32, page tables land
>>     above the SWIOTLB window.  dma_map_single() with DMA_BIT_MASK(32)
>>     then bounces them into a buffer below 4 GB.  rk_dte_get_page_table()
>>     returns phys_to_virt() of the bounce buffer address; PTEs are written
>>     there; the next dma_sync_single_for_device(DMA_TO_DEVICE) copies the
>>     original (zero) data back over the bounce buffer, silently erasing the
>>     freshly written PTEs.  The IOMMU faults because every PTE reads as zero.
>
> This probably need a separate patch. One way to fix it would be to track the
> original L2 page table base addresses in struct rk_iommu_domain,
> then have rk_dte_get_page_table() return the tracked address instead of
> deriving it from the DTE.
>
>> Restore GFP_DMA32 (and DMA_BIT_MASK(32)) for iommu_data_ops_v2, which
>> currently only serves "rockchip,rk3568-iommu" in mainline.
>>
>> Tested on Radxa ROCK 3B (RK3568, 8 GB LPDDR4X):
>>    - MobileNetV1 via RKNN: 5.8 ms/inference (IOMMU mode)
>>    - YOLOv5s 640x640 via RKNN: ~57 ms/inference (IOMMU mode)
>>    - No IOMMU faults, correct inference results
>>
>> Fixes: 2a7e6400f72b ("iommu: rockchip: Allocate tables from all available memory for IOMMU v2")
>> Cc: stable@vger.kernel.org
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Signed-off-by: Midgy BALON <midgy971@gmail.com>
>> ---
>>   drivers/iommu/rockchip-iommu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
>> index 85f3667e797..8b45db29471 100644
>> --- a/drivers/iommu/rockchip-iommu.c
>> +++ b/drivers/iommu/rockchip-iommu.c
>> @@ -1358,8 +1358,8 @@ static struct rk_iommu_ops iommu_data_ops_v2 = {
>>   	.pt_address = &rk_dte_pt_address_v2,
>>   	.mk_dtentries = &rk_mk_dte_v2,
>>   	.mk_ptentries = &rk_mk_pte_v2,
>> -	.dma_bit_mask = DMA_BIT_MASK(40),
>> -	.gfp_flags = 0,
>> +	.dma_bit_mask = DMA_BIT_MASK(32),
>> +	.gfp_flags = GFP_DMA32,
>>   };
>>   
>>   static const struct of_device_id rk_iommu_dt_ids[] = {


