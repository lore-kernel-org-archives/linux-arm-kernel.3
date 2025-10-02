Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28594CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHL1FWMTNfUMVst2kL4U9dy1rJ/eG0WlqYxF6xOECUo=; b=TbsH8H8VKQWxoSBKzwd3YCIU7o
	aUXpSHjHC5iaoy9w1q5EExuKV6j35itSz0YC3+eIwkde+ngx9cxki+JNycx2l0pEHpGqqsKdpALLh
	rH50ockNfaxxOGXyAKQxVY+DcfuW8Q5w2cy+K55Nhm+DByHfc19nXkmN/iLTpUJyUiY5/TAtGznBF
	wFJ9VjdE3u865GZBTKy8uKGMxs5NF86VkdfnYsOIPaFBNqr0Qx1pEyUfboYsNSxGQoNmW44Y7rgsz
	nxIjCZB7nDVLs9jWpTELgH5JnQRH7LbRc3VPNInG36dw5+miwHQXgSLADbRVrc+q6XfThBs8qnQW4
	mutdPniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4MU6-0000000ArWB-3i2c;
	Thu, 02 Oct 2025 16:48:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4MU5-0000000ArW1-0jk7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 995986045D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 16:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452C9C4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Oct 2025 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759423728;
	bh=UXUa16DxRQlc+YoczpHucO1ugFqhBs0jsvbBdOCdJO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j0Y94/TqYpj+kjQCWs9eFlHW/1YN9UkIeBZQD85d5KgIk/tOkOxey0WUrpgbqn7/m
	 2TysR5EYWNUT1E4JsgFLLed3pNhBxyUKFVkDzbzJ0jJpiR8aQ7vZNH9D3tZCWZwFzj
	 Fnk24RzRsdAEwYRumnbEHYz+DuvVePn8RWRsSlsZnit+sJphLjYr8NjaOI1LYsG89Q
	 rFZHWlJ/T8nrt/iRHRm8w8oDCxS1krM8vsJCXLCWA4r2B8DoBjwhwWsvI5HD44gVvn
	 nVWIid8AXpqNG3TPSu2OzyteNP/gSgAvXvzJXvvPYvxdbWW3J80vKrkUUDu4DLYo3g
	 sVODSxeCsewyA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso3242744e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 09:48:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXs4nJ+ZEVq7aIRUgEW11i48L4aWIFWT+m2uHS0sa8nYvlKmnLS5ZzPT8HnO7orhurfQvwixjjWt/AwZ1EonX01@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Kxwbvt7h3EsK5J4fQccjCo9ORs/Usq/61HJwYrXtANY9h+Gx
	WLck8+p1BYXQEKT3MCPBcoaAvIjV3/Oj2uDjuvSU3WS9s6T72W351UHf7FK+i89WNY6B3x94F06
	SJFk4cLLhGM79XCNgeP64wEyASv3m+gI=
X-Google-Smtp-Source: AGHT+IEqXM/Be3cRNs05VWOlXbMCnMSG6Mba0tmbOYQBA/5ovj738cWnL+OCbs5vXp6LcKhFkY87M5wOVli92mntFKw=
X-Received: by 2002:a05:6512:2397:b0:581:bdb8:6df9 with SMTP id
 2adb3069b0e04-58b00b5eb3emr1343410e87.10.1759423726612; Thu, 02 Oct 2025
 09:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com> <20251001210201.838686-26-ardb+git@google.com>
 <202510020918.7E358227@keescook>
In-Reply-To: <202510020918.7E358227@keescook>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 2 Oct 2025 18:48:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEK+ggQXC6pruZs2jkg6fmA7+Uv45DY4B_XqTRsRbTf2Q@mail.gmail.com>
X-Gm-Features: AS18NWAZ8uFcVmA6EvK7W0-OFglLBSKI4YbLO-lps_DOpY0PjMY5dUoH7ZngWew
Message-ID: <CAMj1kXEK+ggQXC6pruZs2jkg6fmA7+Uv45DY4B_XqTRsRbTf2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/20] crypto: aegis128-neon - Move to more abstract
 'ksimd' guard API
To: Kees Cook <kees@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 2 Oct 2025 at 18:20, Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 01, 2025 at 11:02:06PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Move away from calling kernel_neon_begin() and kernel_neon_end()
> > directly, and instead, use the newly introduced scoped_ksimd() API. This
> > permits arm64 to modify the kernel mode NEON API without affecting code
> > that is shared between ARM and arm64.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  crypto/aegis128-neon.c | 33 +++++++-------------
> >  1 file changed, 12 insertions(+), 21 deletions(-)
> >
> > diff --git a/crypto/aegis128-neon.c b/crypto/aegis128-neon.c
> > index 9ee50549e823..b41807e63bd3 100644
> > --- a/crypto/aegis128-neon.c
> > +++ b/crypto/aegis128-neon.c
> > @@ -4,7 +4,7 @@
> >   */
> >
> >  #include <asm/cpufeature.h>
> > -#include <asm/neon.h>
> > +#include <asm/simd.h>
> >
> >  #include "aegis.h"
> >  #include "aegis-neon.h"
> > @@ -24,32 +24,28 @@ void crypto_aegis128_init_simd(struct aegis_state *state,
> >                              const union aegis_block *key,
> >                              const u8 *iv)
> >  {
> > -     kernel_neon_begin();
> > -     crypto_aegis128_init_neon(state, key, iv);
> > -     kernel_neon_end();
> > +     scoped_ksimd()
> > +             crypto_aegis128_init_neon(state, key, iv);
> >  }
>
> For these cases (to avoid the indentation change), do you want to use
> just "guard" instead of "scope_guard", or do you want to explicitly
> require explicit scope context even when the scope ends at the function
> return?
>

I'm on the fence tbh. I think for future maintainability, being forced
to define the scope is perhaps better but in this case, the whole
function contains only a single line so there is little room for
confusion.

