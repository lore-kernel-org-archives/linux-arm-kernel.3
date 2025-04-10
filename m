Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76260C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6nd/ocisDTqslfqChrh1TkuKhin7w/00xiipHWw5zk=; b=AE2J2bLnjZ5zPVULE86xWZ3K84
	pwTgatp8lCpIhCJEksUnfOdN8pe56FUG3FgV5Lusl73mEttgC70QMwgegMMkkGOBD26UV7uxBWyWQ
	u9d4ehddTIA4MrLmjLT6s+MQt+785eZnab/v5M62BFf+TUr/R2gyXbezeRf0+PoVZHxXFRCmLyXY2
	It9HkG3SGgydLuZjUvWwE2cFYxFGzZ2pzABckN6l9mihH+SNzlecgzAUZrjgZOcmlurE4gyIeAT5B
	l5+f373dTeLrMofdqzeG6rZFp3Kd7zLCVssIFOG3u/AcHhI1qHWckmfFMHxLD+0K+CPulsAqt92PT
	JSwkj8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qEC-0000000AKCL-0VZY;
	Thu, 10 Apr 2025 11:37:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pry-0000000AAvL-0hpA;
	Thu, 10 Apr 2025 11:14:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E943E106F;
	Thu, 10 Apr 2025 04:14:52 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7B73F6A8;
	Thu, 10 Apr 2025 04:14:50 -0700 (PDT)
Message-ID: <2e2ad90b-9e48-4711-a8da-85668493259b@arm.com>
Date: Thu, 10 Apr 2025 12:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/mediatek: Fix NULL pointer deference in
 mtk_iommu_device_group
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Joerg Roedel <joro@8bytes.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, kernel@collabora.com,
 Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250403-fix-mtk-iommu-error-v2-1-fe8b18f8b0a8@collabora.com>
 <CAGXv+5HJpTYmQ2h-GD7GjyeYT7bL9EBCvu0mz5LgpzJZtzfW0w@mail.gmail.com>
 <2792b9df-fc82-4252-af64-cf888a36f561@arm.com>
 <CAGXv+5E=NhFcS0fG_kbLTnF6xfTkBOHQwsNxszHDcgWfn3zFiA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGXv+5E=NhFcS0fG_kbLTnF6xfTkBOHQwsNxszHDcgWfn3zFiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_041454_290508_99F68D3A 
X-CRM114-Status: GOOD (  33.14  )
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

