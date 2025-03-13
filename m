Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55536C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbKT+ygkvZ4eA1Lhx8izQuBeZHGQU7Zi019vVIFSdxk=; b=k9yQwnTVt/vHlegTS9967kBlfW
	RAjoUqdsZYIgfsaHE9P23s300xuf6BgPp2lU/Vmo1XzfEj3knKskEFthildDvsGm7bR3ETBS1FeO2
	8WI7AgD2Egy3W5wcz4pOlqJukL5vFWxYdmBOFvQxLkRKEeDq0pKMWd0g/w9TGJg1ZC3oGqMDJi0MB
	N6W7I8eD086tTM9K9/3zblDM8rmVN1eMkpNVXF40j4uQjnj2y5elAmbrnVadvTtlAMC6+5N5LxJeg
	5c6tN24FxlloMqvzzc5UrWdG0Pa3+CsFcT2pJAukVYOyjP4ysnOrHQrpxZSJtn18bP746ArsYvn/+
	l/vcEHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjJv-0000000BUsS-2RVS;
	Thu, 13 Mar 2025 14:13:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjIH-0000000BUkC-3IFo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Mar 2025 14:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IbKT+ygkvZ4eA1Lhx8izQuBeZHGQU7Zi019vVIFSdxk=; b=I+/Z3k0wFhNrY/Vy91vo+PvmaS
	yZdlGh6Bzfq8q2ugHKS7KQ/gpumGP3EKaFHl1U3Y3nuf0T1cscklYNT0+4m6tCqEOJ2OFpRus+B35
	yXFAGf8oCP3q8dYtBc28LQFQ1/7FEf+SAc9fexgjDt8eRy7UBjW8kj1h1mu+mjkqvnGHsMwGaVu3C
	k+ghnJKXHvMIAenCTfgVfRyhLapCp6QSiu4hFFpwzLW2V7s/OcD9tli9zKslEwNPWtmTbik1fUxLb
	tt5olhbQyldOA73Z4Cm+kNxC1bHDZ0SuvDcS+iWE6bvu0VsECFH7hhsq6P1FmhOlGSPxFXUzEf3mq
	LGq3mZlA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjIE-00000002fj8-1xza
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:12:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 745B3150C;
	Thu, 13 Mar 2025 07:12:22 -0700 (PDT)
Received: from [10.57.40.246] (unknown [10.57.40.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7F23F694;
	Thu, 13 Mar 2025 07:12:07 -0700 (PDT)
Message-ID: <b63ff6b4-9dc3-42ea-8b87-d4fdead8d0eb@arm.com>
Date: Thu, 13 Mar 2025 14:12:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
From: Robin Murphy <robin.murphy@arm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 Charan Teja Kalla <quic_charante@quicinc.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <CGME20250313095633eucas1p29cb55f2504b4bcf67c16b3bd3fa9b8cd@eucas1p2.samsung.com>
 <9b358d68-332e-404e-9a75-740297f7b28d@samsung.com>
 <417d6f59-0d78-4e81-ad0b-e06846f786b0@arm.com>
 <bf2adf5d-1432-4bb7-846c-e1bcfa84858b@samsung.com>
 <016bb7ca-f0d3-464e-ac74-46e6f78e90d7@arm.com>
Content-Language: en-GB
In-Reply-To: <016bb7ca-f0d3-464e-ac74-46e6f78e90d7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_141214_812888_E551839C 
X-CRM114-Status: GOOD (  17.48  )
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

On 2025-03-13 1:06 pm, Robin Murphy wrote:
> On 2025-03-13 12:23 pm, Marek Szyprowski wrote:
>> On 13.03.2025 12:01, Robin Murphy wrote:
>>> On 2025-03-13 9:56 am, Marek Szyprowski wrote:
>>> [...]
>>>> This patch landed in yesterday's linux-next as commit bcb81ac6ae3c
>>>> ("iommu: Get DT/ACPI parsing into the proper probe path"). In my 
>>>> tests I
>>>> found it breaks booting of ARM64 RK3568-based Odroid-M1 board
>>>> (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts). Here is the
>>>> relevant kernel log:
>>>
>>> ...and the bug-flushing-out begins!
>>>
>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>> 00000000000003e8
>>>> Mem abort info:
>>>>      ESR = 0x0000000096000004
>>>>      EC = 0x25: DABT (current EL), IL = 32 bits
>>>>      SET = 0, FnV = 0
>>>>      EA = 0, S1PTW = 0
>>>>      FSC = 0x04: level 0 translation fault
>>>> Data abort info:
>>>>      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>>>>      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>>>      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>>> [00000000000003e8] user address but active_mm is swapper
>>>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>>>> Modules linked in:
>>>> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc3+ #15533
>>>> Hardware name: Hardkernel ODROID-M1 (DT)
>>>> pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> pc : devm_kmalloc+0x2c/0x114
>>>> lr : rk_iommu_of_xlate+0x30/0x90
>>>> ...
>>>> Call trace:
>>>>     devm_kmalloc+0x2c/0x114 (P)
>>>>     rk_iommu_of_xlate+0x30/0x90
>>>
>>> Yeah, looks like this is doing something a bit questionable which can't
>>> work properly. TBH the whole dma_dev thing could probably be cleaned up
>>> now that we have proper instances, but for now does this work?
>>
>> Yes, this patch fixes the problem I've observed.
>>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> BTW, this dma_dev idea has been borrowed from my exynos_iommu driver and
>> I doubt it can be cleaned up.
> 
> On the contrary I suspect they both can - it all dates back to when we 
> had the single global platform bus iommu_ops and the SoC drivers were 
> forced to bodge their own notion of multiple instances, but with the 
> modern core code, ops are always called via a valid IOMMU instance or 
> domain, so in principle it should always be possible to get at an 
> appropriate IOMMU device now. IIRC it was mostly about allocating and 
> DMA-mapping the pagetables in domain_alloc, where the private notion of 
> instances didn't have enough information, but domain_alloc_paging solves 
> that.

Bah, in fact I think I am going to have to do that now, since although 
it doesn't crash, rk_domain_alloc_paging() will also be failing for the 
same reason. Time to find a PSU for the RK3399 board, I guess...

(Or maybe just move the dma_dev assignment earlier to match Exynos?)

Thanks,
Robin.

