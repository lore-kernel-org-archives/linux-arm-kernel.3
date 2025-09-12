Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50954CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnsWNx9b9n/nFBpo4K7P536SZp3NTa4jUVY67kWtsXY=; b=X9bIAEg6YHtIwOsyt/MCt+mpai
	uaXdp+Ex01KBNQO3XeuIn2gA/xEGjR/KYUIVsozfywbp/ZkqfM9bPYO724Zwnxstu72QReOXAMofb
	gdTrDlrLAFrXtXJM7WhIDYDbeHajFAt0lwDeNfVicsjj1o9zOXczQzoCmzHrU9NYUNeH201z8sOtv
	TEZ8QRZI1vjwKIt5OeBOGOBDR9tDyqxiDY9+9xGyVrOZyJJNVS5UfqKICrCgyb7MjlTMuyPnwk4Rs
	3OKuFd3XpqYXoNbsZRRoQog3lmoNCBGnsLr7Bxa2qCswQlEJeu0dcZ42jNxucNJabQDtP6AaZRwEb
	VbdHy32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jK-00000008oSO-3rdr;
	Fri, 12 Sep 2025 11:14:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jF-00000008oNU-05wL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFDCA4427C;
	Fri, 12 Sep 2025 11:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CCDC4CEF4;
	Fri, 12 Sep 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757675646;
	bh=mnsWNx9b9n/nFBpo4K7P536SZp3NTa4jUVY67kWtsXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qy9CElOxO7TKTSvHZ+WBt2DYiefJEdBhwLqBjp5ZF4QHckz28dQ0t4E56EA8rcz3m
	 UhmaQYDN3QC63ASHmgBo6Lu9O6n2cSlGECU/f+Pwo894bDj7YE9cde7rpCa1rIctAo
	 Yw8ue56cJfaO9YHTU433AhnPWi1Gfrj/ySngq2SSNxBkiR26dkRigCnGT5C+DAS3gW
	 wdK9jgBLtaCK7dwAMTUuV5Pwi7YQ9dLB1pza0PXZzWx0l0UqRhgF4mtWUIPFSOVYxK
	 h87CeO9JLtuPr3Q3bP2txiqNerPZMTdThnazqfKaCcYmdl7LnAOabIO1IOyWnjFyJQ
	 Znjd585heQb8Q==
Date: Fri, 12 Sep 2025 12:14:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error:
 use of undeclared identifier 'HWCAP_GCS'
Message-ID: <a1dc9839-ab45-4dd6-9eeb-4bbc35bf8d90@sirena.org.uk>
References: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
 <1e331ebb-3315-4cbe-b194-ccbeeaded4da@t-8ch.de>
 <965c8d7e-c5f2-4bd8-ab7c-c3116632f015@sirena.org.uk>
 <5e4d9943-3a8d-4281-9007-f49bfc66dc6d@weissschuh.net>
 <b9b8b8cf-4920-4f9d-bcea-bea913058601@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1bnwqmLN9TK6wYkC"
Content-Disposition: inline
In-Reply-To: <b9b8b8cf-4920-4f9d-bcea-bea913058601@weissschuh.net>
X-Cookie: Your domestic life may be harmonious.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_041409_083778_1A233BD1 
X-CRM114-Status: GOOD (  11.90  )
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


--1bnwqmLN9TK6wYkC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 01:07:58PM +0200, Thomas Wei=DFschuh wrote:

> The Makefile does *not* use -nostdinc, so the nolibc program probably fin=
ds the toolchain's glibc asm/hwcap.h.
> There also doesn't seem to be a static arm64 hwcap header in tools/includ=
e in the first place.
> I am still wondering how this works for the other tests.

make headers_install puts a copy in usr/include, probably we just need
to include that in the include path.

--1bnwqmLN9TK6wYkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjEAHcACgkQJNaLcl1U
h9A1rAf9HVWRdnBd20hpputtVK81rxY+MZvY1yVTmrP8LNTIseS2cf8IdsA7k/z0
sJSWK/bj7P6ydPFBgpMkE0x4Ac1IMCL4uRUQIuPTPmmP3zf3/8XYzE+p5l4X/DAK
QxNUxjQAwe0RUTBwTqv+IlnjLJSsEdkSaQLkb2a/cYUobJ2zOiiIHEsuAtrwNc5J
hBM9bg+j2rTyUClmOODnnf1X60optmElY4qPpY/bvvJJjYR+vm5uMKe2rIjtuUOS
pEtsNvC+x9uQQJJEZAq7zE3mQhDxBNOuCxIt8aPJBBLUOMXyAC/ncXip2xz0pYzS
wkuXsLfyepD2oajCOYpck05zbisibA==
=o/dM
-----END PGP SIGNATURE-----

--1bnwqmLN9TK6wYkC--

