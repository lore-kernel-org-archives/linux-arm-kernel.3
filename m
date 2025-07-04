Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE39C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y67omdNsRzGiYfKThMM73Sspj4UJQkYkveftpUDTVCE=; b=HS2yUOC9jHmavWU9PIyl2lFczw
	B2WTAAh2UsSKKoF31vFyrbYA5F7PDyOoOJVGpMwAP7f88ksSUtskfDr5brLQT1uuxMw9Es3pdcG9m
	IoiLGQ82Dyn4hlvT0mXa+Ko8sv23fl1KTpagg+P9L9kbU2uwUXVA2B2nyCXLuALVokDd8PvfHdoSP
	mVLq/6pvROrE2NRcBo620EEJVyaZNqb6seLgpaneydp0QZ8oNWxUpz9xUNGMloaxj6CbfqHeQ81IL
	05OaaK4ddSwIXW3tcFDg06oZrscGP70pJqTeBzt1u0WCePBCbCkjhJ5DaiwVBjXibeVFYjNKubvtz
	uewx19dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXglK-0000000EZGZ-3uzB;
	Fri, 04 Jul 2025 13:47:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgRZ-0000000EVpv-1uyl;
	Fri, 04 Jul 2025 13:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 793516145A;
	Fri,  4 Jul 2025 13:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31645C4AF09;
	Fri,  4 Jul 2025 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751635628;
	bh=UmMK4vWBWCkUTxLdUKXC8/KSjdp8rccHH64kZT4FmmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lu0fEi+gQsq8IUwn6EEfu/eI1rogJbit7P7CqTe0KP86Hy+4bXK37MxUdwohdMj7J
	 BIljCNK7dh5Q+/SSrlI6W10bclsGAg7d7FkAeKju8IDrpBStrpPkZnkXRG4yB7rO6+
	 McdqYfs4MnyQ0tuim5erEKaX0MenHVTu+HbQVW6J5lRzj2AxzinKbWZG9k0qsR0/lZ
	 7bZdRuTweHSHHVfLL/y8T0loZmktCIhTCXGmjmKvBZ1sMpdPKBNCUEcAOVg/OKR0QN
	 0qE28/95dJUOrDVnsJuKAdTEjv1KZ57WKoL0GJxEIF4hRZDjNS2Np6UYRK2EU3VxUm
	 sJKGqlCd7WAtA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1245124e87.0;
        Fri, 04 Jul 2025 06:27:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC0Jgg8KTF1qCKZgViE2Y5xGInPLJRkajCH34u3801s4cULvRx0KTh45euNeGh8/L0155ij3eKSDXTVNE=@lists.infradead.org, AJvYcCXnTQlZ3ZckDxFgi2vWZVqeqUDb4oQ6//TZDkF7ISdJZeAItRBpQP0njI9xBwFAlcDB4bOJXgHNbJiQRkH7QfK4@lists.infradead.org
X-Gm-Message-State: AOJu0YypUiWI/LeVHhRINaHcRHVkqaaVgglD52xUAJ2Tq+h452taDoH1
	lLZFQBKcOa+PVtac3aB05jYqwIADoOA0YSUT+CMM+SQrr7YwWAq+hAOKWJBK2PYH4dZEPFZgN5H
	qtORYx5HpHHSan/sY7bXhYeDWbZzpyyk=
X-Google-Smtp-Source: AGHT+IHbXsSqxiQQgTganngCHyLYaDZCz1QOmHZXPSAjSWrJrmUK1ng5PlRRa0qT4YG3miebycXJXkcbsNGhKOePUQw=
X-Received: by 2002:a05:6512:3da6:b0:553:d8ca:4fcb with SMTP id
 2adb3069b0e04-556dbf81a40mr784811e87.21.1751635626524; Fri, 04 Jul 2025
 06:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250630160645.3198-1-ebiggers@kernel.org>
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Jul 2025 15:26:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGTSfgVoqpmC=5z1kuAHw_JXo=rCEEFy4tRJdwAb2ExZA@mail.gmail.com>
X-Gm-Features: Ac12FXyPp6fnvKb4WZAS9lUDfLS7Jj9PzhxOzqBaJq_NKIJbrn4XwJZRpCZIh-c
Message-ID: <CAMj1kXGTSfgVoqpmC=5z1kuAHw_JXo=rCEEFy4tRJdwAb2ExZA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] SHA-256 library improvements
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
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

