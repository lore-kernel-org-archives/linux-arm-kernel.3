Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0774DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ks/v4Ujqfzvs18wnvXzme1WPE3egbOvN05dsniZSqtg=; b=e/AP2ih/8GOLLKfQ2riGa3NN+N
	2cg3BaIA4EI3bwP9KuwxlLo1xsZyLjLB5Edpiaz4f4/LTi5+OCWj+cwSMv/PhxBB1c7pb6mr7BgDy
	k7qDP8bONJVDrGf/rhVhI7+sbxueZwxtptKDJjwRCBVRntGSXqkgQdz7tRMC0Sv+b2sw36q5CzQJe
	KWbAg0eUVhIrUX88EMVi8QN4ZoAM8umBw37T03vwJnzrf0AE7hIokptEEW9owGtDTp9PkCstvnDpO
	WePFK91Mn1uCl0Jgs8F3+dl/N7cXJD30bQXwzGFs/QoL3qg7XMAmjQ6GoXahcKVGbsdsZusAJoYHa
	h79uMr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBwi-0000000Cfrt-2gAi;
	Thu, 19 Jun 2025 09:52:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB3Q-0000000CVhL-3elo;
	Thu, 19 Jun 2025 08:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9D15A54350;
	Thu, 19 Jun 2025 08:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B497C4CEF4;
	Thu, 19 Jun 2025 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323327;
	bh=eQADuGSiL41NAxGl9NK+UhkSlVn0yTQBhyaUTND5Uzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p2FgroRg8XpbJ/VSjtfLXHjJJRjKYpLj2XcaUHKG2xLQ7wfM+Z5n3rCjl6c8Zto5M
	 RSqSwjDobL8Uw3UNbEgelKH8UpaKTaToYX2CC3EHc2vsE2pdmJDyKlBWw+TMDnneAR
	 zMJQDoEg8twbtA3I11UyCenEImVZ9sO7oElSKq/lIdyVHdbSV7Rl1uy4I9OtVCIJ1L
	 xY4b7NmVNhx3/G6psbDY7j5hAeSUhrVg2Gh8rwAs7zI7pjkVGSiXnOiYqIeGf09brb
	 UZTFESwD6c+51mkUr6sZ7eCO2jWacLftMDJ3IO+VCTUTYL9SrpXOCd2q9ivlu3Pq39
	 P3TSZ4nA1tZBA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so1001925a12.3;
        Thu, 19 Jun 2025 01:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAeZlVsX1D8RtvpmvwcIPIaTGcVFrtjbodDi2eHo+QRjKHukyVnRipyys7YzY0gqW1u+kzytYeERbzkXU=@lists.infradead.org, AJvYcCVQKZB2bkoeNJcB7VOPj/3hEpNQQ3/Tmlv3lb7Z8NuUTXChtfzDCA7bcC3OyINY/oL7PzALUHL9JLV/H4MtnZu7@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrmqZ6C+Q8xDTXxI0GNETauYCafrWx2eDwFQOsOlkDQce+nGF
	tDiufiGNcmtd4sdsovIUZ0Q7hFWxW5emX/odCUGJM+xiKipGPnNbZfuWe2aTWB4bbnLc8MuU4ft
	jidycYPUup0omMezoxZ1BDTrVUJT7DO0=
X-Google-Smtp-Source: AGHT+IFe63NPmdC9P72cDlyX2WP9si/cWhn+2uqDCCs1dQMO/+ouBJs4HCM0Kl1RCgdHuztVjrD3QGSEtvvPoh/cEAU=
X-Received: by 2002:a05:6402:50d2:b0:607:6057:9006 with SMTP id
 4fb4d7f45d1cf-608d08f7a70mr18716524a12.8.1750323325929; Thu, 19 Jun 2025
 01:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-9-kees@kernel.org>
In-Reply-To: <20250523043935.2009972-9-kees@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 16:55:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4rFt3J6hD-eiNN5nihNR0cwMxPJQpq8LQWkx4km428og@mail.gmail.com>
X-Gm-Features: AX0GCFtBM3K8OeK1JL3sld-cpEWi3kLQAET9w-cyksCMv2tJ5SCZdduevj4T0cU
Message-ID: <CAAhV-H4rFt3J6hD-eiNN5nihNR0cwMxPJQpq8LQWkx4km428og@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] mips: Handle KCOV __init vs inline mismatches
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_015529_040402_0781BF19 
X-CRM114-Status: GOOD (  17.00  )
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

Hi, Kees,

On Fri, May 23, 2025 at 12:41=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> mips this requires forcing a function to be inline with __always_inline.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: <linux-mips@vger.kernel.org>
> ---
>  arch/mips/include/asm/time.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
> index e855a3611d92..044cff0e0764 100644
> --- a/arch/mips/include/asm/time.h
> +++ b/arch/mips/include/asm/time.h
> @@ -55,7 +55,7 @@ static inline int mips_clockevent_init(void)
>   */
>  extern int init_r4k_clocksource(void);
>
> -static inline int init_mips_clocksource(void)
> +static __always_inline int init_mips_clocksource(void)
Similar to x86 and arm, I prefer to mark it as __init rather than
__always_inline.

Huacai

>  {
>  #ifdef CONFIG_CSRC_R4K
>         return init_r4k_clocksource();
> --
> 2.34.1
>
>

