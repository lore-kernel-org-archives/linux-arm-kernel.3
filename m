Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA671C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7otYQkhSPVClqPTRaaXBhR3R6V+XpPmQA0pG1EymO4=; b=3diAqc//f8g3o9a2LRI2CrQ7gu
	rUmm1daIzFoIJ9fuTu51VaQgblKfySOJhmWJyAeVVvIHkocQeT7z4cCTTLOJCoPHGdQJHq7903eXl
	irNkV/hsQ4U1DmQCAZ08pJlXxLuppJf1vi1nvicU84WylAsKDd8mRQ2f1QHw8EfKCh1pylejJ9SEc
	re/vZs3MEL9FL8s4l/kO8N/UBgyp4TLyBIM5Um8cxxTB8ny1pZK5jLyR/T+JThbS6AC4EUveyLa+K
	rnB1SLx1YuySo9WgQuvFWlzkX3yoXTUYsGKWAuTsDPNbmgRTLvIViJo8d4XByhvtp8PzA4PHxnDBp
	E+rw1lOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjlD-0000000Gfa3-1Jhr;
	Fri, 20 Jun 2025 21:58:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjVA-0000000Gdes-22pg;
	Fri, 20 Jun 2025 21:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0DCC5C5420;
	Fri, 20 Jun 2025 21:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFB1C4AF0B;
	Fri, 20 Jun 2025 21:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750455743;
	bh=MDo5BKeBcgPmn7NbWD5LBoZwmlxlCqcmLzLHc7Iu6cI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sKmi1RUPHyAecYUQbi/pwabxNAlkzVrYy6AqvldSnOqjnXiM9ah+WBuLx7p589i8B
	 Go9hOZzmo6SL1mXIwf5oNijBXoOkBIpS4Bddo1vN5mK5C3J94IcjGCIDbwax1Cslxr
	 Am4iJZS1nWf2FLdVmjPKpNrcv9keYcbFNRfgqiCusKYbwnqb03m793abgSaehaySoe
	 +7xY52/d6D2lfCxehbI7Efw3pPUcbBESZp1+/9FIoJaHnRh7uNLOG8VETApljsEq5E
	 UHT44cYBnfsXUJ3v1R6G2oLonLdTTDn7UZNm5+n0E0fzknE2tlOPILY8j0ROsnY5PG
	 MW6O2Q8TSWK6g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so2522673e87.1;
        Fri, 20 Jun 2025 14:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhcX9ON+lMTFPcsgCcw447yyvnnBWw6UllyK0FxqVHZZtNo4EA/srTfGoNlum7v9DdhkGX7o9tYztSOrX+E6pr@lists.infradead.org, AJvYcCXtOEfNd8Ke+GItMcXl2f1fbVvWCHADS8ZS477jtKG6DJ84oZtLmoQDM3yhS6OZnGPfK+lOri0KO1KQa9E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiuNxBLrfNRDww160ifrG7epREfMn7hZV0EfLLl4UaEZOinCHH
	2a5QeOmX2tYunCBAhFfQlSYFLwj5jkycH205ui1e09nTQCaF4oCD5gBgWCbewZWTYeMAAPiJ2jm
	f+o40Qa1FyKTLYiuUnz2GLCpCgyFqBDI=
X-Google-Smtp-Source: AGHT+IF4zL8HzdSoyp3X55tccHF1RCClcd5RW2imn5+lno/a8Scx+LS0VpX+b6I1a2EEkQVz388BFVI8Z0Ese3QFfg0=
X-Received: by 2002:a05:6512:3f22:b0:553:a32a:6c2 with SMTP id
 2adb3069b0e04-553e3b99756mr1583899e87.6.1750455741405; Fri, 20 Jun 2025
 14:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org>
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 20 Jun 2025 23:42:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEun-5OnM9tUEkG31aHjhAJn=fXrdQTqSJTBC1idZhoqQ@mail.gmail.com>
X-Gm-Features: AX0GCFv7xLQ-CGFr1i8AgPSK06Jy3OHs0QlN0RpC7Mpe2EtNiMuW6iQTuZTZV3s
Message-ID: <CAMj1kXEun-5OnM9tUEkG31aHjhAJn=fXrdQTqSJTBC1idZhoqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_144224_599021_24544772 
X-CRM114-Status: GOOD (  27.71  )
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

