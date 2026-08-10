Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC22C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4USx5lpd5xGkWozOwTXqXRz443jHgZxzpuvUiugvFI=; b=ZDytrwh3DX2BpySUtKaUkV3nTA
	k5IF+FINu+KxhrEfYQoOdb1Pq83vcoNTT1Q2sXDaUPwxF9z3a/3ljFxXsPUVWFvChKA/ZzWVSH97M
	YHPM7B7ArGnOc5tg0FzCQAU4L+QsMSJ28nimyqwOm6ju+USe9+snTOJGRP+GUZnZzxeGU2pNMGSED
	fKxsBYxlxMyac6luCZywLY27BnIro9B19NaTaPP4Ra+PaU55Jp2XGv5ex16Ofq/XZ6NwgbGLbkVrF
	h/VhcOeWAx6duxiBpFRadhRMydArtZuRb4IEtz2fFX7EtbeYVENgr8Jb5QYZqdveyXszrlfdyf86z
	uDQjRbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPqk-0000000BstV-28nq;
	Mon, 10 Aug 2026 13:15:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPqi-0000000Bst9-0dtG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D6411477;
	Mon, 10 Aug 2026 06:15:20 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7D193F632;
	Mon, 10 Aug 2026 06:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786367724; bh=08CNSczzlMqJLfhVP4oR0gP5UnNIku1FbqhnKdMgNJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UIG0VKRVpcnQsntb8X+MUw+Rl1RmKSYUuGIobrr6tKs0/KwrfxLsM0TWwGDOfumFm
	 6LNootm9c7LoakxRkMKnwDln+V6lL05lHro61O8CO3txcH2RBRl/GFDkKz44saVCkc
	 dgt/4K30gMdQMt+9zq0K3hFK4pldKbqC/7ig2Aqk=
Message-ID: <850675b8-1858-4314-85cf-b174daf8693e@arm.com>
Date: Mon, 10 Aug 2026 14:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
To: Michael Kelley <mhklinux@outlook.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Will Deacon <will@kernel.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marc Zyngier <maz@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>,
 Petr Tesarik <ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Xu Yilun
 <yilun.xu@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck> <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck> <20260807135810.GA200537@ziepe.ca>
 <yq5awlu1yfn0.fsf@kernel.org>
 <SN6PR02MB4157484EFDE3315744021D5BD4DE2@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <SN6PR02MB4157484EFDE3315744021D5BD4DE2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_061528_288194_C56A2722 
X-CRM114-Status: GOOD (  22.26  )
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

On 10/08/2026 6:00 am, Michael Kelley wrote:
> From: Aneesh Kumar K.V <aneesh.kumar@kernel.org> Sent: Friday, August 7, 2026 11:01 AM
>>
>> Jason Gunthorpe <jgg@ziepe.ca> writes:
>>
>>> On Fri, Aug 07, 2026 at 02:18:31PM +0100, Will Deacon wrote:
>>>
>>>>> I was under the impression that there is a possibility of using swiotlb
>>>>> instead of restricted-dma-pool with pKVM.
>>>>
>>>> Yes, that patch enables swiotlb as a possibility for protected guests
>>>> but with your patch we avoid shrinking the swiotlb buffer even when
>>>> restricted dma pools are being used and that's a waste of memory.
>>>
>>> I also thought we switched pkvm to use CC-like swiotlb as part of the
>>> alignment in this rework? Mostafa ?
>>>
>>>>> If that is not the case, then we could change:
>>>>>
>>>>> !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>>>>>
>>>>> to
>>>>>
>>>>> !is_realm_world() &&
>>>>
>>>> Perhaps, or you could just pass the swiotlb= option if the defaults don't
>>>> work for you. Can you give more details about the slots exhaustion you're
>>>> seeing under CCA?
>>>
>>> We see badness with swiotlb too, it basically doesn't work out of the
>>> box if you have to use it 100% for real devices. It easily runs out
>>> of memory.
>>>
>>> Auto tuning to higher levels makes sense to me, but I'd rather the
>>> core code handled adjusting its size to the estimated need, not arch
>>> code.
>>
>> Agreed
> 
> Nobody has mentioned it on this thread, but arch code under x86 has
> a heuristic for sizing the swiotlb for SEV-SNP and TDX. The heuristic is 6%
> of guest memory, with a max of 1 GiB. See mem_encrypt_setup_arch().
> The heuristic originally went into the 5.11 kernel nearly 6 years ago for
> the original SEV support and hasn't changed since. See commit
> e998879d4fb79, which doesn't give much of an explanation. I don't
> think this is necessarily a good heuristic -- it tends to waste a lot of
> memory, but there are also a few cases where it isn't enough memory.
> After a few years of experience with SEV and TDX, nobody seems to
> have tried to come up with something better, so maybe it's not all that
> bad.
> 
> No doubt the heuristic should move into common code so CCA, SEV,
> and TDX all use the same one.

Indeed that would probably make sense as a future refactoring, as I 
would assume the general expectations of CoCo environments should be 
largely independent from the specific technology of either "Co" :)

However, note that currently the arch checks are effectively serving 
opposite purposes - x86 is specifically *increasing* the default SWIOTLB 
size for SEV/TDX, while the arm64 check (and RISC-V copy), is about 
*reducing* the default size if we think we (mostly) don't need it.

Thanks,
Robin.

