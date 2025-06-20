Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F758C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlZH0l+Wf1bVanJ4bbEfo9R/bk9uY0/tSUsiGui4YeI=; b=rnoAGzfCAoLYMMhwQlaGorP9Qe
	vphBo44xASom615arvejmGCifj3kmfTbI1uZtvREg9VElAgzIjD+y/lGhdlDbpMe0Kv+3aKfJEsmN
	UuFQrEtCVY53NbErBBzkphg1Vz0pMxhZIHzHLoHJUmyLqsHmoOQ5xXtR6LFVThwyrc8rEzl4SKnTs
	zsC399XpjlFjRe8k6Jvw3wlIrsxta70lzek5zoRkcS2G4MiAUqXz7hfysKbbuuPFvLaghiZ3jAdt2
	3W5fJNRqT5MjtBMqSJ5xoS/0yNiacUqxndCxPclOqagJvnsLVTg/mSy22W9QJp9SSScFIo6IPr5gF
	68tqPEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjj0-0000000Gf72-06TB;
	Fri, 20 Jun 2025 21:56:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjSU-0000000Gd7G-3gNi;
	Fri, 20 Jun 2025 21:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 02C79615EC;
	Fri, 20 Jun 2025 21:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF15FC4CEF6;
	Fri, 20 Jun 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750455577;
	bh=HvoFMsnVPaebNolXyEd0amy4ilKaPCQCYOjaJT3HRfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jJfZU4Vlyv60JLf4iYDzXyYj/nNjhRcuRyHNx/9hf1bvjOsD/F3//RsHPhpBnMvu1
	 sHOuMaZNHrm1NP/OmRnsAsoiIfuN6NQdHRux1JYZKklSHFNo3QRkWEmGXQhA9bQ1Pt
	 7Je39+LmoAGcqvDoPPqBsDnIYV9O0mez0OCndPDKcLPSYZm4s9atUB+OzHNXTpIsWk
	 BFDevwltARm0TQJUc0KDj4xt99mrgD5pveawyhxsuMTTJtSOfhBaUXVRX8RtDN+haj
	 5jImxo/vKcxFVFTcWmRi9pN5JK/XeV0v4p2sCz/ECpyw8qTB0/Oo9ixY3eo5cEIrfp
	 Ycg1/VMY7bIYw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b16a0e38so2431877e87.1;
        Fri, 20 Jun 2025 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4ZnAP3bZw+peYN8pZVquAlcBHUGGM9BzJsR3SUaYPo9hnudsQkB5w11Lb6VSsqzRtjN4HE0VFrUzdzEEA9j2J@lists.infradead.org, AJvYcCXnsVpc76bJ2hcRnmUh+ElYoL9h7bXdjE0bSkEJalqyDWUln+ckzgnrvMOx0TKa9nIoNW0Kf6JVihpM6Xg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJvNUOSHpzHj4AV6PupjIxHjBwl527Vgcmf0l4bZlEGyR4849d
	DIbF/zwtkNzRXr5kVILtWpCDYaQQnLzzcru1wNeaxD4y1zDCBgnZ23WmDybXW3KVFiySxiV1Rra
	Q16bOvf0+1vE4XBUTTxrt4BGbbmH5YRA=
X-Google-Smtp-Source: AGHT+IFlzPdW/TAjB41pWNx+EWn0IQNKfWjtbAPkCDzwR/Cmxb5FPmWfpoRjKRGa+GebEYrhPkOrWG7ilfOzIslgaJA=
X-Received: by 2002:a05:6512:15a2:b0:553:510d:f464 with SMTP id
 2adb3069b0e04-553e3be0118mr1238378e87.25.1750455576146; Fri, 20 Jun 2025
 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250619191908.134235-1-ebiggers@kernel.org>
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 20 Jun 2025 23:39:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHMjG77Q9WxwqACekQNnEU0DdQPsamt5v5PjtmgguWDuw@mail.gmail.com>
X-Gm-Features: AX0GCFsPzv-r5KhW4GCiBgsxcKQ8jDKA8HBlXZ_WU75HnhkUOj_Q-bl9RCm5Y74
Message-ID: <CAMj1kXHMjG77Q9WxwqACekQNnEU0DdQPsamt5v5PjtmgguWDuw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to lib/crypto/$(ARCH)/
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
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

On Thu, 19 Jun 2025 at 21:22, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies on top of
> https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
> and is also available in git at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2
>
> This series moves the contents of arch/$(ARCH)/lib/crypto/ into
> lib/crypto/$(ARCH)/.
>
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
>
> This is just a preparatory series, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later patch series will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
>
> Changed in v2:
>    - Instead of keeping arch/*/lib/crypto/.gitignore, instead add entry
>      for now-removed crypto directory to arch/*/lib/.gitignore.
>    - Adjusted commit messages and titles.
>    - Added Reviewed-by.
>
> Eric Biggers (9):
>   lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
>   lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
>   lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
>   lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
>   lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
>   lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
>   lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
>   lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
>   MAINTAINERS: drop arch/*/lib/crypto/ pattern
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

