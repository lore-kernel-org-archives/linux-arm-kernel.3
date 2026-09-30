Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9765CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8mTmxiMa6j0BDVpqQQE8qTtnaK2gCeJkwytdDxRrLg=; b=hQB0jaZ7Mkfmh4
	QwZN5ADaqLz4T2zhjlZliN+HS3AmkqqcEJCpKhWSADZqI7ziFYU95T21IooQaei4tfbZVykOiX8xz
	+WOMhCAg7imQpOOhLxva8y0SZm2CMp+0QmK6jzYwaIG46Adh8sKzcQURlsbCJBom0Sr4pPxEr5K+k
	Mubsbn1T39GBpv9byh2v1Onhui03Mb1qRtAStuj9nO8RGPmdyGy4QxCW/LiE34M0cVmwCGu98HVWH
	V+BEiJwHw2b1frgjVBupjwZ5Hkm5yJkgThkykPtz2I7zmRGk7AaEa+xBxvHFwTqw1QIcHAE3h9AvE
	+7HHIaY4oO0TmfYcNGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Qf-00000007Dsc-2VHY;
	Wed, 30 Sep 2026 21:01:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Qd-00000007DsS-2aGr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:01:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01F65601F1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0A71F00899
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802086;
	bh=h8mTmxiMa6j0BDVpqQQE8qTtnaK2gCeJkwytdDxRrLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CHTE7awBingCn6+CYnIDvtmoEtX5CC/dNbrjVt90/jJs4T/nAh0ycXq+HTgAmXx5c
	 t32uij/TWCWTFhDdgmmNkFHysE+ad6PFrM1iQrjzQ1Zhi+sqosXIaoFGtZGx5DtZg9
	 6Hlu8rmsFQQZo4venEv792b/0RfwRTH8ebSgvwJc2eb3L4tsanemFe6TTlmJRVSr5E
	 oiBejPZorDHIHs/8e/6s14WuD/hiNNyNqQVGdqQ0lJtScqzUHhngi6XXHD6GJY+W5x
	 GDX/9yZ8LB78g+ZyGwq23ha/NUy8cosSj43RgPEUQmSx7kqRvDx44EMzm0YPA3xb+0
	 95PWH9GmgKNmA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652e2149aso51449421fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:01:26 -0700 (PDT)
X-Gm-Message-State: AFq9FYKmQRPKKY2VAIxvc0cR3BZ3mAwEhVnC3nBduHzoLMB1+CBCgR7a
	Ek262Xl8ZMWavygs2fQ0CZSws4UnmDwxDXad0se04c2x35DcVMvP7mOrMLzjzpkzI7GzbycpjLz
	z86ZJUG6YZOIRZHs/fuSO22sk2eyV6zo=
X-Received: by 2002:a05:651c:418d:b0:3a6:10d4:61c4 with SMTP id
 38308e7fff4ca-3a779211d2bmr8529901fa.28.1790802085503; Wed, 30 Sep 2026
 14:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-4-will@kernel.org>
In-Reply-To: <20260918161407.2300-4-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:01:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Z01dxFg-+9MhNot2ibMoRnQwRQH--7JQLhFDFOPYzew@mail.gmail.com>
X-Gm-Features: AclHuK-CpLbmzPeMGgGn2WiiLWja7WmeJfZTnIg6LGM9G8yhcOxSzBBWyakJIfg
Message-ID: <CAD++jL=Z01dxFg-+9MhNot2ibMoRnQwRQH--7JQLhFDFOPYzew@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] arm64: stackprotector: Temporarily disable
 per-task stackprotector
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Per-task stackprotector relies on telling the compiler about the system
> register used to hold a pointer to the current task. As we're about to
> change that around, temporarily disable per-task stackprotector for now.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

That's not the only thing that breaks in the patches between here
and re-enabling it, but what is the alternative other than to just
squash all the patches into one :/
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

