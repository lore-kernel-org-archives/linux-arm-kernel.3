Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A181F54AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5X3SqA0NrhU8AeVF5jet7aCXTAzqHe7Enn6xkPUCkU=; b=2/f9/sL6SOYbpIyqULPj0hqfxP
	exCCe4Hs3g7+rpEWNdEvOyb7WBZX4MqlO8Ye2mXLxROpWU+gbHXfpZ4kh+CfP/d0q21BdLsm/d0ne
	VjgkxqLOXQa4vETLGzfUHxq3pYhwYXfB+nMUyrpFHoun69yoQFGkNsF2z8cRIEEf5Ez1YhGho+m28
	rhG/VTLZzMkoPwK8AADld6WxjBFA1x+U3Q74RMaWDeDFoq9jzze2D0PF/50SIVWsbevTntqh9ZLgo
	ldXJVde8S6gGcDhwOdEsSAtlYyrLCv81ZmC6H+nuk88INnseE9TEhmvuAeZ9f1pQDPE//sfk6/c4i
	uVjraciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54cn-00000001t9E-0Enc;
	Tue, 24 Mar 2026 16:29:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54ck-00000001t8q-0YN6;
	Tue, 24 Mar 2026 16:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774369730; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eI9dMyF9lyTBU47/dNjJX4pYrTLhKGPqdtY8yk6tX5oCIOG4y8LQU+Jizxu15GDLuqrY4uqt2WHUvati3yXIze5uBujqYGwtFBY5H5mHTLvxHm2zWW4fFZ6BDhA9i4bMKiDSsiV2EQe5c+2jbNO0zcqCWfGLVuBX/wvk/vOyep8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774369730; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t5X3SqA0NrhU8AeVF5jet7aCXTAzqHe7Enn6xkPUCkU=; 
	b=FxFfhtT6NX1Ud2ZwoYXinAAViGyyojNLA8ssB0d+eFn4Pzwezq1KrBA29ZZljWyPz1GJpa/xtOLRWk2X5ckIfSFNgKTSzfohcI84yQORpBeVr0+Mp7RIbXmNb/vee68LX6S0+8MiV3G1t3ws2N7aG34q+3JSmjFLZUFpaSkEF18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774369730;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t5X3SqA0NrhU8AeVF5jet7aCXTAzqHe7Enn6xkPUCkU=;
	b=ktXrz/zNw7uP6zfATbCvxvk+TSkFH+917YIv5Z8vAOMJP1mD9pejXujIsLd2f/wG
	U9hj/gBTuad5HtS3WfWSZJYkecZNVQZh/fpypDRSoKDwXQswj0oLcxOQb+V+l5bF0qK
	bIUZnFgrHbIgxYKBFxloim2OU3i+5tDxWK2YQUx4=
Received: by mx.zohomail.com with SMTPS id 1774369728573435.9502112379421;
	Tue, 24 Mar 2026 09:28:48 -0700 (PDT)
Message-ID: <e083e933-2746-4b26-ac33-3b32d362b28e@collabora.com>
Date: Tue, 24 Mar 2026 17:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/6] iommu: Add verisilicon IOMMU driver
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
 <20260216095144.107356-4-benjamin.gaignard@collabora.com>
 <acKxzGk1Z541yoZ4@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <acKxzGk1Z541yoZ4@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_092858_216138_F3736DBB 
X-CRM114-Status: GOOD (  25.09  )
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


Le 24/03/2026 à 16:46, Will Deacon a écrit :
> On Mon, Feb 16, 2026 at 10:51:35AM +0100, Benjamin Gaignard wrote:
>> The Verisilicon IOMMU hardware block can be found in combination
>> with Verisilicon hardware video codecs (encoders or decoders) on
>> different SoCs.
>> Enable it will allow us to use non contiguous memory allocators
>> for Verisilicon video codecs.
>> If both decoder and this iommu driver are compiled has modules
>> there is undefined symboles issues so this iommu driver could
>> only be compiled has built-in.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   MAINTAINERS               |   8 +
>>   drivers/iommu/Kconfig     |  11 +
>>   drivers/iommu/Makefile    |   1 +
>>   drivers/iommu/vsi-iommu.c | 794 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/vsi-iommu.h |  21 +
>>   5 files changed, 835 insertions(+)
>>   create mode 100644 drivers/iommu/vsi-iommu.c
>>   create mode 100644 include/linux/vsi-iommu.h
> [...]
>
>> +static size_t vsi_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
>> +			      size_t size, size_t count, struct iommu_iotlb_gather *gather)
>> +{
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
>> +	unsigned long flags;
>> +	phys_addr_t pt_phys;
>> +	u32 dte;
>> +	u32 *pte_addr;
>> +	size_t unmap_size = 0;
>> +
>> +	spin_lock_irqsave(&vsi_domain->lock, flags);
>> +
>> +	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
>> +	/* Just return 0 if iova is unmapped */
>> +	if (!vsi_dte_is_pt_valid(dte))
>> +		goto unlock;
>> +
>> +	pt_phys = vsi_dte_pt_address(dte);
>> +	pte_addr = (u32 *)phys_to_virt(pt_phys) + vsi_iova_pte_index(iova);
>> +	pte_dma = pt_phys + vsi_iova_pte_index(iova) * sizeof(u32);
>> +	unmap_size = vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma, size);
>> +
>> +unlock:
>> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
>> +
>> +	return unmap_size;
>> +}
> I still think you need TLB invalidation here.
>
> I looked at the downstream code that you linked to and it litters the
> invalidation in the callers via mpp_iommu_flush_tlb(), which tend to
> invalidate _before_ starting an operation. That's very likely buggy and
> certainly not something we want upstream.
>
> The unmap routine should do the invalidation so that, when it returns,
> the pages really are unmapped from the device (assuming strict mode).
>
> I know you said that you tried to add invalidation here and it "didn't
> work", but that's not something I can really help you with.

I know you expect the hardware to work like that but that isn't not the case.
I spend quite long to try to found hidden bit(s) or an other way to do like
you want but I can't find any solution.
As you mention the downstream code suggest that the iommu can't invalidate
TLB in unmap routine so I don't see how to progress.
Maybe we should just admit that is how the hardware work.
This v13 has fixed the documentation so I don't plan to spend more time on this driver.

Benjamin

>
> Will

