Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C273E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4826thRCnzo9UT2dSVOhBPmXdFNnd0wF4KQbWcTe4g=; b=nJubSHkBXYyzQFCOe98IYpWnLh
	OAE5Ir7Kpms9CnucSgvDYYZdndbPSHiWDfl6bMt0jr0QVNRuXhlS8xog1tW6C/N/3povc8qXmoFPf
	ikEFKByhbeviNjHwMPY1biCoPsYQqOrmdktqOjSO9LMSxLIKWC8lF18FN1NQvHEql4l1CJQZJKBh6
	9QgaKrd9Hh4kIKEvt0IKUbyrn/e+A4AtqqVmd26Alj43hYDOqtJzLRGkgiwkFJwRCO/nEC0iMQheB
	7mmDXRtBu2rN27DEw33KXGpMIXLX1ZPrHct+dLoWcr9+CjGqy8Dg01diIGoMCzowO9ClGB72zJNDa
	AAN5XaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkFt-00000009A6H-1dCP;
	Mon, 09 Dec 2024 20:21:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkEq-000000099ve-2umV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 20:20:17 +0000
Received: from [10.0.0.115] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 453EB20CECB3;
	Mon,  9 Dec 2024 12:20:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 453EB20CECB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733775615;
	bh=R4826thRCnzo9UT2dSVOhBPmXdFNnd0wF4KQbWcTe4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NsRSyzOIBWUwgsiQFGVRbC3/A2MikFgjENASO0p/8m5UcXCTUulPAsxip75CP4qsf
	 ctzkCttrkZJZRspRzV/NEZllxMRMKtIgn9G1PLU5Yvlf9XL3FuOo7TSWu7X/hCgnoq
	 ZKGVcXjSI6PhZ6rMAdjd9f15APVQTFTBH0Y/7p8k=
Message-ID: <6cf69fbd-b6a0-4e88-85a6-749a4e2dbdaa@linux.microsoft.com>
Date: Mon, 9 Dec 2024 12:20:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hyperv: Move some features to common code
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mukeshrathor@microsoft.com" <mukeshrathor@microsoft.com>
References: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB41573F55DBAAF124CFD92840D4332@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41573F55DBAAF124CFD92840D4332@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_122016_789738_7DC0A7A2 
X-CRM114-Status: GOOD (  42.82  )
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

On 12/7/2024 6:59 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Friday, December 6, 2024 2:22 PM
>>
>> There are several bits of Hyper-V-related code that today live in
>> arch/x86 but are not really specific to x86_64 and will work on arm64
>> too.
>>
>> Some of these will be needed in the upcoming mshv driver code (for
>> Linux as root partition on Hyper-V).
> 
> Previously, Linux as the root partition on Hyper-V was x86 only, which is
> why the code is currently under arch/x86. So evidently the mshv driver
> is being expanded to support both x86 and arm64, correct? Assuming
> that's the case, I have some thoughts about how the source code should
> be organized and built. It's probably best to get this right to start with so
> it doesn't need to be changed again.

Yes, we plan on supporting both architectures (eventually). I completely agree
that it's better to sort out these issues now rather than later.

> 
> * Patch 2 of this series moves hv_call_deposit_pages() and
>    hv_call_create_vp() to common code, but does not move
>    hv_call_add_logical_proc(). All three are used together, so
>    I'm wondering why hv_call_add_logical_proc() isn't moved.
> 

The only reason is that in our internal tree there's no common or arm64 code
yet that uses it - there is no reason it can't also become common code!

> * These three functions were originally put in a separate source
>    code file because of being specific to running in the root partition,
>    and not needed for generic Linux guest support. I think there's
>    value in keeping them in a separate file, rather than merging them
>    into hv_common.c. Maybe just move the entire hv_proc.c file?

Agreed. I think it should be renamed too - this file will eventually
contain some additional hypercall helper functions, some of which may also be
shared by the driver code. Something like "hv_call_common.c"?

>    And then later, perhaps move the entire irqdomain.c file as well?
Yes, may as well move it too.

>    There's also an interesting question of whether to move them into
>    drivers/hv, or create a new directory virt/hyperv. Hyper-V support
>    started out 15 years ago structured as a driver, hence "drivers/hv".
>    But over the time, the support has become significantly more than
>    just a driver, so "virt/hyperv" might be a better location for
>    non-driver code that had previously been under arch/x86 but is
>    now common to all architectures.
> 
I'd be fine with using "virt/hyperv", but I thought "virt" was only for
KVM.

Another option would be to create subdirectories in "drivers/hv" to
organize the different modules more cleanly (i.e. when the /dev/mshv
driver code is introduced).

> * Today, the code for running in the root partition is built along
>    with the rest of the Hyper-V support, and so is present in kernels
>    built for normal Linux guests on Hyper-V. I haven't thought about
>    all the implications, but perhaps there's value in having a CONFIG
>    option to build for the root partition, so that code can be dropped
>    from normal kernels. There's a significant amount of new code still
>    to come for mshv that could be excluded from normal guests in this
>    way. Also, the tests of the hv_root_partition variable could be
>    changed to a function the compiler detects is always "false" in a
>    kernel built without the CONFIG option, in which case it can drop
>    the code for where hv_root_partition is "true".
> 
Using hv_root_partition is a good way to do it, since it won't require
many #ifdefs or moving the existing code around too much.

I can certainly give it a try, and create a separate patch series
introducing the option. I suppose "CONFIG_HYPERV_ROOT" makes sense as a
name?

> * The code currently in hv_proc.c is built for x86 only, and validly
>    assumes the page size is 4K. But when the code moves to be
>    common across architectures, that assumption is no longer
>    valid in the general case. Perhaps the intent is that kernels for
>    the root partition should always be built with page size 4K on
>    arm64, but nothing enforces that intent. Personally, I think the code
>    should be made to work with page sizes other than 4K so as to not
>    leave technical debt. But I realize you may have other priorities. If
>    there were a CONFIG option for building for the root partition,
>    that option could be setup to enforce the 4K page size on arm64.
> 
That makes sense. I suppose this can be done by selecting PAGE_SIZE_4KB
under HYPERV in drivers/hv/Kconfig?

I'm not how easy it will be to make the code work with different page
sizes, since we use alloc_page() and similar in a few places, assuming 4k.

Thanks
Nuno

> Anyway, thinking through these decisions up front could avoid
> the need for additional moves later on.
> 
> Michael
> 
>> So this is a good time to move
>> them to hv_common.c.
>>
>> Signed-off-by: Nuno Das Neves <nudasnev@microsoft.com>
>>
>> Nuno Das Neves (2):
>>   hyperv: Move hv_current_partition_id to arch-generic code
>>   hyperv: Move create_vp and deposit_pages hvcalls to hv_common.c
>>
>>  arch/arm64/hyperv/mshyperv.c    |   3 +
>>  arch/x86/hyperv/hv_init.c       |  25 +----
>>  arch/x86/hyperv/hv_proc.c       | 144 ---------------------------
>>  arch/x86/include/asm/mshyperv.h |   4 -
>>  drivers/hv/hv_common.c          | 168 ++++++++++++++++++++++++++++++++
>>  include/asm-generic/mshyperv.h  |   4 +
>>  6 files changed, 176 insertions(+), 172 deletions(-)
>>
>> --
>> 2.34.1


