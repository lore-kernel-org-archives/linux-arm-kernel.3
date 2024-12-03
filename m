Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76372E77160
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHovkVW6REiiiCFyAhJ+JqNCBa0opkh9DJwle8ld2R0=; b=0Zkpb7GS26T8qjvWMwDisXYJV1
	/Tgg0CvOIMk/HyeK6R4HfNRhFb6phlxTOukAgTL1Bljkb386dny1QScFAu80CmQxY2APmuNm+eSIZ
	mFSuUqAAAQx59tkw3ZTfgoTqlNassZUc7450scw/B8ZexF80E1RzWvnFjXOfTyVvSOigEZ24dcw/9
	Q1opJLFqkH18cqL6CmSb+sdjm650sv6gDwOcWza6dY2ZFOGcImorVdUF0DGLCfhh3b3CVU/g50Uv2
	pjrsALpmaQsanL9ZYdLSgedNwYcQWF17NKfLL/JQS8PGSIbxEcUWCO6AzUB1E1k4I/4bcnByBvp37
	5/oXy54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbsZ-0000000Az5w-2AgQ;
	Tue, 03 Dec 2024 23:00:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbrY-0000000Aymu-1Apo;
	Tue, 03 Dec 2024 22:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A5C85C6DC5;
	Tue,  3 Dec 2024 22:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A55DC4CEDC;
	Tue,  3 Dec 2024 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733266763;
	bh=RHovkVW6REiiiCFyAhJ+JqNCBa0opkh9DJwle8ld2R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rn3dN8XeKM5vVkOfP7bFH82cyF2OhOe7YMZqUkY3EgOXMhYPv8lzs76l6dxOdv8Ng
	 Lb+v/wLBHkzoHCGe0kYd38ICn8tMeBTNyjxXHaTVZq0plXNY9ZOZN9o8nnlRSz+5mx
	 DxUBtOKuYVoZVDtwwPa1sUm7o1okC8KfhoZ1GX9dKBdGZ1/pSHPJaq85Xu0O5IGncw
	 bRASROsD9nHFm8zo0NZAr+lJRW6Uk1UHeEqscZGtdDQEC25TeHUGgObOntX0ScRG6Y
	 rMZHWHH+rQgZULwczzz4FKW4uPe2zs+o9eQZqTjtUdw/5uFvVHr0LLRrzlvae3ezfv
	 Z2qjCA0a2vDrQ==
Date: Tue, 3 Dec 2024 22:59:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Message-ID: <31edf979-e03a-4c9c-bb93-59ceea6b44a1@sirena.org.uk>
References: <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
 <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
 <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
 <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
 <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
 <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
 <1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
 <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
 <dbb2de3c-cb29-4384-a00b-4fdedeab1a10@sirena.org.uk>
 <c982c5061ea6b0d465dd8b7fefc59cc7.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oHjAMmplQrPbLqyA"
Content-Disposition: inline
In-Reply-To: <c982c5061ea6b0d465dd8b7fefc59cc7.sboyd@kernel.org>
X-Cookie: Blackout restrictions apply.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_145924_359472_BE4D0925 
X-CRM114-Status: GOOD (  11.79  )
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


--oHjAMmplQrPbLqyA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 02:32:56PM -0800, Stephen Boyd wrote:
> Quoting Mark Brown (2024-12-03 14:22:04)

> > Yes, this patch was triggered by me reporting that multiple boards in my
> > test farm have completely broken audio with defconfig.=20

> I thought that commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert
> reset implementation") was sufficient to fix the problem. Is that
> incorrect?

Yes, it should be - it didn't appear in mainline or -next yet and was a
bit more buried in my mailbox than this thread but I see it's in now.

--oHjAMmplQrPbLqyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPjUEACgkQJNaLcl1U
h9Ck5wf+IvbqQTemhM/dZRBZBQkVRYqK48KrdX0LIz2UA9Ezxw90SsDD8aKlYrfS
eaHXd1CUNlZu+BLoA4GwTxjF/Qysu0xs1vd3DscOZ6NkFgMIU3g/THIXv4gGCxLp
6PCBcOlNxmtOPIHaW8HgUEJpn9EsvJyEC+KQ47vVbZWnnkIkYoWrVj19uJacKfcI
EQu0TxpKuj3Z21YqEFBRIvTCy/ZXfFLXy39EthD/0q/LUmQ7oLySJl5MLXeh0Wls
Gvme2HfCtenwVhZ1glILuB/Fcqcg1wZlbnhrv4B/9E+dqUh/9lkgwoeILLzInWpc
l0p1PqdwpqlE+vH9uPWGGmMzQRdwfg==
=Tcei
-----END PGP SIGNATURE-----

--oHjAMmplQrPbLqyA--