On Mon, 16 Jun 2025 at 03:41, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies to v6.16-rc1 and is targeting the libcrypto-next
> tree.  It is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v2
>
> This series adds support for SHA-384, SHA-512, HMAC-SHA384, and
> HMAC-SHA512 to lib/crypto/.  The new functions take advantage of the
> kernel's existing architecture-optimized implementations of the SHA-512
> compression function.  The new functions are fully tested using KUnit.
>
> To avoid duplicating all arch-optimized implementations of the SHA-512
> compression function (~3000 lines of code total), they are moved into
> lib/crypto/ rather than copied.  To make the "sha384", "sha512",
> "hmac(sha384)", and "hmac(sha512)" crypto_shash algorithms in the
> old-school crypto API continue to be properly optimized after that, they
> are reimplemented on top of lib/crypto/, which is straightforward.
>
> The following lists some of the design choices and conventions that I've
> followed in more detail.  Where these differ from the code or APIs for
> other algorithms (e.g., SHA-256 in some cases), I'd like to do it this
> way going forward and plan to fix up the other algorithms accordingly:
>
> - APIs are fully documented with kerneldoc comments.
>
> - APIs cannot fail, and return void.
>
> - APIs work in all contexts.  This doesn't mean that they *should* be
>   called in all contexts, but rather they always just work as expected.
>
> - Tests are KUnit tests, and they are fairly thorough (more thorough
>   than crypto/testmgr.c) and also optionally include benchmarks.
>
> - Architecture-optimized code is integrated the same way I'm doing it
>   for lib/crc/: it's in subdirectories lib/crypto/$(SRCARCH), it's
>   enabled by default, and it's inlined into the same module as the
>   generic code.  This solves a number of problems; for more details, see
>   https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org
>
> - HMAC support is a first-class citizen.
>
> - APIs handle zeroization, when applicable.
>
> - Message contexts are *_ctx instead of *_state.  It's shorter, avoids
>   ambiguity with the compression function state, and matches OpenSSL.
>
> - Length arguments are size_t, are in bytes, are named len or *_len, and
>   immediately follow the corresponding buffer.  "Object" being operated
>   on is first argument; outputs otherwise follow inputs.
>
> - The structures for different algorithms use different types, which
>   prevents usage errors where functions are mixed up between algorithms.
>
> - The compression function state is strongly typed, not a plain array.
>
> Changed in v2:
> - Added "crypto: sha512 - use same state format as legacy drivers"
> - Fixed build on user-mode Linux
> - Fixed W=1 build warning by adding <linux/export.h>
> - Optimized __sha512_final() and __hmac_sha512_final() slightly
>
> Eric Biggers (17):
>   crypto: sha512 - rename conflicting symbols
>   lib/crypto/sha512: add support for SHA-384 and SHA-512
>   lib/crypto/sha512: add HMAC-SHA384 and HMAC-SHA512 support
>   lib/crypto/sha512: add KUnit tests for SHA-384 and SHA-512
>   lib/crypto/sha256: add KUnit tests for SHA-224 and SHA-256
>   crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
>   crypto: sha512 - replace sha512_generic with wrapper around SHA-512
>     library
>   crypto: sha512 - use same state format as legacy drivers
>   lib/crypto/sha512: migrate arm-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate arm64-optimized SHA-512 code to library
>   mips: cavium-octeon: move octeon-crypto.h into asm directory
>   lib/crypto/sha512: migrate mips-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate riscv-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate s390-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate sparc-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate x86-optimized SHA-512 code to library
>   crypto: sha512 - remove sha512_base.h
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

