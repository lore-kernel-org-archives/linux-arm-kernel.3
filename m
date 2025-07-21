Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248E2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7lUpIEefUmmrWqmJv3Tjih6glIRGMFj6NQlhIQp5iA=; b=jWK/anmgDgsSvVooDj9QHlM00Y
	OxEdXy+b6+HB3/Hwgi9loHxp14GiPZkwZz4Uwm65EK2CPDJZey2is65T8o088113pHOcUoXqLKuJa
	FjHC6bXR9KMoKtmyxbub1P8EWWVxMPiYaFHTsTKZAK2mwf8Pn1ncXfIevenz2SUMnAtz9a9HDY08P
	zW1fCUDPa0w/yMBuXFMfVTyJ+8tunqopjeZIMIr31N30KeEoxNKcSjkJqnr/cb6Dy9Mgac7OIBftE
	OaVz1Lcp69Q6CT+GW2WS1ihWlLOCUi3Fh1i/CgD6fbHBdzzHFRULOHLVvgQobA9hR6AEawIR4HTrE
	drWqbE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhT7-0000000G7RG-0Zi4;
	Mon, 21 Jul 2025 03:45:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhG4-0000000G6LA-0m6B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FBDA5C5A0D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 03:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CC3C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 03:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753068725;
	bh=5vGNU3/VpvbOaw9Es6KWgWMC2qfsaJtRyTifOvfm/G0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L7CFg5tIKouQ5MZ7XvPuD9A5DhP1TDS/o22rImL596mOzORI6rsrpw/hMLnZktogH
	 bmS6olMgLAuJup6pFHb6SFkBlcOjn4NErjQN7YFFl6s45bUvjXt1R2NKdygMlNYuS1
	 EhIIFPVjR5UeiMd2lMPb0tJ4xbBCVwP4z93IzL8qH8oRZgCvxn9RgF43FrFJQ/OCg0
	 6SsL/X3z7r4Q1stmdX/m26AO98JjsTgcRfeicZSPBItG4OC06NtdQIuEDyfeldBgO1
	 hS/o87uHIupGMRMg4r4Ag8cO+HfRucByCJolNl1S8L4PW2q/Ta5XbP2+cDozWYGgJk
	 IYU8e4Ch0MX2Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553c31542b1so3368393e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 20:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+lErbOM+808JUBWvRzTgZq18cHzVWIqqEtSNOurQkVyXflxUFldeHZCs6XhUAyQIw8/JH4b1cdpMyQWqt4EyV@lists.infradead.org
X-Gm-Message-State: AOJu0YyCaeQPLMKYK9ieoo+XUQvPIiSYC00ZHGgoIIHhERuZZAUI+Yp8
	OrwAju/FfYYq0PVi90ytPg/D7U9SqNJfiZ/vJ9QbaCRTDyqaTvFa6tl25K1nA/putB+RebrTNT8
	0McAGvNlxNWSX2HrIQhMtutq4GE5vcaE=
X-Google-Smtp-Source: AGHT+IE4SN0JuNh3roM0ETQFLsVy/x2AhxAGEyYBRRpy0Dw80fhA3MNnUViddOKGY2zlXrfAeWMcNUbQETOHytAj6HA=
X-Received: by 2002:a05:6512:110a:b0:550:e3de:63bc with SMTP id
 2adb3069b0e04-55a23f1c0e6mr4537830e87.25.1753068724220; Sun, 20 Jul 2025
 20:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250718220706.475240-1-ebiggers@kernel.org>
In-Reply-To: <20250718220706.475240-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 21 Jul 2025 13:31:47 +1000
X-Gmail-Original-Message-ID: <CAMj1kXG8rEGH9suNf+s26174-SDrVWaV3RcuY53ysiBbrJtKUQ@mail.gmail.com>
X-Gm-Features: Ac12FXx9Y8-gcXuH-ruBlTGuUo6bmhA8vXdtqeYbUG7cHBHU_pt46u8LrNVoH2k
Message-ID: <CAMj1kXG8rEGH9suNf+s26174-SDrVWaV3RcuY53ysiBbrJtKUQ@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: arm64/sha512-ce: Drop compatibility macros
 for older binutils
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_203208_307099_8B0F3253 
X-CRM114-Status: GOOD (  22.15  )
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

On Sat, 19 Jul 2025 at 08:07, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Now that the oldest supported binutils version is 2.30, the macros that
> emit the SHA-512 instructions as '.inst' words are no longer needed.  So
> drop them.  No change in the generated machine code.
>
> Changed from the original patch by Ard Biesheuvel:
> (https://lore.kernel.org/r/20250515142702.2592942-2-ardb+git@google.com):
>  - Reduced scope to just SHA-512
>  - Added comment that explains why "sha3" is used instead of "sha2"
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

Nit below

> ---
>
> This patch is targeting libcrypto-next
>
>  lib/crypto/arm64/sha512-ce-core.S | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/lib/crypto/arm64/sha512-ce-core.S b/lib/crypto/arm64/sha512-ce-core.S
> index 7d870a435ea38..eaa485244af52 100644
> --- a/lib/crypto/arm64/sha512-ce-core.S
> +++ b/lib/crypto/arm64/sha512-ce-core.S
> @@ -10,30 +10,17 @@
>   */
>
>  #include <linux/linkage.h>
>  #include <asm/assembler.h>
>
> -       .irp            b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
> -       .set            .Lq\b, \b
> -       .set            .Lv\b\().2d, \b
> -       .endr
> -
> -       .macro          sha512h, rd, rn, rm
> -       .inst           0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> -       .endm
> -
> -       .macro          sha512h2, rd, rn, rm
> -       .inst           0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> -       .endm
> -
> -       .macro          sha512su0, rd, rn
> -       .inst           0xcec08000 | .L\rd | (.L\rn << 5)
> -       .endm
> -
> -       .macro          sha512su1, rd, rn, rm
> -       .inst           0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
> -       .endm
> +       /*
> +        * While SHA-512 is part of the SHA-2 family of algorithms, the
> +        * corresponding arm64 instructions are actually part of the "sha3" CPU
> +        * feature.  (Except in binutils 2.30 through 2.42, which used "sha2".

Nit: the ARM ARM describes these features as FEAT_SHA256, FEAT_SHA512
and FEAT_SHA3, and the latter two happen to have appeared in the same
architecture revision. So this is likely just the GCC/binutils devs
getting confused, and assuming a) that SHA-3 implies SHA-2 (which is
silly if you know the difference) and b) SHA512 has anything to do
with SHA-3.


> +        * But "sha3" implies "sha2", so "sha3" still works in those versions.)
> +        */
> +       .arch           armv8-a+sha3
>
>         /*
>          * The SHA-512 round constants
>          */
>         .section        ".rodata", "a"
>
> base-commit: 66be847cc4c2e82fb50190b52b05b3bb0ef57999
> --
> 2.50.1
>

