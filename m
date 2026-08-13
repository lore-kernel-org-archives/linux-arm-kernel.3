Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D050C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS96M5PwmSQAAINYe1E/NZ/00C1Ha89SND92BQMhXgE=; b=oKTKLWeITM9NkXxnlo4GwjH7Jr
	Jub5u3OpArE+zV2AAJfGQ2C1eEF2KDKi/MHU11Ddw/+qKhHLb4r57swqlq4jqbjPMOl0pcdOOMp2H
	0ir/zTJ2gbnvAWDQAiK7kWf9E71P6Q7m2BegF04YBuQO2wh2IyGXhSOjCJKqpF9fwCrVADKgqBIJu
	0+NRmzE5mH/aHYXJFSzhX9jYHwWL5YM32aTWZrnPHv9X/ypqfKrx5c73hvnV+gG+pVdS2TUouhPrx
	KQKOdHD/p6IfXONYpRDENV6od/dW111At7GtJXRkArVF0rPLup+xnzWBfmYWc18DxcqQBQUfF84XT
	Bj7d2d3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZBy-00000001Hra-0bgD;
	Thu, 13 Aug 2026 17:26:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZBt-00000001HpO-3dbT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:26:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB6B1596;
	Thu, 13 Aug 2026 10:25:58 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03D7F3F632;
	Thu, 13 Aug 2026 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786641962; bh=0qNjRcWOrWIUhU03ffUrB4IIh2/akNK5dYV6ljcH4Do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tppK8BumBPAbrAfRQmCD3DCnY1uqqULHCNqKQeWBbH8qhRpmhLdqwzu5s+lWT8N/3
	 ieLFKhQNJpl4hvpIV4Szo/WxIXLEwgjqh3ev/ObpOBF1O4am5HbfRJx/KURkrzwPK0
	 wArlBaOws2E/82N8w7tnISG2yYTUQQgd6k3IFVSw=
Message-ID: <1791d7da-ecd9-4475-8f27-c8857477b442@arm.com>
Date: Thu, 13 Aug 2026 18:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation for
 latency
To: Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Jean-Philippe Brucker <jpb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 David Matlack <dmatlack@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>,
 Samiullah Khawaja <skhawaja@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <akzm5BoV0rToJ7ij@google.com> <20260708001058.GA422027@nvidia.com>
 <an3MSKEj7VhT4WkP@google.com> <20260813141320.GF730363@nvidia.com>
 <an3ew9xbnLe1dr5g@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <an3ew9xbnLe1dr5g@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_102605_995793_E84006B7 
X-CRM114-Status: GOOD (  37.90  )
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

On 13/08/2026 4:12 pm, Mostafa Saleh wrote:
> On Thu, Aug 13, 2026 at 11:13:20AM -0300, Jason Gunthorpe wrote:
>>
>>> Sorry I lost track of this thread and I just saw v4.
>>>
>>> In the mobile space, I haven't seen an SMMUv3 that does not support
>>> RIL.
>>
>> Oh? That's very surprising, AFAIK none of our embedded chips support it
>> yet.. Even the server chips are only just getting it. Are you sure?
> 
> Yes, SMMUv3 is getting more and more common in moblie HW (opposed to
> custom SoC IOMMUs). Devices that I have seen in the market in the
> last couple of years have RIL. For example Pixel-10 which is currently
> getting upstreamed. Also, I have a mini desktop with QCOM X1 which
> have RIL.
> 
> The only SMMUv3 I have seen without RIL, is an old morello board I
> have.

Arm MMU-600 is in a few embedded parts - Rockchip RK3588, some of the TI 
Keystone 3s IIRC - but indeed it's mostly all over the first couple of 
generations of Neoverse stuff - Ampere Altra, AWS Graviton2 and so on. 
Similarly the ThunderX2 and early HiSilicon SMMUs also predate RIL, but 
those whole machines are all probably old enough now to no longer be 
widely used.

