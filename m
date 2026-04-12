Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED545F3ED6C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=; b=GjtbxczHwfKR52z4d7flyNonb0
	h2AEt9i/ScHkeYR0GmzKOXSV3N+BN6mD8HoLmud425OOO8rjBGSETwTLfOLVU61ZlCLnXZBx3ZlF+
	0x0nLM75gE7R0CyY+AHkqkY9F1WK2G0NTyUzQ23rZ5diexGf9UwuZRM79xAe5k3tLnvQRF/2r61Rx
	NwqECytW3Ou8p/SbNn+MELcMxi5ON1DGlbgjQ0I6bFJ7fBBHH/JRK/HPZzay659Bxoz0/uA9OIVd1
	3l3pdWuyrZ8LWV75KT5FXSoSbrnZi5dTSBuhgZj80K1UHLEAcBAs8OjB8wUVpNlgu7XvfUljiSM7n
	2/34MNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqcR-0000000EAeP-3Bww;
	Sun, 12 Apr 2026 08:56:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqcQ-0000000EAdo-0SAj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 08:56:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-482f454be5bso36434245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775984196; x=1776588996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=KeTG3CbapSM0EIG7IwunQXiAUsve6wtDmI+nJ3GcZsMqV+QgvksO7LRXwVzubIeb9P
         8+bFZAf5KzZ52a0vrAKHCg3p8CVptIxKowQLgvPVjXcIXWpxBuPWwYqVYC68iUZ6Co9Z
         cJ0Ofoa7hvgPIIfal7f2p+8ouJi3qa1DXGTyNC3rvif40zkHBRcRyQ1yk/ZdVPqQS1HZ
         Daq8jv8AunPKehX/7VEWcEq7LNFn/RD1v7+cP/g2KmmjS+xu/CoBN7+vLAJ9Yo19jEfx
         RTaFlxcSW2nyT36ErZ/B6rO/+uAkIFTe/m+2WVEZDQOATIeQ+wMk1HQWv5mEn0AGIs/h
         tZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775984196; x=1776588996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=HmLtCS51j9yKQ+6FFJ92OWr+o8PsMl/AEo9F2dFNlK6iCl+jf7B60xQ35NLcbhFQBV
         05CuSAFGo9uwGwd+Hzv8OoAol0kfG1YwxGl20BL46xO3pp68zmqh8SIpR7tZ+0ZGEMxW
         ZVmdUV6qw2No1Hw8EH9xuwmQ/mQZpY5HLATsDi1pspoJZrYdaPVfqqJd+C/5kaVsSdPu
         lF2+U0aGW4g6+R5HjuOm8IvKXy0NhQyZqrM44KbTkKlLgsAmlNrQel5fDW65KpT78zJK
         VQAv7gjiZzyK4tV8sRHVNYgrFJMiNXqfp3sZ+3ucVaJM7YzpjZJqiqOcOCdsC+wT6r8Z
         nLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmFaqAaCODPNETX2EVt8R3IM4O2bV0n2rFJbQGv8TTtvEtUbuFg6OeZ77SkpJcV7d3epDhPeueS28MEKoZ/PVA@lists.infradead.org
X-Gm-Message-State: AOJu0YzsuiHcNi9UbBhU1U9zuVGScBewI/N4lU06l7P0JjdZOQp5qejc
	C8Szw54LBw/H8pcYc77wOsLCWV346oQxgQiyB6fREwuhv5c0pBRYb3fU
