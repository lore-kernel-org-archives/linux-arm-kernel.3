Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26446C19F30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru3WUeEe8wKZUNQqs4sYz8QjMtxdS5poj9PYJGdyA1s=; b=PaaquwA78DJTkJEI5wWhWbPrTB
	nUz17hPMtViWTCKU4Z5yB0v1hze+MrVs4IclryheXezhgTu7Ns2XpEwY2x07t/AlreWXQPU6PzvTW
	36AZ3BgeLSZD85Xjagrb0kHSQto8fZLjHQTQZ14ayIz61WQIHVNddmC2fP5doNVsBCrwwhr1I1w3z
	rM6ai2isUnqjAXln02XZkbUk0v0MptN8nUI1Dk6TZPybGZjcxiNJV/BRaGyjVVVxTL8SS3lkUKCpZ
	DCrva0GYs6Pel37zjxuAlR+u4JBKqZxyVIVQYMeYZOng13cx6pF3LvPKUSLHYXdBl07+0MJs8T57X
	XFs01fcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd6-000000033tb-1XRw;
	Wed, 26 Feb 2025 09:23:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDCW-00000002yjE-13fp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:55:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 777091063;
	Wed, 26 Feb 2025 00:55:47 -0800 (PST)
Received: from [10.57.84.229] (unknown [10.57.84.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 523C43F6A8;
	Wed, 26 Feb 2025 00:55:30 -0800 (PST)
Message-ID: <b6b999c9-79cd-4945-9d7a-c5ee8158b7dc@arm.com>
Date: Wed, 26 Feb 2025 08:55:28 +0000
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXHJGC9aYCwwb2XTWfhAjH6GDKQptNdLwO+hfv6hazivHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005532_349131_75CC7DF0 
X-CRM114-Status: GOOD (  23.43  )
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

On 26/02/2025 08:33, Ard Biesheuvel wrote:
> On Wed, 26 Feb 2025 at 09:07, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 26/02/2025 06:59, Ard Biesheuvel wrote:
>>> On Wed, 26 Feb 2025 at 01:10, Will Deacon <will@kernel.org> wrote:
>>>>
>>>> On Tue, Feb 25, 2025 at 07:05:35PM +0100, Ard Biesheuvel wrote:
>>>>> Apologies for the breakage, and thanks for the fix.
>>>>>
>>>>> I have to admit that I was a bit overzealous here: there is no point
>>>>> yet in using the sanitised value, given that we don't actually
>>>>> override the PA range in the first place.
>>
>> But unless I've misunderstood something, parange is overridden; Commit
>> 62cffa496aac (the same one we are fixing) adds an override to force parange to
>> 48 bits when arm64.nolva is specified for LPA2 systems (see mmfr2_varange_filter()).
>>
>> I thought it would be preferable to honour that override, hence my use of
>> arm64_apply_feature_override() in the fix. Are you saying we don't need to worry
>> about that case?
>>
> 
> I wouldn't think so (but I'm glad you brought it up because this
> didn't occur to me at all tbh)
> 
> With arm64.nolva, both the VA and PA ranges will be reduced, and so
> the range of the linear map will be 47 bits. So if the PA range is
> being reduced from 52 to 48, it will still exceed the size of the
> linear map, and so it should make no difference in this particular
> case.

OK, so I think you're saying it'll happen to work correctly even if we ignore
that override? That sounds a bit fragile to me. Surely we should be consistent
and either always honour the override or remove the override in the first place?

> 
> The use case I had in mind was to allow the PA range to be reduced to
> a value that is substantially less than the range of the linear map,
> e.g, 40 bits on a 48-bit VA kernel. On the Android side, the issue of
> the missing linear map randomization has come up a couple of times,
> but there is no clear direction at this point, so adding this feature
> here was premature (mea culpa)


