Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3B0CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQVon7otOC8tUidq6mZ66TIYmxH1F3ZWevqgSsL0xBQ=; b=UGs9qvbaC3zU2qaEmSLDXed98S
	YCXBOwVEbzg1U0NEbOxTLaoDdzYLgOTezBhuJ9RFDCLmmDMjJfovDK1lLP60vBL63AP2ZNSE8BmlQ
	l7exzEoa8TwrqB/i/YbQy3sdY0PIM4AR1c2cSSzJW0yeCLXvi1ZkXKKAQ4eR+DLl3RZsoU1UVgwXA
	LH1V+euJyaldMOMM/BxRuUGmbjT5sYOivM4Lc4aUG5/xLVWBj4FtSBtHJy0WwMA1pEUAwK1m1pN0I
	GrURNjOTCA0ClxPevRM5QfyXKpSMWTCiVCcClUc4snvAOQz3IgicU5VO4RRyq1Y8FVYbIsIcy48cK
	v9JWKQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsbP-00000006xSX-1MMY;
	Fri, 29 May 2026 08:29:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsbL-00000006xS5-49N9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:29:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B8632E5;
	Fri, 29 May 2026 01:29:49 -0700 (PDT)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6892D3F632;
	Fri, 29 May 2026 01:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780043394; bh=LpGrRJmNWPcHaRlBV5w3lZl9XAW9wUfZkoWTWBy1nFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lsoxhOxibEyJ5lHCGdr76YlKUY9UPjWMsbTlSjV42xLs3UC50ylcZ0jNiRAuX0LGv
	 ROtFFBK8bd+Dt4HWaxYhwBs7wmthKtbXrEd5RFcjHrtddOa2uIt79pP/Ld+WjmS07W
	 9VlU1fIqvgS6mSD3ptke3Hza5XxLJoHl2kJtRHTA=
Message-ID: <22042b98-cfcc-428e-bb08-ebcfe785eb69@arm.com>
Date: Fri, 29 May 2026 10:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] arm64: mm: Unmap kernel data/bss entirely from
 the linear map
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-32-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260526175846.2694125-32-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_012956_164481_D5024075 
X-CRM114-Status: GOOD (  27.22  )
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

On 26/05/2026 19:59, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The linear aliases of the kernel text and rodata are mapped read-only in
> the linear map as well. Given that the contents of these regions are
> mostly identical to the version in the loadable image, mapping them
> read-only and leaving their contents visible is a reasonable hardening
> measure.
>
> Data and bss, however, are now also mapped read-only but the contents of
> these regions are more likely to contain data that we'd rather not leak.
> So let's unmap these entirely in the linear map when the kernel is
> running normally.
>
> When going into hibernation or waking up from it, these regions need to
> be mapped, so map the region initially, and toggle the valid bit so
> map/unmap the region as needed. (While the hibernation snapshot logic
> seems able to map inaccessible pages as needed, it currently disregards
> non-present pages entirely.)

I'm not sure I understand this, is there something wrong with the
kernel_page_present() check in safe_copy_page()?

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 39 +++++++++++++++++---
>  1 file changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index e7ca53d20b87..cb00e42abbe1 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -24,6 +24,7 @@
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
>  #include <linux/set_memory.h>
> +#include <linux/suspend.h>
>  #include <linux/kfence.h>
>  #include <linux/pkeys.h>
>  #include <linux/mm_inline.h>
> @@ -1056,6 +1057,29 @@ static void __init __map_memblock(phys_addr_t start, phys_addr_t end,
>  				 end - start, prot, early_pgtable_alloc, flags);
>  }
>  
> +static void remap_linear_data_alias(bool unmap)
> +{
> +	set_memory_valid((unsigned long)lm_alias(__init_end),
> +			 (unsigned long)(__bss_stop - __init_end) / PAGE_SIZE,
> +			 !unmap);
> +}
> +
> +static int arm64_hibernate_pm_notify(struct notifier_block *nb,
> +				     unsigned long mode, void *unused)
> +{
> +	switch (mode) {
> +	default:
> +		break;
> +	case PM_POST_HIBERNATION:
> +		remap_linear_data_alias(true);
> +		break;
> +	case PM_HIBERNATION_PREPARE:
> +		remap_linear_data_alias(false);
> +		break;
> +	}
> +	return 0;
> +}
> +
>  void __init mark_linear_text_alias_ro(void)
>  {
>  	/*
> @@ -1064,6 +1088,16 @@ void __init mark_linear_text_alias_ro(void)
>  	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
>  			    (unsigned long)__init_begin - (unsigned long)_text,
>  			    PAGE_KERNEL_RO);
> +
> +	remap_linear_data_alias(true);

As suggested on v4, something like mark_linear_data_alias_valid(false)
would be clearer.

Also, is there anything stopping us from doing that directly in map_mem()?

- Kevin

> +
> +	if (IS_ENABLED(CONFIG_HIBERNATION)) {
> +		static struct notifier_block nb = {
> +			.notifier_call = arm64_hibernate_pm_notify
> +		};
> +
> +		register_pm_notifier(&nb);
> +	}
>  }
>  
>  #ifdef CONFIG_KFENCE
> @@ -1189,11 +1223,6 @@ static void __init map_mem(void)
>  		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
>  			       flags);
>  	}
> -
> -	/* Map the kernel data/bss read-only in the linear map */
> -	__map_memblock(init_end, kernel_end, PAGE_KERNEL_RO, flags);
> -	flush_tlb_kernel_range((unsigned long)lm_alias(__init_end),
> -			       (unsigned long)lm_alias(__bss_stop));
>  }
>  
>  void mark_rodata_ro(void)

