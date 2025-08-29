Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9928BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLWa8PGZClK+upNkzwJh/kmb8G5ZxJ0XxhXRhPDOWT4=; b=a3lRDJjjhGaeyingTANLVI8nMh
	dzXJ2N1ozuG2lxpioHwtFj9pgdv21J9zz1/458Sf8CKmuYu/PJD8LtRs/hDKGqneV2GVkBLLlrSUd
	Hy63YqoSnYfFKplSV4Q3GaSW0roq7P3kvymnQhfk8q84gD4iZzVDki8Df0l1Swu0nuOLjUz1l5xR8
	b3KV6GpE2Uam2kbeXIsMUXXA8UZnY8xPln9xzlIkrtqt6ct6EDQpmaPqBosW57+Z1n8IJGuMfq/o0
	+kf+F1tDVIjUmo0Z7TlT6VvnO7M+g5Huduh+yEkhU0MbiaH2eD3tZBATplcBma9fUA9OVRMMV9bWn
	/B4rGI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kn-000000079dZ-2g2N;
	Sat, 30 Aug 2025 00:47:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us26J-00000006QCN-34xo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4407D45653
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 16:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ADFC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 16:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485439;
	bh=laVidNR8SlBiEWwgorpzwfMHHcaTnsLCWPojvEXAxJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g8C/kudvMHddibHLfm5Tvj/VmdEEUVKlXtNIHUNvtQv5oNa5go0ExIjmPVe8RKLHD
	 n1pJLCqWe6p+F36uRw5ysGHx6gf4Qa3C4MPOPZ6E/spNmvfdsWkCCs9uZXG4hGxj7C
	 hMQss6wQ4GnP753SRQQ4ULhsioVbkKXIUiTD762t9vbuzn8C1UCiAFZPMuHpMkVnjc
	 bZZeG2W25beDAL//BiBu/Jg0Vc7Gy33fSW/o91udvucM/eK6Nm6JsvlnmEY9o9Y4pc
	 gkwHmCnsVlaOuNMweikKouaupGvsg8EMTidg5NjPou/w4YOn+nS4IOZLisrcoqgtXz
	 c4+Z+TEziVQyQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f53efe803so2770195e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:37:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+1/jtAqEWLbm78VLNpKQmcayvdzw78yBq4dfklfspzw46VKWaygiDEmhBXY6K7xwov9qEU86/eAV6Ky6EFS3t@lists.infradead.org
X-Gm-Message-State: AOJu0YyptyOw8BSfEkRB5UxRh8G3PLrwb6Z7PgxqvJ9ynfCjShytM4br
	xOj9cPZpR5T9A9lFd64CwDSHng0IEhctUtsFs/djecffGOcezoVorAvpdIqFEvj4mu3xydwuRa+
	JdzjWukn2UIN5k0ISVU4czAguCxdRJ88=
X-Google-Smtp-Source: AGHT+IF28aBpTecVgGsMjqyVUkBEoOmUAwHkrCd3i405RClXUM/JVBvF8LbtpIXrA7hauzs5l7yCbFeiR2vWbJ+LfOc=
X-Received: by 2002:a05:6512:2284:b0:55a:4fd2:2908 with SMTP id
 2adb3069b0e04-55f0cd46a07mr6768176e87.25.1756485437374; Fri, 29 Aug 2025
 09:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250827151131.27733-1-ebiggers@kernel.org>
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 29 Aug 2025 18:37:05 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEwK0znXcR=rp=r0cw+JjBM1i7=mK=u6-=RSB=4dsnHzw@mail.gmail.com>
X-Gm-Features: Ac12FXzxmMtdYZy3o3WZKlR4MJPzQQTe0eVtWk9Bz00LfYOQ1SwsUwZqQVEDOY0
Message-ID: <CAMj1kXEwK0znXcR=rp=r0cw+JjBM1i7=mK=u6-=RSB=4dsnHzw@mail.gmail.com>
Subject: Re: [PATCH 00/12] ChaCha and BLAKE2s cleanups
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_093719_814959_F19836D1 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, 27 Aug 2025 at 17:14, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is targeting libcrypto-next.  It can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-blake2s-v1
>
> This series consolidates how the ChaCha and BLAKE2s code is organized.
> This is essentially the same change that I made to the other algorithms,
> so this should be fairly boring by now.
>
> These algorithms were the last two users of
> lib/crypto/$(SRCARCH)/{Makefile,Kconfig}.  So this series removes all
> those files, finishing the transition to the centralized build process
> (at least for the algorithms supported by lib/crypto/ so far).
>
> This series also makes the arch-optimized BLAKE2s code start being
> enabled by default, again following the pattern of the other algorithms.
>
> Finally, it adds a KUnit test suite for BLAKE2s and deletes the older
> blake2s-selftest.
>
> Eric Biggers (12):
>   arm: configs: Remove obsolete assignments to CRYPTO_CHACHA20_NEON
>   crypto: chacha - register only "-lib" drivers
>   lib/crypto: chacha: Remove unused function chacha_is_arch_optimized()
>   lib/crypto: chacha: Rename chacha.c to chacha-block-generic.c
>   lib/crypto: chacha: Rename libchacha.c to chacha.c
>   lib/crypto: chacha: Consolidate into single module
>   lib/crypto: x86/blake2s: Reduce size of BLAKE2S_SIGMA2
>   lib/crypto: blake2s: Remove obsolete self-test
>   lib/crypto: blake2s: Always enable arch-optimized BLAKE2s code
>   lib/crypto: blake2s: Move generic code into blake2s.c
>   lib/crypto: blake2s: Consolidate into single C translation unit
>   lib/crypto: tests: Add KUnit tests for BLAKE2s
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