On 08/04/2025 5:46 am, Chen-Yu Tsai wrote:
> On Mon, Apr 7, 2025 at 8:38 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2025-04-07 6:17 am, Chen-Yu Tsai wrote:
>>> Hi,
>>>
>>> On Thu, Apr 3, 2025 at 6:24 PM Louis-Alexis Eyraud
>>> <louisalexis.eyraud@collabora.com> wrote:
>>>>
>>>> Currently, mtk_iommu calls during probe iommu_device_register before
>>>> the hw_list from driver data is initialized. Since iommu probing issue
>>>> fix, it leads to NULL pointer dereference in mtk_iommu_device_group when
>>>> hw_list is accessed with list_first_entry (not null safe).
>>>>
>>>> So, change the call order to ensure iommu_device_register is called
>>>> after the driver data are initialized.
>>>>
>>>> Fixes: 9e3a2a643653 ("iommu/mediatek: Adapt sharing and non-sharing pgtable case")
>>>> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
>>>> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
>>>> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 Juniper, MT8186 Tentacruel
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>>>> ---
>>>> This patch fixes a NULL pointer dereference that occurs during the
>>>> mtk_iommu driver probe and observed at least on several Mediatek Genio boards:
>>>> ```
>>>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>>>
>>> This is a reminder to please land this and send to Linus ASAP.
>>>
>>> This fixes the v6.15-rc1 kernel on all the MediaTek Chromebook platforms,
>>> except for MT8188, which seems to have another issue in iommu_get_dma_domain()
>>> used from the DRM driver:
>>>
>>>       Disabling lock debugging due to kernel taint
>>>       Unable to handle kernel NULL pointer dereference at virtual
>>> address 0000000000000158
>>
>>   From the offset and the stacktrace code dump, this would appear to be
>> the dereference of dev->iommu_group->default_domain, when
>> dev->iommu_group is NULL (and CONFIG_DEBUG_LOCK_ALLOC makes the mutex
>> really big). Which is a bit weird, as to get into iommu-dma at all in
>> that state would suggest that whatever device this is has been removed
>> and had its group torn down again after iommu_setup_dma_ops() has run...
>> but either way that implies the DRM driver is passing an arbitrary
>> device to the DMA API without making sure it's actualy valid.
>>
>> Trying to trace the provenance of dma_dev from mtk_gem_create() back
>> through the rest of the driver is quite the rabbit-hole, but it seems
>> like in at least one case it can lead back to an
>> of_find_device_by_node() in ovl_adaptor_comp_init(), which definitely
>> looks sufficiently sketchy.
> 
> It kind of makes sense since the "display controller" is composed of
> many individual hardware blocks. The struct device tied to the DRM
> driver is more or less just a place holder. Only the first block,
> either the OVL (overlay compositing engine) or RDMA (scanout engine)
> accesses memory, so I think it makes sense to use that as the dma_dev.

I'm not disputing whether the choice of dma_dev is semantically 
appropriate, I'm just saying that the method of pulling a struct device 
reference out of the DT topology shows no *obvious* guarantee that that 
specific device will have a driver bound and be validly configured 
before that dma_dev can be used via any other path. Especially when it's 
all happening off the back of another fake device created by the fake 
DRM device itself.

Maybe there's some hidden magic in all the component stuff which makes 
it work out fine, I don't know. This was just an observation since I 
went looking for potential bugs and found something which at first 
glance *looks* rather fragile, compared to, say, if mtk_mdp_rdma's own 
probe() or bind() were to directly set itself as the DMA device.

> With some more logs, I did find something else fishy. Here the IOMMU
> for the second display pipeline fails to probe:
> 
>      mtk-iommu 1c028000.iommu: error -EINVAL: Failed to register IOMMU
>      mtk-iommu 1c028000.iommu: probe with driver mtk-iommu failed with error -22
> 
> Then later on, deferred probe times out, and the display pipeline is
> brought up regardless:
> 
>      mediatek-disp-ovl 1c000000.ovl: deferred probe timeout, ignoring dependency
>      mediatek-disp-ovl 1c000000.ovl: Adding to IOMMU failed: -110
>      mediatek-disp-rdma 1c002000.rdma: deferred probe timeout, ignoring
> dependency
>      mediatek-disp-rdma 1c002000.rdma: Adding to IOMMU failed: -110
>      (repeats for all the individual components of the display pipeline)
>      mediatek-drm mediatek-drm.16.auto: bound 1c000000.ovl (ops
> mtk_disp_ovl_component_ops)
>      mediatek-drm mediatek-drm.16.auto: bound 1c002000.rdma (ops
> mtk_disp_rdma_component_ops)
>      (repeats for all the individual components of the display pipeline)
>      mediatek-drm mediatek-drm.16.auto: DMA device is 1c000000.ovl
>      [drm] Initialized mediatek 1.0.0 for mediatek-drm.16.auto on minor 1
> 
> And all without a functional IOMMU.

Ah, that I was not expecting, and it does indeed explain how things get 
into that state.

> So I think this brings up two more questions:
> 
> 1. Why is the IOMMU failing to probe?
> 2. Why is the core code still going the IOMMU DMA alloc path if there
>     is no usable IOMMU?
> 
> I'll look into the first question first. Insights welcome for the second
> one.

I had a think about it, and although there's very much a historical mess 
in this area, I'm inclined to agree that we could do better. Patch sent.

Cheers,
Robin.

