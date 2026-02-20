Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD44C55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7cwJqwHkLfuDqvKD5747UM8ztm3a89aJcOn1yh6e30=; b=XQfOOZYwpb89XccBmuvGseCBpK
	8qCTYu4JkWWt6H6io9V6DP1ao54xEXd1rhlGjP+u8pswhmv+MWdt59HFp9zLcYuF/pGtwX/6Ml4zq
	ORs5dcabMt2cUFveiIVdTFwETiF8tDjcU3CA85ZcGUJgG1wQgxW3bv5m/bXqASiCihihNe2+axj5y
	cKRfJEFjhJwnfnwCxmiRQN5Z3OA+KoWBZh9R3fzdmDQkJhKzYOEYHFqfcUhi8cK+KOIVyCo+94YQZ
	phGDMqjo7KWdqgKzaEyyKESNE9nMcEmsJfRhYlbHJunStIpBMByh3h4ORQW3dnMY52Y7HOtJvYa4M
	5llai76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQTF-0000000EXTd-03jH;
	Fri, 20 Feb 2026 13:23:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQTC-0000000EXSp-1w5y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:22:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D345A339;
	Fri, 20 Feb 2026 05:22:49 -0800 (PST)
Received: from [10.57.58.244] (unknown [10.57.58.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B9E3F7D8;
	Fri, 20 Feb 2026 05:22:52 -0800 (PST)
Message-ID: <6a842339-3f0a-48db-830a-326add917519@arm.com>
Date: Fri, 20 Feb 2026 13:22:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: dan.j.williams@intel.com, "Tian, Kevin" <kevin.tian@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "will@kernel.org" <will@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "praan@google.com" <praan@google.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>
References: <20260128130520.GV1134360@nvidia.com>
 <aYGEDv86r4a6l2Dv@Asurada-Nvidia> <20260203143348.GA3931454@nvidia.com>
 <aYI0LUdXqrjmRcMo@Asurada-Nvidia> <20260203175540.GC3931454@nvidia.com>
 <aZZDo3BeuBKh9q24@nvidia.com> <20260219143737.GG723117@nvidia.com>
 <aZc//6kvH3Eqfwfe@nvidia.com> <20260219174139.GI723117@nvidia.com>
 <aZfoqETxb31jp/Pk@nvidia.com> <20260220125044.GK723117@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260220125044.GK723117@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_052258_541456_A9895D3A 
X-CRM114-Status: GOOD (  21.29  )
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

On 2026-02-20 12:50 pm, Jason Gunthorpe wrote:
> On Thu, Feb 19, 2026 at 08:52:56PM -0800, Nicolin Chen wrote:
>>> What is missing is to bring back the IDENTITY performance optimization
>>> in a secure way.
>>
>> I might have got it wrong (from the last part below).
>> https://lore.kernel.org/linux-iommu/20260127150440.GF1134360@nvidia.com/.
>>
>> You mean to disable ATS on IDENTITY domains?
> 
> The objective of this security step is to keep ATS blocked and
> IDENTITY domains disabled until the userspace has "accepted" the
> device by binding a driver to it.
> 
> The off the cuff suggestion was to just park the device BLOCKED until
> a driver is bound. This disables ATS and blocks translation.
> 
> That doesn't work on ARM because of the MSI issue.

But is that an issue? Until the device has a driver, surely it shouldn't 
be expected to send interrupts at all, much less depend on them being 
received and understood by Linux? The MSI cookie is only populated once 
a driver actually requests some MSI vectors (since it doesn't know what 
ITS address(es) may or may not need mapping), so an empty DMA domain is 
still no better than a true blocking domain in this regard anyway.

Thanks,
Robin.

> The next suggestion is to park the device in a real DMA domain with an
> actual page table and DMA API hooked up. Now interrupts will work and
> the domain is empty so there is no translation. The issue here is the
> domain doesn't block ATS. We could fix this with some "disable ATS"
> domain flag.
> 
> In either case when the driver is bound and requests that the DMA API
> start working if the user requested IDENTITY then it has to be
> switched away from the parked domain to IDENTITY.
> 
> A final thought would be to change around the driver managed DMA
> mechanism a bit to allow drivers to indicate they use IRQs but not
> DMA, then the bind step could switch from a BLOCKED domain to an empty
> DMA API domain to allow MSI to work.
> 
> Jason


