Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE2ED1171E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1Es+l5jC+IUSN6xYtlF1oTxAufw24NUf66si7IvMDs=; b=Lv0kG2YUpoWa+70h4tD0+GDX6z
	ce6u5HfxfWSjp6RoOKrlK6HoxjH4H8O7QmoDOxYxdoIbmQ+kdQQHbgQk3+LPyMRWeXJpSuhetANWw
	8KHPbvozR5+jy/Gv/5W1vgLuDHZRJMVsKFuK+hve6GxpQPZVSC8L77k6I45fGDTc+gdR1SvNvsvUu
	EN9QHEm/hongA+ZlRlsB7dSdsEUhb1UVn1+Lp2nZU3gR4XyOr+MQGj0QWCp79kx7bsqEB3bw5eIUx
	g9Jzo2KqsYXHFbwwjIQcBrgml7paX2EtDOcwOv7Apu4P1VKiuKWjt/8TBHs1NfN52YIQByetnPf9g
	AFn4Bniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FPK-00000002w8m-0MSB;
	Fri, 25 Oct 2024 08:10:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FJv-00000002ua9-43Yj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A30CAA40069
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 08:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54E6C4CEC3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 08:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729843518;
	bh=KfmEL14rVYtfMW9cS9/j2bydxqHvt8iK8MkWYzJOEvA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NVvZEqOgckAGp2/wGcICDCHu1ywbgm66lHVMxvD5Ps1t/KsbQvygjH5NDjD+7xOhv
	 tPdNyewBDRwuFJD2bf3kEymZHJoyiTgw+eYn5/8gA7bI1gIHLp1EpTk9dUFj2LGm+/
	 J8vU4SyM1u+pbttYSCzH5uyhBAV4HhkqnPP4qMj9h3f9Zp3sduBWs0NdLGg+1vem7h
	 EgVt2Rv6ZZ7ZKLq4RJTKTPbu235tbRwm2GDb1WmH0Qw/Z+mU309rlcgp42gDhTjQIO
	 XRpyAB97ENeBo/S8KkeP2RjhDK7UAnuFkX+48kp9Vf0U7qbyWRTVIMATsJ8BiudR19
	 /avWhjhSlAt/A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2369975e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:05:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbe0rts89wmG12udB+rIQh5hvvytJXUfk+Hsw2SkRTF8vO/vVSGxJEBzkA9rWaE7gScfkbS8cuxDQzxhCkjEaU@lists.infradead.org
X-Gm-Message-State: AOJu0YyMmzZBnWscqn8QM1faDFmZA/2Lh68vul9843QpZEpy0rGcGQyI
	vJ2cIEsBH6NAbWVSTPNIbpcsriYGuPMyr9T+acfnhzuUk/S9GfX48M5Ro/8p4xDmDdJgVrQqcIj
	A9EjLB9OI0Jh3Ln+OWfsM3rAEMxk=
X-Google-Smtp-Source: AGHT+IG27Yb80kx6CJY+4tOhVGsT/ZEj4ynv9I5D6j49Hjrinwf5ULC9VA4qcGFViD1IszHktbXduIrXQPhRWuonH7A=
X-Received: by 2002:a05:6512:33cf:b0:539:dc87:fd3a with SMTP id
 2adb3069b0e04-53b1a2fad1fmr5310677e87.6.1729843517038; Fri, 25 Oct 2024
 01:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241018235343.425758-1-ebiggers@kernel.org>
In-Reply-To: <20241018235343.425758-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 10:05:05 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGvh3DBGL2g-3Xnj_F1e3w+HDBxoekgiE2iJq9TsOK--g@mail.gmail.com>
Message-ID: <CAMj1kXGvh3DBGL2g-3Xnj_F1e3w+HDBxoekgiE2iJq9TsOK--g@mail.gmail.com>
Subject: Re: [PATCH] crypto - move crypto_simd_disabled_for_test to lib
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010520_154429_3C362649 
X-CRM114-Status: GOOD (  23.02  )
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

On Sat, 19 Oct 2024 at 01:54, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Move crypto_simd_disabled_for_test to lib/ so that crypto_simd_usable()
> can be used by library code.
>
> This was discussed previously
> (https://lore.kernel.org/linux-crypto/20220716062920.210381-4-ebiggers@kernel.org/)
> but was not done because there was no use case yet.  However, this is
> now needed for the arm64 CRC32 library code.
>
> Tested with:
>     export ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>     echo CONFIG_CRC32=y > .config
>     echo CONFIG_MODULES=y >> .config
>     echo CONFIG_CRYPTO=m >> .config
>     echo CONFIG_DEBUG_KERNEL=y >> .config
>     echo CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n >> .config
>     echo CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y >> .config
>     make olddefconfig
>     make -j$(nproc)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> ---
>  crypto/algapi.c     |  6 ------
>  lib/crypto/Makefile |  2 ++
>  lib/crypto/simd.c   | 11 +++++++++++
>  3 files changed, 13 insertions(+), 6 deletions(-)
>  create mode 100644 lib/crypto/simd.c
>
> diff --git a/crypto/algapi.c b/crypto/algapi.c
> index 74e2261c184ca..429a832f90fe0 100644
> --- a/crypto/algapi.c
> +++ b/crypto/algapi.c
> @@ -4,11 +4,10 @@
>   *
>   * Copyright (c) 2006 Herbert Xu <herbert@gondor.apana.org.au>
>   */
>
>  #include <crypto/algapi.h>
> -#include <crypto/internal/simd.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/fips.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -21,15 +20,10 @@
>
>  #include "internal.h"
>
>  static LIST_HEAD(crypto_template_list);
>
> -#ifdef CONFIG_CRYPTO_MANAGER_EXTRA_TESTS
> -DEFINE_PER_CPU(bool, crypto_simd_disabled_for_test);
> -EXPORT_PER_CPU_SYMBOL_GPL(crypto_simd_disabled_for_test);
> -#endif
> -
>  static inline void crypto_check_module_sig(struct module *mod)
>  {
>         if (fips_enabled && mod && !module_sig_ok(mod))
>                 panic("Module %s signature verification failed in FIPS mode\n",
>                       module_name(mod));
> diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
> index 969baab8c805f..01fac1cd05a19 100644
> --- a/lib/crypto/Makefile
> +++ b/lib/crypto/Makefile
> @@ -56,5 +56,7 @@ libblake2s-y                                  += blake2s-selftest.o
>  libchacha20poly1305-y                          += chacha20poly1305-selftest.o
>  libcurve25519-y                                        += curve25519-selftest.o
>  endif
>
>  obj-$(CONFIG_MPILIB) += mpi/
> +
> +obj-$(CONFIG_CRYPTO_MANAGER_EXTRA_TESTS)       += simd.o
> diff --git a/lib/crypto/simd.c b/lib/crypto/simd.c
> new file mode 100644
> index 0000000000000..9c36cb3bb49c4
> --- /dev/null
> +++ b/lib/crypto/simd.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SIMD testing utility functions
> + *
> + * Copyright 2024 Google LLC
> + */
> +
> +#include <crypto/internal/simd.h>
> +
> +DEFINE_PER_CPU(bool, crypto_simd_disabled_for_test);
> +EXPORT_PER_CPU_SYMBOL_GPL(crypto_simd_disabled_for_test);
>
> base-commit: 5c20772738e1d1d7bec41664eb9d61497e53c10e
> --
> 2.47.0
>

