Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9F2C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4Dlg5dcsRBZhoxPKU7Go31IFMG3GVW7aWlQyuz8bO0=; b=UHov10JzUOjTjfvTLU/9R7rfPR
	1o1QUJI4M020oCiSifyQHTMDxyKx57IpsdIXHi1z75si2wje/bPjRZICIIgHqQwTlSwBiTrVud+RY
	RQ0YCCtVeLPe7bt/kVs38nBnQagZkJA7NYWlppHN8zhAZz92yivDh7Wxg1TS6D6op3DE7nN9HlUuN
	Acxr59m+zOh3ZQYxso4QA3LqqOxq/LoBLMCXcfVcmq2egG/Pd3UeTH4P0Aw3xBqunVPiNVuvuqr7J
	14g7gWcUYFq+sk9G1B+2i8uW9pd3iOm39m/IXVwnwSeyuNeYIa3JoXowfFnsHH38nJs9Lp0zTFDH5
	BV7fhAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bXN-00000001mXC-2Qa0;
	Sat, 26 Apr 2025 09:09:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bVV-00000001mEM-1Itr;
	Sat, 26 Apr 2025 09:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FEB65C2E18;
	Sat, 26 Apr 2025 09:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D341AC4CEE2;
	Sat, 26 Apr 2025 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658451;
	bh=buxmpgDAU4rRbUrUPrakdwPyAA4SBheAoAn/RaFjaNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iYe4NFoqbzJakUpL2a1Z/LN3jzqaUq3m6wX0mgOsNE5ArZ4gofJSd8kuzzJT3onf0
	 AMZpNsMuzVXzozYox/DJP43JL4hqOFx+ePjSNd3izsSNh1nZM2FRWCce5N6SJ6mB8q
	 g7jWvIAsVsfdLVGGw3mtHpy2kkervKAITav/mDRs9sjA/BD31/hfiINg1qSF3yPh8H
	 ggkYKUwDEZR/B3U6IXkxzVGkg5keeio1nepI5b33Wx12arJP1JxFTE8Ji+/Mw+Ixih
	 YYPIbYNHWO2BtHIzeqkjvEn6Pn3QzfwLsMOL0L1MvDR7qPjgaPEak/fMXmQ8o+hqds
	 ckFe2FpwoO/gQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso3957924e87.1;
        Sat, 26 Apr 2025 02:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRjOuFZSmZIrndgzNVE+RAeSRTe7pZeM87UBY0p82buQ0vZQum1Nd6abhTP6bRiwiO0bnfwxjktR37fh8=@lists.infradead.org, AJvYcCX3Ncwux8viz+kQPod2YywSRBARhSoFQwIZOetojt2E+ihUkc1f73vjMoF2/FOz0RbFE30KxzfbNJqSHYZ7tUV4@lists.infradead.org
X-Gm-Message-State: AOJu0YyRS9Nd9ucKFjVCKG3odnGAIZn9LrTHZ0/NTYXq35kTXPk58qQh
	hOAA5fFdF2dRuYPPlN6MUMOncUDsJOAxTpxSMJBcX/XggWADwU2PSHe6Kclc7RuJOsOUSFlcOJi
	HuQepcXv8UY9gDgbdp/0OTLJ6Dlc=
X-Google-Smtp-Source: AGHT+IGJ8kVblFjzzc4iKrNwvB8Li0uKGxlh3w81ehqTxUdVSkCQSygCbDPyUqy8FGBbbYlDPRasDsnkAI7N2GRBzdk=
X-Received: by 2002:a05:6512:308c:b0:54e:81ec:2c83 with SMTP id
 2adb3069b0e04-54e8cbd5977mr1469007e87.18.1745658450215; Sat, 26 Apr 2025
 02:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org> <20250426065041.1551914-5-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 26 Apr 2025 11:07:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE1BKGspnSmqFJkqLCMMT+j=ZHEngKqcdOJsQ-LkyQdMg@mail.gmail.com>
X-Gm-Features: ATxdqUGaw6rq_tP-WceTvDry4j7gdc2ygQ9IvUcCsDooEKyi9c3QpD_gnY-Uz9Q
Message-ID: <CAMj1kXE1BKGspnSmqFJkqLCMMT+j=ZHEngKqcdOJsQ-LkyQdMg@mail.gmail.com>
Subject: Re: [PATCH 04/13] crypto: arm64/sha256 - implement library instead of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_020733_432690_BE69B5C2 
X-CRM114-Status: GOOD (  16.71  )
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

On Sat, 26 Apr 2025 at 08:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.
>
> Remove support for SHA-256 finalization from the ARMv8 CE assembly code,
> since the library does not yet support architecture-specific overrides
> of the finalization.  (Support for that has been omitted for now, for
> simplicity and because usually it isn't performance-critical.)
>

This is fine - when I added this, kernel mode neon on arm64 would
eagerly preserve and restore the FP/SIMD state every time, but this is
no longer the case.


> To match sha256_blocks_arch(), change the type of the nblocks parameter
> of the assembly functions from int or 'unsigned int' to size_t.  Update
> the ARMv8 CE assembly function accordingly.  The scalar and NEON
> assembly functions actually already treated it as size_t.
>
> While renaming the assembly files, also fix the naming quirks where
> "sha2" meant sha256, and "sha512" meant both sha256 and sha512.
>

Good idea. Note that the ARM architecture's SHA2 extension only
supports SHA256 not SHA512 (which is a separate extension), so this is
where the confusion came from.


> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/configs/defconfig                  |   1 -
>  arch/arm64/crypto/Kconfig                     |  19 ---
>  arch/arm64/crypto/Makefile                    |  13 +-
>  arch/arm64/crypto/sha2-ce-glue.c              | 138 ----------------
>  arch/arm64/crypto/sha256-glue.c               | 156 ------------------
>  arch/arm64/lib/crypto/.gitignore              |   1 +
>  arch/arm64/lib/crypto/Kconfig                 |   5 +
>  arch/arm64/lib/crypto/Makefile                |   9 +-
>  .../crypto/sha2-armv8.pl}                     |   0
>  .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  36 +---
>  arch/arm64/lib/crypto/sha256.c                |  75 +++++++++
>  11 files changed, 98 insertions(+), 355 deletions(-)
>  delete mode 100644 arch/arm64/crypto/sha2-ce-glue.c
>  delete mode 100644 arch/arm64/crypto/sha256-glue.c
>  rename arch/arm64/{crypto/sha512-armv8.pl => lib/crypto/sha2-armv8.pl} (100%)
>  rename arch/arm64/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (80%)
>  create mode 100644 arch/arm64/lib/crypto/sha256.c
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

