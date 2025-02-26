Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250F5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYYQC3e58btfcx1KssJhyZiu75BBY3DtdF++a8emIeg=; b=G+OGjhCr594heL0CdYfT52fWRu
	8YCva735uYCM8l4Ra2EcsW/NzDa6d6Ge3eC3XynNFyeYOyX0y4LfrWaJYzMFOedcsiTmhClLx7zGe
	IKZ1v85qWeuU2V5zxsDDlTz1Rc2JV8jZsmXJyDWNrIIPNX4nD1UvqNuFMO7J713NbIBD6Bzb4gC7D
	Yo4zEi29pN1peStGNPojv2G7l/HtD1f1xuAQiQH9/nA9jzD5gVL4N+5R61a42hAYqawlBSUcu+GQy
	MtUGieAtcmOLOcqaVWARqik6Hse07/cROCFEZnAikyMjWyqZZ+DcBqSqPY4IooR2UbHqmVnghp4HE
	J+uzuNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnF2W-00000003NEg-2Da9;
	Wed, 26 Feb 2025 10:53:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEVH-00000003GbN-1bEm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:19:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0C0C1BA8;
	Wed, 26 Feb 2025 02:19:14 -0800 (PST)
Received: from [10.57.84.229] (unknown [10.57.84.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C09D3F6A8;
	Wed, 26 Feb 2025 02:18:57 -0800 (PST)
Message-ID: <26a7ba50-e1cd-4c33-8b91-232413790786@arm.com>
Date: Wed, 26 Feb 2025 10:18:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Luiz Capitulino <luizcap@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
 <CAMj1kXHNO+iB4vNFz-4tR_9CPzv96hn+RW=eqyZXMGy_AySDpw@mail.gmail.com>
 <20250226001047.GA24197@willie-the-truck>
 <CAMj1kXH=tPuM+irCsKgycUTbts8h9vD4m3tEtw51YFzWafdSUA@mail.gmail.com>
 <b0578d21-95cd-4d8a-add1-87299f36b491@arm.com>
 <CAMj1kXHJGC9aYCwwb2XTWfhAjH6GDKQptNdLwO+hfv6hazivHQ@mail.gmail.com>
 <b6b999c9-79cd-4945-9d7a-c5ee8158b7dc@arm.com>
 <CAMj1kXHesY77QhnW_U19UURGUqiBuQrNcL-kWQs7niaMa4nAng@mail.gmail.com>
 <2c465bdf-8028-4b05-8e18-3154735ce906@arm.com>
 <CAMj1kXGQSFh9A_uK6-i1-sd59i+yKg3vZxD+cYQ_vyz-HZJZKg@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXGQSFh9A_uK6-i1-sd59i+yKg3vZxD+cYQ_vyz-HZJZKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_021859_512597_6019EB0C 
X-CRM114-Status: GOOD (  34.46  )
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

On 26/02/2025 10:07, Ard Biesheuvel wrote:
> On Wed, 26 Feb 2025 at 10:45, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 26/02/2025 09:04, Ard Biesheuvel wrote:
>>> On Wed, 26 Feb 2025 at 09:55, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> On 26/02/2025 08:33, Ard Biesheuvel wrote:
>>>>> On Wed, 26 Feb 2025 at 09:07, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>>
>>>>>> On 26/02/2025 06:59, Ard Biesheuvel wrote:
>>>>>>> On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
>>>>>>>>
>>>>>>>> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
>>>>>>>>> Apologies for the breakage, and thanks for the fix.
>>>>>>>>>
>>>>>>>>> I have to admit that I was a bit overzealous here: there is no point
>>>>>>>>> yet in using the sanitised value, given that we don't actually
>>>>>>>>> override the PA range in the first place.
>>>>>>
>>>>>> But unless I've misunderstood something, parange is overridden; Commit
>>>>>> 62cffa496aac (the same one we are fixing) adds an override to force parange to
>>>>>> 48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).
>>>>>>
>>>>>> I thought it would be preferable to honour that override, hence my use of
>>>>>> arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
>>>>>> about that case?
>>>>>>
>>>>>
>>>>> I wouldn't think so (but I'm glad you brought it up because this
>>>>> didn't occur to me at all tbh)
>>>>>
>>>>> With arm64.nolva, both the VA and PA ranges will be reduced, and so
>>>>> the range of the linear map will be 47 bits. So if the PA range is
>>>>> being reduced from 52 to 48, it will still exceed the size of the
>>>>> linear map, and so it should make no difference in this particular
>>>>> case.
>>>>
>>>> OK, so I think you're saying it'll happen to work correctly even if we ignore
>>>> that override? That sounds a bit fragile to me. Surely we should be consistent
>>>> and either always honour the override or remove the override in the first place?
>>>>
>>>
>>> I'm trying to walk a fine line here between consistent use of the
>>> override, and fixing something that I broke in a nasty way all the way
>>> back to 6.12.
>>>
>>> So yes, I agree that it would be better to use the override
>>> consistently, and this is what we should do going forward. But the
>>> purpose of the original patch was mainly to ensure that we
>>> consistently program the MMU either in LPA2 or in non-LPA2 mode, and
>>> not in a mix of the two. The linear mapping randomization change was
>>> kind of secondary.
>>>
>>> So perhaps this should be two patches:
>>> - backing out the use of the sanitised register, as proposed by Will,
>>> with cc:stable
>>> - a follow up based on your proposal, which can be backported later if
>>> needed, but without tagging it for stable.
>>
>> I suspect I'm misunderstanding something crucial about the way the linear map
>> randomization works (TBH the details of the signed comparisons went a little
>> over my head).
>>
>> But my rough understanding is that there are 2 values you want to compare; the
>> size of the linear map and the PA range. If the PA range is significantly bigger
>> than the linear map size then we conclude we have enough room to randomize.
> 
> It is the other way around: the linear map should be able to cover all
> system RAM that may appear anywhere in the PA space, and so if the PA
> space is very large (and memory hotplug is enabled), no randomization
> is possible, as it may end up mapping RAM that appears later past the
> top of the VA space. Note that the same is fundamentally true for
> running a 39-bit VA kernel on hardware that has a PA range that
> exceeds that.
> 
> As for the signed arithmetic: the randomization works by substracting
> from memstart_addr (aka PHYS_OFFSET). Normally, if system RAM starts
> at 1G, memstart_addr will be 1G, and the linear map will associate
> PAGE_OFFSET with PA 1G.
> 
> To randomize the linear mapping, the system RAM has to be moved up in
> the linear map (as this is the only direction it can be moved), and so
> PAGE_OFFSET needs to map to a lower value, and so memstart_addr may
> wrap around and become negative.
> 
>> (I
>> think this assumes that VA size is always GTE PA size). But if linear map size
>> is based on an overridden VA and overridden PA size (which I assume it must be,
>> given the pgtables will be limitted to the overridden VA size) and PA size is
>> not overridden, isn't it possible to wrongly conclude that there is enough room
>> to randomize when there really is not?
>>
> 
> No, if the linear map is only 47 bits, and the PA space is either 52
> or 48 bits, no randomization is possible. We might even run out of
> space without randomization, but this is an existing problem for
> non-LPA2 too.

Ahh that all makes much more sense now! I'm happy to go with the patch Will
proposed.

Thanks,
Ryan