Arm implementations from MMU-700 onward all support RIL - MMU-700 itself 
was again more of a server-focused design (it's quite big), but has 
found its way into at least some embedded/mobile SoCs; MMU L1 is the 
first design targeted directly at client systems, so we should be seeing 
more of that as time goes on.

>> I gather it wasn't even available in ARM IP until recently ish?

If you'd consider 2019 recent ;)

>>> However, I have seen workloads that are really sensitive to translation
>>> latency (display, camera...). And I'd be concerned about those
>>> regressing.
>>
>> Yes, those exist, but again, they are already facing these problems if
>> running without RIL.
> 
> Yes, but my point is that those typically support RIL and that change
> regresses them.

Not even that - the main concern is over-invalidation of adjacent in-use 
buffers due to rounding up; non-RIL absolutely does not have that issue 
and never has.

>> And, for the common case of putting something into a carve out region
>> it is not so likely even an expanded RIL will intersect with a
>> reserved IOVA that has a high alignment.
> 
> Not necessarily, those devices can run with a small IOVA space to
> reduce the page table walk length making IOVAs quite close.
> 
>>
>> At least the things we have built are calibrated to handle a TLB
>> reload occasionally. The isochronous TLB's are not even sized to be
>> never-miss for all cases because things like 4k media require such a
>> large amount of IOVA the area cost is too high.
>>
>> While others can do something else you are reaching into a pretty
>> narrow condition to hit a problem:
>>   - HW that must have a never-miss TLB to work
> 
> I am not saying that, but we shouldn't over invalidate TLBs either
> when it is easy to avoid that.
> 
>>   - HW that doesn't have a carve out, or has a badly aligned carve out
> 
> I do not think a carveout will help. But it's a very strong constraint
> to enforce carveout on all devices specially media which are quite
> complex and composite by nature.
> 
>>   - A SMMU that has RIL (non RIL is already worse)
> 
> This regression only impacts RIL, otherwise it does not matter.
> 
>>   - A non-isochronos workload that regularly exceeds the RIL/single
>>     expansion thresholds
>>   - Unlucky IOVA allocation that places isochronous near other
>>     workloads in the IOVA space.
>>
> 
> It is not just luck, it depends on the IOVA space and access patterns
> of the device.
> 
>>> There is a clear trade-off here as you mentioned with TLBI latency,
>>> would it be make sense to make that behviour configurable from a
>>> module param?
>>
>> I think it makes sense for a driver to indicate to the core code that
>> it needs isochronous and we can do more global things like change how
>> single works as well. Having an isochronous flag on the domain, for
>> example, would be a good overall direction.
> 
> But according to what? It makes sense to optimize server chips,
> but that should not cause over-invalidation regressions on other
> hardware.
> 
>>
>> I'm inclined to leave this as is and let someone come with a specific
>> problematic HW, rather that try to badly guess without much
>> information if it might popssibly be a problem.
>>
> 
> It's not really a guess, I mentioned some examples above, that I
> have seen problems of translation latencies on them.
> 
> And why not the other way around:
> - Which uses cases can't handle few RIL commands?
> - Why those drivers does not unmap memory with a granule/IOVA fitting
>    to RIL?
> - Why those systems does not use FQ domains in the first place?

Note that with RIL, even precise invalidation should only actually need 
at most two commands (excepting absurd off-the-scale sizes) - the trick 
is to consider that they can overlap.

Conversely though, if we really did have a demonstrable need to minimise 
the number of commands issued then we should probably also not bother 
with the TTL hint nor splitting leaf ranges from non-leaf, such that we 
can gather pretty much any unmap into a single command.

This is probably something we'll end up wanting some kind of tunable 
behaviour for, given that SMMUv3 hardware is going to be spanning an 
increasingly wide range of use-cases with increasingly opposing 
requirements - it's certainly more than just "hypervisor or not". For 
now, though, I'm also not buying a dubious latency argument based on 
apparently no real-world data other than "I think"...

Thanks,
Robin.

