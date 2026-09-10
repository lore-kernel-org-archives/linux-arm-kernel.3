Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155BFC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARPEqhavuvd4sEo+R5C4AUtofUWM0B/7wgknn65mA9s=; b=vU11sErOKVCbcjNpeCKQ98c/Xr
	wf0iVRYnG/Ji5KylpW+670c8btjrisg+Nha0AH7AA27VMxaIFawWqtybSfNYjgeAyG10iHq+LSQVq
	iu4Mt/AB2QqGlirWpCtQMVvVCtQ4BlTZUhukRhneroR9bt+7Kn4pZCr276is5xEh2s9HiAz1KdmBm
	7Ojhon/K2nMnrTJ4H/zthVFH0LG0jA3MmKF0Sallf+52SPa25WjTB6ctQTc/hwztlRCaex2fV9+ZS
	kQ6AZGGENOGJNFjYg30wGUPD74w8uv2ANwlEbgx8Ky0SBu42Acjf77p4Zroxzsww/ibknjZVaNoHJ
	tzvUSkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4duu-0000000EL9f-1YSA;
	Thu, 10 Sep 2026 12:30:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4duq-0000000EL8g-47VJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:30:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4843e397f74so590556f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789043406; x=1789648206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARPEqhavuvd4sEo+R5C4AUtofUWM0B/7wgknn65mA9s=;
        b=I3JEvBKrWkbRCagaTO92R1l2Bx66TC5jkKUJvWPB/Gr3EgQvRGRKtABbNsHU8EH2g+
         FAqVR0W7ABxuefdy9krS52DSDgzQsC2YrGj8vI8qBRmx+KpkKoFeEHDbyt7O6e1BNhCN
         wgoPH3QyBUudB5AsTKrcY/aD6anqMfISOqLUNG2yd/sH8JA1PTOmyRiAsXYRzCujLkrQ
         qlceayGBxlq8P9suAPzWAKZkfFTO3TqUqplxtLk7rxoMVLpfdp1MpnZ/w99CNVYEA4Z5
         t6P9XG/KAiRHQc4fsfjnMPCQbM521lETkH/vThBshNiyvPi1YRkUEWYO+MCgUGGps+th
         GkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043406; x=1789648206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARPEqhavuvd4sEo+R5C4AUtofUWM0B/7wgknn65mA9s=;
        b=GQd4/a1O0Ur3m96i+hvEaxB5uwwlOlrIondsNd7RRp/wbucbTQZdSGHd7KInzs9lPh
         dH+tW6mchUf7SGNYSttNV7wEFWuVFQfACzOsFwtHGal5TrMAGiXXhEz37c01AEgU/jc0
         FfZPMp+Xd2/xae2z/J5F+qpnKGea3XlxfzD7mvTEdpR9M8U6cnOxHZKD4RVsgwkYu5/b
         Be2S5MEkYx4rmpZ+mak9vHV2OX7qCeBSJ7W3ZRWMI2UjNNGOKnoWKvINpDc/bjOppL6k
         65tqlcHCiYQwqD5AfGf3Hs0oK0prSNxV2Zdm37oY3VvtAVYwRoA9ntOmMCX1c/UxBeNM
         sqtg==
X-Forwarded-Encrypted: i=1; AKwUvBx31BxZPsXJFzAVi8kiM7aLeuIHXvvBvVct836NxA0o6lRsqctQkisRoA9yHPts3ZPd6l4nDvS6ax0XKRsV4eER@lists.infradead.org
X-Gm-Message-State: AFuF++lV9Yag7gosEZPsbvOxHcHnvHccuTOh7fXwcWfg/C9t2mo2Y5oA
	fhQKcQF01Wp/AUdZ9GelD2LnuNWFHpBSdZ0Oif08gxgCA8Hzvc8mQhshHfjEXqtQaX4=
X-Gm-Gg: AYBFou2hTawCSD4HLYjx/6eSNuNIDvVKdrdof1T8zWumg69Tzy1HD59qac4MpoNpLVF
	UH8wg2DnApqe9Bvf2UnoriymR510ejMmSW4tqxpVNOKPeYteqeQZlb313o0mbgcFjjpQ0uK63+y
	k8WjstrmVsl7NdLvaxSyYstXdc0x3ehj5z6TDNFTmwHwfPmchq+qyS+3gtpA/cZyx+yBhe/YBr2
	WQclnCaNYsARe3IE42T1eQx7TGLk7fhibm5K7c0MPmR2o3gsmKVIvSkm5kXqGuQKY/A4/+1sc+S
	vied0K5CPzE+yDhSRN4XX9KZm/rlhygHv/yeheLhkfi40t0ghBpFRqrhx6Lja24lwmz3eIY/AZI
	AaC+SPNv75HfMOPZAVJvRiUPOj89UpEaTZ8bydhrm89aMdQyd/uXe0S2oqBi/PYa7ehe7s1JBqB
	AcYeDuGkeU8QJFBGuwxyw7hJ/v+WcWaRffHPR5KkpLMziuA8d1o0pCTleFSKJSbbevGn+C1ldJ3
	EBfa2gxWSuh1lUTJ8GF44xR3KCZvVp0e7A=
