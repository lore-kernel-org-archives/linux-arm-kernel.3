Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BE8FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqk/vbnimW0wuDYnJIfvubH6gxgbLhYzeZKE1huaELw=; b=oWSW3TFlvLspZamOS/P8/45PP/
	Zx0yep2z1WIWs7pSGR2lEqDAcmq5MxfBygQ+84rssEhWdTCOfvGhbV6iasVdT5C/CJoRDFox/Ylh2
	1MOvu5sSiTWtQYkS/iDTMUodVnqh9XauzOIjDp5lABCekD9LLFUQG2PM7O2kJm8Wk/BglVYG7YKwJ
	ZOo3Qrieo+CgF4kOU0v4sZA2Nz855Faxtobtup3eWXWB16ddP0eXyHxwI9Ypk6Qfn+dQBcIEChuF3
	fMZQXnlJ4zjacf+spYOACVurIGrvL3jjnYW4ynGZwxReeiT2R0EoDGwEMRAvE73SRbL/KPVp+jgp8
	SmMymxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5KO-00000003hee-2doe;
	Wed, 29 Apr 2026 13:51:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5KM-00000003he8-3qD6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:51:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45D0E2574;
	Wed, 29 Apr 2026 06:51:39 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88EC53F62B;
	Wed, 29 Apr 2026 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777470704; bh=9ELD/DjcFqzDnlav/KpHjVLh1+VYuwo61V/4bESQjnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gX6jMWWvzRfAvmOAyHfw3oN8bG5OkDuYdKN3FuWWM6nhaa2QUnNyeU/dyUa3NlDBi
	 VXs6MpNaq7hopQBIK1wh64NZPzPhrdUFDqsIC1BKYJuqTwtkmHUbCfAApjLUnpBUHb
	 gwlcI8mEEm00HYzB+UqwukBUQ6gsicOZH89qCdnE=
Message-ID: <8a315ca2-3754-4a66-990e-55b85191aa6e@arm.com>
Date: Wed, 29 Apr 2026 12:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] arm64: mm: Don't abuse memblock NOMAP to check
 for overlaps
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
 <20260427153416.2103979-28-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-28-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065147_099057_30E411FF 
X-CRM114-Status: GOOD (  22.08  )
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
> Now that the DRAM mapping routines respect existing table mappings and
> contiguous block and page mappings, it is no longer needed to fiddle
> with the memblock tables to set and clear the NOMAP attribute in order
> to omit text and rodata when creating the linear map.
>
> Instead, map the kernel text and rodata alias first with the desired
> attributes, so that they will not be remapped later with different
> attributes when mapping the memblocks.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 24 +++++++-------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 5e2348b15783..1a4b4337d29a 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1148,12 +1148,15 @@ static void __init map_mem(void)
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
>  	/*
> -	 * Take care not to create a writable alias for the
> -	 * read-only text and rodata sections of the kernel image.
> -	 * So temporarily mark them as NOMAP to skip mappings in
> -	 * the following for-loop
> +	 * Map the linear alias of the [_text, __init_begin) interval
> +	 * as non-executable now, and remove the write permission in
> +	 * mark_linear_text_alias_ro() above (which will be called after
> +	 * alternative patching has completed). This makes the contents
> +	 * of the region accessible to subsystems such as hibernate,
> +	 * but protects it from inadvertent modification or execution.
>  	 */
> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> +	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),

Is it now necessary for that mapping to be tagged? If so, it should
probably be called out in the commit message.

- Kevin

> +		       flags);
>  
>  	/* map all the memory banks */
>  	for_each_mem_range(i, &start, &end) {
> @@ -1165,17 +1168,6 @@ static void __init map_mem(void)
>  		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
>  			       flags);
>  	}
> -
> -	/*
> -	 * Map the linear alias of the [_text, __init_begin) interval
> -	 * as non-executable now, and remove the write permission in
> -	 * mark_linear_text_alias_ro() below (which will be called after
> -	 * alternative patching has completed). This makes the contents
> -	 * of the region accessible to subsystems such as hibernate,
> -	 * but protects it from inadvertent modification or execution.
> -	 */
> -	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, 0);
> -	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>  }
>  
>  void mark_rodata_ro(void)

