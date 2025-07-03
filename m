Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3FFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=; b=ZYwgLIgH0odh82i08ieT5tjbc7
	Tn3/0liMxy9ieiXiv6d1O8nSax8dRglSPv0SV6+Wc3yHizfLxQGzAsDseXFiqxK25huB/EI+7QX6Y
	btJRdq2DPgTzgm85aZlJzK9PTSTjJqFQXjYTTEsv67VP3XP6W0fFc5sibBg+iJQeNC9lu7BS7PVUm
	OG+1olZ9TpcoTmPv2XX59TBVNHJixz+paO8zOGn2pw7XYuR9ctogPeC0/3QuP0v7k5kYJDjnw0CXD
	+ZZ1dgs6ZXsEONQVqv6T3J7BC5jmdcY1dKQUI9aFLntrQglya+mMrqMsgz1lwfDiOajc/nsEiLlUc
	3b1yQjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLti-0000000BpYR-2L1F;
	Thu, 03 Jul 2025 15:30:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXK4p-0000000BVif-3OZA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:34:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553b9eb2299so969479e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751549650; x=1752154450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=;
        b=Hdxym9Vt8EacheDh37QqKtvS+2J49d0JGal5gbgnfr0WUKUOW8/gACw/hPCqtgqiNp
         6WdRQuykfCNiaqRbz042k1lo5mtE0NQiVWrRWg/tVW+1enajfn0LJ2VAV4Jrgai49K4f
         L7jDbTD75VNtAFnjIWXSmJ93qiDu+jdJZ5/dM5/K3VkMbb9Up+3FlHbcEJH9YjEIF3W3
         c1/Aa3wR//9OifyOYCh3HbHRqR9PUak2BgCrbFFmIexfNjvln4N3Kw862dsoM2cDTrQj
         r9Ouo7Ue8gGjI6T7+tW32WHYy84gNClw1soxbzGnWvGDsUEkgDdMUu0x9XBtJScF3exD
         ZXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549650; x=1752154450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmo/fL676NN0as95wsShyLbjMiQpqOELVTFN9T31jG0=;
        b=BiqfO7NOxv08pqQr3cqIH2xeDr8wNEmjfWLDKUjR8eF4rUBMK4QavfyhZBwiDevLfT
         ntayE4TPvXeGTBFs5MBWUTlScSZ+ENufPLGQN427cRDeiVTu3PbRIlCXSukI3TgMvvO2
         LKt/m32rpA4kBxDVbkERzkps2e7iGAt3F4yqEb+N9WWuEjw5eGI9UEWGx+grWE/UF66z
         FHKZal6IC23/DPtUx+Bkfku+LhaUwGwCbYN4WDjqAnHzuDOZpoUo0Uc7PRSGLng29xzX
         RB6MNqUW4ltS1MZnXNwOYN1y20DNK6IzmrOGm3aivWDxdIri/M2JxUHvEDRaUpvQapFD
         AJjg==
X-Forwarded-Encrypted: i=1; AJvYcCUUURMXgnFLC6uOMLmG7/jHFXtfDGs2JZiFyjgu53VumVOwQ3Xw6wDXXMnoltiK+8/NMr+Zkx4v+m75iuNK9J6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyB72NCa159VzgDIogAmtYc0GUlL16syP1SXHkUfxCEpenyubVL
	ipWCbCSIjGfT3/FdJ3C6SQdYwJdKkyzUx50lttwr3P/eKU9HvfKplIHu7z9BpPgIWnIjCyZiMgV
	doRAuXhGz8rlUfmtu5BD8TFimX8KoqmKeT/9dG/CE6A==
X-Gm-Gg: ASbGncsPevD9iMdEnjMcs3SIDl80AxhF6l9wA8p+ZKTyXpLkMNhX2Nt3XqJJS+AumpJ
	YbNKLPIbVhOr2fXmXRqDfFdUra4a36Svfb8rWAJwppVk/8eLWfGAlZyHjVftonZKLJXRImbwxQn
	DUhSBGKmUA7VHmrdz7wZPpWaOGbb5NPpMdGYJDe386XSPfErZ8weVokzAdMVgeIw==
X-Google-Smtp-Source: AGHT+IHNv43yQ0XMxXTp2ef+SSEuzoS8acT42g8yBYYlV1yP4CPRR+Oir1K05oVETjo++6ub9AQKMpxraY8UgbEsyWU=
X-Received: by 2002:a05:6512:e92:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-556309cd03fmr914034e87.9.1751549649417; Thu, 03 Jul 2025
 06:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250630133934.766646-1-gubowen5@huawei.com> <aGaCTOJ30KNPOBIC@zx2c4.com>
 <aGaFsaUOuNd1xs8m@zx2c4.com>