On Mon, 30 Jun 2025 at 18:09, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2
>
> This series improves the SHA-224 and SHA-256 library code to be
> consistent with what I did for SHA-384 and SHA-512.  This includes:
>
> - Use stronger typing in the SHA-224 and SHA-256 functions.
>
> - Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
>   patch with KUnit test cases for this.)
>
> - Make the old-school crypto API's support for sha224 and sha256 just
>   use the actual library API, instead of unsafe low-level functions.
>
> - Consolidate the CPU-based SHA-224 and SHA-256 code into a single
>   module, with better inlining and dead code elimination.
>
> - Properly document the SHA-224 and SHA-256 functions.
>
> - Other changes to synchronize the code with SHA-384 and SHA-512.
>
> Changed in v2:
> - Dropped sha224_kunit.c changes; it will be added later in the history
> - Dropped some patches that I folded into the SHA-512 series
> - Removed redundant checks of IS_ENABLED(CONFIG_KERNEL_MODE_NEON)
> - Removed obsolete setting of -DARCH for sha256.o
> - Fixed a commit title to mention sha256 instead of sha512
> - Excluded HMAC-SHA{224,256} code from purgatory, where it isn't needed
>
> Eric Biggers (14):
>   libceph: Rename hmac_sha256() to ceph_hmac_sha256()
>   cxl/test: Simplify fw_buf_checksum_show()
>   lib/crypto: sha256: Reorder some code
>   lib/crypto: sha256: Remove sha256_blocks_simd()
>   lib/crypto: sha256: Add sha224() and sha224_update()
>   lib/crypto: sha256: Make library API use strongly-typed contexts
>   lib/crypto: sha256: Propagate sha256_block_state type to
>     implementations
>   lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
>   crypto: sha256 - Wrap library and add HMAC support
>   crypto: sha256 - Use same state format as legacy drivers
>   lib/crypto: sha256: Remove sha256_is_arch_optimized()
>   lib/crypto: sha256: Consolidate into single module
>   lib/crypto: sha256: Sync sha256_update() with sha512_update()
>   lib/crypto: sha256: Document the SHA-224 and SHA-256 API
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


