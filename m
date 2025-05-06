Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7788DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYC8W/pGxVxsYphrdmphRjr/ESF9+357a0YwOZMDMIE=; b=3dCeDFt7y2JbM4/wnzB791KJuY
	vbeH3MFCAw7+/VV98y62stM2avDBoyVLPE7Nj1I0bQaXxzD2zoeD7XzIqKiSNK+k5SFn9QoTs8tZi
	i1F1r34KuUg/YGVjc78UOD/xD/36bHyG9A+SDRRw/uTCV2978vPcH5bhyftlXG/1yRpv76LnlQDXU
	1j5pMD+JF9UY70lCb/6JCZUABiojvWxS/ER6Qnhbca80pc8nTv5nVxq/xA3tNHpji6RTWjmvGDyuW
	/mujJXLOGpL7rZoT4JPgPWGZy8Q6l5EGKeiRpmw2YrXfbKN06ho/MfHGNjl63Yg1gj5kqDq5lMBJZ
	E5caIPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH4P-0000000BqYr-1xCJ;
	Tue, 06 May 2025 12:06:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFEC-0000000BWIg-3wkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:08:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F4E2113E;
	Tue,  6 May 2025 03:08:34 -0700 (PDT)
Received: from [10.57.93.118] (unknown [10.57.93.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799073F5A1;
	Tue,  6 May 2025 03:08:40 -0700 (PDT)
Message-ID: <aa4241ce-02ea-4931-b60c-5ad0deba202d@arm.com>
Date: Tue, 6 May 2025 11:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com, broonie@kernel.org, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com,
 shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
 <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
 <aBYkGJmfWDZHBEzp@arm.com> <aBZ7P3/dUfSjB0oV@e129823.arm.com>
 <aBkL-zUpbg7_gCEp@arm.com> <aBnDqvY5c6a3qQ4H@e129823.arm.com>
 <fbfded61-cfe2-4416-9098-ef39ef3e2b62@arm.com>
 <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXFAYDeCgtPspQubkY688tcqwCMzCD+jEXb6Ea=9mBcdcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_030845_073738_654A198E 
X-CRM114-Status: GOOD (  20.77  )
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

On 06/05/2025 10:41, Ard Biesheuvel wrote:
> On Tue, 6 May 2025 at 10:16, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 06/05/2025 09:09, Yeoreum Yun wrote:
>>> Hi Catalin,
>>>
>>>> On Sat, May 03, 2025 at 09:23:27PM +0100, Yeoreum Yun wrote:
>>>>> Hi Catalin,
>>>>>
>>>>>> On Sat, May 03, 2025 at 11:16:12AM +0100, Catalin Marinas wrote:
>>>>>>> On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
>>>>>>>> create_init_idmap() could be called before .bss section initialization
>>>>>>>> which is done in early_map_kernel().
>>>>>>>> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
>>>>>>>>
>>>>>>>> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
>>>>>>>> and this variable places in .bss section.
>>>>>>>>
>>>>>>>> [...]
>>>>>>>
>>>>>>> Applied to arm64 (for-next/fixes), with some slight tweaking of the
>>>>>>> comment, thanks!
>>>>>>>
>>>>>>> [1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
>>>>>>>       https://git.kernel.org/arm64/c/12657bcd1835
>>>>>>
>>>>>> I'm going to drop this for now. The kernel compiled with a clang 19.1.5
>>>>>> version I have around (Debian sid) fails to boot, gets stuck early on:
>>>>>>
>>>>>> $ clang --version
>>>>>> Debian clang version 19.1.5 (1)
>>>>>> Target: aarch64-unknown-linux-gnu
>>>>>> Thread model: posix
>>>>>> InstalledDir: /usr/lib/llvm-19/bin
>>>>>>
>>>>>> I didn't have time to investigate, disassemble etc. I'll have a look
>>>>>> next week.
>>>>>
>>>>> Just for your information.
>>>>> When I see the debian package, clang 19.1.5-1 doesn't supply anymore:
>>>>>  - https://ftp.debian.org/debian/pool/main/l/llvm-toolchain-19/
>>>>>
>>>>> and the default version for sid is below:
>>>>>
>>>>> $ clang-19 --version
>>>>> Debian clang version 19.1.7 (3)
>>>>> Target: aarch64-unknown-linux-gnu
>>>>> Thread model: posix
>>>>> InstalledDir: /usr/lib/llvm-19/bin
>>>>>
>>>>> When I tested with above version with arm64-linux's for-next/fixes
>>>>> including this patch. it works well.
>>>>
>>>> It doesn't seem to be toolchain related. It fails with gcc as well from
>>>> Debian stable but you'd need some older CPU (even if emulated, e.g.
>>>> qemu). It fails with Cortex-A72 (guest on Raspberry Pi 4) but not
>>>> Neoverse-N2. Also changing the annotation from __ro_after_init to
>>>> __read_mostly also works.
>>
>> I think this is likely because __ro_after_init is also "ro before init" - i.e.
>> if you try to write to it in the PI code an exception is generated due to it
>> being mapped RO. Looks like early_map_kernel() is writiing to it.
>>
> 
> Indeed.
> 
>> I've noticed a similar problem in the past and it would be nice to fix it so
>> that PI code maps __ro_after_init RW.
>>
> 
> The issue is that the store occurs via the ID map, which only consists
> of one R-X and one RW- section. I'm not convinced that it's worth the
> hassle to relax this.
> 
> If moving the variable to .data works, then let's just do that.

Yeah, fair enough.



