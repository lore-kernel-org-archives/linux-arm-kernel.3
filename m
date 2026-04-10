Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7830F44869
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=; b=bUr5d6bAyjgqjvmKM90GlbK0NP
	HGsXr/FqJQJa/iCO3UJb8Ji9p+PhJEmxr0d37Eyn0/6diYxrVOis6iPpmePL4ONlRbwNW8z9/Y7aE
	wsgeM7MldUfX9QYlz8pyMcFkBO2rIRUdHsErFHpTbRwwRqrNL2gVQS/7fu1ONcma3ueQSDKiT2QOI
	4G3DuxvJeWJW34GjMmWkkmXmvdpw0HXqzd3nnDkSjo9RxPwzaitbDzN2AgYTKgkQ26T/ctOBXSotu
	vyIzafyL5O+urkTfP7p4lIF9uLHE29Se29SD2C1r8b5wgFvH2X9hcRtwmZmR3Ll8+QzdJfyDcQHkA
	xu/vf/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC5j-0000000CKUB-3GPC;
	Fri, 10 Apr 2026 13:40:11 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC5g-0000000CKTJ-49sM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:40:10 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1279eced0b9so3035209c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828407; cv=none;
        d=google.com; s=arc-20240605;
        b=RMl0hWzRZov9Kj7Od7wFmkGGMgzXUO6/J3dmSoj+UJ09NZn5u1Opo2y5wVM5a48LJx
         hjuErnCGOligb5YRb+8gylDULdjbbJ+YMIiKvTS0PMkg6zSVI/xMxvue3145rc8FgWH6
         CL4u+cwpk0xYnDidgkK70uZ/IPyAwNmx8DY7C4D7FayhI2+yr4uzTPkd+kXUj7R4DnKs
         kjA18FOThJm4j8HtLzQgoIgl8Y139i79PeaZYnoURSDcLPldFtGMvzSWqq4uO2YCx4M1
         SlZoXzj0DgPmKOszJfotRuHUr/hBJdCMReQVCV0UUPA+e84ikNr41zR39h5BqoXmXN1V
         hLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        fh=/9hq86XmmXl1SrcvEmV+lfn7JBWmifysGP1tVqqPSsc=;
        b=g/R9GzbdyoWRhb3iiouYx9AyYWrsOL1fb9sZ0UwWOHMn7JZpdseu5mKXTQ2Q82bhG/
         2G3lKfRwb/z2YWihgAH8oNrefgYHxmFvDttui2xTqH8Kooy5+nyGSH8xpI4221HxTebM
         4ofjg69rRLCYQ/IyNbGmaYSiS5PNAxwlruSkyoKGba+6iKlfz6Ik1XlmOi5K83bBP/s2
         puFocBZm7axm7f1nOQ8Gj31cbGuGnk2L13jZqsJp5pp2BavM1EAl5j14WkXjLXayJJeM
         AFzqEjjpzpvTWWUq+yRHAMwiXZ6yjUvWAS8mWkfMMw4aVWm28eYx4kHs08gwDNynJ8t0
         9Efw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775828407; x=1776433207; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=LQs46EfBKyQi8bjGZc/shWUpNuXhL01LJmtMpaqVSG56suvV4q+KJrg7qRuE5AR7UG
         2ys/oNN93wyjpCRaSIrjyvIMI7dCIVyGXhVM5pxkpvifXkp9F6I688F51y176v3rLLJv
         dn9SmUZWI/roG3YrOoQHq53/9otBw9DHsFj9x3FtwzxpK0+LjnazmO2LKHnFke7ZeO78
         N6HSR7RV1O8R4EpB34BpDO6ZOUDIBHkP0pxIEDNQdFQ+0M84oEva8D1WESVNTtZvdDQN
         PTvcaDriST+M1T1f64yv9TebkinyHY1zQ8k8MVSwX408DDDXzkz9ozD28zlDGfQB1wO+
         yY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828407; x=1776433207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=oZ7n7RQhxbq9MvRiZ+LB6skpZugBLJMpPGfDAA1Lr4n3hfbDrLm2YHt3uvnB9lN6NS
         qy78z2ZFb43Fh/ZbCy3qKOVpMEkcqq5M8RMNbmTzVKHSPiTXGM+wUk3F+oruCZno3Gcy
         Fl+LYEMr9nCq72BtezZn/8vd4rkP3bI6/cHl0bFN1Te27MbqUPnpF+UU9beeqNDAyYjx
         4pUJDyfQQWMvtRB3N47Gr7kYFgrp52pJPGVXVB3/KDe6tRVkdBKfqAwkC/dk2flY1+zk
         8RHvgiOji2M9zH5cMrbTRgNenpALSoRL9Y5KBmBY7zXXyDQt4qkXUXeUkI3PgtBGleaT
         h7qA==
