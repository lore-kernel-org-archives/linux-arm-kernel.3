Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16602F89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=; b=2ZlJm05vATDOJO7eczG33Y3mEy
	njAArxbK5JCiSQHuSB5VOVRBfUpj53nqnRvAALbLTTL6rfEhsx+2KbXZxhhDbf5KMDP3lKS65dEqC
	qpPRbsD76UnKDj9rUQ2wYjCrIYSVRE29UvY6QMAmP5I4UuT4w4M3m3Psnvl0a8mdapHCU/3zyMvsh
	V1JqCN/kM77tTU3Of8bxkix+aHbjY1Woc/g+9iPwjRJwpTuuL1tXmlwGW4Ea1Wh0X/NcK3u47RpSa
	CmffCTj/a+ak8BAfzRVgP8WAlR8Xs07j9mX/J8Lw249TTSo8DuQsgYT4oDvody/GqYAwgxlcVsVHH
	JocFLNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9Bx-00000008Vm3-3ugi;
	Tue, 21 Apr 2026 11:22:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9Bu-00000008Vks-3nYa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:22:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso2248095b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770574; x=1777375374; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=FV9zjT61IfdH0hw0vy7dGgYFsj9buGR2rsVIhszeGzojmh28XbJR9DD/bmCf0Wbjlb
         XA6Pw2xikjwUQye8Bsom2Uoowg3b4xvs/9yyV9E+48+KjnB4FYwbQq2nGBJWqCnoPWeV
         ce0vblNBH1NIPPWYNXQh6hWYhraSuKEnsDO60wp90ZKL3OV9ccrCaDbfJdsCd+GSFHnA
         MXqA0YVrtLaqMbwNspr6znLavBHCn3Jccr5nCLiAnt1/f/SftVL7nNTnCf3A0hiov/XP
         uBN5GNZSO/yNvsOQ4VHOfkOipHohigY5B10xjLVCyjiH9+O2trhImcd4qC6P/fFBnUK7
         CWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770574; x=1777375374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=HtSUaAWLLAgoegR7Zm+xQhbMDrLZ5pBJ+o32YN/upsqtED4OUcXANkkP9Aijb4lJwA
         LR4ZnotFu+Wl2dSB4pvSAhLBh+8Q46gLQiMiM4NIyj3OqlklZSVNyyXazUfsybjGQMAr
         xLq2BiFvF1Q38fZNMkQAEAQUJQq41XW0YxNPK1guqAL75vLDnETI2fPLo52YCSDlyJJk
         fMn2jZqz7QaA7AbMTNYGzQOGiIRO9wrlNdqm2549ZEpFpLFVXMMIVRmSJstWx6+ag5pi
         ClZf2+1mYehrOfTTh0OByTlp7Ig2kS0pxesAMSRv40HFH9fxV0XIm8gHMDUYFUFOL+Dk
         Ydqg==
X-Forwarded-Encrypted: i=1; AFNElJ8yNO/fVKYxaz/prSggz5N3XyK6Bj+wGWamI/jGTd7sjh6BegQyDiE46nbPjXSW8JACCGlGOcxy6+H0/XX5/5Ck@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+6OggW22AMeRu4zuubW7JfkWO6GTRtx2IQeO4YQe5mPj0QwZF
	6oQioqc61iimI9O6E+Xmy+rX0+8YRwKUPUcVnbMhcl1vjMuHwHq7t8Uv
X-Gm-Gg: AeBDieslt0iR3yokn3GBwPeZK7rWtRFRgrWvxhTpUdpIKFPWwp9dNbaVGKMMXbmGkgj
	pyzi/rUgYmnQjpEumRJrQgxxRnAgvhUn8jMkniIVIvaHn0rpjcbJqTrZ33ctjvbuw7uAWbIDBLZ
	Zfy+SKjX3apDW807XxaZAFCuSsUAK7TQ9j9FRqTd/nCHakJF+c3coPZ1yeIbOa8LfHbEbs5J7Vf
	QfWauFuthsa5aG6fbSi6pHi42XLuwc0Wmb16fLg4wiZ4QGBOMmYnvozP1z4hVPbG87sIjtRXYWh
	MeHp6Y9iBXB4JtLJZQQm+7kyxlaKkNQjxWTu/v6G53mumCBv4Fp0eGU+vjcHtk4wJnS/uB0ImXm
	XToWTQdrYdaYz9kLa4/ifs3BiwcRwFP9MQnxFPAU+yrGqROHcKdzne0Gu3VWc0FFcl4th1UKFQs
	yuwZ/7OKvg1AIFTd8QV1hQDjM6qFI+w9Km2tWRhauwNA4AyS6wfn1atlj7XHyrGkGNFfdXkAIyS
	n7oNA==
X-Received: by 2002:a05:6a00:6988:b0:82f:aae5:c7a9 with SMTP id d2e1a72fcca58-82faae5d438mr7228492b3a.27.1776770573719;
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14155014b3a.3.2026.04.21.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:52:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <aedc9UddBSYXzrAj@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.789114053@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.789114053@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_042254_952850_04213937 
X-CRM114-Status: GOOD (  20.05  )
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

On Fri, Apr 10, 2026 at 02:21:09PM +0200, Thomas Gleixner wrote:
> The only remaining usage of get_cycles() is to provide random_get_entropy().
> 
> Switch powerpc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Remove asm/timex.h as it has no functionality anymore.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Kconfig              |    1 +
>  arch/powerpc/include/asm/random.h |   13 +++++++++++++
>  arch/powerpc/include/asm/timex.h  |   21 ---------------------
>  3 files changed, 14 insertions(+), 21 deletions(-)
> 
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -150,6 +150,7 @@ config PPC
>  	select ARCH_HAS_PREEMPT_LAZY
>  	select ARCH_HAS_PTDUMP
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
> --- /dev/null
> +++ b/arch/powerpc/include/asm/random.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_RANDOM_H
> +#define _ASM_POWERPC_RANDOM_H
> +
> +#include <asm/cputable.h>
> +#include <asm/vdso/timebase.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return mftb();
> +}
> +
> +#endif	/* _ASM_POWERPC_RANDOM_H */
> --- a/arch/powerpc/include/asm/timex.h
> +++ b/arch/powerpc/include/asm/timex.h
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_POWERPC_TIMEX_H
> -#define _ASM_POWERPC_TIMEX_H
> -
> -#ifdef __KERNEL__
> -
> -/*
> - * PowerPC architecture timex specifications
> - */
> -
> -#include <asm/cputable.h>
> -#include <asm/vdso/timebase.h>
> -
> -ostatic inline cycles_t get_cycles(void)
> -{
R> -	return mftb();
> -}
> -#define get_cycles get_cycles
> -
> -#endif	/* __KERNEL__ */
> -#endif	/* _ASM_POWERPC_TIMEX_H */
> 
Build tested for this series with allmodconfig and allyesconfig on ppc64le
machine for ppc64le.
tree: git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git getcycles-v1

Boot tested for this series on powernv9 qemu, powernv10 qemu and pSeries
power11 hardware.

Tested-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>


