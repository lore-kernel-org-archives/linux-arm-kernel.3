Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01E2E9D826
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 23:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=; b=Hi153h/OIk0TwQmCzttEKMNhrh
	ekO03NV/Xfhei3FKUp0IJGIRZJH9DH9dvf/+nSVMtwrCvV4IH8E6GlOdjE14g8UDYZCfzb2AqnC4C
	QS/tWP827VAd3cfaAsZyHFcezV/RBm4rSrL65q8Gl0oRDDS6NNzV4q4Y6BsJS9KSSxVuDkB1sncQQ
	VAbV5mlZl1Q2l2JUErJERRH2pUjm7tixO9y5R46lEsums0xehw7ZXiMgfGGPcy0KT1bN+om3OWBXo
	QhJzWLFxlTe7a99s2gTM0Mq6mUpN+IOIULxAgVF4jy0Lt9TX3Oa12o6jf9t7ThPsBTkRK8+o8It+Q
	knk7vOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9WhB-00000004Y9m-2dF5;
	Sun, 05 Apr 2026 23:15:57 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Wh7-00000004Y92-3GuG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 23:15:54 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2bda3b4318dso224419eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=SwAYW/NI2sevpyxgVMsUQHESLxgsNYFdfp9aD3P0OyQxKXTRBpF4NL+4sLVIsTwOdW
         jVIvZu9ehQEv+rdzHBneuryQl24Zla06CNOr9JOhGyuydRIraO9cKaosmfS2ctuB82+n
         DIPO+pt7A4IobBkVeh//HN4BYqmSp0a+epdtHFuCmHbZZlSakgEUKblEPWMlxDiXKTmV
         F32wwUW1p+M1LjiGEV7PsfOBaldeRC1jyGlgUOaji5lj/8+LArACq4DYvQyU0RfWo30w
         P93SJs0rCj4xqmdRBuf4geliSZMlnyD6xKb2ZSTPEewyJ7zpinp6rEcAydkj7Slmb4DE
         k4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=ANs3BaS4F/Kh3TKLPZ4mEmBDimkXozV6DUxKKpuU0Ls=;
        b=b/hca5v1zpnLHtrAcYNbxqGe4agjNCeM17hb4PzwuinLXYOEdvlr3EL3lEyD7qHSy3
         IwJBwjmlZYgFyrJZt8FYwm40ll31bprFsgNRb+PExYwufjsetu74cC91MP6ky3fh9ZzG
         fkCe299gbphTcnfkXOYarCQ38FjxzpniuIAzN6k7K6rYyYtKYJhCeaAmQkv/mBB+MxGS
         dw65VcNp2TSQ8sS1TUQ4VGHYhLoeJVgbeFR1Uqs9nCqw3zcE1jnydbrcvi0/uF08y7i3
         UvZ1QjdqNJcWCBqBP3nrfrnGWRC5zGKw07cHhP08PalICUpzsXW8g+sx6XzkSB+RZsow
         RrqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=UomZZmi8yhjL+i8cmZd0HP8U+2MIjTOtjQZ1hbyEk/zZgMju0LO64YNHg54jkUhQqC
         GAPXy+x7cNTzbG4Tp8iKFU2NnU8pu48OuMl7TQ0FL6mfCGnr4ZJNkuRz67ixcK2plzs4
         L6tGTRxdZ+JitzCwthuBcZUxtariq5En8Mccph3M93xL/8ajxe/Xqy5ZkZAjLSjRhRk0
         YPnjEjk2y79JOIiFX6ptqHO9NGyI6yqkCF0/IF/gj7itymC4mGZwiRWTkmgPb38CxJOY
         Yr1Euh6AksZ26ZwnNEDOMAaZFfBkfm4zYKYBfnMxhW0314VMhQuEo/jMHp7vyLAfV5XI
         CQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=OPJFCwOZKGLE8Xj9S0SQaG16r+lB78k+IANgXFUyM2FLShgpLQhqH+sCOXDqB1WgiG
         haUNB2Sqe9FdYkjpmXseUUVXmd7Q6irMh15Sdx+wK5v+JlplSL36DeCguegb6SquOM85
         IBpFXlBC3DDdIOU8UuL5aqVwuvixkACfgD14LrBd5yCnwchmKmhXqPN1E9OsstIZNEnt
         FkiAUFG6y4qiFuiG/CoDJ4ZRSsSyVz6rbDSq7Eti87/luXjIej4eMHZLock8hBNr+fmy
         dzPcVdo5Cy+rXPK84S5KZrdF9YlSIgRC/QLIGNYFqbsRxQjyPiNu2v9kymw7ZjQr/BrP
         HBzg==
