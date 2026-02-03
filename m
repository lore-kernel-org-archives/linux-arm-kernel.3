Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB70CE83059
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVycVSeEop8JKxuUHxlsz1NcKD3LEqIHbdeXH2h5LMw=; b=Dzhq+p3/DeHnkE4DCi1WeKwj/U
	QM45mOHunMjAygHO4VFxvf+gIT75hj42ch5wGKnNyu1dSvFcViBsOYF0grvmiIKogYxHq9DqD53Rv
	z7zjaB1qQVCLaKqbvFjAgSei1wXA4eYiRYNvaZGmgM1S5DJlnp8wwOxQBtDjWsfuplKTQrX79Puu7
	AGiQayto1aGoKehlF2x5jomkzyTbQG2Si3kTerXZIQ9njgLBNSrVtVfsGvXDveBAD/i4BO7yBUgH9
	0TK7RwB/4t9rb89uEiLSNYkvUr6lSnome2qfBeQc7BeJUsC1KF7bkK2kK93luVu5spwsXqBaAb2cd
	Ze7s7+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9th-00000006Bff-15dV;
	Tue, 03 Feb 2026 06:28:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9te-00000006BfJ-0aPu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:28:23 +0000
Received: from [10.95.64.228] (unknown [167.220.238.132])
	by linux.microsoft.com (Postfix) with ESMTPSA id A5AFA20B7169;
	Mon,  2 Feb 2026 22:28:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A5AFA20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770100099;
	bh=LVycVSeEop8JKxuUHxlsz1NcKD3LEqIHbdeXH2h5LMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jmmk8o+vanxcCqM7DOKRp0g/bHvUD+y0np5BNl84lLBWwMxemC42T+UpzsxkfFMSt
	 oE8Bl1J4qBhXbumv1fOxAqblNmCy87LLPE1UlrEiTPecpuYTmx0RoohyMvCvFM/zCC
	 jULyGZBPmZEhYYMsG2ZnI2ogvXq89snfMpvc5N7o=
Message-ID: <6eadf05f-21bf-47d7-abd8-e4694a21e6da@linux.microsoft.com>
Date: Tue, 3 Feb 2026 11:58:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222822_218238_2FFFAEE6 
X-CRM114-Status: GOOD (  32.85  )
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



On 2/2/2026 7:45 PM, Thomas Weißschuh wrote:
> Hi Naman,
> 
> On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
>> Build ID hashes include file paths, so building the same source from
>> different directories produces different binaries. This breaks
>> reproducible builds.
>>
>> Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:
>>
>>      make KBUILD_BUILD_ID=none
>>
>> The variable is exported to VDSO Makefiles which also include a
>> fallback default for standalone invocation.
>>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>> Hi,
>> Sending this change for RFC, as it is quite possible that this is a
>> generic problem and I may be missing something.
>>
>> I am trying to implement reproducible builds for one of my product
>> kernel. I referred https://reproducible-builds.org/docs/build-path/
>> and tried to use both -fdebug-prefix-map=OLD=NEW and
>> -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
>> binary reproducibility without overwriting build-id to none.
>> If I move the kernel to same path in other setup, I was able to create
>> same binary hash, however, without it, there is some difference in
>> build-id hash values.
> 

Hi Thomas,
Thanks for looking into this and sharing your inputs.


> Can you force the same build path during package building?
> That should avoid this issue.

Since we can't control where the user would clone their kernel, I was 
initially skeptical to copy the kernel to a same build path like 
/tmp/kernel/src directory due to uncertainties related to free space, 
permissions, but I tried it now and it works fine. It should be OK for 
my use-case.

I am currently using NixOS for reproducible build environment.

> 
>> Reproducibility wiki says "In most cases however, post-processing is
>> required to either remove the build path or to normalize it to a
>> predefined value.". I have tried that, and it works, but wanted to
>> conclude if that is my last option here.
> 
> I am not a fan of this aproach. The build id should stay usable.
> Can you figure out where the build paths are used?
> You may need to also compare the debug symbols.
> 
>> Thanks.

I agree.
We did not have any use of these build paths, but some vendors may be 
using it to fetch the build information from the binaries.
If your comment was about in-kernel usage of these build paths, I'll 
look into it.

>>
>> ---
>>   Makefile                          | 8 ++++++--
>>   arch/arm64/kernel/vdso/Makefile   | 5 ++++-
>>   arch/arm64/kernel/vdso32/Makefile | 5 ++++-
>>   arch/x86/entry/vdso/Makefile      | 5 ++++-
>>   4 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 3373308d2217c..3fcff4af200d7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
>>   KBUILD_CFLAGS   += $(KCFLAGS)
>>   KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
>>   
>> -KBUILD_LDFLAGS_MODULE += --build-id=sha1
>> -LDFLAGS_vmlinux += --build-id=sha1
>> +# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
>> +KBUILD_BUILD_ID ?= sha1
>> +export KBUILD_BUILD_ID
>> +
>> +KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
>> +LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
>>   
>>   KBUILD_LDFLAGS	+= -z noexecstack
>>   ifeq ($(CONFIG_LD_IS_BFD),y)
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index 7dec05dd33b70..b3ee5982b4676 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -9,6 +9,9 @@
>>   # Include the generic Makefile to check the built vdso.
>>   include $(srctree)/lib/vdso/Makefile.include
>>   
>> +# Fallback for standalone builds, normally inherited from top-level Makefile
>> +KBUILD_BUILD_ID ?= sha1
>> +
> 
> What kind of standalone builds?
> This doesn't look like it belongs into this patch.
> 
> (...)

The case I was trying to cover here was when we try to compile 
arch/x86/entry/vdso/ separately, without the KBUILD_BUILD_ID coming from 
main build scripts, "--build-id=" would be left empty, while we may want 
to retain original value i.e. sha1.

     make ARCH=x86_64 arch/x86/entry/vdso/


arch/x86/entry/vdso/Makefile:
-VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 --no-undefined \
+VDSO_LDFLAGS = -shared --hash-style=both --build-id=$(KBUILD_BUILD_ID) 
--no-undefined \

Anyways, this may not be required now.

Regards,
Naman

