Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B9CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Elw36BouPUMp0mEeSrBwT8wHQMoNjB+NX8AH+lO18hw=; b=GR1pI+lxrgm4zEMYaS/Zh6vTFA
	QJcL1tJIWbaRTIrwjrP9JuG4iviIJiHMV2ip7x99mVYR1YXrTEkU7AkQe7QT+TxhToLEnBypNVJmu
	lXUth1MO4wRFY5UL69VOyfSPgvC70YPJDb2rqKavgLW99hZwqR2EkTF11VdBi6X9m8VsVSMRDKVIw
	++GCVUPb8H4OjCCnQv6W7xLZ0vik/OcDgpKhRZ1NDH3bnRrOjB3yt+DEcvGOZHPy9huN+z/XAXfSw
	6LGOEysG7JX3WtZNAmVRLh9j+bPL43T+Je1r0tuJ/ZXCuU0+7yD3FUpZl/GEHXRREyW/QP3Hw/8e5
	xIN1G1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyQV-00000007XsY-2WIJ;
	Fri, 29 May 2026 14:43:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyQS-00000007XrM-2SHL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:43:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A05B202C;
	Fri, 29 May 2026 07:42:58 -0700 (PDT)
Received: from [10.43.20.82] (e126510-lin.lund.arm.com [10.43.20.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5DC23F905;
	Fri, 29 May 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780065783; bh=Jl9VQKojRAgBG12zDuJGeC336Uk4pqmCiAHAf+KoXfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N9E9N33X8n15HQwC5psjF+tcjK3WjyYarbBnqu3nIcNYoMawZ7mbV1yjWd13q7IJv
	 QTsroWS/j20zBbVb7rfEQI+Aiu3SBMqEK641u2iZkJkWxvlTEL5KjcIxaj6t8ojsHY
	 iT1KU9ZTFJfOcdoib6fau3D3/hY79iVtzbs6xxPI=
Message-ID: <b76b327f-612e-494f-b8d3-44108aa73d2a@arm.com>
Date: Fri, 29 May 2026 16:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] arm64: Move fixmap and kasan page tables to end
 of kernel image
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-26-ardb+git@google.com>
 <2a6f9f05-ac57-4ef8-9328-74cc8ccfea16@arm.com>
 <96a8b6b9-71f2-4550-bbbb-fbfa146f4e6a@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <96a8b6b9-71f2-4550-bbbb-fbfa146f4e6a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074304_713982_5534E1CD 
X-CRM114-Status: GOOD (  16.62  )
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

On 29/05/2026 13:19, Ard Biesheuvel wrote:
> On Fri, 29 May 2026, at 10:27, Kevin Brodsky wrote:
>> On 26/05/2026 19:58, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> Move the fixmap and kasan page tables out of the BSS section, and place
>>> them at the end of the image, right before the init_pg_dir section where
>>> some of the other statically allocated page tables live.
>>>
>>> These page tables are currently the only data objects in vmlinux that
>>> are meant to be accessed via the kernel image's linear alias, and so
>>> placing them together allows the remainder of the data/bss section to be
>>> remapped read-only or unmapped entirely.
>>>
>>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>  arch/arm64/include/asm/mmu.h    | 2 ++
>>>  arch/arm64/kernel/vmlinux.lds.S | 8 +++++++-
>>>  arch/arm64/mm/fixmap.c          | 6 +++---
>>>  arch/arm64/mm/kasan_init.c      | 2 +-
>>>  4 files changed, 13 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>>> index 5e1211c540ab..fb95754f2876 100644
>>> --- a/arch/arm64/include/asm/mmu.h
>>> +++ b/arch/arm64/include/asm/mmu.h
>>> @@ -13,6 +13,8 @@
>>>  
>>>  #ifndef __ASSEMBLER__
>>>  
>>> +#define __pgtbl_bss __section(".pgdir.bss") __aligned(PAGE_SIZE)
>>> +
>>>  #include <linux/refcount.h>
>>>  #include <asm/cpufeature.h>
>>>  
>>> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
>>> index e1ac876200a3..2b0ebfb30c63 100644
>>> --- a/arch/arm64/kernel/vmlinux.lds.S
>>> +++ b/arch/arm64/kernel/vmlinux.lds.S
>>> @@ -349,9 +349,15 @@ SECTIONS
>>>  	_edata = .;
>>>  
>>>  	/* start of zero-init region */
>>> -	BSS_SECTION(SBSS_ALIGN, 0, 0)
>>> +	BSS_SECTION(SBSS_ALIGN, 0, PAGE_SIZE)
>>>  	__pi___bss_start = __bss_start;
>>>  
>>> +	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
>>> +	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
>> Do we actually need the NOLOAD type here?
> Yes, otherwise it is emitted as PROGBITS, resulting in all of BSS to be
> emitted into Image.

That's rather strange, aren't the .pgdir.bss input sections already
NOBITS since __pgtbl_bss is only used on default-initialised globals?
Also AFAIU NOLOAD does not prevent the output section from being emitted
into the ELF file.

- Kevin

