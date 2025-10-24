Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC553CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoCWptqhjUMBw+EVo6M96V6t3lA98gNWnvfVatz++T4=; b=fL9t/IYxe/p/3PRZK43BpADRp7
	j8eRE0EE8Oyul4uqkLpImacxCHlje4pWrqnwzDX7wWl0FKlxEFHTDUqzRoQ1OgBpTkdVsAPfJpr3L
	VPqvitICj4vsvqVrsX03kxApuOwN4Jf2FsYjtrvqqxexzYPumGm+gC3oSwM4fV0P/SiRUeDcA2yyq
	fJiKKoCFz9TyMJTC62yrs0ECtQ0IkYiJMSXIuNgYVIyp1yNuPBu2LJS/6dPuAXLTeXO/Lx35thHJO
	4IK4kyDrxvD82epqn+V1aEIP1LzvwNUhFUXQGvTYM7zJX7Q8qJ/qhSRlUOZ/e0RKPiHSCgPb1yBAu
	cbcA1pLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEuh-000000090jl-0r0T;
	Fri, 24 Oct 2025 10:20:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEue-000000090iq-3Bs8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:20:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EF9C175A;
	Fri, 24 Oct 2025 03:20:39 -0700 (PDT)
Received: from [10.57.33.202] (unknown [10.57.33.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 158A83F66E;
	Fri, 24 Oct 2025 03:20:45 -0700 (PDT)
Message-ID: <8a75e90f-596e-407b-976f-e8a509c9065d@arm.com>
Date: Fri, 24 Oct 2025 11:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: fix probe device bug due to duplicated
 stream IDS.
To: Jason Gunthorpe <jgg@ziepe.ca>, Reaper Li <reaperlioc@glenfly.com>
Cc: will@kernel.org, joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251011023003.159922-1-reaperlioc@glenfly.com>
 <20251023181235.GH21554@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251023181235.GH21554@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_032048_865614_90A24FD4 
X-CRM114-Status: GOOD (  13.87  )
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

On 2025-10-23 7:12 pm, Jason Gunthorpe wrote:
> On Sat, Oct 11, 2025 at 10:30:03AM +0800, Reaper Li wrote:
>> From: Reaper <reaperlioc@glenfly.com>
>>
>> Commit 9246b487ab3c ("PCI: Add function 0 DMA alias quirk for Glenfly Arise
>> chip ") add quirk to fix hda dma request issue, but IORT logic populaties
>> two identical IDs into the fwspec->ids array via DMA aliasing in
>> iort_pci_iommu_init() called by pci_for_each_dma_alias().
> 
> I'd rather we not have duplicate IDs in the same fwspec, can we avoid
> that at the source?

The original reason for not doing that is that there are multiple 
sources - the drivers' own .of_xlate routines for DT, but the 
IORT/VIOT/RIMT/whatever code for ACPI. Yes, iommu_fwspec_add_ids() is in 
a common path there, but that's only responsible for appending an opaque 
block of data to another opaque block of data - only the producer or 
consumer of that data know how to interpret it (e.g. for SMMUv2, 
[0x00000002, 0x00000003] may or may not be considered equivalent to 
[0x00010002]).

Anyway, this patch is wrong regardless, and it is definitely not fixing 
any bug. SMMUv3 has explicitly never supported StreamID aliasing between 
*different* devices, because doing that correctly is a challenge. It 
needs custom group assignment based on StreamID-to-group lookup (like 
SMMUv2) - we can't just assume it's OK for PCI devices, since as soon as 
we allow aliasing at all then we also allow it outside the PCI hierarchy 
where pci_device_group() can't see it (like on the Arm Juno platform). 
These days we do have arm_smmu_find_master() which makes *that* 
feasible, but conversely means we now also have to be concerned with 
disallowing ATS/PRI and working out what to do with anything else that 
is subtly broken by no longer having the assumed 1:1 correspondence of 
StreamID:device.

Thanks,
Robin.

