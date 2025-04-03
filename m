Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D227CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAaNZ+6NXDNpsPuLfvCYG+9qWpEj8cIl19GUNWtS3+0=; b=dsxI0XXscGlFhR31dvHHhB5FTI
	FVdtMXzAtlkdWYO0AvTgs57hclYc3ctSpUyMtEieErWlxIh45hbaTPO316nBAqZcCDNh1i5DVqe2z
	1y3Rr23b13gmEnkQ6wuYODvKdaKFj5M+nhpB2P0rAoy7DVNgww0MwbwtQDWk0WXdkS2kgsIV5uLaO
	eobTQFvG7oKpwQ932AOY18mCkLwK1U+8/kkySkmJnDc3/J9sikNoaQLCTLsis0yi4/rqPUncLCSTQ
	nmwx8pbl2fDscxn0qUTMXtjMke8TOVRHJSd/uXW4xC1zyhjUXG+wQuJ9MPdGHWnuD6uNQj5diObs7
	xeuGrcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ib1-00000008gaH-3UCp;
	Thu, 03 Apr 2025 11:18:55 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0I72-00000008cKq-3C8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 10:47:58 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5242f137a1eso361038e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743677275; x=1744282075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAaNZ+6NXDNpsPuLfvCYG+9qWpEj8cIl19GUNWtS3+0=;
        b=VZ5aVv953+jDcbfJJO4kjAIP1YDUWT1MtHPzb9vHWy5ytKucxuBcvOLAf83h6nqUJ5
         8Q0MOSaTSea+0Or/bOp9xd5/LHHpGuvhBhypEanHdvOEAQo3C1Rbkuz7s6VsJLzk6a4a
         dykEXgMSXxxaUcbGXTkX6m8NbAKiEVb06R/uP7H1iEFXaBIeIkBr723nTNvRsFYbt7uC
         1GMx72TCN+s2Af6qKVZbUBv6BzFhvsHXe/LP+P6MMNQuuBIfR8PEAl1xQCasCKxgvepK
         HSadYTOxMBrhvtxbwEauxGvsWAa1RJoLJUpGKbo1vgksUTdV2nvwEFRAl+72oLxoLCmu
         Hg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677275; x=1744282075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAaNZ+6NXDNpsPuLfvCYG+9qWpEj8cIl19GUNWtS3+0=;
        b=ay//GiXG8LqoLcG+nAQDQO0uriMQZX2phJWcB+DTzJXcu/9gICwpHfEl5+zuJu7Rcz
         K94soMuy65kMDhx+leKH94ABKZxXCpAqYmKmO/YB2lA5X9Uxk+l0cEXIadGHoy3+2Lun
         v5Ks+H/PX8NnkJX+hc3yyd3bu4lFr585z4PLyPkmLsZC0yz6eYde8khXUPeoEH/yYhae
         jeO8tdpJb5udXs56G0y+SB+uteu2fhzIWwISc4H+a1CawZAtzSOsqAOE3Zi8eX9PARmT
         7IATGO+cIxl6SQ7hxr8q1S3PEYjycFd0DtND4Aot7TRfEHyrN6sTo8fEWBqHMaarYiWF
         FTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP8iSsNFw67RhsH7qexMZb2A4j4bxFQfNsy/11gFqJFe7gysX7TtjcNKGt3s+rbDz/lQh3C2hoyE1dWFCkSEES@lists.infradead.org
X-Gm-Message-State: AOJu0YwdCcce26y1KX+9nLE+tUmoKDYmjGC4KW+GjNf+i1LN2Ra4dHam
	NmNbiIyVsTWTIF/8ctazLnRjZ5KsnuswgxXK/Dk2N51ReOUrn6tVkSGYPAGkqj53+8YRCHWOA5c
	+6YlZy/NmZrxU1skKjxQ9GPm8ITdXFprmb3hj8g==
X-Gm-Gg: ASbGncvxCNu/k4tkBvLWcJd46UwiAxZ1+tVomm7rWVdzEJdnfghYaiCPTZTy1tdlAbl
	Ws2GgOaTtEH4mh1mvnbKR3lSeYE1LIQBG2hJ4FpszA/1KsBRKudphZxZJdqBe/UVCm10muB2yQ4
	y7RKzDW+2h38HZdmPWjn7wMV6q1uGCSyz6vbHgGJiPxrKnakgv2EaEaGGklkk9xMavhV05
