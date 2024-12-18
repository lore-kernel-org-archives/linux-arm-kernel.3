Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18A1E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RQViP45maV7NT40+CZ3HwfBAKJFdk/V6E6ruuYFy6s=; b=iljeeWZAaUhOD7zhnvA61SI1/S
	9uck+95FrNXPjsx3l9V2JztL8aM0A5cxwMw0NbIYC478i2A/m741it73RjAYofswaSPkLe9hS1Vlk
	QAfoEYQwQGcRPYjbz8E6Z2/q34H4ymY0dxP8p4j1ULDZ/ArcGfz2NySasWeWo95yO1k/u2u1lIR6s
	hLCKwwtlHdVvZZtwSyhiGDnwapo26EwQyijQuyLFGKBbxIrrWGxQdbII/zOimHJn8ZF0kDg5hOtfY
	xZ5Vb3w0wh/9KJPGL2DI6EsdRJGmdzioTjxjh/jn+mmvpm+Q+1aTV3PZ/rwOEtsrOIbeZPATAJiSH
	xFnI0ZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtvQ-0000000GhfD-3VHj;
	Wed, 18 Dec 2024 13:17:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtuI-0000000GhSF-0Odf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45371A42646;
	Wed, 18 Dec 2024 13:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7621C4CEE0;
	Wed, 18 Dec 2024 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734527764;
	bh=l9forY4klmLDyr2OClnwW4+1ETo7go2MZPlvCu9Tm70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IG8ey8h7//M4ep2eQPtNzmQ8JBMXfkC0HjavAValvFR2p2oxKGATDfBRrwdyp10QI
	 5Te4pTFdFXcs6SdxHV9VBP4HjwDV28C47Ilz24ZQ/mtVnAAo7QSz2DmS9OHgSh9ZvF
	 imDlZQmSkSLNZMLnMC7uG7B+r+PN+M5smDvI++Fgi9B44WADmPA9meRdHYaajwzrez
	 RnfvXhtzGN41I/wa+t5fLW5mCrMHLvTOisq3JHgzQLr2E8SllGXbX8cg7qWeXWVlOC
	 zAtJC34JiB2ex/yb+GFV/E1/NAiDsTlyxOgdE+AV+mLVvXtgVtkgvFjxVyc0O5evwq
	 prjOiw8gzGccA==
Date: Wed, 18 Dec 2024 13:15:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 6/7] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
Message-ID: <bdd53fdb-9ba2-4d55-870f-9cb40e1e6b21@sirena.org.uk>
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-7-anshuman.khandual@arm.com>
 <20241216234251.GA629562-robh@kernel.org>
 <c64709f7-e1c6-482e-8665-912be50b15bd@arm.com>
 <CAL_Jsq+EO_s49sSK3JQQEDDpcndf4hSpM_gfoe8tZ8=4y3f-tg@mail.gmail.com>
 <86jzbxqrtw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="txhY7J+znJqGvstk"
Content-Disposition: inline
In-Reply-To: <86jzbxqrtw.wl-maz@kernel.org>
X-Cookie: The heart is wiser than the intellect.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_051606_198524_700019D0 
X-CRM114-Status: GOOD (  13.83  )
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


--txhY7J+znJqGvstk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 09:10:51AM +0000, Marc Zyngier wrote:

> But I don't think we should be prescriptive about the state of these
> registers, as long as the potential traps are correctly handled.

The rest of the document is written in terms of explicit register
values, if we're changing approach we should probably update all the
existing requirements to be written in the same way since having a mix
of approaches tends to be a big red flag that there should be different
handling.  Consistency will make the document clearer and easier for
people to work with.

FWIW there is an explict note in the document about the fact that it's
an as-if rule:

|                                                Where the values documented
| disable traps it is permissible for these traps to be enabled so long as
| those traps are handled transparently by higher exception levels as though
| the values documented were set.

=66rom when I raised this before.

--txhY7J+znJqGvstk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdiyw0ACgkQJNaLcl1U
h9AC4Af/X9JZs6LZP10tQfJ6uKA8Yyksj9YhS5543bjN12DgFPQm0JsICS9sGEul
G5/NmFfdWBKCKdUc6lqA54+fM8OaeM4aS62sh1/V2dZF9sfNUH5GCwEJt93treZp
DRA4GBM7d1DPGE4hpHdsQry//bElhMdERuMyGtLiPuUQMzirXaqw7iKCGd7KjznO
+cl2mVx3k0y3YV2qNPyjmPHp2Bub5PgpqJO7/2bl4lkBZnotd2JLocKUrpMkW3c7
2p0+B7o+v99TUT0DsDelNf1afHOaz1T5kHjRYLJHzc8apkjiiboR2k9fYXVmnxhy
9jgklnvNB/i1DnMonWre4izlrkjEiQ==
=w+6F
-----END PGP SIGNATURE-----

--txhY7J+znJqGvstk--

