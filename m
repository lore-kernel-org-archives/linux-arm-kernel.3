Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEC2E95393
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE1ZolL5Z21pZC5dqWCDxp56A1ckQSEpOSjClw0sMyU=; b=zbN2RkV0RQXytdZW/qpKy9sdrF
	7vjbf4knoMhRTyQk2ZdXjkXRNtyvrBEwt+anKZLTWP7Gjj/HMzgdxnJZGyyYdXX5htLv06fl6y8Xf
	Acdi8D2WQeLCR1E4AIAupat5ApzHVJkgLK1W9yqa471e1ssusFBjp48OwprZODLyPgXjtpD6w6mJK
	bxVfUgk0D8Jtx5PSbakmh15n1TAwHhgBoyTmZXxlgJvCiErx59J8IwOnQ8BxQJF335EqsrOVCfzgj
	PI9uv45TFSzywTdENx5J6cdwtLRHJY/MqMlIj9enLYzlpeZtgPM/aW3m4KasSlIpMFDiA8k6wXJ3x
	LtsRp+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbq5-00000008QaV-0rcC;
	Wed, 04 Feb 2026 12:18:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbq1-00000008QZ9-1DRa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:18:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FC1497;
	Wed,  4 Feb 2026 04:18:20 -0800 (PST)
Received: from [10.57.54.211] (unknown [10.57.54.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C4093F632;
	Wed,  4 Feb 2026 04:18:24 -0800 (PST)
Message-ID: <69b9a009-55bb-4330-b64a-99b20bd9abef@arm.com>
Date: Wed, 4 Feb 2026 12:18:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, dan.j.williams@intel.com,
 "Tian, Kevin" <kevin.tian@intel.com>,
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
References: <69727e7ded712_3095100ab@dwillia2-mobl4.notmuch>
 <BN9PR11MB527649A0049CA195E7BCF9218C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260127150440.GF1134360@nvidia.com>
 <69795d0366a9_1d33100d3@dwillia2-mobl4.notmuch>
 <20260128130520.GV1134360@nvidia.com> <aYGEDv86r4a6l2Dv@Asurada-Nvidia>
 <20260203143348.GA3931454@nvidia.com> <aYI0LUdXqrjmRcMo@Asurada-Nvidia>
 <20260203175540.GC3931454@nvidia.com>
 <0472f0f6-2f13-459e-857d-d5003f2f0ac4@arm.com>
 <20260203231607.GE3931454@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260203231607.GE3931454@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_041829_424638_2A723416 
X-CRM114-Status: GOOD (  32.15  )
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

On 2026-02-03 11:16 pm, Jason Gunthorpe wrote:
> On Tue, Feb 03, 2026 at 06:59:35PM +0000, Robin Murphy wrote:
>> Realistically this combination cannot exist bare-metal, since if the device
>> requires to send ATS TT's to access an RMR then the SMMU would have to be
>> enabled pre-boot, so then the RMR means we cannot ever disable it to
>> reconfigure, so we'd be stuffed from the start...
> 
> This thread has gotten mixed up..
> 
> First this series as it is has nothing to do with RMRs.

I know, but you brought up require_direct so I figured it was worth 
clarifying that should not in fact impact ATS decisions, since the 
combination a device requiring ATS while *also* requiring an RMR would 
be essentially impossible to support given the SMMU architecture, thus 
we can reasonably assume nobody will do such a thing (or at least do it 
with any expectation of it ever working).

> What the latter part is discussing is a future series to implement
> what I think MS calls "boot DMA security". Meaning we don't get into a
> position of allowing a device access to OS memory, even through ATS
> translated requests, until after userspace has approved the device.

Pre-boot protection is in the same boat, as things currently stand - an 
OS could either preserve security (by using GBPA to keep traffic blocked 
while reconfiguring the rest of the SMMU), *or* have ongoing DMA for a 
splash screen or whatever; it cannot realistically have both.

> This is something that should combine with Dynamic Root of Trust for
> Measurement, as DRTM is much less useful if DMA can mutate the OS code
> after the DTRM returns.
> 
> It is also meaningful for systems with encrypted PCI where the OS can
> measure the PCI device before permitting it access to anything.
> 
> So... When we do implement this new security mode, what should it do
> if FW attempts to attack the kernel with these nonsensical RMR
> configurations? With DRTM we explicitly don't trust the FW for
> security anymore, so it is a problem.
> 
> I strongly suspect the answer is that RMR has to be ignored in this
> more secure mode.

Yes, I think the only valid case for having an RMR and expecting it to 
work in combination with these other things is if the device has some 
firmware or preloaded configuration in memory which it will still need 
to access at that address once an OS driver starts using it, but does 
not need to access *during* the boot-time handover. Thus it seems fair 
to still honour the reserved regions upon attaching to a default domain, 
but not worry too much about being in a transient blocking state in the 
interim if it's unavoidable for other reasons (at worst maybe just log a 
warning that we're doing so).

>> However I think there would be no point exposing the ATS details to
>> the VM to begin with. It's the host's decision to trust the device
>> to play in the translated PA space and system cache coherency
>> protocol, and no guest would be allowed to mess with those aspects
>> either way, so there seems no obvious good reason for them to know
>> at all.
> 
> If the vSMMU is presented then the guest must be aware of the ATS
> because only the guest can generate the ATC invalidations for changes
> in the S1.

Only if you assume DVM or some other mechanism for the guest to issue S1 
invalidations directly to the hardware - with an emulated CMDQ we can do 
whatever we like.

And in fact, I think we actually *have* to if the host has enabled ATS 
itself, since we cannot assume that a guest is going to choose to use 
it, thus we cannot rely on the guest issuing ATCIs in order to get the 
correct behaviour it expects unless and until we've seen it set EATS 
appropriately in all the corresponding vSTEs. So we would have to forbid 
DVM, and only allow other direct mechanisms that can be dynamically 
enabled for as long as the guest configuration matches... Fun.

Thanks,
Robin.

