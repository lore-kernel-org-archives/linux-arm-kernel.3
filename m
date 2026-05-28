Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7441CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95SOoqGn6jyE0UfkDK15/NBpH9CmgAfhjJteJqSZdCE=; b=dbdVh6fOUG5kDTJ/RFNql6Qi0z
	7SUgsYZGMPVGK2gqKte0tmIWsP9oInG45KeZ9tivXKzn4+3vZvK5erBS1kbkurq+i+tAbHTiCuZcq
	YQvovJ5Q+urEF8SxG+202yhmRS8ffrjaaxkv4zdxpfFJDXqbAf2mWGIYEywNndU8CGXQiVG4qfR1V
	cGDXoJXFFsBg5dnkEp2lZT63mjaZ6ifLFdFZBmbbxMH1k3dWACAXz/IiHejVjlzMkFEHdYtdwPZ41
	Aup7t3y7tBNJerhdgdcoi9EspstPXBzqtv2lOluWlkRiew/d00/uGcRIqBWYGxPRBvxe8Zjd2tiDj
	uF6U7acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTZS-000000059zZ-2pge;
	Thu, 28 May 2026 05:46:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTZP-000000059z4-3mw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 05:46:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3794C407A8;
	Thu, 28 May 2026 05:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA4C1F000E9;
	Thu, 28 May 2026 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779947174;
	bh=95SOoqGn6jyE0UfkDK15/NBpH9CmgAfhjJteJqSZdCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=USTJwMyGvWXoMbf/S3Hkuw/RAJZlgHz1wf6Rv3/jmc2THf0cyKGDOtGKt9FmAlIO2
	 bEzFbeCt0rnDn/8rlPAlmhLya/lie2fE7s0Ml45wXgkLiE48k3nYrM5tUD//wtZoUe
	 Or1W+w7erYiqub4kaHP0qkQb3RECfdmHprx1Vj3YKxor8X2FJMM9b4kv+OtRUUTLhY
	 dmdFE+f1EYTQmxHd5kFze5j7kVMcZ/PDIzwqvicbpyNpYnweMPLgb8vUH92a7Ecsu/
	 AQ6G7A7Ro/8u63LF4IMK8XJnfB3/MXr6DrdO23eJ8HfBnbe96tH4zBoN13i1Sk2LFH
	 iU1t+RcUX53pg==
Date: Thu, 28 May 2026 08:46:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v6 13/15] sh: cast away constness from the zero page when
 flushing it from the cache
Message-ID: <ahfWnLIwZXJvbvNg@kernel.org>
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-30-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526175846.2694125-30-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_224616_046277_63A74922 
X-CRM114-Status: GOOD (  20.85  )
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

On Tue, May 26, 2026 at 07:59:00PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> SH performs cache maintenance on the zero page during boot, presumably
> to ensure that any clearing of BSS that has occurred at startup is
> visible to other CPUs and DMA devices.

It flushes the cache there because before 6215d9f4470f ("arch, mm:
consolidate empty_zero_page") empty_zero_page used was for boot parameters
at the very early boot.

I removed memset(empty_zero_page, 0, PAGE_SIZE) that was a line above but
missed the cache flush. 

This whole "clear zero-page" can be removed IMO.
 
> The __flush_wback_region() function takes a void* argument, which is
> conceptually sound, but given that empty_zero_page[] must never be
> modified, it is being repainted as const, making it incompatible with a
> void* formal parameter.
> 
> Given the above, and the fact that __flush_wback_region() is in fact a
> function pointer variable with multiple implementations, take the easy
> way out, and cast away the constness in this particular invocation.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/sh/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index 4e40d5e96be9..acbb481cdbfe 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -332,7 +332,7 @@ void __init mem_init(void)
>  	cpu_cache_init();
>  
>  	/* clear the zero-page */
> -	__flush_wback_region(empty_zero_page, PAGE_SIZE);
> +	__flush_wback_region((void *)empty_zero_page, PAGE_SIZE);
>  
>  	vsyscall_init();
>  
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

-- 
Sincerely yours,
Mike.

