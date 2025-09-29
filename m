Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B849ECAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsBmI5SIo5G4sDK/R4AHPA5uH7TsY2UfdpliLn+M1X0=; b=o+P83vsYzPqSl3g3E/beoXuvG8
	muRP74fN2fp5PEghtO3lPpSmNAE9+Eiky0xkbXxcAy5AULSvr7eTYVPI/WfOXuFAHwAKOxHzxonUF
	5zSoalqzS+G8OlCVbVo1zNnO9DbO/Vpsd82WUTn9lbv0sEHHbFfL7k8djknvNIrDwTZ/rcOKdhC63
	mMkQ2tr0r4JzP2pfSbGCXxTbU2LXQPZGDtuOhoo5lXLK2LinooNF+tGIF/MXZOjSr08t9kigALtTn
	Tco3m3HT5WYLVWgvCHwD89KyGFq6kGphtSGhcMk9/5OSskjgad35aYGM0J4V7KCfaTFRWgJDrdj4z
	7NI3YNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G6L-00000002p8r-3QNi;
	Mon, 29 Sep 2025 15:47:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G6J-00000002p8i-41yw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B11D625C2;
	Mon, 29 Sep 2025 15:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B373C4CEF4;
	Mon, 29 Sep 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759160863;
	bh=URoRiJpvfzY/qJO4BWJD2PxiH4IP1gLR8iG4C2gTC4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxuNIqIS/y7SFX7DqksrGpsfRi9OmW7w639bH4FW/ongQuHKKAzK/QBZSW+olYIz5
	 FTxX7MSXzTPgjY/QcTjdIqQCZ2ojwg/kzzik0fz+w31Z3NG6RMiXeOThNCLfR6b9pI
	 DlwUsmMHbnMoe78TDnk7tYxes59781XRKoMtE9QTJL6zMMAJJWr7Mt7jRdrT4x2sf8
	 XFlBEfm1l8KYAB3v6l2LDNC+jfrtjFMbLSC/qFAaG6aKtP1E1enccObKCzYHc9wSTn
	 v/4FlelTf8huZjN2kdlZIHn+2uz1YxOAIb+5KDpZ18q0YlnHjWO3XvHI3UdSgvz/M3
	 NqqegVZIdoG4w==
Date: Mon, 29 Sep 2025 16:47:36 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "adhemerval.zanella@linaro.org" <adhemerval.zanella@linaro.org>,
	"nsz@port70.net" <nsz@port70.net>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"dalias@libc.org" <dalias@libc.org>,
	"jeffxu@google.com" <jeffxu@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"yury.khrustalev@arm.com" <yury.khrustalev@arm.com>,
	"wilco.dijkstra@arm.com" <wilco.dijkstra@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"codonell@redhat.com" <codonell@redhat.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH RFC 0/3] arm64/gcs: Allow reuse of user managed shadow
 stacks
Message-ID: <edd79fba-c5e0-4020-aef3-57dc01c077d2@sirena.org.uk>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <760447dc3e5805bf5668e80a94bf32356e2eb2d3.camel@intel.com>
 <aNasTpkYm8n1AHZ7@arm.com>
 <04dc6271e11b453204255779fcd3c29573c9c296.camel@intel.com>
 <5c616340-2767-48f0-8727-326deebf718f@sirena.org.uk>
 <80f8389c5c136ce21d922be10e4978d1ae5f1139.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TB4gd7jcOJO5ieTv"
Content-Disposition: inline
In-Reply-To: <80f8389c5c136ce21d922be10e4978d1ae5f1139.camel@intel.com>
X-Cookie: Stay away from hurricanes for a while.
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


--TB4gd7jcOJO5ieTv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 07:17:16PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2025-09-26 at 17:03 +0100, Mark Brown wrote:
> > On Fri, Sep 26, 2025 at 03:39:46PM +0000, Edgecombe, Rick P wrote:

> > > > What do you mean by "a fuller solution from the glibc side"? A
> > > > solution
> > > > for re-using shadow stacks?=A0

> > > I mean some code or a fuller explained solution that uses this new
> > > kernel functionality. I think the scheme that Florian suggested in
> > > the
> > > thread linked above (longjmp() to the start of the stack) will have
> > > trouble if the thread pivots to a new shadow stack before exiting
> > > (e.g.
> > > ucontext).

> > Is that supported even without user managed stacks?

> IIUC longjmp() is sometimes used to implement user level thread
> switching. So for non-shadow stack my understanding is that longjmp()
> between user level threads is supported.

Yes, that was more a "does it actually work?" query than a "might
someone reasonably want to do this?".

> For shadow stack, I think user level threads are intended to be
> supported. So I don't see why a thread could never exit from another
> shadow stack? Is that what you are asking? Maybe we need to discuss
> this with the glibc folks.

There's a selection of them directly on this thread, and libc-alpha on
CC, so hopefully they'll chime in.  Unless I'm getting confused the code
does appear to be doing an unwind, there's a lot of layers there so I
might've got turned around though.

> Again, I'm just thinking that we should vet the solution a bit more
> before actually adding this to the kernel. If the combined shadow stack
> effort eventually throws its hands up in frustration and goes with
> WRSS/GCSSTR for apps that want to do more advanced threading patterns,
> then we are already done on the kernel side.

Some more input from the glibc side would indeed be useful, I've not
seen any thoughts on either this series or just turning on writability
both of which are kind of orthogonal to clone3() (which has been dropped
=66rom -next today).

--TB4gd7jcOJO5ieTv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjaqhgACgkQJNaLcl1U
h9CVxQf/eWHRRunA9pDbxljpsxxDZVq5oza9BFSJWETarOjElVwdpN0C1zOuNgV9
Of4pK7kfkOO7cGw5HNxZlCvk/ixi78Fw7K9EA2WPxKb6JsbbCB6C2ZeCNNl112Y2
yBSweBPKCMLVl/hjC8vE5RjPX0K5eNsifF1FT75fvouXnl0vrUE1dG160d0C1dps
3Cy5m1OS4AiqHJFWNmm3j6wXDSwpuWjcJXQWG7A7+5ZZvlbxv8u2ThZ1xs77NgGZ
ZRteYOMjf6cjg0E+yexveJn7Ld/IMo6iz2NAgJV7Fk4iNkQiKRaT52ultSgwvdsK
CY3CZYU96MfAGENjVVWWwjWuxTJaEw==
=J5MO
-----END PGP SIGNATURE-----

--TB4gd7jcOJO5ieTv--

