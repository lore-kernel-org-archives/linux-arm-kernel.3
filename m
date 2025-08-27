Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE351CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnS9iVBV59ihos3qkTGDp+5B6t1YGemqlDPGPUW3KX8=; b=UJEeoJ8y+9XhsyeAvWaGfMXNr9
	qtDX3Bo5aYImvROg5gb9CfGH4r+1pN6+XlRUcV4rHgPw8qcPovTR7tRtQykwgPxGelZ6hcZrAsrst
	sV7h3Tk5dZNFCpjMjDcczQQe5tFpJTR1dhFiU9zXAm1iJk4CPGmzxw7NbhKeaWOiurqzKIiRtFCgc
	wVB8amGSZooBmf/cgh0BNXkIhm9LtsbTFOLFKjJ8yJULoFFTNVcmxv9cEbOMmG1UM6JM4bSWBtAkD
	qbwh+3Ix+WaA5VnnSDoZaQ7QW4WdPiNnuiNh8k0SdoHtkJ3xWMYjpaEOizWX1M4o+KDPeVbrKgTdf
	3IfuHBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJhF-0000000GHFm-1bsR;
	Wed, 27 Aug 2025 17:12:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHdB-0000000FqR7-0UUo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:00:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C0D1688
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 07:59:57 -0700 (PDT)
Received: from [10.57.90.247] (unknown [10.57.90.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8FD3F694
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 08:00:05 -0700 (PDT)
Message-ID: <e15754b0-9295-42e6-aa58-c239461c449b@arm.com>
Date: Wed, 27 Aug 2025 16:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 0/4] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
Content-Language: en-GB
To: linux-arm-kernel@lists.infradead.org
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <447d4ee9-bf63-44f0-a064-fea5a5f1acef@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <447d4ee9-bf63-44f0-a064-fea5a5f1acef@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_080009_201605_93E4AFA4 
X-CRM114-Status: GOOD (  29.96  )
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

Hi Yang,

Sorry for slow reply; for some reason this didn't make it to my mailbox, then
I've been out on holiday for 2 weeks.


On 05/08/2025 19:37, Yang Shi wrote:
> Hi Ryan
> 
> On 8/5/25 1:13 AM, Ryan Roberts wrote:
>> Hi All,
>>
>> This is a new version built on top of Yang Shi's work at [1]. Yang and I have
>> been discussing (disagreeing?) about the best way to implement the last 2
>> patches. So I've reworked them and am posting as RFC to illustrate how I think
>> this feature should be implemented, but I've retained Yang as primary author
>> since it is all based on his work. I'd appreciate feedback from Catalin and/or
>> Will on whether this is the right approach, so that hopefully we can get this
>> into shape for 6.18.
>>
>> The first 2 patches are unchanged from Yang's v5; the first patch comes from Dev
>> and the rest of the series depends upon it.
> 
> Thank you for making the prototype and retaining me as primary author. The
> approach is basically fine to me. But there are some minor concerns. Some of
> them were raised in the comment for patch #3 and patch #4. I put them together
> here.
>     1. Walk page table twice. This has been discussed before. It is not very
> efficient for small split, for example, 4K. Unfortunately, the most split is
> still 4K in the current kernel AFAICT.

I have added a solution to this in my current version; to solve the mutex
problem, I've ended up passing both start and end to the main split() function
then have a helper function which the parent calls twice. With that I can avoid
the second call if the (end - start) is PAGE_SIZE - I just call split() once
with the "lesser aligned" of the 2 addresses and that guarantees that the page
is mapped by PTE. Added as it's own optimization patch.

>         Hopefully this can be mitigated by some new development, for example,
> ROX cache.
>     2. Take mutex lock twice and do lazy mmu twice. I think it is easy to
> resolve as I suggested in patch #3.

Yep, I've fixed this, as per above.

>     3. Walk every PTE and call split on every PTE for repainting. It is not very
> efficient, but may be ok for repainting since it is just called once at boot time.

I've added an optimization patch to avoid splitting to contpmd/contpte in this
case and we can additionally avoid visiting the pte table at all if it was
created by splitting a pmd.

> 
> I don't think these concerns are major blockers IMHO. Anyway let's see what
> Catalin and/or Will think about this.

I've additionally done some more cleanup; most notably I've removed the
bbml2_ptes[] array to save those 5 pages. Instead, I'm reusing the same flag
that kpti uses.

Functional tests all look good. I'll run some benchmarks overnight and if all
looks good, I'll post by the end of the week.

Hopefully Catalin or Will can provide some comments for this version.

Thanks,
Ryan

> 
> Regards,
> Yang


