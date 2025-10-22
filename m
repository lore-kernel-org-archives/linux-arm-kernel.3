Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E360ACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpOx+Mxq0W5NCE1x02njRBGwxea/jl5UXEAb9ehbg30=; b=m+c5gc3w0kJ0iHvsbIxZXejvH2
	lGkxQziPGcdzTKthihppcV7vE4yYiZohcSCdjqmXlLXgRHhUWguMqJtac5skNyP5D7TBB9pZb59Hu
	vO/bP6+dSszsSXKgVpAHV+CY/F9+VVaxXtE+W2NFnk30qutMI7gEPJl15Kkcx5cyrPPh4srpn4juX
	l6lqDJ1Kx/LL/UQw2S56++615Eh+LMzxal5zC375+mhjYQUdu+TALfgzwa6FbsJvzwN1dr3cWL+VJ
	8LZZ+D+dIEpjC/pK9twn81M0DsFJhgZPwq+kpFI1UtIqMtwp2j0iofNhGB4QXMYdd2SSIrtxfdhtE
	1Y9h15Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVjV-00000002Oqa-3pQR;
	Wed, 22 Oct 2025 10:06:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVjU-00000002Oq3-3XSX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CD5061D6C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1982C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761127575;
	bh=YjoTV+qcYnMvMR+XsIYNmyvY6Y1XWrBQdEZTQ1QtXaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lJ3RRgauYL2s1q2mrj02T4mhG/3jEuS3L47Y2Ptl8NII5BooZQVEual2l0fPnJnV/
	 Ivbdm4cyPvZuGOIJ2X/NyLN7wAz1RSRUUfZgUxBBHXFyAsCMxx400RsrP8xdWd7XpM
	 EDtq/sivF/R/BhCUYuW87jhA92jAd3Y+p0Os7nEe8EBDqOBZRmBZIb/gtwlHU48a4O
	 7j7Q7umK4JwbokbOtCjigXyev8DnYEQ3hhTuJ1gLIC7lHVHq9bBchiUx6SM0jV8Qch
	 nTDxQVrPB/S7TpBv6LBpE0cZSr7HZiJZ4xsa4fB17+4uAj61+puaDZitBj0OPkj10q
	 dGQA1g9yKmysQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-592f29e273bso158994e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfg+ODc/ig1Za5VdPelVYfSHiX2QIckfkFnA/UswUmcOAbhF5ac5W/Gj0mIZwfjd9QQ1EJzkJAK0aY4JE7Yuk6@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzklgizjMKOkr0jlghpxSas6OLfXK7Vi6vmeLV8GMj6tJv4oY
	74AJLiiiKqohcmM3o9AzhCk++V/VwemuPnEZgojlsap7pTB4dWBs9hU2Bl2OmEAPlGCqn74UKRY
	U0Bf4wPhBngx7afBht+SW1nNJHaFTr+8=
X-Google-Smtp-Source: AGHT+IEz0x//kso/iNTS21v0xmTCFoU040wkVDk2FAWrns4i2WZvwnraWiRmT9a7dZUqlR2yjlPI5muBgbBSVJSiBMU=
X-Received: by 2002:a05:6512:ea3:b0:592:ee1f:227a with SMTP id
 2adb3069b0e04-592ee1f25e8mr889209e87.43.1761127574241; Wed, 22 Oct 2025
 03:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251018043106.375964-1-ebiggers@kernel.org>
In-Reply-To: <20251018043106.375964-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Oct 2025 12:06:02 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFNw73j2F2QQJQ8CDXj1qfpK-xE+TRnRZoak5OhVDPA3w@mail.gmail.com>
X-Gm-Features: AS18NWBgd42L4tDl9i3Mf7M4zRNkrg9sTyvbPU9kg_gjKmxPKesRTrDlO8EAPyY
Message-ID: <CAMj1kXFNw73j2F2QQJQ8CDXj1qfpK-xE+TRnRZoak5OhVDPA3w@mail.gmail.com>
Subject: Re: [PATCH 00/10] BLAKE2b library API
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Sat, 18 Oct 2025 at 06:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git blake2b-lib-v1
>
> This series adds BLAKE2b support to lib/crypto/ and reimplements the
> blake2b-* crypto_shash algorithms on top of it.
>
> To prepare for that, patches 1-4 clean up the BLAKE2s library code a
> bit, and patch 5 adds some missing 64-bit byteorder helper functions.
> Patches 6-8 add the BLAKE2b library API (closely mirroring the BLAKE2s
> one), and patch 9 makes crypto_shash use it.  As usual, the library APIs
> are documented (with kerneldoc) and tested (with KUnit).
>
> With that done, all of btrfs's checksum algorithms have library APIs.
> So patch 10 converts btrfs to use the library APIs instead of shash.
> This has quite a few benefits, as detailed in that patch.
>
> Patches 1-9 are targeting libcrypto-next for 6.19.  Patch 10 can go
> through the btrfs tree later.
>
> Eric Biggers (10):
>   lib/crypto: blake2s: Adjust parameter order of blake2s()
>   lib/crypto: blake2s: Rename blake2s_state to blake2s_ctx
>   lib/crypto: blake2s: Drop excessive const & rename block => data
>   lib/crypto: blake2s: Document the BLAKE2s library API
>   byteorder: Add le64_to_cpu_array() and cpu_to_le64_array()
>   lib/crypto: blake2b: Add BLAKE2b library functions
>   lib/crypto: arm/blake2b: Migrate optimized code into library
>   lib/crypto: tests: Add KUnit tests for BLAKE2b
>   crypto: blake2b - Reimplement using library API
>   btrfs: switch to library APIs for checksums
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

