Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DDFD185DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkEDjCTgjcG1N4pMu7OE1VqtJd5WSLxPjSWKunpWPTk=; b=FUkwukcU6Tq4Uj6FPDruqjNPRL
	hw/B3ysD825V+N6tn+vmonWRf0GhoCt081I+9g4y+5AeL0tkSfDVChA8ePaitbldRH9IYswjoDfvf
	WAJ6+kmBCzDIrWK3cngaws40jdneB32U7oG0N9t39GSR4sWitpKxM8ViHLU+ZsSyb4KJETu+Nk+jl
	2Yrdpx7Yquc6hY6zDbF0aXckT1jL1ET5gGv4IlNXG1hg5AiLhYJbPb0h0c4E5DAkn+vGd7YeNnWuu
	ffUv2EwQBfKRIByL3h+SoaFWb/k+pHmurB9v94oY6HIHBt2uRubWfAz1Fpvi4WXSkjy8H9Qxs/hp9
	w2X5tssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoFS-0000000Gr8P-1x8k;
	Thu, 08 Jan 2026 11:32:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoFR-0000000Gr82-3RJs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:32:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A697060140
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 11:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DED6C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871932;
	bh=pYfshooaQVx14ogaTwRBPlNZFkj/iWvrj8HN1katBFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tt8VmR3VshCgHL0sX0ZHoLqIfD0Rl3cLJfl1ZhoX+viQNalklsP3KEGhmpF2PQABL
	 i/e4fQeEWCP3E8UrGxvJAz3JuiRdFBXe9UimxMdTmRlLsZNu/U5vTUEyP7Ks+4qkxU
	 XxkejKAY6NBLbl/r1AsLAyAnuNWCjV0RjM7is+V+ou17Bcc2h2b/jwV3sTJ8RfZ0mU
	 5QCe8I5A9kvK9DS1HJ9oD7trUK76a+ekfIJRJLeJFGPYGgEycSjFxndrstt2RPdvCq
	 g0kCEYTkOBwHO0b6P+CdVWNXzaaTEiF2vxlnRRUwhG5MIv4f5YIZKepkz/7OWtnjS/
	 F/DxUh7mTqQMQ==
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c868b197eso2863202a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 03:32:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPFIi09CTwAGT38riSr174P8mpNTumgPIwxWqlAUxOcZMBc/j66vA12ALMsKw5nV1NcLMJZUfHrRQ7sNsaUj4j@lists.infradead.org
X-Gm-Message-State: AOJu0YyqpiJQcK9mTDmzyHKhUj3IEo/NSjoxldbgf4yle1jetmliqdoW
	/LppGesPJQ0nwO7pP6rQJQvED9gCKjR+tAZbMy7akVU0IWW8u8pDC5sSAKzC9TdJaeqSvIniDgh
	BdpIHmSvFnLRWHZ89ppF0YuGbzNG/G+s=
X-Google-Smtp-Source: AGHT+IGDINyxTPkhAN4b7317PDsO1QtIqu1Y45mlnouNM/WvPFlwsh7kX9R86h9783kJT5r1JA/b7Ab2jLcoi2FXZJU=
X-Received: by 2002:a17:90b:4c46:b0:34c:f92a:ad05 with SMTP id
 98e67ed59e1d1-34f68b9a0ffmr5904349a91.11.1767871931935; Thu, 08 Jan 2026
 03:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20260105051311.1607207-1-ebiggers@kernel.org>
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Jan 2026 12:32:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
X-Gm-Features: AQt7F2osJiUBFnBRtOlALeERCnUAMf6rielCvEbX7HMdjqJIXrz86eWJVpNeDcU
Message-ID: <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
Subject: Re: [PATCH 00/36] AES library improvements
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Holger Dengler <dengler@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>
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

On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies to libcrypto-next.  It can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
>
> This series makes three main improvements to the kernel's AES library:
>
>   1. Make it use the kernel's existing architecture-optimized AES code,
>      including AES instructions, when available.  Previously, only the
>      traditional crypto API gave access to the optimized AES code.
>      (As a reminder, AES instructions typically make AES over 10 times
>      as fast as the generic code.  They also make it constant-time.)
>
>   2. Support preparing an AES key for only the forward direction of the
>      block cipher, using about half as much memory.  This is a helpful
>      optimization for many common AES modes of operation.  It also helps
>      keep structs small enough to be allocated on the stack, especially
>      considering potential future library APIs for AES modes.
>
>   3. Replace the library's generic AES implementation with a much faster
>      one that is almost as fast as "aes-generic", while still keeping
>      the table size reasonably small and maintaining some constant-time
>      hardening.  This allows removing "aes-generic", unifying the
>      current two generic AES implementations in the kernel tree.
>

