Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AF2D44164
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vz3hgPZ5s7AumxljzgcZatN85XQ9nbtGUCZs8hJY3Zg=; b=XHFG9sv7DRC4Zr0JoiUSmtdXtK
	BZgALMmzAjW2/bm/C0f1CL2rA2GV50KurkG7qNFyFPUoKowhqtTROLGG9ieeAAxHgNSGa3bmaFqF6
	DO2TJH2gRjKwgH9TAZxbNUWXpVntDRDr8hSLyOOjaB8Q7R/FD1p2p+SN8alaab98o+ibgdq4VwU63
	abvcE6t1+E1yw8S+BlDzUCLiYr180kqPzE6Kl++a8vcNSdjR91d5I1E48PbFVMmICh1USv7fc/EsU
	2Rq4mHje0rqpnHuDSZM+6sBtwwJD5KBoanugz9iiLy0trxqEFY1HbrP25NBm1+6ZoKiTko3NmA11h
	VD8z6+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU0fN-00000000RTJ-30Ah;
	Fri, 12 Dec 2025 10:46:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU0fJ-00000000RSv-3ua4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:46:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C65E7FEC;
	Fri, 12 Dec 2025 02:46:15 -0800 (PST)
Received: from [10.57.93.22] (unknown [10.57.93.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5ACB3F762;
	Fri, 12 Dec 2025 02:46:21 -0800 (PST)
Message-ID: <650659ac-22f0-4fc0-ad43-8d4169cf2432@arm.com>
Date: Fri, 12 Dec 2025 10:46:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow stream ID sharing for
 devices behind PCIe-to-PCI bridges
To: Jason Gunthorpe <jgg@ziepe.ca>, Nirmoy Das <nirmoyd@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, nicolinc@nvidia.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251211133933.4128100-1-nirmoyd@nvidia.com>
 <aTu4xsAApNupRGYC@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aTu4xsAApNupRGYC@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_024626_024744_F663520E 
X-CRM114-Status: GOOD (  13.99  )
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

On 2025-12-12 6:40 am, Jason Gunthorpe wrote:
> On Thu, Dec 11, 2025 at 05:39:33AM -0800, Nirmoy Das wrote:
>> ASPEED BMC controllers have VGA and USB functions behind a PCIe-to-PCI
>> bridge that causes them to share the same stream ID:
>>
>>    \-[0005:e0]---00.0-[e1-e2]----00.0-[e2]--+-00.0  ASPEED Graphics Family
>>                                             \-02.0  ASPEED USB Controller
>>
>> Both devices get stream ID(0x5e200) due to bridge aliasing. Currently this
>> USB controller gets rejected with "Aliasing StreamID unsupported", causing
>> USB timeout errors. Allow stream ID sharing when both devices are on
>> the same bus behind a PCIe-to-PCI bridge to fix this issue.
> 
> I don't think this is right, if you actually need stream ID sharing
> then I seem to recall the driver needs more changes. We don't want
> this in general.

Yes, as I said on the last one not so long ago, we cannot simply cross 
our fingers and hope that aliasing at the SMMU StreamID level stems from 
something at the PCI RID level that pci_device_group() would be aware 
of, because there is no guarantee that RID->StreamID mappings are 1:1.

Thanks,
Robin.

> IMHO ASPEED has wrong PCI config space and there isn't any actual PCI
> bus here that would force RID aliasing to worry about. I suggest going
> to ASPEED to find out and confirm that they don't actually share the
> RIDs and then let's quirk the PCI devices to disable alias generation
> in the first place.
> 
> Also, complain to them to fix their config space to report a PCIe bridge
> type in future devices. :)
> 
> Jason


