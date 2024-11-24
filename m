Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54100E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfT299v8qVuSuNE94P+i1JoRpr4Y8Dzk4nsdXJ6FEuM=; b=d3AEcark4EJGm5w+ornYk+FSB/
	6ytlpOjZmCjfL9ubIqf2S0xpsLSg8pnJybK1QzMB761eu+sj+L/aoxbfMe0y4EiM5JMJDZxO0gvrF
	AAgtIEBqlviMuN8nLNlgS//yz7IFg0PJ28Ykfg1SZOTBMK/aWdHDfsvkWFui+3A0DbziIArLK5dZP
	UL38GCtc6iFxw7TZ217yU+1SYWC1zKZ4KWfsJKEZ9cfd/DD3L6f1bcoa9Vr36hJUYBDvJ5SQcxbxK
	GzisHR5NeqHJaUszuvSfTZz38bdzilVRH5J/wt7Jf+J8qbOjQ4AdfhLIKuNZha6kgA3mxVC1vO0aN
	EAipKAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFeb-00000006MAm-3tw1;
	Sun, 24 Nov 2024 16:40:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFdd-00000006M57-496A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 16:39:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69333A40EED
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 16:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DDEC4CED1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732466347;
	bh=jByVBdlafYu4w8mrN5BxnUp1xRnOAjKq51MrjnXW4pY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bEnA9LUjdyJ7mLN+GIrULDaE8FPzYVYlcE8Z7eONq82GDx66xlChj/V30+FU5iNTe
	 isQFv2SMhAKoHBVkLRsMEcqbRbOkYWtCCjh4dGU2StiGa1Hb7RB8VAGQPtRMlV5iwE
	 9v40leU9JvmQFCxncN7EqQ1Popg095jW3bkHdGRE1SAGR1fvn+nCx7I8J74MiluamW
	 xJyfpwV/+qTI0cazcsituIDXg1WppULK3CDegFRv8YEm1pDIiTK+6Pz6IkMWkVSiv8
	 lc3eMQkWwWboLuZjWXppW89mX6JgJIiZZoSvAbb9aBRsdN20MC0ShFoaPdAVpuY/5N
	 YSo8ifWZCSNHQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4423976e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 08:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV84uznE822QWNWcRqNW6tXZZ7YLZVPjn5iiBhop4PezIqkeFFkgzoNntPjKhuFtuhzI1nDCiZYvKooh31w9/wM@lists.infradead.org
X-Gm-Message-State: AOJu0YyZEAcZnYXFqv+4ZvCRKNabj1z3z4vWRj74sOKHX3eiM1rCTRLO
	+wt9ekfYvmEnpzq9WOhG7GXvC5Wb5rLHGJjREuuJch6v2WIvAaYXsK0Upxij/QDj5Ryg3RetxbQ
	TexiWl3ZKc0opKKwRh2W3AmiJLRU=
X-Google-Smtp-Source: AGHT+IGadZZ6ClGvE0SMotIjvPDoOKeR8vaTuEqsfngsYooVDYV/m2h8Vmf2LQysynH3zmzZ9Kwo9Gj99CJMze57yro=
X-Received: by 2002:a05:6512:3ba6:b0:53d:9ff8:ea08 with SMTP id
 2adb3069b0e04-53dd369fb33mr4687009e87.16.1732466346196; Sun, 24 Nov 2024
 08:39:06 -0800 (PST)
MIME-Version: 1.0
References: <90667b2b7f773308318261f96ebefd1a67133c4c.1732464395.git.lukas@wunner.de>
In-Reply-To: <90667b2b7f773308318261f96ebefd1a67133c4c.1732464395.git.lukas@wunner.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 24 Nov 2024 17:38:55 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFvJGHr_iv6bFQfb89XqPFrNWH7-rV7SFy4QBSWXYC4RA@mail.gmail.com>
Message-ID: <CAMj1kXFvJGHr_iv6bFQfb89XqPFrNWH7-rV7SFy4QBSWXYC4RA@mail.gmail.com>
Subject: Re: [PATCH for-next/fixes] arm64/mm: Fix false-positive
 !virt_addr_valid() for kernel image
To: Lukas Wunner <lukas@wunner.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Zorro Lang <zlang@redhat.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Joey Gouly <joey.gouly@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_083910_165785_1A5D3264 
X-CRM114-Status: GOOD (  34.46  )
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

