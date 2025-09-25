Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB6ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 17:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DV34Jh3rmW9dLEh6YtNBq6CSoioaSJIBKZUKXfBL0A=; b=lB97oNnYY4h0GIAReHVDbhe0hf
	wiyEdAmE6lUO0Iif+RfEo29YEfpCCF86JhcG9RDTgDLh4k64l1M/pI6197uYHjLolDG6L9VASQXld
	7U5GzAyPQ9XczjdIaeYkvACHzvMcOPznxnSHdErfdzPaVaS0oS9qdVvW8EXnt/dxHoXy+fpDqZ+lV
	X+4HJK5G2Bv2T3D6oxTh6tzHrZFvYyaLxvWX8EZ84Vqq/OeECITVyhpPJfHbN9DaUsg/fksXqiau6
	1TbYE4tr8XIHgWiwOoJ5UODaXXwpQNsb1c78n8ztZ8gLuwV+lmnvtJnYaqUKdxM8xM1tzV/r79yfs
	vWxiTR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pLJ-0000000BLVq-25Zm;
	Thu, 25 Sep 2025 17:01:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pLH-0000000BLTZ-1Rmc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 17:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91DAE45339;
	Thu, 25 Sep 2025 17:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C938C4CEF0;
	Thu, 25 Sep 2025 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758819674;
	bh=O1Q9AD/Y0daQmPvqlI9fuDLvv2ewhUT+6wpWRDKQqr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iT6pw6+gWV8s3l5E4cZeQbmxqmeklnwdSowwMU7NvSCLlTBEkwlQk8668NkNmecpe
	 IaGAgAmwoVM95JQJ9Bi7gFJppo8Q3BuGbgJAPvQMtUA8Ts5v06LLcOirvc1rUrXhyi
	 4qQvdUqI8kGdmB04ByWVSjSUVOtNzo8A3OaHkC5RXVCbNHZ6cPW67LuXFQtzUag0Vk
	 1dVzQQ7lVv8SDPMiZf8kEH++jMl4uIQrxdQvyEfXEmhNhecIaLO2TjS5ra7+dK/Yzb
	 X6ewLT22p6QlXt2nm1OGYZdfwGCfQKGTKje+pt4HjJldlRgVWrqMxlRD/cDKfuD2GY
	 sZ/52E292BsEQ==
Date: Thu, 25 Sep 2025 18:01:07 +0100
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
Message-ID: <38d629f2-99bb-4b13-a6ed-a4126d130b1f@sirena.org.uk>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
 <aNVx9vlgi8t81V6Y@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3c3n0rvpVVOjrHBw"
Content-Disposition: inline
In-Reply-To: <aNVx9vlgi8t81V6Y@arm.com>
X-Cookie: Shipping not included.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_100115_422997_1919C454 
X-CRM114-Status: GOOD (  24.38  )
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


--3c3n0rvpVVOjrHBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 25, 2025 at 05:46:46PM +0100, Catalin Marinas wrote:
> On Sun, Sep 21, 2025 at 02:21:35PM +0100, Mark Brown wrote:

> > +	} else if (task == current &&
> > +		   task->thread.gcs_el0_mode & PR_SHADOW_STACK_EXIT_TOKEN) {

> I checked the code paths leading here and task is always current. But
> better to keep the test in case the core code ever changes.

We can't have scheduled?  That's actually a pleasant surprise, that was
the main hole I was thinking of in the cover letter.

> > +		/*
> > +		 * We can't do anything constructive if this fails,
> > +		 * and the thread might be exiting due to being in a
> > +		 * bad state anyway.
> > +		 */
> > +		put_user_gcs(cap_val, cap_ptr, &ret);
> > +
> > +		/*
> > +		 * Ensure the new cap is ordered before standard
> > +		 * memory accesses to the same location.
> > +		 */
> > +		gcsb_dsync();
> > +	}

> The only downside is that, if the thread did not unwind properly, we
> don't write the token where it was initially. We could save the token
> address from clone3() and restore it there instead.

If we do that and the thread pivots away to another GCS and exits from
there then we'll write the token onto a different stack.  Writing onto
the location that userspace provided when creating the thread should be
fine for glibc's needs but it feels like the wrong assumption to bake
in, to me it feels less bad to have to map a new GCS in the case where
we didn't unwind properly.  There will be overhead in doing that but the
thread is already exiting uncleanly so imposing a cost doesn't seem
disproportionate.

--3c3n0rvpVVOjrHBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVdVIACgkQJNaLcl1U
h9DKLwf/ZZs+qbNGg0ahxmWOTIgk8umedSfGIuB6yoLJVkgIjRv+fhkm19+a7ih7
cBVeUNXJQc6SnE8sBnTU3ETo7CAK6lcnKJI/auXKN2LbKuc2Aw95tYmF6g1JRs8j
Mby5a2btMhAc2gSz5Bz+mmGY34D7cfYOn6rtF5n0dhNnWIbuh0zNvuRXooR8barG
d74uA5v3XTsGbKnSXLYJJjFqbsysAXlFz5XVq0P/ZWNm6zWzeGF6oj+F+AGSXI+8
4A9eMJl0mZ8VVVNcGcYP+qw0l2L8jLOWUrPc8KFCW7aKlSZwjtbWVY7so5ikHHNd
0iI/PRPttN4lzP5lojrLGvLOCoQ4Kw==
=YY2v
-----END PGP SIGNATURE-----

--3c3n0rvpVVOjrHBw--

