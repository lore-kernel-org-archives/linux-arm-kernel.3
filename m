Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DCDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 03:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUmhYdrLMNlI003o+bbXTc9pBMMb9HsHlIpYt/r+8dw=; b=piDg5xRWIjE13+MArkB1HGn/7b
	DLp4pcF9MhIaHfIOJMBj2SD7zNcu9+RxZK+xMsatcGAtChid4xlRRKzSJwPVHS7yAZ2MYVoELMQ7y
	Rztd0gqdnaTsMo+2CgYhCqGC7NoOjYzaG5P9tdn2HeOs6MCH4K1DxSEs6BYfbcJmPXiCGLujxYoon
	IR5vnPQZJ4GDsJB5tRZ+dNnlHrDW0KItTrQssB6O/R1odiu9uWOnN3Kqt8rqT5VHcMyV+fQv1k1kL
	6CUj778+wlM4crfaKaW45UX5vATy6DQb2/0QRpG5wgMgWjeylx3iFnyLT0J2drfElbL5lB+o0RMcJ
	46ZuWdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tql10-0000000G79X-08B3;
	Sat, 08 Mar 2025 03:38:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqkzM-0000000G73Q-1SB8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 03:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C756DA45874;
	Sat,  8 Mar 2025 03:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824E2C4CED1;
	Sat,  8 Mar 2025 03:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741404994;
	bh=wLEqT0IC9gJ1SaLEGeSi2Lgq48p3Sz8pFixWAnU6Gj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2gEW4QeX38oiBqCP1qkGaua8cdgDgvAnVgZrCCL8gdBNvYqvK+u0Ru4MnaP0B3nU
	 nG4UJK+irKKH3fr8JqFNeIfavwXOXHEez7xR8gfQ2EywxIyKmiGDI9p69+auzLW308
	 94lClOOtc+06LFdXpuCtGEGl86LiIxTYNAXZ721T8t71QSU29lB1h/AS0TizRnpXdr
	 PvWAU4zREeLaQjzNf9VI2Ovfghe70nqWP570vRzDTHGwJhHJEJpJUsy5zOPmKB0e5i
	 zaTefESg7PDwrAk2G3CMdKBDPFAM6BP6njtX4mI9st8gARwjmqHIPxuxxNiT1m5KOt
	 hhKJZymnSu8LA==
Date: Fri, 7 Mar 2025 19:36:31 -0800
From: Kees Cook <kees@kernel.org>
To: Peter Collingbourne <pcc@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] string: Disable read_word_at_a_time() optimizations if
 kernel MTE is enabled
Message-ID: <202503071927.1A795821A@keescook>
References: <20250308023314.3981455-1-pcc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308023314.3981455-1-pcc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_193636_531756_F113C7C1 
X-CRM114-Status: GOOD (  24.65  )
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

On Fri, Mar 07, 2025 at 06:33:13PM -0800, Peter Collingbourne wrote:
> The optimized strscpy() and dentry_string_cmp() routines will read 8
> unaligned bytes at a time via the function read_word_at_a_time(), but
> this is incompatible with MTE which will fault on a partially invalid
> read. The attributes on read_word_at_a_time() that disable KASAN are
> invisible to the CPU so they have no effect on MTE. Let's fix the
> bug for now by disabling the optimizations if the kernel is built
> with HW tag-based KASAN and consider improvements for followup changes.

Why is faulting on a partially invalid read a problem? It's still
invalid, so ... it should fault, yes? What am I missing?

> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
> Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
> Cc: stable@vger.kernel.org
> ---
>  fs/dcache.c  | 2 +-
>  lib/string.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Why are DCACHE_WORD_ACCESS and HAVE_EFFICIENT_UNALIGNED_ACCESS separate
things? I can see at least one place where it's directly tied:

arch/arm/Kconfig:58:    select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS

Would it make sense to sort this out so that KASAN_HW_TAGS can be taken
into account at the Kconfig level instead?

> diff --git a/fs/dcache.c b/fs/dcache.c
> index e3634916ffb93..71f0830ac5e69 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -223,7 +223,7 @@ fs_initcall(init_fs_dcache_sysctls);
>   * Compare 2 name strings, return 0 if they match, otherwise non-zero.
>   * The strings are both count bytes long, and count is non-zero.
>   */
> -#ifdef CONFIG_DCACHE_WORD_ACCESS
> +#if defined(CONFIG_DCACHE_WORD_ACCESS) && !defined(CONFIG_KASAN_HW_TAGS)

Why not also the word_at_a_time use in fs/namei.c and lib/siphash.c?

For reference, here are the DCACHE_WORD_ACCESS places:

arch/arm/Kconfig:58:    select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/arm64/Kconfig:137: select DCACHE_WORD_ACCESS
arch/powerpc/Kconfig:192:       select DCACHE_WORD_ACCESS if PPC64 && CPU_LITTLE_ENDIAN
arch/riscv/Kconfig:934: select DCACHE_WORD_ACCESS if MMU
arch/s390/Kconfig:154:  select DCACHE_WORD_ACCESS if !KMSAN
arch/x86/Kconfig:160:   select DCACHE_WORD_ACCESS if !KMSAN
arch/x86/um/Kconfig:12: select DCACHE_WORD_ACCESS

>  
>  #include <asm/word-at-a-time.h>
>  /*
> diff --git a/lib/string.c b/lib/string.c
> index eb4486ed40d25..9a43a3824d0d7 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -119,7 +119,8 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
>  	if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
>  		return -E2BIG;
>  
> -#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +#if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && \
> +	!defined(CONFIG_KASAN_HW_TAGS)

There are lots more places checking CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS...
Why only here?

And the Kconfigs since I was comparing these against DCACHE_WORD_ACCESS

arch/arc/Kconfig:352:   select HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/arm/Kconfig:107:   select HAVE_EFFICIENT_UNALIGNED_ACCESS if (CPU_V6 || CPU_V6K || CPU_V7) && MMU
arch/arm64/Kconfig:222: select HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/loongarch/Kconfig:140:     select HAVE_EFFICIENT_UNALIGNED_ACCESS if !ARCH_STRICT_ALIGN
arch/m68k/Kconfig:33:   select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
arch/powerpc/Kconfig:246:       select HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/riscv/Kconfig:935: select HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/s390/Kconfig:197:  select HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/x86/Kconfig:238:   select HAVE_EFFICIENT_UNALIGNED_ACCESS
arch/x86/um/Kconfig:13: select HAVE_EFFICIENT_UNALIGNED_ACCESS

>  	/*
>  	 * If src is unaligned, don't cross a page boundary,
>  	 * since we don't know if the next page is mapped.
> -- 
> 2.49.0.rc0.332.g42c0ae87b1-goog
> 

-Kees

-- 
Kees Cook

