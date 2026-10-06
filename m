Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D744CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE01EV1zSfpVuJeSfikynDyyaUOUSSRxYC7VKoLHOYs=; b=PefSC2+17KDtE57V4EGZ1eBawI
	W9VDn8FDjwH4dfoa5IkAeGUwf0lGjH7+EGHM5s8e3tG8fAxkrcV4gA6KOrk6C12nZ7AaBx0ltVsVN
	v5m693CsEAGXRdoYXi6CFOc2YS/uhaRZCzGuzkcN94bGbcWXPZ40RiBrb5pXL5RiAzzfVPoXbi7ZF
	UrZslmUa3alZx1wz2gH388jLgeoaRrDEfabqNRpf1Keq4WEKWveSZBKWDaNU13QUxo17Pw/xQpEXO
	/V1Xq3OqBX2bSmeqAHatGsk/5jXt5oY27JXHJ92QcF4ckL+W00p8hCFZJK71mdLkp/gkvjmVT3FHE
	gRqtVzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2TA-00000000WLe-0DsI;
	Tue, 06 Oct 2026 10:32:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2T8-00000000WLS-1KtO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A7C43D37
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB9C1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791282742;
	bh=vE01EV1zSfpVuJeSfikynDyyaUOUSSRxYC7VKoLHOYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H66jlRVmxbLAvCWY7wio83N91RBhaB+Fb/3/3PqyHazJQpe69u4eTmABkVeN50KIq
	 HoUQKqSRDDJwsxkhN7ZWehR2OoeWLENhJTFBkQX0YdeYTeLiwDZqq8YBaSUQf0QYbL
	 H8K23KqJp/N/KVbFTCXqWb1SpZiuR1FDQnJGUXyEksHIwfDFt8M6+8zQXLndkioLtn
	 FseRdXTAlEF5xbuvzZN1jmKV+mqZIkLpBYsBK72cVIoqnVVzaxdqjmX8TjMIVQl2Wr
	 T/s0JeXCD/kpoDa9sRJkMxHXWz0HwV5UxWTQ6rQrip1LKG7bleiPhG3BZWsx1o+gJT
	 OYVcivpcUTc3w==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso12028241fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQ4Wo09ppE81Yq9Kb+w8xGgwQBubNqracQIN+SqmUlVnNF52olPff8ZcUCATruA0EXidhV3/TmQE95NrL2iFUL@lists.infradead.org
X-Gm-Message-State: AFq9FYKSXNz86w7Ea106SRHsB9F7xV1PzQiJLVj8W3RXied3uOXv+A+2
	KuDgC+mOu3RGA/5/Y/4VFskl7WL0r4d5m1k7OgpArI0pNFN214B5zmJBUt7LMvjcJTdAKYaCWWd
	3kU6RmZczk023V+5nfKwNqmbv9ol0f5s=
X-Received: by 2002:a2e:be1b:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3a99af27150mr2412711fa.16.1791282740735; Tue, 06 Oct 2026
 03:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-2-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-2-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:32:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=+WSou4RFoho3JvWxV+ok-0ZnNZWhwdOVK_J7R7AM3A@mail.gmail.com>
X-Gm-Features: AclHuK8rkOnk1u1TfAFFALwn8ajDSse-J3apTnHTi28eDx-XnKGt_saLuoLvA5w
Message-ID: <CAD++jLk=+WSou4RFoho3JvWxV+ok-0ZnNZWhwdOVK_J7R7AM3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
> and 4-byte exchanges there and turns any other size into a link error
> via __bad_xchg().
>
> No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
> helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
> unconditionally, so building with CONFIG_RUST=3Dy for ARMv5 fails:
>
>   ld.lld: error: undefined symbol: __bad_xchg
>   >>> referenced by helpers.c
>   >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)
>
> Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
> atomic_t operations already do. This is safe because SMP requires
> ARMv6K or later.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

All right this looks fair.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