On Sun, 24 Nov 2024 at 17:16, Lukas Wunner <lukas@wunner.de> wrote:
>
> Zorro reports a false-positive BUG_ON() when running crypto selftests on
> boot:  Since commit 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to
> sig_alg backend"), test_sig_one() invokes an RSA verify operation with a
> test vector in the kernel's .rodata section.  The test vector is passed
> to sg_set_buf(), which performs a virt_addr_valid() check.
>
> On arm64, virt_addr_valid() returns false for kernel image addresses
> such as this one, even though they're valid virtual addresses.
> x86 returns true for kernel image addresses, so the BUG_ON() does not
> occur there.  In fact, x86 has been doing so for 16 years, i.e. since
> commit af5c2bd16ac2 ("x86: fix virt_addr_valid() with
> CONFIG_DEBUG_VIRTUAL=y, v2").
>
> Do the same on arm64 to avoid the false-positive BUG_ON() and to achieve
> consistent virt_addr_valid() behavior across arches.
>
> Silence a WARN splat in __virt_to_phys() which occurs once the BUG_ON()
> is avoided.
>
> The is_kernel_address() helper introduced herein cannot be put directly
> in the virt_addr_valid() macro:  It has to be part of the kernel proper
> so that it has visibility of the _text and _end symbols (referenced
> through KERNEL_START and KERNEL_END).  These symbols are not exported,
> so modules expanding the virt_addr_valid() macro could not access them.
> For almost all invocations of virt_addr_valid(), __is_lm_address()
> returns true, so jumping to the is_kernel_address() helper hardly ever
> occurs and its performance impact is thus negligible.
>
> Likewise, calling is_kernel_address() from the functions in physaddr.c
> ought to be fine as they depend on CONFIG_DEBUG_VIRTUAL=y, which is
> explicitly described as "costly" in the Kconfig help text.  (And this
> doesn't add much cost really.)
>
> Abridged stack trace:
>
>   kernel BUG at include/linux/scatterlist.h:187!
>   sg_init_one()
>   rsassa_pkcs1_verify()
>   test_sig_one()
>   alg_test_sig()
>   alg_test()
>   cryptomgr_test()
>
> Fixes: 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to sig_alg backend")
> Reported-by: Zorro Lang <zlang@redhat.com>
> Closes: https://lore.kernel.org/r/20241122045106.tzhvm2wrqvttub6k@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Just from looking at the code it seems arm's virt_addr_valid() returns
> true for kernel image addresses, so apparently arm64 is the odd man out.
>

That is because ARM maps the kernel in the linear map, whereas arm64
maps the kernel in the vmalloc space.

vmalloc addresses cannot be used for DMA, which is why
virt_addr_valid() rejects them. On arm64, the same applies to the
kernel image, as well as the vmap'ed stack.

> Note that this fix would have obviated the need for commit c02e7c5c6da8
> ("arm64/mm: use lm_alias() with addresses passed to memblock_free()").
>

Your 'fix' will break other stuff: it is used, e.g., to decide whether
__pa() may be used on the input VA, which applies a fixed translation
on the input, rather than walk the page tables to obtain the physical
address.


>  arch/arm64/include/asm/memory.h | 6 +++++-
>  arch/arm64/mm/init.c            | 7 +++++++
>  arch/arm64/mm/physaddr.c        | 6 +++---
>  3 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index b9b9929..bb83315 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -416,9 +416,13 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>  })
>  #endif /* CONFIG_DEBUG_VIRTUAL */
>
> +bool is_kernel_address(unsigned long x);
> +
>  #define virt_addr_valid(addr)  ({                                      \
>         __typeof__(addr) __addr = __tag_reset(addr);                    \
> -       __is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));      \
> +       (__is_lm_address(__addr) ||                                     \
> +        is_kernel_address((unsigned long)__addr)) &&                   \
> +       pfn_is_map_memory(virt_to_pfn(__addr));                         \
>  })
>
>  void dump_mem_limit(void);
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index d21f67d..2e8a00f 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -156,6 +156,13 @@ static void __init zone_sizes_init(void)
>         free_area_init(max_zone_pfns);
>  }
>
> +bool is_kernel_address(unsigned long x)
> +{
> +       return x >= (unsigned long) KERNEL_START &&
> +              x <= (unsigned long) KERNEL_END;
> +}
> +EXPORT_SYMBOL(is_kernel_address);
> +
>  int pfn_is_map_memory(unsigned long pfn)
>  {
>         phys_addr_t addr = PFN_PHYS(pfn);
> diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
> index cde44c1..2d6755b 100644
> --- a/arch/arm64/mm/physaddr.c
> +++ b/arch/arm64/mm/physaddr.c
> @@ -9,7 +9,8 @@
>
>  phys_addr_t __virt_to_phys(unsigned long x)
>  {
> -       WARN(!__is_lm_address(__tag_reset(x)),
> +       WARN(!__is_lm_address(__tag_reset(x)) &&
> +            !is_kernel_address(__tag_reset(x)),
>              "virt_to_phys used for non-linear address: %pK (%pS)\n",
>               (void *)x,
>               (void *)x);
> @@ -24,8 +25,7 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
>          * This is bounds checking against the kernel image only.
>          * __pa_symbol should only be used on kernel symbol addresses.
>          */
> -       VIRTUAL_BUG_ON(x < (unsigned long) KERNEL_START ||
> -                      x > (unsigned long) KERNEL_END);
> +       VIRTUAL_BUG_ON(!is_kernel_address(x));
>         return __pa_symbol_nodebug(x);
>  }
>  EXPORT_SYMBOL(__phys_addr_symbol);
> --
> 2.43.0
>
>

