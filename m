Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772ECFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeNtVCMTSI6Jd/skjzStvD5kEk+oINwTN2fN2mcs9C8=; b=Mnr4NJbzJIlpvAeyKz7zN4b7HU
	twJRjtLoid1Q2xhwXCU3J2KRVi7TWBO+HaO2M432xYmaZteMyOehRfMdlJt+McZepgXQh5jGNP9oW
	MNXOAcvPtx2HkpE2oWn2wQf8KkHdDSKLDse5VTWX0aCSoYGd3Lo6fHaS5ZM2QtLeICWEj14Abfom/
	1DVw76uR/eer5PZ1/XUlkEYyRv0BtBI7KZ2PguMpA4ULp5uwuTDusv+XzMGasswYfOZo4aTh/euas
	HO9VCxlOxcGCmotfBC+eY/EFWuKGcg+zeExk1/vZiftvHQGLZe3MeJtN+Q4X28J7Pxb+iqVnB8vGT
	Tt48pikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Mw-00000003hyq-2wJC;
	Wed, 29 Apr 2026 13:54:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Mu-00000003hyi-48G4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MeNtVCMTSI6Jd/skjzStvD5kEk+oINwTN2fN2mcs9C8=; b=rNRlbrMLX6SOD97ZYPLDKuVfG6
	jIsKR1JoTTxNgdE8lL29e34JZ4HiHuVLkV3rGVPsfAHgtj7cYBQzSzf+fq81zobYF8h46pm4xrkq9
	uhAYrqOA2K9p4FXIFQOFfh7Cayb5xHTYrA6143XFxfQCcxXXVG5ADZvu9uheg9fjnOWfAW5yjfCPl
	wXjtBy8N2OufSRwuNVekwKt5tu2g2tLHoP4n2xZ5hNBsRpZ5GGoOay63K0HCH17el1dBzJfR5jW8t
	Wf9geQsLgm7DBm52aX1c+i/d6AvaAEvDpRDlIsUMFytBLXDYxXngFR082kT0bXVdVLzUCbr2tgTa/
	eN5TTqjA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Mr-00000005Rea-2068
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:54:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52FA11C01;
	Wed, 29 Apr 2026 06:54:13 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2ECF3F62B;
	Wed, 29 Apr 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777470858; bh=op0PGB2RSdfIzNdbBTKjY7j2TmI/0VCoEC8J4z/6BVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lLNh2XYt3BMVorNa0t/pHJR9WnAZJGdKKJRuZrRL2Jw8zDzv5mKfd13eRZgUo18bE
	 tqtHwaRW1y1Rq98Fcuu7NWuGV5fJNqwm1VBkGihwLn/V3T5pbJSZ3ik7FdjZyT+94f
	 jNf+YT+GlUAHbAAaM5w0hBAoSnAbx/LjM9mIo84I=
Message-ID: <a8740f95-e167-48ae-ae65-97c6701d9c94@arm.com>
Date: Wed, 29 Apr 2026 15:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] arm64: mm: Map the kernel data/bss read-only in
 the linear map
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-29-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-29-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_145422_079898_16B029C4 
X-CRM114-Status: GOOD (  24.03  )
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

On 27/04/2026 17:34, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On systems where the bootloader adheres to the original arm64 boot
> protocol, the placement of the kernel in the physical address space is
> highly predictable, and this makes the placement of its linear alias in
> the kernel virtual address space equally predictable, given the lack of
> randomization of the linear map.
>
> The linear aliases of the kernel text and rodata regions are already
> mapped read-only, but the kernel data and bss are mapped read-write in
> this region. This is not needed, so map them read-only as well.
>
> Note that the statically allocated kernel page tables do need to be
> modifiable via the linear map, so leave these mapped read-write.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/sections.h |  1 +
>  arch/arm64/mm/mmu.c               | 16 ++++++++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
> index 51b0d594239e..32ec21af0823 100644
> --- a/arch/arm64/include/asm/sections.h
> +++ b/arch/arm64/include/asm/sections.h
> @@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
>  extern char __mmuoff_data_start[], __mmuoff_data_end[];
>  extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
>  extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
> +extern char __fixmap_pgdir_start[];
>  
>  static inline size_t entry_tramp_text_size(void)
>  {
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 1a4b4337d29a..9361b7efb848 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1122,7 +1122,9 @@ static void __init map_mem(void)
>  {
>  	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>  	phys_addr_t kernel_start = __pa_symbol(_text);
> -	phys_addr_t kernel_end = __pa_symbol(__init_begin);
> +	phys_addr_t init_begin = __pa_symbol(__init_begin);
> +	phys_addr_t init_end = __pa_symbol(__init_end);
> +	phys_addr_t kernel_end = __pa_symbol(__fixmap_pgdir_start);

Using fixmap_pgdir as an anchor seems a bit arbitrary... Couldn't we use
__bss_end instead?

It could also be helpful to add comments in vmlinux.lds.S clarifying
which sections are RO/RW in the linear map, it's getting pretty
difficult to follow.

>  	phys_addr_t start, end;
>  	int flags = NO_EXEC_MAPPINGS;
>  	u64 i;
> @@ -1155,7 +1157,11 @@ static void __init map_mem(void)
>  	 * of the region accessible to subsystems such as hibernate,
>  	 * but protects it from inadvertent modification or execution.
>  	 */
> -	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
> +	__map_memblock(kernel_start, init_begin, pgprot_tagged(PAGE_KERNEL),
> +		       flags);
> +
> +	/* Map the kernel data/bss so it can be remapped later */
> +	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),

Maybe I'm missing something obvious, but considering patch 3/4 couldn't
we directly map the range RO here?

- Kevin

>  		       flags);
>  
>  	/* map all the memory banks */
> @@ -1168,6 +1174,12 @@ static void __init map_mem(void)
>  		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
>  			       flags);
>  	}
> +
> +	/* Map the kernel data/bss read-only in the linear map */
> +	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL_RO),
> +		       flags);
> +	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
> +			       (unsigned long)lm_alias(__fixmap_pgdir_start));
>  }
>  
>  void mark_rodata_ro(void)

