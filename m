Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C62ACDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9yMWEmsOOE6xZXsbGcAAajvHeQcjyzpY/qjjUWaBSM=; b=zn2zAX2476W8izD7FGRZwwTb7z
	AUZppj43QdWo6OC7M9ipYZ04CpvRmw7DwwO3IMcyn6FBjXBGvZcg0JPm6Tx/ZX1zWvmS/1ouyn/eb
	xldARc9+JtxrVCxLVpDYN9HKfGGBPzZnXqYKLtfKElz0/4GMAo/miB/LVXTb3+cN3xuISabYo/bNb
	BYH6coocTvGermTycsXLxQWSENxbw8DFejRqite8mF4CnU6VrZLR78o+V9IG6u4vJm03tbUy5RsSx
	IH6K7p5fGuq8OuVyatkNrJZGTU1O+2DvtBE7zYi2lJ3hco1b3HlInI1GUhiBK2YxTTXMDIiNji1+z
	x4uTgL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIJx-00000007LMY-42vD;
	Wed, 24 Jun 2026 07:46:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIJu-00000007LLs-1isD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:46:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 612D4263D;
	Wed, 24 Jun 2026 00:46:41 -0700 (PDT)
Received: from [10.57.80.25] (unknown [10.57.80.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D40803F632;
	Wed, 24 Jun 2026 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782287205; bh=sbdMZ7z3OdjetPqNLVMjiXhZ3+C66lUfyXUflKzbfqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cHP+JdgbxoHxo09iik7ypg7Z8zF6wUkdxsssBPzBpiXtUJFP0fwGxiYRD1I+QQYNQ
	 wmmzN40Z63gvg90cmGYzkCZ+stFAvxczeDN7EkVWydaZoKerSTLISBQShcnWp/j8+f
	 1CIwtUXlqlaGlMUvQup+A7eZtr4aRcoxEI1gJFgY=
Message-ID: <0708554c-54dd-4bd0-a147-b565733b5e4e@arm.com>
Date: Wed, 24 Jun 2026 09:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: mm: Defer read-only remap of data/bss linear
 alias
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>
References: <20260623202817.2225495-2-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260623202817.2225495-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_004651_102722_836BAC84 
X-CRM114-Status: GOOD (  22.91  )
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

On 23/06/2026 22:28, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Since commit
>
>   f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
>
> the linear alias of the .data and .bss regions is remapped read-only
> early during the boot. (Note that a subsequent patch to unmap this
> region entirely was reverted just before the v7.2 merge window, and will
> be brought back in an improved form for the v7.3 cycle)
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
> Fixes: f2ba877402e5 ("arm64: mm: Map the kernel data/bss read-only in the linear map")
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Thanks for expanding the commit message!

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
> v2: improve changelog, add Fuad's R-b
>
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
>  }
>  
>  static void __init declare_vma(struct vm_struct *vma,