X-Received: by 2002:a05:6000:29cb:b0:485:8df2:6460 with SMTP id ffacd0b85a97d-486e0f776c3mr3738554f8f.20.1789043406106;
        Thu, 10 Sep 2026 05:30:06 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm55987457f8f.25.2026.09.10.05.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:30:05 -0700 (PDT)
Message-ID: <65b2a754-c180-42a3-b6fd-f8714804c043@suse.com>
Date: Thu, 10 Sep 2026 14:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: reject out-of-range relocation target indices
To: Helge Deller <deller@gmx.de>, Karl Mehltretter <kmehltretter@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Ard Biesheuvel <ardb@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-modules@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260908230815.78409-1-kmehltretter@gmail.com>
 <a8f29668-be71-4679-a95d-55dfbd9b5c61@gmx.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <a8f29668-be71-4679-a95d-55dfbd9b5c61@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_053009_043873_ABC6A8B3 
X-CRM114-Status: GOOD (  23.56  )
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

On 9/10/26 12:59 PM, Helge Deller wrote:
> On 9/9/26 01:08, Karl Mehltretter wrote:
>> apply_relocations() skips relocation sections whose sh_info target index
>> is outside the section table. ARM, ARM64, LoongArch, PA-RISC and RISC-V
>> use sh_info earlier in module_frob_arch_sections(), before this check.
>>
>> ARM, ARM64, LoongArch and RISC-V use the unchecked index to read
>> sh_flags outside the section header table. PA-RISC uses it to index an
>> e_shnum-sized heap array for a read and an update. QEMU reproduced
>> page-fault Oopses on ARM, ARM64, LoongArch and RISC-V, and a Data TLB
>> miss on the PA-RISC array read.
>>
>> Validate sh_info for SHT_REL and SHT_RELA sections in
>> elf_validity_cache_sechdrs(). Reject the module with ENOEXEC before
>> architecture code can use the index.
>>
>> Fixes: c298be74492b ("parisc: fix module loading failure of large kernel modules")
>> Fixes: 7d485f647c1f ("ARM: 8220/1: allow modules outside of bl range")
>> Fixes: fd045f6cd98e ("arm64: add support for module PLTs")
>> Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
>> Fixes: fcdfe9d22bed ("LoongArch: Add ELF and module support")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>> ---
>>
>> A custom harness for upstream Frama-C 33.0 (Arsenic) Eva found the
>> ARM32 instance in a source-identical ARM module_frob_arch_sections()
>> slice. Eva reported the out-of-range section-table pointer and sh_flags
>> access.
>>
>> The analysis and ARM32 A/B test ran at Linux b9b3e33b70b7 ("Merge tag
>> 'trace-v7.2-rc6' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"). The
>> PA-RISC, ARM64, RISC-V, LoongArch and x86_64 A/B tests ran at the
>> declared base commit, 28924df2a08f. arch/arm/kernel/module-plts.c and
>> the touched loop in kernel/module/main.c are identical between the two
>> commits.
>>
>> Each A/B test changed only a relocation section's sh_info to
>> 0x10000000. The same configurations and modules were used before and
>> after the change. All controls loaded before and after the change. The
>> fixed kernels rejected the malformed modules with ENOEXEC.
>>
>> Original-kernel results with QEMU 10.2.1 TCG:
>>
>> - ARM32, virt/Cortex-A15, GCC 15.2.0, multi_v7_defconfig plus
>>    VMSPLIT_2G: page fault at module_frob_arch_sections()+0x160.
>> - ARM64, virt/Cortex-A57, GCC 15.2.0, defconfig: page fault at
>>    module_frob_arch_sections()+0x110.
>> - PA-RISC, B160L, hppa-linux-gcc 8.1.0, binutils 2.30,
>>    generic-32bit_defconfig: Data TLB miss at
>>    module_frob_arch_sections()+0x11c on the stub_entries read for a
>>    counted R_PARISC_PCREL17F relocation.
>> - RISC-V, virt, GCC 15.2.0, defconfig plus RELOCATABLE with
>>    MODULE_SECTIONS enabled: page fault at
>>    module_frob_arch_sections()+0xe4.
>> - LoongArch, virt/LA464, LLVM 21.1.8, loongson64_defconfig: page fault
>>    at module_frob_arch_sections()+0x1b8.
>>
>> On x86_64, which has no vulnerable early sh_info access, the original
>> kernel loaded both modules. The fixed kernel loaded the control and
>> rejected the malformed module with ENOEXEC. The test used pc/qemu64,
>> x86_64_defconfig and GCC 15.2.0.
> 
> Interesting.
> So, this patch helps to prevent loading modules with buggy entries,
> even if the module was e.g. loaded on x86-64 before.
> 
> For me the patch is OK, but it only adds one random sanitizing check,
> and where would we stop to check?

Loading a module should normally at least get through the signature and
blacklist checks without crashing due to a corrupted module ELF file.
After that point, I believe the ELF data should be trusted, similar to
how the actual module code is expected to be correct.

module_frob_arch_sections() is called later in the module-loading
process, after the signature and blacklist checks, so I think this patch
is not strictly necessary.

-- 
Thanks,
Petr

