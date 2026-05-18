Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E619CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaHjQLjoZ0RKvTMa9o0qahWf3+S1KCRnhCd6+W/2lkI=; b=RK83kkWKEpdnFc3o29UNp3yoRP
	hdjpWdl9P5kfxdcq5NQ2joAUdqAGtWDLIgfd46R3ETrGfbNU9WGf6fa+GSzxBS7W+snCLYKyAMJyG
	TQefMxjLBbKfhjvYokPtwvaK9i9DWCvNh119Gy5LCXe3loLkYI4wTb/kwZAEJvnrOQdy+u8a663T/
	Qby1IXwR4T9ZJy+FYo2wPVgxC1Y1kbaGPV///HUIBFP6tGJz3Hf7KXUortyZl9lvHO3yqzgjpObzr
	L5X6mDQE18en9gUAIJkae9YmZ5u0fBJzwIiG84KXYw8rAQMNH/8wNVnRV9o40yxJnePIVjD5Jqeye
	LV8NaEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0HI-0000000GE2P-2X3G;
	Mon, 18 May 2026 15:53:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0HF-0000000GE1V-2IGz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43AE41CE0;
	Mon, 18 May 2026 08:53:00 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 146EA3F85F;
	Mon, 18 May 2026 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779119585; bh=jMXNL95liy6TgsVQCG7HsUijE+AyJo7sFeAB9TI1bf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFXXVjbC6bx4xzN2QF+cki9bxTyhDEhzDdCq8sHOyBT1rUSQeCXcb+nPt8QH/UsIY
	 M1RQRii5gNhE61qM7JIcNa+ZOea5Sq5Tc2/eCjhaIiF3shsazo4FJKaGW6Y3SVY4ve
	 KmVIFKSzr6mdCoj/g+Q+dD+oMMYr9Gvf4tDbCugQ=
Message-ID: <4cbd2bd2-9acc-4c72-a4f5-6c6cf31f71e1@arm.com>
Date: Mon, 18 May 2026 16:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iommu: Add PCI vendor:device ID to IOMMU fault logs
To: "Oguz, Yigit" <yigitogu@amazon.de>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
Cc: "jgg@ziepe.ca" <jgg@ziepe.ca>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <C1C278E8-E5F6-4701-9127-DCDBC64636E1@amazon.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <C1C278E8-E5F6-4701-9127-DCDBC64636E1@amazon.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_085309_668693_D8AE81BE 
X-CRM114-Status: GOOD (  33.27  )
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

On 18/05/2026 4:19 pm, Oguz, Yigit wrote:
> On 2026-05-08, Robin Murphy wrote:
>> Sorry, but why are unexpected DMA faults happening "at scale" in the
>> first place? If you have so many broken drivers that disambiguating them
>> needs help from the kernel, something seems fundamentally wrong with
>> that picture. Conversely if these are devices assigned to userspace then
>> we should perhaps reconsider their ability to spam up the host kernel
>> log at will anyway.
> 
> The use case is VFIO passthrough environments where translation faults
> show up during device lifecycle operations, mainly around device reset.
> When mappings are torn down and a device still has DMA in flight or
> issues DMA during/after FLR, the IOMMU blocks it and logs the fault.
> This series doesn't change when or whether events get logged, it just
> makes the existing lines more useful for triage when they do fire.
> 
>> I'm not saying I necessarily have anything against this change in
>> particular, but it has a strong smell of effort being spent on the wrong
>> thing...
> 
> Fair point. Whether the faults themselves should be addressed is a
> separate question, but since the kernel already logs them unconditionally,
> making the output more immediately useful seemed like low-hanging fruit.

TBH I think the more appropriate solution would be to have vfio-pci 
register its own fault handler, wherein it can properly deal with 
rate-limiting and/or entirely suppressing fault reports from misbehaving 
userspace, and if and when it does want to log something it is then free 
to do that in whatever format it wants, independent of the underlying 
IOMMU driver.

Thanks,
Robin.