Architectures that support memory operands will be impacted by
dropping the pre-rotated lookup tables, especially if they have few
GPRs.

I suspect that doesn't really matter in practice: if your pre-AESNI
IA-32 workload has a bottleneck on "aes-generic", you would have
probably moved it to a different machine by now. But the performance
delta will likely be noticeable so it is something that deserves a
mention.

> (1) and (2) end up being interrelated: the existing
> 'struct crypto_aes_ctx' does not work for either one (in general).
> Thus, this series reworks the AES library to be based around new data
> types 'struct aes_key' and 'struct aes_enckey'.
>
> As has been the case for other algorithms, to achieve (1) without
> duplicating the architecture-optimized code, it had to be moved into
> lib/crypto/ rather than copied.  To allow actually removing the
> arch-specific crypto_cipher "aes" algorithms, a consolidated "aes-lib"
> crypto_cipher algorithm which simply wraps the library is also added.
> That's most easily done with it replacing "aes-generic" too, so that is
> done too.  (That's another reason for doing (3) at the same time.)
>
> As usual, care is taken to support all the existing arch-optimized code.
> This makes it possible for users of the traditional crypto API to switch
> to the library API, which is generally much easier to use, without being
> concerned about performance regressions.
>
> That being said, this series only deals with the bare (single-block) AES
> library.  Future patchsets are expected to build on this work to provide
> architecture-optimized library APIs for specific AES modes of operation.
>
> Eric Biggers (36):
>   crypto: powerpc/aes - Rename struct aes_key
>   lib/crypto: aes: Introduce improved AES library
>   crypto: arm/aes-neonbs - Use AES library for single blocks
>   crypto: arm/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
>   crypto: arm64/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
>   crypto: arm64/aes - Select CRYPTO_LIB_SHA256 from correct places
>   crypto: aegis - Switch from crypto_ft_tab[] to aes_enc_tab[]
>   crypto: aes - Remove aes-fixed-time / CONFIG_CRYPTO_AES_TI
>   crypto: aes - Replace aes-generic with wrapper around lib
>   lib/crypto: arm/aes: Migrate optimized code into library
>   lib/crypto: arm64/aes: Migrate optimized code into library
>   lib/crypto: powerpc/aes: Migrate SPE optimized code into library
>   lib/crypto: powerpc/aes: Migrate POWER8 optimized code into library
>   lib/crypto: riscv/aes: Migrate optimized code into library
>   lib/crypto: s390/aes: Migrate optimized code into library
>   lib/crypto: sparc/aes: Migrate optimized code into library
>   lib/crypto: x86/aes: Add AES-NI optimization
>   crypto: x86/aes - Remove the superseded AES-NI crypto_cipher
>   Bluetooth: SMP: Use new AES library API
>   chelsio: Use new AES library API
>   net: phy: mscc: macsec: Use new AES library API
>   staging: rtl8723bs: core: Use new AES library API
>   crypto: arm/ghash - Use new AES library API
>   crypto: arm64/ghash - Use new AES library API
>   crypto: x86/aes-gcm - Use new AES library API
>   crypto: ccp - Use new AES library API
>   crypto: chelsio - Use new AES library API
>   crypto: crypto4xx - Use new AES library API
>   crypto: drbg - Use new AES library API
>   crypto: inside-secure - Use new AES library API
>   crypto: omap - Use new AES library API
>   lib/crypto: aescfb: Use new AES library API
>   lib/crypto: aesgcm: Use new AES library API
>   lib/crypto: aes: Remove old AES en/decryption functions
>   lib/crypto: aes: Drop "_new" suffix from en/decryption functions
>   lib/crypto: aes: Drop 'volatile' from aes_sbox and aes_inv_sbox
>

Nice cleanup

Acked-by: Ard Biesheuvel <ardb@kernel.org>

