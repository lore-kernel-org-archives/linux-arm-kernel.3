Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F3BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wgBmqAU1oJxWzsvWxCn24FF0Yyp5TPl7Ahy+xGEgrk=; b=L/J257vSSxnIgZ5rFS8KmF31WQ
	kw0caiNtdCC/WaCrlk0WhFEa7D5vXDuJbBVyMTVjmeJ1POMeqYslLSbGW6/cHBQUmfDxgfCCpFBqe
	0S17wGpylHTII6kPlrfZ5gUPZAJVcdnFCpXl9/turC9AI8NmjzBOPOofH0m4GZAWc0vKAdt9KfmRP
	R30z0pL6sliYKNA5YKelrRNYhbmUqKO7VRzpVwKHOoTABgxsELhb+nxat1N/YkhXQV+5XAg/i0hOA
	V4r06MBmiQGPy5QN7/oje73IbWPAKQCQwwUHOsrfA6ZcA5DUblI6l8Jr0TA49UAUGZsTMPMNmLo7N
	8d7okFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCJ3-0000000BPat-030X;
	Tue, 04 Nov 2025 08:22:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCJ0-0000000BPaN-1WSy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:22:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B14BA41885
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 08:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91796C116B1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Nov 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244537;
	bh=f0ExexZSvSjh6pxIi8QuIB/M9WbshjMNb7Xh3MO5KaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VLaWHizn94jal3QBfxMd/BJoRoSh9RpAuA13xpAWd3Yyv8gcZPalSX2SOTZdWFJ92
	 EssLR0SB98U9DGgcVOjPNWggSOs6dh1F1k069nnQm/rpQadytABN+aN1mVitTmd99k
	 d9O0lUwrDURTzQw8pD4Xi40srqs1reQkrYy6tjMP0OPowAPg1kujrKiL9y69XBuDtV
	 1GGZCDCvLSRmckzRiXEEM7BRvkdFHpkbggnJnx8J0cKJyJcDbSXRzmLmoRsEqKELJW
	 c1YaHqlPP3H7W4uTwj5OwmKVxnNIsyl5TQdKCrRx+gVcFthwaYH4OV7/L+foS0uKZI
	 3D3uUn0r0ytOA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3652d7800a8so39682011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 00:22:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnhpvXN3UmfmNTBBBOAk0jus9mYFaPpaNYFZ8YePFhJwnkQiicNcKTPkFV0sDs4aO06K2Dp2REx/vZTStjzIpx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw9eVC8gxF/g5HMhahgEN3KD18qLXD+MrTN5b+piwM2JqV81z8
	BAFce1pUc06P8XTm7lSsY2hmCJ7oDv0alz8agVSpyIMDhwdFbG9eSfmtzg2XC54xVpLN0ZcZF8K
	unVmaN0NQLICFDLPu2dVuCQfi3ro0ygA=
X-Google-Smtp-Source: AGHT+IGg0J5ZRtiOoWdnps03k5E7YutbmyfCk230k7Pme1eseXmkIDg55LnE6Nfi0UlvvPP2AWGfgfJVJAdLVgfvcGk=
X-Received: by 2002:a2e:80d7:0:b0:36d:6ae3:8158 with SMTP id
 38308e7fff4ca-37a18dca6fcmr39923761fa.25.1762244535963; Tue, 04 Nov 2025
 00:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20251104054906.716914-1-ebiggers@kernel.org>
In-Reply-To: <20251104054906.716914-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 4 Nov 2025 09:22:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEu2G+XBKqK6KPGCaNWr9hLZ4xJHwG2+_BZ6DYdO8JKpw@mail.gmail.com>
X-Gm-Features: AWmQ_bnbmOEiAvvcVM5m53o8_1hNWBUrXac4nkeIBPil7jYX7BfUJq098pZKe0I
Message-ID: <CAMj1kXEu2G+XBKqK6KPGCaNWr9hLZ4xJHwG2+_BZ6DYdO8JKpw@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_002218_438261_1C7DE291 
X-CRM114-Status: GOOD (  22.57  )
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

On Tue, 4 Nov 2025 at 06:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On big endian arm kernels, the arm optimized Curve25519 code produces
> incorrect outputs and fails the Curve25519 test.  This has been true
> ever since this code was added.
>
> It seems that hardly anyone (or even no one?) actually uses big endian
> arm kernels.  But as long as they're ostensibly supported, we should
> disable this code on them so that it's not accidentally used.
>
> Note: for future-proofing, use !CPU_BIG_ENDIAN instead of
> CPU_LITTLE_ENDIAN.  Both of these are arch-specific options that could
> get removed in the future if big endian support gets dropped.
>
> Fixes: d8f1308a025f ("crypto: arm/curve25519 - wire up NEON implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is targeting libcrypto-fixes
>
>  lib/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
> index 8886055e938f..16859c6226dd 100644
> --- a/lib/crypto/Kconfig
> +++ b/lib/crypto/Kconfig
> @@ -62,11 +62,11 @@ config CRYPTO_LIB_CURVE25519
>           of the functions from <crypto/curve25519.h>.
>
>  config CRYPTO_LIB_CURVE25519_ARCH
>         bool
>         depends on CRYPTO_LIB_CURVE25519 && !UML && !KMSAN
> -       default y if ARM && KERNEL_MODE_NEON
> +       default y if ARM && KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
>         default y if PPC64 && CPU_LITTLE_ENDIAN
>         default y if X86_64
>
>  config CRYPTO_LIB_CURVE25519_GENERIC
>         bool
>
> base-commit: 1af424b15401d2be789c4dc2279889514e7c5c94
> --
> 2.51.2
>

