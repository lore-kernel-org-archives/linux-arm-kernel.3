Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB55C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PmQ+Zj9/bNgyKiuxvB6cZK7BaDhASXtEx1v9wT82gs=; b=vzAcm3Z/Iev3p+typFwSmAiHpT
	L8jXICjLzLQGLudxIcexSh21+bQCbRrwOdmew7CEDin7+6PNiiLsF6vCruUagqmzxCDMF9BwXQ3Vh
	YNPMBjKqhh4qI4FnUro5nBtmH81bcXJjRaTViz57JqHD4bn6rQHKJVOKKPvAEzOSiZywhxK+NdanM
	+dUDxawVu+31Of3EOmubXrjuJQguWINexKvQBInQMn+ifdTb6tvpI4DPJrn1euSoQ3XLbR68v6TR8
	uG9Su52mfP5ptj88QAbDnqUMiL5B28OmB16Op5aIwT5DRvcJOLYbS/cYz33NrmHnxkCx/W0IG4wBW
	kNvIL2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCiF-00000002rhI-1VeE;
	Wed, 26 Feb 2025 08:24:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCRr-00000002ofF-0HII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:07:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DCDB1516;
	Wed, 26 Feb 2025 00:07:33 -0800 (PST)
Received: from [10.57.84.229] (unknown [10.57.84.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 246F03F673;
	Wed, 26 Feb 2025 00:07:16 -0800 (PST)
Message-ID: <b0578d21-95cd-4d8a-add1-87299f36b491@arm.com>
Date: Wed, 26 Feb 2025 08:07:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
To: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
 <20250226001047.GA24197@willie-the-truck>
 <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_000719_200362_A829A213 
X-CRM114-Status: GOOD (  27.69  )
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

On 26/02/2025 06:59, Ard Biesheuvel wrote:
> On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
>>
>> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
>>> Apologies for the breakage, and thanks for the fix.
>>>
>>> I have to admit that I was a bit overzealous here: there is no point
>>> yet in using the sanitised value, given that we don't actually
>>> override the PA range in the first place. 

But unless I've misunderstood something, parange is overridden; Commit
62cffa496aac (the same one we are fixing) adds an override to force parange to
48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).

I thought it would be preferable to honour that override, hence my use of
arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
about that case?

Thanks,
Ryan

>>> This is something I've
>>> prototyped for Android use, so that linear map randomization can be
>>> force enabled on CPUs with a wide PArange, but right now, mainline
>>> does not have that capability, and so I'd be inclined to just revert
>>> the hunk that introduces the call to read_sanitised_ftr_reg() into
>>> arm64_memblock_init(), especially given the fact that commit
>>> 62cffa496aac was tagged for stable, and was already pulled into 6.13
>>> and 6.12
>>>
>>> In any case, it would be good if we could get a fix into Linus's tree asap
>>
>> Makes sense. So the patch below?
>>
> 
> Yes, but please don't forget the cc:stable
> 
> To the patch below,
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 
> 
>> --->8
>>
>> From b76ddd40dd6fe350727a4b2ec50709fd919d8408 Mon Sep 17 00:00:00 2001
>> From: Ryan Roberts <ryan.roberts@arm.com>
>> Date: Tue, 25 Feb 2025 11:46:36 +0000
>> Subject: [PATCH] arm64/mm: Fix Boot panic on Ampere Altra
>>
>> When the range of present physical memory is sufficiently small enough
>> and the reserved address space for the linear map is sufficiently large
>> enough, The linear map base address is randomized in
>> arm64_memblock_init().
>>
>> Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
>> use it consistently"), we decided if the sizes were suitable with the
>> help of the raw mmfr0.parange. But the commit changed this to use the
>> sanitized version instead. But the function runs before the register has
>> been sanitized so this returns 0, interpreted as a parange of 32 bits.
>> Some fun wrapping occurs and the logic concludes that there is enough
>> room to randomize the linear map base address, when really there isn't.
>> So the top of the linear map ends up outside the reserved address space.
>>
>> Since the PA range cannot be overridden in the first place, restore the
>> mmfr0 reading logic to its state prior to 62cffa496aac, where the raw
>> register value is used.
>>
>> Reported-by: Luiz Capitulino <luizcap@redhat.com>
>> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
>> Closes: https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
>> Fixes: 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Link: https://lore.kernel.org/r/20250225114638.2038006-1-ryan.roberts@arm.com
>> Signed-off-by: Will Deacon <will@kernel.org>
>> ---
>>  arch/arm64/mm/init.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index 9c0b8d9558fc..ccdef53872a0 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -279,12 +279,7 @@ void __init arm64_memblock_init(void)
>>
>>         if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
>>                 extern u16 memstart_offset_seed;
>> -
>> -               /*
>> -                * Use the sanitised version of id_aa64mmfr0_el1 so that linear
>> -                * map randomization can be enabled by shrinking the IPA space.
>> -                */
>> -               u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
>> +               u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
>>                 int parange = cpuid_feature_extract_unsigned_field(
>>                                         mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
>>                 s64 range = linear_region_size -
>> --
>> 2.48.1.658.g4767266eb4-goog
>>


