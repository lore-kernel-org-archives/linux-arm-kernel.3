Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174F1D13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSalp5Ns9IGYY0PPinSW1eOGr2K3MH9y5m62iLN950A=; b=UrBjcHNGKReNAJmJ0MOA8q6fMX
	9BApPpjs/byjWM6B4NrNeFyxrP+5ZMcYZkKTgrGkawjVljMUBzve7f0UPT4RKiuSFrdbfwGW7L9wl
	vByqaeMD0VCBNSi7YVdc+Ztr4Q7Hb8twez0YJEDw2twPzS4bFHz5+5OwqPRNcBhUDT3GMLBId2oMb
	vum1U+/ubdzYUA/AlLQc8i53ekEaITbAHbpUJgPll8q9dOtDTjDoHTjCZVEmOCJ8Jap+c/ef1wf1L
	KRuI5LXaLcjpx9XFxdDOBn/cWDID5jIe8NBx1x2gjxqpb3wVjTmDFWDxO2o6KBGTwpvZtgun4Pk21
	YtKcve1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfSo-0000000DwrL-2d25;
	Tue, 27 Jan 2026 09:34:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfSl-0000000Dwqm-10eI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:34:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F684339;
	Tue, 27 Jan 2026 01:34:10 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 293ED3F632;
	Tue, 27 Jan 2026 01:34:15 -0800 (PST)
Message-ID: <3d59a8d9-a382-48d8-b79c-f5c23e86c1b7@arm.com>
Date: Tue, 27 Jan 2026 09:34:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] arm64: Move the zero page to rodata
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-13-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-13-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013419_319950_92C6EC79 
X-CRM114-Status: GOOD (  17.10  )
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

On 26/01/2026 09:26, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The zero page should contain only zero bytes, and so mapping it
> read-write is unnecessary. Combine it with reserved_pg_dir, which lives
> in the read-only region of the kernel, and already serves a similar
> purpose.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/vmlinux.lds.S | 1 +
>  arch/arm64/mm/mmu.c             | 3 +--
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index ad6133b89e7a..b2a093f5b3fc 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -229,6 +229,7 @@ SECTIONS
>  #endif
>  
>  	reserved_pg_dir = .;
> +	empty_zero_page = .;
>  	. += PAGE_SIZE;
>  
>  	swapper_pg_dir = .;

Isn't there a magic macro for getting from swapper to reserved? That will need
updating?

/*
 *  Open-coded (swapper_pg_dir - reserved_pg_dir) as this cannot be calculated
 *  until link time.
 */
#define RESERVED_SWAPPER_OFFSET	(PAGE_SIZE)


> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9ae7ce00a7ef..c36422a3fae2 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
>  
>  /*
>   * Empty_zero_page is a special page that is used for zero-initialized data
> - * and COW.
> + * and COW. Defined in the linker script.
>   */
> -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
>  EXPORT_SYMBOL(empty_zero_page);

What's the benefit of giving it it's own place in the linker script vs just
declaring it as const and having it placed in the rodata?

Thanks,
Ryan

>  
>  static DEFINE_SPINLOCK(swapper_pgdir_lock);


