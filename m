Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFEECFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OAX3jc19+bpKbCon7+OaXnYH7HKKrBrPJCIcgHFU2I=; b=0w4ZV3s14eqysTpbVT+dJvt2R+
	ewj+aePc+nEPCq5V8nVw5UvlUrs80+W1plQtnmggfodM0eDRKS2zOkkIhAvEYSjdIjGiy560p0P4K
	8YcGZAEcjC9gX/5kcR7JYO011dzYLcl0n8m7oHcv7Oe1ti+BoMV3v2MGdYJlc5k18HMd1tJW7NRmX
	Tuqjc9A6gdP3mXbI7j4jW6Z8yezpa4m/Yuubj9A0lk/KwnFoBB5jIbh03661jcEPRU+nxoMj+isHm
	TTKXeSgdn5wHe0gwtFd8DeYQn9hyB5iZI4o/vQcvsi4DAx/2s+HcwkNZqga/bJAPCs57fGUHzoWu/
	bo7HSrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vII-000000006Hl-1mHR;
	Thu, 24 Oct 2024 10:42:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vAd-000000005AG-2rdR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:34:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3905497;
	Thu, 24 Oct 2024 03:34:52 -0700 (PDT)
Received: from [10.57.88.37] (unknown [10.57.88.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C7373F7C5;
	Thu, 24 Oct 2024 03:34:20 -0700 (PDT)
Message-ID: <aef00d9d-0b1d-43f9-90d5-ee1b524ff8c8@arm.com>
Date: Thu, 24 Oct 2024 11:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Content-Language: en-GB
To: Neal Gompa <neal@gompa.dev>
Cc: Nick Chan <towinchenmi@gmail.com>, Eric Curtin <ecurtin@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, asahi@lists.linux.dev
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <4623805.lGaqSPkdTl@skuld-framework>
 <09e480d7-3ef6-4352-a484-91733ad7d231@arm.com>
 <CAOgh=FwEv3LjA7bfcOvWK7kZEcKRyLpQmTqWn5WDsSsYwGqu+A@mail.gmail.com>
 <649d7aa6-4163-4969-ba14-777f0e9cddb1@arm.com>
 <CAEg-Je9phqMqXCVAEjtXKadKGUmZcuSnFLDn=7C4+MaUu9KpYw@mail.gmail.com>
 <872f1c9c-9fb2-4372-810d-abe5419c4bd8@arm.com>
 <CAEg-Je9RpGGmw_pto7seYj_JGNUjSTKtcjLToQ8Mbp2_zrLGoQ@mail.gmail.com>
 <2174ff43-3ab6-409b-a8a8-bd319a134d86@gmail.com>
 <997f1826-ec45-4d47-ad94-33c0d194b5a4@arm.com>
 <CAEg-Je85pnstdRCxocZ3D0sLtZiCPAB+jHKyW+K-H2rFeVwP7Q@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAEg-Je85pnstdRCxocZ3D0sLtZiCPAB+jHKyW+K-H2rFeVwP7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_033423_860414_0F0B62EF 
X-CRM114-Status: GOOD (  34.47  )
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

On 22/10/2024 18:30, Neal Gompa wrote:

[...]

>>>>>>>>>>
>>>>>>>>>> This is a generally very exciting patch set! I'm looking forward to seeing it
>>>>>>>>>> land so I can take advantage of it for Fedora ARM and Fedora Asahi Remix.
>>>>>>>>>>
>>>>>>>>>> That said, I have a couple of questions:
>>>>>>>>>>
>>>>>>>>>> * Going forward, how would we handle drivers/modules that require a particular
>>>>>>>>>> page size? For example, the Apple Silicon IOMMU driver code requires the
>>>>>>>>>> kernel to operate in 16k page size mode, and it would need to be disabled in
>>>>>>>>>> other page sizes.
>>>>>>>>>
>>>>>>>>> I think these drivers would want to check PAGE_SIZE at probe time and fail if an
>>>>>>>>> unsupported page size is in use. Do you see any issue with that?
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> * How would we handle an invalid selection at boot?
>>>>>>>>>
>>>>>>>>> What do you mean by invalid here? The current policy validates that the
>>>>>>>>> requested page size is supported by the HW by checking mmfr0. If no page size is
>>>>>>>>> passed on the command line, or the passed value is not supported by the HW, then
>>>>>>>>> the we default to the largest page size supported by the HW (so for Apple
>>>>>>>>> Silicon that would be 16k since the HW doesn't support 64k). Although I think it
>>>>>>>>> may be better to change that policy to use the smallest page size in this case;
>>>>>>>>> 4k is the safer bet for compat and will waste much less memory than 64k.
>>>>>>>>>
>>>>>>>>>> Can we program in a
>>>>>>>>>> fallback when the "wrong" mode is selected for a chip or something similar?
>>>>>>>>>
>>>>>>>>> Do you mean effectively add a machanism to force 16k if the detected HW is Apple
>>>>>>>>> Silicon? The trouble is that we need to select the page size, very early in
>>>>>>>>> boot, before start_kernel() is called, so we really only have generic arch code
>>>>>>>>> and the command line with which to make the decision.
>>>>>>>>
>>>>>>>> Yes... I think a build-time CONFIG for default page size, which can be
>>>>>>>> overridden by a karg makes sense... Even on platforms like Apple
>>>>>>>> Silicon you may want to test very specific things in 4k by overriding
>>>>>>>> with a karg.
>>>>>>>
>>>>>>> Ahh, yes, that would certainly work. I'll work it into the next version.
>>>>>>>
>>>>>>
>>>>>> Could we maybe extend to have some kind of way to include a table of
>>>>>> SoC IDs that certain modes are disabled (e.g. 64k on Apple Silicon)
>>>>>
>>>>> 64k is already disabled on Apple Silicon because mmfr0 reports that 64k is not
>>>>> supported.
>>>>>
>>>>>> and preferred modes when no arg is set (16k for Apple Silicon)? That
>>>>>
>>>>> And it's not obvious that we should hard-code a page size preference to a SoC
>>>>> ID. If the CPU can support multiple page sizes, it should be up to the SW stack
>>>>> to decide, not the SoC.
>>>>>
>>>>> I'm guessing your desire is to have a single kernel build that will boot 16k by
>>>>> default on Apple Silicon and 4k by default on other systems, all without needing
>>>>> to modify the command line? Personally I think it's cleaner to just require
>>>>> setting the page size on the command line in these cases.
>>>>>
>>>>>> way it'd work something like this:
>>>>>>
>>>>>> 1. Table identification of 4/16/64 depending on identified SoC
>>>>> So I'd prefer not to have this
>>>>>
>>>>>> 2. Unidentified ones follow build-time default
>>>>>> 3. karg forces a mode regardless
>>>>> But keep these 2.
>>>>>
>>>>
>>> Since we are talking about Apple Silicon and page size, I would like to
>>> add that on the Apple Silicon SoCs I am working on, the situation is like
>>> this:
>>>
>>> Apple A7 (s5l8960x), A8 (T7000), A8X (T7001): CPU MMU support 4K and 64K
>>> page sizes.
>>>
>>> Apple A9 (s8000/s8003), A9X (s8001), A10 (t8010), A10X (t8011), A11 (t8015):
>>> CPU MMU Support 16K and 64K page sizes.
>>>
>>> However, all of them have 4K page DART IOMMUs.
>>>
>>>> I think it makes sense to have it, because it's not just Apple Silicon
>>>> where such a preference/requirement may be necessary. Apple Silicon
>>>> technically works at 4k, but is completely broken at 4k because Linux
>>>> cannot do 16k IOMMU with 4k everything else, so being able to at least
>>>> prefer 16k out of the box is important. And SoCs like the NVIDIA Grace
>>>> Hopper platform prefer 64k over other options (though I am unaware of
>>>> a gross incompatibility that effectively requires it like Apple
>>>> Silicon has).
>>>>
>>>> When we're trying to get to "single generic image that works
>>>> everywhere", stuff like this matters and I would really like you to
>>>> consider it from the lens of "we want things to work as automagic as
>>>> they do on x86".
>>> For me, in order to get to this level of automagic, there do need to be
>>> a table of which SoC should use which page size table.
>>
>> OK, but it's not clear to me that this table needs to be in the kernel. Could it
>> not be something in user space (e.g. during installation) that configures the
>> kernel command line?
>>
> 
> This is not compatible with using things like ISOs with UEFI+ACPI
> enabled desktop/server systems. We need to be able to safely,
> automatically, and correctly boot up and support hardware. The only
> place to do that early enough is in the kernel. But this can wait
> until the core stuff is in.

OK got it.

> 
>> Regardless, the hard work here is getting the boot-time page size selection
>> mechanism in place. Once that's there, follow up patches can add the desired
>> policy. I'd rather leave it out for now to avoid anything slowing down the core
>> work.
>>
> 
> Sure, this can be done afterward.

Thanks! I understand the problem a bit better now. I'm sure we can find a
solution once we have landed the core mechanism.

Thanks,
Ryan



