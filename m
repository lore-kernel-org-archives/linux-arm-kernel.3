Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E528C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj66UypcsvM+vY/I82pnPn1cYjMYFSAeFtKoiRrpI4U=; b=GdfDE0KMfA0j9dJpriRMYwEPxz
	pNM+xUKAeR3/2QuXQz+QMKZ0NGigdgEkrWrz/vEFkLMqKAZRtaqLtnhFnG5UAO3rFdjv1bjYNkIa0
	SrQ90PNA3vgCBxkzd92T612rzgF/U1X2j7yU1nM41FJVueKT0u0wy7Ql4kOYG6bCn0A9xt3MfNLAb
	isRr04RnX/Mty9DBsqINSr42Ufo8i/1kpk4oH4nHf9WVE8J0QG1WLan9TR2DcMXxpAo3qK5SwA/4Q
	vXu/z/uHEJnTbw/dL4hw/R0fr8ReU6VbNOLv03ERPyxQ/ONlvlCcqPwD3XZl3EuMaLu4jCm9Cxs2z
	7d4gLokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnE0Y-000000039GC-19eI;
	Wed, 26 Feb 2025 09:47:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDyz-000000038zg-36ev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:45:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC9E150C;
	Wed, 26 Feb 2025 01:45:52 -0800 (PST)
Received: from [10.57.84.229] (unknown [10.57.84.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 849503F6A8;
	Wed, 26 Feb 2025 01:45:35 -0800 (PST)
Message-ID: <2c465bdf-8028-4b05-8e18-3154735ce906@arm.com>
Date: Wed, 26 Feb 2025 09:45:33 +0000
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXHesY77QhnW_U19UURGUqiBuQrNcL-kWQs7niaMa4nAng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_014538_057476_80F920FA 
X-CRM114-Status: GOOD (  28.89  )
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

On 26/02/2025 09:04, Ard Biesheuvel wrote:
> On Wed, 26 Feb 2025 at 09:55, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 26/02/2025 08:33, Ard Biesheuvel wrote:
>>> On Wed, 26 Feb 2025 at 09:07, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> On 26/02/2025 06:59, Ard Biesheuvel wrote:
>>>>> On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
>>>>>>
>>>>>> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
>>>>>>> Apologies for the breakage, and thanks for the fix.
>>>>>>>
>>>>>>> I have to admit that I was a bit overzealous here: there is no point
>>>>>>> yet in using the sanitised value, given that we don't actually
>>>>>>> override the PA range in the first place.
>>>>
>>>> But unless I've misunderstood something, parange is overridden; Commit
>>>> 62cffa496aac (the same one we are fixing) adds an override to force parange to
>>>> 48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).
>>>>
>>>> I thought it would be preferable to honour that override, hence my use of
>>>> arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
>>>> about that case?
>>>>
>>>
>>> I wouldn't think so (but I'm glad you brought it up because this
>>> didn't occur to me at all tbh)
>>>
>>> With arm64.nolva, both the VA and PA ranges will be reduced, and so
>>> the range of the linear map will be 47 bits. So if the PA range is
>>> being reduced from 52 to 48, it will still exceed the size of the
>>> linear map, and so it should make no difference in this particular
>>> case.
>>
>> OK, so I think you're saying it'll happen to work correctly even if we ignore
>> that override? That sounds a bit fragile to me. Surely we should be consistent
>> and either always honour the override or remove the override in the first place?
>>
> 
> I'm trying to walk a fine line here between consistent use of the
> override, and fixing something that I broke in a nasty way all the way
> back to 6.12.
> 
> So yes, I agree that it would be better to use the override
> consistently, and this is what we should do going forward. But the
> purpose of the original patch was mainly to ensure that we
> consistently program the MMU either in LPA2 or in non-LPA2 mode, and
> not in a mix of the two. The linear mapping randomization change was
> kind of secondary.
> 
> So perhaps this should be two patches:
> - backing out the use of the sanitised register, as proposed by Will,
> with cc:stable
> - a follow up based on your proposal, which can be backported later if
> needed, but without tagging it for stable.

I suspect I'm misunderstanding something crucial about the way the linear map
randomization works (TBH the details of the signed comparisons went a little
over my head).

But my rough understanding is that there are 2 values you want to compare; the
size of the linear map and the PA range. If the PA range is significantly bigger
than the linear map size then we conclude we have enough room to randomize. (I
think this assumes that VA size is always GTE PA size). But if linear map size
is based on an overridden VA and overridden PA size (which I assume it must be,
given the pgtables will be limitted to the overridden VA size) and PA size is
not overridden, isn't it possible to wrongly conclude that there is enough room
to randomize when there really is not?

By that logic, you must include any PA override in this decision and so Will's
patch does not fix this case. Mine does.

But as I say, I'm not confident I understand this logic properly. If my
understanding is incorrect, let's go with your proposal.

Thanks,
Ryan



