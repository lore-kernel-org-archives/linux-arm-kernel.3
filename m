Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD65D5B174
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjdtjNpj32b2G7UMC7OVPOm1IVXgYZarnYzEj0bcAJ4=; b=LO+iZaXwNzX/UG8ToEklzjVmqs
	UI/CZCW1LaSsyUf28MF5co4VNDj94kmbYuPnoHbDYJnVH7N+L3Gv6IsgPT5Nh1KUai2ZrFhtK9qNh
	jznJ06ztIn6mZ/Kqhx/XgeR7Gw1102OAmdsU9gvrGvjSRyAlG1zHocPMbs0Nfd6rnwfeRcsLSPkBu
	e/Cup0azjhgO+CUpcBIKo1x/5CEydFy1XKmbQVuC6RhE+DA9yeG2eCON3fTMn5jM38JDRc2RPIiXu
	8scoBBzjPilbEdEQM7YCA2dzT0USfuJuTIXZDdlfRGGw6IBUVGvyWUleK8q2os9RY1wenD63yi7sJ
	WZ8ndF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEzQ-00000004DbO-0kst;
	Mon, 15 Dec 2025 20:16:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEzP-00000004DbE-0CRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 20:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2058F60156;
	Mon, 15 Dec 2025 20:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E44DC4CEF5;
	Mon, 15 Dec 2025 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765829773;
	bh=lF8AfJF90zeVvajpf257VP8+PAS/iA+1OUWO0EJGo4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTq7jxl+/X4t0clkH+mEIN1Yg389a3M1yJZlum/0+HWjs0BADwL0wGHgJE2yuY56G
	 BY2dQ0dXnWxEsVWSdJe4hqMGCzyh5sRgqf2VUyDrteCmtp4ljq93GTSPvK9Xp0qqG0
	 bf39yzzPeKqFVFzbEe8n93pn1mHzt8YQghp1i8rC/fkyWiTHTKTwgBHOaxs9YXV1Zp
	 KPO9xp0g+xQKuR7S6e9WocY5rOmKO+YSVUbO9i0bH16S+U+Od5e5R5P0w3Zk8WSYmt
	 FfjLs4qx3LdNpN0VkOuB1gHDxqiW6QUkLG1pTXEbLL2jqub0IYwiviCRP9AZpCe05U
	 kof8RhLgE7img==
Date: Mon, 15 Dec 2025 20:16:11 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: arm64/ghash - Fix incorrect output from
 ghash-neon
Message-ID: <20251215201611.GB10539@google.com>
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com>
 <20251209223417.112294-1-ebiggers@kernel.org>
 <DEUFDH7FJURL.3J0FN5I19VV8F@cknow-tech.com>
 <CAMj1kXEQkB9MWB+PAi4XE_MuBt0ScitxTsKMDo1-7Cp-=xXOpw@mail.gmail.com>
 <20251212054020.GB4838@sol>
 <CAMj1kXHVq1NWA28jKxBrHHi1JOPoGXEamC7uMgTOmFwzmcYxRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHVq1NWA28jKxBrHHi1JOPoGXEamC7uMgTOmFwzmcYxRA@mail.gmail.com>
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

On Mon, Dec 15, 2025 at 04:54:34PM +0900, Ard Biesheuvel wrote:
> > > All 64-bit RPi models except the RPi5 are affected by this, as those
> > > do not implement the crypto extensions. So I would expect QEMU to do
> > > the same.
> > >
> > > It would be nice, though, if we could emulate this on the mach-virt
> > > machine model too. It should be fairly trivial to do, so if there is
> > > demand for this I can look into it.
> >
> > I'm definitely interested in it.  I'm already testing multiple "-cpu"
> > options, and it's easy to add more.
> >
> > With qemu-system-aarch64 I'm currently only using "-M virt", since the
> > other machine models I've tried don't boot with arm64 defconfig,
> > including "-M raspi3b" and "-M raspi4b".
> >
> > There may be some tricks I'm missing.  Regardless, expanding the
> > selection of available CPUs for "-M virt" would be helpful.  Either by
> > adding "real" CPUs that have "interesting" combinations of features, or
> > by just allowing turning features off like
> > "-cpu max,aes=off,pmull=off,sha256=off".  (Certain features like sve can
> > already be turned off in that way, but not the ones relevant to us.)
> >
> 
> There are some architectural rules around which combinations of crypto
> extensions are permitted:
> - PMULL implies AES, and there is no way for the ID registers to
> describe a CPU that has PMULL but not AES
> - SHA256 implies SHA1 (but the ID register fields are independent)
> - SHA3 and SHA512 both imply SHA256+SHA1
> - SVE versions are not allowed to be implemented unless the plain NEON
> version is implemented as well
> -  FEAT_Crypto has different meanings for v8.0, v8.2 and v9.x
> 
> So it would be much easier, also in terms of future maintenance, to
> have a simple 'crypto=off' setting that applies to all emulated CPU
> models, given that disabling all crypto on any given compliant CPU
> will never result in something that the architecture does not permit.
> 
> Would that work for you?

I thought it had been established that the "crypto" grouping of features
(as implemented by gcc and clang) doesn't reflect the actual hardware
feature fields and is misleading because additional crypto extensions
continue to be added.

I'm not sure that applies here, but just something to consider.

There's certainly no need to support emulating combinations of features
that no hardware actually implements.  So yes, if that means "crypto" is
the right choice, that sounds fine.

- Eric