X-Google-Smtp-Source: AGHT+IEAZl1Bq3/zu9vvbPR6m3Radye8loELaRqXD0AyDpOs+9n2p6f39NGtMiUIYfBcaZxZCiTPFXD5UyQrWFVswQo=
X-Received: by 2002:a05:6102:3e06:b0:4c1:abaa:ad93 with SMTP id
 ada2fe7eead31-4c8477c5c58mr1268689137.14.1743677275308; Thu, 03 Apr 2025
 03:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162>
In-Reply-To: <20250403011849.GA3138383@ax162>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 16:17:44 +0530
X-Gm-Features: ATxdqUE4AkC2FOF6OY9aZNJrmty8hh4LW8Nc1vXRFFYdK231FvWNsG3UDqbvQK4
Message-ID: <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: Nathan Chancellor <nathan@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_034756_809122_03F7D400 
X-CRM114-Status: GOOD (  22.35  )
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

On Thu, 3 Apr 2025 at 06:48, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Wed, Apr 02, 2025 at 06:19:19PM +0530, Naresh Kamboju wrote:
> > Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
> > the lto-thing, hardening and lto-full config boot failed with toolchain
> > clang-nightly on the mainline master branch with no console output.
> >
> > First seen on the v6.14-12245-g91e5bfe317d8
> >  Good: v6.14-11270-g08733088b566
> >  Bad: v6.14-12245-g91e5bfe317d8
> >
> > Regressions found on rk3399-rock-pi-4b:
> >   - boot/clang-nightly-lkftconfig-kselftest
> >   - boot/clang-nightly-lkftconfig-lto-thing
> >   - boot/clang-nightly-lkftconfig-hardening
> >   - boot/clang-nightly-lkftconfig-lto-full
> >
> > Regressions found on dragonboard-410c:
> >   - boot/clang-nightly-lkftconfig-lto-thing
> >   - boot/clang-nightly-lkftconfig-lto-full
> >   - boot/clang-nightly-lkftconfig-hardening
> >
> > Regressions found on dragonboard-845c:
> >   - boot/clang-nightly-lkftconfig-hardening
> >   - boot/clang-nightly-lkftconfig-lto-thing
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
> > no console output
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Boot log
> > Starting kernel
> > ...
> > <No console output>
> >
> >
> > ## Source
> > * Kernel version: 6.14.0
> > * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> > * Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> > * Git describe: v6.14-12245-g91e5bfe317d8
> > * Project details:
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12=
245-g91e5bfe317d8/
> > * Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboar=
d-845c)
> > * Toolchains: clang-nightly (Debian clang version 21.0.0 )
>
> The version string for the toolchain seems to be slightly truncated but
> from the configuration it is:
>
>   Debian clang version 21.0.0 (++20250330105456+3b3d1a5c2614-1~exp1~20250=
330225508.1357)
>
> which can be parsed with our parse-debian-clang.py [1] to get more
> information:
>
>   $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++2=
0250330105456+3b3d1a5c2614-1~exp1~20250330225508.1357)'
>   clang checkout date: 2025-03-30 10:54 UTC (3 days, 14:17:24.134272 ago)
>   clang revision: 3b3d1a5c2614
>   clang revision link: https://github.com/llvm/llvm-project/commit/3b3d1a=
5c2614
>
> Our CI is using a slightly newer version:
>
>   $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++2=
0250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)'
>   clang checkout date: 2025-04-01 11:25 UTC (1 day, 13:49:39.394836 ago)
>   clang revision: 290d7b82cb5d
>   clang revision link: https://github.com/llvm/llvm-project/commit/290d7b=
82cb5d
>
> Can you see if it is reproducible with that revision?

I=E2=80=99ve re-run the tests to validate the boot behavior on the Rock Pi =
4 board
with different Clang nightly versions and the latest mainline kernel.

The combination using clang-nightly:20250319 successfully booted the
Rock Pi 4 board.
However, the combination using clang-nightly:20250401 failed to boot
the same board.

"name": "clang",
"version": "21.0.0",
"version_full": "Debian clang version 21.0.0
(++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)"

Reference:
 - https://lkft.validation.linaro.org/scheduler/job/8196258
 - https://lkft.validation.linaro.org/scheduler/job/8196275

- Naresh



> For what it's
> worth, both of the arm64 boxes I have can boot a ThinLTO kernel compiled
> with a version of LLVM @ 749535ba2808e133682074f712ac6829335f8875, so it
> could be something that was broken for a little bit but Debian happened
> to sync before the fix was committed.
>
> [1]: https://github.com/ClangBuiltLinux/continuous-integration2/blob/fe48=
44afc1be91d469fc162c8a179f23fafb9384/scripts/parse-debian-clang.py
>
> Cheers,
> Nathan

