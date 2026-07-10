Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842F6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEE4NJS8wvTdtmRLZBWw21+O+2hmHyqWWDCI6XsBwKE=; b=Mlxn/lAzTNC+WXNutBhA1lh1Tl
	4Ov1MnWDFCCcD42xJTgVeoi3gTcnaT0Xl5c+1hibWdZWP3IqE1ioROSXYTw8QQgjRolAtGLx35wk0
	QvaMl6eg/xm0rNt/Jgi9MDwE+W8J3sTNsLSxhiHTO+IJmOF1Pfo1sNE39bp1w+CjV78us8VXAMfva
	T3waOpWNTuIGCI3h9vsz8gYRdk2KJPe4XsMuDxFtowubu46SlBHQLyT7NENjwiJeQk7Z05jE6hLSa
	JFtgKSQaD7AfHkBI4y9lMf5z0SO249+mCzZu6V3oVRXY505gPBD9viX5yMR8NFvBcPn/9/YHcvSTw
	pzh9RYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiA56-00000004trC-11yt;
	Fri, 10 Jul 2026 12:11:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiA53-00000004tqV-0noa;
	Fri, 10 Jul 2026 12:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AFAF1E7D;
	Fri, 10 Jul 2026 05:11:40 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12DFD3F85F;
	Fri, 10 Jul 2026 05:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783685504; bh=Q2see9+GI8xU//+CtviZOZx19CnBHqZmF8tVQaULcbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5p3BRWSyMoNDxD/QaUv5QMjXLFZnnn18JTuKVPlAZXBN450QHvPpSetMzN/GZ3zj
	 W2IiiMPdZtGLD+M+Anx7Qy1UV4t86jKoZu1P3IZDMTQyiPguDn8CfF299YNnaznMWE
	 KZwYaOSphRKwtuby8ouXyFEY7FmW5cqo+6Mbxy0k=
Message-ID: <15bbada2-3214-45dc-8934-a6dbe207c887@arm.com>
Date: Fri, 10 Jul 2026 13:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/rockchip: implement .flush_iotlb_all
To: Will Deacon <will@kernel.org>, Jiaxing Hu <huhuvmb88@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jgg@ziepe.ca
References: <20260710060513.863714-1-huhuvmb88@gmail.com>
 <alDQevX58XvdRcWc@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <alDQevX58XvdRcWc@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_051145_278698_C67FCA57 
X-CRM114-Status: GOOD (  17.05  )
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

On 10/07/2026 11:59 am, Will Deacon wrote:
> On Fri, Jul 10, 2026 at 06:05:13PM +1200, Jiaxing Hu wrote:
>> rk_iommu invalidates the IOTLB synchronously in .unmap (via
>> rk_iommu_zap_iova), so it stays consistent without a deferred .iotlb_sync
>> and does not advertise IOMMU_CAP_DEFERRED_FLUSH.
>>
>> It never implemented the optional .flush_iotlb_all op, though, and
>> iommu_flush_iotlb_all() is a no-op when that op is absent -- so on Rockchip
>> a driver that owns an rk_iommu domain and calls it to flush the whole
>> domain's TLB (e.g. before reusing a mapping, without unmapping it) gets
>> nothing, even though the hardware can do it: rk_iommu already issues
>> ZAP_CACHE for range shootdowns.
>>
>> Implement it with that same primitive: ZAP_CACHE every bank of every IOMMU
>> on the domain, under the runtime-PM + clk guard already used by
>> rk_iommu_zap_iova().
>>
>> Found while bringing up an out-of-tree RK3576 NPU (accel/rocket) driver
>> that flushes before each submit; on Rockchip that flush did nothing.
>>
>> Signed-off-by: Jiaxing Hu <huhuvmb88@gmail.com>
>> ---
> 
> We tried to get rid of iommu_flush_iotlb_all() in 69e5a17511f6
> ("iommu: Remove useless flush from iommu_create_device_direct_mappings()")
> but we had to revert that in a33bf8d8ce7e ("iommu: Restore
> iommu_flush_iotlb_all()") because of a user in the MSM driver.

We wanted rid of the public API (indeed partly due to the prospect of 
client drivers abusing it), but the actual ->flush_tlb_all driver op 
remains crucial to the flush queue mechanism, so there's no harm in 
drivers implementing it *if* they also implement the relevant 
optimisations to avoid synchronous flushing in unmap_pages to make 
CAP_DEFERRED_FLUSH worthwhile.

Thanks,
Robin.

> So I think this is the wrong direction. We should try harder to remove
> the function rather than add new implementations of it. I'm assuming
> you're only adding it for some out-of-tree code that calls it?
> 
> Will