X-Forwarded-Encrypted: i=1; AJvYcCWE0ixvD87+JfOOu2vEsfrF4A0aE5JPPkX49Feaa+MDHzGfm3pVsvIBnMJT6r5fnmO51nzAwBqmzGE5BwF1glSj@lists.infradead.org
X-Gm-Message-State: AOJu0YxnIFyomRrTtBHWDUHz5nZcXpD597PNcOBmAGyU/s5LPLB6DKGd
	/KS0uvwjAKso84JaVXOritFkTNtS/8E2CL/aa2S8crEXsaF7kwWeswXE/9VyOv2cpFHa+rbduSX
	g9Tq7h7kd+Q3UpRVZl8XzQuo/7qYS/AA=
X-Gm-Gg: AeBDiev2ZoRXvQCD2nXk2+f00iJEuhtaj7+dzU0k+o/cZkMkOFH03Lh2qyZzKvfXp+x
	Dmzt6c1+cd++1v98JPptm56fWHmf7Hv3I1eJYJkwnqMT+kBPoG1O21mlGJxVRBGHqpDyI0cE2Ig
	lsnpy6308HuEnN7Ty7YXJM74t0PkCfkSjerdwq8druTUj7DDrDR7s9s4tHEGRBFZ40qfkuW1v/8
	xOEQzNscnmogRG8MtmIU7/WzZqewKSr1G8ITkwqeHz8keUITNwidvRWtd9x25eUB5MDU3/cXYzN
	PLVrB7ikiq6OcoawXBIMWz4LiCkGXjgo9lyME4VQNxYkbBQOVQYjsYvJchaaPPyh9qGnqIjheZu
	kXTqMjYlsok1EVJH/WMGazmQ=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_161553_874293_46782496 
X-CRM114-Status: GOOD (  18.96  )
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

On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think I would prefer moving these down.
>
> The current approach append the flags to all variables, which will cause =
the
> following equivalence to stop holding after the flag update.
>
> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>
> (Per version flags doesn't go before -O anymore, it comes after HOSTRUSTF=
LAGS).

[ For context for others, Sashiko reported the same and we also talked
about it in a Rust for Linux call. ]

I have been thinking about this, and about potential other ways to
achieve the same thing. I think the best at the moment is to move just
the `$(HOSTRUSTFLAGS)` below, but not the rest.

The reason is that it is closer to what we do with other user (kernel)
flags (e.g. arch flags come after the general ones). But I am
wondering if we should/could set all the user variables later in the
`Makefile` in general `HOST*FLAGS` later in the `Makefile`.

In fact, there is already a limitation with the host flags: `-Werror`,
i.e. that one gets appended later, and so users cannot override it.

This may be considered a bug, because commit 7ded7d37e5f5
("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=3De for
hostprogs") says:

    While it is
    possible to avoid this behavior by passing HOSTCFLAGS=3D-w or
    HOSTCFLAGS=3D-Wno-error, it may not be the most intuitive for regular
    users not intimately familiar with Kbuild.

But passing `HOSTCFLAGS=3D-Wno-error` doesn't work, since it comes
earlier (`-w` does work, but because it turns off everything).

I am also a bit confused with:

    While this means there is a small portion of
    the build that does not have -Werror enabled (namely scripts/kconfig/*
    and scripts/basic/fixdep)

because it gets enabled in the build (I think it is referring to other
targets like the config ones).

Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
bigger changes (e.g. for more `HOST*` flags, appending it even later),
then we can do it afterwards.

Cheers,
Miguel

