Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A675CD5C0D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHeUu3Y2VrEm+A66XbT0QSdyE6a50+YBDTLW/TN8HDA=; b=Sb1biBu+gwZoappKn6vlJp0b2U
	Ug+QSEPQeL6tyKkjBKXiwop9xR6PsRRKjNOZAOyplWbT9Lr+u9KSza3473ty70u2mZrp82NBRfZ6m
	V3jXLsYELBgw4LyzJk2RPA7GgsJVYiEZMEPGntv9J3Gm9LnbEZPKj/X8b0hJ7Ty4+WtkICeGWIPEf
	PQDfVwdtvDID505bs1BUz3LJqa6/npNKaOR054yjIDFcT+8MrxAVqz+1x8fzuAyVTtq6rQgo7+b3W
	JSaCrENhw7DroLa3wJ5ACUcXHWk9Nx0F4BWNks/GRSvKOoPRl+khBHjiOPfgKW15xCpqOgW4M6iOn
	4KMiGncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQDa-00000004uNt-3PGK;
	Tue, 16 Dec 2025 08:15:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQDY-00000004uNf-1k1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 08:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BA4160144
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 08:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421F5C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765872935;
	bh=8WZ8g0mEy7Er2G04e2JUBtm/40jHjH98gpeADHyNXhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pyFSCL7GgqVhLbXa23lLjElfLh7TXxsMghJEwKpU9kVAOwuJArRA8eInWC9RGImCw
	 FDC96m2XWA7cQtTOlR0cGbBWCaaE48b4umCh4WxHzlFV1sqJ+jPeYiPfEzH2rqvMtP
	 uC2xAXAJbCx+oCS/+2Pn7zRy8JdD1jVAIZAaaEfCcC40iOfq9uAhonwFceHam5ZHjM
	 jxg6VtvXxQYDxxnLt/ZzEu5LNwCXc8pSBCUG5slq/oWvHI5LIXQmmRVxmts179y4Ky
	 hl3WlSALUH+ScpWRJ1wcYa/oy6Bar+S71JgebrZ/4lVbPxUbqJfYLma7+xNqFpG4A/
	 3GE/uoZQPRe6w==
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso6494353b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 00:15:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFhHNHh6Op23V7iWNenf8s2+57xmadZMMJvSDajWE4lSrTfrNLDyRZCaDiFOqI6qE8NzPX94iVFl6yu85zTt9w@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8xIMhKdTO3j6zRx/4Z0ZIsliSA1ayFq0Fqxm5Eyg8pcVDuaW7
	gRQfnSuH0OqBz0PdiqllAWMJQrx7g7SOPjF0Y6pFFmRWFUrL4E+dZjRixD46TJ/XrGdlD/0Hsxh
	vkWcl/wm47vwZAhKDO6nkN2MkaNkMPG4=
X-Google-Smtp-Source: AGHT+IF+nSHWTz8ec1cHbhpAFGpdip3Xir5QUqV2r4tGwxPTtzoVhw3Dt2GTzD3aYLJg7Rgnn+OPW44rF20NqRmFkic=
X-Received: by 2002:a05:6a20:a128:b0:358:dc7d:a2be with SMTP id
 adf61e73a8af0-369addc8fb9mr13155966637.17.1765872934696; Tue, 16 Dec 2025
 00:15:34 -0800 (PST)
MIME-Version: 1.0
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com> <20251209223417.112294-1-ebiggers@kernel.org>
 <DEUFDH7FJURL.3J0FN5I19VV8F@cknow-tech.com> <CAMj1kXEQkB9MWB+PAi4XE_MuBt0ScitxTsKMDo1-7Cp-=xXOpw@mail.gmail.com>
 <20251212054020.GB4838@sol> <CAMj1kXHVq1NWA28jKxBrHHi1JOPoGXEamC7uMgTOmFwzmcYxRA@mail.gmail.com>
 <20251215201611.GB10539@google.com>
In-Reply-To: <20251215201611.GB10539@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Dec 2025 09:15:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGQvjcN7gEH_fsxQ-0KW7_Mj93i0LQ8aT6WQTCPiMMcQA@mail.gmail.com>
X-Gm-Features: AQt7F2o-6y27Rl5dgpbF5DqaZ0Tye3uoKErnof0JTlUHQQ7ApPmcPSBBL8_U4C8
Message-ID: <CAMj1kXGQvjcN7gEH_fsxQ-0KW7_Mj93i0LQ8aT6WQTCPiMMcQA@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm64/ghash - Fix incorrect output from ghash-neon
To: Eric Biggers <ebiggers@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
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

On Mon, 15 Dec 2025 at 21:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Dec 15, 2025 at 04:54:34PM +0900, Ard Biesheuvel wrote:
> > > > All 64-bit RPi models except the RPi5 are affected by this, as those
> > > > do not implement the crypto extensions. So I would expect QEMU to do
> > > > the same.
> > > >
> > > > It would be nice, though, if we could emulate this on the mach-virt
> > > > machine model too. It should be fairly trivial to do, so if there is
> > > > demand for this I can look into it.
> > >
> > > I'm definitely interested in it.  I'm already testing multiple "-cpu"
> > > options, and it's easy to add more.
> > >
> > > With qemu-system-aarch64 I'm currently only using "-M virt", since the
> > > other machine models I've tried don't boot with arm64 defconfig,
> > > including "-M raspi3b" and "-M raspi4b".
> > >
> > > There may be some tricks I'm missing.  Regardless, expanding the
> > > selection of available CPUs for "-M virt" would be helpful.  Either by
> > > adding "real" CPUs that have "interesting" combinations of features, or
> > > by just allowing turning features off like
> > > "-cpu max,aes=off,pmull=off,sha256=off".  (Certain features like sve can
> > > already be turned off in that way, but not the ones relevant to us.)
> > >
> >
> > There are some architectural rules around which combinations of crypto
> > extensions are permitted:
> > - PMULL implies AES, and there is no way for the ID registers to
> > describe a CPU that has PMULL but not AES
> > - SHA256 implies SHA1 (but the ID register fields are independent)
> > - SHA3 and SHA512 both imply SHA256+SHA1
> > - SVE versions are not allowed to be implemented unless the plain NEON
> > version is implemented as well
> > -  FEAT_Crypto has different meanings for v8.0, v8.2 and v9.x
> >
> > So it would be much easier, also in terms of future maintenance, to
> > have a simple 'crypto=off' setting that applies to all emulated CPU
> > models, given that disabling all crypto on any given compliant CPU
> > will never result in something that the architecture does not permit.
> >
> > Would that work for you?
>
> I thought it had been established that the "crypto" grouping of features
> (as implemented by gcc and clang) doesn't reflect the actual hardware
> feature fields and is misleading because additional crypto extensions
> continue to be added.
>
> I'm not sure that applies here, but just something to consider.
>

You are right, this is why 'crypto=on' can never mean anything other
than 'do not disable the crypto extensions that this particular CPU
type provides' But that does not mean 'crypto=off' is equally
problematic.

> There's certainly no need to support emulating combinations of features
> that no hardware actually implements.  So yes, if that means "crypto" is
> the right choice, that sounds fine.
>

OK, I'll have a stab at that and cc you on the patches.

