Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17119C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGUeaFOrmYnG09K1ojCvxoSpMGRjoyG9uPmXrdQbCYg=; b=uYwV54O8Oyl/crD13cwsK7xUiA
	56tfH6amkA+B+GibQtnTLYTNggnsrCCC+gbNpXpVPQ86aEhD16PPGvKa8dWCOSVAyxcwVIWVrRBmP
	BjHYXRYH9ZVfG/AWA9QIK+pmaWIcScjCAS+eMnm50hQ9XUD9yZS4y69xc6PexJAQUo4ZkhZxxyv9f
	aLmWnp0q/mRBmbsZMdN2e384id7Wq4VV0Gn7paAs2+uwFpHjnqFrCvfexgXDMuff/iQ/wUtLenyOZ
	8t9kAX5k49hS85xipnqHzcubKN1hKk4zezhTCEd6b3+xRA66W5JPsCm9HX41b4+854odMSHKhkRYW
	ATz+HRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIMH-00000007o4n-2mJT;
	Fri, 07 Aug 2026 11:03:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIMF-00000007o4A-0HMT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:03:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 056EA1A9A;
	Fri,  7 Aug 2026 04:03:18 -0700 (PDT)
Received: from [10.57.42.104] (unknown [10.57.42.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4F43F86F;
	Fri,  7 Aug 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786100602; bh=xVUNR7ylOX30B68Mp97+YrCjqIAMylEeu1MoGj3JgSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J8p7ij5IxKrp/kurzyHOpL7pNcFvOmaC1o1pKHx1B0H8nD1rs9aRZPjUBxhjjZZCQ
	 N4wJy56XcfQZ9q6eMGh6OX2azJnBHJkC8guCRYo50qm8khWqqcEcjsfqtXCA71yfRP
	 ZBj3ot3KvGeWH3bSFFxlac5fB9iAToqsB4eMcWRg=
Message-ID: <0ce2249d-3a64-4889-b455-0e8fddcc7282@arm.com>
Date: Fri, 7 Aug 2026 12:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
To: Jason Gunthorpe <jgg@nvidia.com>, Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Petr Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
 Michael Kelley <mhklinux@outlook.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
 <ami_mpd_1pF4Tmdu@google.com> <yq5a5x1ygo7z.fsf@kernel.org>
 <amnRB98ZZIysHuM3@google.com> <yq5acxw6dl1d.fsf@kernel.org>
 <20260804142032.GC27883@nvidia.com> <anL9-OrDGqYQAWNV@google.com>
 <20260805123023.GO27883@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260805123023.GO27883@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_040323_199196_85F3530B 
X-CRM114-Status: GOOD (  47.31  )
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

On 2026-08-05 1:30 pm, Jason Gunthorpe wrote:
> On Wed, Aug 05, 2026 at 09:10:16AM +0000, Mostafa Saleh wrote:
>> On Tue, Aug 04, 2026 at 11:20:32AM -0300, Jason Gunthorpe wrote:
>>> On Wed, Jul 29, 2026 at 06:12:38PM +0530, Aneesh Kumar K.V wrote:
>>>> There is a possibility that we may support io_tlb_mem with cc_shared =
>>>> false in the future. As a result, only swiotlb_map() knows which type of
>>>> bounce buffer was used, making it the only place where the attributes
>>>> can be updated correctly.
>>>
>>> Yeah, +1, the attribute should be changed at the same effective place
>>> the source memory is changed away from what the DMA API user
>>> provided. Only the thing providing the new memory (eg swiotlb) should
>>> know its properties.
>>
>> I will keep the conversation here instead of 2 threads.
>>
>> That seems like a big leap, I'd be worried about devices that operate
>> on confidential data that should not be shared/decrypted.
> 
> That seems like something very differnt.
> 
>> One example for this which exists in pKVM (this part is not
>> upstream yet) is non coherent devices that require bouncing but they
>> still want to keep the data private. In that case ideally they get
>> an encrypted SWIOTLB pool, but it's always better to fail than to use
>> a decrypted pool behind it's back.
> 
> We don't have any API for a DMA API caller to signal 'must be
> confidential'. If we want to add one it would be a flag to check
> before changing the physical address in swiotlb.
> 
> As defined today the DMA API expressly copies from private to shared
> memory, that is baked into it's design and not a bug.
> 
> My expectation is all these cases have to be solved by setting up the
> swiotlb properly so it provides suitable bounce buffers. Yes, this
> means we will eventually need both private and shared swiotlb pools.
> 
>> I have not been following the work on T=1/T=0 devices, but IIRC, they
>> required some complexity to handle their stage-2 as these modes will
>> be emulated differently (for CCA, RMM vs untrusted host).
>> I was thinking that it might be easier to represent those to the
>> guest kernel as 2 separate devices (bounded to different groups...)
>> where one is trusted and the other is not, and that way the DMA-API
>> can have strict rules about memory sharing.
> 
> No way! That's would be a giant disaster for the driver model.
> 
> Each struct device will have a flag that shows if it is in T=1 or T=0
> state. The flag can only change while a driver is not bound, and
> changing the flag will update the DMA API configuration.

I see we no longer seem to have the concern of devices in TDISP RUN 
state being able to send T=0 transactions other than MSI writes, where 
GICv3 means the host is already going to have to be in on the game to 
some degree there anyway. There could still be a potential concern of 
other non-PCIe equivalents wanting such a thing, though. However, even 
then we don't have support in firmware bindings nor the IOMMU API itself 
to be able to describe a single device being associated with both the 
RMM's vSMMU for the T=1 (Realm) VA space, and the NS VMM's vSMMU for the 
T=0 VA space, even if we did only have to care about using strictly one 
or the other at any given time based on device state. Having distinct 
struct devices is indeed clunky, but does at least reduce the problem to 
a currently-manageable one of the client driver having to wrangle them 
as a pair. Note that there are other such hardware properties that may 
also differ between states, such as ITS frames when we do get GICv5, so 
in fact having separate descriptions of the "shared" and "private" 
aspects of a device, based on their respective MMIO address aliases, may 
not be entirely unreasonable for CCA - making OSes understand that seems 
like it might be easier than having to reinvent swathes of ACPI and 
Devicetree bindings (and then still having to make OSes understand *those*).

> A T=1 device should have the same issue as you point out for pkvm, it
> really needs to have a private SWIOTLB pool.

Yes, once device_cc_accepted() is true then we *must not* inadvertently 
share any DMA buffers, if the caller has not explicitly requested 
CC_SHARED (tying in to the XT use-case), otherwise we'd be breaking the 
end-to-end confidentiality that TDISP/IDE/etc. is all about. So until we 
do have an additional private SWIOTLB, we will have to just fail 
mappings for an accepted device which would otherwise want bouncing due 
to DMA mask or alignment limitations.

(And FWIW when we do get there, I'd be inclined to make the default 
SWIOTLB the "private" one, so all the sharing/decryption stuff can be 
neatly partitioned off into the CoCo etc. special cases...)

Thanks,
Robin.

>> Otherwise, SWIOTLB does not seem like the right place to me, as it
>> does not understand the context the device is operating in, and the
>> DMA-API should deduce that from the flags passed.
> 
> It is exactly the right place because it is the one supplying the new
> memory. Context is irrelevant, the flag only describes what the new
> memory actually *IS*, and swiotlb knows 100% if the new memory is
> shared or private.
> 
> For your issue it would be appropriate to add a debugging check that
> the new memory is not incompatible with the expected policy. eg a T=1
> device getting decrypted swiotlb memory is a bug in swiotlb setup that
> should be caught. But that's a debugging check, we expect the swiotlb
> to have selected the right kind of memory by construction. This isn't
> done yet since this series doesn't even yet support a T=1 device..
> 
> Jason


