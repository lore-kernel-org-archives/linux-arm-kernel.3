Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195F9C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YL9DyYHKVPZ0CNrK+ZXgPJmmz/Zun3fU5uAg8wFG9w=; b=ayimc9ytqkmkb2yDbXCgYduClH
	evjJCWrzHk4Qd1QArn/CIBP+OReOKu0cFk1XQcI4BUWG9zme09XgoTOzSI9INe+lbE14j/8pYcqxc
	RNsOuQy+HxaRU4mSUCan2NSXNMlDz8l3HTCZkhB5rC4obyZw6Oh9XSwH2nBlAnZ0wCnmTA4B7K+lE
	2mvs14OMlwaMrhY+cir76m6X9ZOLkPH422a4QSWGROAnOhQ9IpRHEr+emMfMX/OVnMLn/hvFHLT0i
	wriC71xTgHpzLt+yek8/W4q/u7MOYNNIgRVEKhRgsx8xhMgqOq4Izk6i5wZrauQEQi0SMxcb2aBmL
	RpET0XVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcn2a-0000000BhLV-4AZX;
	Mon, 05 Jan 2026 16:02:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcn2W-0000000BhKz-00wm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:02:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73603339;
	Mon,  5 Jan 2026 08:02:31 -0800 (PST)
Received: from [10.57.49.14] (unknown [10.57.49.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2F973F6A8;
	Mon,  5 Jan 2026 08:02:36 -0800 (PST)
Message-ID: <f253d6aa-1dc2-4b1a-85df-f43b06719c04@arm.com>
Date: Mon, 5 Jan 2026 16:02:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dawei Li <dawei.li@linux.dev>, will@kernel.org, joro@8bytes.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, set_pte_at@outlook.com, stable@vger.kernel.org
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
 <20260105145321.GD125261@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260105145321.GD125261@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_080241_953943_04628374 
X-CRM114-Status: GOOD (  31.42  )
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

On 2026-01-05 2:53 pm, Jason Gunthorpe wrote:
> On Mon, Jan 05, 2026 at 01:33:34PM +0000, Robin Murphy wrote:
>> The assumption is that if the SMMU is not I/O-coherent, then the Normal
>> Cacheable attribute will inherently degrade to a non-snooping (and thus
>> effectively Normal Non-Cacheable) one, as that's essentially what AXI will
>> do in practice, and thus the attribute doesn't actually matter all that much
>> in terms of functional correctness. If the SMMU _is_ capable of snooping but
>> is not described as such then frankly firmware is wrong.
> 
> Sadly I am aware of people doing this.. Either a HW bug or some other
> weird issue forces the FW to set a non-coherent FW attribute even
> though the HW is partially or fully able to process cachable AXI
> attributes.

What I've seen more often is that firmware authors ignore (or don't even 
realise) I/O-coherency, then someone ends up trying to "fix" Linux with 
wacky DMA API patches when things start going wrong on mis-described 
hardware... Yes, they might happen to get away with it with stuff like 
SMMUs or Mali GPUs where a "well-behaved" driver might have control of 
the source attributes, but where AxCACHE/AxDOMAIN are hard-wired there's 
really no option other than to describe the hardware correctly, hence 
that should always be the primary consideration.

And as I say, if there *is* some reason to specifically avoid using 
certain attributes, then deliberately describing the hardware 
incorrectly, in the hope that OS drivers might be "well-behaved" in a 
way that just happens to lead to them not using those attributes, is 
really not a robust workaround anyway.

> It is reasonable that Linux will set the attributes properly based on
> what it is doing. Setting the wrong attributes and expecting the HW to
> ignore them seems like a hacky direction.

Oh, I'm not saying that we *shouldn't* set our attributes more exactly - 
this would still be needed for doing things the "right" way too - I just 
want to be very clear on the reasons why. The current assumption is not 
a bug per se, and although it's indeed not 100% robust, the cases where 
it doesn't hold are more often than not for the wrong reason. Therefore 
I would say doing this purely for the sake of working around bad 
firmware - and especially errata - is just as hacky if not more so.

> I didn't see anything in the spec that says COHACC means the memory
> attributes are ignored and forced to non-coherent, even though that is
> the current assumption of the driver.

It kinda works the other way round: COHACC==1 says that the Cacheability 
and Shareability attributes *can* be configured to snoop CPU caches 
(although do not have to be); therefore the "If a system does not 
support IO-coherent access from the SMMU, SMMU_IDR0.COHACC must be 0" 
case implies that the SMMU is incapable of snooping regardless of how 
those attributes are set, thus must at least be in a different Inner 
Shareability domain from the CPUs, at which point the Cacheability 
domains probably aren't too meaningful either. I would consider it would 
be unexpectedly incorrect behaviour for an SMMU reporting COHACC==0 to 
actually be capable of snooping.

>> If prople have a good reason for wanting to use a coherent SMMU
>> non-coherently (and/or control of allocation hints), then that should really
>> be some kind of driver-level option - it would need a bit of additional DMA
>> API work (which has been low down my to-do list for a few years now...), but
>> it's perfectly achievable, and I think it's still preferable to abusing the
>> COHACC override in firmware.
> 
> IMHO, this is a different topic, and something that will probably
> become interesting this year. I'm aware of some HW/drivers that needs
> optional non-coherent mappings for isochronous flows - but it is not
> the DMA API that is the main issue but the page table walks :\

Hmm, yeah, potentially configuring PTW attributes for a DMA domain is 
something I hadn't even thought about - the DMA API aspect I mean is 
that in general we need some sort of DMA_ATTR_NO_SNOOP when 
mapping/allocating such isochronous buffers/pagetables etc., to make the 
DMA layer still do the cache maintenance/non-cacheable remaps despite 
dev_is_dma_coherent() being true.

Thanks,
Robin.