X-Gm-Gg: AeBDiev/ogQdD4OM/mUjWLdykQrW8Hj1PqSWXGmXjwckQ/cQGG83Libq7Q2XOeMsUZK
	o2+Mzfs1tsltbMtLnIJwiAQLgHOw69Nl79vZG+KGfUBxtl3N48kR9MoR2AP/YH5U9S5+Hs9vtr/
	1hBOCe4Sp9ZgPY+e201YIFCkDb9IE4Uy9aiMy3HB9Jw70YaMY9OxJHNHhH6zqu9ITlf1b9Rck/L
	GunGbtxpBLzaU8o/XPdQUWPDdW5BQey1jNC5BEEAfG7D0+zEAgFK7u8wpWmM91jFX5GhGN7jUgK
	0uZP4oI646b1uvFqdyUFx+vuBLotoiwFG8jmJRhaQqyVGRPpLPYeh3z+AL9bfTbMSdMdDpGJRfk
	4gQYHuxOypYa9x1zOZFT8ovDIO7k7E1R3enGTRWqTAemMtAkrxgdVH3H5exLHKFVxJydEBiWr+m
	OqAfo7EwcJ8nhebtV0ARSOF49Dbjsoxs40cnshntmEltE61jjTfvs0Iwkce6YzG0MUJvqURZtPo
	6XXow==
X-Received: by 2002:a05:600c:698d:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488d6ac9ce5mr126951995e9.14.1775984195334;
        Sun, 12 Apr 2026 01:56:35 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ed4dsm197923925e9.4.2026.04.12.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:56:34 -0700 (PDT)
Date: Sun, 12 Apr 2026 09:56:33 +0100
From: Stafford Horne <shorne@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonas Bonn <jonas@southpole.se>,
	linux-openrisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>,
	iommu@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org
Subject: Re: [patch 30/38] openrisc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <adteQSw8c65MtX5l@antec>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.593798781@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.593798781@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_015638_177623_515DCB1B 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, Apr 10, 2026 at 02:20:55PM +0200, Thomas Gleixner wrote:
> The only remaining non-architecture usage of get_cycles() is to provide
> random_get_entropy().
> 
> Switch openrisc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Add 'asm/timex.h' includes to the relevant files, so the global include can
> be removed once all architectures are converted over.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: linux-openrisc@vger.kernel.org

This looks good to me.

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/Kconfig              |    1 +
>  arch/openrisc/include/asm/random.h |   12 ++++++++++++
>  arch/openrisc/include/asm/timex.h  |    5 -----
>  arch/openrisc/lib/delay.c          |    1 +
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -10,6 +10,7 @@ config OPENRISC
>  	select ARCH_HAS_DELAY_TIMER
>  	select ARCH_HAS_DMA_SET_UNCACHED
>  	select ARCH_HAS_DMA_CLEAR_UNCACHED
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select GENERIC_BUILTIN_DTB
>  	select COMMON_CLK
> --- /dev/null
> +++ b/arch/openrisc/include/asm/random.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_OPENRISC_RANDOM_H
> +#define __ASM_OPENRISC_RANDOM_H
> +
> +#include <asm/timex.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return get_cycles();
> +}
> +
> +#endif
> --- a/arch/openrisc/include/asm/timex.h
> +++ b/arch/openrisc/include/asm/timex.h
> @@ -9,13 +9,9 @@
>   * OpenRISC implementation:
>   * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
>   */
> -
>  #ifndef __ASM_OPENRISC_TIMEX_H
>  #define __ASM_OPENRISC_TIMEX_H
>  
> -#define get_cycles get_cycles
> -
> -#include <asm-generic/timex.h>
>  #include <asm/spr.h>
>  #include <asm/spr_defs.h>
>  
> @@ -23,6 +19,5 @@ static inline cycles_t get_cycles(void)
>  {
>  	return mfspr(SPR_TTCR);
>  }
> -#define get_cycles get_cycles
>  
>  #endif
> --- a/arch/openrisc/lib/delay.c
> +++ b/arch/openrisc/lib/delay.c
> @@ -18,6 +18,7 @@
>  #include <linux/init.h>
>  
>  #include <asm/param.h>
> +#include <asm/timex.h>
>  #include <asm/processor.h>
>  
>  bool delay_read_timer(unsigned long *timer_value)
> 
> 

