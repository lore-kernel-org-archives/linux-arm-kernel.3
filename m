Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+9RosJYTEpseZCD+ZRKGDfdLodPKjo1b+MiM+Vfii0=; b=djcYlvk9dROkJ1CRspOvJijjJA
	BgRM4n6DH+MaBqMkdOSN+OUt2kyroCw8TYL6Cu30LqT1Cp1+U+Tke+GPNtHUuLEkXjU7iS/i2C23i
	WPXViJpFC0jni9ruBFSN6JmVcvV2mpgv97INu8Af4BRKAbPAAKtKMSj41xXxvS1mmR917h+aGWoYH
	t43h/jDvOkr0e+0xSKvv3peLgDrDdyGJZiRCSQRO1bqTSq+G4tGR9c0e1os7xLr5eBE23t2Z4FZ9A
	TlPJphf4P8mApljSrbWzhzSin5xWo7FmtBXePsczvMTdEd4n+xQui/mHXQbjhtx+3nWVz4BCOwxMZ
	1CXXtqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVqV-00000001Ljn-0aIo;
	Fri, 06 Dec 2024 10:46:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVXT-00000001HMz-2jZi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:26:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9600112FC;
	Fri,  6 Dec 2024 02:26:49 -0800 (PST)
Received: from [10.57.90.201] (unknown [10.57.90.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0063F71E;
	Fri,  6 Dec 2024 02:26:18 -0800 (PST)
Message-ID: <bd4a30ca-6725-4c78-94ba-03581700bdcc@arm.com>
Date: Fri, 6 Dec 2024 10:26:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Content-Language: en-GB
To: Petr Tesarik <ptesarik@suse.com>, Michael Kelley <mhklinux@outlook.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Greg Marsden
 <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
 <20241205182008.2b36476a@mordecai.tesarici.cz>
 <SN6PR02MB41571E0BD384C44C46127B49D4302@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20241206085026.32c89a03@mordecai.tesarici.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241206085026.32c89a03@mordecai.tesarici.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_022623_781537_27903229 
X-CRM114-Status: GOOD (  19.88  )
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

On 06/12/2024 07:50, Petr Tesarik wrote:
> On Thu, 5 Dec 2024 18:52:35 +0000
> Michael Kelley <mhklinux@outlook.com> wrote:
> 
>> From: Petr Tesarik <ptesarik@suse.com> Sent: Thursday, December 5, 2024 9:20 AM
>>>
>>> Hi Ryan,
>>>
>>> On Thu, 17 Oct 2024 13:32:43 +0100
>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>   
>>>> On 17/10/2024 13:27, Petr Tesarik wrote:  
>>>>> On Mon, 14 Oct 2024 11:55:11 +0100
>>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>>  
>>>>>> [...]
>>>>>> The series is arranged as follows:
>>>>>>
>>>>>>   - patch 1:	   Add macros required for converting non-arch code to support
>>>>>>   		   boot-time page size selection
>>>>>>   - patches 2-36:  Remove PAGE_SIZE compile-time constant assumption from all
>>>>>>   		   non-arch code  
>>>>>
>>>>> I have just tried to recompile the openSUSE kernel with these patches
>>>>> applied, and I'm running into this:
>>>>>
>>>>>   CC      arch/arm64/hyperv/hv_core.o
>>>>> In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
>>>>> ../include/linux/hyperv.h:158:5: error: variably modified ‘reserved2’ at file scope
>>>>>   u8 reserved2[PAGE_SIZE - 68];
>>>>>      ^~~~~~~~~
>>>>>
>>>>> It looks like one more place which needs a patch, right?  
>>>>
>>>> As mentioned in the cover letter, so far I've only converted enough to get the
>>>> defconfig *image* building (i.e. no modules). If you are compiling a different
>>>> config or compiling the modules for defconfig, you will likely run into these
>>>> types of issues.
>>>>
>>>> That said, I do have some patches to fix Hyper-V, which Michael Kelley was kind
>>>> enough to send me.
>>>>
>>>> I understand that Suse might be able to help with wider performance testing - if
>>>> that's the reason you are trying to compile, you could send me your config and
>>>> I'll start working on fixing up other drivers?  
>>>
>>> This project was de-prioritised for some time, but I have just returned
>>> to it, and one of our test systems uses a Mellanox 5 NIC, which did not build.

No problem - I appreciate all the time you have spent on it so far!

>>>
>>> If you still have time to work on your patch series, please, can you
>>> look into enabling MLX5_CORE_EN?

I've also had other things that have been taking up my time. I'm planning to get
back to this series properly after Christmas and convert all the remaining
module code. I'm hoping that Michael's patch will solve your problem for now?

>>>
>>> Oh, and have you rebased the series to 6.12 yet?

Afraid the latest I have at the moment is based on v6.12-rc3. It also includes
all the changes from the review feedback:

https://gitlab.arm.com/linux-arm/linux-rr/-/tree/features/boot-time-page-size-v2-wip

>>>   
>>
>> FWIW, here's what I hacked together to compile and run the mlx5 driver in
>> a Hyper-V VM.  This was against a 6.11 kernel code base.
> 
> Wow! Thank you, Michael. I'll give it a try.

Yes, thanks, Michael - I'll take a look at this and integrate into my tree after
Christmas.

Thanks,
Ryan

> 
> Petr T