In-Reply-To: <aGaFsaUOuNd1xs8m@zx2c4.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Thu, 3 Jul 2025 15:33:57 +0200
X-Gm-Features: Ac12FXx7Ayr31pcyKig9jqDUM_fXmneqv04K2EzIf0SOYCgCBbMMEX50kGxvYN0
Message-ID: <CALrw=nG8KaoWTvwvnhyqogMXv7+dre6_hMCZBkegFmktefNw8A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Gu Bowen <gubowen5@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lukas Wunner <lukas@wunner.de>, "David S . Miller" <davem@davemloft.net>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Lu Jialin <lujialin4@huawei.com>, 
	GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_063411_861179_5DFB1CDD 
X-CRM114-Status: GOOD (  36.98  )
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

On Thu, Jul 3, 2025 at 3:29=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:
>
> On Thu, Jul 03, 2025 at 03:14:52PM +0200, Jason A. Donenfeld wrote:
> > Hi,
> >
> > On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> > > To reintroduce the sm2 algorithm, the patch set did the following:
> > >  - Reintroduce the mpi library based on libgcrypt.
> > >  - Reintroduce ec implementation to MPI library.
> > >  - Rework sm2 algorithm.
> > >  - Support verification of X.509 certificates.
> > >
> > > Gu Bowen (4):
> > >   Revert "Revert "lib/mpi: Extend the MPI library""
> > >   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library=
""
> > >   crypto/sm2: Rework sm2 alg with sig_alg backend
> > >   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
> >
> > I am less than enthusiastic about this. Firstly, I'm kind of biased
> > against the whole "national flag algorithms" thing. But I don't know ho=
w
> > much weight that argument will have here. More importantly, however,
> > implementing this atop MPI sounds very bad. The more MPI we can get rid
> > of, the better.
> >
> > Is MPI constant time? Usually the good way to implement EC algorithms
> > like this is to very carefully work out constant time (and fast!) field
> > arithmetic routines, verify their correctness, and then implement your
> > ECC atop that. At this point, there's *lots* of work out there on doing
> > fast verified ECC and a bunch of different frameworks for producing goo=
d
> > implementations. There are also other implementations out there you
> > could look at that people have presumably studied a lot. This is old
> > news. (In 3 minutes of scrolling around, I noticed that
> > count_leading_zeros() on a value is used as a loop index, for example.
> > Maybe fine, maybe not, I dunno; this stuff requires analysis.)
> >
> > On the other hand, maybe you don't care because you only implement
> > verification, not signing, so all info is public? If so, the fact that
> > you don't care about CT should probably be made pretty visible. But
> > either way, you should still be concerned with having an actually good =
&
> > correct implementation of which you feel strongly about the correctness=
.
> >
> > Secondly, the MPI stuff you're proposing here adds a 25519 and 448
> > implementation, and support for weierstrauss, montgomery, and edwards,
> > and... surely you don't need all of this for SM-2. Why add all this
> > unused code? Presumably because you don't really understand or "own" al=
l
> > of the code that you're proposing to add. And that gives me a lot of
> > hesitation, because somebody is going to have to maintain this, and if
> > the person sending patches with it isn't fully on top of it, we're not
> > off to a good start.
> >
> > Lastly, just to nip in the bud the argument, "but weierstrauss is all
> > the same, so why not just have one library to do all possible
> > weierstrauss curves?" -- the fact that this series reintroduces the
> > removed "generic EC library" indicates there's actually not another use=
r
> > of it, even before we get into questions of whether it's a good idea.
>
> I went looking for reference implementations and came across this
> "GmSSL" project and located:
>
> https://github.com/guanzhi/GmSSL/blob/master/src/sm2_sign.c#L271
> which uses some routines from
> https://github.com/guanzhi/GmSSL/blob/master/src/sm2_z256.c
>
> I have no idea what the deal actually is here -- is this any good? has
> anybody looked at it? is it a random github? -- but it certainly
> _resembles_ something more comfortable than the MPI code. Who knows, it
> could be terrible, but you get the idea.

One thing to keep in mind with this project (and other projects) is
license compatibility with GPLv2 (I don't think the above project is
compatible)

>
> Jason

