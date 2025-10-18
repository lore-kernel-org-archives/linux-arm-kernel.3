Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6111ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+51DM99CEdSFDPj0ZKr0xiXs9AF5iALomLseFpeJs8=; b=gYPTrahT/wksf2Fajy+GzsZksY
	uonBAdE4ImVN5qOop2Wvq5LCOJCV6Jc6qjegeRnZMGS7QJguCpmkBxySe+fiy3hveJ69naqeymW0W
	T6IIFFmDy9wHXIlnqToSfpELcAhVtFO344z+fmb3Xl/EqvySqG2Cx03WngFAbaKo80xP1jjmjcAHK
	EwUHcwSTXWXO+z0ciVSN4gZOS5Yi3XBxhJ3GzdNk74eCxl6TFKyBFrkftq2CK619PJBAgqe755xMZ
	+JgYyKyW9GWJpwfX5Onzc+lpN0ydve/7CyruvgqpJHOQjAE2b3PTAV6G5ki9fjZXaGHQGcn1QYdlt
	LWX1pKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA4Lu-00000009ocu-2bTO;
	Sat, 18 Oct 2025 10:39:58 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA4Lr-00000009oZn-32No
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 10:39:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=f+51DM99CEdSFDPj0ZKr0xiXs9AF5iALomLseFpeJs8=;
	b=Dh7p0h6ckcL1ZyDbAEAtZheChwQS6K8kQGdngk43Q4CA/ahRus3uQRF8JvXdkvLtbx7fuh6AH
	kFQDQFjiPNvy2ZqGHWGWln9eFQ7iI0xRts2OqA/rzKhTxTwB6vXYgx/XCY+FqDKFoKMjUsfOFMt
	JZSW+6SMJTSU73JqutAIizE=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4cpdT75xGyzcZyL;
	Sat, 18 Oct 2025 18:38:35 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id B5A0E14010D;
	Sat, 18 Oct 2025 18:39:39 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 18 Oct 2025 18:39:39 +0800
Message-ID: <e04eb4c8-3344-4a3b-bf00-c9221be5fe86@huawei.com>
Date: Sat, 18 Oct 2025 18:39:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iommu: Add io_ptdump debug interface for iommu
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<yangyicong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250902161028.GC184112@ziepe.ca>
 <f2720f17-5e81-4f69-aaf5-791b47973178@huawei.com>
 <20250910141547.GD882933@ziepe.ca>
 <bb4c3f0b-06da-46e6-9769-efe3dc00e9fb@huawei.com>
 <20250915162810.GI882933@ziepe.ca>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <20250915162810.GI882933@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_033956_134859_5E8522BB 
X-CRM114-Status: GOOD (  19.34  )
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



On 2025/9/16 00:28:10, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Thu, Sep 11, 2025 at 10:08:55PM +0800, Qinxin Xia wrote:
>>
>>
>> On 2025/9/10 22:15:47, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>> On Wed, Sep 10, 2025 at 11:20:08AM +0800, Qinxin Xia wrote:
>>>> Ok, I see, my colleague Wang Zhou also released a version of io_ptdump
>>>> a long time ago, which is implemented in smmu debugfs. Will recommends that
>>>> io_ptdump be implemented in a way similar to CPU page table dump. Using
>>>> debugfs to expose the data and using format-specific callbacks to implement
>>>> specific data dumps, I'll talk to him about this as well.
>>>
>>> I feel we should have a iommu subsystem debugfs and per-iommu_domain
>>> directories to dump the page tables.
>>>
>>> The smmu debugfs can report what iommu_domains each STE/CD is
>>> referencing.
>>>
>>> This also needs RCU freeing of page table levels as a locking
>>> strategy.
>>
>> Thanks, I'll add RCU in the next version, but there's some
>> confusion,
> 
> Please don't, RCU is quite complicated, I don't really want to see
> attempts to retrofit it into the existing page table code. This is why
> I've said debugging like this needs to go along with the new iommu pt
> work to consolidate the page table code.
> 
>> Do you
>> mean to create a directory for each domain? like：
>>
>> /sys/kernel/debug/io_page_tables/domain_xxxx (xxxx=domain addr)
> 
> Something like this could be a reasonable option.
> 
>> tree domain_xxxx like:
>> domain_xxxx
>> └── group x
>> │ └── device
> 
> Though I would probably not include this information..
> 
Users could be difficult to map domain to devices, so I think maybe
we should provide the device information contained in the domain.>> └── 
DebugFS file: /sys/kernel/debug/io_page_tables
>> └── Operation: Reading this file triggers the entire debug information
>> collection process
> 
> I don't think we want to dump every page table in the system in one
> file.
> 
>> Do you mean that the interface in io-pgtable-arm.c is directly invoked
>> during the process of obtaining page table information without passing
>> through arm-smmu-v3.c?
> 
> Yes, this is what iommu pt brings.
> 
> Jason