>> (And even then AFAICS it only really helps in the specific scenario of
>> having only one of each type of device, otherwise you're back to still
>> needing per-system knowledge of how BDFs map to physical instances to
>> know what's what.)
> 
> The vendor:device ID answers the first question in triage: "what kind of
> device is this?" Even with multiple instances of the same type, narrowing
> by type cuts down the search space when correlating faults with device
> lifecycle events.
> 
> Thanks,
> Yigit
> 
> 
> On 2026-05-06 4:05 pm, Yigit Oguz wrote:
>> IOMMU fault and event logs currently identify devices using only their
>> PCI segment/bus/device/function (SSSS:BB:DD.F). While mapping a single
>> BDF to a device type is straightforward, doing so at scale across many
>> hosts and thousands of fault events requires additional tooling and
>> manual cross-referencing. Including the vendor:device ID directly in
>> the log line makes each event self-contained and immediately actionable
>> without any post-processing.
> 
> 
> Sorry, but why are unexpected DMA faults happening "at scale" in the
> first place? If you have so many broken drivers that disambiguating them
> needs help from the kernel, something seems fundamentally wrong with
> that picture. Conversely if these are devices assigned to userspace then
> we should perhaps reconsider their ability to spam up the host kernel
> log at will anyway.
> 
> 
> I'm not saying I necessarily have anything against this change in
> particular, but it has a strong smell of effort being spent on the wrong
> thing...
> 
> 
> (And even then AFAICS it only really helps in the specific scenario of
> having only one of each type of device, otherwise you're back to still
> needing per-system knowledge of how BDFs map to physical instances to
> know what's what.)
> 
> 
> Thanks,
> Robin.
> 
> 
>> This series adds vendor:device ID (VVVV:DDDD) to IOMMU event logs for
>> ARM SMMUv3, Intel VT-d and AMD IOMMU.
>>
>> Before:
>> arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0000:2b:11.6
>> sid: 0x158e ssid: 0x0 iova: 0x280000000000 ipa: 0x0
>> DMAR: [DMA Write NO_PASID] Request device [86:00.0] fault addr 0xe0000000
>> [fault reason 0x05] PTE Write access is not set
>> AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 domain=0x000a
>> address=0xe0000000 flags=0x0020]
>>
>> After:
>> arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0000:2b:11.6 [8086:1533]
>> sid: 0x158e ssid: 0x0 iova: 0x280000000000 ipa: 0x0
>> DMAR: [DMA Write NO_PASID] Request device [0000:86:00.0 8086:1533] fault addr 0xe0000000
>> [fault reason 0x05] PTE Write access is not set
>> AMD-Vi: Event logged [IO_PAGE_FAULT device=0000:41:00.0 8086:1533 domain=0x000a
>> address=0xe0000000 flags=0x0020]
>>
>> Patch 1 adds vendor:device ID to ARM SMMUv3 translation fault logs.
>> Patch 2 adds PCI segment and vendor:device ID to Intel VT-d DMAR
>> fault logs.
>> Patch 3 adds a devid_str helper and vendor:device ID to all AMD IOMMU
>> event log paths.
>>
>> Testing:
>> Build-tested against mainline Linux (torvalds/master).
>>
>> Runtime-tested on a custom downstream branch on ARM SMMUv3, Intel VT-d and
>> AMD IOMMU hosts. Translation faults were induced in a virtualized setup
>> by removing DMA mappings for an in-use region, causing the assigned device's
>> subsequent DMA transactions to hit unmapped IOVAs and produce
>> translation fault events. The resulting log lines were verified to
>> contain the PCI vendor:device ID on all three platforms.
>>
>> Lilit Janpoladyan (1):
>> iommu/arm-smmu-v3: Print PCI vendor:device ID in SMMU translation
>> fault logs
>>
>> Yigit Oguz (2):
>> iommu/vt-d: Add PCI segment and vendor:device ID to DMAR fault logs
>> iommu/amd: Add vendor:device ID to AMD IOMMU event logs
>>
>> drivers/iommu/amd/iommu.c | 94 +++++++++++++--------
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 29 ++++++-
>> drivers/iommu/intel/dmar.c | 33 +++++---
>> 3 files changed, 104 insertions(+), 52 deletions(-)
>>
> 
> 
> 
> 
> 
> 
> 
> 
> Amazon Web Services Development Center Germany GmbH
> Tamara-Danz-Str. 13
> 10243 Berlin
> Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
> Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> Sitz: Berlin
> Ust-ID: DE 365 538 597


