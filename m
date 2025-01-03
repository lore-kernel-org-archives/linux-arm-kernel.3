Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D5E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgdX9qZkCh6lVw8uS5shbBQ+OtMakFId8ao4IWbtWtU=; b=mkyavaU70vUvRGyIpCXoK9Oxaa
	UwShtm5/uIRMsk00486u4X1G8bU4RS8Zai9AVYnVlXuA0XfAY24Tpw5uRHo8Y3pV7yVFBgT6TILc3
	N0OkUusbPyj+WAQpBdHynI9pjJEdc+mPODU87Vsu6WyKiHdefqrS+l6QQAcuScbAJE7sYaCEZFVGi
	tGAzx9j3FnTRUXMp1torG8zx/Df7EiJ695po2kH2VKuwLtvzvnRo6Ukk1aRXjivyV52oHVWwTIvMh
	VahczcJRv496Av77XYyUUpXVeqmqU8+uHBLBjdkV2DtMbHekdZZ3MRoo3MGAy3xLVVYn6CcXOyBK1
	N3zIy8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTk7z-0000000DN5y-31Qv;
	Fri, 03 Jan 2025 16:02:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTk6l-0000000DMrW-0aos
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:01:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6572D1480;
	Fri,  3 Jan 2025 08:01:31 -0800 (PST)
Received: from [10.57.93.14] (unknown [10.57.93.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F4F83F673;
	Fri,  3 Jan 2025 08:01:00 -0800 (PST)
Message-ID: <2a6448f5-a48b-42fd-9589-acdb434f0a8a@arm.com>
Date: Fri, 3 Jan 2025 16:00:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 catalin.marinas@arm.com, corbet@lwn.net, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, yangyicong@huawei.com,
 guohanjun@huawei.com, wangkefeng.wang@huawei.com, liaochang1@huawei.com,
 sunnanyong@huawei.com, linuxarm@huawei.com
References: <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org> <084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com>
 <86ikrprn7w.wl-maz@kernel.org> <2b1cc228-a8d5-4383-ab25-abbbcccd2e2c@arm.com>
 <86h678sy00.wl-maz@kernel.org> <5c551e43-78e9-4336-ab16-b55c0d6c7f92@arm.com>
 <20241219164528.GH24724@willie-the-truck>
 <20250102120704.00002984@huawei.com> <86ed1lpfdh.wl-maz@kernel.org>
 <20250103153512.GD3816@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250103153512.GD3816@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_080107_280525_E76089FB 
X-CRM114-Status: GOOD (  24.28  )
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

On 03/01/2025 15:35, Will Deacon wrote:
> On Thu, Jan 02, 2025 at 12:30:34PM +0000, Marc Zyngier wrote:
>> On Thu, 02 Jan 2025 12:07:04 +0000,
>> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>>> On Thu, 19 Dec 2024 16:45:28 +0000
>>> Will Deacon <will@kernel.org> wrote:
>>>> On Thu, Dec 12, 2024 at 04:03:52PM +0000, Ryan Roberts wrote:
>>>>>>>> If anything, this should absolutely check for FAR_EL1 and assert that
>>>>>>>> this is indeed caused by such change.  
>>>>>>>
>>>>>>> I'm not really sure how we would check this reliably? Without patch 5, the
>>>>>>> problem is somewhat constrained; we could have as many changes in flight as
>>>>>>> there are CPUs so we could keep a list of all the {mm_struct, VA-range} that are
>>>>>>> being modified. But if patch 5 is confirmed to be architecturally sound, then
>>>>>>> there is no "terminating tlbi" so there is no bound on the set of {mm_struct,
>>>>>>> VA-range}'s that could legitimately cause a conflict abort.  
>>>>>>
>>>>>> I didn't mean to imply that we should identify the exact cause of the
>>>>>> abort. I was hoping to simply check that FAR_EL1 reports a userspace
>>>>>> VA. Why wouldn't that work?  
>>>>>
>>>>> Ahh gottya! Yes agreed, this sounds like the right approach.  
>>>>
>>>> Please, can we just not bother handling conflict aborts at all outside of
>>>> KVM? This is all dead code, it's complicated and it doesn't scale to the
>>>> in-kernel use-cases that others want. There's also not been any attempt
>>>> to add the pKVM support for handling host-side conflict aborts from what
>>>> I can tell.
>>>>
>>>> For now, I would suggest limiting this series just to the KVM support
>>>> for handling a broken/malicious guest. If the contpte performance
>>>> improvements are worthwhile (I've asked for data), then let's add support
>>>> for the CPUs that handle the conflict in hardware (I believe this is far
>>>> more common than reporting the abort) so that the in-kernel users can
>>>> benefit whilst keeping the code manageable at the same time.
>>>>
>>>
>>> Given direction the discussion is going in time to raise a hand.
>>>
>>> Huawei has implementations that support BBML2, and might report TLB conflict
>>> abort after changing block size directly until an appropriate TLB invalidation
>>> instruction completes and this Implementation Choice is architecturally compliant.
>>
>> Compliant, absolutely. That's the letter of the spec. The usefulness
>> aspect is, however, more debatable, and this is what Will is pointing
>> out.
>>
>> Dealing with TLB Conflict aborts is an absolute pain if you need
>> to handle it within the same Translation Regime and using the same
>> TTBR as the one that has generated the fault. So at least for the time
>> being, it might be preferable to only worry about the implementations
>> that will promise to never generate such an abort and quietly perform
>> an invalidation behind the kernel's back.
> 
> Agreed. We're not dropping support for CPUs that don't give us what we'd
> like here, we're just not bending over to port and maintain new
> optimisations for them. I think that's a reasonable compromise?
> 
> That said, thanks for raising this, Jonathan. It's a useful data point
> to know that TLB conflict aborts exist in the wild!

Indeed. Just to make it explicit; if we were to support all architecturally
compliant BBML2 implementations, we would need to drop the final patch in this
series. But since it sounds like we will be taking the approach of only allowing
these optimizations for implementations that never raise conflict abort and
handle it all in HW, it should be safe to keep the optimization in that final
patch. I'll work with Miko to get this bashed into shape and reposted.

Thanks,
Ryan

> 
> Will


