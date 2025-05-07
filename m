Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701CBC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8buZYuRgZW0mWtx9kUXzQVxAfN762DykqA5DEZn2y0=; b=rVgm7RxyWymJFy0M7L2hQkmRuR
	etTXGx6d4J4HqS+2BHipHKVk7ZNH8dvf23sbtEv3sokGJXPmBV3iqo7R3l8nN2gHZqetdcxKTQjOG
	ckGRJr/W8QtqJeGD/yO/bvRQfGIp8Pfl99XWEvdTIKntHLRcep2qHjfaMifkuzOOO1imllKnanatz
	+SAWDVkrpVKKWW6EB/5H3xGRNnugCNovlCwhv6YbEdK0/tr3GZ8l4TSYJtn6lXDKbkHE+M2NMv86b
	iPUDVNlPWi0oBSpRW3lQnEbUa02KjhI8Fm4kAK+lpLL4o3JrfdtD9bkHsdPD/UOrFFfckxBF5p/Fl
	OhEemj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgv7-0000000G16D-2XuS;
	Wed, 07 May 2025 15:42:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgPF-0000000FuAi-3Whu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47416339;
	Wed,  7 May 2025 08:09:45 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAD23F778;
	Wed,  7 May 2025 08:09:48 -0700 (PDT)
Message-ID: <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
Date: Wed, 7 May 2025 16:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507142953.269300-1-robdclark@gmail.com>
 <20250507144038.GC33739@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250507144038.GC33739@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_080957_936182_F6D834AC 
X-CRM114-Status: GOOD (  13.73  )
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

On 07/05/2025 3:40 pm, Jason Gunthorpe wrote:
> On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> In situations where mapping/unmapping sequence can be controlled by
>> userspace, attempting to map over a region that has not yet been
>> unmapped is an error.  But not something that should spam dmesg.
>>
>> Now that there is a quirk, we can also drop the selftest_running
>> flag, and use the quirk instead for selftests.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> Sending v2 stand-alone, since I'm not quite ready to send a new
>> iteration of the full VM_BIND series.  And with selftest_running
>> removed, I think this patch stands on it's own.  (And maybe there
>> is still time to sneak this in for v6.16, removing an iommu dep
>> for the VM_BIND series in v6.17?)
> 
> You should just remove the warn on completely, no other driver does this.

What do you mean "no other driver"?

 From a quick look, these IOMMU drivers have some sort of visible 
warning related to the state of an existing PTE during map/unmap:

apple-dart
arm-smmu
arm-smmu-v3
arm-smmu-qcom
exynos-iommu
ipmmu_vmsa
msm_iommu
mtk_iommu
rockchip-iommu
s390-iommu
sun50i-iommu
qcom_iommu

while these IOMMU drivers do not:

amd
intel
mtk_iommu_v1
omap-iommu
riscv
sprd-iommu
tegra-smmu
virtio-iommu

By driver count, warning is literally the majority behaviour :/

Thanks,
Robin.

