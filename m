Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E56C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4MPigQHRSL+GO7PwEP/w75Kqk4G5JLZcOPJ2vqkpCY=; b=y6OFTXpH4kccCiBPj+DID0Sj7U
	UjPPaI2scAYObSstR+GhzMVGV6X7SbyXUOI2aJf1Iyd+iG2CnwasgTpK8MaRiAvtzaLGpsU+8pEcy
	ztDb3yfgWm2LYJuu3jEtBu/mzJwcRivoXWSL9iHCBQqJxzca4pgW+MBMoEttlq0Oyz07POE3jIcK+
	YfMkSSY6FeXbLpDj8xLfQITyJ96yKlRO4hkXM0WAsxZ1dbHD8S1PaosFK94qmXl0MVgmI/beT4Vd9
	00eoisK6S8gD/H1AY8JXQStDA/pMDvgBhhncs5tCmF0Z1WHAIrln9FSAK67n92a402HPd6B57F1x3
	N7GsvD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1Ek-00000007ev9-2gVN;
	Wed, 16 Jul 2025 12:27:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1CF-00000007eTM-2KJB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8EF34A571CC;
	Wed, 16 Jul 2025 12:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AE5C4CEF0;
	Wed, 16 Jul 2025 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752668714;
	bh=HnQuLJNDufQH+NJlbQVdqNkKpgfX14m2aqApSayEub4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgJX3G9spBWVSY9bG71ob2ZdWIzMqINBff/MyCdEsAXrwOch57QR2aWxrKym9gciS
	 CBHU2pYV6dwDYQZnptW+cK//5/KsuSwlgF3tKa/v2XAM9N0qdzYDRt7Q71aLzbPMIX
	 BTtX6PMwdPaepW5PYcwf+OIVjqHEfw5jxIUUcE8w9M/7cAGgJ1OmAylteTWXr8JGbl
	 JwdslBkcElxlRgDIbn0Mf29UYeI4cMfr6O3RqFJU1YIiNsc702r+jss9RXIrj9ZnIe
	 NV5wqTm2rAZkyyGX6BTctfD5e3pdKHBTAvvNj8Bz0EzjrG9iS7bD8YLSj5l49e/fCX
	 IsmbUVLNbBsZw==
Date: Wed, 16 Jul 2025 13:25:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Christopher Hall <christopher.s.hall@intel.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Werner Abt <werner.abt@meinberg-usa.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
Message-ID: <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
 <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
 <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rZ9x4sZFElGFq5dB"
Content-Disposition: inline
In-Reply-To: <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
X-Cookie: Trouble always comes at the wrong time.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_052515_733054_6B8A26A6 
X-CRM114-Status: GOOD (  19.16  )
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


--rZ9x4sZFElGFq5dB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 10:04:21AM +0200, Marek Szyprowski wrote:
> On 09.07.2025 09:34, Thomas Wei=DFschuh wrote:
> > On Tue, Jul 08, 2025 at 05:49:18PM +0200, Marek Szyprowski wrote:

> > This fix looks correct to me.

> > tglx:

> > Are you going to fold the fix into the commit or do you want a proper p=
atch?

> > Marek:

> > If a new patch is required, do you want to send it? You found and fixed=
 the
> > issue after all. If not, I'll take care of it.

> If it is possible to fold it into original patch then go ahead, it would=
=20
> make less noise imho. If you need a formal patch, I can send it in a few=
=20
> minutes.

This issue has been present in -next for a week and is causing a bunch
of disruption to tests that end up relying on the vDSO - do we have any
news on getting a fix merged?  Perhaps it makes sense for Marek to just
send his patch so that it's there if needed?

--rZ9x4sZFElGFq5dB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh3miIACgkQJNaLcl1U
h9AwsQf8Dh4Am3MMQ0T4kXwpbSzQlrBQ4irGhUtIF5FnACyGfWqHDPzRIY90+ktY
swfIUjZlYKOGsj4YFd0rx2Bvz7iqtVIaBWbDvwSLZHn9QSwBrWV/+p4tb+z7BZCv
CHvdRfuI4lshyLOAV/kRok5EZIIJo7NjT7DmNTlB6ihRNhPPyEL2SNnSYuUBf7z0
0zixH/gSQcD/7J13PVFQywUxWp3c3h6mhQF+ulqEMBI7H4y/EqrvgVkFFx+Od0kt
LVx2o34PMyloMfc63TnCSYJPGZTpYfmAl/aXeoZ2uPekpvhwG2KlIIlEz0cVUKQl
/dVL2JSUa+QaMUyxqvPtOobl6/XukQ==
=5BAm
-----END PGP SIGNATURE-----

--rZ9x4sZFElGFq5dB--

