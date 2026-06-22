Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1519CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRapthCt0yOgwFbx+/99xHU1xe3RavpTCg9WymtIaGw=; b=QQF7qGpB2jDH9s/YsvqX6PaIwM
	oVFPp7f45Q2cz1UylOMQ60mtnurAD3w3vlGWZfrMukfU76KLiL7JrogxpFWaqwrhED6IM5CQ4zzjH
	jC48s6P6e4Eh0cdy4dl8zDKLLOIgifwNfarGyFcMDFGhoeHGLrtc32qmMox5+sSIcSYrD9DNxnGB7
	QieI0O5/rnUiJwGlr0cLpyFJfELF0gzPbVz47j3ZGJmxtRoiMXpwYxLU++ZA93nTdZqzmIE6IVSms
	oAZCEJrllnYIIC5Pn+DveT43+oEfQc1PknL1454Sw+y+2+LBGfXVMBN0sz4Jlo8Vqif5EinvDn/zH
	40yOh6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgV2-000000057wd-0eAS;
	Mon, 22 Jun 2026 15:23:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbgUz-000000057wD-1qlD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 15:23:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 423921BCB;
	Mon, 22 Jun 2026 08:23:37 -0700 (PDT)
Received: from [10.57.95.184] (unknown [10.57.95.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95833F62B;
	Mon, 22 Jun 2026 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782141821; bh=yCffkQovzvs4v9GagD78FMN0QtZEotX8qJKYNIKpzL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OekL3WjSP4roVpk0NM4g4AfyI1Mp3kAZfJ4DR5wnNKyB1etrO85W4ZiPertDj+/B2
	 Dc5Hl3twFRSBVPWwDYxvUz4Td/I0WT6eekJj7FJvdbw7z/Kc/BHAGOJuAD3JKsms9/
	 KTclsJ1wUwoMh3qhKg9MY83YsxLPH1cdiO0mr4nI=
Message-ID: <2deff570-0497-4438-94ba-a9691881a016@arm.com>
Date: Mon, 22 Jun 2026 17:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Defer read-only remap of data/bss linear alias
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
References: <20260619163940.3185308-2-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260619163940.3185308-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_082345_785389_E751F487 
X-CRM114-Status: GOOD (  25.25  )
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

On 19/06/2026 18:39, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Fuad reports that in some cases, the KVM init code may apply relocations
> to variables that reside in .data, and does so via the linear map. This
> means that remapping .data read-only beforehand is a bad idea, and
> results in an early boot crash.
>
> These variables in .data are only present when CONFIG_NVHE_EL2_DEBUG or
> CONFIG_NVHE_EL2_TRACING are enabled, which is why it was not spotted in
> testing.
>
> So move the remap to mark_rodata_ro(), which is a reasonable place to
> put this, and ensures that it happens much later during the boot. It
> also means that rodata=off is now taken into account, and so the linear
> alias will remain writable in that case.
>
> Cc: Fuad Tabba <fuad.tabba@linux.dev>
> Fixes: f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 9f354971b7e4..1f7eca86b5c1 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1198,11 +1198,6 @@ static void __init map_mem(void)
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
> @@ -1221,6 +1216,12 @@ void mark_rodata_ro(void)
>  	update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
>  			    (unsigned long)_stext - (unsigned long)_text,
>  			    PAGE_KERNEL_RO);
> +
> +	/* Map the kernel data/bss read-only in the linear map */
> +	update_mapping_prot(__pa_symbol(__init_end),
> +			    (unsigned long)lm_alias(__init_end),
> +			    (unsigned long)__bss_stop - (unsigned long)__init_end,
> +			    PAGE_KERNEL_RO);

I was rather confused by this patch until I saw in master:

f102131c842d Revert "arm64: mm: Unmap kernel data/bss entirely from the
linear map"
81479b6888f8 Revert "arm64: mm: Defer remap of linear alias of data/bss"

... which explains the diff, but it looks like there are multiple issues
here. Is my understanding correct that these reverts fix kvm_arm_init()
because it needs to *read* from the linear map, while this new patch
fixes some KVM configurations that need to *write* to the linear map?

If so it might be good to give a recap in the commit message, because
the reverts are easy to miss.

It would also be good to explain why we can't do this in
mark_linear_text_alias_ro() (presumably because this is too early). I do
agree that honouring rodata=off is a good thing, though.

BTW, if only kvm_arm_init() needs to read the data/bss via the linear
map, maybe we can still unmap it later?

- Kevin

