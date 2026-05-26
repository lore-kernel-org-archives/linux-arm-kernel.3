Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D8ECD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flib1lT9XACw/dOlXrdz0j3tL1RxjfVbN+h8oDjWYwQ=; b=jB7M/lQPL/wXLYj544AWVMvKT8
	/f1ZQhjF0AzDMpULq55X2cvmJvrDbvB7VFa7g4M1Vaz45REfponb9Q8H9mJ9GV4h7NG2hOoJYnphH
	Wq8wND9iU+s832vjIS/LNmw+8qMk63xesj7Dfog0q4TPHfU8eT78SryEV3xctE7BoaCL6UQMJf1i8
	CI0S9+peQKwSNDlQNKSydygdhQVgEYZR2BfGionPnXZg19BpM4wTLlB2N/6g4e4sD9FK17yjJ9nLS
	6bWUIglSOUP7Vi7ru72PdNwA2otMh6feoVXEEi+XRvb0hw4qEiK8awJk5u3CdEfHO/j+I0mYVgOXp
	t6cVez5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrfA-000000022S2-2KoQ;
	Tue, 26 May 2026 13:17:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrf7-000000022RT-17I9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:17:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A2B84465D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615BF1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779801456;
	bh=flib1lT9XACw/dOlXrdz0j3tL1RxjfVbN+h8oDjWYwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ik30zYwSbyOlgfIKiCrnatW9FCRjQf91DbnyOZ7BMieUicoNGhHlLQWlkJfpo8G1C
	 4sABbHGLRZtm28bLle6cFnLCimT0AvzhpdikQfkiBL50FxnpJZzuc6z1MtMHtq+MLh
	 3xAxStio1aD36S7A6+oxhw8kD8PpYyHeJ1gwpZA62ak+GjkqqqqckT4JHMiYFoouJ7
	 GzZsW//OJl/s13+XgN33EyZjp/McvvQwsfuogxXev38mjZbgtldNSyR/p1EJryhlhR
	 9NlzVu68DFp61L2tvcCerO0V4iIYyjjIIqG5KwTOJEvqR99G83LAcOnBMHQ1BqEcp3
	 P43abPhJii5ag==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so12744923e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:17:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/oYOpfkDt8uiDeZL0Q6B4yRS9YMqmrwxwzr494BicROcQf3Q/5vYcm+VtcOoS6oZQPXQIHxSqtdybknguYHFO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5g/n04tM52NODRYpxlyd+l4pWVeuu9458n95isYXg7D53dc4
	9XOHl3KWx5Y2BaQ84e9IuZ9vp0Dtj2kVJILmyzRPsVrSYv/oYYOK10MFOk5trOARI30bNUt89eg
	OgYY7YPrYY9lc7d7F1zsfwB+KQTgkxOA=
X-Received: by 2002:a05:6512:1094:b0:5a8:8222:7fc9 with SMTP id
 2adb3069b0e04-5aa323ab2e4mr7005025e87.13.1779801454669; Tue, 26 May 2026
 06:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com> <20260526-kpkeys-v8-1-eaaacdacc67c@arm.com>
In-Reply-To: <20260526-kpkeys-v8-1-eaaacdacc67c@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 15:17:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLnURXzgAgkWCcYX0dLOLqHQw+gn96V1dzDa_0Aoi3430Q@mail.gmail.com>
X-Gm-Features: AVHnY4Kbg2Xadd_3XEw9WMChJMsoQ29BSR2ziaqWgbvf-NftOZWEkP4UGbMFG7w
Message-ID: <CAD++jLnURXzgAgkWCcYX0dLOLqHQw+gn96V1dzDa_0Aoi3430Q@mail.gmail.com>
Subject: Re: [PATCH RFC v8 01/24] mm: Introduce kpkeys
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Pierre Langlois <pierre.langlois@arm.com>, 
	Quentin Perret <qperret@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061737_627426_4F7D74C8 
X-CRM114-Status: GOOD (  28.63  )
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

Hi Kevin,

here is just a few drive-by review comments pertaining to the
API which will be used for all architectures wanting to use
pkeys.

On Tue, May 26, 2026 at 1:17=E2=80=AFPM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:

> kpkeys is a simple framework to enable the use of protection keys
> (pkeys) to harden the kernel itself. This patch introduces the basic
> API in <linux/kpkeys.h>: a couple of functions to set and restore
> the pkey register and macros to define guard objects.

It=C3=A4s a nice idea to use guards for this!

> kpkeys introduces a new concept on top of pkeys: the kpkeys context.
> Each context is associated to a set of permissions for the pkeys
> managed by the kpkeys framework. kpkeys_set_context(ctx) sets those
> permissions according to ctx, and returns the original pkey
> register, to be later restored by kpkeys_restore_pkey_reg(). To
> start with, only KPKEYS_CTX_DEFAULT is available, which is meant to
> grant RW access to KPKEYS_PKEY_DEFAULT (i.e. all memory since this
> is the only available pkey for now).

OK!

> Because each architecture implementing pkeys uses a different
> representation for the pkey register, and may reserve certain pkeys
> for specific uses, support for kpkeys must be explicitly indicated
> by selecting ARCH_HAS_KPKEYS and defining the following functions in
> <asm/kpkeys.h>, in addition to the macros provided in
> <asm-generic/kpkeys.h>:
>
> - arch_kpkeys_set_context()
> - arch_kpkeys_restore_pkey_reg()
> - arch_supports_kpkeys()
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

I'm following so far.

Is there no need for something like

ctx =3D arch_kpkeys_request_context(KEY_TYPE) ?

I'm just thinking of the scenario that e.g. two architectures want
to request the same type of key for some generic resource, but
the underlying implementation is vastly different for the two
architectures, so relying on hard-coded arch-specific constants
may not work. I'm also thinking about archs supporting different
versions/types of kpkeys in a multi-platform executable kernel
that may execute on several different silicon with the same ISA.

Maybe this is too much upfront design, I understand it needs to
be kept simple.

> +#ifndef KPKEYS_PKEY_DEFAULT
> +#define KPKEYS_PKEY_DEFAULT    0
> +#endif
(...)
> +#define KPKEYS_CTX_DEFAULT     0
> +
> +#define KPKEYS_CTX_MIN         KPKEYS_CTX_DEFAULT
> +#define KPKEYS_CTX_MAX         KPKEYS_CTX_DEFAULT

I was thinking an enum:

enum kpkey_type {
    KPKEY_DEFAULT =3D 0,
    KPKEY_MMU_TABLE =3D 1,
   ....
};

since this is what is used later.

> +/**
> + * kpkeys_set_context() - switch kpkeys context
> + * @ctx: the context to switch to
> + *
> + * Switches to specified kpkeys context. @ctx must be a compile-time
> + * constant. The arch-specific pkey register will be updated accordingly=
, and
> + * the original value returned.
> + *
> + * Return: the original pkey register value if the register was written =
to, or
> + *         KPKEYS_PKEY_REG_INVAL otherwise (no write to the register was
> + *         required).
> + */
> +static __always_inline u64 kpkeys_set_context(int ctx)

Should ctx be unsigned here? I'm nor sure what a negativ context
would mean.
kpkeys_set_context(unsigned int ctx)

And then I was thinking:

unsigned int kpkeys_request_context(enum kpkey_type type) {}...

+ arch_ -prefixed version of the same.

unsigned int ctx;
ctx =3D kpkeys_request_context(KPKEY_MMU_TABLE);
(...)

Constant sinking in the compiler will optimize the arch
function to a constant in the object code so it will still
be fast just a bit more talkative in source form.

Yours,
Linus Walleij

