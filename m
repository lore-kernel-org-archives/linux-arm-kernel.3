Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBFACAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGituH0/fSHxn1+IpO/cakF5XuILgvz2Rr+COc1qmvo=; b=0Qfxdzn64YVcSe0ExSE6QFrqwu
	ZP2TKyFG/iUwAcl01A4gfmnugBkMFwDPiRiL7jGieWbXm0lXe4dzVT+bABFsGaRoVoYsuGSVO2yIJ
	cgZwge15YMnVkKzpXZkEwfYOS1jjLyI1uqxgMINfeLcoh6BZB9ol4PJJdE1DJiknKyOC3IcKiT57F
	K1RJYLPeImqaMJgWFd0igAFAXGP/eTJUA6PbK5X9VZFFZ8+HYCib5UwglrCyY7ohvupekVfz4UPS0
	XkCXF6JNny8iFu4vBqv8FoHRbF3E6BPpWRQIS1JTsxyzV3AOexk3Lb8VQHC0nvdIZLrFMU4fiXIsm
	JubWIuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rCz-0000000C8gd-2Xn3;
	Thu, 25 Sep 2025 19:00:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rCy-0000000C8eR-0QTi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3878C61209;
	Thu, 25 Sep 2025 19:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB6BC113CF;
	Thu, 25 Sep 2025 19:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758826846;
	bh=x6vyQiQ8KY/ybTVjHPahCNlgiHb+wpGqrxCLrlkq7wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=us2HiNCG1WxPWhvMS1akL9Zvv2OSsFHlv4IZpumOdLKRUqDmMNkkyK/v0TDboD1RM
	 p5G76RMnfUqjFC+Gi+DSuL972YvH0JoFpDG9Xb7tUf7AuRCoXlncOvKTHVXtxXse3s
	 516q4DlyMhqABQFz9NpmKaqexGEJA7qCamRUF39KoTjZeP9BOAWcPbgFVdaPB7ToAL
	 HsAzWjfthh2i/n8ys2mMSzywYcTxaIhobysaX9jT0lXFZhM4DGYP3Bfo9i6Vc6jBGE
	 dMekOq4IaxB01eijEfj1Yqs99knmpGshegBwS4qNmrC/NRveZ665irDFgws5f7+mNd
	 lPLMgXbSYIE6g==
Date: Thu, 25 Sep 2025 20:00:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Carlos O'Donell <codonell@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Szabolcs Nagy <nsz@port70.net>,
	Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64/gcs: Support reuse of GCS for exited
 threads
Message-ID: <41929a12-59f4-419e-9f15-eaa09f0df0f3@sirena.org.uk>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
 <aNVx9vlgi8t81V6Y@arm.com>
 <38d629f2-99bb-4b13-a6ed-a4126d130b1f@sirena.org.uk>
 <aNWLwkn1fJDvWUyu@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CgoqWbNTUvZQnot8"
Content-Disposition: inline
In-Reply-To: <aNWLwkn1fJDvWUyu@arm.com>
X-Cookie: Shipping not included.
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


--CgoqWbNTUvZQnot8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 25, 2025 at 07:36:50PM +0100, Catalin Marinas wrote:
> On Thu, Sep 25, 2025 at 06:01:07PM +0100, Mark Brown wrote:
> > On Thu, Sep 25, 2025 at 05:46:46PM +0100, Catalin Marinas wrote:
> > > On Sun, Sep 21, 2025 at 02:21:35PM +0100, Mark Brown wrote:

> > We can't have scheduled?  That's actually a pleasant surprise, that was
> > the main hole I was thinking of in the cover letter.

> Well, double-check. AFAICT, gcs_free() is only called on the exit_mm()
> path when a thread dies.

> I think gcs_free() may have been called in other contexts before the
> cleanups you had in 6.16 (there were two more call sites for
> gcs_free()). If that's the case, we could turn these checks into
> WARN_ON_ONCE().

Yeah, just I need to convince myself that we're always running the
exit_mm() path in the context of the exiting thread.  Like you say it
needs checking but hopefully you're right and the current code is more
correct than I had thought.

> > > The only downside is that, if the thread did not unwind properly, we
> > > don't write the token where it was initially. We could save the token
> > > address from clone3() and restore it there instead.

> > If we do that and the thread pivots away to another GCS and exits from
> > there then we'll write the token onto a different stack.  Writing onto
> > the location that userspace provided when creating the thread should be
> > fine for glibc's needs but it feels like the wrong assumption to bake
> > in, to me it feels less bad to have to map a new GCS in the case where
> > we didn't unwind properly.  There will be overhead in doing that but the
> > thread is already exiting uncleanly so imposing a cost doesn't seem
> > disproportionate.

> You are right, that's the safest. glibc can always unmap the shadow
> stack if the thread did not exit properly.

> That said, does glibc ensure the thread unwinds its stack (and shadow
> stack) on pthread_exit()? IIUC, it does, at least for the normal stack,
> but I'm not familiar with the codebase.

Florian indicated that it did in:

   https://marc.info/?l=glibc-alpha&m=175733266913483&w=2

I did look at the code to check, though I'm not at all familiar with the
codebase either so I'm not sure how much that check was worth.  If the
unwinder doesn't handle the shadow stack then userspace will be having a
very bad time anyway whenever it tries to run on an unwound stack so
doing so shouldn't be an additional cost there.

--CgoqWbNTUvZQnot8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVkVgACgkQJNaLcl1U
h9ABjwf+MjEOpbiL1LV0wvqM6hA6ngml+WiJewggEO2yakCAFbskLF+lBun0fkAd
Byyuasy8H+g3RTzb1Lm6Iowg8u5bJhGUAQTWHl8X5zYOzwwYAsN0GUHTF7++E0zW
vTJh99nObpUu4Lp+ophez6MXVLdACxBGtKGe8TAcmyzP91lNQFFfI95yHI4+KZgT
orvGqMfMfdDhO4RlnP2ACRPrn2PfUTv58dHswSnKatMkmdNc8IdfgHkhC5IULkjo
x+xygqMjNZgHBjkm1JZt8LgHrk+PWirDtJAAob75J5EY++oVE++myxn3l+PAvIYT
W/vpKk5RJHwrnEu5tz8He6oIp+Ubhg==
=PJLP
-----END PGP SIGNATURE-----

--CgoqWbNTUvZQnot8--