X-Forwarded-Encrypted: i=1; AJvYcCX3jw3J0MbSAahmgYTePkyAIJdZRwiJiUmNDQuIWgVBOBos5X99QtxSuwUc+C+xTTBCcVw+Zt3aEgcoNvHyUTFG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3vG2ytprh7umQuWI2zNjezdxtyrvcigQy1vVqEoLdAxLloRWB
	gfTF4bwaXMv0ZSD0EhzAkm8Xgbx/gIBnuGaSlpLSn3yStZGzJXe3o8suvbqA0XvWI+OBBUZ5JYW
	tP/tl1ilIY+5yN9NnGyrQ+lwwxha6APef25jcK7S2
X-Gm-Gg: AeBDieuH9hspvcSVP5hAE7jEJDWJua5gNeDkgjcnoZUsvax3NB0GnpVFOihzmKyZBIV
	rD7dna2n3Xu91iGzEgRTvcG/Is5PrK1lPVdNo1lGpVoB1dGeIKHVW276vCc/T/ff0wLIdQEeEaf
	/pF0jBPcCjOxMbaL3ev2qpi8xiDtckvUHl9v5uN86JrlQS30E6iakxrsN2hrjfOfBSM9MK46U2e
	Wlfq12sTc1WAhynsS0BwFdKITrroDRBsJ+wU+J5xel32hZj9nwCtkByhXK44nTjgpf7S/RVbYBp
	1zP52w84Sb4FcbQ/comLyrb5Pc3zV9jAoAkuNjEt7Fyh+Ftx
X-Received: by 2002:a05:7022:fa04:b0:12c:2ed4:62fa with SMTP id
 a92af1059eb24-12c34ef907emr1882312c88.32.1775828406651; Fri, 10 Apr 2026
 06:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.862164111@kernel.org>
In-Reply-To: <20260410120318.862164111@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 15:39:30 +0200
X-Gm-Features: AQROBzBE-9UxDQG5mMJLgipEeL_Y5pwE-Y_PUrJGxDBLilqBu51b8lLzxdip708
Message-ID: <CANpmjNO1vsO1LT6xijhz3nsjQa+_A=9omfgOSz=aGn293-LqTg@mail.gmail.com>
Subject: Re: [patch 19/38] kcsan: Replace get_cycles() usage
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_064009_039461_91D38CA8 
X-CRM114-Status: GOOD (  22.31  )
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

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
>
> KCSAN uses get_cycles() for two purposes:
>
>   1) Seeding the random state with get_cycles() is a historical leftover.
>
>   2) The microbenchmark uses get_cycles(), which provides an unit less
>      counter value and is not guaranteed to be functional on all
>      systems/platforms.
>
> Use random_get_entropy() for seeding the random state and ktime_get() which
> is universaly functional and provides at least a comprehensible unit.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/kcsan/core.c    |    2 +-
>  kernel/kcsan/debugfs.c |    8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -798,7 +798,7 @@ void __init kcsan_init(void)
>         BUG_ON(!in_task());
>
>         for_each_possible_cpu(cpu)
> -               per_cpu(kcsan_rand_state, cpu) = (u32)get_cycles();
> +               per_cpu(kcsan_rand_state, cpu) = (u32)random_get_entropy();
>
>         /*
>          * We are in the init task, and no other tasks should be running;
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -58,7 +58,7 @@ static noinline void microbenchmark(unsi
>  {
>         const struct kcsan_ctx ctx_save = current->kcsan_ctx;
>         const bool was_enabled = READ_ONCE(kcsan_enabled);
> -       u64 cycles;
> +       ktime_t nsecs;
>
>         /* We may have been called from an atomic region; reset context. */
>         memset(&current->kcsan_ctx, 0, sizeof(current->kcsan_ctx));
> @@ -70,16 +70,16 @@ static noinline void microbenchmark(unsi
>
>         pr_info("%s begin | iters: %lu\n", __func__, iters);
>
> -       cycles = get_cycles();
> +       nsecs = ktime_get();
>         while (iters--) {
>                 unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
>                 int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
>                                 (!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
>                 __kcsan_check_access((void *)addr, sizeof(long), type);
>         }
> -       cycles = get_cycles() - cycles;
> +       nsecs = ktime_get() - nsecs;
>
> -       pr_info("%s end   | cycles: %llu\n", __func__, cycles);
> +       pr_info("%s end   | nsecs: %llu\n", __func__, nsecs);
>
>         WRITE_ONCE(kcsan_enabled, was_enabled);
>         /* restore context */
>

