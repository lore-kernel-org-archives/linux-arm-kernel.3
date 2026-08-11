Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE91C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sWlUZt2hIyx5lBiU4DkHYxqIqXd66gLt2iNZUww8GY=; b=18SnjP08B77XwltYCJdw4dtUlE
	qBN4g4xvrElTYVF0dLKVWSAet4k2U7Qtk+ThHtUAgLNlU5Yx3TPlbkAoPRcZQsDAwCbQvcDiXiRGQ
	+27sYrvowWn8kHeG4gyYZlu6jcurrKAIKtQwYnKbBHtluRh8ZWdQMILh9fcreW+KZoXp8A7bHPrk3
	tz1/vdgijPvPJWU/MYNSc9A1o+RqTw4p8I1K+zx7LY8dLIO7zngKJ4wbOqWlmhP+GdG0MK7XL6WZn
	Hy/4gZyTkAw9UigfJD+wBxowsEWtLO15uoYgOv6YEnOZIFA28kMAjL7EncuA0Jz5TAFi6xILiLJDD
	gbyZmC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqC1-0000000EdEs-16wb;
	Tue, 11 Aug 2026 17:23:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqBz-0000000EdEc-3kHg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:23:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C7DA600AE;
	Tue, 11 Aug 2026 17:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43B11F00A3A;
	Tue, 11 Aug 2026 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786468990;
	bh=/sWlUZt2hIyx5lBiU4DkHYxqIqXd66gLt2iNZUww8GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/bHkv9WcMTKagZFH81Gk+brL25RmGd+eLsleeqA9MAAaoGnCtkCyfljPNMRaOH3J
	 Lc1Gw5XWDrc69o0RcIDwN7ChAxTJPv4audpUB8wOJwoAuhFNCq8FKDq1acBuHqz8eb
	 HtQnSCdrP+wE/xg5R5iLVpsGjn5xvhLtVBo/jgVBlzvlqYV8VOTXOSFKR1IS/nSeKb
	 z3kedgLahvTH8o4dNxMUukPO89hxz5LkfZZcLhxaU8StwSLwpknrzPPdnkGX2VmXhV
	 2MjngvNiKT9VuHCzVl4BK06kx2LwZrR5sliaZkoXUbQ8lYKtuyk4Fhf86zc8e/OJIl
	 V3sxyX+SKbJHQ==
Date: Tue, 11 Aug 2026 18:23:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org, Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <ad261bfa-5301-4b3c-a146-86111d15e644@sirena.org.uk>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
 <CAKwvOdkVxt-90Z_Af8s63RKCY-202r_0_bgF+8-g7iKn6XM_Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YYZV6sPaIVLOCKHI"
Content-Disposition: inline
In-Reply-To: <CAKwvOdkVxt-90Z_Af8s63RKCY-202r_0_bgF+8-g7iKn6XM_Sg@mail.gmail.com>
X-Cookie: Take me drunk, I'm home again!
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


--YYZV6sPaIVLOCKHI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 09:17:09AM -0700, Nick Desaulniers wrote:
> On Tue, Aug 11, 2026 at 6:18=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> =
wrote:

> > https://github.com/llvm/llvm-project/issues/215547

> Thanks.

> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106671 was closed as
> invalid pointing to the same commit in llvm. What's going on here?
> Where's the corresponding feature request for GCC?

TBH I'd missed that that got closed, basically it's what's in the report
there - the GCC people really dislike the idea of adding landing pads
and want to see veneers added by the linker to fix up issues where
they're missing.

> At the least, I could imagine there being a `-fno-omit-bti-pads` or
> whatever for the kernel to opt into this behavior.

That would be useful.

--YYZV6sPaIVLOCKHI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7WnYACgkQJNaLcl1U
h9AlWAf9EDmcgnnvuL4cqwpOwcFQBZ+OC5V5uyozWCWwwgFZWuxMkGFmeh9jP133
HxdCeyAn4jdemlf7UuUPAVjCCrd1a/vLdbUVWSDpxCqd0eCK0FiSG1a0l+ybSDdf
l2AH8bLabTs1znEf1iKhKnRF32zzYxIB+kbiBSOpqIVDRSZcUS4kOAK+tyHvHVFc
t6es633XMyu7a+P/Y3p4kRNlPF9W4p/xks40GlVe+Qi6PZ23K6nlIRSDpTUmR2dI
TCjdXk3d8f5UVkXb4xGbzKTEGAuIUifDxi2e0AgMKCd+4MTtOhiyb8bzsxjGTUkG
U0sngeJ0+vaxaJ8iHRjWANooW8b2pg==
=eLwd
-----END PGP SIGNATURE-----

--YYZV6sPaIVLOCKHI--