>  arch/mips/cavium-octeon/Kconfig               |   6 -
>  arch/mips/cavium-octeon/crypto/Makefile       |   1 -
>  arch/riscv/purgatory/purgatory.c              |   8 +-
>  arch/s390/purgatory/purgatory.c               |   2 +-
>  arch/x86/purgatory/purgatory.c                |   2 +-
>  crypto/Kconfig                                |   4 +-
>  crypto/Makefile                               |   1 -
>  crypto/sha256.c                               | 371 +++++++++-------
>  crypto/testmgr.c                              |  12 +
>  drivers/char/tpm/tpm2-sessions.c              |  12 +-
>  drivers/crypto/img-hash.c                     |   4 +-
>  drivers/crypto/starfive/jh7110-hash.c         |   8 +-
>  include/crypto/internal/sha2.h                |  66 ---
>  include/crypto/sha2.h                         | 390 +++++++++++++++--
>  kernel/kexec_file.c                           |  10 +-
>  lib/crypto/Kconfig                            |  34 +-
>  lib/crypto/Makefile                           |  39 +-
>  lib/crypto/arm/Kconfig                        |   7 -
>  lib/crypto/arm/Makefile                       |   8 +-
>  lib/crypto/arm/sha256-armv4.pl                |  20 +-
>  lib/crypto/arm/sha256-ce.S                    |   2 +-
>  lib/crypto/arm/sha256.c                       |  64 ---
>  lib/crypto/arm/sha256.h                       |  46 ++
>  lib/crypto/arm64/Kconfig                      |   6 -
>  lib/crypto/arm64/Makefile                     |   9 +-
>  lib/crypto/arm64/sha2-armv8.pl                |   2 +-
>  lib/crypto/arm64/sha256-ce.S                  |   2 +-
>  lib/crypto/arm64/sha256.c                     |  75 ----
>  lib/crypto/arm64/sha256.h                     |  57 +++
>  lib/crypto/arm64/sha512.h                     |   6 +-
>  .../crypto/mips/sha256.h                      |  20 +-
>  lib/crypto/powerpc/Kconfig                    |   6 -
>  lib/crypto/powerpc/Makefile                   |   3 -
>  lib/crypto/powerpc/{sha256.c => sha256.h}     |  19 +-
>  lib/crypto/riscv/Kconfig                      |   8 -
>  lib/crypto/riscv/Makefile                     |   3 -
>  .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   2 +-
>  lib/crypto/riscv/sha256.c                     |  67 ---
>  lib/crypto/riscv/sha256.h                     |  42 ++
>  lib/crypto/s390/Kconfig                       |   6 -
>  lib/crypto/s390/Makefile                      |   3 -
>  lib/crypto/s390/sha256.c                      |  47 --
>  lib/crypto/s390/sha256.h                      |  28 ++
>  lib/crypto/sha256-generic.c                   | 138 ------
>  lib/crypto/sha256.c                           | 413 ++++++++++++++++--
>  lib/crypto/sparc/Kconfig                      |   8 -
>  lib/crypto/sparc/Makefile                     |   4 -
>  lib/crypto/sparc/{sha256.c => sha256.h}       |  37 +-
>  lib/crypto/x86/Kconfig                        |   8 -
>  lib/crypto/x86/Makefile                       |   3 -
>  lib/crypto/x86/sha256-avx-asm.S               |   2 +-
>  lib/crypto/x86/sha256-avx2-asm.S              |   2 +-
>  lib/crypto/x86/sha256-ni-asm.S                |   2 +-
>  lib/crypto/x86/sha256-ssse3-asm.S             |   2 +-
>  lib/crypto/x86/sha256.c                       |  80 ----
>  lib/crypto/x86/sha256.h                       |  55 +++
>  net/ceph/messenger_v2.c                       |  12 +-
>  tools/testing/cxl/test/mem.c                  |  21 +-
>  58 files changed, 1307 insertions(+), 1008 deletions(-)
>  delete mode 100644 include/crypto/internal/sha2.h
>  delete mode 100644 lib/crypto/arm/sha256.c
>  create mode 100644 lib/crypto/arm/sha256.h
>  delete mode 100644 lib/crypto/arm64/sha256.c
>  create mode 100644 lib/crypto/arm64/sha256.h
>  rename arch/mips/cavium-octeon/crypto/octeon-sha256.c => lib/crypto/mips/sha256.h (76%)
>  rename lib/crypto/powerpc/{sha256.c => sha256.h} (76%)
>  delete mode 100644 lib/crypto/riscv/sha256.c
>  create mode 100644 lib/crypto/riscv/sha256.h
>  delete mode 100644 lib/crypto/s390/sha256.c
>  create mode 100644 lib/crypto/s390/sha256.h
>  delete mode 100644 lib/crypto/sha256-generic.c
>  delete mode 100644 lib/crypto/sparc/Kconfig
>  delete mode 100644 lib/crypto/sparc/Makefile
>  rename lib/crypto/sparc/{sha256.c => sha256.h} (53%)
>  delete mode 100644 lib/crypto/x86/sha256.c
>  create mode 100644 lib/crypto/x86/sha256.h
>
> --
> 2.50.0
>

