Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCA4D6CFDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGBL4rMif4WYCnUiy/i116miZREHejgcacR9NkWFE9w=; b=g7dI7Kk5bT3pQzkfSadhLL3N28
	r3C3bb7S2xH3nBc2E/KdNi777QCtC7uJG9p3i2LJf66MsX2qn1tCPWOJGK3AfmfjLARJtSCRnJKwA
	2tsSSUgzZlIao6sYYJZ71Zxe6KyqXicFR08VCcvkhfRzhYD4HlotF2f5Ae2B3R+N0pciq31VoAIUB
	wCJ7wY0XuW/FSL8Ogpd0dCpfFeNi1ql60KOqJ1sDB0d/6Ihwb4aVK2tDqL1BkdT0oncGHPdt0B9P6
	HVKquTRSJIVuSvI5LMIbdx8uBaCSdelDzvScOorF6eCIgA6KOsnhoEIMwBQ7guvUOMOe3ltYwTIp2
	hsp6QdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAtL-00000008JKm-409k;
	Fri, 23 Jan 2026 06:43:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAtG-00000008JIJ-2tTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:43:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E56961476;
	Thu, 22 Jan 2026 22:43:22 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334A83F740;
	Thu, 22 Jan 2026 22:43:25 -0800 (PST)
Message-ID: <ddb667ef-efd1-40f5-832d-9017f6bbbec5@arm.com>
Date: Fri, 23 Jan 2026 12:13:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: Move the zero page to rodata
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260119164747.1402434-6-ardb+git@google.com>
 <20260119164747.1402434-9-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260119164747.1402434-9-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_224330_781604_ED4D48AE 
X-CRM114-Status: GOOD (  14.99  )
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



On 19/01/26 10:17 PM, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The zero page should contain only zero bytes, and so mapping it
> read-write is unnecessary. Move it to __ro_after_init instead.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 2a18637ecc15..d978b07ab7b8 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -68,7 +68,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
>   * Empty_zero_page is a special page that is used for zero-initialized data
>   * and COW.
>   */
> -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
> +unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
> +					__ro_after_init __aligned(PAGE_SIZE);
>  EXPORT_SYMBOL(empty_zero_page);
>  
>  static DEFINE_SPINLOCK(swapper_pgdir_lock);

A small nit - could this be the first patch in the series here ? Becasue it is
not related to other three patches.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

